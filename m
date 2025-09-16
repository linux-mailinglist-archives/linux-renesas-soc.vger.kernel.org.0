Return-Path: <linux-renesas-soc+bounces-21932-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F54B59AE4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Sep 2025 16:53:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9AEDC1B21F09
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Sep 2025 14:53:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 299FE34AB0D;
	Tue, 16 Sep 2025 14:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="grP0sXLA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7710F34AB13;
	Tue, 16 Sep 2025 14:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758034188; cv=none; b=fGro/pLIWeNUGZI1Gs8Y2uHn8zLIRXHbR+6/ezuNuAGVOFDPDxbLll7AHuJGyJUwe+2r95LnICH+TN2mLmDAK601YVtNn/jIWmDJKPq9A9cq2VfO3ROuycoMnYGnEJ/Y/wsI6l9arLBrAFhcjeRQ2Oojky5P8GoMSvzics0SAU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758034188; c=relaxed/simple;
	bh=4Nhjy8qW+RODcC2XVyatf5YPors4YTxk1pZEVvt7I3E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qpahgxpHqtMeXF0Piyr/DS04bupkISJ9Kah13B32+SXvMvycaFwmD4a2iBeL+QGPqe67lRlAI5/UVr2BFUjEzrlKAJoWVQeCr5dOl4E5j++GXip/Xj6Pvmc91WhjCKtVEg+K+2Zd1XuGRzriyopA15OMH9HxDncFuKFV5BVtQhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=grP0sXLA; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=pC6CKk54JU5YyVUn15lE8Gs0KLNMqIiG9WMVBi2XP08=; b=gr
	P0sXLAhq3sRKgY9YvihESO6KON0b6iUV0RbpYQL2qSXrnZQ+vu9rZkwkwfwX8YoVPhcKfXn2bmwWZ
	ehOzPsId0c57zRT8F3cVZPQnYK1jeUo78U9yRIjRr74aO0KM5A3YY0GXhTwTA8/WREjJXGY9yyEZ2
	uVuzESWEQPHdpi8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uyWzt-008ZrR-8D; Tue, 16 Sep 2025 16:49:33 +0200
Date: Tue, 16 Sep 2025 16:49:33 +0200
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
Message-ID: <81a21668-4886-40ad-9dc2-f6081396a94d@lunn.ch>
References: <20250916101055.740518-1-niklas.soderlund+renesas@ragnatech.se>
 <20250916101055.740518-7-niklas.soderlund+renesas@ragnatech.se>
 <b52b6209-d0c3-49fb-8e99-3cd16e5121d9@lunn.ch>
 <20250916130848.GD1045278@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250916130848.GD1045278@ragnatech.se>

On Tue, Sep 16, 2025 at 03:08:48PM +0200, Niklas Söderlund wrote:
> On 2025-09-16 14:38:58 +0200, Andrew Lunn wrote:
> > > @@ -1010,18 +1009,27 @@ static int ravb_rx_rcar(struct net_device *ndev, int budget, int q)
> > >  				break;
> > >  			}
> > >  			skb_mark_for_recycle(skb);
> > > -			get_ts &= (q == RAVB_NC) ?
> > > -					RAVB_RXTSTAMP_TYPE_V2_L2_EVENT :
> > > -					~RAVB_RXTSTAMP_TYPE_V2_L2_EVENT;
> > > -			if (get_ts) {
> > > -				struct skb_shared_hwtstamps *shhwtstamps;
> > > -
> > > -				shhwtstamps = skb_hwtstamps(skb);
> > > -				memset(shhwtstamps, 0, sizeof(*shhwtstamps));
> > > -				ts.tv_sec = ((u64) le16_to_cpu(desc->ts_sh) <<
> > > -					     32) | le32_to_cpu(desc->ts_sl);
> > > -				ts.tv_nsec = le32_to_cpu(desc->ts_n);
> > > -				shhwtstamps->hwtstamp = timespec64_to_ktime(ts);
> > > +
> > > +			if (priv->tstamp_rx_ctrl != HWTSTAMP_FILTER_NONE) {
> > > +				bool get_ts = false;
> > > +
> > > +				if (q == RAVB_NC)
> > > +					get_ts = priv->tstamp_rx_ctrl ==
> > > +						HWTSTAMP_FILTER_PTP_V2_L2_EVENT;
> > > +				else
> > > +					get_ts = priv->tstamp_rx_ctrl !=
> > > +						HWTSTAMP_FILTER_PTP_V2_L2_EVENT;
> > > +
> > > +				if (get_ts) {
> > > +					struct skb_shared_hwtstamps *shhwtstamps;
> > > +
> > > +					shhwtstamps = skb_hwtstamps(skb);
> > > +					memset(shhwtstamps, 0, sizeof(*shhwtstamps));
> > > +					ts.tv_sec = ((u64)le16_to_cpu(desc->ts_sh) << 32)
> > > +						| le32_to_cpu(desc->ts_sl);
> > > +					ts.tv_nsec = le32_to_cpu(desc->ts_n);
> > > +					shhwtstamps->hwtstamp = timespec64_to_ktime(ts);
> > > +				}
> > 
> > This hunk is bigger than it needs to be because this block has been
> > indented further. Maybe keep get_ts as function scope, initialised to
> > false, so you don't need to touch this block?
> 
> Thanks for the suggestion. I could do that. What I like about this is 
> that it's immediately clear that all this depends on 
> priv->tstamp_rx_ctrl.

True.

As a reviewer, i was asking myself, has the code actually setting the
timestamp in the skbuf changed? Do i need to look at it in detail?
There should not be any need for it to change....

> I could break it out to a separate function if you prefer to reduce the 
> indentation level,

It is not really indentation level, but the fact it is in the hunk,
meaning should i look at it?

So maybe add a patch which moves the copying of the timestamp from the
descriptor into the skbuf into a helper. This patch then just calls
the helper, making this hunk much smaller and more obvious?

It does look correct as it is, but its just more effort to review.
Small, simple, obviously correct patches are what we want.

	Andrew

