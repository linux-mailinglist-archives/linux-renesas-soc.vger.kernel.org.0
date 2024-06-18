Return-Path: <linux-renesas-soc+bounces-6433-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D2090DA67
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Jun 2024 19:16:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7CC911F23BC9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Jun 2024 17:16:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C42B2481BA;
	Tue, 18 Jun 2024 17:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="jrPMUGUk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AE272B9A6;
	Tue, 18 Jun 2024 17:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718730956; cv=none; b=jt4dIxVIthccnmVt2239tjzoBddFv9KF9nFTZA+tAwvIcXxf16QBnIcPGYCMlic9OKSe/ACjhnHtMUk4CU51VJ1ByYk6rEA4+iIfGnvcub5NPOCjksyKZimIusslyEtuimFQKgZOWWuwHPKj8H2NfKGmSzLtgJ96PltukG506ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718730956; c=relaxed/simple;
	bh=vv3fq5+AGVVElQDOvKMq7BI5jkVcL9L5YL+al8LE+9c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=toZ2CEeS94zRT/vXrXG/lbzAeqoO14PNvriYo1aIRLeRE5asljzoCQBDgc63qF2Smnl27vm7/x2o/TMZcmjjynljMU3903XGu6VsT6lDTSmGPgrw3YzmbMJuxTOh9wlfF96qv518Cj9hdgGreoWdGl1ZODfhm0A/+mzzOyXVCgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=jrPMUGUk; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=0UPY5V0eAVe7DY17vRldVi1W3gl8pr3rozc98segCoE=; b=jrPMUGUkFNwfpz45N6ds6W1Wmj
	quKFzZ/C9HZm//25H/alDrlT6d5bnCu4hgbY4+3uLn5EERuU2hHIEcGTAjrix6FnwkxEtnN9cPAfg
	33qQlrMhzOvsHNgbZhKXsdYXOMjWuL4pij5VbijHc9vKriGZjdm2UregH6XG5/xhIiwk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sJcQj-000Orr-Qq; Tue, 18 Jun 2024 19:15:37 +0200
Date: Tue, 18 Jun 2024 19:15:37 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Ratheesh Kannoth <rkannoth@marvell.com>
Cc: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [net-next,v9] net: ethernet: rtsn: Add support for Renesas
 Ethernet-TSN
Message-ID: <8cacac1d-b9ca-4fbc-b92a-60447f8fb178@lunn.ch>
References: <20240618090824.553018-1-niklas.soderlund+renesas@ragnatech.se>
 <20240618115716.GA1186487@maili.marvell.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240618115716.GA1186487@maili.marvell.com>

> > +static int rtsn_tx_free(struct net_device *ndev, bool free_txed_only)
> > +{
> > +	struct rtsn_private *priv = netdev_priv(ndev);
> > +	struct rtsn_ext_desc *desc;
> > +	struct sk_buff *skb;
> > +	int free_num = 0;
> > +	int entry, size;
> > +
> > +	for (; priv->cur_tx - priv->dirty_tx > 0; priv->dirty_tx++) {
> > +		entry = priv->dirty_tx % priv->num_tx_ring;
> > +		desc = &priv->tx_ring[entry];
> > +		if (free_txed_only && (desc->die_dt & DT_MASK) != DT_FEMPTY)
> > +			break;
> > +
> > +		dma_rmb();
> > +		size = le16_to_cpu(desc->info_ds) & TX_DS;
> > +		skb = priv->tx_skb[entry];
> > +		if (skb) {
> > +			if (skb_shinfo(skb)->tx_flags & SKBTX_HW_TSTAMP) {
> > +				struct skb_shared_hwtstamps shhwtstamps;
> > +				struct timespec64 ts;
> > +
> > +				rtsn_get_timestamp(priv, &ts);
> > +				memset(&shhwtstamps, 0, sizeof(shhwtstamps));
> > +				shhwtstamps.hwtstamp = timespec64_to_ktime(ts);
> > +				skb_tstamp_tx(skb, &shhwtstamps);
> > +			}
> > +			dma_unmap_single(ndev->dev.parent,
> > +					 le32_to_cpu(desc->dptr),
> > +					 size, DMA_TO_DEVICE);
> > +			dev_kfree_skb_any(priv->tx_skb[entry]);
> > +			free_num++;
> > +		}
> > +		desc->die_dt = DT_EEMPTY;
> > +		priv->stats.tx_packets++;
> if (!skb) case also, incrementing the tx_packets. Is this correct ?

Please trim the text when replying. Is this the only comment in this
1500 line email? Did i miss more with my page-down, page-down,
page-down.....

	Andrew

