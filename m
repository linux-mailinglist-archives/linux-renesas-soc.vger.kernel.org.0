Return-Path: <linux-renesas-soc+bounces-5278-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 304608C177F
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 May 2024 22:29:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 614831C21974
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 May 2024 20:29:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26E8A1292EB;
	Thu,  9 May 2024 20:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="fBVLEic+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F1721292C9;
	Thu,  9 May 2024 20:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715286342; cv=none; b=CFLhcWOr/LTun8zdE880hmffjX76pxSBQcWg7SwoWptldfAvXR/MJ7KNkiwTmwu/CdrM5L+0LFsd+k4ibRLDWbKkdwDKW6fqQ8TJda7Iv3NQ4sxgNf2KBwSe11vwVZBeUF/WlUjPnyF6SmLQTQrpdg/qSDRPd9WSEhoCjBoUk8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715286342; c=relaxed/simple;
	bh=q66twQ3ZQmwtVpgyjIoW4gH5J6u56rokCV4I/WTlC5c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mXpdwdqLSIFA2yalIIeTCDOzl3dWHeG6QYmgIGfQgJ0xxdjUkTwlH5mh2kqSxLaH3mSWa0hZY87Mg9yHMgV3/jk5PzMviU8qwCrjfM7jVHqj1WzQtl/4UjLblVcevIjvQhi54Gg4NNzGiVvLSrmgoK8E5LlzXjA4wF/kRpR7k4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=fBVLEic+; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Jnctv+naZw8viulJjjf7C4sXmPGQ+5Xig0IuuCkqOcE=; b=fBVLEic+AzSZjKrQP3uozvo3XB
	IqYVXmNydqYmDm8nY5Ht/2GJvNZQKsAPx4JbFcXdIojYV14pNU/ngQP3GblPknnPNJyuSBZluTRNJ
	mswfgBveCRi2ZiJgAQHEf+TK7I7UAwZeEawd0mTblGRzvnRQf3f8E8Nv1KbMdSpW0mQQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1s5AKV-00F4w0-5f; Thu, 09 May 2024 22:25:27 +0200
Date: Thu, 9 May 2024 22:25:27 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [net-next,v4] net: ethernet: rtsn: Add support for Renesas
 Ethernet-TSN
Message-ID: <0d7b04a6-9f5b-41c7-bd52-890521019f8d@lunn.ch>
References: <20240509095217.3274671-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240509095217.3274671-1-niklas.soderlund+renesas@ragnatech.se>

> +static void rtsn_set_delay_mode(struct rtsn_private *priv)
> +{
> +	struct device_node *np = priv->ndev->dev.parent->of_node;
> +	u32 delay;
> +	u32 val;
> +
> +	val = 0;
> +
> +	/* The MAC is capable of applying a delay on both Rx and Tx. Each
> +	 * delay can either be on or off, there is no way to set its length.
> +	 *
> +	 * The exact delay applied depends on electric characteristics of the
> +	 * board. The datasheet describes a typical Rx delay of 1800 ps and a
> +	 * typical Tx delay of 2000 ps.
> +	 *
> +	 * There are boards where the RTSN device is used together with PHYs
> +	 * who do not support a large enough internal delays to function. These
> +	 * boards depends on the MAC applying these inexact delays.
> +	 */
> +
> +	/* If the phy-mode is rgmii or rgmii-rxid apply Rx delay on the MAC */
> +	if (priv->iface == PHY_INTERFACE_MODE_RGMII_ID ||
> +	    priv->iface == PHY_INTERFACE_MODE_RGMII_RXID)
> +		if (!of_property_read_u32(np, "rx-internal-delay-ps", &delay))
> +			if (delay)
> +				val |= GPOUT_RDM;
> +
> +	/* If the phy-mode is rgmii or rgmii-txid apply Tx delay on the MAC */
> +	if (priv->iface == PHY_INTERFACE_MODE_RGMII_ID ||
> +	    priv->iface == PHY_INTERFACE_MODE_RGMII_TXID)
> +		if (!of_property_read_u32(np, "tx-internal-delay-ps", &delay))
> +			if (delay)
> +				val |= GPOUT_TDM;

Much better, but still not correct. rx-internal-delay-ps and
tx-internal-delay-ps is meant for fine tuning the delays, generally in
steps of a few 10ps. It is applied unconditionally, since it is just a
fine tune.

You hardware does not support fine tuning, just 1800/2000ps. So it
makes no sense to use these DT properties. Just enable GPOUT_RDM or
GPOUT_TDM as appropriate for PHY_INTERFACE_MODE_*.

    Andrew

---
pw-bot: cr

