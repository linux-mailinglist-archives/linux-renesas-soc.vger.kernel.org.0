Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 18DA86B0CF3
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Mar 2023 16:36:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232067AbjCHPgU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 Mar 2023 10:36:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232371AbjCHPgB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Mar 2023 10:36:01 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 127E0B3E30
        for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Mar 2023 07:34:55 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DBB6560E06
        for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Mar 2023 15:33:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06D83C433D2;
        Wed,  8 Mar 2023 15:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678289637;
        bh=afAIf+gyMhTyQT8TKF4XMxCu4eCh5nnSnQ32TkWQluI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mBq/H8Gbrf9+s0mJt3NNXNTtFdlBx1+VLMMCY7/3iDgazMM5Y8fw0DXj7UAZSPKIR
         u/d4fq6CG6xb+WxMrmCfxl07mEnGTTBRGk8g2oFEzuqsKeJQ/x4F0HEXzReYCDj/WB
         6CakcM1mvNXhGPpaU8yiC8pi6Gw7ddbkPDhevNc4NNFCn2qgnbOpjlR7Es/dxd3iJp
         RZ6kH4yyhWvpUO/upTGDa5f0FoALUWPeswFONaz5hO2fkaYXCHtI/vVXSBkSO3Iiti
         4VReKZSoD7r5AMOa2jmaVPXCyR+237EJ9YuS2XGqM7TF41F3rYuAxIGAk5sdAIRdzr
         Vv/m13FPjzprw==
Date:   Wed, 8 Mar 2023 15:33:51 +0000
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
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v13 2/6] mfd: Add Renesas RZ/G2L MTU3a core driver
Message-ID: <20230308153351.GR9667@google.com>
References: <20230216203830.196632-1-biju.das.jz@bp.renesas.com>
 <20230216203830.196632-3-biju.das.jz@bp.renesas.com>
 <20230304162000.GA2574592@google.com>
 <TYCPR01MB5933B070FDB6FFCD60B2FEB186B69@TYCPR01MB5933.jpnprd01.prod.outlook.com>
 <20230308133400.GI9667@google.com>
 <OS0PR01MB59228C7F4A86DFC8A58C71AD86B49@OS0PR01MB5922.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <OS0PR01MB59228C7F4A86DFC8A58C71AD86B49@OS0PR01MB5922.jpnprd01.prod.outlook.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, 08 Mar 2023, Biju Das wrote:

> Hi Lee Jones,
>
> Thanks for the feedback.
>
> > Subject: Re: [PATCH v13 2/6] mfd: Add Renesas RZ/G2L MTU3a core driver
> >
> > On Mon, 06 Mar 2023, Biju Das wrote:
> >
> > > Hi Lee Jones,
> > >
> > > Thanks for the review.
> > >
> > > > Subject: Re: [PATCH v13 2/6] mfd: Add Renesas RZ/G2L MTU3a core
> > > > driver
> > > >
> > > > On Thu, 16 Feb 2023, Biju Das wrote:
> > > >
> > > > > The RZ/G2L multi-function timer pulse unit 3 (MTU3a) is embedded
> > > > > in the Renesas RZ/G2L family SoCs. It consists of eight 16-bit
> > > > > timer channels and one 32-bit timer channel. It supports the
> > > > > following functions
> > > > >  - Counter
> > > > >  - Timer
> > > > >  - PWM
> > > > >
> > > > > The 8/16/32 bit registers are mixed in each channel.
> > > > >
> > > > > Add MTU3a core driver for RZ/G2L SoC. The core driver shares the
> > > > > clk and channel register access for the other child devices like
> > > > > Counter, PWM and Clock event.
> > > > >
> > > > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > > > ---
> > > > > Ref:
> > > > >
> > > > >
> > > > > v12->v13:
> > > > >  * Moved RZ_MTU3_TMDR1_* macros from pwm driver to rz-mtu3.h.
> > > > > v11->v2:
> > > > >  * Moved the core driver from timer to MFD.
> > > > >  * Moved header fine from
> > > > > clocksource/rz-mtu3.h->linux/mfd/rz-mtu3.h
> > > > >  * Removed Select MFD_CORE option from config.
> > > > > v10->v11:
> > > > >  * No change.
> > > > > v9->v10:
> > > > >  * No change.
> > > > > v8->v9:
> > > > >  * No change.
> > > > > v7->v8:
> > > > >  * Add locking for RMW on rz_mtu3_shared_reg_update_bit()
> > > > >  * Replaced enum rz_mtu3_functions with channel busy flag
> > > > >  * Added API for request and release a channel.
> > > > > v6->v7:
> > > > >  * Added channel specific mutex to avoid races between child devices
> > > > >    (for eg: pwm and counter)
> > > > >  * Added rz_mtu3_shared_reg_update_bit() to update bit.
> > > > > v5->v6:
> > > > >  * Updated commit and KConfig description
> > > > >  * Selected MFD_CORE to avoid build error if CONFIG_MFD_CORE not set.
> > > > >  * Improved error handling in probe().
> > > > >  * Updated MODULE_DESCRIPTION and title.
> > > > > v4->v5:
> > > > >  * Moved core driver from MFD to timer
> > > > >  * Child devices instatiated using mfd_add_devices()
> > > > > v3->v4:
> > > > >  * A single driver that registers both the counter and the pwm
> > > > functionalities
> > > > >    that binds against "renesas,rz-mtu3".
> > > > >  * Moved PM handling from child devices to here.
> > > > >  * replaced include/linux/mfd/rz-mtu3.h->drivers/mfd/rz-mtu3.h
> > > > >  * Removed "remove" callback
> > > > > v2->v3:
> > > > >  * removed unwanted header files
> > > > >  * Added LUT for 32 bit registers as it needed for 32-bit cascade
> > > > counting.
> > > > >  * Exported 32 bit read/write functions.
> > > > > v1->v2:
> > > > >  * Changed the compatible name
> > > > >  * Replaced
> > > > > devm_reset_control_get->devm_reset_control_get_exclusive
> > > > >  * Renamed function names rzg2l_mtu3->rz_mtu3 as this is generic IP
> > > > >    in RZ family SoC's.
> > > > > ---
> > > > >  drivers/mfd/Kconfig         |  10 +
> > > > >  drivers/mfd/Makefile        |   1 +
> > > > >  drivers/mfd/rz-mtu3.c       | 458
> > ++++++++++++++++++++++++++++++++++++
> > > > >  include/linux/mfd/rz-mtu3.h | 243 +++++++++++++++++++
> > > > >  4 files changed, 712 insertions(+)  create mode 100644
> > > > > drivers/mfd/rz-mtu3.c  create mode 100644
> > > > > include/linux/mfd/rz-mtu3.h
> >
> > [...]
> >
> > > > > diff --git a/include/linux/mfd/rz-mtu3.h
> > > > > b/include/linux/mfd/rz-mtu3.h new file mode 100644 index
> > > > > 000000000000..42e561a9603c
> > > > > --- /dev/null
> > > > > +++ b/include/linux/mfd/rz-mtu3.h
> > > > > @@ -0,0 +1,243 @@
> > > > > +/* SPDX-License-Identifier: GPL-2.0 */
> > > > > +/*
> > > > > + * Copyright (C) 2022 Renesas Electronics Corporation  */ #ifndef
> > > > > +__LINUX_RZ_MTU3_H__ #define __LINUX_RZ_MTU3_H__
> > > >
> > > > __MFD_RZ_MTU3_H__
> > >
> > > OK.
> > >
> > > >
> > > > > +#include <linux/clk.h>
> > > >
> > > > What about all the others?
> > >
> > > It is not required here. Will remove it.
> >
> > It is required.  Please explicitly include all the headers you use here.
>
> OK will add others as well.
>
> >
> >  > > +#if IS_ENABLED(CONFIG_RZ_MTU3)
> > > > > +static inline bool rz_mtu3_request_channel(struct rz_mtu3_channel
> > > > > +*ch) {
> > > > > +	bool is_idle;
> > > > > +
> > > > > +	mutex_lock(&ch->lock);
> > > > > +	is_idle = !ch->is_busy;
> > > > > +	if (is_idle)
> > > > > +		ch->is_busy = true;
> > > >
> > > > Perhaps I'd reading this all wrong, but ...
> > > >
> > > > What are you trying to do here?
> > >
> > > It is to avoid race between counter and pwm to acquiring the same channel.
> > > If a channel is free, then only they can access the channel.
> > >
> > > Please let me know if any clarifications needed, or correct me if anything
> > wrong.
> >
> > I mean the logic.  Please explain it to me.
>
> lock()
> get the idle state of a channel
> if(idle state)
>  make the channel to busy
> unlock
>
> return the idle state;
>
> >
> > For instance, why not just do:
> >
> >   bool success = false
> >
> >   lock()
> >
> >   if (!is_busy)
> >     is_busy = true
> >     success = true
> >
> >   unlock()
> >
> >   return success
> >
> > What do you think?  Easier to brain parse?
>
> Yes, I am ok with your suggestion as well, eventhough there is
> 3 assignment statements compared to 2 in previous logic,
> as it is easier to read.

Perhaps this ticks all the boxes:

lock()

if (is_busy)
  unlock()
  return false

is_busy = true;

unlock()

return true

--
Lee Jones [李琼斯]
