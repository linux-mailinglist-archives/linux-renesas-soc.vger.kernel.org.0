Return-Path: <linux-renesas-soc+bounces-21921-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 83FA0B5965B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Sep 2025 14:39:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E03E3B9451
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Sep 2025 12:39:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E4A630C350;
	Tue, 16 Sep 2025 12:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="zrk9mY1x"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD093081D0;
	Tue, 16 Sep 2025 12:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758026354; cv=none; b=OP5hAUN1GvFieoGeYvfxFhbZRQhhokPAuOMYK98tDlR7D9z/3bOwl1mpjaEG0IwHPAMmO2LgqHrwSx6s1xALOpZMu7oFb+EgZ80Whts9wKygCGBY08WY3GpN7/Etx2iTgu6vtL6R/7M6ljJbtZ29p6Ppi92mKfxNbSLJmA99gwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758026354; c=relaxed/simple;
	bh=VYiJcHn+5xSk3AbJ/lyVzwYV7ns5Vvxv6ZhyMeu/R0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZEgYDNLFO0FyRdrW0SZRgufwMJZUtWVTPwuu6l+f06a/PG4lL7biEdI1Wj3xWOwlnbgE4UyqKViKiG5G/R7R8UbsYgvG6b/v+ZEpGoqBJ/5ja+JWE7UTo4QVTbFq7cspzfehrlpepxyrlWiM4jadXkMdpIttvz0LfgrKHnacgo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=zrk9mY1x; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=6Yq7vjjUYFU13iEnYRpvwZrcHCN4WLOc5BI4rLugabs=; b=zrk9mY1xeL3v6QZhoxfm0FM5LT
	9KH1VBm2RiMOQ4cUUId//p3HU3rr9QPqEOXHm9GlS+NWgAh+PUiuzCLwmS+6ZMmNHJbNpRNcvsIxm
	FAQnlAG+rFAosG3HyB1Hycipwrgmg3Q1js9QhmEzMWA++k9Ge/2IxrpGcU2heXY+wNyg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uyUxW-008YrA-P7; Tue, 16 Sep 2025 14:38:58 +0200
Date: Tue, 16 Sep 2025 14:38:58 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Paul Barker <paul@pbarker.dev>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [net-next 6/6] net: ravb: Use common defines for time stamping
 control
Message-ID: <b52b6209-d0c3-49fb-8e99-3cd16e5121d9@lunn.ch>
References: <20250916101055.740518-1-niklas.soderlund+renesas@ragnatech.se>
 <20250916101055.740518-7-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250916101055.740518-7-niklas.soderlund+renesas@ragnatech.se>

> @@ -1010,18 +1009,27 @@ static int ravb_rx_rcar(struct net_device *ndev, int budget, int q)
>  				break;
>  			}
>  			skb_mark_for_recycle(skb);
> -			get_ts &= (q == RAVB_NC) ?
> -					RAVB_RXTSTAMP_TYPE_V2_L2_EVENT :
> -					~RAVB_RXTSTAMP_TYPE_V2_L2_EVENT;
> -			if (get_ts) {
> -				struct skb_shared_hwtstamps *shhwtstamps;
> -
> -				shhwtstamps = skb_hwtstamps(skb);
> -				memset(shhwtstamps, 0, sizeof(*shhwtstamps));
> -				ts.tv_sec = ((u64) le16_to_cpu(desc->ts_sh) <<
> -					     32) | le32_to_cpu(desc->ts_sl);
> -				ts.tv_nsec = le32_to_cpu(desc->ts_n);
> -				shhwtstamps->hwtstamp = timespec64_to_ktime(ts);
> +
> +			if (priv->tstamp_rx_ctrl != HWTSTAMP_FILTER_NONE) {
> +				bool get_ts = false;
> +
> +				if (q == RAVB_NC)
> +					get_ts = priv->tstamp_rx_ctrl ==
> +						HWTSTAMP_FILTER_PTP_V2_L2_EVENT;
> +				else
> +					get_ts = priv->tstamp_rx_ctrl !=
> +						HWTSTAMP_FILTER_PTP_V2_L2_EVENT;
> +
> +				if (get_ts) {
> +					struct skb_shared_hwtstamps *shhwtstamps;
> +
> +					shhwtstamps = skb_hwtstamps(skb);
> +					memset(shhwtstamps, 0, sizeof(*shhwtstamps));
> +					ts.tv_sec = ((u64)le16_to_cpu(desc->ts_sh) << 32)
> +						| le32_to_cpu(desc->ts_sl);
> +					ts.tv_nsec = le32_to_cpu(desc->ts_n);
> +					shhwtstamps->hwtstamp = timespec64_to_ktime(ts);
> +				}

This hunk is bigger than it needs to be because this block has been
indented further. Maybe keep get_ts as function scope, initialised to
false, so you don't need to touch this block?

	Andrew

