Return-Path: <linux-renesas-soc+bounces-24342-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D473C41667
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 07 Nov 2025 20:11:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 21C6A3B3425
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Nov 2025 19:11:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40DA32E7F3F;
	Fri,  7 Nov 2025 19:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="Ko2TKRNx";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="pl51VX9K"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 420FF2E3B0D;
	Fri,  7 Nov 2025 19:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762542660; cv=none; b=HWpqyCveeSzXMX+3t+z/0h3dbIfHiUcoHvLAU1O4cjbOlNQbddl3XegrKd/Ltv/azuaOzjvIA2mzN6uHCZAgP2hz77YfR3WL2nSngHvpw+q2YlcLyVVFsIrPW770ZcRYgDb5g83l22dau1rYT8jKZ/gYB5G8HtXaHOeuh/SC9+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762542660; c=relaxed/simple;
	bh=ApuO2i9p/QAZO0clOu40+F49+qlrFjGqaQbqz6poZ6I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pco+B5jdQmpygXSAm5qzKKu8Irju1Gf8lrzIC9GKdaVRfN/RroUyqvKs3saTGTaPtbgsjzF68FAS62f6qibvixjI1VPG5N52JKjmYGE+EHFawju41L9wh+zY+SDm7EeYssYcx21Dj8ALKAWy4laXu3lOch2+of3fMjtT9d5AGvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=Ko2TKRNx; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=pl51VX9K; arc=none smtp.client-ip=202.12.124.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id D98651D00188;
	Fri,  7 Nov 2025 14:10:55 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Fri, 07 Nov 2025 14:10:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1762542655;
	 x=1762629055; bh=uPxP67QLxnw0cCyHjtKxWGSiLMYMu1TlNbzcpFHn/xs=; b=
	Ko2TKRNx6DuJF4VJHhpZSQMoAFnfLLRFzkhRl/bET3iJjAmGZhEps0dQcdRtGVRJ
	/49O3STSoSaNprCWrrLnN2fHucZtkrXldhuQTlMVB0l86iYioqLV09gbp0A22wyd
	k2wm2tpDFXEQZYvQ3yrADpCQq42j0/DHXN4Mz8TDcYXeR9FZbU866JzNQjZFDyce
	NSIEq+Ypar2mbXpOgnXXGNTe2lUGx5hkZ/TIjGhn5gbLMIZ4PeFXFoFof47VMEtF
	9kYMdtk/v3VC3KxqAkyQEEuwhJyFMvB8PBY8nY9ERgUc9X5rxwVPH/L0e0Q3vBCD
	XDZNbbTGHuvPCufEcJTjNQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1762542655; x=
	1762629055; bh=uPxP67QLxnw0cCyHjtKxWGSiLMYMu1TlNbzcpFHn/xs=; b=p
	l51VX9KZTl7jATz/TOaHGhEbGyRR96aAp9Y/YMZIbtYiLTMNHjPpmB79QpNx+J7c
	PnENGKZNVU2qFBoiU038q0+b1/Ehzc96Fz6EqGgtLDvYu9w4eZxLmUDya5hvJarS
	lZUBrT690LF7qefWbw+VSrOesB9TrRwfVTiuuCfs2cpSviJ09IKHx8O2mmD5lMf+
	iBZP2NJkUlMElvx+wle5yMMoW27Ruw/hFocWRFGKKy+CztW87qpWIxwFtYTRsJFl
	7Bwsi2psObJM57OW1zmuAkQMlP1Z15wtzB4bEvUT/rYJ+lNU+9pvVabskqUH/CW0
	0/QN/VC+NrWMGx4yGBZhQ==
X-ME-Sender: <xms:PkQOaQSrphdP5lwPvxDonv83jAGcH_wCa9AJgND_VvJzsGX-xl4uAQ>
    <xme:PkQOaUQIulStiYNXwIVAthbpP0N0hgOQLx_ngdlFO3rGlCi1pd4hqV8m97aQBALD8
    o7rdXrdLVZPX1BV_KmYSxvnO0ImUTrmWLtxDyEFVjwH2fF0Cz9Vzoc>
X-ME-Received: <xmr:PkQOab2nPGZT3IP_b-tkMzyOsFo6OghuW34Vrmt810Ywy8nNjT0JX8aI5m06MglKEQQt66TgyPYJK13dubwzI9j6HDkhFbA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdduledtgeejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhklhgr
    shcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvsh
    grshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeetffeuledtveeg
    veehhefhueetgefghedvueelfeekgfeufeejvdekveetgeetueenucffohhmrghinhepgh
    hithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
    lhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrghssehrrghgnh
    grthgvtghhrdhsvgdpnhgspghrtghpthhtohepudefpdhmohguvgepshhmthhpohhuthdp
    rhgtphhtthhopehhohhrmhhssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehprghulh
    esphgsrghrkhgvrhdruggvvhdprhgtphhtthhopegrnhgurhgvfidonhgvthguvghvsehl
    uhhnnhdrtghhpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprh
    gtphhtthhopegvughumhgriigvthesghhoohhglhgvrdgtohhmpdhrtghpthhtohepkhhu
    sggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehprggsvghnihesrhgvughhrghtrd
    gtohhmpdhrtghpthhtohephihoshhhihhhihhrohdrshhhihhmohgurgdruhhhsehrvghn
    vghsrghsrdgtohhmpdhrtghpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlihguvg
    hrrdgsvg
X-ME-Proxy: <xmx:PkQOaWyFbZy2HStYlM3_MdibZtrMsph_66Rqaj7jnYFs1KNiuZoJSw>
    <xmx:PkQOafy5_iGJnn3czUsX-1pEIXqSMbkv04ff4y2HlTfPr--thpOyqQ>
    <xmx:PkQOaa-Lo-6XUtiNi7EBym4QAdM5Jj4wKud5EyoNSiwmB2LqOzVaKQ>
    <xmx:PkQOaR8B7dmRGBFoUPs4OwajtalthHAuqtades0XWqWROySo9d1f2g>
    <xmx:P0QOaYJ2XJQGjvLnS3_5PxmphgCmVqI2zai03tUT2wvO8t6PN5tRrJDf>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 7 Nov 2025 14:10:54 -0500 (EST)
Date: Fri, 7 Nov 2025 20:10:51 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Simon Horman <horms@kernel.org>
Cc: Paul Barker <paul@pbarker.dev>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [net-next,v2 7/7] net: ravb: Use common defines for time
 stamping control
Message-ID: <20251107191051.GB4126953@ragnatech.se>
References: <20251104222420.882731-1-niklas.soderlund+renesas@ragnatech.se>
 <20251104222420.882731-8-niklas.soderlund+renesas@ragnatech.se>
 <aQ4xSv9629XF-Bt3@horms.kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aQ4xSv9629XF-Bt3@horms.kernel.org>

Hi Simon,

Thanks for your test of new tools!

On 2025-11-07 17:50:02 +0000, Simon Horman wrote:
> On Tue, Nov 04, 2025 at 11:24:20PM +0100, Niklas Söderlund wrote:
> > Instead of translating to/from driver specific flags for packet time
> > stamp control use the common flags directly. This simplifies the driver
> > as the translating code can be removed while at the same time making it
> > clear the flags are not flags written to hardware registers.
> > 
> > The change from a device specific bit-field track variable to the common
> > enum datatypes forces us to touch the ravb_rx_rcar_hwstamp() in a non
> > trivial way. To make this cleaner and easier to understand expand the
> > nested conditions.
> > 
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> 
> ...
> 
> > diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
> > index 5477bb5c69ae..1680e94b9242 100644
> > --- a/drivers/net/ethernet/renesas/ravb_main.c
> > +++ b/drivers/net/ethernet/renesas/ravb_main.c
> > @@ -950,13 +950,14 @@ static void ravb_rx_rcar_hwstamp(struct ravb_private *priv, int q,
> >  				 struct ravb_ex_rx_desc *desc,
> >  				 struct sk_buff *skb)
> >  {
> > -	u32 get_ts = priv->tstamp_rx_ctrl & RAVB_RXTSTAMP_TYPE;
> >  	struct skb_shared_hwtstamps *shhwtstamps;
> >  	struct timespec64 ts;
> > +	bool get_ts;
> >  
> > -	get_ts &= (q == RAVB_NC) ?
> > -		RAVB_RXTSTAMP_TYPE_V2_L2_EVENT :
> > -		~RAVB_RXTSTAMP_TYPE_V2_L2_EVENT;
> > +	if (q == RAVB_NC)
> > +		get_ts = priv->tstamp_rx_ctrl == HWTSTAMP_FILTER_PTP_V2_L2_EVENT;
> > +	else
> > +		get_ts = priv->tstamp_rx_ctrl != HWTSTAMP_FILTER_PTP_V2_L2_EVENT;
> >  
> >  	if (!get_ts)
> >  		return;
> 
> Hi Niklas,
> 
> It is Friday evening and I'm exercising a new tool, so please forgive me if
> this analysis is wrong. But it seems that there are cases where there old
> bit-based logic and the new integer equality based logic don't match.
> 
> 1. If q == RAVB_NC then previously timestamping would occur
>    for HWTSTAMP_FILTER_ALL, because:
> 
>    (RAVB_TXTSTAMP_ENABLED | RAVB_RXTSTAMP_TYPE_ALL) &
>     RAVB_RXTSTAMP_TYPE & RAVB_RXTSTAMP_TYPE_V2_L2_EVENT =
>    (0x10 | 0x6) & 0x06 & 0x02 = 0x2, which is non-zero.
> 
>    But with the new logic timestamping does not occur because:
> 
>    HWTSTAMP_FILTER_ALL == HWTSTAMP_FILTER_PTP_V2_L2_EVENT is false
> 
> 2. If q != RAVB_NC then previously timestamping would not occur
>    for HWTSTAMP_FILTER_NONE because:
> 
>    0 & RAVB_RXTSTAMP_TYPE & RAVB_RXTSTAMP_TYPE_V2_L2_EVENT = 0
> 
>    But with the new logic timestamping does occur because:
> 
>    HWTSTAMP_FILTER_NONE != HWTSTAMP_FILTER_PTP_V2_L2_EVENT is true

I must have written this code a late Friday night.. you are absolutely 
correct! Those two error cases exists. I wrote a test program to really 
verify it.

NG q: RAVB_BE old: 0=0, new=HWTSTAMP_FILTER_NONE=1
OK q: RAVB_NC old: 0=0, new=HWTSTAMP_FILTER_NONE=0
OK q: RAVB_BE old: RAVB_RXTSTAMP_TYPE_V2_L2_EVENT=0, new=HWTSTAMP_FILTER_PTP_V2_L2_EVENT=0
OK q: RAVB_NC old: RAVB_RXTSTAMP_TYPE_V2_L2_EVENT=1, new=HWTSTAMP_FILTER_PTP_V2_L2_EVENT=1
OK q: RAVB_BE old: RAVB_RXTSTAMP_TYPE_ALL=1, new=HWTSTAMP_FILTER_ALL=1
NG q: RAVB_NC old: RAVB_RXTSTAMP_TYPE_ALL=1, new=HWTSTAMP_FILTER_ALL=0

The correct conversion to int comparison are,

        if (q == RAVB_NC)
                get_ts = tstamp_rx_ctrl != HWTSTAMP_FILTER_NONE;
        else
                get_ts = tstamp_rx_ctrl == HWTSTAMP_FILTER_ALL;

And yes, I did use my test to verify it :-)

OK q: RAVB_BE old: 0=0, new=HWTSTAMP_FILTER_NONE=0
OK q: RAVB_NC old: 0=0, new=HWTSTAMP_FILTER_NONE=0
OK q: RAVB_BE old: RAVB_RXTSTAMP_TYPE_V2_L2_EVENT=0, new=HWTSTAMP_FILTER_PTP_V2_L2_EVENT=0
OK q: RAVB_NC old: RAVB_RXTSTAMP_TYPE_V2_L2_EVENT=1, new=HWTSTAMP_FILTER_PTP_V2_L2_EVENT=1
OK q: RAVB_BE old: RAVB_RXTSTAMP_TYPE_ALL=1, new=HWTSTAMP_FILTER_ALL=1
OK q: RAVB_NC old: RAVB_RXTSTAMP_TYPE_ALL=1, new=HWTSTAMP_FILTER_ALL=1

I will submit a correction promptly.

> 
> I came across this by chance because this patch is currently
> the most recent patch in net-next that touches C code. And I was
> exercising Claude Code with https://github.com/masoncl/review-prompts
> It reported the above and after significantly
> more thinking I've come to agree with it.

I'm happy you did! Thanks for spotting this.

> 
> But it is Friday evening, so YMMV.

Obviously, but mostly on for the non-AI entities it seems :-)

> 
> For reference, I've provided the text generated by Claude Code at the end of
> this email.

Seems like a very useful tool!

> 
> ...
> 
> > @@ -2446,15 +2437,13 @@ static int ravb_hwtstamp_set(struct net_device *ndev,
> >  			     struct netlink_ext_ack *extack)
> >  {
> >  	struct ravb_private *priv = netdev_priv(ndev);
> > -	u32 tstamp_rx_ctrl = RAVB_RXTSTAMP_ENABLED;
> > -	u32 tstamp_tx_ctrl;
> > +	enum hwtstamp_rx_filters tstamp_rx_ctrl;
> > +	enum hwtstamp_tx_types tstamp_tx_ctrl;
> >  
> >  	switch (config->tx_type) {
> >  	case HWTSTAMP_TX_OFF:
> > -		tstamp_tx_ctrl = 0;
> > -		break;
> >  	case HWTSTAMP_TX_ON:
> > -		tstamp_tx_ctrl = RAVB_TXTSTAMP_ENABLED;
> > +		tstamp_tx_ctrl = config->tx_type;
> >  		break;
> >  	default:
> >  		return -ERANGE;
> > @@ -2462,14 +2451,12 @@ static int ravb_hwtstamp_set(struct net_device *ndev,
> >  
> >  	switch (config->rx_filter) {
> >  	case HWTSTAMP_FILTER_NONE:
> > -		tstamp_rx_ctrl = 0;
> > -		break;
> >  	case HWTSTAMP_FILTER_PTP_V2_L2_EVENT:
> > -		tstamp_rx_ctrl |= RAVB_RXTSTAMP_TYPE_V2_L2_EVENT;
> > +		tstamp_rx_ctrl = config->rx_filter;
> >  		break;
> >  	default:
> >  		config->rx_filter = HWTSTAMP_FILTER_ALL;
> > -		tstamp_rx_ctrl |= RAVB_RXTSTAMP_TYPE_ALL;
> > +		tstamp_rx_ctrl = HWTSTAMP_FILTER_ALL;
> >  	}
> >  
> >  	priv->tstamp_tx_ctrl = tstamp_tx_ctrl;
> > -- 
> > 2.51.1
> > 
> > 
> 
> Text generated by Claude Code:
> 
> Is this logic translation correct? Looking at the old bit-field
> operations and new enum comparisons, the behavior seems to change in
> two cases:
> 
> Old behavior (from ravb_hwtstamp_set):
>   - FILTER_NONE stored as 0
>   - FILTER_PTP_V2_L2_EVENT stored as 0x12 (ENABLED | TYPE_V2_L2)
>   - FILTER_ALL stored as 0x16 (ENABLED | TYPE_ALL)
> 
> Old ravb_rx_rcar_hwstamp for RAVB_NC queue:
>   get_ts = (0x12 & 0x06) & 0x02 = 0x02 & 0x02 = 0x02 (timestamp)
>   get_ts = (0x16 & 0x06) & 0x02 = 0x06 & 0x02 = 0x02 (timestamp)
> 
> So the old code timestamps RAVB_NC queue packets for both
> FILTER_PTP_V2_L2_EVENT and FILTER_ALL.
> 
> New ravb_rx_rcar_hwstamp for RAVB_NC queue with FILTER_ALL:
>   get_ts = (HWTSTAMP_FILTER_ALL == HWTSTAMP_FILTER_PTP_V2_L2_EVENT)
>   get_ts = (1 == 9) = false (no timestamp)
> 
> Similarly for non-RAVB_NC queue, old behavior with FILTER_NONE:
>   get_ts = (0 & 0x06) & ~0x02 = 0 & ~0x02 = 0 (no timestamp)
> 
> New behavior for non-RAVB_NC queue with FILTER_NONE:
>   get_ts = (HWTSTAMP_FILTER_NONE != HWTSTAMP_FILTER_PTP_V2_L2_EVENT)
>   get_ts = (0 != 9) = true (timestamp)
> 
> Can the refactoring introduce these two behavior changes?
> 
> 1. RAVB_NC queue with FILTER_ALL: old code timestamps, new code doesn't
> 2. Non-RAVB_NC queue with FILTER_NONE: old code doesn't timestamp, new
>    code does

-- 
Kind Regards,
Niklas Söderlund

