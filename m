Return-Path: <linux-renesas-soc+bounces-9729-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9C899D883
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Oct 2024 22:50:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 64F001F21A3D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Oct 2024 20:50:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE6D21C8FD3;
	Mon, 14 Oct 2024 20:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="Qn7p/5u8";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="oiklqbPy"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A49A14D439;
	Mon, 14 Oct 2024 20:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728939053; cv=none; b=O05AMU2dUSJ+OT2qNicAnGLF5kv6RG5jJ7NKGDS09CxcH2/wvF0lKA3nA5Jum5gkCrKryRy17OH7V1yrHmDtm+ycvecs5Ue1TMaDRl2UmURmo6SRZPA8LNTREARL7Dlh/hM3Yhk5wm1IFHoFnT/hC5m8Z+EwYjgUxp01/fGMaqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728939053; c=relaxed/simple;
	bh=MFSqcmv5mo5wth8zzxQu2vIn2rZtGDVYxVmiNss7a4w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JNkdiRAOwt4WOACKY0dg5LQ+ocLRKILnUUbCxgC0YvXVcfZW77AX84/8lWrfmr+yZxTYTMC+ZNY/RtJCk0DMH8joWvVp5QGBR+2Oa8ZvKzEFZKAOgPq4O62CCj5b+0ajvXlwgfpXc3L1nBCjkv8QG+STXURrP/dkm3HOu+ppu64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=Qn7p/5u8; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=oiklqbPy; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfout.phl.internal (Postfix) with ESMTP id 24E2513805E7;
	Mon, 14 Oct 2024 16:50:49 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-07.internal (MEProxy); Mon, 14 Oct 2024 16:50:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1728939049;
	 x=1729025449; bh=w9YMR57cvzUfCNAMCQSKbu+O9RIDGvbwoJsod76P/6o=; b=
	Qn7p/5u82udD6Vho/E5Bw5pGIzCfKjT4u5PgCtLFlIa/VfJW7TanYFbslPUbcgOE
	dg00kBNKQ57dC0JgkYfPXSM7KYf2y6dJqoBZ8FXbxNbz4zobF+5cSjt6hDcn5RPv
	tbpwWDniNj6Zk2T+MQh2xAVGtS1khUftAvONRIwrqTmX+UTBM92AZWz7V4nlMYcl
	0+sWD2NAi/l2dED5iiDZdl0jk6wdISzmkhGHPwpPY2rmYdXi7ilFUW7mpuE8y1r8
	5zfSq79Kr4u8XylGIO5yoM1E0mCFEG/s0vWgf4/TeRV/K9854im+MQ7OHHIjQbSQ
	IamBYGgn5/bPEuUQVhjR9g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1728939049; x=
	1729025449; bh=w9YMR57cvzUfCNAMCQSKbu+O9RIDGvbwoJsod76P/6o=; b=o
	iklqbPyYUuGFmnF66gT+kn0T/eOQFBHXbYOAgJUPLsRQZecn3JiEFeX/+iRnNFMi
	M93AXyytyYv5jGiRKJNe76W7NZkjz825A+G7ihF1E+B+uvrHlIWeYTtgYWmqAvFd
	klTGZZMPjb3xdzTrct5gKxxcGPSc+JTCXdDM+uhNqCeIYPpyt8DdL8aLgMnAunQF
	j3XoURI2uNy6QIb3EsdYh3Saq/T5T/cEebu8kOIMoRsepAoPuCl4IgKkkPegooJH
	5M4TRdNn5u8lIYbpAKmTl+pEZkItrHSmFQIhJ5XgqxEyvob9AYsEY6n5tufoLBFK
	sVAW7hmhEXMAmwfAPLKUA==
X-ME-Sender: <xms:KIQNZ2dp0tdQCfkBIiaUNkxgmkyYhQacsODc6bnioiOF2lwLVpDQHA>
    <xme:KIQNZwOHM7TB8IB9JSzaaWCWK-2ilPECc5rH6Tk9EVrSsbmMXcJz2qN7Alcd1pBda
    ealWEbgfKMaBU7ztN8>
X-ME-Received: <xmr:KIQNZ3iGYQ3p8xzmLgQpnt4CcDxGYmf8xuq5uaQuOGNHOek_tiBcIJ3M3NxND785yzHpueuQsDv-egITr_ia5MGvXxzmd1XoPg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdeghedgudehgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddt
    jeenucfhrhhomheppfhikhhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsoh
    guvghrlhhunhgusehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepveet
    gedtvddvhfdtkeeghfeffeehteehkeekgeefjeduieduueelgedtheekkeetnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhs
    ohguvghrlhhunhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpthhtohepuddtpd
    hmohguvgepshhmthhpohhuthdprhgtphhtthhopeifrghnghhhrghifeeksehhuhgrfigv
    ihdrtghomhdprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtg
    hpthhtohepvgguuhhmrgiivghtsehgohhoghhlvgdrtghomhdprhgtphhtthhopehkuhgs
    rgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgrsggvnhhisehrvgguhhgrthdrtg
    homhdprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopeiihhgr
    nhhggihirghogihuheeshhhurgifvghirdgtohhmpdhrtghpthhtohepnhgvthguvghvse
    hvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrhgvnhgvshgr
    shdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:KIQNZz992ZzhrgjfNQee3HA-x7A5AmtfWameHw8vOp55Q80xan3Zzw>
    <xmx:KIQNZyuyeIO1E1ARyiAVouK9KDcQaL3x-BwqbqsPwItQ2w_SKLi8IA>
    <xmx:KIQNZ6EaAXUu07uB8cvPK6XfmBToFhkHMRXs78Dl9EpySkcdQw9cwQ>
    <xmx:KIQNZxOObmy05iQ9HF_ej1MxwOPRiUD0q7OWUPQFLxAGX6bPKzPOHw>
    <xmx:KYQNZzkl7L6rPihQn6DowucmgiiN8bVNmhTfXlyBHrtHGzBiTF3_EGqE>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 14 Oct 2024 16:50:47 -0400 (EDT)
Date: Mon, 14 Oct 2024 22:50:44 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Wang Hai <wanghai38@huawei.com>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, andrew@lunn.ch, zhangxiaoxu5@huawei.com,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net: ethernet: rtsn: fix potential memory leak in
 rtsn_start_xmit()
Message-ID: <20241014205044.GA2838422@ragnatech.se>
References: <20241014144250.38802-1-wanghai38@huawei.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241014144250.38802-1-wanghai38@huawei.com>

Hello Wang,

Thanks for finding this.

On 2024-10-14 22:42:50 +0800, Wang Hai wrote:
> The rtsn_start_xmit() returns NETDEV_TX_OK without freeing skb
> in case of skb->len being too long, add dev_kfree_skb_any() to fix it.
> 
> Fixes: b0d3969d2b4d ("net: ethernet: rtsn: Add support for Renesas Ethernet-TSN")
> Signed-off-by: Wang Hai <wanghai38@huawei.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/net/ethernet/renesas/rtsn.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/net/ethernet/renesas/rtsn.c b/drivers/net/ethernet/renesas/rtsn.c
> index f9f63c61d792..6b3f7fca8d15 100644
> --- a/drivers/net/ethernet/renesas/rtsn.c
> +++ b/drivers/net/ethernet/renesas/rtsn.c
> @@ -1057,6 +1057,7 @@ static netdev_tx_t rtsn_start_xmit(struct sk_buff *skb, struct net_device *ndev)
>  	if (skb->len >= TX_DS) {
>  		priv->stats.tx_dropped++;
>  		priv->stats.tx_errors++;
> +		dev_kfree_skb_any(skb);
>  		goto out;
>  	}
>  
> -- 
> 2.17.1
> 

-- 
Kind Regards,
Niklas Söderlund

