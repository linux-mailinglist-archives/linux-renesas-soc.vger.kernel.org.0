Return-Path: <linux-renesas-soc+bounces-1542-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F51382CA80
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 13 Jan 2024 09:31:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 434DB1C22350
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 13 Jan 2024 08:31:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86FE87F1;
	Sat, 13 Jan 2024 08:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="Acm24Q4k"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E677F364
	for <linux-renesas-soc@vger.kernel.org>; Sat, 13 Jan 2024 08:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2cca5d81826so95759631fa.2
        for <linux-renesas-soc@vger.kernel.org>; Sat, 13 Jan 2024 00:31:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech.se; s=google; t=1705134680; x=1705739480; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0gF3sw/Ea39zWxuD0gLzKFUce26V5brwlX/JeoC/CYQ=;
        b=Acm24Q4k027vz2xM+HhYdbmskOzawnZ2RHCM/5Yr7kdOSHZkEthTSDtiMl3IvuqpSI
         S+7b5YJZ6FsrBQNvQLCuwxjDBOAJsidCbMWm9hgFVl9cEHKCT/1uSesVOWuAcKTt9UhV
         wDHLbzX94KH2Tolvn6Lp87OHLrOCx+K6XCF3xRFnpZfUPKI+H+6R/BTG1U57b0rMBxCz
         FzW9ULLg7YVGAJVJzCde6c/Pjd4luIhmNC52QgXyA02hYxJVWP7oxHd/y1vO2aQxG1qx
         +tEogBfsWosntcMyCDiE+NmUjhCmZcwrWGiOQdjIaWhkvSXx7w2bIn/eME4x3qJ78o5I
         CwWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705134680; x=1705739480;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0gF3sw/Ea39zWxuD0gLzKFUce26V5brwlX/JeoC/CYQ=;
        b=MrjsSXkKz03e4dAhqF88HtFJ1cqJtOEzP8knc/0V+2URO3bLbBY6JqMErJxJ+NnUOi
         1s4NbZELTDSMRpGVNS082m1vks6LjWwNNGQnxbi4L0CkqHhtrIMNiOtLGsIh1VvM6BLt
         S3n3ROg2BbfZbgFA32xl4zXjpDoKs1y38E8J1l3kWlU9M1BfeMZj9W4hVEnC5hfYnofc
         7iGMJnRVpoZx4Yha1xnEjdKJo5TbH/346t19Nv/tgGTKu212SucC3yWJAcyBpLIfgfwM
         9pQ1ZeihkupZOA05z/ufnhB3bowTKEyNA6Pfk8ITfsd3Mt5aXqmGfMGeP9V2zDPtQGjO
         tceg==
X-Gm-Message-State: AOJu0YzmSRLJalupl47lZBDBWRtD97lwaw/Q+92sAxpMQiV5KG+8GfZu
	EoBsfEY0Og1aNctu24eLMjdcXu29cpmG5A==
X-Google-Smtp-Source: AGHT+IFclI/5HicsKwUTEr7skf591nEgQRXaAa9kiQQu/l4k9zf0rvOYj4zDXmS1hH+xO3HBGCxOkw==
X-Received: by 2002:a05:6512:390e:b0:50e:74ec:75f6 with SMTP id a14-20020a056512390e00b0050e74ec75f6mr1161110lfu.136.1705134679578;
        Sat, 13 Jan 2024 00:31:19 -0800 (PST)
Received: from localhost (h-46-59-36-113.A463.priv.bahnhof.se. [46.59.36.113])
        by smtp.gmail.com with ESMTPSA id x26-20020a19f61a000000b0050e7e21b338sm773810lfe.14.2024.01.13.00.31.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jan 2024 00:31:18 -0800 (PST)
Date: Sat, 13 Jan 2024 09:31:17 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Sergey Shtylyov <s.shtylyov@omp.ru>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: ravb: Fix dma_addr_t truncation in error case
Message-ID: <20240113083117.GI1643864@ragnatech.se>
References: <20240113042221.480650-1-nikita.yoush@cogentembedded.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240113042221.480650-1-nikita.yoush@cogentembedded.com>

Hello Nikita,

Thanks for your patch.

On 2024-01-13 10:22:21 +0600, Nikita Yushchenko wrote:
> In ravb_start_xmit(), ravb driver uses u32 variable to store result of
> dma_map_single() call. Since ravb hardware has 32-bit address fields in
> descriptors, this works properly when mapping is successful - it is
> platform's job to provide mapping addresses that fit into hardware
> limitations.
> 
> However, in failure case dma_map_single() returns DMA_MAPPING_ERROR
> constant that is 64-bit when dma_addr_t is 64-bit. Storing this constant
> in u32 leads to truncation, and further call to dma_mapping_error()
> fails to notice the error.
> 
> Fix that by storing result of dma_map_single() in a dma_addr_t
> variable.
> 
> Fixes: c156633f1353 ("Renesas Ethernet AVB driver proper")
> Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/net/ethernet/renesas/ravb_main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
> index 8649b3e90edb..0e3731f50fc2 100644
> --- a/drivers/net/ethernet/renesas/ravb_main.c
> +++ b/drivers/net/ethernet/renesas/ravb_main.c
> @@ -1949,7 +1949,7 @@ static netdev_tx_t ravb_start_xmit(struct sk_buff *skb, struct net_device *ndev)
>  	struct ravb_tstamp_skb *ts_skb;
>  	struct ravb_tx_desc *desc;
>  	unsigned long flags;
> -	u32 dma_addr;
> +	dma_addr_t dma_addr;
>  	void *buffer;
>  	u32 entry;
>  	u32 len;
> -- 
> 2.39.2
> 
> 

-- 
Kind Regards,
Niklas Söderlund

