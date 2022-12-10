Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 55807648E1B
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 10 Dec 2022 11:21:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229548AbiLJKVU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 10 Dec 2022 05:21:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229560AbiLJKVT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 10 Dec 2022 05:21:19 -0500
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 6A15D22532;
        Sat, 10 Dec 2022 02:21:18 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.96,232,1665414000"; 
   d="scan'208";a="145700182"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 10 Dec 2022 19:21:17 +0900
Received: from localhost.localdomain (unknown [10.226.92.39])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id B98844007207;
        Sat, 10 Dec 2022 19:21:13 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     "Rob Herring" <robh+dt@kernel.org>,
        "Philipp Zabel" <p.zabel@pengutronix.de>,
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
Subject: [PATCH v8 0/5] Add RZ/G2L MTU3a Core, Counter and pwm driver
Date:   Sat, 10 Dec 2022 10:21:05 +0000
Message-Id: <20221210102110.443043-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.1 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
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

clock event driver will be added later for system wakeup during CPU
idle.

Ref:
 https://patchwork.kernel.org/project/linux-renesas-soc/patch/20221010145222.1047748-2-biju.das.jz@bp.renesas.com/

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

Biju Das (5):
  dt-bindings: timer: Document RZ/G2L MTU3a bindings
  clocksource/drivers: Add Renesas RZ/G2L MTU3a core driver
  Documentation: ABI: sysfs-bus-counter: add cascade_counts_enable and
    external_input_phase_clock_select
  counter: Add Renesas RZ/G2L MTU3a counter driver
  pwm: Add Renesas RZ/G2L MTU3a PWM driver

 Documentation/ABI/testing/sysfs-bus-counter   |  25 +
 .../bindings/timer/renesas,rz-mtu3.yaml       | 302 +++++++
 drivers/clocksource/Kconfig                   |  11 +
 drivers/clocksource/Makefile                  |   1 +
 drivers/clocksource/rz-mtu3.c                 | 459 ++++++++++
 drivers/counter/Kconfig                       |  11 +
 drivers/counter/Makefile                      |   1 +
 drivers/counter/rz-mtu3-cnt.c                 | 793 ++++++++++++++++++
 drivers/pwm/Kconfig                           |  11 +
 drivers/pwm/Makefile                          |   1 +
 drivers/pwm/pwm-rz-mtu3.c                     | 468 +++++++++++
 include/clocksource/rz-mtu3.h                 | 237 ++++++
 12 files changed, 2320 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/renesas,rz-mtu3.yaml
 create mode 100644 drivers/clocksource/rz-mtu3.c
 create mode 100644 drivers/counter/rz-mtu3-cnt.c
 create mode 100644 drivers/pwm/pwm-rz-mtu3.c
 create mode 100644 include/clocksource/rz-mtu3.h

-- 
2.25.1

