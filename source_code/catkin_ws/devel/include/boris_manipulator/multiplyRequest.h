// Generated by gencpp from file boris_manipulator/multiplyRequest.msg
// DO NOT EDIT!


#ifndef BORIS_MANIPULATOR_MESSAGE_MULTIPLYREQUEST_H
#define BORIS_MANIPULATOR_MESSAGE_MULTIPLYREQUEST_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace boris_manipulator
{
template <class ContainerAllocator>
struct multiplyRequest_
{
  typedef multiplyRequest_<ContainerAllocator> Type;

  multiplyRequest_()
    : a(0)
    , b(0)  {
    }
  multiplyRequest_(const ContainerAllocator& _alloc)
    : a(0)
    , b(0)  {
  (void)_alloc;
    }



   typedef int32_t _a_type;
  _a_type a;

   typedef int32_t _b_type;
  _b_type b;





  typedef boost::shared_ptr< ::boris_manipulator::multiplyRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::boris_manipulator::multiplyRequest_<ContainerAllocator> const> ConstPtr;

}; // struct multiplyRequest_

typedef ::boris_manipulator::multiplyRequest_<std::allocator<void> > multiplyRequest;

typedef boost::shared_ptr< ::boris_manipulator::multiplyRequest > multiplyRequestPtr;
typedef boost::shared_ptr< ::boris_manipulator::multiplyRequest const> multiplyRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::boris_manipulator::multiplyRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::boris_manipulator::multiplyRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::boris_manipulator::multiplyRequest_<ContainerAllocator1> & lhs, const ::boris_manipulator::multiplyRequest_<ContainerAllocator2> & rhs)
{
  return lhs.a == rhs.a &&
    lhs.b == rhs.b;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::boris_manipulator::multiplyRequest_<ContainerAllocator1> & lhs, const ::boris_manipulator::multiplyRequest_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace boris_manipulator

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::boris_manipulator::multiplyRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::boris_manipulator::multiplyRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::boris_manipulator::multiplyRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::boris_manipulator::multiplyRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::boris_manipulator::multiplyRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::boris_manipulator::multiplyRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::boris_manipulator::multiplyRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "ef8322123148e475e3e93a1f609b2f70";
  }

  static const char* value(const ::boris_manipulator::multiplyRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xef8322123148e475ULL;
  static const uint64_t static_value2 = 0xe3e93a1f609b2f70ULL;
};

template<class ContainerAllocator>
struct DataType< ::boris_manipulator::multiplyRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "boris_manipulator/multiplyRequest";
  }

  static const char* value(const ::boris_manipulator::multiplyRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::boris_manipulator::multiplyRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "int32 a\n"
"int32 b\n"
;
  }

  static const char* value(const ::boris_manipulator::multiplyRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::boris_manipulator::multiplyRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.a);
      stream.next(m.b);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct multiplyRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::boris_manipulator::multiplyRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::boris_manipulator::multiplyRequest_<ContainerAllocator>& v)
  {
    s << indent << "a: ";
    Printer<int32_t>::stream(s, indent + "  ", v.a);
    s << indent << "b: ";
    Printer<int32_t>::stream(s, indent + "  ", v.b);
  }
};

} // namespace message_operations
} // namespace ros

#endif // BORIS_MANIPULATOR_MESSAGE_MULTIPLYREQUEST_H
