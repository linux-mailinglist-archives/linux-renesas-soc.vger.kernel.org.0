Return-Path: <linux-renesas-soc+bounces-5336-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA588C3EA0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 May 2024 12:09:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C90BD1F2178B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 May 2024 10:09:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD637149C6B;
	Mon, 13 May 2024 10:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="FRv0TM26";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="E0bFYqaZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh6-smtp.messagingengine.com (fhigh6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C735A2E3E0;
	Mon, 13 May 2024 10:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715594981; cv=none; b=LHvWAe4riIrfWiIZeJhE2l6BKPNnxId6v5qDQbU1Fgy73OhVj94f276Ctsb8a1nM4mzuJfGWwf6BT00k+/VfrYohPx5oUH880EOBM0PatQIYLgtDRik6yXCfZPVkYpIvwuTblo/1ug/Bo4D0yotemKnHpkH41CpCV2/mraEHQYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715594981; c=relaxed/simple;
	bh=hDnXZ4qDSqYWfy+Ba8BfiKy7IhldpymvxfJ++GafFlU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U4NC94QQN1/8NEVOdkR4VZiLBZQtodbQP0jqr4d0iLQ2PDpfshFiaEEQwwxumTvpzhQW3/0V6kGYNJFQG48hzKi89URePnpuffcC17fHgWK4uGvI4dQTRsovBTrLVRAYSw4Ysh5P9E6KDN4wiijRsAeG8I57D6QhvjmSA0JiUOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=FRv0TM26; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=E0bFYqaZ; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 645031140165;
	Mon, 13 May 2024 06:09:35 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Mon, 13 May 2024 06:09:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1715594975;
	 x=1715681375; bh=QU+h1NKsbtHmWly9Pqp+Z0Pthc5yhsdfytLqJyXQ/0s=; b=
	FRv0TM26xcEkKOmD66qssTFubwA1D2hwLWQsTe7JvWrJDkytZBuqw/EDQWQ0b7ls
	bKSTiinKzq7DQvxQN5sgxKgHT8hJlACrjQf2LFDvSXlr2LVS6qW5OVjstlEsiUmM
	RXARk6Ms7QhztI5k2Jfv1Fk4RgejxNHGH3jJuTJZ6cWjT4La/+oy/lxOA77mbzLJ
	xaaGWtYMA/3Qx0B0Z441ULsbi/Rw+HR/K1uWjEvn6OE+WX6YtwJbrqfcqzgsF1Y9
	jG/6PmGuyJq/NWeT0LSER1tUzXFvOGRRKL7dscBsD58GqQsloaNEf3nsCSI7iFLu
	nbdY/M7aXRaJ+efENwvs8w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1715594975; x=
	1715681375; bh=QU+h1NKsbtHmWly9Pqp+Z0Pthc5yhsdfytLqJyXQ/0s=; b=E
	0bFYqaZwSy0gRpv7g916BSG1SNRsdx7goFtQErPwVcoFlNWj61QUTik04UOimV1u
	/9IcMFiJh2Zisf1dtHdrFyNrBygI6LBq0V/wzF8QMynMKk/NQnd0CJvE9bkylwf3
	YW9TfVkTAHnYkDzGEKOD3ZiQMBleflMI/sThqd4wxTXU9yCR4rLIEPvfGHV/eWs1
	XIbrRmyLrJHm8fmi4iHS7cZoABSuQUYPrkeiPBJe/CY7NV2TKdkOk6mBOf+rsb5T
	qPJu8cBLwn5nVGJ0sS94AN50N1JPm2IFLMuFQmVH+XojIL5OnhHKxJf9ExuGpE/4
	5Xa2S/OtCczaFKPpROK2g==
X-ME-Sender: <xms:3uZBZhX1Ss9bC6hCVneivsXsbarD5JXjfx9tLfyB15OTMMLiIkd54Q>
    <xme:3uZBZhlUbQhaRORqen4-AB8l8sQ98uZ6xBDo4CSLW0Gr2z1xhseTNELTty_YFUPuR
    d0WuKPR_OxckkkY8oQ>
X-ME-Received: <xmr:3uZBZtach_zZK8zSRF0dafw1EK8MeRSbmdy44wdnljUesIiQttJwcrlJIOiRmKNUlZKpUhw4Ytv8KyA5nfT2Js8otSrNG2k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdeggedgvdegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhk
    lhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnh
    gvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeefhfellefh
    ffejgfefudfggeejlefhveehieekhfeulefgtdefueehffdtvdelieenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggv
    rhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:3uZBZkV30coFi7w0CYglV0Nwb7UbJ_KqkrcpAPMd_LlnujZ3c2VaiA>
    <xmx:3uZBZrmKN5KbFYrOlqWf6sTGMoLaah-owuD2jOa0tJPNyAHguKSnbg>
    <xmx:3uZBZhfjuvlEHtzyL-t0jR2i91LRXwrsho6n1-xJ3pL2kfcE51OSjQ>
    <xmx:3uZBZlHsavqOX9rk2pB3p98lp45m5RH3bLxo-AmY4s8mcChESpa78w>
    <xmx:3-ZBZkjzdipDxzLgCqAeY4ZJOGTLTgBMfZ_KBjWFVrGcXeVmR5LWByHZ>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 13 May 2024 06:09:34 -0400 (EDT)
Date: Mon, 13 May 2024 12:09:31 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev <netdev@vger.kernel.org>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [net-next,v5] net: ethernet: rtsn: Add support for Renesas
 Ethernet-TSN
Message-ID: <20240513100931.GA3015543@ragnatech.se>
References: <20240509210903.3738334-1-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdWY-Ewm_ke6LxF1cpqQEdL3AnumyNKcTWvpFBJW_8wXJA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdWY-Ewm_ke6LxF1cpqQEdL3AnumyNKcTWvpFBJW_8wXJA@mail.gmail.com>

Hi Geert,

Thanks for your feedback.

On 2024-05-13 11:39:54 +0200, Geert Uytterhoeven wrote:
> Hi Niklas, Andrew,
> 
> On Thu, May 9, 2024 at 11:10 PM Niklas Söderlund
> <niklas.soderlund+renesas@ragnatech.se> wrote:
> > Add initial support for Renesas Ethernet-TSN End-station device of R-Car
> > V4H. The Ethernet End-station can connect to an Ethernet network using a
> > 10 Mbps, 100 Mbps, or 1 Gbps full-duplex link via MII/GMII/RMII/RGMII.
> > Depending on the connected PHY.
> >
> > The driver supports Rx checksum and offload and hardware timestamps.
> >
> > While full power management and suspend/resume is not yet supported the
> > driver enables runtime PM in order to enable the module clock. While
> > explicit clock management using clk_enable() would suffice for the
> > supported SoC, the module could be reused on SoCs where the module is
> > part of a power domain.
> >
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > ---
> > * Changes since v4
> > - Enable GPOUT_RDM and GPOUT_TDM delays depending on phy-mode.
> 
> Thanks for the update!
> 
> > +static void rtsn_set_delay_mode(struct rtsn_private *priv)
> > +{
> > +       u32 val = 0;
> > +
> > +       /* The MAC is capable of applying a delay on both Rx and Tx. Each
> > +        * delay can either be on or off, there is no way to set its length.
> > +        *
> > +        * The exact delay applied depends on electric characteristics of the
> > +        * board. The datasheet describes a typical Rx delay of 1800 ps and a
> > +        * typical Tx delay of 2000 ps.
> > +        *
> > +        * There are boards where the RTSN device is used together with PHYs
> > +        * who do not support a large enough internal delays to function. These
> > +        * boards depends on the MAC applying these inexact delays.
> > +        */
> > +
> > +       /* If the phy-mode is rgmii or rgmii-rxid apply Rx delay on the MAC */
> > +       if (priv->iface == PHY_INTERFACE_MODE_RGMII_ID ||
> > +           priv->iface == PHY_INTERFACE_MODE_RGMII_RXID)
> > +               val |= GPOUT_RDM;
> > +
> > +       /* If the phy-mode is rgmii or rgmii-txid apply Tx delay on the MAC */
> > +       if (priv->iface == PHY_INTERFACE_MODE_RGMII_ID ||
> > +           priv->iface == PHY_INTERFACE_MODE_RGMII_TXID)
> > +               val |= GPOUT_TDM;
> > +
> > +       rtsn_write(priv, GPOUT, val);
> > +}
> 
> > +static int rtsn_phy_init(struct rtsn_private *priv)
> > +{
> > +       struct device_node *np = priv->ndev->dev.parent->of_node;
> > +       struct phy_device *phydev;
> > +       struct device_node *phy;
> > +       phy_interface_t iface;
> > +
> > +       /* Delays, if any, are applied by the MAC. Mask RGMII mode passed to the
> > +        * PHY to avoid it also adding the delay.
> > +        */
> > +       switch (priv->iface) {
> > +       case PHY_INTERFACE_MODE_RGMII:
> > +       case PHY_INTERFACE_MODE_RGMII_ID:
> > +       case PHY_INTERFACE_MODE_RGMII_RXID:
> > +       case PHY_INTERFACE_MODE_RGMII_TXID:
> > +               iface = PHY_INTERFACE_MODE_RGMII;
> > +               break;
> > +       default:
> > +               iface = priv->iface;
> > +               break;
> > +       }
> 
> This introduces the same issues (the "workaround" state below) we had
> with ravb before.
> 9b23203c32ee02cd ("ravb: Mask PHY mode to avoid inserting delays twice")
> was the workaround,
> a6f51f2efa742df0 ("ravb: Add support for explicit internal clock delay
> configuration")
> was the final fix.
> 
> Do we really want to repeat that mistake?

Is it the same issue? The RAVB issue is around PHY drivers adjusting 
delays based on [rt]xc-skew-ps properties. The RTSN bindings only deal 
with {rx,tx}-internal-delay-ps properties.

After a discussion with Andrew my understanding is that the PHY shall 
not attempt to add any delays from {rx,tx}-internal-delay-ps properties 
if the phy-mode used in of_phy_connect() is PHY_INTERFACE_MODE_RGMII. As 
we mask the phy-mode here the PHY shall never attempt to add delays as 
we deal with that in the MAC.

It feels like I missed something? Sorry if I'm confused.

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

