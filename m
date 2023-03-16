Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B2DFC6BD47B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Mar 2023 16:58:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231610AbjCPP6d (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 Mar 2023 11:58:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231671AbjCPP61 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Mar 2023 11:58:27 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0F2CE2527
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Mar 2023 08:58:14 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 91792B8227C
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Mar 2023 15:58:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3975C433D2;
        Thu, 16 Mar 2023 15:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678982292;
        bh=kPcnmyat+U/vUp3eR0nJs8QMMYbz6rvC4T0k5+Hf/EA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TYcIzl69aBrDG31OdB9EfDJKm/fNeALp+ebUXfaM8C2g/Z7fTNy2CpwTIue/SFJIu
         9CDq042XfF+WuZ1av8UbzPJnTb2R6P7ULvLJkPCZ1d09gI3lOM9eLMK6bNEHxh/bz0
         QDc6KlfWLr8Lqd7ljblVLxveGyaAHMX1nFhAPochoakhtGMsVD+WUhVg7d43MXNqPX
         V6yTFISIvfuf+37ursXFo+TDX793sOT5mFSj1HGm7Eb5WBi8jhoK0+lIcCgSRdTr/O
         xiiKiqZ0U9gD3Rt0LopcU5BtQsNTNjNNpEJ0BedqXrZccJskHzlyu2JTHULWJreYcE
         yPweXs0bZrgeQ==
Date:   Thu, 16 Mar 2023 15:58:06 +0000
From:   Lee Jones <lee@kernel.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        William Breathitt Gray <william.gray@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Chris Paterson <chris.paterson2@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v14 2/6] mfd: Add Renesas RZ/G2L MTU3a core driver
Message-ID: <20230316155806.GN9667@google.com>
References: <20230310170654.268047-1-biju.das.jz@bp.renesas.com>
 <20230310170654.268047-3-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230310170654.268047-3-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, 10 Mar 2023, Biju Das wrote:

> The RZ/G2L multi-function timer pulse unit 3 (MTU3a) is embedded in
> the Renesas RZ/G2L family SoCs. It consists of eight 16-bit timer
> channels and one 32-bit timer channel. It supports the following
> functions
>  - Counter
>  - Timer
>  - PWM
>
> The 8/16/32 bit registers are mixed in each channel.
>
> Add MTU3a core driver for RZ/G2L SoC. The core driver shares the
> clk and channel register access for the other child devices like
> Counter, PWM and Clock event.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> Ref:
>  https://patchwork.kernel.org/project/linux-renesas-soc/patch/20230113161753.1073706-3-biju.das.jz@bp.renesas.com/
> v13->v14:
>  * Added helper macros for initializing 8/16/32 channel reg offset table in
>    "drivers/mfd/rz-mtu3.h"
>  * Replaced "off"->offset in read_write()
>  * Replaced __LINUX_RZ_MTU3_H__->__MFD_RZ_MTU3_H__
>  * Added header file device.h and mutex.h
>  * Updated rz_mtu3_request_channel()
>  * Replaced channel_index->channel_number in struct rz_mtu3_channel
>  * Dropped redundant comments.
>  * Renamed channel number macros from RZ_MTU*->RZ_MTU3_CHAN_*
>  * Added core driver specific private data in struct rz_mtu3 and updated the
>    comments. This replaces mmio from struct rz_mtu3.
>  * Started using actual offset in channel reg table and removed ch_reg_offsets table
>    Also simplified the code 8/16/32 bits read_write() and removed base from
>    struct rz_mtu3_channel.
>  * Simplified rz_mtu3_start_stop_ch()/rz_mtu3_is_enabled() by adding helper functions
>    rz_mtu3_get_tstr_offset()/rz_mtu3_get_tstr_bit_pos().
> v12->v13:
>  * Moved RZ_MTU3_TMDR1_* macros from pwm driver to rz-mtu3.h.
> v11->v2:
>  * Moved the core driver from timer to MFD.
>  * Moved header fine from clocksource/rz-mtu3.h->linux/mfd/rz-mtu3.h
>  * Removed Select MFD_CORE option from config.
> v10->v11:
>  * No change.
> v9->v10:
>  * No change.
> v8->v9:
>  * No change.
> v7->v8:
>  * Add locking for RMW on rz_mtu3_shared_reg_update_bit()
>  * Replaced enum rz_mtu3_functions with channel busy flag
>  * Added API for request and release a channel.
> v6->v7:
>  * Added channel specific mutex to avoid races between child devices
>    (for eg: pwm and counter)
>  * Added rz_mtu3_shared_reg_update_bit() to update bit.
> v5->v6:
>  * Updated commit and KConfig description
>  * Selected MFD_CORE to avoid build error if CONFIG_MFD_CORE not set.
>  * Improved error handling in probe().
>  * Updated MODULE_DESCRIPTION and title.
> v4->v5:
>  * Moved core driver from MFD to timer
>  * Child devices instatiated using mfd_add_devices()
> v3->v4:
>  * A single driver that registers both the counter and the pwm functionalities
>    that binds against "renesas,rz-mtu3".
>  * Moved PM handling from child devices to here.
>  * replaced include/linux/mfd/rz-mtu3.h->drivers/mfd/rz-mtu3.h
>  * Removed "remove" callback
> v2->v3:
>  * removed unwanted header files
>  * Added LUT for 32 bit registers as it needed for 32-bit cascade counting.
>  * Exported 32 bit read/write functions.
> v1->v2:
>  * Changed the compatible name
>  * Replaced devm_reset_control_get->devm_reset_control_get_exclusive
>  * Renamed function names rzg2l_mtu3->rz_mtu3 as this is generic IP
>    in RZ family SoC's.
> ---
>  drivers/mfd/Kconfig         |  10 +
>  drivers/mfd/Makefile        |   1 +
>  drivers/mfd/rz-mtu3.c       | 391 ++++++++++++++++++++++++++++++++++++
>  drivers/mfd/rz-mtu3.h       | 147 ++++++++++++++
>  include/linux/mfd/rz-mtu3.h | 241 ++++++++++++++++++++++
>  5 files changed, 790 insertions(+)
>  create mode 100644 drivers/mfd/rz-mtu3.c
>  create mode 100644 drivers/mfd/rz-mtu3.h
>  create mode 100644 include/linux/mfd/rz-mtu3.h

I plan to take this set via MFD once you have  PWM Ack.

For my own reference (apply this as-is to your sign-off block):

Acked-for-MFD-by: Lee Jones <lee@kernel.org>

--
Lee Jones [李琼斯]
