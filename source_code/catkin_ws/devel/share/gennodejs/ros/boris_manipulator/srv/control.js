// Auto-generated. Do not edit!

// (in-package boris_manipulator.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class controlRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
    }
    else {
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type controlRequest
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type controlRequest
    let len;
    let data = new controlRequest(null);
    return data;
  }

  static getMessageSize(object) {
    return 0;
  }

  static datatype() {
    // Returns string type for a service object
    return 'boris_manipulator/controlRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd41d8cd98f00b204e9800998ecf8427e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new controlRequest(null);
    return resolved;
    }
};

class controlResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.connection_control = null;
      this.distance_x = null;
      this.distance_y = null;
      this.distance_z = null;
    }
    else {
      if (initObj.hasOwnProperty('connection_control')) {
        this.connection_control = initObj.connection_control
      }
      else {
        this.connection_control = false;
      }
      if (initObj.hasOwnProperty('distance_x')) {
        this.distance_x = initObj.distance_x
      }
      else {
        this.distance_x = 0.0;
      }
      if (initObj.hasOwnProperty('distance_y')) {
        this.distance_y = initObj.distance_y
      }
      else {
        this.distance_y = 0.0;
      }
      if (initObj.hasOwnProperty('distance_z')) {
        this.distance_z = initObj.distance_z
      }
      else {
        this.distance_z = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type controlResponse
    // Serialize message field [connection_control]
    bufferOffset = _serializer.bool(obj.connection_control, buffer, bufferOffset);
    // Serialize message field [distance_x]
    bufferOffset = _serializer.float64(obj.distance_x, buffer, bufferOffset);
    // Serialize message field [distance_y]
    bufferOffset = _serializer.float64(obj.distance_y, buffer, bufferOffset);
    // Serialize message field [distance_z]
    bufferOffset = _serializer.float64(obj.distance_z, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type controlResponse
    let len;
    let data = new controlResponse(null);
    // Deserialize message field [connection_control]
    data.connection_control = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [distance_x]
    data.distance_x = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [distance_y]
    data.distance_y = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [distance_z]
    data.distance_z = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 25;
  }

  static datatype() {
    // Returns string type for a service object
    return 'boris_manipulator/controlResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'a2ac08319b695007e4197c737a10017b';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool connection_control
    float64 distance_x
    float64 distance_y
    float64 distance_z
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new controlResponse(null);
    if (msg.connection_control !== undefined) {
      resolved.connection_control = msg.connection_control;
    }
    else {
      resolved.connection_control = false
    }

    if (msg.distance_x !== undefined) {
      resolved.distance_x = msg.distance_x;
    }
    else {
      resolved.distance_x = 0.0
    }

    if (msg.distance_y !== undefined) {
      resolved.distance_y = msg.distance_y;
    }
    else {
      resolved.distance_y = 0.0
    }

    if (msg.distance_z !== undefined) {
      resolved.distance_z = msg.distance_z;
    }
    else {
      resolved.distance_z = 0.0
    }

    return resolved;
    }
};

module.exports = {
  Request: controlRequest,
  Response: controlResponse,
  md5sum() { return 'a2ac08319b695007e4197c737a10017b'; },
  datatype() { return 'boris_manipulator/control'; }
};
