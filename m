Return-Path: <linux-renesas-soc+bounces-5346-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8DB8C4138
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 May 2024 14:57:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E2B072824D5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 May 2024 12:57:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8231314F9E5;
	Mon, 13 May 2024 12:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="sUAdA6ey";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="IwIdMGmn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from wfhigh8-smtp.messagingengine.com (wfhigh8-smtp.messagingengine.com [64.147.123.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A17E1474BC;
	Mon, 13 May 2024 12:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715605033; cv=none; b=Y7ih2j9KfoHTQqo1AYTU7W6wlxYUtkit3oliY9+F0bDJ/xeJNeTgb4j06PkBUnnAaNg8GE4DFMvP4//1A5HtChTWdugW8P9yKMQC96AzpKE41cPmaIGH093lnyw/VpAGs7mdqZjrQk6ppYPPJhAZ5ZNClbCMXvSFoGFlLvG2gM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715605033; c=relaxed/simple;
	bh=+GNZf28PofIFT5n5ee38b/HcHmyHY6lo6gSjXwsErUs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tEATrIxcMP9qQB/DLfdOItAzxATB7wZW6j9xSaAPIjwdAwN/qpQxQeiAYIHFLd7wDCnYTp+xzK+rZn6mPcXPqglno/89tgSTuKxYbL1MPpQw1i/I8lD2x+KQ+Raq64DPY6i5iiNNz9OK2WBzMtG+ZjDD5/qzARDwAwDt+EqZFGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=sUAdA6ey; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=IwIdMGmn; arc=none smtp.client-ip=64.147.123.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfhigh.west.internal (Postfix) with ESMTP id CCBF51800130;
	Mon, 13 May 2024 08:57:07 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Mon, 13 May 2024 08:57:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1715605027;
	 x=1715691427; bh=6EzH73lYWVsQKOti6kgTHxLFo17wXjeHjk+3Qb8Ba78=; b=
	sUAdA6eyNm/njT7hUUEdIwLfDfOxfedMnCDt00RJi6BBTCVLFDTRe/bHkGJ/ukrz
	XRyFVf7Rvoc+94nko0YoU1ElqPanc3FpOAIDpKLALKfGdNlUO05wK2xfGmVgC3TI
	T5SlHf/2bDLL/+JUUtA0bCoXNolDmM7yTZbjtJk+n2aIfiNrGbohVsDl2a2WNUQb
	dVnRJk+tNVz1XUQwi0+NGMFswURhlzejsTzEjQJPbmf3f+Lx4FRo65BM5ZjqIdff
	6fdcHjDouZOp4uZiHRwL0Gjqqqqxci5Yst9XNymq8fQsaIB4jQ9FIqTPmuPOYX9U
	XGU9/7v+W4qoFfvHKos1sA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1715605027; x=
	1715691427; bh=6EzH73lYWVsQKOti6kgTHxLFo17wXjeHjk+3Qb8Ba78=; b=I
	wIdMGmniEG396+hbxtOl5GG/+2PDXEOUdQmo65KnK81XB5z+tUpRpDiYaQNRQU8t
	Em7FZOCNU1Q3iyzmrBvyl/9LBX0etBC4hI82+3UxiUygdYQ2fu962zaqc3mDc0aZ
	XuGp7C1JOA2BivsRCWOLT+dinOVLJvUVPYzg7O25oj0GjJxNXzjDtSoPltG8wrkw
	Wj6KcMqu8SsHrhu6ONHfaoMM21HrXA5xxyprkcjPCeu8e0HcRmdbh+UcJ/rCz0r1
	jPMRY2l0SsgbqGYL5EUhg5/iMrKeO/HCfg/dGJEDXanFc3o1P6FFL2/K71/ZS0fV
	eZDsWKz6fQPnOIDIHKYhA==
X-ME-Sender: <xms:Iw5CZiQgrM6qLk8DJarMWSKJ5bxvX4Q4ZoseDIf_usB7oJFEcEHXDg>
    <xme:Iw5CZnwjUMXvValFo_iHr9Dwl4AuVlF3KDOp7UicPO1rOT-vjwttgUqaMQdtg2CAy
    y4R93sPOFBoKFpKeDs>
X-ME-Received: <xmr:Iw5CZv3bsDiqXV_exzuAjjW9uG_GFNPJT6LC3k8d1dLNJaCW6ROGsQUZ_8HF5_P2NxZt-xhG70snL6g0RV_1PPOWCa_pqQU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdeggedgheejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhk
    lhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnh
    gvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeefhfellefh
    ffejgfefudfggeejlefhveehieekhfeulefgtdefueehffdtvdelieenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggv
    rhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:Iw5CZuBkEoE3DA1gqqIdYvW3IoZbDO060y4_s_qJ9DevWEiJJUng1w>
    <xmx:Iw5CZrj3OfYoZERoHIlE_l4XVDLj0ySTnUHTH3xhB3MPjlc5peebnw>
    <xmx:Iw5CZqplxFkhbjERqy3sPihj20omA4CiFKlZWKfBHcoER4wrqNVZ2w>
    <xmx:Iw5CZuiWS0MUTU2pXiO0UaDY3WxobjetqIne6sfaXGFd2YalIV8bEQ>
    <xmx:Iw5CZqN9Cr3T6GAyDKdczJY5JCcheElzJrsXEH4YQkxoESo5lZnb2fkv>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 13 May 2024 08:57:06 -0400 (EDT)
Date: Mon, 13 May 2024 14:56:58 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert@linux-m68k.org>, Andrew Lunn <andrew@lunn.ch>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev <netdev@vger.kernel.org>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [net-next,v5] net: ethernet: rtsn: Add support for Renesas
 Ethernet-TSN
Message-ID: <20240513125658.GB3015543@ragnatech.se>
References: <20240509210903.3738334-1-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdWY-Ewm_ke6LxF1cpqQEdL3AnumyNKcTWvpFBJW_8wXJA@mail.gmail.com>
 <20240513100931.GA3015543@ragnatech.se>
 <CAMuHMdVF-szo7An5rXEahmZMu3RAzo6krSnU-qsgtNL0a-NrSg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdVF-szo7An5rXEahmZMu3RAzo6krSnU-qsgtNL0a-NrSg@mail.gmail.com>

Hi Geert, Andrew,

On 2024-05-13 13:44:22 +0200, Geert Uytterhoeven wrote:
> Hi Niklas,
> 
> On Mon, May 13, 2024 at 12:09 PM Niklas Söderlund
> <niklas.soderlund+renesas@ragnatech.se> wrote:
> > On 2024-05-13 11:39:54 +0200, Geert Uytterhoeven wrote:
> > > On Thu, May 9, 2024 at 11:10 PM Niklas Söderlund
> > > <niklas.soderlund+renesas@ragnatech.se> wrote:
> > > > Add initial support for Renesas Ethernet-TSN End-station device of R-Car
> > > > V4H. The Ethernet End-station can connect to an Ethernet network using a
> > > > 10 Mbps, 100 Mbps, or 1 Gbps full-duplex link via MII/GMII/RMII/RGMII.
> > > > Depending on the connected PHY.
> > > >
> > > > The driver supports Rx checksum and offload and hardware timestamps.
> > > >
> > > > While full power management and suspend/resume is not yet supported the
> > > > driver enables runtime PM in order to enable the module clock. While
> > > > explicit clock management using clk_enable() would suffice for the
> > > > supported SoC, the module could be reused on SoCs where the module is
> > > > part of a power domain.
> > > >
> > > > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > > > ---
> > > > * Changes since v4
> > > > - Enable GPOUT_RDM and GPOUT_TDM delays depending on phy-mode.
> > >
> > > Thanks for the update!
> > >
> > > > +static void rtsn_set_delay_mode(struct rtsn_private *priv)
> > > > +{
> > > > +       u32 val = 0;
> > > > +
> > > > +       /* The MAC is capable of applying a delay on both Rx and Tx. Each
> > > > +        * delay can either be on or off, there is no way to set its length.
> > > > +        *
> > > > +        * The exact delay applied depends on electric characteristics of the
> > > > +        * board. The datasheet describes a typical Rx delay of 1800 ps and a
> > > > +        * typical Tx delay of 2000 ps.
> > > > +        *
> > > > +        * There are boards where the RTSN device is used together with PHYs
> > > > +        * who do not support a large enough internal delays to function. These
> > > > +        * boards depends on the MAC applying these inexact delays.
> > > > +        */
> > > > +
> > > > +       /* If the phy-mode is rgmii or rgmii-rxid apply Rx delay on the MAC */
> > > > +       if (priv->iface == PHY_INTERFACE_MODE_RGMII_ID ||
> > > > +           priv->iface == PHY_INTERFACE_MODE_RGMII_RXID)
> > > > +               val |= GPOUT_RDM;
> > > > +
> > > > +       /* If the phy-mode is rgmii or rgmii-txid apply Tx delay on the MAC */
> > > > +       if (priv->iface == PHY_INTERFACE_MODE_RGMII_ID ||
> > > > +           priv->iface == PHY_INTERFACE_MODE_RGMII_TXID)
> > > > +               val |= GPOUT_TDM;
> > > > +
> > > > +       rtsn_write(priv, GPOUT, val);
> > > > +}
> > >
> > > > +static int rtsn_phy_init(struct rtsn_private *priv)
> > > > +{
> > > > +       struct device_node *np = priv->ndev->dev.parent->of_node;
> > > > +       struct phy_device *phydev;
> > > > +       struct device_node *phy;
> > > > +       phy_interface_t iface;
> > > > +
> > > > +       /* Delays, if any, are applied by the MAC. Mask RGMII mode passed to the
> > > > +        * PHY to avoid it also adding the delay.
> > > > +        */
> > > > +       switch (priv->iface) {
> > > > +       case PHY_INTERFACE_MODE_RGMII:
> > > > +       case PHY_INTERFACE_MODE_RGMII_ID:
> > > > +       case PHY_INTERFACE_MODE_RGMII_RXID:
> > > > +       case PHY_INTERFACE_MODE_RGMII_TXID:
> > > > +               iface = PHY_INTERFACE_MODE_RGMII;
> > > > +               break;
> > > > +       default:
> > > > +               iface = priv->iface;
> > > > +               break;
> > > > +       }
> > >
> > > This introduces the same issues (the "workaround" state below) we had
> > > with ravb before.
> > > 9b23203c32ee02cd ("ravb: Mask PHY mode to avoid inserting delays twice")
> > > was the workaround,
> > > a6f51f2efa742df0 ("ravb: Add support for explicit internal clock delay
> > > configuration")
> > > was the final fix.
> > >
> > > Do we really want to repeat that mistake?
> >
> > Is it the same issue?
> 
> Sort of: you end up in a state similar to between the two commits fixing
> the issue on ravb.
> 
> > The RAVB issue is around PHY drivers adjusting
> > delays based on [rt]xc-skew-ps properties. The RTSN bindings only deal
> > with {rx,tx}-internal-delay-ps properties.
> >
> > After a discussion with Andrew my understanding is that the PHY shall
> > not attempt to add any delays from {rx,tx}-internal-delay-ps properties
> > if the phy-mode used in of_phy_connect() is PHY_INTERFACE_MODE_RGMII. As
> > we mask the phy-mode here the PHY shall never attempt to add delays as
> > we deal with that in the MAC.
> >
> > It feels like I missed something? Sorry if I'm confused.
> 
> The PHY never applies the {rx,tx}-internal-delay-ps properties, as
> these are meant for the MAC (cfr. "internal").
> The PHY does apply the "*-skew-ps" properties.
> 
> If you mask any *ID part from the phy_interface_t, you lose the ability
> to let the PHY apply any additional delay.
> 
> We have several boards that use both the internal MAC delay and
> the PHY skew properties.

I understand and this make sens to me. But it is in direct contrast to 
what Andrew and I have iterated in previous versions of this driver.

If I understand you correctly Geert, you suggest I should modify the 
driver to

1. Have the MAC (RTSN driver) apply Rx and/or Tx delays based on the 
   {rx,tx}-internal-delay-ps properties.

2. Not mask the phy-mode and pass it as is to of_phy_connect() as the 
   PHY driver will act only on [rt]xc-skew-ps properties and always 
   ignore any {rx,tx}-internal-delay-ps properties.

This allows both the MAC and PHY driver to apply delays independently of 
each other.

While if I understand Andrew correctly (and this is what the RTSN driver 
tries to do in this version) is

1. Have the MAC (RTSN driver) apply Rx and/or Tx delays based on the 
   phy-mode. Add Rx+Rx if rgmii-id, Rx if rgmii-rxid, Tx if rgmii-txid.

2. Mask the phy-mode passed to of_phy_connect() to always be 
   PHY_INTERFACE_MODE_RGMII if a rgmii phy-mode is in use. This is done 
   as the MAC driver will always apply the delay and the PHY should 
   never add a delay on its own.

3. The [rt]xc-skew-ps properties are not consider at all in this 
   solution.

It is not possible to implement both proposed solutions I'm afraid. I 
prefers Geert's solution and this is what was done in earlier versions 
and this would align the behavior of the Renesas Ethernet driver if 
nothing else. But in conversation with Andrew in earlier versions of 
this series have moved to solution 2 as this seemed like the correct way 
of doing things.

At this point I'm confused on which approach to use. @Andrew and @Geert 
how do you guys propose we align the two ?

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

