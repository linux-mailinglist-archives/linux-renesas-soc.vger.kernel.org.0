Return-Path: <linux-renesas-soc+bounces-8461-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD51C962B07
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Aug 2024 17:03:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D1E231C23121
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Aug 2024 15:03:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ED5818A93C;
	Wed, 28 Aug 2024 15:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="geNhUTf6";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="OB5SN3gs"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh8-smtp.messagingengine.com (fhigh8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D1E1891AC;
	Wed, 28 Aug 2024 15:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724857425; cv=none; b=nZJ/hb793/sa1dObSQWnVFrZKHNe+105T2uKCCw/KOs2ABMWhJ4hBVcdiwNt5RMsduyudUeTXfKZb0jmbvVLlkhTLev49z/xbrodbjyOnoWHLs0VlH+F4tttN95HzXWJZucYfgmywSqHLSIefhj4udn3ECovHQY7rAWctJmaWcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724857425; c=relaxed/simple;
	bh=yEUS2+We6pYU5E5aUU6qY7JHegaAWPxXgJVKjsaaybw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TRD3qGaVRzBeqV/7llbPB8ZsSRp+pjXyqE/JowRdwCnyHpdJ+y6k6Uv3nORbb6Q6nOieMRiWWiZkmNI7vsrv0IPI/txDNxxdN5Wl56aHJ/+Gft/77B3yD4ERB/dqkw/FbBSd1QDam1/JaTqKrtRKs5W3jPdgvovbPMnZlpcwiqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=geNhUTf6; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=OB5SN3gs; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-02.internal (phl-compute-02.nyi.internal [10.202.2.42])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 08F6C1151B49;
	Wed, 28 Aug 2024 11:03:42 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Wed, 28 Aug 2024 11:03:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1724857421;
	 x=1724943821; bh=RYAedfyLuVntN+kLSt9YJMUi7beiuO1xRvYSBZFsvXM=; b=
	geNhUTf6vyHVdZck3OF+RSzjQNIWfNXpFDRRITTuC+K7Tj9j5Lqh8YB9VCHgQem4
	/QTGXlxJCkU4rcVrISAIStO1oUgvrQrhgnEqX/kNCQEHvRJN4fRQMmsD7Xn8QgNu
	kBtkSSs1m0G7i7Pj+6ChpGodhHcATr+hmx0te81UiUxXdEZHYsPjckmDuOF8pV15
	tWIJHf+Ge33XabGeg67lSgIUiH2i6bgebe0L9+KvC2hP1IdIOoj9JdNBBbr2cYyL
	F8HeySqKFH5v5sKuCt1VR+GG0Q4KxmJsVJkYU7HrIqyok5yFz7gKHYjVKDwIfOhB
	tMZsBbwbw8HW/uNzbtDxRQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1724857421; x=
	1724943821; bh=RYAedfyLuVntN+kLSt9YJMUi7beiuO1xRvYSBZFsvXM=; b=O
	B5SN3gsPcaVFxiRH0Dvh0noSPMW8CqJd84ThysM+JgmGJng1mXqe+8L+lflD0pyP
	8GJdo9arSmgwRvNw/E0oLpcke7/qX5Qs/9TxKGJHGlMZ+5bTlC2NibNnzBxBk2T9
	8JP4zMYjxP/eyg+aVKiT5K0P3tVVG9KrbhsJXM36srrScy4ehFZvL9dp4Eddh5hd
	foBLgGtCffKsL8iw8rVAttNLe74DCmt4sfsxcXSdsa73FryC1kEuCDnzyRDBZ7XQ
	VWhQbw6scUr0C1z9ytY6BhayZR2XO4rh79yb29qtoP5loiKInv18ailaOoM4yQeo
	NPGUqOtIf/PL6hgqNviqg==
X-ME-Sender: <xms:TDzPZhGBaB3uh8vwe2vr3vSCti0f-UyCYY_lIO2ifrhJNm2b_Apvqg>
    <xme:TDzPZmVWFmuSlRE5GG39TL825SXCOtR2eeOtC_aabX6hzN40Sd1yGTHBjp6zy42SW
    oywnthVG-WxwG8UDUM>
X-ME-Received: <xmr:TDzPZjLfndxBlea6C5s-dV3taf-OFjdydTE-5Xe7WmoVGsSEhg029zWRTAZA0L9Gq7Q2bD2ajz0XMRB0yEYIkoluCe9URskiXw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudefvddgkedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdej
    necuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhoug
    gvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrght
    thgvrhhnpeefhfellefhffejgfefudfggeejlefhveehieekhfeulefgtdefueehffdtvd
    elieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehn
    ihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrsh
    gvpdhnsggprhgtphhtthhopeduhedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohep
    phgruhhlrdgsrghrkhgvrhdrtghtsegsphdrrhgvnhgvshgrshdrtghomhdprhgtphhtth
    hopehsrdhshhhthihlhihovhesohhmphdrrhhupdhrtghpthhtohepuggrvhgvmhesuggr
    vhgvmhhlohhfthdrnhgvthdprhgtphhtthhopegvughumhgriigvthesghhoohhglhgvrd
    gtohhmpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehp
    rggsvghnihesrhgvughhrghtrdgtohhmpdhrtghpthhtoheprghnughrvgifsehluhhnnh
    drtghhpdhrtghpthhtohepsghijhhurdgurghsrdhjiiessghprdhrvghnvghsrghsrdgt
    ohhmpdhrtghpthhtoheptghlrghuughiuhdrsggviihnvggrrdhujhessghprdhrvghnvg
    hsrghsrdgtohhm
X-ME-Proxy: <xmx:TDzPZnFguihRVYpr9m4yCUze_O1GyGrzvOM7uSJ0zZKaRs7-TaelNg>
    <xmx:TDzPZnVacOxINjom0KDrDkn8GBMUvDhfmzjDMCtx3wriv_DVWksOXg>
    <xmx:TDzPZiM-3vckoPVg23pKE6l8WHrXkvHo-PCGYcfI3s_LsZKPgjLJJw>
    <xmx:TDzPZm14VUr3C7w0sFlH8_wFQViRI55aKzEwfQMvexQ4sdxe9FBajw>
    <xmx:TTzPZgWL2gAl33M_n1wdxhySEdjXuDSiJFhGyhdmj-Foqo6EZP5uKrYs>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 28 Aug 2024 11:03:39 -0400 (EDT)
Date: Wed, 28 Aug 2024 17:03:37 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Paul Barker <paul.barker.ct@bp.renesas.com>
Cc: Sergey Shtylyov <s.shtylyov@omp.ru>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew@lunn.ch>, Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Mitsuhiro Kimura <mitsuhiro.kimura.kc@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [net PATCH v2 2/2] net: ravb: Fix R-Car RX frame size limit
Message-ID: <20240828150337.GA3306821@ragnatech.se>
References: <20240828102226.223-1-paul.barker.ct@bp.renesas.com>
 <20240828102226.223-3-paul.barker.ct@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240828102226.223-3-paul.barker.ct@bp.renesas.com>

Hi Paul,

Thanks for your work.

On 2024-08-28 11:22:26 +0100, Paul Barker wrote:
> The RX frame size limit should not be based on the current MTU setting.
> Instead it should be based on the hardware capabilities.
> 
> Fixes: c156633f1353 ("Renesas Ethernet AVB driver proper")
> Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>
> Signed-off-by: Paul Barker <paul.barker.ct@bp.renesas.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/net/ethernet/renesas/ravb_main.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
> index 471a68b0146e..b103632de4d4 100644
> --- a/drivers/net/ethernet/renesas/ravb_main.c
> +++ b/drivers/net/ethernet/renesas/ravb_main.c
> @@ -555,8 +555,10 @@ static void ravb_emac_init_gbeth(struct net_device *ndev)
>  
>  static void ravb_emac_init_rcar(struct net_device *ndev)
>  {
> +	struct ravb_private *priv = netdev_priv(ndev);
> +
>  	/* Receive frame limit set register */

I wonder if we also should expand this comment to explain the addition 
of ETH_FCS_LEN, I have to look this up every time :-) How would you feel 
about adding something like?

    /* Set receive frame length
     *
     * The length set here described the frame from the destination 
     * address up to and including the CRC data. However only the frame 
     * data, exuding the CRC, are transferred to memory. To allow for 
     * the largest frames add the CRC length to the maximum Rx 
     * descriptor size.
     */

> -	ravb_write(ndev, ndev->mtu + ETH_HLEN + VLAN_HLEN + ETH_FCS_LEN, RFLR);
> +	ravb_write(ndev, priv->info->rx_max_frame_size + ETH_FCS_LEN, RFLR);
>  
>  	/* EMAC Mode: PAUSE prohibition; Duplex; RX Checksum; TX; RX */
>  	ravb_write(ndev, ECMR_ZPF | ECMR_DM |
> -- 
> 2.43.0
> 

-- 
Kind Regards,
Niklas Söderlund

