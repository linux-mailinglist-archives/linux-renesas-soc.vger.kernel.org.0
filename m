Return-Path: <linux-renesas-soc+bounces-25050-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B464DC7F73D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Nov 2025 10:01:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D7C363421BD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Nov 2025 09:01:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 207E42F363C;
	Mon, 24 Nov 2025 09:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="B2Mo11Z+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6BBA1096F
	for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Nov 2025 09:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763974910; cv=none; b=WPNej+taa/Rc4NB1DiP+PhagOLezLJ8d31VkgCqxEa0WYBheTScaj/9V2ap1K+sHqe9d4hVNytvOvNivnIWFlZUBVhhVJQAa89qV5EDaBcBWmki774R4G9/CdcxYHSzaIFZ75/ySpKWAGEPsuDl1CGENRnaRMrBuPJYrJdrioNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763974910; c=relaxed/simple;
	bh=9HDxsuDK4Usuf4fFg1Su4y9i5l8Na+Uqsdy5sZXmG8c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GPixt6HzF8RspkPNOqr/1sFJXZwZUI/yfzSp6nlXqnigDUTwvTWAR39rwB8nowlUjmGIKHRItALvPWNMXxK0i+1bCTiMLWqbtNFvM+lkau/gjCN3khq/qOL5K2ZyvDDy55S/hzX3kMpftyZr+hGgCh4gPbAoGpZakt7cRshD2zM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=B2Mo11Z+; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-42b379cd896so2152466f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Nov 2025 01:01:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1763974906; x=1764579706; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6nBgH6OeWos1+QO/ftng5YHCteHUXL03O59bd8c4DFQ=;
        b=B2Mo11Z+OsTdlcmdm99gCyQvnxiVflV81NPjETqXpjiHvGazKvRzqF9XhULdY4tED6
         g4R1GVWOkxVk6V06+GvngOw7ZMF1h0i8p3Od8/V7lJnxG5A9epn6fi6l9GZ3UaMQdN8R
         ck0WclMlennuv0IJ2IkwETrAkXHmPAmsDkfgl4iEuApzEQpBZIax5fu9s9tBeP8ZdSBK
         TXH+EvbiHYEa8Vzpn+VlA3OAc3eNQPuMKkxXifOagYJxGBIbz9N5a/UE+cDKaaBNi1Md
         HHtYfv04Q8WRdXDiHHbb4WgL/02RIMIxf5931Kh/1EP5C0HHbT7EcL1IIo9KGh3lE37j
         dbXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763974906; x=1764579706;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6nBgH6OeWos1+QO/ftng5YHCteHUXL03O59bd8c4DFQ=;
        b=G0qDc+LyhJ+fqvjWk8i//t+7b8YQljGssl3bPqjxoCHWg3EOA5/mJe6l1HVPrTtD6z
         xQGbLsQuKbGg9aDRYFONI30k7XbOilJ3ki/Rlo/UCBt/Qd8IEBNhy07JTSAWuSFGuf9l
         uvlSZPMChf8a0QZPxLconr5L80AvNn+Krug1NabbM4CacGXgL9HPim8cYVcFAQDmKlUi
         vTDr1AaGmArNCNUJX0VdFyb2tDPPR41t/b36xsDZ1p2AIN5tKuCITEb7nD6ypw7R2bcD
         7SdFEOwPxnQyvCmo4wh0Yn2WF7LdSID5/vwx/R0wh8sFeFRSOVZTWty03pOrUxF587cN
         IBjA==
X-Forwarded-Encrypted: i=1; AJvYcCWUS1/OFw+mRyP4q8B79Q9XkmP08GnLqe6b7FqBtnK7+TUa/ujNKdonbv7cQwcsyJ8DFVhCexBCs6AYTLd29bUDhQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywc8cxcBRg9kbpDMgSH6caoxD5A6/Qmzjxo59UvjgP+5snWzG4P
	E3sxrWzxCr7Z3PZUT1V9E+J1KLSiYaUMsJQajfyKPt3/Q9F6SBfjSbmLhjXJ0vR9uRU=
X-Gm-Gg: ASbGncvmY8mdnsa5euN8mWqdAGnCUlvY2BcftrIJGf3OE9D1o1BBES4ciW5fPaWsroG
	GlpSXrsG7hB/IKmuvQ9N22sa7QqULsaFBdRINuEHaNLeElZIgr0T/pmQ3XTNAmhRc+4TjwqesSD
	wsUqwpH8Y5/pN0GeKz8JWxThFsk1n/AWIEEL3ou5pH1gLX3vwyrVf0Fo13QsInliIEmfNFtULxr
	1VHBxrk9IoRn83OZmvP9B+cZWHZ8rqhg1AyXrMCcC0HljoV54SxnN3nbLgmPOqWpyqZVImvIzqD
	1WHUsl96hsv7hVQsPcrEgGnXB1zISoSqxakqee1o3lnViKYroOip4/pnAq8Tryd7XAei2bzgxvg
	dFmTTAJECw7Q6yVYyqeab4ARG6txSCOSKgIic8pPVVuAkXZ/GPJPR/zBbYP6Z4/3o/tozokNqws
	2S/scyRBB7QUKtiTN/D6mXQhgvLt4ubg==
X-Google-Smtp-Source: AGHT+IHpqwyo6K5TdqE2KfSegPDXC/WvD0IxtuuZUq85wkwa8CWfc6Ew15Et9fQbxFWP3fbI3xvJKQ==
X-Received: by 2002:a05:6000:220e:b0:42b:3dbe:3a54 with SMTP id ffacd0b85a97d-42cc1cbd338mr10590267f8f.17.1763974905896;
        Mon, 24 Nov 2025 01:01:45 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.134])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7f34fd1sm27603538f8f.11.2025.11.24.01.01.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Nov 2025 01:01:45 -0800 (PST)
Message-ID: <4f21e13c-b37d-4614-94c9-4cb89017539f@tuxon.dev>
Date: Mon, 24 Nov 2025 11:01:44 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dmaengine: sh: rz-dmac: Fix rz_dmac_terminate_all()
To: Biju Das <biju.das.jz@bp.renesas.com>, Vinod Koul <vkoul@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org, Biju Das <biju.das.au@gmail.com>,
 linux-renesas-soc@vger.kernel.org, stable@kernel.org
References: <20251106125256.122133-1-biju.das.jz@bp.renesas.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20251106125256.122133-1-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/6/25 14:52, Biju Das wrote:
> After audio full duplex testing, playing the recorded file contains a few
> playback frames for the first time. The rz_dmac_terminate_all() does not
> reset all the hardware descriptors queued previously, leading to the wrong
> descriptor being picked up during the next DMA transfer. Fix this issue by
> resetting all descriptor headers for a channel in rz_dmac_terminate_all()
> as rz_dmac_lmdesc_recycle() points to the proper descriptor header filled
> by the rz_dmac_prepare_descs_for_slave_sg().
> 
> Cc: stable@kernel.org
> Fixes: 5000d37042a6 ("dmaengine: sh: Add DMAC driver for RZ/G2L SoC")
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

> ---
>  drivers/dma/sh/rz-dmac.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/dma/sh/rz-dmac.c b/drivers/dma/sh/rz-dmac.c
> index 1f687b08d6b8..3087bbd11d59 100644
> --- a/drivers/dma/sh/rz-dmac.c
> +++ b/drivers/dma/sh/rz-dmac.c
> @@ -557,11 +557,16 @@ rz_dmac_prep_slave_sg(struct dma_chan *chan, struct scatterlist *sgl,
>  static int rz_dmac_terminate_all(struct dma_chan *chan)
>  {
>  	struct rz_dmac_chan *channel = to_rz_dmac_chan(chan);
> +	struct rz_lmdesc *lmdesc = channel->lmdesc.base;
>  	unsigned long flags;
> +	unsigned int i;
>  	LIST_HEAD(head);
>  
>  	rz_dmac_disable_hw(channel);
>  	spin_lock_irqsave(&channel->vc.lock, flags);
> +	for (i = 0; i < DMAC_NR_LMDESC; i++)
> +		lmdesc[i].header = 0;
> +
>  	list_splice_tail_init(&channel->ld_active, &channel->ld_free);
>  	list_splice_tail_init(&channel->ld_queue, &channel->ld_free);
>  	vchan_get_all_descriptors(&channel->vc, &head);


