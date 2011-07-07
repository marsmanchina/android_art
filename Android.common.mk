#
# Copyright (C) 2011 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

LOCAL_CPP_EXTENSION := .cc

LOCAL_CFLAGS := \
	-O0 \
	-ggdb3 \
	-Wall \
	-Werror \
	-Wextra \
	-Wno-unused-parameter \
	-Wstrict-aliasing=2 \
	-fno-align-jumps \
	-fstrict-aliasing

ifeq ($(TARGET_ARCH),arm)
LOCAL_CFLAGS +=
endif

ifeq ($(TARGET_ARCH),x86)
LOCAL_CFLAGS +=
endif

AEXEC_LOCAL_SRC_FILES := \
	src/main.cc

LIBART_LOCAL_SRC_FILES := \
	src/assembler.cc \
	src/base64.cc \
	src/class_linker.cc \
	src/dex_file.cc \
	src/dex_instruction.cc \
	src/dex_verifier.cc \
	src/memory_region.cc \
	src/object.cc \
	src/raw_dex_file.cc \
	src/runtime.cc \
	src/stringpiece.cc

ifeq ($(LIBART_TARGET_ARCH),arm)
LIBART_LOCAL_SRC_FILES += \
	src/assembler_arm.cc
endif

ifeq ($(LIBART_TARGET_ARCH),x86)
LIBART_LOCAL_SRC_FILES += \
	src/assembler_x86.cc
endif

TEST_LOCAL_SRC_FILES := \
	src/class_linker_test.cc \
	src/dex_file_test.cc \
	src/dex_instruction_visitor_test.cc \
	src/object_test.cc \
	src/raw_dex_file_test.cc

ifeq ($(TEST_TARGET_ARCH),arm)
TEST_LOCAL_SRC_FILES +=
endif

ifeq ($(TEST_TARGET_ARCH),x86)
TEST_LOCAL_SRC_FILES += \
	src/assembler_x86_test.cc
endif
