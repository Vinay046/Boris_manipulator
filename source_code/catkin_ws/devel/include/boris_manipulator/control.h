// Generated by gencpp from file boris_manipulator/control.msg
// DO NOT EDIT!


#ifndef BORIS_MANIPULATOR_MESSAGE_CONTROL_H
#define BORIS_MANIPULATOR_MESSAGE_CONTROL_H

#include <ros/service_traits.h>


#include <boris_manipulator/controlRequest.h>
#include <boris_manipulator/controlResponse.h>


namespace boris_manipulator
{

struct control
{

typedef controlRequest Request;
typedef controlResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct control
} // namespace boris_manipulator


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::boris_manipulator::control > {
  static const char* value()
  {
    return "a2ac08319b695007e4197c737a10017b";
  }

  static const char* value(const ::boris_manipulator::control&) { return value(); }
};

template<>
struct DataType< ::boris_manipulator::control > {
  static const char* value()
  {
    return "boris_manipulator/control";
  }

  static const char* value(const ::boris_manipulator::control&) { return value(); }
};


// service_traits::MD5Sum< ::boris_manipulator::controlRequest> should match
// service_traits::MD5Sum< ::boris_manipulator::control >
template<>
struct MD5Sum< ::boris_manipulator::controlRequest>
{
  static const char* value()
  {
    return MD5Sum< ::boris_manipulator::control >::value();
  }
  static const char* value(const ::boris_manipulator::controlRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::boris_manipulator::controlRequest> should match
// service_traits::DataType< ::boris_manipulator::control >
template<>
struct DataType< ::boris_manipulator::controlRequest>
{
  static const char* value()
  {
    return DataType< ::boris_manipulator::control >::value();
  }
  static const char* value(const ::boris_manipulator::controlRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::boris_manipulator::controlResponse> should match
// service_traits::MD5Sum< ::boris_manipulator::control >
template<>
struct MD5Sum< ::boris_manipulator::controlResponse>
{
  static const char* value()
  {
    return MD5Sum< ::boris_manipulator::control >::value();
  }
  static const char* value(const ::boris_manipulator::controlResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::boris_manipulator::controlResponse> should match
// service_traits::DataType< ::boris_manipulator::control >
template<>
struct DataType< ::boris_manipulator::controlResponse>
{
  static const char* value()
  {
    return DataType< ::boris_manipulator::control >::value();
  }
  static const char* value(const ::boris_manipulator::controlResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // BORIS_MANIPULATOR_MESSAGE_CONTROL_H
