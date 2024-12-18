Return-Path: <linux-renesas-soc+bounces-11517-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5749F605B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Dec 2024 09:44:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AB2F21885B65
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Dec 2024 08:44:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BC3418B46A;
	Wed, 18 Dec 2024 08:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="E6LWxAdG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE41814F9E2;
	Wed, 18 Dec 2024 08:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734511445; cv=none; b=H8im20ys99Rj4sFrEed6IU4D4Acqe1iC7k325G2y7ZkZPJJsifZcGOs15T6o17Zy/+KBoSThTBaaOLiCj6wfPvQZf8ee4Vc2JLBS6EQb8uNoxyDu/EnJ36bBy+wwxOH8w2kD1KRCijtS1QVozbslAyIllno88gb76/9fz27Jslo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734511445; c=relaxed/simple;
	bh=onSRFXQ2jL05vwDlih9bM+tXUQP5XIYzSp35Ag1O79s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gOstl2ly8oxsMrnhf5Qm/txe3Bv0exGmiUINTP/0z8EuCxSyDO5at5dkS4udZd2gsCLM4UwacANYiUJjAbLfllS3I2NCgHjb8/zPbwsf1Tv6PemZqpHNH3yil6Pbx14mgR7VZSgKyKsG5TtaUmwMVFgtHiLxFebu71gNFobL/+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=E6LWxAdG; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9F54659D;
	Wed, 18 Dec 2024 09:43:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1734511402;
	bh=onSRFXQ2jL05vwDlih9bM+tXUQP5XIYzSp35Ag1O79s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E6LWxAdGOAecfRfkLATcW4U4WvGWQ0BWY0VndY2EnBTiGD3Tzl8GF6Od99TQ+dDZG
	 Dq8v95pnqbOhkUonxJh3TdK//pzLjIlM23VsIKrJi18i9OIzh1Ub9Bx3+oT1XpKMkI
	 DJShLoXC+arx6kgI6zjtEYtj5LOajhSrWBS5TK9k=
Date: Wed, 18 Dec 2024 09:43:57 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 4/4] arm64: dts: renesas: r8a779g0: Add VSPX instances
Message-ID: <hscqyt5ybswnc5azc2anto4vfm7qg6y2o45gxwioi3upt72bqb@g32ybb3r7utv>
References: <20241217-rcar-v4h-vspx-v1-0-de04ea044ed4@ideasonboard.com>
 <20241217-rcar-v4h-vspx-v1-4-de04ea044ed4@ideasonboard.com>
 <20241217234215.GQ23470@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241217234215.GQ23470@pendragon.ideasonboard.com>

Hi Laurent

On Wed, Dec 18, 2024 at 01:42:15AM +0200, Laurent Pinchart wrote:
> Hi Jacopo,
>
> Thank you for the patch.
>
> On Tue, Dec 17, 2024 at 06:53:17PM +0100, Jacopo Mondi wrote:
> > Add device nodes for the VSPX instances on R-Car V4H (R8A779G0) SoC.
> >
> > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > ---
> >  arch/arm64/boot/dts/renesas/r8a779g0.dtsi | 22 ++++++++++++++++++++++
> >  1 file changed, 22 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> > index e49748563e2f5706ed982d6c9cc1df59f27bd0dc..bf4ec5fb7bbdba55e2994f332fcbd623839079c2 100644
> > --- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> > @@ -2211,6 +2211,28 @@ vspd1: vsp@fea28000 {
> >  			renesas,fcp = <&fcpvd1>;
> >  		};
> >
> > +		vspx0: vsp@fedd0000 {
>
> Please keep those sorted by unit address too.
>
> > +			compatible = "renesas,vsp2";
> > +			reg = <0 0xfedd0000 0 0x8000>;
> > +			interrupts = <GIC_SPI 556 IRQ_TYPE_LEVEL_HIGH>;
>
> The interrupts are listed as "negative level sensitive" in the
> documentation. Tomi encountered a similar situation with the V4M VSP,
> and setting the level to low in the DT didn't work. I assume this will
> be fine, but if you encounter interrupt issues, this is one possible
> area to investigate.

Yes, I noticed that the documentation says "negative", but I've done
the same here as it's done for the VSPD instances (which are equally
documented as negative), assuming that path had been tested.

>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Thanks
  j

>
> > +			clocks = <&cpg CPG_MOD 1028>;
> > +			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
> > +			resets = <&cpg 1028>;
> > +
> > +			renesas,fcp = <&fcpvx0>;
> > +		};
> > +
> > +		vspx1: vsp@fedd8000 {
> > +			compatible = "renesas,vsp2";
> > +			reg = <0 0xfedd8000 0 0x8000>;
> > +			interrupts = <GIC_SPI 557 IRQ_TYPE_LEVEL_HIGH>;
> > +			clocks = <&cpg CPG_MOD 1029>;
> > +			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
> > +			resets = <&cpg 1029>;
> > +
> > +			renesas,fcp = <&fcpvx1>;
> > +		};
> > +
> >  		du: display@feb00000 {
> >  			compatible = "renesas,du-r8a779g0";
> >  			reg = <0 0xfeb00000 0 0x40000>;
>
> --
> Regards,
>
> Laurent Pinchart

