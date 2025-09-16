Return-Path: <linux-renesas-soc+bounces-21950-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D65BB5A377
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Sep 2025 22:53:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 167B2520AA7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Sep 2025 20:53:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E896727D771;
	Tue, 16 Sep 2025 20:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="mqsXV1zM";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="lgYzIbA9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC097278156;
	Tue, 16 Sep 2025 20:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758056000; cv=none; b=NcZBQat4zBRaRyBGJrYA7oIrvTL1FKP+3WyouW/TE8welk42An9/Hw9sLI+Z/Xj7Y1gE9aoM1OgPe0VPsQwqPmmZIRCpZRs6z+HZaU+6WBJY6auvre/bWwf1AGRUE4uRFuIqbQsCLyW4nphBMkh40ii+BF8XFvPZfNZab2LfrTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758056000; c=relaxed/simple;
	bh=nvL4R0WKYsvPbNcDtuHwzVgfTcEy0EQUKCBXdbeTKUQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=keQm4p9y5dzOZCv0vli6Q4OdiAVRq+pungLtn5f+MLj6RswF0TO1Qs1XXd9YQujKwfGw4NNozOrlvn3SOwBglTf66LC0+BGzxfsFHaGHv9qRAbiFJ7fhS+4ESb+2S/nAabEp+jsQzTk3stHiFcHzhjerwYcTr7mmUcm5ybj8944=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=mqsXV1zM; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=lgYzIbA9; arc=none smtp.client-ip=202.12.124.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 5C29D7A0199;
	Tue, 16 Sep 2025 16:53:14 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Tue, 16 Sep 2025 16:53:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1758055994;
	 x=1758142394; bh=Sspap9lpfwN5Ay1BEBFO4byTPCgn0/UYUgzdjuBu4V8=; b=
	mqsXV1zMU/kU2FeHQPh4prfZP1KiKLpRW1oKNNBi0BCXAXlFGnkMrc1P62wLhbw0
	njDyHqNJMhg5bm8FPo7hhdREUVlPCaIji0D4zTNhNK34tTeIG6qNSk8JMF1lOHN8
	5GFje1fmzPXXEYOkVGcCyWpEr8nmbh4outVKJfrU+ViFWvsM53EotLjceYBesuI7
	X3H0ayRlJ3BrtGWgEo+C6eAgXl3tPjjyfVNA9FdeZ5iTTi6QQ5RxKxDYKKT6F2h7
	QDkdZl1lTpl6iNy1kuEpQyUXN8YMy7FsOmUiAzg43i/t30kj5zqp3SX+9KI0txpG
	HMi4xtdLT4p2f+bbpqg2BA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1758055994; x=
	1758142394; bh=Sspap9lpfwN5Ay1BEBFO4byTPCgn0/UYUgzdjuBu4V8=; b=l
	gYzIbA9/WKKnXu/hc88qIx1h3yjMVv4Xh08ekQP4ioo0AFM2h9Wyay3jQv6nh+d1
	hZ8L39ELq+7CZOVfWBW0Pdw1jCijWXT5ryPqEup2o+TLNORWCDHJdrVhkvWDcj9j
	QkIG8m7kHeiUNTD4s0Eq+H5UwDR7s3gpTbdvi5icYfGWViDd0eBEXpSKUg29aQtG
	YfUmjjvztnuaEsfMNyS394Wx2hTmcwXGqpfvIIHGmuVKO1Mog+WCpzXp4VO//CSH
	1nKZuOf/v5rZEgCWaBjNPV9IAF/wRSrOPE2knOKhMgWI2VcerTR0R5UDScTVhEAc
	YJfMzKWWW9hle2RAIzGlg==
X-ME-Sender: <xms:Oc7JaPyE8yoJBqZ__SYyVkfyB6HYRaOtIs30slMj44xLFR_Gsr2mRw>
    <xme:Oc7JaBUSZMzBvOP1mkvidRwPtghYL1Mbagb85L0zY30d7V-1kC_9tmMm8VRS9TAKB
    6TNBYg-ieH_Wkqux7k>
X-ME-Received: <xmr:Oc7JaOTc4N3fhYnSsMmWqzBIiC4hASYo4IU-0qq0Ou2U5lVXhxdOF9XKK3a-ig3pqockwDzLPvlfUXb-0CAI1JIh8m_FzC5hHQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdegudehjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeenucfhrhhomheppfhikhhlrghs
    ucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrg
    hssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepfefhleelhfffjefg
    fedugfegjeelhfevheeikefhueelgfdtfeeuhefftddvleeinecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhu
    nhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpthhtohepud
    efpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgt
    hhdprhgtphhtthhopehprghulhesphgsrghrkhgvrhdruggvvhdprhgtphhtthhopegrnh
    gurhgvfidonhgvthguvghvsehluhhnnhdrtghhpdhrtghpthhtohepuggrvhgvmhesuggr
    vhgvmhhlohhfthdrnhgvthdprhgtphhtthhopegvughumhgriigvthesghhoohhglhgvrd
    gtohhmpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehp
    rggsvghnihesrhgvughhrghtrdgtohhmpdhrtghpthhtohephihoshhhihhhihhrohdrsh
    hhihhmohgurgdruhhhsehrvghnvghsrghsrdgtohhmpdhrtghpthhtohepghgvvghrthdo
    rhgvnhgvshgrshesghhlihguvghrrdgsvg
X-ME-Proxy: <xmx:Oc7JaBTIUFNnRlg7CVAv4YSAI9Yqssr5nLZX8N7jkBkiyi7BmzR9cQ>
    <xmx:Oc7JaOcbXXXo8U5MdsKCBlWaS9nGL21Fr0LrYgaAzrPnjTqk7UupKQ>
    <xmx:Oc7JaPe4IXJzPquN-coEDji5hC0HC9EDg5NJ3VwM23THwdI_WCYgpg>
    <xmx:Oc7JaKbyvcoiQen6tWAAmtLbCC9XRuzrwvDgCknZDh2CzjVMRiexyw>
    <xmx:Os7JaFU7wfjymqulja7VGouEgB_eyNzzrCQYVVgi_0tzdZ5AA8gmWwhr>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 16 Sep 2025 16:53:13 -0400 (EDT)
Date: Tue, 16 Sep 2025 22:53:11 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Andrew Lunn <andrew@lunn.ch>
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
Message-ID: <20250916205311.GC1812504@ragnatech.se>
References: <20250916101055.740518-1-niklas.soderlund+renesas@ragnatech.se>
 <20250916101055.740518-7-niklas.soderlund+renesas@ragnatech.se>
 <b52b6209-d0c3-49fb-8e99-3cd16e5121d9@lunn.ch>
 <20250916130848.GD1045278@ragnatech.se>
 <81a21668-4886-40ad-9dc2-f6081396a94d@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <81a21668-4886-40ad-9dc2-f6081396a94d@lunn.ch>

On 2025-09-16 16:49:33 +0200, Andrew Lunn wrote:
> On Tue, Sep 16, 2025 at 03:08:48PM +0200, Niklas Söderlund wrote:
> > On 2025-09-16 14:38:58 +0200, Andrew Lunn wrote:
> > > > @@ -1010,18 +1009,27 @@ static int ravb_rx_rcar(struct net_device *ndev, int budget, int q)
> > > >  				break;
> > > >  			}
> > > >  			skb_mark_for_recycle(skb);
> > > > -			get_ts &= (q == RAVB_NC) ?
> > > > -					RAVB_RXTSTAMP_TYPE_V2_L2_EVENT :
> > > > -					~RAVB_RXTSTAMP_TYPE_V2_L2_EVENT;
> > > > -			if (get_ts) {
> > > > -				struct skb_shared_hwtstamps *shhwtstamps;
> > > > -
> > > > -				shhwtstamps = skb_hwtstamps(skb);
> > > > -				memset(shhwtstamps, 0, sizeof(*shhwtstamps));
> > > > -				ts.tv_sec = ((u64) le16_to_cpu(desc->ts_sh) <<
> > > > -					     32) | le32_to_cpu(desc->ts_sl);
> > > > -				ts.tv_nsec = le32_to_cpu(desc->ts_n);
> > > > -				shhwtstamps->hwtstamp = timespec64_to_ktime(ts);
> > > > +
> > > > +			if (priv->tstamp_rx_ctrl != HWTSTAMP_FILTER_NONE) {
> > > > +				bool get_ts = false;
> > > > +
> > > > +				if (q == RAVB_NC)
> > > > +					get_ts = priv->tstamp_rx_ctrl ==
> > > > +						HWTSTAMP_FILTER_PTP_V2_L2_EVENT;
> > > > +				else
> > > > +					get_ts = priv->tstamp_rx_ctrl !=
> > > > +						HWTSTAMP_FILTER_PTP_V2_L2_EVENT;
> > > > +
> > > > +				if (get_ts) {
> > > > +					struct skb_shared_hwtstamps *shhwtstamps;
> > > > +
> > > > +					shhwtstamps = skb_hwtstamps(skb);
> > > > +					memset(shhwtstamps, 0, sizeof(*shhwtstamps));
> > > > +					ts.tv_sec = ((u64)le16_to_cpu(desc->ts_sh) << 32)
> > > > +						| le32_to_cpu(desc->ts_sl);
> > > > +					ts.tv_nsec = le32_to_cpu(desc->ts_n);
> > > > +					shhwtstamps->hwtstamp = timespec64_to_ktime(ts);
> > > > +				}
> > > 
> > > This hunk is bigger than it needs to be because this block has been
> > > indented further. Maybe keep get_ts as function scope, initialised to
> > > false, so you don't need to touch this block?
> > 
> > Thanks for the suggestion. I could do that. What I like about this is 
> > that it's immediately clear that all this depends on 
> > priv->tstamp_rx_ctrl.
> 
> True.
> 
> As a reviewer, i was asking myself, has the code actually setting the
> timestamp in the skbuf changed? Do i need to look at it in detail?
> There should not be any need for it to change....
> 
> > I could break it out to a separate function if you prefer to reduce the 
> > indentation level,
> 
> It is not really indentation level, but the fact it is in the hunk,
> meaning should i look at it?
> 
> So maybe add a patch which moves the copying of the timestamp from the
> descriptor into the skbuf into a helper. This patch then just calls
> the helper, making this hunk much smaller and more obvious?
> 
> It does look correct as it is, but its just more effort to review.
> Small, simple, obviously correct patches are what we want.

I'm with you on creating small and easy to review patches. I will do as 
you suggest and move this out to a function in a separate patch. Thanks 
for the feedback.

> 
> 	Andrew

-- 
Kind Regards,
Niklas Söderlund

