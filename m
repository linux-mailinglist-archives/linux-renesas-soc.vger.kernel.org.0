Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F988692BC0
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 Feb 2023 01:09:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229601AbjBKAJr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 10 Feb 2023 19:09:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229501AbjBKAJq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Feb 2023 19:09:46 -0500
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 981415EA08
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Feb 2023 16:09:44 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id p26so19762771ejx.13
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Feb 2023 16:09:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=x7mMb77558/GOa2tdSKEAjGehFCYaUFofxy3eaCoOPs=;
        b=bmqdY2XVdR97O+Gg+fo1zWuZif0OftD7uSEd4tTqcN2nMWViEr95M+aQ5z56z3Ixb0
         zyToSoJeSRhoh1NN6nuJPlUzD4ffmt0DMkr/y3aQv0zGxW8pW0DjtzS6YxbTKQcBLRbl
         dmDTGAzkW99YoaweR4xRS7hLNSKdFbh4MKsgVDsbgz0kP2ACyOI55BfDu6gXxmgm9hXc
         AtSEBSnxLA5QMYHezqhFvC8iODFLx6/D2UNz7LVxr3Lg8z0EXFPtE+NohxxB7h2btwLf
         pN3eqDi/PBAIRUnwHf/weIdGArouqaGX6NpGzsospFh8vzI+kY1stES63zeeM1w9JnwK
         8d/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x7mMb77558/GOa2tdSKEAjGehFCYaUFofxy3eaCoOPs=;
        b=Wq/zjoj8FjircO+2s874EJZ1l8bI+/il6gM1kj4IyB1Xy/adaXOYq/EXd1nLGweyAn
         LUkr9UzhUQ78/5YufO5lQOgNkoakNhC33hWWS8xAWtVqJ7TSuhMUinP5Pw+r4kjieS/6
         h3H+e58+CIXa0iDu9hKRLKSnv5NJkEgXklVeDwmW7bpICECOWXo7lGm/BIYhk/XIfZgB
         i9/2g48DeyfNFbGQeynhQl4DvGgQxgX0sv9A9wjyUl3DKKRUpwR7GqnXQQPNrK2As1Kf
         Bo0M3E+FcUEOEledgRHqShQOll2EEwXIWiMryTwMLj7+ubr+dYfhRMuNhEa9g8q1s3IQ
         IaBQ==
X-Gm-Message-State: AO0yUKUzXgGXPRe95spFxfwhcgJmE0EwEyoXwa51Tu0RkraQUrU0PGhi
        mmwcqAIyeeBr5nRX6UEmdmix5Q==
X-Google-Smtp-Source: AK7set/v03pmyEIL8majewMjwUBdx8AmLaZjc9pwXrZDINkJlDAxy0jBTUYhIf17FVSFb1cf7uuLBw==
X-Received: by 2002:a17:907:8a03:b0:7c1:458b:a946 with SMTP id sc3-20020a1709078a0300b007c1458ba946mr23456568ejc.0.1676074183101;
        Fri, 10 Feb 2023 16:09:43 -0800 (PST)
Received: from localhost (h-46-59-89-207.A463.priv.bahnhof.se. [46.59.89.207])
        by smtp.gmail.com with ESMTPSA id f15-20020a170906560f00b007add62dafbasm3055025ejq.157.2023.02.10.16.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Feb 2023 16:09:42 -0800 (PST)
Date:   Sat, 11 Feb 2023 01:09:41 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH/RFC] arm64: dts: renesas: draak: Add overlay for HDMI
 input
Message-ID: <Y+bcxWyB3iALkMyM@oden.dyn.berto.se>
References: <20230210211551.18106-1-laurent.pinchart+renesas@ideasonboard.com>
 <Y+bAL06bDx83PHv2@oden.dyn.berto.se>
 <Y+bDFZrXtKnm3y1Q@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y+bDFZrXtKnm3y1Q@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

On 2023-02-11 00:20:05 +0200, Laurent Pinchart wrote:
> Hi Niklas,
> 
> On Fri, Feb 10, 2023 at 11:07:43PM +0100, Niklas Söderlund wrote:
> > Hi Laurent,
> > 
> > Thanks for your patch.
> > 
> > On 2023-02-10 23:15:51 +0200, Laurent Pinchart wrote:
> > > The Draak board has an ADV7180 CVBS decoder and an ADV7612 HDMI decoder,
> > > both connected to the same VIN input. DIP switches are used to select
> > > one of the two devices, with the CVBS decoder being the default. Add an
> > > overlay that selects the HDMI decoder.
> > > 
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > > ---
> > > 
> > > Niklas, would this be an acceptable way to handle the DIP switches on
> > > the Draak board ?
> > 
> > I think this is a perfect way to handle DIP switch settings. I have a 
> > similar patch for Eagle I wish to upstream one of these days.
> > 
> > For this patch, however correct it is, I have a comment. As part of the 
> > ongoing rebasing of BSP patches I'm preparing to submit a patch which 
> > makes the HDMI the default input for Draak. The BSP team have requested 
> > this as they wish to align all Gen3 boards to have HDMI as the default 
> > input.
> > 
> > Hence, this patch is awesome, but should be reversed to overlay RCA 
> > entablement :-)
> 
> Works for me. Would you mind taking this in your tree and reversing it
> on top of the patch that switches to HDMI by default ?

Will do.

> 
> > > ---
> > >  arch/arm64/boot/dts/renesas/Makefile          |  1 +
> > >  .../boot/dts/renesas/draak-hdmi-input.dtso    | 33 +++++++++++++++++++
> > >  2 files changed, 34 insertions(+)
> > >  create mode 100644 arch/arm64/boot/dts/renesas/draak-hdmi-input.dtso
> > > 
> > > diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
> > > index 0699b51c1247..de4170af611e 100644
> > > --- a/arch/arm64/boot/dts/renesas/Makefile
> > > +++ b/arch/arm64/boot/dts/renesas/Makefile
> > > @@ -88,4 +88,5 @@ dtb-$(CONFIG_ARCH_R9A07G054) += r9a07g054l2-smarc.dtb
> > >  dtb-$(CONFIG_ARCH_R9A09G011) += r9a09g011-v2mevk2.dtb
> > >  
> > >  dtb-$(CONFIG_ARCH_RCAR_GEN3) += draak-ebisu-panel-aa104xd12.dtbo
> > > +dtb-$(CONFIG_ARCH_RCAR_GEN3) += draak-hdmi-input.dtbo
> > >  dtb-$(CONFIG_ARCH_RCAR_GEN3) += salvator-panel-aa104xd12.dtbo
> > > diff --git a/arch/arm64/boot/dts/renesas/draak-hdmi-input.dtso b/arch/arm64/boot/dts/renesas/draak-hdmi-input.dtso
> > > new file mode 100644
> > > index 000000000000..e0d671f0cab3
> > > --- /dev/null
> > > +++ b/arch/arm64/boot/dts/renesas/draak-hdmi-input.dtso
> > > @@ -0,0 +1,33 @@
> > > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > > +/*
> > > + * Copyright 2023 Ideas on Board Oy
> > > + *
> > > + * Device tree overlay for the Draak board, to enable HDMI input. This requires
> > > + * setting DIP switches SW49, SW50, SW51 and SW52 to ON, and SW53 and SW54 to
> > > + * OFF.
> > > + */
> > > +
> > > +/dts-v1/;
> > > +/plugin/;
> > > +
> > > +&adv7612_out {
> > > +	remote-endpoint = <&vin4_in>;
> > > +};
> > > +
> > > +&i2c0 {
> > > +	composite-in@20 {
> > > +		ports {
> > > +			port@3 {
> > > +				/delete-node/ endpoint;
> > > +			};
> > > +		};
> > > +	};
> > > +};
> > > +
> > > +&vin4_in {
> > > +	remote-endpoint = <&adv7612_out>;
> > > +};
> > > +
> > > +&vin4_pins_cvbs {
> > > +	groups = "vin4_data24", "vin4_sync", "vin4_clk";
> > > +};
> 
> -- 
> Regards,
> 
> Laurent Pinchart

-- 
Kind Regards,
Niklas Söderlund
