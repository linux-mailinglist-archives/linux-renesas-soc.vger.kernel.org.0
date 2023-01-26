Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F066B67CE7B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Jan 2023 15:42:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230484AbjAZOmG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 26 Jan 2023 09:42:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229473AbjAZOmF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Jan 2023 09:42:05 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6FD066FBD
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Jan 2023 06:41:34 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id E8F4AB81D11
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Jan 2023 14:41:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BD17C433D2;
        Thu, 26 Jan 2023 14:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674744091;
        bh=1OEGSc+byGvsF9anUbWJFCRnV8oyb2jGsXjnHBgX6BU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sJAuMNmrQgx7MVIEpTbv8DhUsyghJbe/aBjO0WJdLdckaRIzw3i3/7kHnK2JPHa54
         1l2nIySYJcJJSPH2wC1RQ27M6oDMuEJO8V9i4lpko7aCTSymmBf9pyU3+niEgFbIzP
         5bLIMMbPaFD+QYm4OjyZb8WxX/ARrXepoayvKlQJVteDlMQOhuztL+vrOIffxE3MRL
         KNrdRef6dozWLEYFoPMRQ64cISbOBNUL6RCyKY4fhzZXohk3PyS8Ifki6aa+sNuLNx
         f3kNLoGl+8yBHr4QzXeZTtk1IE500EaQMBxO9xkgGTmqMwc5Hj3neyaWR+Tf6OKpi8
         ilFepT5yCH2Og==
Date:   Thu, 26 Jan 2023 14:41:26 +0000
From:   Lee Jones <lee@kernel.org>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <chris.paterson2@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v11 2/6] clocksource/drivers: Add Renesas RZ/G2L MTU3a
 core driver
Message-ID: <Y9KRFnc207xAeVvJ@google.com>
References: <20230113161753.1073706-1-biju.das.jz@bp.renesas.com>
 <20230113161753.1073706-3-biju.das.jz@bp.renesas.com>
 <9f722f37-15da-0384-c059-a4af0f1dab10@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9f722f37-15da-0384-c059-a4af0f1dab10@linaro.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, 26 Jan 2023, Daniel Lezcano wrote:

> On 13/01/2023 17:17, Biju Das wrote:
> 
> [ ... ]
> 
> > +config RZ_MTU3
> > +	bool "Renesas RZ/G2L MTU3a core driver"
> > +	select MFD_CORE
> > +	depends on (ARCH_RZG2L && OF) || COMPILE_TEST
> > +	help
> > +	  Select this option to enable Renesas RZ/G2L MTU3a core driver for
> > +	  the Multi-Function Timer Pulse Unit 3 (MTU3a) hardware available
> > +	  on SoCs from Renesas. The core driver shares the clk and channel
> > +	  register access for the other child devices like Counter, PWM,
> > +	  Clock Source, and Clock event.
> 
> Do you really want to have this option manually selectable? Usually we try
> to avoid that and keep a silent option which is selected by the platform
> config.
> 
> [ ... ]
> 
> > +
> > +	ret = mfd_add_devices(&pdev->dev, 0, rz_mtu3_devs,
> > +			      ARRAY_SIZE(rz_mtu3_devs), NULL, 0, NULL);
> > +	if (ret < 0)
> > +		goto err_assert;
> > +
> > +	return devm_add_action_or_reset(&pdev->dev, rz_mtu3_reset_assert,
> > +					&pdev->dev);
> > +
> > +err_assert:
> > +	reset_control_assert(ddata->rstc);
> > +	return ret;
> > +}
> 
> I'm not sure this driver falls under the clocksource umbrella but under mfd
> [cc'ed Lee Jones]

Thanks Daniel.

Please do not use the mfd_* API outside of drivers/mfd.

If you require MFD functionality, write an MFD driver.

-- 
Lee Jones [李琼斯]
