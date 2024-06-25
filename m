Return-Path: <linux-renesas-soc+bounces-6753-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E474916EEF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Jun 2024 19:14:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A1CFB1C21FD7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Jun 2024 17:14:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90A1B176248;
	Tue, 25 Jun 2024 17:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="BjYb2B1A";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Fw9sCdOc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from wfout8-smtp.messagingengine.com (wfout8-smtp.messagingengine.com [64.147.123.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 452712F56;
	Tue, 25 Jun 2024 17:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719335694; cv=none; b=XFLfEJ8RgxWZa9mlpdeFqnZvm4FClUSvVZ8e+w+bhFFUjSw8oI4jzpj+0KvnZEyAYzGjknEmvaK6kitWOd7Ie15JIMgdIwXEPkv2b10BjMPwWLcOGQVaAjLCmRlIHrRT3nmsfsoCNza7b0ZSdOwFdkzy7OKMKg2u7jTK/lELAQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719335694; c=relaxed/simple;
	bh=Npyfl35hw2w96n/aADkT1s2ZpiCUXz3NPL2Z4h/25+E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I1bzZrJSSBVG8YB58fTdxjcX+SkAs3wI9PR7kzRefdJWOpTWsXFGQe4OKaqOrtIvyYohbqYJ9xqfRypoQ1vBKbyLmvftJP6LcA650x6/FajlYWW94mmLSM0FLITdSOId3R5jm7IUfFgVqgAJMT7pkal1fPWFJhd4FSA0PACmKtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=BjYb2B1A; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Fw9sCdOc; arc=none smtp.client-ip=64.147.123.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.west.internal (Postfix) with ESMTP id F39721C001DE;
	Tue, 25 Jun 2024 13:14:49 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Tue, 25 Jun 2024 13:14:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1719335689;
	 x=1719422089; bh=Hl7GY/4xYqA6mXXoQBPzoh6TE7xFgn/cLruf3Tr41HI=; b=
	BjYb2B1Av1YJukktj0gMBR9QgVs4P0LraZ0ee8Z4CygUfYMJjXoLarh5VMusR0UG
	zHq3XBjZzJYIQzLnhc1LnFJ0EPVWG6aaejt4iP7Ps9wignahVIRS84Rl3d3q0t2d
	uAfbKxSgMQLwxv0cG+NGeCXzKFw2NtvnHUjCqXF+dOOC05q2/U6tm4AHcnRg5Dth
	JRtfxr/RUgSyOZG84y2TmkqLjzziK1zkdX0+yUMgE85Im/AmUhIE0NhKjmnkVWxS
	LPD/V05i4sVHs8TsY7RxHI9Mjb1yssy+f0zqaupN8fvSi9yWgWu/6VDZWx5a5756
	J5t0N4Kazf9kZIU7EuIpgw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1719335689; x=
	1719422089; bh=Hl7GY/4xYqA6mXXoQBPzoh6TE7xFgn/cLruf3Tr41HI=; b=F
	w9sCdOcm1C3hjNvUzUtQA+RxgEMkQdfnxOHG1Fkl/Vfw289uWIDy8XvVFj5lkoVM
	mEKpDWsTE5hRxAsLYayusrSdKjTlrihi1XuIKyvNp6PVM6Kev4P+ZTBso85TjGzW
	HCgKBp2McxCUHRMk7QE4D+NcVIZvQQFwOc/VkJhdaGLQqod+Eq5ugSVUgUe0HZZu
	q5zcr+8pzCzV8UkYCBrb5bAVJtsjnWdiY+pCicW2yXkqWzuFuJHNZVuXBlCUNtDX
	MZkoSoebgctKRg0XHMw3vi/K3Sx1OhjQGoxY7dpJ6qEMQNCe9M/M2jKQ3pzP6xEq
	+XYtnF0pzlW9V/pju7Lqg==
X-ME-Sender: <xms:CPt6Zterx1648GYihASR70AnKZ5KddJNxF8b7dSWHZ1x4xoP-nXjwQ>
    <xme:CPt6ZrNwkeOy0MoB8Rl7YTKEUrb7afwOOr35l3trwZXtXNulF9UfDH1oltteredgD
    DlLQx5yeqw3hZcWC3k>
X-ME-Received: <xmr:CPt6ZmgmkqbyqIoW9iIOz8kvATL_spMlTQxjrHE_53j7Mm3Fqj6peBkn1Q2xs3_Zyrw8Q35KFJ1iAVasWkPzdstNotNM0r8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrtddtgdejkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeenucfhrhhomheppfhikhhl
    rghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvg
    hsrghssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepffekgfdukeeg
    hffhjeetvdeitdegteeikeffieduhfegveetjeevtdffvdekffdtnecuffhomhgrihhnpe
    hkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgr
    ihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrshesrhgrgh
    hnrghtvggthhdrshgv
X-ME-Proxy: <xmx:Cft6Zm82fxfekVh22szZ2eUavt-6uDmKsUMriFRTx6G_X-9eXqfmfg>
    <xmx:Cft6ZpurqfikOdnTodDc4xPjLlPI38iApq9C1r9uVZ3ARJnhkvQD5g>
    <xmx:Cft6ZlHvNW7HQMOAoA04lSBqG9aBidfkCznWMpD5K--YdP2ZzHE0Vg>
    <xmx:Cft6ZgM9Q7E9e0YaSALFMcr1acQmLklo_3WQ9JMw8JvaCiNY4x6gKQ>
    <xmx:Cft6Zti048hzPxppIp0FFEGmZ7w28eZXwiSSWcrUh__OuW6BNrS5G32u>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 25 Jun 2024 13:14:48 -0400 (EDT)
Date: Tue, 25 Jun 2024 19:14:45 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: renesas: white-hawk: ethernet: Define AVB1
 and AVB2 PHY
Message-ID: <20240625171445.GF3655345@ragnatech.se>
References: <20240625133008.2638902-1-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdVXGP_x1aoTqCfYo=axnEqGCncJ-HRckqzwNjX1+wxf9w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdVXGP_x1aoTqCfYo=axnEqGCncJ-HRckqzwNjX1+wxf9w@mail.gmail.com>

Hi Geert,

On 2024-06-25 16:54:38 +0200, Geert Uytterhoeven wrote:
> Hi Niklas,
> 
> On Tue, Jun 25, 2024 at 3:31 PM Niklas Söderlund
> <niklas.soderlund+renesas@ragnatech.se> wrote:
> > Align with other Renesas SoCs and use the specific compatible for the
> > PHYs connected to AVB1 and AVB2, Marvell 88Q2110/QFN40. This allows
> > software to identify the PHY model at any time, regardless of the state
> > of the PHY reset line.
> >
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> 
> Thanks for your patch!
> 
> > --- a/arch/arm64/boot/dts/renesas/white-hawk-ethernet.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/white-hawk-ethernet.dtsi
> > @@ -27,7 +27,8 @@ mdio {
> >                 reset-post-delay-us = <4000>;
> >
> >                 avb1_phy: ethernet-phy@0 {
> > -                       compatible = "ethernet-phy-ieee802.3-c45";
> > +                       compatible = "ethernet-phy-id002b.0980",
> > +                                    "ethernet-phy-ieee802.3-c22";
> >                         reg = <0>;
> >                         interrupt-parent = <&gpio6>;
> >                         interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
> > @@ -49,7 +50,8 @@ mdio {
> >                 reset-post-delay-us = <4000>;
> >
> >                 avb2_phy: ethernet-phy@0 {
> > -                       compatible = "ethernet-phy-ieee802.3-c45";
> > +                       compatible = "ethernet-phy-id002b.0980",
> > +                                    "ethernet-phy-ieee802.3-c22";
> >                         reg = <0>;
> >                         interrupt-parent = <&gpio5>;
> >                         interrupts = <4 IRQ_TYPE_LEVEL_LOW>;
> 
> Originally, I added explicit ethernet-phy-id* compatible values because
> Linux does not deassert the reset line before trying to read the PHY
> ID, hence failing.  Have you checked if this is still the case after
> introducing the mdio subnode?  I'd rather not add the explicit IDs,
> as board manufacturers may change the PHY revision or even the PHY
> model without notice.
> 
> You can find my original test procedure, using kexec or bind/rebind, at
> https://lore.kernel.org/cover.1631174218.git.geert+renesas@glider.be/.

Indeed the mdio subnode reset do the trick without needing to hardcode 
the PHY compatible. At lest for RAVB, for the RTSN we still need to 
hardcode it as RTSN cant talk C45 when probing the PHY.

Anyhow this patch can be dropped.

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

-- 
Kind Regards,
Niklas Söderlund

