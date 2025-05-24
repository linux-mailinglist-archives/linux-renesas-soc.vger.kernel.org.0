Return-Path: <linux-renesas-soc+bounces-17466-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E66AC2EE1
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 24 May 2025 12:29:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9A3601BA7DB8
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 24 May 2025 10:29:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A6B81DE4DB;
	Sat, 24 May 2025 10:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="Lq3xxTy/";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="QEOVe9eC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ECC91DED42;
	Sat, 24 May 2025 10:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748082548; cv=none; b=cgfajC/2755SRvyUXLC/Ida87He2WqlfIDDwwwVUuJWHnKYaItsgVKnURYd6R6DaFY5YFQ20roqI6Lhp/knRReeZnjYPvm4PqyWtR96tJ/Hqlxz7PWvegW4fObjzCbj8RWVFGILx5cdMuCtmHsfGO2PkIHWXhZshgGx5qsTYBWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748082548; c=relaxed/simple;
	bh=Vo9bZalWQPgoZtXoUV/2o0PGzSrkiSgePwMw03SGqYc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=epAw6zSJkC7o1/88060QhAHCG56+iorK3gRX1e2fRuauWlfaWbaOr08OtySeQkJOOoUbiCU7+jm84XLnyuHnOWhsKEjnV0FsPwzV/szWF13XDXvEVo5T7mgtuMnys57RFhmufUmMPRY8QrMn8wJ1Z1RekWI5SullS2EgT8fhhKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=Lq3xxTy/; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=QEOVe9eC; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id 5370B138026B;
	Sat, 24 May 2025 06:29:04 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Sat, 24 May 2025 06:29:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1748082544;
	 x=1748168944; bh=KNL3wWIg9pTl/87kvpN3LEkYYiFn0rJyJv1V7pOOQXk=; b=
	Lq3xxTy/Lf0RTtPoDgXVh0REO39vW6cwCGjbYoUgfKKSUWXizM1TvfiTAM/VDvoO
	Cj3vA9XgooBJZOw8FmDPZd17Rcni06GOq5wtgXA2ObWbKJ083Gja19D4VSYpSsCO
	5S6nSwg7LfdRrqLSNsjLRSbfg4WVuoV1FPMi8LDDEIqllDMxDUcOs/efAmIlLpoP
	nnu+TZ1+G/m4MJs4WcvyprLXQuFz4jQ+vkDZY4xtlEvXlV8ylSpE6PwpLKFZ4D+Y
	c/BgOGt9oCzLAfC8xN3I7aOMlNNkqIbU7qAv3UM3eBtpHgT0qm5cSdlbRdum29vH
	kfzhrtR6wrWx6RfAW1uSrw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1748082544; x=
	1748168944; bh=KNL3wWIg9pTl/87kvpN3LEkYYiFn0rJyJv1V7pOOQXk=; b=Q
	EOVe9eCwIsRSt0Y06QRxNVThARExsfGtH56lAEkVwqaWW1qO7lUQtCclfJzf4r+5
	14B+i9ijrX1j9wkHwFWbfdq26LBy24BSHYJFKwET0SzFK3TqpzjBXOYTfJFs7T7r
	vl4KriuRvI1sOQNNXJru7vCYfSVlAkIBhunEvn5yd4dPEc8WnVGh2uZ8O/VfZV59
	JoZbOsinDKclin2PvNA+qASHeb3A26W3aThHiFxJ5KVvcf8N7BwZBmhz1wuv/Qlo
	ylVhCKMdvmjVBnlblKsaxWw7OXdTAzcht4wuGUQCCEYh3FZ9CtJVrwbb9l8cYJ6a
	TXlW/amZmM1jFFDtm6uJA==
X-ME-Sender: <xms:b58xaM70h0gS1GpKy8P2QxeAD16QPtBfImceMra-jR6WSpZJ0ruRtw>
    <xme:b58xaN5rsqHpufTuXU6Gc1oxZYYjPsGWfZJVK8Q0Qh-cyndWBNe5t12hqEz18bgyd
    oW5rpBeNhOuUsVRGjw>
X-ME-Received: <xmr:b58xaLe56REzU1TWZreOtGhbKGRwbauFtexrFv0UgPrDAAQJ0EjCP4nIEvoC7r9aBYcMuPzBdxUZ7_L6KM7sg6TdyvDpaNX6Qw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdduudegleculddtuddrgeefvddrtd
    dtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggft
    fghnshhusghstghrihgsvgdpuffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftd
    dtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhf
    gggtugfgjgesthekredttddtjeenucfhrhhomheppfhikhhlrghsucfunpguvghrlhhunh
    guuceonhhikhhlrghsrdhsohguvghrlhhunhgusehrrghgnhgrthgvtghhrdhsvgeqnecu
    ggftrfgrthhtvghrnhepveetgedtvddvhfdtkeeghfeffeehteehkeekgeefjeduieduue
    elgedtheekkeetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
    rhhomhepnhhikhhlrghsrdhsohguvghrlhhunhgusehrrghgnhgrthgvtghhrdhsvgdpnh
    gspghrtghpthhtohepuddupdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehhrgho
    gihirghnghgplhhivddtvdegseduieefrdgtohhmpdhrtghpthhtoheprghnughrvgifod
    hnvghtuggvvheslhhunhhnrdgthhdprhgtphhtthhopegurghvvghmsegurghvvghmlhho
    fhhtrdhnvghtpdhrtghpthhtohepvgguuhhmrgiivghtsehgohhoghhlvgdrtghomhdprh
    gtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgrsggvnhhi
    sehrvgguhhgrthdrtghomhdprhgtphhtthhopehrihgthhgrrhgutghotghhrhgrnhesgh
    hmrghilhdrtghomhdprhgtphhtthhopehnvghtuggvvhesvhhgvghrrdhkvghrnhgvlhdr
    ohhrghdprhgtphhtthhopehlihhnuhigqdhrvghnvghsrghsqdhsohgtsehvghgvrhdrkh
    gvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:b58xaBLp9civC8pwRZPokRqJE_hjoLAgtMIahk1NNxeIDXkTJUFgvg>
    <xmx:b58xaAIt9jRHAxjjiVLdYfzt2hYBUSFLwDUi9LJGTJ3KalZoq63DOw>
    <xmx:b58xaCyS_3Pj8s_9L3nfxb2uN6ZvAp4zbTSF6iCV1ZvjZ608dNPPCA>
    <xmx:b58xaEJWUlzM0AakjabNFdBTR-Do-XPDcqfF3d0E1mdekpxF946-UA>
    <xmx:cJ8xaDMiV14b2sByBZA-IA-WJ7nSwCiuqo8hUmEPCxvaohgEbknaaGdy>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 24 May 2025 06:29:03 -0400 (EDT)
Date: Sat, 24 May 2025 12:29:01 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Haoxiang Li <haoxiang_li2024@163.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, richardcochran@gmail.com,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] net: ethernet: rtsn: Fix a null pointer dereference in
 rtsn_probe()
Message-ID: <20250524102901.GD600042@ragnatech.se>
References: <20250524075825.3589001-1-haoxiang_li2024@163.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250524075825.3589001-1-haoxiang_li2024@163.com>

Hi Haoxiang,

Thanks for your fix, nice catch.

On 2025-05-24 15:58:25 +0800, Haoxiang Li wrote:
> Add check for the return value of rcar_gen4_ptp_alloc()
> to prevent potential null pointer dereference.
> 
> Fixes: b0d3969d2b4d ("net: ethernet: rtsn: Add support for Renesas Ethernet-TSN")
> Cc: stable@vger.kernel.org
> Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
> ---
>  drivers/net/ethernet/renesas/rtsn.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/net/ethernet/renesas/rtsn.c b/drivers/net/ethernet/renesas/rtsn.c
> index 6b3f7fca8d15..f5df3374d279 100644
> --- a/drivers/net/ethernet/renesas/rtsn.c
> +++ b/drivers/net/ethernet/renesas/rtsn.c
> @@ -1260,6 +1260,10 @@ static int rtsn_probe(struct platform_device *pdev)
>  	priv->pdev = pdev;
>  	priv->ndev = ndev;

nit: I would add a blank line here to make the grouping similar to the 
style of other error checks in probe.

With that fixed,

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

>  	priv->ptp_priv = rcar_gen4_ptp_alloc(pdev);
> +	if (!priv->ptp_priv) {
> +		ret = -ENOMEM;
> +		goto error_free;
> +	}
>  
>  	spin_lock_init(&priv->lock);
>  	platform_set_drvdata(pdev, priv);
> -- 
> 2.25.1
> 

-- 
Kind Regards,
Niklas Söderlund

