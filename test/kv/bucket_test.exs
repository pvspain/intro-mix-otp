defmodule KV.BucketTest do
  use ExUnit.Case, async: true

  test "stores values by key" do
    {:ok, bucket} = start_supervised(KV.Bucket)
    assert KV.Bucket.get(bucket, "milk") == nil

    KV.Bucket.put(bucket, "milk", 3)
    assert KV.Bucket.get(bucket, "milk") == 3
  end

  test "stores values by key on a named process", config do
    {:ok, _} = start_supervised({KV.Bucket, name: config.test})
    assert KV.Bucket.get(config.test, "milk") == nil

    KV.Bucket.put(config.test, "milk", 3)
    assert KV.Bucket.get(config.test, "milk") == 3
  end

  test "deletes value by key" do
    {:ok, bucket} = start_supervised(KV.Bucket)
    KV.Bucket.put(bucket, "milk", 4)
    assert KV.Bucket.delete(bucket, "milk") == 4
    assert KV.Bucket.get(bucket, "milk") == nil
  end
end
