Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9CA1B692A07
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Feb 2023 23:20:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233497AbjBJWUe (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 10 Feb 2023 17:20:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233416AbjBJWUd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Feb 2023 17:20:33 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17E637F836;
        Fri, 10 Feb 2023 14:20:10 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id F293F886;
        Fri, 10 Feb 2023 23:20:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1676067608;
        bh=ZXDVGIVpE5DOcbnK6JCPmnTNZMUsSwv3qOSAG4I8gNQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Jr4UJzwSm2hOOnUfQGYBnKEKA4l5fftr+ThsEXwbvKL5rwWksfRqnjOOF/kYrSSi3
         03NY1llYCtopNf9yc+adssvkYlXnGj3NSiJe6PUUyS4JYwccr29vVCeIse1AqmLMKA
         LaAShkWRi8z6Xazy+4WUQ58rrVbQsiaXPZi4hFlo=
Date:   Sat, 11 Feb 2023 00:20:05 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH/RFC] arm64: dts: renesas: draak: Add overlay for HDMI
 input
Message-ID: <Y+bDFZrXtKnm3y1Q@pendragon.ideasonboard.com>
References: <20230210211551.18106-1-laurent.pinchart+renesas@ideasonboard.com>
 <Y+bAL06bDx83PHv2@oden.dyn.berto.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y+bAL06bDx83PHv2@oden.dyn.berto.se>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Niklas,

On Fri, Feb 10, 2023 at 11:07:43PM +0100, Niklas Söderlund wrote:
> Hi Laurent,
> 
> Thanks for your patch.
> 
> On 2023-02-10 23:15:51 +0200, Laurent Pinchart wrote:
> > The Draak board has an ADV7180 CVBS decoder and an ADV7612 HDMI decoder,
> > both connected to the same VIN input. DIP switches are used to select
> > one of the two devices, with the CVBS decoder being the default. Add an
> > overlay that selects the HDMI decoder.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > ---
> > 
> > Niklas, would this be an acceptable way to handle the DIP switches on
> > the Draak board ?
> 
> I think this is a perfect way to handle DIP switch settings. I have a 
> similar patch for Eagle I wish to upstream one of these days.
> 
> For this patch, however correct it is, I have a comment. As part of the 
> ongoing rebasing of BSP patches I'm preparing to submit a patch which 
> makes the HDMI the default input for Draak. The BSP team have requested 
> this as they wish to align all Gen3 boards to have HDMI as the default 
> input.
> 
> Hence, this patch is awesome, but should be reversed to overlay RCA 
> entablement :-)

Works for me. Would you mind taking this in your tree and reversing it
on top of the patch that switches to HDMI by default ?

> > ---
> >  arch/arm64/boot/dts/renesas/Makefile          |  1 +
> >  .../boot/dts/renesas/draak-hdmi-input.dtso    | 33 +++++++++++++++++++
> >  2 files changed, 34 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/renesas/draak-hdmi-input.dtso
> > 
> > diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
> > index 0699b51c1247..de4170af611e 100644
> > --- a/arch/arm64/boot/dts/renesas/Makefile
> > +++ b/arch/arm64/boot/dts/renesas/Makefile
> > @@ -88,4 +88,5 @@ dtb-$(CONFIG_ARCH_R9A07G054) += r9a07g054l2-smarc.dtb
> >  dtb-$(CONFIG_ARCH_R9A09G011) += r9a09g011-v2mevk2.dtb
> >  
> >  dtb-$(CONFIG_ARCH_RCAR_GEN3) += draak-ebisu-panel-aa104xd12.dtbo
> > +dtb-$(CONFIG_ARCH_RCAR_GEN3) += draak-hdmi-input.dtbo
> >  dtb-$(CONFIG_ARCH_RCAR_GEN3) += salvator-panel-aa104xd12.dtbo
> > diff --git a/arch/arm64/boot/dts/renesas/draak-hdmi-input.dtso b/arch/arm64/boot/dts/renesas/draak-hdmi-input.dtso
> > new file mode 100644
> > index 000000000000..e0d671f0cab3
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/renesas/draak-hdmi-input.dtso
> > @@ -0,0 +1,33 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +/*
> > + * Copyright 2023 Ideas on Board Oy
> > + *
> > + * Device tree overlay for the Draak board, to enable HDMI input. This requires
> > + * setting DIP switches SW49, SW50, SW51 and SW52 to ON, and SW53 and SW54 to
> > + * OFF.
> > + */
> > +
> > +/dts-v1/;
> > +/plugin/;
> > +
> > +&adv7612_out {
> > +	remote-endpoint = <&vin4_in>;
> > +};
> > +
> > +&i2c0 {
> > +	composite-in@20 {
> > +		ports {
> > +			port@3 {
> > +				/delete-node/ endpoint;
> > +			};
> > +		};
> > +	};
> > +};
> > +
> > +&vin4_in {
> > +	remote-endpoint = <&adv7612_out>;
> > +};
> > +
> > +&vin4_pins_cvbs {
> > +	groups = "vin4_data24", "vin4_sync", "vin4_clk";
> > +};

-- 
Regards,

Laurent Pinchart
