Return-Path: <linux-renesas-soc+bounces-11984-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62442A075FC
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Jan 2025 13:45:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 96A563A1779
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Jan 2025 12:45:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16B87216E37;
	Thu,  9 Jan 2025 12:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="hli4JEZ6";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="EgirdQLs"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8174B802;
	Thu,  9 Jan 2025 12:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736426746; cv=none; b=nLpJt+5MHgTeVuJtwN2Naup8sVs7Yr9clSkkpQLg/pHWiBK7BT/RSEPTRVilvhgyHYE7BYCecLhmiVHZzY4CNe85hERcmDBOXhYMhQD7cXXqZ92J9dm2e/wF2RmlUNrcX00ZSKY6hbrRiB9qvTPMFv9hjSDmOERcsaSjHVp3OIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736426746; c=relaxed/simple;
	bh=kkNkCQyXS23nIqEL3zoEHxlEQniH4nfkUpW/nTL8N8s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PfIEDnYoaBGf6JAM6Q5h1zoPTkp52Bz103NHCdi06qk4BOu1m5RupZnAqZspmA5inP1lNW6/jZHklG53WqpbRCzULJgY46z0GjSpIgUcrY3+XonXprQTP1eC8kq5WNSPC1V7RtWKEmYrUcHT6USr1I1ibMPHwbypfR0rW6mcJk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=hli4JEZ6; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=EgirdQLs; arc=none smtp.client-ip=202.12.124.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 5B9D82540184;
	Thu,  9 Jan 2025 07:45:42 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Thu, 09 Jan 2025 07:45:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1736426742;
	 x=1736513142; bh=4HfbkcoM6ShhVV3pgNRaBb/fX8MsUZSoXh2AIHC7HA4=; b=
	hli4JEZ6Z+k/GBDvhVgkgBE1f91R2VYZwp8fbfEO80k6DZDs+ooPeGonzNNcK14y
	zipDH8kvvJskXSh2TK7o8iJrj1AeJRDFrf4yeROxXdvgKFNZHUcjMIb8D2mFq3lZ
	2hFW8XYrqi1JX1lY+DcJ9cFk6DJ3kNlRbFUYwzPcAW65UScBd/2TuVfsk9qmpzGH
	6Ky9D+i9MxmlhvbMB0FVjQ9eD6pFVEdND42wjBURpCv7zAEm6KZ9Nt6PggmYWZbo
	w3bZiFKW52Ekg5WL6IewwDRCTG2b+9ZTGM1CuyuZRlXMeuQMLCtpkHJJQ7yy9ciM
	RRnXgS/PNl/em/NpuuebzQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1736426742; x=
	1736513142; bh=4HfbkcoM6ShhVV3pgNRaBb/fX8MsUZSoXh2AIHC7HA4=; b=E
	girdQLswsQQ2Cnw0+gTtXIisRmgKdny6xMOplf2QMjKFW6X5fi0gLdZYOLN3vLIL
	lPvqtNnFx2c7vVlKEmA/YmdtaouzPmXFcw36buF6ezOxDewokWpQ/nxSoVNkZiSm
	Br71yGW4OhZoSujTqn6ZJJ8CW50+f6YFgjclCZ047Dk5aNGaWOYhZ89RLFkrKwcT
	HCn7YMYCR/N9t6iEw59RKCDCnlaq00fCz5Tg/2VAdKOzzKeYIRZhI6V5JcdPDPJ4
	S0dTDxbB8d8lGP8FY7oMu47VALK8yAI1FvV+e1Cdwwn1OBGmW+v49PwFTL27+tqs
	yYAJpbZmxHDK9e3RbToCw==
X-ME-Sender: <xms:9cR_Z6Q86ObzoMV44TsOs5OSnvpn4Dy5aKO-1id_Gu4TTkvSud1rdw>
    <xme:9cR_Z_xFg16yS9Vx_5c1CbIg7U1ALo9TGFwWI4Vu8ihY4SQEZfnloaHb11p1us8hb
    OBEwrIXYqdV40OVeg4>
X-ME-Received: <xmr:9cR_Z32MdTLFnkvFNGScuyHDA1ubEEE6TRJaZD8IHKgccU8AxWkgFkQiWJgwulvbV7by0JBNc9hP7i5zqisxsrKU7YwAK3g0Gw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudegiedggedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdej
    necuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhoug
    gvrhhluhhnugesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpefgfedu
    gffgteekvdfgieelueettdejvddukeegtdfgudduveduiedvgfdvieeiueenucffohhmrg
    hinheprhgrvhgspghriihvvdhmpghhfigpihhnfhhordhnvghtnecuvehluhhsthgvrhfu
    ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlh
    hunhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpthhtohepuddtpdhmohguvgep
    shhmthhpohhuthdprhgtphhtthhopehprghulhdrsggrrhhkvghrrdgtthessghprdhrvg
    hnvghsrghsrdgtohhmpdhrtghpthhtoheprghnughrvgifodhnvghtuggvvheslhhunhhn
    rdgthhdprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpth
    htohepvgguuhhmrgiivghtsehgohhoghhlvgdrtghomhdprhgtphhtthhopehprggsvghn
    ihesrhgvughhrghtrdgtohhmpdhrtghpthhtohephhhorhhmsheskhgvrhhnvghlrdhorh
    hgpdhrtghpthhtohepshdrshhhthihlhihohhvsehomhhprdhruhdprhgtphhtthhopehn
    vghtuggvvhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqd
    hrvghnvghsrghsqdhsohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:9cR_Z2CLZEYIJ8Zm_vDSPZ_xazYxuVG0HiMJf6Hv3N01yHc8SqR_rQ>
    <xmx:9cR_Zzhcy0b_ZIzKSzP9hR1K4Y_n8Dutt4HMoOKj-FNZ_PlSQWe3hA>
    <xmx:9cR_Zyow9-2U1QeOE30soSYjqGYXEBx7WldqOdHL5DD_vj3H85jrbA>
    <xmx:9cR_Z2jP2qzn1mlUnvQPbcETTUxIWxuR9avg06kXQvdRekFWxL7dAA>
    <xmx:9sR_Z4ZsIeoNxZOltgFFLW-S-IPn2X-OotFxFOCkubqDoVBEODSc2LdH>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 9 Jan 2025 07:45:40 -0500 (EST)
Date: Thu, 9 Jan 2025 13:45:38 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Paul Barker <paul.barker.ct@bp.renesas.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Sergey Shtylyov <s.shtylyov@omp.ru>, netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [net PATCH] net: ravb: Fix max TX frame size for RZ/V2M
Message-ID: <20250109124538.GR2766897@ragnatech.se>
References: <20250109113706.1409149-1-paul.barker.ct@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250109113706.1409149-1-paul.barker.ct@bp.renesas.com>

Hi Paul,

Nice catch.

On 2025-01-09 11:37:06 +0000, Paul Barker wrote:
> When tx_max_frame_size was added to struct ravb_hw_info, no value was
> set in ravb_rzv2m_hw_info so the default value of zero was used.
> 
> The maximum MTU is set by subtracting from tx_max_frame_size to allow
> space for headers and frame checksums. As ndev->max_mtu is unsigned,
> this subtraction wraps around leading to a ridiculously large positive
> value that is obviously incorrect.
> 
> Before tx_max_frame_size was introduced, the maximum MTU was based on
> rx_max_frame_size. So, we can restore the correct maximum MTU by copying
> the rx_max_frame_size value into tx_max_frame_size for RZ/V2M.
> 
> Fixes: 1d63864299ca ("net: ravb: Fix maximum TX frame size for GbEth devices")
> Signed-off-by: Paul Barker <paul.barker.ct@bp.renesas.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/net/ethernet/renesas/ravb_main.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
> index ac0f093f647a..bc395294a32d 100644
> --- a/drivers/net/ethernet/renesas/ravb_main.c
> +++ b/drivers/net/ethernet/renesas/ravb_main.c
> @@ -2763,6 +2763,7 @@ static const struct ravb_hw_info ravb_rzv2m_hw_info = {
>  	.net_features = NETIF_F_RXCSUM,
>  	.stats_len = ARRAY_SIZE(ravb_gstrings_stats),
>  	.tccr_mask = TCCR_TSRQ0 | TCCR_TSRQ1 | TCCR_TSRQ2 | TCCR_TSRQ3,
> +	.tx_max_frame_size = SZ_2K,
>  	.rx_max_frame_size = SZ_2K,
>  	.rx_buffer_size = SZ_2K +
>  			  SKB_DATA_ALIGN(sizeof(struct skb_shared_info)),
> 
> base-commit: 2d2d4f60ed266a8f340a721102d035252606980b
> -- 
> 2.39.5
> 

-- 
Kind Regards,
Niklas Söderlund

