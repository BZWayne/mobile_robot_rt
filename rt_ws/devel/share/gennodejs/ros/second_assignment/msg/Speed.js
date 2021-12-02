// Auto-generated. Do not edit!

// (in-package second_assignment.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class Speed {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.acSpeed = null;
    }
    else {
      if (initObj.hasOwnProperty('acSpeed')) {
        this.acSpeed = initObj.acSpeed
      }
      else {
        this.acSpeed = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Speed
    // Serialize message field [acSpeed]
    bufferOffset = _serializer.float32(obj.acSpeed, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Speed
    let len;
    let data = new Speed(null);
    // Deserialize message field [acSpeed]
    data.acSpeed = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'second_assignment/Speed';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'c34cf750d0cd671be992c30fdfbe639e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 acSpeed
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Speed(null);
    if (msg.acSpeed !== undefined) {
      resolved.acSpeed = msg.acSpeed;
    }
    else {
      resolved.acSpeed = 0.0
    }

    return resolved;
    }
};

module.exports = Speed;
