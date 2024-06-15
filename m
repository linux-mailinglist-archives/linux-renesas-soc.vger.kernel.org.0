Return-Path: <linux-renesas-soc+bounces-6286-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C0D909856
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 15 Jun 2024 14:39:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 144C5B2173A
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 15 Jun 2024 12:39:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14BAC1E867;
	Sat, 15 Jun 2024 12:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="MtqJjGAd";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="KW3yAOI4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout4-smtp.messagingengine.com (fout4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB341B285;
	Sat, 15 Jun 2024 12:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718455138; cv=none; b=Jk+1m8EK2Xk2ivHVcxFZkOIDuH/x7nKXaGqGMXYQKOI83+DDCWC2sqaXunBS40aBt9Zk9O2TnLprKh2ShJlb5lltq+1OfV1PCvgWleR2SFXfQsUFpXlwJULaOp9pyfa3yoyyFniY0z134vDJ37midj2vVvJ2RS4rC67xJjYDhFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718455138; c=relaxed/simple;
	bh=du6zhD+N5zyDT8pBKM/b9KIA1PZteTkvGbUJEF69tyE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nfnngGHhV1HMfA18fpcU+KGw5QpjIg/kOYcgDaM0C7FtYWpChuNqZOgeYZ5QDr4YTKL3dgvT0bdP0U1I9HGsnGY3BSPhWTRTlZcWsAuAQhsSYqVmJF+CaOcYpp1A88CJVRThqX0g7Fk4EOX6VsV/dRH4QdWsgPKOJ7QElwga9/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=MtqJjGAd; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=KW3yAOI4; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailfout.nyi.internal (Postfix) with ESMTP id 8B5131380261;
	Sat, 15 Jun 2024 08:38:53 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Sat, 15 Jun 2024 08:38:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1718455133;
	 x=1718541533; bh=8ZPAXa3cJMYeNZuOL/YKBjZVjrgrecKUgxVGS2O4PZM=; b=
	MtqJjGAdjubA8H2ox6MfXwz7pr8a5+NhQVZU1K3Wa6plaJ3wJA4EI7sfe7Hdq5aY
	Y1FQB77KjFRomcHIblI2N5EOENvdvLZfkzqWkDGb/+HKxRRTDDtT5pcVhjU98NNF
	UFw7y1Cz8DTrwQ2+68GCInobc2sI/SdzPBqL3msH3zATM+VGnEYYP5Iv8mU0vkjb
	BZEIPr5mLnNvrbKpP7hX9TTSHuctYJMS2FSOg158IocCiFnUUMJtZktyQ1mO8QH7
	2p4iibZzToCjte6O99rZ5JnrMqRauv9ciqoiY0D+QtR3mWdVuzfwpCbtQyU9PiDW
	+YWpJZvRNK7kRrSqsuSwUQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1718455133; x=
	1718541533; bh=8ZPAXa3cJMYeNZuOL/YKBjZVjrgrecKUgxVGS2O4PZM=; b=K
	W3yAOI46kgtAOhtwv1S2L7MyVBihUyes0ZzgbAmLEj40fAjYXtkujb1lkk9QTgF2
	KcqDT2CxZANxg2jcSFPYBRqI2ycloS41NlUZq0Gdqappb7T1ZzqkVFj21SeaNOlO
	/PqcORFd7OT2xk9bwxcGvwg4S1P/4oUylhrPRIIMk7b9d5sh6GMJdT40lR1h0Tx3
	cbnMkKwVrb4L1Mmuphn8L2FMz1WMDoNKIEi0+IDEz/BI7bDw4iCwP6C4OwaI+7Mj
	iLZokzON2vUFUWN1lO75PW07zaaX6x1zpRxcLPb22op4m5RCgiZ6x7Z43EsBciyA
	1stCRjWth25MGV2mLA1oQ==
X-ME-Sender: <xms:XIttZoIjxPdaB_cJCTfhqUCEm4ZkMmsIJ7OGJGG2M-2FbkrgIC7Ygw>
    <xme:XIttZoIGOHa1h_HAL-vYGIuYvX4OS_s8AdFgDZclboORBKME30vJXY7wAuwPAKDP8
    ABvrAoyEgKT1mB733w>
X-ME-Received: <xmr:XIttZovp615BVX729VuymTIUTpvfMrbHZJzEC33cyyrUOWJi571ZJu35_ZOaPi5vW4mwfeo3P1mQpZje7Bz_K_0RGj9m5fQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedvuddgheegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhk
    lhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnh
    gvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeejuefhtdeh
    feeuiedtffeuudevvdegteeffefggefhgedvtefgjeehfeetueetvdenucffohhmrghinh
    eprhgrvhgspghgvghnfegphhifpghinhhfohdrnhgvthdprhgrvhgspghgvghnvdgphhif
    pghinhhfohdrnhgvthdprhgrvhgspghriihvvdhmpghhfigpihhnfhhordhnvghtpdhgsg
    gvthhhpghhfigpihhnfhhordhnvghtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghr
    rghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrg
    hssehrrghgnhgrthgvtghhrdhsvg
X-ME-Proxy: <xmx:XIttZla-THmLVRpK6uRX2_l3LrCBLHsbzgN4ShC2ugLN6i2r1OaFvQ>
    <xmx:XIttZvYSOuCFtKaQIODFyX9nNrXzavDH347m_tsIhq4A2BzqrCIqXA>
    <xmx:XIttZhCzcfW5m6QqbLoaPclW_lYglS6OcqPNuy4ISXdi3BEZM2BvcQ>
    <xmx:XIttZlYvpw1ZqflXVTaPbbnVOKrlq65pRo5uyMouj4l3tZw-vNFj3A>
    <xmx:XYttZrqmogD7t8ilnKkkz81jMaKcPO7UwvulBYLF_YEMEt1FDw_SLs2P>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 15 Jun 2024 08:38:52 -0400 (EDT)
Date: Sat, 15 Jun 2024 14:38:49 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Paul Barker <paul.barker.ct@bp.renesas.com>
Cc: Sergey Shtylyov <s.shtylyov@omp.ru>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Mitsuhiro Kimura <mitsuhiro.kimura.kc@renesas.com>,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [net-next PATCH 1/2] net: ravb: Fix maximum MTU for GbEth devices
Message-ID: <20240615123849.GL382677@ragnatech.se>
References: <20240615103038.973-1-paul.barker.ct@bp.renesas.com>
 <20240615103038.973-2-paul.barker.ct@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240615103038.973-2-paul.barker.ct@bp.renesas.com>

Hi Paul,

Thanks for your work.

On 2024-06-15 11:30:37 +0100, Paul Barker wrote:
> The datasheets for all SoCs using the GbEth IP specify a maximum
> transmission frame size of 1.5 kByte. I've confirmed through internal
> discussions that support for 1522 byte frames has been validated, which
> allows us to support the default MTU of 1500 bytes after reserving space
> for the Ethernet header, frame checksums and an optional VLAN tag.
> 
> Fixes: 2e95e08ac009 ("ravb: Add rx_max_buf_size to struct ravb_hw_info")
> Signed-off-by: Paul Barker <paul.barker.ct@bp.renesas.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/net/ethernet/renesas/ravb.h      | 1 +
>  drivers/net/ethernet/renesas/ravb_main.c | 6 +++++-
>  2 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/renesas/ravb.h b/drivers/net/ethernet/renesas/ravb.h
> index 6b2444d31fcc..e592e89b0d96 100644
> --- a/drivers/net/ethernet/renesas/ravb.h
> +++ b/drivers/net/ethernet/renesas/ravb.h
> @@ -1051,6 +1051,7 @@ struct ravb_hw_info {
>  	netdev_features_t net_features;
>  	int stats_len;
>  	u32 tccr_mask;
> +	u32 tx_max_frame_size;
>  	u32 rx_max_frame_size;
>  	u32 rx_buffer_size;
>  	u32 rx_desc_size;
> diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
> index c1546b916e4e..02cbf850bd85 100644
> --- a/drivers/net/ethernet/renesas/ravb_main.c
> +++ b/drivers/net/ethernet/renesas/ravb_main.c
> @@ -2664,6 +2664,7 @@ static const struct ravb_hw_info ravb_gen3_hw_info = {
>  	.net_features = NETIF_F_RXCSUM,
>  	.stats_len = ARRAY_SIZE(ravb_gstrings_stats),
>  	.tccr_mask = TCCR_TSRQ0 | TCCR_TSRQ1 | TCCR_TSRQ2 | TCCR_TSRQ3,
> +	.tx_max_frame_size = SZ_2K,
>  	.rx_max_frame_size = SZ_2K,
>  	.rx_buffer_size = SZ_2K +
>  			  SKB_DATA_ALIGN(sizeof(struct skb_shared_info)),
> @@ -2689,6 +2690,7 @@ static const struct ravb_hw_info ravb_gen2_hw_info = {
>  	.net_features = NETIF_F_RXCSUM,
>  	.stats_len = ARRAY_SIZE(ravb_gstrings_stats),
>  	.tccr_mask = TCCR_TSRQ0 | TCCR_TSRQ1 | TCCR_TSRQ2 | TCCR_TSRQ3,
> +	.tx_max_frame_size = SZ_2K,
>  	.rx_max_frame_size = SZ_2K,
>  	.rx_buffer_size = SZ_2K +
>  			  SKB_DATA_ALIGN(sizeof(struct skb_shared_info)),
> @@ -2711,6 +2713,7 @@ static const struct ravb_hw_info ravb_rzv2m_hw_info = {
>  	.net_features = NETIF_F_RXCSUM,
>  	.stats_len = ARRAY_SIZE(ravb_gstrings_stats),
>  	.tccr_mask = TCCR_TSRQ0 | TCCR_TSRQ1 | TCCR_TSRQ2 | TCCR_TSRQ3,
> +	.tx_max_frame_size = SZ_2K,
>  	.rx_max_frame_size = SZ_2K,
>  	.rx_buffer_size = SZ_2K +
>  			  SKB_DATA_ALIGN(sizeof(struct skb_shared_info)),
> @@ -2735,6 +2738,7 @@ static const struct ravb_hw_info gbeth_hw_info = {
>  	.net_features = NETIF_F_RXCSUM | NETIF_F_HW_CSUM,
>  	.stats_len = ARRAY_SIZE(ravb_gstrings_stats_gbeth),
>  	.tccr_mask = TCCR_TSRQ0,
> +	.tx_max_frame_size = 1522,
>  	.rx_max_frame_size = SZ_8K,
>  	.rx_buffer_size = SZ_2K,
>  	.rx_desc_size = sizeof(struct ravb_rx_desc),
> @@ -2946,7 +2950,7 @@ static int ravb_probe(struct platform_device *pdev)
>  	priv->avb_link_active_low =
>  		of_property_read_bool(np, "renesas,ether-link-active-low");
>  
> -	ndev->max_mtu = info->rx_max_frame_size -
> +	ndev->max_mtu = info->tx_max_frame_size -
>  		(ETH_HLEN + VLAN_HLEN + ETH_FCS_LEN);
>  	ndev->min_mtu = ETH_MIN_MTU;
>  
> -- 
> 2.39.2
> 

-- 
Kind Regards,
Niklas Söderlund

