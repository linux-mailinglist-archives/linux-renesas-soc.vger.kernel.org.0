Return-Path: <linux-renesas-soc+bounces-21923-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD36B59706
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Sep 2025 15:09:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5FFD87AC968
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Sep 2025 13:07:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C41A3313290;
	Tue, 16 Sep 2025 13:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="XrFnaE0t";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Dqx1tW24"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7773830EF92;
	Tue, 16 Sep 2025 13:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758028135; cv=none; b=UESPh9M0pxzCpgTP0rT17aQEvyStJtQFeqDluev3HfEWHc1Dhz31u2DNDnquu1KEVUxCgZPN8lGfLS/4MIkDvtt/fAvaUIGMxORHDbmHmdpmfxfkSjvSyIx8y/K5nQNUIW7Zlmc8ZntwyU2X+6Pj8oyYOCQLlh+Do22XLAWZseo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758028135; c=relaxed/simple;
	bh=WeTBIfSJ5Z8ivbbBQqRNRmhhqLaZsrw58259nQwZ/0o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=siAN5oCV0LKNm7oIfW0NBPbeX6+q60Kwwq9HMvySEFtoqbqhKKWz8Sak/YpWyvcXipXJgSS94bC63abeQiYRQaj5D50tB3VJve0pmJ+WKgUvORhP3Lc1ily96z/6YvWB6MAIbQnntRfPZFfPruQAkPMrLvP/3oS51qhEIbGqcHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=XrFnaE0t; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Dqx1tW24; arc=none smtp.client-ip=202.12.124.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 3AC6E7A02BB;
	Tue, 16 Sep 2025 09:08:52 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Tue, 16 Sep 2025 09:08:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1758028132;
	 x=1758114532; bh=OFomf3Gkg99WJzC0kc3CgX2BW0qAYCzUzDBFtqLeVlQ=; b=
	XrFnaE0t/fWQG9RXKlN2OjCgdCwwMzORY9y190V7eMqU1zZWAS1jsWWS4V544xux
	WcUiYFIK2oGTUccuSeyE5sGQUZHaitVJmi09DSjg+30F3KBJ238YCvwAtu+pIvzC
	hT6RbzYJESYC2Js0as/Ci14DMZPXUBullvHGHEFcjpGHTds2pvI8zr1Znz/E25ts
	3Xp5P6jid5EcQUPFj+uOkCgdvoe680rqlNJUKhkaEiDTXOzI5SPoC8U9J98zX3jZ
	VTEeavunHLge9KcsUkk+27+txn0fasVzSC2GcUUTT2YbtprW8W1MowVrMwIo2tbe
	XzKYJRN3oBy1Ok9CtgDn6Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1758028132; x=
	1758114532; bh=OFomf3Gkg99WJzC0kc3CgX2BW0qAYCzUzDBFtqLeVlQ=; b=D
	qx1tW24HJaXqIQiIF5j/B3Ae/KSvO7LEEkwMQb/SNCf4NYP20NzIKxQFqglmv0qL
	vgKvZ/pUGH0DqHh2JwwsYtoI5TjMJjnDmQrK0SuXxtFx6s0tj7yHkgDCsdVnzYOj
	V54V2CXjbcf6sW/w9uLILD1SbakDIyvoHQVEC5qsoOycf/1+JdRwCPLowcDGg2TR
	3GXZLGj2U3Kduw8DoZxtCmsOpIxijQYzBvCa6q6P9zOoGc7UiHRkDfCeq2VebUFH
	Zlg6cBkpxlGN1+fLAf/2yhUK4x6GzVR3nX/j7S86a1+YebdsE1S5KgIlSau6W/Hf
	keVssymBw33uhepym0llw==
X-ME-Sender: <xms:Y2HJaJYgjlQyzkwR0Bo99nFByNzjPPIxtq0QGDygBXz_LJZFtjLXuQ>
    <xme:Y2HJaNHvvN1AU0wUZ1ehxnaTGHNS4VxYsAWy3hCRRCp_LLP4i9XMWCH7dytAoNBB1
    F53xYiVfLsutsYTbEA>
X-ME-Received: <xmr:Y2HJaP3EgfVzPgwC8Q5jFwmv2BRKYQlaMXBYUQhAqTPRE4MEV9Wn2B1ZPnezTigBKJZRoyHpd-dM_O5p5sMvC49TymGscWPgpg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdegtdeiiecutefuodetggdotefrod
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
X-ME-Proxy: <xmx:Y2HJaBwhPrw3fTDwU9Gfv_erGowK_ygOmbLwzYXDhSNSu-LOm2Y5jg>
    <xmx:Y2HJaIiOeo3erKwjAlTU9t1du-goPsXOeFid3tnWpltTzv5HhfXFFw>
    <xmx:Y2HJaGMnHd96LFFYhgKpytPDFJzJlmSu-23s0Qpijd7Ko6nLEA56Fw>
    <xmx:Y2HJaDc_e3l_U5bHMw7g89nRwmLlfh5FsxxyAJagm1MKDhzEHOQ9sA>
    <xmx:ZGHJaKqa3Qj5zforCSeMfkUJUtSetg7b8cDYKfaMQu1AA9UJ0PmD8KoG>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 16 Sep 2025 09:08:50 -0400 (EDT)
Date: Tue, 16 Sep 2025 15:08:48 +0200
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
Message-ID: <20250916130848.GD1045278@ragnatech.se>
References: <20250916101055.740518-1-niklas.soderlund+renesas@ragnatech.se>
 <20250916101055.740518-7-niklas.soderlund+renesas@ragnatech.se>
 <b52b6209-d0c3-49fb-8e99-3cd16e5121d9@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b52b6209-d0c3-49fb-8e99-3cd16e5121d9@lunn.ch>

On 2025-09-16 14:38:58 +0200, Andrew Lunn wrote:
> > @@ -1010,18 +1009,27 @@ static int ravb_rx_rcar(struct net_device *ndev, int budget, int q)
> >  				break;
> >  			}
> >  			skb_mark_for_recycle(skb);
> > -			get_ts &= (q == RAVB_NC) ?
> > -					RAVB_RXTSTAMP_TYPE_V2_L2_EVENT :
> > -					~RAVB_RXTSTAMP_TYPE_V2_L2_EVENT;
> > -			if (get_ts) {
> > -				struct skb_shared_hwtstamps *shhwtstamps;
> > -
> > -				shhwtstamps = skb_hwtstamps(skb);
> > -				memset(shhwtstamps, 0, sizeof(*shhwtstamps));
> > -				ts.tv_sec = ((u64) le16_to_cpu(desc->ts_sh) <<
> > -					     32) | le32_to_cpu(desc->ts_sl);
> > -				ts.tv_nsec = le32_to_cpu(desc->ts_n);
> > -				shhwtstamps->hwtstamp = timespec64_to_ktime(ts);
> > +
> > +			if (priv->tstamp_rx_ctrl != HWTSTAMP_FILTER_NONE) {
> > +				bool get_ts = false;
> > +
> > +				if (q == RAVB_NC)
> > +					get_ts = priv->tstamp_rx_ctrl ==
> > +						HWTSTAMP_FILTER_PTP_V2_L2_EVENT;
> > +				else
> > +					get_ts = priv->tstamp_rx_ctrl !=
> > +						HWTSTAMP_FILTER_PTP_V2_L2_EVENT;
> > +
> > +				if (get_ts) {
> > +					struct skb_shared_hwtstamps *shhwtstamps;
> > +
> > +					shhwtstamps = skb_hwtstamps(skb);
> > +					memset(shhwtstamps, 0, sizeof(*shhwtstamps));
> > +					ts.tv_sec = ((u64)le16_to_cpu(desc->ts_sh) << 32)
> > +						| le32_to_cpu(desc->ts_sl);
> > +					ts.tv_nsec = le32_to_cpu(desc->ts_n);
> > +					shhwtstamps->hwtstamp = timespec64_to_ktime(ts);
> > +				}
> 
> This hunk is bigger than it needs to be because this block has been
> indented further. Maybe keep get_ts as function scope, initialised to
> false, so you don't need to touch this block?

Thanks for the suggestion. I could do that. What I like about this is 
that it's immediately clear that all this depends on 
priv->tstamp_rx_ctrl.

If I keep the chunk as-is it gives the impression there is some other 
condition other then priv->tstamp_rx_ctrl that could set get_ts and make 
a valid use-case of reading the timestamp from the descriptor.

I could break it out to a separate function if you prefer to reduce the 
indentation level,

static void ravb_rx_rcar_hwstamp(...)
{
    bool get_ts = false;

    ...

    if (get_ts) {
        ....
    }

}

static int ravb_rx_rcar(..)
{
    ...

    if (priv->tstamp_rx_ctrl != HWTSTAMP_FILTER_NONE)
        ravb_rx_rcar_hwstamp(...);

    ...
}

Would that work ?

> 
> 	Andrew

-- 
Kind Regards,
Niklas Söderlund

