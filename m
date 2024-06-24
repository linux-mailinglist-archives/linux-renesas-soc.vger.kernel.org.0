Return-Path: <linux-renesas-soc+bounces-6706-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA749152BA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Jun 2024 17:42:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2C8E21F210D3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Jun 2024 15:42:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B540319CD00;
	Mon, 24 Jun 2024 15:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="qfpsI0Km";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="WfTEuxU3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh1-smtp.messagingengine.com (fhigh1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D789313E024;
	Mon, 24 Jun 2024 15:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719243750; cv=none; b=pyr0pcyHe9yT0aWhFdg1rSB0VB2zELlOfasWQkgl9ktR0jycBiKKs3314nmOZq3lTOrIKE7FQmsDJqRTiB7i+WhfHzyqVzRDNFsyW7ouS2f3Y5b/oStMeKPWhzJOnMYkQKPkGENECjDFqv+F6AQgnM7oInzDDJf5TW7BDK3+QVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719243750; c=relaxed/simple;
	bh=5JMeSmLDsLkgsIaTR6mhIXS+mNgEMglyV3WnKwkjeOE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BsQ0569+28Wqe766dvC2uw+hmIMhaVX0SRpr5knOztoQ9FvASZFKZD+OhCz9f2LItTR6ufXIvhP66DtXxVurapMIXYTKVVPVgt0q12ch/ppGSEkm9rguNccJrlR3a+Mq8BvmHzUp30fcx6/+GMGDODHV/poZIs42rTKJMFZAv38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=qfpsI0Km; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=WfTEuxU3; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id B5D2A11401AE;
	Mon, 24 Jun 2024 11:42:26 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Mon, 24 Jun 2024 11:42:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1719243746;
	 x=1719330146; bh=UuK+dPrRUuBD9ku4mDUSLtpeCuo0xD0S3t8rztLcRiI=; b=
	qfpsI0KmRAUZlwbCn+1R9+oP78vDyzDnPuZtpCQ4Z1muGGEq7B0qivDpjQ4/6G9H
	dONRq6/N+wMZeZcwSVCcjOVH2SkGaFuP9DP4xtzyldTg38eJearW16QQ3YTfdnB7
	WVbDWenLa61tphHvgs/YZs3Z2NU3oEP8t/OoUDclWj4uPpvp/Oz9mXPKLN1lNb0z
	fZ72I/fSeWPNvwx4BlNhwilvRbGof+na1JKNZqNa/7BYbTro2+W7krVFedTNyoZt
	a+FmnhZWjh2IWipIn8jOSvz3BZOrH8cAt0d4OQB14anTXHCet7I4+tzC9azYY8P+
	9z6MjaNsqWcTKijvFayukg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1719243746; x=
	1719330146; bh=UuK+dPrRUuBD9ku4mDUSLtpeCuo0xD0S3t8rztLcRiI=; b=W
	fTEuxU3x7Fsa4F2fgMvu9yAu6d+5H/6MxxObV+nvZ5Gryg/TTM4yEkD9hj4G4A68
	KS/pgRfkUs7TMmrImNsDlPCW5JDR0/t0pf4sft3inRAYMGATqKChsOhyQ/P2fm10
	BCE617Y0RN+nmLtUjRbumDqs/hz9lu/sIzb/LgtG2rShhixcYX0K0IHsWQcwTAoZ
	cyU5PMHdMctKSE/Sx7XgYsVrKjMDWreE1by/SCyI6bWBg9UIqB4NBsEGPPOYfRe0
	qscsLUFtuua7bdzFTRTxbkzyKoshCPXVn4TJvl6gBHt1/aRFDLxQDFIJyZQ1qvpC
	Fc3yqfNGXQQY1JuImHoIw==
X-ME-Sender: <xms:4pN5ZkwS-5I370YnVd8O5oWKMS3iwM-6Lx7mKtpja7FfRtdDoZVH1g>
    <xme:4pN5ZoQuXTUv4RxFHFsz7MI-3bkUeK5m-BsvQfqjo0Q0NwIE1G4AgHbKRQNJO6PdP
    NdRZOhiBEqLX7SsFIo>
X-ME-Received: <xmr:4pN5ZmW-h8FJs_wBxHpAVdRs8Ng1c_TbdODbBQynHffiI2EeK7SIgKdICGV_a9Odx7KK4DuWe6hBqw9T_m4HDbaUUnvP_v8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfeeguddgleefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhk
    lhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnh
    gvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeefhfellefh
    ffejgfefudfggeejlefhveehieekhfeulefgtdefueehffdtvdelieenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggv
    rhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:4pN5Zig72rsHdXEg-fSaBFUwbEsRreM9Ux-h_E_8MDmHYqVPccpaJg>
    <xmx:4pN5ZmDkNIL3jlNBdCgrx3MsYhvM7O32f2VWWNoPJCipK7TzuGZ8Lw>
    <xmx:4pN5ZjIZGj8eEZwQPnMpF7u66XWoDI2M8mQgjf2vSniRp07dn8aKTw>
    <xmx:4pN5ZtA3dVkNoqT54-lJOBxjoO9DStlxWnG61POixPYQ7F3oOioUDA>
    <xmx:4pN5ZnLcEKMmVtY_PHGypXIZqbyww67Yx1ZP65yBaBbNINQeQL76v9VZ>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 24 Jun 2024 11:42:25 -0400 (EDT)
Date: Mon, 24 Jun 2024 17:42:23 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Sergey Shtylyov <s.shtylyov@omp.ru>,
	Paul Barker <paul.barker.ct@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH net-next v2 1/2] ravb: Improve ravb_hw_info instance order
Message-ID: <20240624154223.GE3655345@ragnatech.se>
References: <cover.1719234830.git.geert+renesas@glider.be>
 <a76febe3737e26365a784e9193da9363f22aa550.1719234830.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a76febe3737e26365a784e9193da9363f22aa550.1719234830.git.geert+renesas@glider.be>

Hi Geert,

Thanks for your work.

On 2024-06-24 15:25:24 +0200, Geert Uytterhoeven wrote:
> Move ravb_gen2_hw_info before ravb_gen3_hw_info to match
> ravb_match_table[] order.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> v2:
>   - New.
> ---
>  drivers/net/ethernet/renesas/ravb_main.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
> index c1546b916e4ef581..974e0bb9da1947f2 100644
> --- a/drivers/net/ethernet/renesas/ravb_main.c
> +++ b/drivers/net/ethernet/renesas/ravb_main.c
> @@ -2652,7 +2652,7 @@ static int ravb_mdio_release(struct ravb_private *priv)
>  	return 0;
>  }
>  
> -static const struct ravb_hw_info ravb_gen3_hw_info = {
> +static const struct ravb_hw_info ravb_gen2_hw_info = {
>  	.receive = ravb_rx_rcar,
>  	.set_rate = ravb_set_rate_rcar,
>  	.set_feature = ravb_set_features_rcar,
> @@ -2668,16 +2668,13 @@ static const struct ravb_hw_info ravb_gen3_hw_info = {
>  	.rx_buffer_size = SZ_2K +
>  			  SKB_DATA_ALIGN(sizeof(struct skb_shared_info)),
>  	.rx_desc_size = sizeof(struct ravb_ex_rx_desc),
> -	.internal_delay = 1,
> -	.tx_counters = 1,
> -	.multi_irqs = 1,
> -	.irq_en_dis = 1,
> -	.ccc_gac = 1,
> +	.aligned_tx = 1,
> +	.gptp = 1,
>  	.nc_queues = 1,
>  	.magic_pkt = 1,
>  };
>  
> -static const struct ravb_hw_info ravb_gen2_hw_info = {
> +static const struct ravb_hw_info ravb_gen3_hw_info = {
>  	.receive = ravb_rx_rcar,
>  	.set_rate = ravb_set_rate_rcar,
>  	.set_feature = ravb_set_features_rcar,
> @@ -2693,8 +2690,11 @@ static const struct ravb_hw_info ravb_gen2_hw_info = {
>  	.rx_buffer_size = SZ_2K +
>  			  SKB_DATA_ALIGN(sizeof(struct skb_shared_info)),
>  	.rx_desc_size = sizeof(struct ravb_ex_rx_desc),
> -	.aligned_tx = 1,
> -	.gptp = 1,
> +	.internal_delay = 1,
> +	.tx_counters = 1,
> +	.multi_irqs = 1,
> +	.irq_en_dis = 1,
> +	.ccc_gac = 1,
>  	.nc_queues = 1,
>  	.magic_pkt = 1,
>  };
> -- 
> 2.34.1
> 

-- 
Kind Regards,
Niklas Söderlund

