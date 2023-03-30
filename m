Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B0406D02DE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Mar 2023 13:17:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231686AbjC3LRi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 30 Mar 2023 07:17:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231593AbjC3LRb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 30 Mar 2023 07:17:31 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D30C1A24C;
        Thu, 30 Mar 2023 04:16:40 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.98,303,1673881200"; 
   d="scan'208";a="154322476"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 30 Mar 2023 20:16:40 +0900
Received: from localhost.localdomain (unknown [10.226.93.62])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 53C984001B66;
        Thu, 30 Mar 2023 20:16:35 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     "Rob Herring" <robh+dt@kernel.org>,
        "Philipp Zabel" <p.zabel@pengutronix.de>,
        Lee Jones <lee@kernel.org>,
        "Daniel Lezcano" <daniel.lezcano@linaro.org>,
        "William Breathitt Gray" <william.gray@linaro.org>,
        "Thierry Reding" <thierry.reding@gmail.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <chris.paterson2@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v15 0/6] Add RZ/G2L MTU3a Core, Counter and pwm driver
Date:   Thu, 30 Mar 2023 12:16:26 +0100
Message-Id: <20230330111632.169434-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.5 required=5.0 tests=AC_FROM_MANY_DOTS,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The RZ/G2L multi-function timer pulse unit 3 (MTU3a) is embedded in
the Renesas RZ/G2L family SoC's. It consists of eight 16-bit timer
channels and one 32-bit timer channel. It supports the following
functions
 - Counter
 - Timer
 - PWM

This patch series aims to add core, counter and pwm driver for
MTU3a. The core instantiates child devices using mfd api.

The 8/16/32 bit registers are mixed in each channel. The HW
specifications of the IP is described in patch#1.

Current patch set is tested for PWM mode1 on MTU3 channel
and 16 and 32 bit phase counting modes on MTU1 and MTU2 channels.

clock event/source driver will be added later.

Ref:
 [1] https://patchwork.kernel.org/project/linux-renesas-soc/patch/20221010145222.1047748-2-biju.das.jz@bp.renesas.com/
 [2] https://patchwork.kernel.org/project/linux-renesas-soc/patch/20230113161753.1073706-3-biju.das.jz@bp.renesas.com/

v14->v15:
 * Updated copyright header and Limitations section
 * Moved register definitions to <linux/mfd/rz-mtu3.h>
 * Introduced new mapping table struct rz_mtu3_channel_io_map to hold the
   index of the lowest PWM and the number of PWMs handled by the HW channel.
 * Introduced struct rz_mtu3_pwm_channel to hold mtu3 channel data and
   mapping table.
 * Replaced rz_mtu3_get_hw_channel->rz_mtu3_get_channel and channel->hwpwm.
   The rz_mtu3_get_channel() returns struct rz_mtu3_pwm_channel*
 * Dropped rz_mtu3_pwm_is_second_channel() as same can be obtained directly
   with new mapping (ie, priv->map->channel == pwm->hwpwm)
 * Replaced ch_index->ch throughout and used "priv - rz_mtu3_pwm->channel_data"
   to find ch and dropped rz_mtu3_get_hw_channel_index().
 * Optimized rz_mtu3_pwm_is_ch_enabled() by exit early, if is_channel_en is false.
 * Updated rz_mtu3_pwm_request() and added comments.
 * Introduced a bug in the driver by introducing enable_count, which increment/
   decrement during enable()/disable().
 * Reduced variable scope in rz_mtu3_pwm_get_state() by moving most of variables
   inside the if statement.
 * Updated probe() to assign the struct rz_mtu3_pwm_channel values.
v13->v14:
 * Added helper macros for initializing 8/16/32 channel reg offset table in
   "drivers/mfd/rz-mtu3.h"
 * Replaced "off"->offset in read_write()
 * Replaced __LINUX_RZ_MTU3_H__->__MFD_RZ_MTU3_H__
 * Added header file device.h and mutex.h
 * Updated rz_mtu3_request_channel()
 * Replaced channel_index->channel_number in struct rz_mtu3_channel
 * Dropped redundant comments.
 * Renamed channel number macros from RZ_MTU*->RZ_MTU3_CHAN_*
 * Added core driver specific private data in struct rz_mtu3 and updated the
   comments. This replaces mmio from struct rz_mtu3.
 * Started using actual offset in channel reg table and removed ch_reg_offsets table
   Also simplified the code 8/16/32 bits read_write() and removed base from
   struct rz_mtu3_channel.
 * Simplified rz_mtu3_start_stop_ch()/rz_mtu3_is_enabled() by adding helper functions
   rz_mtu3_get_tstr_offset()/rz_mtu3_get_tstr_bit_pos().
 * Added Acked-by tag from William Breathitt Gray
 * Replaced RZ_MTU1->RZ_MTU3_CHAN_1 and retained the Rb/ack tag as 
   it is trivial change.
 * Updated commit description
 * Updated Limitations section.
 * Replaced the macros RZ_MTU*->RZ_MTU3_CHAN_* in probe()
 * Fixed a kernel crash in error path by moving rz_mtu3_pwm->chip.dev before
   devm_add_action_or_reset()
 * Added pm_runtime_idle() and simplified error paths for devm_add_action_or_reset()
   and devm_pwmchip_add().

v12->v13:
 * Updated kernel version in bindings from 6.3->6.4 as it is too late.
 * Moved RZ_MTU3_TMDR1_* macros from pwm driver to rz-mtu3.h.
 * Updated commit description for the pwm driver
 * Moved RZ_MTU3_TMDR1_MD_* macros to rz_mtu3.h
 * Updated Limitations section on PWM driver.
 * Removed PWM mode1 references from the driver.
 * Dropped prescale and duty_cycle from struct rz_mtu3_pwm_chip.
 * Replaced rz_mtu3_pwm_mode1_num_ios->rz_mtu3_hw_channel_ios.
 * Avoided race condition in rz_mtu3_pwm_request()/rz_mtu3_pwm_free().
 * Updated get_state() by adding dc > pv check and added a comment about
   overflow condition.
 * Moved overflow condition check from config->probe()
 * Replaced pm_runtime_resume_and_get with unconditional pm_runtime_get_sync()
   in config()
 * Added error check for clk_prepare_enable() in probe() and propagating error
   to the caller for pm_runtime_resume()
 * clk_get_rate() is called after enabling the clock and clk_rate_exclusive_put()
v11->v12:
 * As per [1] & [2] Kept bindings in timer subsytems
 * Moved core driver from timer to MFD as child devices are instantiated using
   MFD API's.
 * Moved header fine from clocksource/rz-mtu3.h->linux/mfd/rz-mtu3.h
 * Removed Select MFD_CORE option from config.
v10->v11:
 * Added Rb tag from William Breathitt Gray for the driver patch
 * Replaced count2 channel name from "combined"->"cascaded", as channels
   are cascaded
 * Simplified the locking by adding the helper functions
   rz_mtu3_lock_if_counter_is_valid, rz_mtu3_lock_if_count_is_enabled,
   and rz_mtu3_lock_if_ch0_is_enabled.
 * Added the MAINTAINERS entries for the driver.
v9->v10:
 * Added logs from PWM and counter
 * Added Rb tag from William Breathitt Gray for sysfs counter doc
 * Added helper function for rz_mtu3_count_{action,function}_read
 * Added priv->lock in rz_mtu3_count_function_read and rz_mtu3_count_
   direction_read.
 * Added ch->is_busy check for rz_mtu3_action_read()
 * Added rz_mtu3_is_ch0_enabled() for device specific sysfs variables.
 * Added ch->is_busy check for device specific sysfs variables.
v8->v9:
 * Added prescale/duty_cycle variables to struct rz_mtu3_pwm_chip and
   cached this values in rz_mtu3_pwm_config and used this cached values
   in get_state(), if PWM is disabled.
 * Added return code for get_state().
 * Added available blocks for external_input_phase_clock_select_available
 * Removed the "This attribute" from the external_input_phase_clock_select
   description, and capitalize the word "counter" from description.
 * Removed the "This attribute" from the cascade_counts_enable description,
   and capitalize "counts" and "counter"
 * Moved these device-level configuration blocks to top of the file.
 * Added count_is_enabled variable to struct rz_mtu3_cnt
 * Added check for ch->is_busy and count_is_enabled before every Counter
   callback to ensure we do not try to access a busy channel used by other
   subsystem(eg: pwm).
 * Removed id parameter from rz_mtu3_32bit_cnt_setting()
 * Made definition of rz_mtu3_get_ch() in single line.
 * Replaced break->return in rz_mtu3_32bit_cnt_setting(),
   rz_mtu3_count_function_read() and rz_mtu3_initialize_counter()
   and removed redundant return 0.
 * Simplified synapse signal check for rz_mtu3_action_read().
v7->v8:
 * Add locking for RMW on rz_mtu3_shared_reg_update_bit()
 * Replaced enum rz_mtu3_functions with channel busy flag
 * Added API for request and release a channel.
 * Replaced cascade_enable->cascade_counts_enable
 * Updated commit header and description
 * Added external_input_phase_clock_select_available entry for driver-
   specific enum attribute and created a new entry block for it.
 * Add a line stating cascade_counts_enable is a boolean attribute.
 * Added missing 'component_id' suffix.
 * Simplified rz_mtu3_initialize_counter by calling rz_mtu3_request_
   channel() and release the acquired sibling channel in case of error.
 * Simplified rz_mtu3_terminate_counter by calling rz_mtu3_release_
   channel().
 * Removed unused ceiling and ch_id from rz_mtu3_count_write()
 * Replaced the error -EINVAL->-EBUSY for rz_mtu3_is_counter_invalid()
 * Avoided race between rz_mtu3_count_{read, write} with rz_mtu3_
   cascade_counts_enable_set() by adding locks and moved the lock
   before rz_mtu3_is_counter_invalid()
 * Protected the rz_mtu3_count_ceiling_read() function with a lock
   to make sure the cascade operation mode doesn't not change and
   that the priv data structure accesses don't race when they are
   changed in the ceiling_write() callback.
 * Added lock in rz_mtu3_cascade_enable_set() to make sure the other
   callbacks don't try to read the LWA state while updating LWA.
 * Added lock in rz_mtu3_ext_input_phase_clock_select_set() to ensure
   the other callbacks don't try to read the PHCKSEL state while updating
   PHCKSEL.
 * Added lock to avoid race between rz_mtu3_count_function_write() and
   rz_mtu3_action_read()
 * Updated rz_mtu3_action_read to return 0, if Synapse is in COUNTER_SYNAPSE
   _ACTION_NONE state.
 * Replaced sysfs variable cascade_enable->cascade_counts_enable
 * Renamed rz_mtu3_cascade_enable_get->rz_mtu3_cascade_counts_enable_get
 * Renamed rz_mtu3_cascade_enable_set->rz_mtu3_cascade_counts_enable_set
 * Removed redundent ceiling assignment from rz_mtu3_count_ceiling_read()
 * Removed unused ceiling and ch_id from rz_mtu3_count_write().
 * Simplified rz_mtu3_pwm_request by calling rz_mtu3_request_channel()
 * Simplified rz_mtu3_pwm_free by calling rz_mtu3_release_channel()
v6->v7:
 * Added channel specific mutex to avoid races between child devices
   (for eg: pwm and counter).
 * Added rz_mtu3_shared_reg_update_bit() to update bits.
 * Replaced sysfs variable "long_word_access_ctrl_mode->cascade_enable"
 * Updated Kernel version in sysfs Documentation
 * Updated commit description for counter driver
 * Added Register descriptions
 * Opimized size of cache variable by using union
 * Used test_bit() in rz_mtu3_is_counter_invalid()
 * Replaced val->timer_mode in rz_mtu3_count_function_{read,write}
 * Added TODO comment phase3 and phase5 modes.
 * replaced if-else with ternary expression in rz_mtu3_count_direction_read()
 * Used switch statement in rz_mtu3_count_ceiling_read to consistent with write
 * Provided default case for all switch statements.
 * Add mutex lock for avoiding races with other devices and counter
 * Updated comments in rz_mtu3_action_read()
 * Replaced COUNTER_COMP_DEVICE_BOOL->COUNTER_COMP_DEVICE_BOOL for 
   cascade_enable
 * Replaced RZ_MTU3_GET_HW_CH->rz_mtu3_get_hw_ch
 * Added rz_mtu3_get_ch() to get channels
 * used rz_mtu3_shared_reg_update_bit for cascade_enable and
   selecting phase input clock.
 * Added rz_mtu3_is_counter_invalid() check in rz_mtu3_count_ceiling_read()
 * Added channel specific mutex lock to avoid race between counter
   device and rz_mtu3_pwm_{request,free}
 * Added pm_runtime_resume_and_get in rz_mtu3_pwm_enable()
 * Added pm_runtime_put_sync in rz_mtu3_pwm_disable()
 * Updated rz_mtu3_pwm_config()
 * Updated rz_mtu3_pwm_apply()
v5->v6:
 * Added Rb tag from Rob and Krzysztof for the binding patch.
 * Updated commit and KConfig description for the driver patches
 * Selected MFD_CORE to avoid build error if CONFIG_MFD_CORE not set.
 * Improved error handling in core driver's probe().
 * Fixed RZ_MTU3_GET_HW_CH Macro for argument reuse 'id' - 
   possible side-effects?
 * Replaced SET_RUNTIME_PM_OPS->DEFINE_RUNTIME_DEV_PM_OPS and removed
   __maybe_unused from suspend/resume()
 * Replaced dev_get_drvdata from rz_mtu3_pwm_pm_disable()
 * Sorted header files for all driver files.
v4->v5:
 * Modelled as timer bindings.
 * Fixed the typo in bindings.
 * Moved core driver from MFD to timer
 * Child devices instatiated using mfd_add_devices()
 * Documented sysfs entries external_input_phase_clock_select and
   long_word_access_ctrl_mode.
 * Updated the Kconfig with SoC vendor name
 * Introduced rz_mtu3_is_counter_invalid()
 * replaced pointer to an array of struct rz_mtu3_channel with
   a simple pointer to struct rz_mtu3_channel.
 * Added long_word_access_ctrl_mode sysfs entry for 16-bit and
   32-bit access
 * Added external_input_phase_clock_select sysfs entry for
   selecting input clocks.
 * used preprocessor defines represent SIGNAL_{A,B,C,D}_ID instead of
   signal ids.
v3->v4:
 * Dropped counter and pwm compatibeles as they don't have any resources.
 * Made rz-mtu3 as pwm provider.
 * Updated the example and description.
 * A single driver that registers both the counter and the pwm functionalities
   that binds against "renesas,rz-mtu3".
 * Moved PM handling from child devices to here.
 * replaced include/linux/mfd/rz-mtu3.h->drivers/mfd/rz-mtu3.h
 * Removed "remove" callback from mfd driver
 * There is no resource associated with "rz-mtu3-counter" and "rz-mtu3-pwm"
   compatible and moved the code to mfd subsystem as it binds against "rz-mtu".
 * Removed struct platform_driver rz_mtu3_cnt_driver.
 * Removed struct platform_driver rz_mtu3_pwm_driver.
 * Updated commit description
 * Updated Kconfig description
 * Added macros RZ_MTU3_16_BIT_MTU{1,2}_CH for MTU1 and MTU2 channels
 * Added RZ_MTU3_GET_HW_CH macro for getting channel ID.
 * replaced priv->ch[id]->priv->ch[0] in rz_mtu3_count_read()
 * Cached counter max values
 * replaced cnt->tsr in rz_mtu3_count_direction_read()
 * Added comments for RZ_MTU3_TCR_CCLR_NONE
 * Replaced if with switch in rz_mtu3_initialize_counter() and
   rz_mtu3_count_ceiling_write()
 * Added locks in initialize, terminate and enable_read to prevent races.
 * Updated rz_mtu3_action_read to take care of MTU2 signals.
 * Added separate distinct array for each group of Synapse.
 * Moved pm handling to parent.
v2->v3:
 * Dropped counter bindings and integrated with mfd as it has only one property.
 * Removed "#address-cells" and "#size-cells" as it do not have children with
   unit addresses.
 * Removed quotes from counter and pwm.
 * Provided full path for pwm bindings.
 * Updated the binding example.
 * removed unwanted header files
 * Added LUT for 32 bit registers as it needed for 32-bit cascade counting.
 * Exported 32 bit read/write functions.
 * Modelled as a counter device supporting 3 counters(2 16-bit and 
   32-bit)
 * Add kernel-doc comments to document struct rz_mtu3_cnt
 * Removed mmio variable from struct rz_mtu3_cnt
 * Removed cnt local variable from rz_mtu3_count_read()
 * Replaced -EINVAL->-ERANGE for out of range error conditions.
 * Removed explicit cast from write functions.
 * Removed local variable val from rz_mtu3_count_ceiling_read()
 * Added lock for RMW for counter/ceiling updates.
 * Added different synapses for counter0 and counter{1,2}
 * Used ARRAY for assigning num_counts.
 * Added PM runtime for managing clocks.
 * Add MODULE_IMPORT_NS(COUNTER) to import the COUNTER namespace.

RFC->v2:
 * replaced devm_reset_control_get->devm_reset_control_get_exclusive
 * Dropped 'bindings' from the binding title
 * Updated the binding example
 * Added additionalProperties: false for counter bindings
 * Squashed all the binding patches
 * Modelled as a single counter device providing both 16-bit
   and 32-bit phase counting modes
 * Modelled as a single pwm device for supporting different pwm modes.
 * Moved counter and pwm bindings to respective subsystems.

Logs:
root@smarc-rzg2l:~# /mtu_test.sh
#### Zero duty cycle ###
#### decrement Period ###
#### Increment Period ###
#### decrement duty cycle ###
#### Increment duty cycle ###
### Unbind the PWM driver####
### Bind the PWM driver####
Positive counting
cascade_counts_enable is 0
#### Ch0 count
0
2
8
13
18
23
28
34
38
44
49
3
8
13
19
24
29
34
39
45
#### Ch1 count
#### Select Phase clock
Phase clock MTCLKA-MTCLKB
1
6
11
16
1
5
11
16
0
5
10
16
20
5
10
15
20
4
10
14
#### Select Phase clock
Phase clock MTCLKA-MTCLKB
cascade_counts_enable is 1
#### Ch2 count
0
5
10
16
21
26
31
36
42
46
52
57
62
67
72
78
83
88
93
98
### Unbind the counter driver####
### Bind the counter driver####
### Unbind the PWM driver####
### Bind the PWM driver####
### Unbind the Core driver####
### Bind the Core driver####
root@smarc-rzg2l:~#

Biju Das (6):
  dt-bindings: timer: Document RZ/G2L MTU3a bindings
  mfd: Add Renesas RZ/G2L MTU3a core driver
  Documentation: ABI: sysfs-bus-counter: add cascade_counts_enable and
    external_input_phase_clock_select
  counter: Add Renesas RZ/G2L MTU3a counter driver
  MAINTAINERS: Add entries for Renesas RZ/G2L MTU3a counter driver
  pwm: Add Renesas RZ/G2L MTU3a PWM driver

 Documentation/ABI/testing/sysfs-bus-counter   |  32 +
 .../bindings/timer/renesas,rz-mtu3.yaml       | 302 ++++++
 MAINTAINERS                                   |   8 +
 drivers/counter/Kconfig                       |  11 +
 drivers/counter/Makefile                      |   1 +
 drivers/counter/rz-mtu3-cnt.c                 | 902 ++++++++++++++++++
 drivers/mfd/Kconfig                           |  10 +
 drivers/mfd/Makefile                          |   1 +
 drivers/mfd/rz-mtu3.c                         | 391 ++++++++
 drivers/mfd/rz-mtu3.h                         | 147 +++
 drivers/pwm/Kconfig                           |  11 +
 drivers/pwm/Makefile                          |   1 +
 drivers/pwm/pwm-rz-mtu3.c                     | 486 ++++++++++
 include/linux/mfd/rz-mtu3.h                   | 257 +++++
 14 files changed, 2560 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/renesas,rz-mtu3.yaml
 create mode 100644 drivers/counter/rz-mtu3-cnt.c
 create mode 100644 drivers/mfd/rz-mtu3.c
 create mode 100644 drivers/mfd/rz-mtu3.h
 create mode 100644 drivers/pwm/pwm-rz-mtu3.c
 create mode 100644 include/linux/mfd/rz-mtu3.h

-- 
2.25.1

