LOCAL_PATH := $(call my-dir)

# Only for native builds. For cross build, use python3 repository.
ifeq ("$(TARGET_OS_FLAVOUR)","native")

include $(CLEAR_VARS)

LOCAL_MODULE := nextpnr
LOCAL_CATEGORY_PATH := tools
LOCAL_DESCRIPTION :=  nextpnr portable FPGA place and route tool.

# Can use target python as we are building native
LOCAL_CMAKE_CONFIGURE_ARGS := \
	-DARCH="himbaechel" \
	-DHIMBAECHEL_UARCH="gowin" \
	-DCMAKE_CROSSCOMPILING=false \
	-DPython3_EXECUTABLE=$(TARGET_OUT_STAGING)/$(TARGET_ROOT_DESTDIR)/bin/python

LOCAL_LIBRARIES := apicula

include $(BUILD_CMAKE)

endif