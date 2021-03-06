﻿namespace Sugar.Test;

interface

uses
  Sugar,
  RemObjects.Elements.EUnit,
  Sugar.Data.JSON;

type
  JsonValueTest = public class (Test)
  private
    method ValueOf(Value: Object): JsonValue;
    method Detect(Value: Object; Expected: JsonValueKind): JsonValue;
  public
    method AutodetectType;
    method ToInteger;
    method ToDouble;
    method ToStr;
    method ToObject;
    method ToArray;
    method ToBoolean;
    method IsNull;
  end;

implementation

method JsonValueTest.AutodetectType;
begin
  Detect(Byte(1), JsonValueKind.Integer);
  Detect(Double(1), JsonValueKind.Double);
  Detect(UInt16(1), JsonValueKind.Integer);
  Detect(Int32(1), JsonValueKind.Integer);
  Detect(Single(1), JsonValueKind.Double);
  Detect('c', JsonValueKind.Integer);
  Detect("c", JsonValueKind.String);
  Detect(true, JsonValueKind.Boolean);
  Detect(false, JsonValueKind.Boolean);
  Detect(nil, JsonValueKind.Null);
  Detect(new JsonObject, JsonValueKind.Object);
  Detect(new JsonArray, JsonValueKind.Array);
end;

method JsonValueTest.ValueOf(Value: Object): JsonValue;
begin
  exit new JsonValue(Value);
end;

method JsonValueTest.Detect(Value: Object; Expected: JsonValueKind): JsonValue;
begin
  var JValue := ValueOf(Value);
  Assert.IsNotNil(JValue);
  Assert.AreEqual(JValue.Kind, Expected);
  exit JValue;
end;

method JsonValueTest.ToInteger;
begin
  Assert.AreEqual(ValueOf(1).ToInteger, 1);
  Assert.AreEqual(ValueOf(Double(1.2)).ToInteger, 1);
  Assert.AreEqual(ValueOf("1").ToInteger, 1);
  Assert.AreEqual(ValueOf(true).ToInteger, 1);
  Assert.AreEqual(ValueOf(false).ToInteger, 0);

  Assert.Throws(->ValueOf(Sugar.Consts.MaxDouble).ToInteger);
  Assert.Throws(->ValueOf("abc").ToInteger);
  Assert.Throws(->ValueOf(nil).ToInteger);
  Assert.Throws(->ValueOf("9999999999999999999999").ToInteger);
  Assert.Throws(->ValueOf(new JsonObject).ToInteger);
  Assert.Throws(->ValueOf(new JsonArray).ToInteger);
end;

method JsonValueTest.ToDouble;
begin
  Assert.AreEqual(ValueOf(1).ToDouble, 1);
  Assert.AreEqual(ValueOf(Double(1.2)).ToDouble, 1.2);
  Assert.AreEqual(ValueOf("1").ToDouble, 1);
  Assert.AreEqual(ValueOf(true).ToDouble, 1);
  Assert.AreEqual(ValueOf(false).ToDouble, 0);

  Assert.Throws(->ValueOf("abc").ToDouble);
  Assert.Throws(->ValueOf(nil).ToDouble);
  Assert.Throws(->ValueOf("9.9.9").ToDouble);
  Assert.Throws(->ValueOf(new JsonObject).ToDouble);
  Assert.Throws(->ValueOf(new JsonArray).ToDouble);
end;

method JsonValueTest.ToStr;
begin
  Assert.AreEqual(ValueOf(1).ToStr, "1");
  Assert.AreEqual(ValueOf(Double(1.2)).ToStr, "1.2");
  Assert.AreEqual(ValueOf("1").ToStr, "1");
  Assert.AreEqual(ValueOf(true).ToStr, Consts.TrueString);
  Assert.AreEqual(ValueOf(false).ToStr, Consts.FalseString);
  Assert.AreEqual(ValueOf(nil).ToStr, nil);
  Assert.AreEqual(ValueOf(new JsonObject).ToStr, "[object]: 0 items");
  Assert.AreEqual(ValueOf(new JsonArray).ToStr, "[array]: 0 items");
end;

method JsonValueTest.ToObject;
begin
  var Obj := new JsonObject;
  Assert.AreEqual(ValueOf(Obj).ToObject, Obj);
  Assert.AreEqual(ValueOf(nil).ToObject, nil);

  Assert.Throws(->ValueOf("abc").ToObject);
  Assert.Throws(->ValueOf(1).ToObject);
  Assert.Throws(->ValueOf(1.1).ToObject);
  Assert.Throws(->ValueOf(true).ToObject);
  Assert.Throws(->ValueOf(new JsonArray).ToObject);
end;

method JsonValueTest.ToArray;
begin
  var Obj := new JsonArray;
  Assert.AreEqual(ValueOf(Obj).ToArray, Obj);
  Assert.AreEqual(ValueOf(nil).ToArray, nil);

  Assert.Throws(->ValueOf("abc").ToArray);
  Assert.Throws(->ValueOf(1).ToArray);
  Assert.Throws(->ValueOf(1.1).ToArray);
  Assert.Throws(->ValueOf(true).ToArray);
  Assert.Throws(->ValueOf(new JsonObject).ToArray);
end;

method JsonValueTest.ToBoolean;
begin
  Assert.AreEqual(ValueOf(true).ToBoolean, true);
  Assert.AreEqual(ValueOf(false).ToBoolean, false);
  Assert.AreEqual(ValueOf(Consts.TrueString).ToBoolean, true);
  Assert.AreEqual(ValueOf(Consts.FalseString).ToBoolean, false);
  Assert.AreEqual(ValueOf(0).ToBoolean, false);
  Assert.AreEqual(ValueOf(1).ToBoolean, true);

  Assert.Throws(->ValueOf("yes").ToBoolean);
  Assert.Throws(->ValueOf(nil).ToBoolean);
  Assert.Throws(->ValueOf(new JsonObject).ToBoolean);
  Assert.Throws(->ValueOf(new JsonArray).ToObject);
end;

method JsonValueTest.IsNull;
begin
  Assert.AreEqual(ValueOf(nil).IsNull, true);
  Assert.AreEqual(ValueOf(true).IsNull, false);
  Assert.AreEqual(ValueOf(false).IsNull, false);
  Assert.AreEqual(ValueOf("").IsNull, false);
  Assert.AreEqual(ValueOf(0).IsNull, false);
  Assert.AreEqual(ValueOf(1.1).IsNull, false);
  Assert.AreEqual(ValueOf(new JsonArray).IsNull, false);
  Assert.AreEqual(ValueOf(new JsonObject).IsNull, false);
end;

end.
