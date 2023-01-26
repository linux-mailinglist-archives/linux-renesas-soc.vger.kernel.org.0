Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E95BF67C8DD
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Jan 2023 11:44:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232897AbjAZKoM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 26 Jan 2023 05:44:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231428AbjAZKoL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Jan 2023 05:44:11 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88D6346D54
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Jan 2023 02:44:07 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id n7so1313968wrx.5
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Jan 2023 02:44:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ri11DGuRUmhA8pxxOQH7Smd4mHpj6lAzz8PfJ17j5NA=;
        b=giRDVgNo6Z2c/Q6BuF908EAWe+kw9JK95vFrKfs/pBN9zBRYqExik9hsvP09H4shXp
         KjsaxUqwUwg152Kmb4lli2oTHhXoFdetbTHua8xVQ14JZ2kM0RrrlRGpZYU28GOpvSbH
         ktOWjFlR98Bi8FoInfyU9z606TnT+YUcbeVlyOjrIHhH5UaGAgvQOn5aNcvAauSDDUkM
         NufKDqzyB6svDn7fSHQSRg5+MgkP9b/0W4KS/9XerjK8lCgoumSNVLTKkdISQ/GQyUHJ
         fXKDHeyW2ETwLaIN78zgnG8CZWhtKRKkVj99kFoQb2hUpwm+g0GWzBocAiulDrVvbpi0
         ppEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ri11DGuRUmhA8pxxOQH7Smd4mHpj6lAzz8PfJ17j5NA=;
        b=eQwAbMchfJ9haCH4hCzqHbLbQzKIwgDVkpb+tL/TFJQ954+t09vBNG87gualI5xq+K
         mwsTTvKG68zN7pqwSgRny8nrTtLqMInxhfnRWHdiV1e1B9efuKrjARZJug95BMBVfJjH
         a7U96ZOoIizzddJqnwd6DCOZhYPZFKDTu1hMFOoTC7yRNWX66povYIQmOAcJeVvGXo7g
         tSGX1BJTprWLrTjahYdSFNB1Ws2wF18O1iALOzvGFIvMsN7HewslmaWG7s0uTZsWxErs
         7quzZgiLLqtcR7wt6N21Xj94Hy9BPwX68o7BZIZ8R78VwJGXYfr6L7uqIyP75SNjzGhI
         Hy1g==
X-Gm-Message-State: AFqh2kr8hkq2cHTf8HWHxwWp1j+trEP/h7FJYTJOPb3lOH+XusXP0uCz
        WDPWD8hHpxwUxjOTthNZqvAlnIa1oKAvyges
X-Google-Smtp-Source: AMrXdXuYaPv071xcdtTvrGR/+0WZMMaj1AyFIISR5vOB6PWp6L2zGm4TxgbYwTPpHE8h6PH3Y8y65A==
X-Received: by 2002:adf:dcc8:0:b0:2bf:950f:d4bc with SMTP id x8-20020adfdcc8000000b002bf950fd4bcmr14872363wrm.11.1674729845758;
        Thu, 26 Jan 2023 02:44:05 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id e10-20020a5d500a000000b002be0b1e556esm926360wrt.59.2023.01.26.02.44.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jan 2023 02:44:05 -0800 (PST)
Message-ID: <94bd66d9-bd52-7b34-cf24-b6b9f2e21684@linaro.org>
Date:   Thu, 26 Jan 2023 11:44:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v11 0/6] Add RZ/G2L MTU3a Core, Counter and pwm driver
Content-Language: en-US
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        William Breathitt Gray <william.gray@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
References: <20230113161753.1073706-1-biju.das.jz@bp.renesas.com>
 <OS0PR01MB5922C101756A71153EEBA8AA86CE9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <OS0PR01MB5922C101756A71153EEBA8AA86CE9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 25/01/2023 20:48, Biju Das wrote:
> Hi Daniel,
> 
> Gentle ping.

Yeah, sorry for the delay.


> The core driver and binding patches [1] and [2] is blocking[3], [4] and [5].
> 
> Does these patches have to go via counter tree as it is the first user and
> we have dependency between subsystems for this IP?

I am reviewing the patch for now.

The simplest way is I create an immutable branch based on v6.2-rc1 with 
these two patches and then I merge it back to the timers/next branch.

 From your side, you merge this immutable branch.

I'll take care of it ASAP, so you won't be blocked anymore.


> [1] https://lore.kernel.org/linux-renesas-soc/20230113161753.1073706-1-biju.das.jz@bp.renesas.com/T/#m79afdee83fd64dfbeb27fd888361a0d6d6a26ad5
> 
> [2] https://lore.kernel.org/linux-renesas-soc/20230113161753.1073706-1-biju.das.jz@bp.renesas.com/T/#m4d0dfa4d2700c2d6669da3289d68bcb9ce7dac71
> 
> [3] https://lore.kernel.org/linux-renesas-soc/20230113161753.1073706-1-biju.das.jz@bp.renesas.com/T/#mb8d4b7ad8e23e795bfde15a33c28b5c0348654bc
> 
> [4] https://lore.kernel.org/linux-renesas-soc/20230113161753.1073706-1-biju.das.jz@bp.renesas.com/T/#me3bcc56cef9cf78868e38158f8b870fa9cceff8f
> 
> [5] https://lore.kernel.org/linux-renesas-soc/20230113161753.1073706-1-biju.das.jz@bp.renesas.com/T/#m1821926505123cd75f0b981e496d4e044cf875c3
> 
> Cheers,
> Biju
> 
>> Subject: [PATCH v11 0/6] Add RZ/G2L MTU3a Core, Counter and pwm driver
>>
>> The RZ/G2L multi-function timer pulse unit 3 (MTU3a) is embedded in the
>> Renesas RZ/G2L family SoC's. It consists of eight 16-bit timer channels and
>> one 32-bit timer channel. It supports the following functions
>>   - Counter
>>   - Timer
>>   - PWM
>>
>> This patch series aims to add core, counter and pwm driver for MTU3a. The
>> core instantiates child devices using mfd api.
>>
>> The 8/16/32 bit registers are mixed in each channel. The HW specifications
>> of the IP is described in patch#1.
>>
>> Current patch set is tested for PWM mode1 on MTU3 channel and 16 and 32 bit
>> phase counting modes on MTU1 and MTU2 channels.
>>
>> There is a plan to add clock event driver later for Power management.
>>
>> Ref:
>>
> https://patchwork.kernel.org/project/linux-renesas-soc/patch/20221010145222.1047748-2-biju.das.jz@bp.renesas.com/
> 
>> v10->v11:
>>   * Added Rb tag from William Breathitt Gray for the driver patch
>>   * Replaced count2 channel name from "combined"->"cascaded", as channels
>>     are cascaded
>>   * Simplified the locking by adding the helper functions
>>     rz_mtu3_lock_if_counter_is_valid, rz_mtu3_lock_if_count_is_enabled,
>>     and rz_mtu3_lock_if_ch0_is_enabled.
>>   * Added the MAINTAINERS entries for the driver.
>> v9->v10:
>>   * Added logs from PWM and counter
>>   * Added Rb tag from William Breathitt Gray for sysfs counter doc
>>   * Added helper function for rz_mtu3_count_{action,function}_read
>>   * Added priv->lock in rz_mtu3_count_function_read and rz_mtu3_count_
>>     direction_read.
>>   * Added ch->is_busy check for rz_mtu3_action_read()
>>   * Added rz_mtu3_is_ch0_enabled() for device specific sysfs variables.
>>   * Added ch->is_busy check for device specific sysfs variables.
>> v8->v9:
>>   * Added prescale/duty_cycle variables to struct rz_mtu3_pwm_chip and
>>     cached this values in rz_mtu3_pwm_config and used this cached values
>>     in get_state(), if PWM is disabled.
>>   * Added return code for get_state().
>>   * Added available blocks for external_input_phase_clock_select_available
>>   * Removed the "This attribute" from the external_input_phase_clock_select
>>     description, and capitalize the word "counter" from description.
>>   * Removed the "This attribute" from the cascade_counts_enable description,
>>     and capitalize "counts" and "counter"
>>   * Moved these device-level configuration blocks to top of the file.
>>   * Added count_is_enabled variable to struct rz_mtu3_cnt
>>   * Added check for ch->is_busy and count_is_enabled before every Counter
>>     callback to ensure we do not try to access a busy channel used by other
>>     subsystem(eg: pwm).
>>   * Removed id parameter from rz_mtu3_32bit_cnt_setting()
>>   * Made definition of rz_mtu3_get_ch() in single line.
>>   * Replaced break->return in rz_mtu3_32bit_cnt_setting(),
>>     rz_mtu3_count_function_read() and rz_mtu3_initialize_counter()
>>     and removed redundant return 0.
>>   * Simplified synapse signal check for rz_mtu3_action_read().
>> v7->v8:
>>   * Add locking for RMW on rz_mtu3_shared_reg_update_bit()
>>   * Replaced enum rz_mtu3_functions with channel busy flag
>>   * Added API for request and release a channel.
>>   * Replaced cascade_enable->cascade_counts_enable
>>   * Updated commit header and description
>>   * Added external_input_phase_clock_select_available entry for driver-
>>     specific enum attribute and created a new entry block for it.
>>   * Add a line stating cascade_counts_enable is a boolean attribute.
>>   * Added missing 'component_id' suffix.
>>   * Simplified rz_mtu3_initialize_counter by calling rz_mtu3_request_
>>     channel() and release the acquired sibling channel in case of error.
>>   * Simplified rz_mtu3_terminate_counter by calling rz_mtu3_release_
>>     channel().
>>   * Removed unused ceiling and ch_id from rz_mtu3_count_write()
>>   * Replaced the error -EINVAL->-EBUSY for rz_mtu3_is_counter_invalid()
>>   * Avoided race between rz_mtu3_count_{read, write} with rz_mtu3_
>>     cascade_counts_enable_set() by adding locks and moved the lock
>>     before rz_mtu3_is_counter_invalid()
>>   * Protected the rz_mtu3_count_ceiling_read() function with a lock
>>     to make sure the cascade operation mode doesn't not change and
>>     that the priv data structure accesses don't race when they are
>>     changed in the ceiling_write() callback.
>>   * Added lock in rz_mtu3_cascade_enable_set() to make sure the other
>>     callbacks don't try to read the LWA state while updating LWA.
>>   * Added lock in rz_mtu3_ext_input_phase_clock_select_set() to ensure
>>     the other callbacks don't try to read the PHCKSEL state while updating
>>     PHCKSEL.
>>   * Added lock to avoid race between rz_mtu3_count_function_write() and
>>     rz_mtu3_action_read()
>>   * Updated rz_mtu3_action_read to return 0, if Synapse is in COUNTER_SYNAPSE
>>     _ACTION_NONE state.
>>   * Replaced sysfs variable cascade_enable->cascade_counts_enable
>>   * Renamed rz_mtu3_cascade_enable_get->rz_mtu3_cascade_counts_enable_get
>>   * Renamed rz_mtu3_cascade_enable_set->rz_mtu3_cascade_counts_enable_set
>>   * Removed redundent ceiling assignment from rz_mtu3_count_ceiling_read()
>>   * Removed unused ceiling and ch_id from rz_mtu3_count_write().
>>   * Simplified rz_mtu3_pwm_request by calling rz_mtu3_request_channel()
>>   * Simplified rz_mtu3_pwm_free by calling rz_mtu3_release_channel()
>> v6->v7:
>>   * Added channel specific mutex to avoid races between child devices
>>     (for eg: pwm and counter).
>>   * Added rz_mtu3_shared_reg_update_bit() to update bits.
>>   * Replaced sysfs variable "long_word_access_ctrl_mode->cascade_enable"
>>   * Updated Kernel version in sysfs Documentation
>>   * Updated commit description for counter driver
>>   * Added Register descriptions
>>   * Opimized size of cache variable by using union
>>   * Used test_bit() in rz_mtu3_is_counter_invalid()
>>   * Replaced val->timer_mode in rz_mtu3_count_function_{read,write}
>>   * Added TODO comment phase3 and phase5 modes.
>>   * replaced if-else with ternary expression in
>> rz_mtu3_count_direction_read()
>>   * Used switch statement in rz_mtu3_count_ceiling_read to consistent with
>> write
>>   * Provided default case for all switch statements.
>>   * Add mutex lock for avoiding races with other devices and counter
>>   * Updated comments in rz_mtu3_action_read()
>>   * Replaced COUNTER_COMP_DEVICE_BOOL->COUNTER_COMP_DEVICE_BOOL for
>>     cascade_enable
>>   * Replaced RZ_MTU3_GET_HW_CH->rz_mtu3_get_hw_ch
>>   * Added rz_mtu3_get_ch() to get channels
>>   * used rz_mtu3_shared_reg_update_bit for cascade_enable and
>>     selecting phase input clock.
>>   * Added rz_mtu3_is_counter_invalid() check in rz_mtu3_count_ceiling_read()
>>   * Added channel specific mutex lock to avoid race between counter
>>     device and rz_mtu3_pwm_{request,free}
>>   * Added pm_runtime_resume_and_get in rz_mtu3_pwm_enable()
>>   * Added pm_runtime_put_sync in rz_mtu3_pwm_disable()
>>   * Updated rz_mtu3_pwm_config()
>>   * Updated rz_mtu3_pwm_apply()
>> v5->v6:
>>   * Added Rb tag from Rob and Krzysztof for the binding patch.
>>   * Updated commit and KConfig description for the driver patches
>>   * Selected MFD_CORE to avoid build error if CONFIG_MFD_CORE not set.
>>   * Improved error handling in core driver's probe().
>>   * Fixed RZ_MTU3_GET_HW_CH Macro for argument reuse 'id' -
>>     possible side-effects?
>>   * Replaced SET_RUNTIME_PM_OPS->DEFINE_RUNTIME_DEV_PM_OPS and removed
>>     __maybe_unused from suspend/resume()
>>   * Replaced dev_get_drvdata from rz_mtu3_pwm_pm_disable()
>>   * Sorted header files for all driver files.
>> v4->v5:
>>   * Modelled as timer bindings.
>>   * Fixed the typo in bindings.
>>   * Moved core driver from MFD to timer
>>   * Child devices instatiated using mfd_add_devices()
>>   * Documented sysfs entries external_input_phase_clock_select and
>>     long_word_access_ctrl_mode.
>>   * Updated the Kconfig with SoC vendor name
>>   * Introduced rz_mtu3_is_counter_invalid()
>>   * replaced pointer to an array of struct rz_mtu3_channel with
>>     a simple pointer to struct rz_mtu3_channel.
>>   * Added long_word_access_ctrl_mode sysfs entry for 16-bit and
>>     32-bit access
>>   * Added external_input_phase_clock_select sysfs entry for
>>     selecting input clocks.
>>   * used preprocessor defines represent SIGNAL_{A,B,C,D}_ID instead of
>>     signal ids.
>> v3->v4:
>>   * Dropped counter and pwm compatibeles as they don't have any resources.
>>   * Made rz-mtu3 as pwm provider.
>>   * Updated the example and description.
>>   * A single driver that registers both the counter and the pwm
>> functionalities
>>     that binds against "renesas,rz-mtu3".
>>   * Moved PM handling from child devices to here.
>>   * replaced include/linux/mfd/rz-mtu3.h->drivers/mfd/rz-mtu3.h
>>   * Removed "remove" callback from mfd driver
>>   * There is no resource associated with "rz-mtu3-counter" and "rz-mtu3-pwm"
>>     compatible and moved the code to mfd subsystem as it binds against "rz-
>> mtu".
>>   * Removed struct platform_driver rz_mtu3_cnt_driver.
>>   * Removed struct platform_driver rz_mtu3_pwm_driver.
>>   * Updated commit description
>>   * Updated Kconfig description
>>   * Added macros RZ_MTU3_16_BIT_MTU{1,2}_CH for MTU1 and MTU2 channels
>>   * Added RZ_MTU3_GET_HW_CH macro for getting channel ID.
>>   * replaced priv->ch[id]->priv->ch[0] in rz_mtu3_count_read()
>>   * Cached counter max values
>>   * replaced cnt->tsr in rz_mtu3_count_direction_read()
>>   * Added comments for RZ_MTU3_TCR_CCLR_NONE
>>   * Replaced if with switch in rz_mtu3_initialize_counter() and
>>     rz_mtu3_count_ceiling_write()
>>   * Added locks in initialize, terminate and enable_read to prevent races.
>>   * Updated rz_mtu3_action_read to take care of MTU2 signals.
>>   * Added separate distinct array for each group of Synapse.
>>   * Moved pm handling to parent.
>> v2->v3:
>>   * Dropped counter bindings and integrated with mfd as it has only one
>> property.
>>   * Removed "#address-cells" and "#size-cells" as it do not have children
>> with
>>     unit addresses.
>>   * Removed quotes from counter and pwm.
>>   * Provided full path for pwm bindings.
>>   * Updated the binding example.
>>   * removed unwanted header files
>>   * Added LUT for 32 bit registers as it needed for 32-bit cascade counting.
>>   * Exported 32 bit read/write functions.
>>   * Modelled as a counter device supporting 3 counters(2 16-bit and
>>     32-bit)
>>   * Add kernel-doc comments to document struct rz_mtu3_cnt
>>   * Removed mmio variable from struct rz_mtu3_cnt
>>   * Removed cnt local variable from rz_mtu3_count_read()
>>   * Replaced -EINVAL->-ERANGE for out of range error conditions.
>>   * Removed explicit cast from write functions.
>>   * Removed local variable val from rz_mtu3_count_ceiling_read()
>>   * Added lock for RMW for counter/ceiling updates.
>>   * Added different synapses for counter0 and counter{1,2}
>>   * Used ARRAY for assigning num_counts.
>>   * Added PM runtime for managing clocks.
>>   * Add MODULE_IMPORT_NS(COUNTER) to import the COUNTER namespace.
>>
>> RFC->v2:
>>   * replaced devm_reset_control_get->devm_reset_control_get_exclusive
>>   * Dropped 'bindings' from the binding title
>>   * Updated the binding example
>>   * Added additionalProperties: false for counter bindings
>>   * Squashed all the binding patches
>>   * Modelled as a single counter device providing both 16-bit
>>     and 32-bit phase counting modes
>>   * Modelled as a single pwm device for supporting different pwm modes.
>>   * Moved counter and pwm bindings to respective subsystems.
>>
>> Logs:
>> root@smarc-rzg2l:/# /mtu_test.sh
>> #### Zero duty cycle ###
>> #### decrement Period ###
>> #### Increment Period ###
>> #### decrement duty cycle ###
>> #### Increment duty cycle ###
>> ### Unbind the PWM driver####
>> ### Bind the PWM driver####
>> Positive counting
>> cascade_counts_enable is 0
>> #### Ch0 count
>> 0
>> 2
>> 8
>> 13
>> 18
>> 23
>> 28
>> 33
>> 38
>> 44
>> 50
>> 3
>> 9
>> 14
>> 19
>> 24
>> 29
>> 35
>> 39
>> 45
>> #### Ch1 count
>> #### Select Phase clock
>> Phase clock MTCLKA-MTCLKB
>> 0
>> 5
>> 10
>> 15
>> 20
>> 4
>> 10
>> 14
>> 20
>> 3
>> 9
>> 14
>> 19
>> 3
>> 8
>> 14
>> 18
>> 3
>> 7
>> 13
>> #### Select Phase clock
>> Phase clock MTCLKA-MTCLKB
>> cascade_counts_enable is 1
>> #### Ch2 count
>> 0
>> 5
>> 10
>> 15
>> 21
>> 25
>> 31
>> 36
>> 41
>> 46
>> 51
>> 56
>> 61
>> 67
>> 71
>> 77
>> 82
>> 87
>> 92
>> 97
>> ### Unbind the counter driver####
>> ### Bind the counter driver####
>> ### Unbind the Core driver####
>> ### Bind the Core driver####
>> Read at address  0x11010538 (0xffffb1aaa538): 0x00000000 root@smarc-rzg2l:/#
>>
>> Biju Das (6):
>>    dt-bindings: timer: Document RZ/G2L MTU3a bindings
>>    clocksource/drivers: Add Renesas RZ/G2L MTU3a core driver
>>    Documentation: ABI: sysfs-bus-counter: add cascade_counts_enable and
>>      external_input_phase_clock_select
>>    counter: Add Renesas RZ/G2L MTU3a counter driver
>>    MAINTAINERS: Add entries for Renesas RZ/G2L MTU3a counter driver
>>    pwm: Add Renesas RZ/G2L MTU3a PWM driver
>>
>>   Documentation/ABI/testing/sysfs-bus-counter   |  32 +
>>   .../bindings/timer/renesas,rz-mtu3.yaml       | 302 ++++++
>>   MAINTAINERS                                   |   8 +
>>   drivers/clocksource/Kconfig                   |  11 +
>>   drivers/clocksource/Makefile                  |   1 +
>>   drivers/clocksource/rz-mtu3.c                 | 459 +++++++++
>>   drivers/counter/Kconfig                       |  11 +
>>   drivers/counter/Makefile                      |   1 +
>>   drivers/counter/rz-mtu3-cnt.c                 | 903 ++++++++++++++++++
>>   drivers/pwm/Kconfig                           |  11 +
>>   drivers/pwm/Makefile                          |   1 +
>>   drivers/pwm/pwm-rz-mtu3.c                     | 486 ++++++++++
>>   include/clocksource/rz-mtu3.h                 | 237 +++++
>>   13 files changed, 2463 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/timer/renesas,rz-
>> mtu3.yaml
>>   create mode 100644 drivers/clocksource/rz-mtu3.c  create mode 100644
>> drivers/counter/rz-mtu3-cnt.c  create mode 100644 drivers/pwm/pwm-rz-mtu3.c
>> create mode 100644 include/clocksource/rz-mtu3.h
>>
>> --
>> 2.25.1
> 

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

