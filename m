Return-Path: <linux-renesas-soc+bounces-21346-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 114F2B44080
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 17:25:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 379DE1C864CC
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 15:26:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32F4F2522A7;
	Thu,  4 Sep 2025 15:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="hswTf+9y"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 726B323BD00;
	Thu,  4 Sep 2025 15:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756999518; cv=none; b=LHmTzGiHl1ai2fKvIHGW2Bodr2C9nHTUhRL5FN8cAIHklXSFid9CFSIxq0fbQy+AjnqToRmpfH7316EoWLIeJSH3JF/qlymRLBrQq8EzMCxhRGO9giEo2U5M5ykpidYE0KNFNPbAjkn0Zdpd3Om8eROUE2mGiWDBrCYpthAPIaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756999518; c=relaxed/simple;
	bh=/1s3A0/1oBRPiM9eEOONTjAK8lc6tIfcMEkuSsvZEvY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SWWHHSYJIp+PEC7p+QnRvmiOdpQPMJxRywEfymbUEQB31YbL7Uos1tttq7yNfYI2bnG1LdltQzyY3g/uXcEoNKanoJTsbJ90PjmVE7gyQd/rXH5sFwCsPvtYCQoA7K/zgaWZdvqJBdngbv7zceBH1eIDJ3gMoDJ+vpvxbeEqI9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=hswTf+9y; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (230.215-178-91.adsl-dyn.isp.belgacom.be [91.178.215.230])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 313DDF09;
	Thu,  4 Sep 2025 17:24:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1756999445;
	bh=/1s3A0/1oBRPiM9eEOONTjAK8lc6tIfcMEkuSsvZEvY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hswTf+9y9UmB4SW/1NT0RfARopIG6TZ/RjY+p43TkroKJop2mUKxtDRSSLL+PBzHe
	 EPbW+6puxdLcsoLXSc0s6vyM8AOnLrUoQOe0b7f2X40zKWGQJXDBmtyeuJMAl/Asvw
	 rouNayHuUAH+ssOyy5YXVHxEIhrkB/Nq3WBC/TZo=
Date: Thu, 4 Sep 2025 17:24:52 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 1/4] arm64: dts: renesas: sparrow-hawk: Add overlay
 for IMX219 on J1
Message-ID: <20250904152452.GD6174@pendragon.ideasonboard.com>
References: <20250827221424.640770-1-niklas.soderlund+renesas@ragnatech.se>
 <20250827221424.640770-2-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdUOKJXjk78Bgmazd4prGX21SDk_h=37ewEOwgdf9iAfcA@mail.gmail.com>
 <20250901140657.GA481255@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250901140657.GA481255@ragnatech.se>

On Mon, Sep 01, 2025 at 04:06:57PM +0200, Niklas Söderlund wrote:
> On 2025-09-01 16:03:49 +0200, Geert Uytterhoeven wrote:
> > On Thu, 28 Aug 2025 at 00:15, Niklas Söderlund wrote:
> > > Add an overlay to connect an IMX219 camera sensor to the J1 connector.
> > > The IMX219 utilizes 2 CSI-2 D-PHY lanes. This enables the video capture
> > > pipeline behind the CSI40 Rx to be enabled to process images from the
> > > sensor.
> > >
> > > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > > ---
> > > * Changes since v3
> > > - Use correct port@0 instead of port.
> > 
> > Thanks for the update!
> > 
> > > --- a/arch/arm64/boot/dts/renesas/Makefile
> > > +++ b/arch/arm64/boot/dts/renesas/Makefile
> > > @@ -96,7 +96,10 @@ dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g2-white-hawk-single-ard-audio-da7212.dtb
> > >
> > >  DTC_FLAGS_r8a779g3-sparrow-hawk += -Wno-spi_bus_bridge
> > >  dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk.dtb
> > > +dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-camera-j1-imx219.dtbo
> > >  dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-fan-pwm.dtbo
> > > +r8a779g3-sparrow-hawk-camera-j1-imx219-dtbs := r8a779g3-sparrow-hawk.dtb r8a779g3-sparrow-hawk-camera-j1-imx219.dtbo
> > > +dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-camera-j1-imx219.dtb
> > >  r8a779g3-sparrow-hawk-fan-pwm-dtbs := r8a779g3-sparrow-hawk.dtb r8a779g3-sparrow-hawk-fan-pwm.dtbo
> > >  dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-fan-pwm.dtb
> > 
> > Usually we keep the related parts together, but we indeed already have
> > one case of interleaving.  I am not sure which style is best...
> 
> I have no real preference. The style here is only me trying to mimic 
> what I seen elsewhere in the file. Want me to switch to the other style?

I don't mind much either way either. The patch series looks good to me,
I think it can be merged once we decide on a style.

-- 
Regards,

Laurent Pinchart

