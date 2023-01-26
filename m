Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EDE8767CEF5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Jan 2023 15:52:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232377AbjAZOwb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 26 Jan 2023 09:52:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232376AbjAZOw1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Jan 2023 09:52:27 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04A2A6BBC3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Jan 2023 06:52:04 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A64AAB81D69
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Jan 2023 14:52:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0DDFC4339C;
        Thu, 26 Jan 2023 14:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674744721;
        bh=+NgsKVFUUhzqZAcR6UeDOLqBlEm20x5jmNxv9nwefCA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=S7BYzncGEDBSCuk1OGgluf7AEhoUvpM9AC9aVGG2jXNeLEjFR8YufM4O2yuWr8CY7
         40X4O/y+Tpb+VhSqI2QTZ+KNSN8l8pbwftAJna+56sIYfsAt+kn747NiPLqFAYuP3B
         cEDqUvyC23UY9bnR0W4eRj5wSzDtuw8/IpBH6Wy97xKOJjOz4291gehrfDhFQsOFwZ
         2BYMBcuMSCP5dIclv0T7TkijZTekO41zfaM/fx2dhp1KPzl3Cehi49LJCUzeZprVmE
         Y9cKJ6/x2SHeX9CcpiiQ5LxNDopzUQ1r7MWjh03aC9RFXkr39irxIiq0ZwBTW3JCKN
         kYsvTa+1gC8Ww==
Date:   Thu, 26 Jan 2023 14:51:55 +0000
From:   Lee Jones <lee@kernel.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH v11 2/6] clocksource/drivers: Add Renesas RZ/G2L MTU3a
 core driver
Message-ID: <Y9KTi4TYjh9qwBPE@google.com>
References: <20230113161753.1073706-1-biju.das.jz@bp.renesas.com>
 <20230113161753.1073706-3-biju.das.jz@bp.renesas.com>
 <9f722f37-15da-0384-c059-a4af0f1dab10@linaro.org>
 <OS0PR01MB5922F1D5EEBE6D5B24F1820B86CF9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <OS0PR01MB5922F1D5EEBE6D5B24F1820B86CF9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, 26 Jan 2023, Biju Das wrote:

> Hi Daniel,
> 
> + Rob and Krzysztof Kozlowski 
> 
> > -----Original Message-----
> > From: Daniel Lezcano <daniel.lezcano@linaro.org>
> > Sent: Thursday, January 26, 2023 10:53 AM
> > To: Biju Das <biju.das.jz@bp.renesas.com>; Philipp Zabel
> > <p.zabel@pengutronix.de>
> > Cc: Thomas Gleixner <tglx@linutronix.de>; Geert Uytterhoeven
> > <geert+renesas@glider.be>; Chris Paterson <Chris.Paterson2@renesas.com>;
> > Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>; linux-
> > renesas-soc@vger.kernel.org; Lee Jones <lee@kernel.org>
> > Subject: Re: [PATCH v11 2/6] clocksource/drivers: Add Renesas RZ/G2L MTU3a
> > core driver
> > 
> > On 13/01/2023 17:17, Biju Das wrote:
> > 
> > [ ... ]
> > 
> > > +config RZ_MTU3
> > > +	bool "Renesas RZ/G2L MTU3a core driver"
> > > +	select MFD_CORE
> > > +	depends on (ARCH_RZG2L && OF) || COMPILE_TEST
> > > +	help
> > > +	  Select this option to enable Renesas RZ/G2L MTU3a core driver for
> > > +	  the Multi-Function Timer Pulse Unit 3 (MTU3a) hardware available
> > > +	  on SoCs from Renesas. The core driver shares the clk and channel
> > > +	  register access for the other child devices like Counter, PWM,
> > > +	  Clock Source, and Clock event.
> > 
> > Do you really want to have this option manually selectable? Usually we try
> > to avoid that and keep a silent option which is selected by the platform
> > config.
> 
> For critical drivers like CPG, Pinctrl we enable it by default by silent option in platform config.
> For the others we add it to defconfig, once the device tree support is available.
> 
> 
> > 
> > [ ... ]
> > 
> > > +
> > > +	ret = mfd_add_devices(&pdev->dev, 0, rz_mtu3_devs,
> > > +			      ARRAY_SIZE(rz_mtu3_devs), NULL, 0, NULL);
> > > +	if (ret < 0)
> > > +		goto err_assert;
> > > +
> > > +	return devm_add_action_or_reset(&pdev->dev, rz_mtu3_reset_assert,
> > > +					&pdev->dev);
> > > +
> > > +err_assert:
> > > +	reset_control_assert(ddata->rstc);
> > > +	return ret;
> > > +}
> > 
> > I'm not sure this driver falls under the clocksource umbrella but under
> > mfd [cc'ed Lee Jones]
> > 
> 
> 
> Please find [1],
> 
> After a long discussion with dt maintainers, counter maintainer, MFD maintainer and PWM maintainer, it is concluded to
> Add the core driver to timer subsystem.

Which is fine.  However, you cannot then use the MFD API.                                                              
                                                                                                                       
> [1] https://patchwork.kernel.org/project/linux-renesas-soc/patch/20221010145222.1047748-2-biju.das.jz@bp.renesas.com/
                                                                                                                       
  "The TL;DR is: if you're not using the MFD Core (and including                                                       
  mfd/core.h), it's not an MFD.  You *could* split this up into its                                                    
  component parts, place them into their own subsystems and use an MFD                                                 
  core driver to register them all, but as Thierry says, this is not a                                                 
  hard requirement either."

-- 
Lee Jones [李琼斯]
