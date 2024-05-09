Return-Path: <linux-renesas-soc+bounces-5282-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 481B48C1809
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 May 2024 23:04:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F356D282BF4
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 May 2024 21:04:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3053282876;
	Thu,  9 May 2024 21:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="GZckGMdB";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Qn5E3+aw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh1-smtp.messagingengine.com (fhigh1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C414F811E0;
	Thu,  9 May 2024 21:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715288633; cv=none; b=QsOqfzyx8puCMOpx9DnMxn9mfjexXI37j1fQ8O7Jmd78FOtVHYOmJ4JMD1c/ILXPOxykIldi0/5Do5K+/cLFQmx6done1lJIc2+zRFdoMV2Cdl7KTm4mU0VXmhFjXfEQS1pXrU/8udWEK6k5abhIIk5HjUwxOrE7lQaMYtHoolg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715288633; c=relaxed/simple;
	bh=cBUjEC97NNum/CdBlIv8ddY8Iqg+Dlss/Nfq5ZhVmiQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pleUQS8S+OAYasFK7a8LmSyHM8NPhuEq8HhT3brgNMEG51Os07tGhwjqVE2chw2x9BYeIaU3wsm/alqYtJZGJlTfYDegyAnl1DONCDamx3L0XkY0bFpt8OAKF9cWrz8fZUHVRq1qJTlW//dy+Ud9fRvIphI9WQ+ZzlyVaMFrR4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=GZckGMdB; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Qn5E3+aw; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id AAD4E11400F9;
	Thu,  9 May 2024 17:03:47 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Thu, 09 May 2024 17:03:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1715288627;
	 x=1715375027; bh=IObcRXAc8dxQy05t17XIxEvRZ4Nef1rkLN6LLD4K/TE=; b=
	GZckGMdBYQp2kZYhaCVGSHh+pD1Ts0VsfpT7BeY9oycyTq2xIvAOY1L/wTGfOxa+
	sGkgZWxEJz7kP1E7Mk61D7JqEjpSp6gDl84egl9pcIj4aSFrzNF7yaeJZcEn4P5v
	eE/RPodf3mUPjVNjESJKREOO0qwNLiEz8Ecam0JsbXgcjuCCyrhwk0xK4evb8eVZ
	1dwggiJtxj2E9OkfGvKwHDyZtUVJyQ+mcvqMujMnenigtKNDzXKtGbjfU6M8NlPY
	elCqLbWK9ds3iqCgq3y4YQYaHSdtH0lIl1qPyBsLX8d+AO8g4Q3+YakepmXh6Flr
	uuLY+VXOQU1VWjb8GB5pEg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1715288627; x=
	1715375027; bh=IObcRXAc8dxQy05t17XIxEvRZ4Nef1rkLN6LLD4K/TE=; b=Q
	n5E3+awQeiZq5lijoLbTy/Bdh6aTMvIxcqH9m1Z6eT0IIXd/EHeMIpqUP+LwzMPS
	v6W6OpnCtSTqIq8JhxVWuepHcV55DyWBWLxmVwvku5FJhJ2gCtKizbr+UzfW6aTv
	n0st4hhy2ezOW4n4LSKnRFMIbZlKApakNIIYucZhsphG1wSaaw7sGQUbRtzhs8sJ
	eD+lv+GMPPimvITWzqKE9EGi5KTdV8rG8V4iQUPvyD5xbJMVE5/P/O/a8w8kfqdl
	WAGcSgNGCZQ4W4yrcNNn+rLUyZG3mJszNCIIyAylgqofS9s/b+pMs6ASb58qdPuW
	gbSoCIb8tAqu2P97Sp0NQ==
X-ME-Sender: <xms:Mzo9Zm0qCrLUUGDHqIGfsf5luk7hHkQI87evSK9AQQpGoS7BXtBkMw>
    <xme:Mzo9ZpEa5NrBRX6BEmEg_yyRAXnEBc50yk4xNEdGf0JwLr19mlURVON7wIvNeEXO-
    6kuNlZll7zkezUQdUQ>
X-ME-Received: <xmr:Mzo9Zu7tCVbPLilu_Jo8aoMuotD11lVsmw4nQJC0iOHwWErlGg9nvwKfn86X151W2ZkkX_1zG34Z-9Zar0D3z2v9u3tuoAQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdefvddgudehfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeenucfhrhhomheppfhi
    khhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvg
    hnvghsrghssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepfefhleel
    hfffjefgfedugfegjeelhfevheeikefhueelgfdtfeeuhefftddvleeinecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohgu
    vghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvg
X-ME-Proxy: <xmx:Mzo9Zn2OSY6KhiaseN3JktZ_bIT9Sxu3ejynsJ-T8ayd_YaIjH3FvQ>
    <xmx:Mzo9ZpG91ajMKy5HoQsnVBdKQg3fS7k_3Ajqig2Mw4x00GYbnlp2dw>
    <xmx:Mzo9Zg-Z5OtHl4K-OFsWAkFbJBrHUIwWG-GkByq_Xm4X_oQC0QEJeA>
    <xmx:Mzo9Zuk2SmBC6inn-WXG8YjNmlY8gb_TwsNs4fysd2jdmH1hgHuGRQ>
    <xmx:Mzo9ZvYt6DNBnncRoNC8-OE6p-W9R4LrLLpPhrb6tAX2GPVAftpcwpJq>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 9 May 2024 17:03:46 -0400 (EDT)
Date: Thu, 9 May 2024 23:03:44 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [net-next,v4] net: ethernet: rtsn: Add support for Renesas
 Ethernet-TSN
Message-ID: <20240509210344.GL1385281@ragnatech.se>
References: <20240509095217.3274671-1-niklas.soderlund+renesas@ragnatech.se>
 <0d7b04a6-9f5b-41c7-bd52-890521019f8d@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0d7b04a6-9f5b-41c7-bd52-890521019f8d@lunn.ch>

On 2024-05-09 22:25:27 +0200, Andrew Lunn wrote:
> > +static void rtsn_set_delay_mode(struct rtsn_private *priv)
> > +{
> > +	struct device_node *np = priv->ndev->dev.parent->of_node;
> > +	u32 delay;
> > +	u32 val;
> > +
> > +	val = 0;
> > +
> > +	/* The MAC is capable of applying a delay on both Rx and Tx. Each
> > +	 * delay can either be on or off, there is no way to set its length.
> > +	 *
> > +	 * The exact delay applied depends on electric characteristics of the
> > +	 * board. The datasheet describes a typical Rx delay of 1800 ps and a
> > +	 * typical Tx delay of 2000 ps.
> > +	 *
> > +	 * There are boards where the RTSN device is used together with PHYs
> > +	 * who do not support a large enough internal delays to function. These
> > +	 * boards depends on the MAC applying these inexact delays.
> > +	 */
> > +
> > +	/* If the phy-mode is rgmii or rgmii-rxid apply Rx delay on the MAC */
> > +	if (priv->iface == PHY_INTERFACE_MODE_RGMII_ID ||
> > +	    priv->iface == PHY_INTERFACE_MODE_RGMII_RXID)
> > +		if (!of_property_read_u32(np, "rx-internal-delay-ps", &delay))
> > +			if (delay)
> > +				val |= GPOUT_RDM;
> > +
> > +	/* If the phy-mode is rgmii or rgmii-txid apply Tx delay on the MAC */
> > +	if (priv->iface == PHY_INTERFACE_MODE_RGMII_ID ||
> > +	    priv->iface == PHY_INTERFACE_MODE_RGMII_TXID)
> > +		if (!of_property_read_u32(np, "tx-internal-delay-ps", &delay))
> > +			if (delay)
> > +				val |= GPOUT_TDM;
> 
> Much better, but still not correct. rx-internal-delay-ps and
> tx-internal-delay-ps is meant for fine tuning the delays, generally in
> steps of a few 10ps. It is applied unconditionally, since it is just a
> fine tune.
> 
> You hardware does not support fine tuning, just 1800/2000ps. So it
> makes no sense to use these DT properties. Just enable GPOUT_RDM or
> GPOUT_TDM as appropriate for PHY_INTERFACE_MODE_*.

I will address this and send a new version. Thanks for checking this.

> 
>     Andrew
> 
> ---
> pw-bot: cr

-- 
Kind Regards,
Niklas Söderlund

