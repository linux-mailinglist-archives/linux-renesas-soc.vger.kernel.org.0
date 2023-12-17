Return-Path: <linux-renesas-soc+bounces-1161-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B11D8815F55
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 17 Dec 2023 14:22:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9B9B51C20818
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 17 Dec 2023 13:22:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AECB4436D;
	Sun, 17 Dec 2023 13:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="DED1Pc4O"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A1C544368
	for <linux-renesas-soc@vger.kernel.org>; Sun, 17 Dec 2023 13:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-55322dbac2fso481990a12.0
        for <linux-renesas-soc@vger.kernel.org>; Sun, 17 Dec 2023 05:22:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1702819340; x=1703424140; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BhlGgqllzOEJFcoKMd0LYtIRsVSBlkM+PdHZXw0IzWI=;
        b=DED1Pc4O816j2UPvVffFJW1WmVGGvR85+0FUqjx19SRIrm784jcNm/NR8Wagnn5u5z
         ntUGuS2IwUuL/Z9MULtf7uWg5gFJ5KH51CGCw+waEbza3bxQV3Zlx991OXqS6yQloCQR
         Fp0HCR2wZ3ZrCyojKQdfp+M8GreIAmLmzFitkwuObzMPBUQhHSOWs9Sb8uFoeMSx/3wz
         jvWmV0G+fEpGh5Ul/DKD82eE4vKG5TH61n1e3wvgbTP6j8yLVWF7WY9/UUoKKFt7zmVM
         MBpjB/FXOIUjKmPHq+sclkpoHG21qhCvY2Qv1UzQibA8A2AYi8UUv0t6IOoTGp9pCoB/
         8BKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702819340; x=1703424140;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BhlGgqllzOEJFcoKMd0LYtIRsVSBlkM+PdHZXw0IzWI=;
        b=hZxQewbWMpz0jtW8icLIG/5MUtW9Q78aRKxzNTEGhb/4aQT+hiodUmhegmzRek7clS
         WWeaVN8u8bWQz5jijbYicn79wR+fHZQZjVXXNwLbnklZnCUu4nzqBzwMu07ZokhYKw25
         bQo3GE2E51tTMlZaUWAB7leo/AwjIz8Dl5Xmo4hQADVnJtdix47HemdPsV1RtnNdQlKY
         GgTyhFfFjCwk9ea8tA9ppexufMOIYcDhQznb2kjUC1qEFsxbhnO9orCqMVxzSJf3S+uP
         zgiKZDk/Aej8x+yerHYJd/D0izYHt8+8rZ3lNqmUE+Kv4Gjez7uc/0bKr1m6AG/sbQOW
         nrFA==
X-Gm-Message-State: AOJu0YzLLRnpxZsvHhVsA/rV/U0PRi+boHd1C8UZSNfzWEVbEMzg3ATE
	E2WNSL3p3u4GZA6GxCC11fqKww==
X-Google-Smtp-Source: AGHT+IGAZLShuldvlToxjco6j0l+cJImzZZQUvTeBgrg7FuGDmfpTGdxVaZGIw5l2S0TDJ1mBKb+/Q==
X-Received: by 2002:a50:cbc8:0:b0:54b:9891:16ae with SMTP id l8-20020a50cbc8000000b0054b989116aemr8593679edi.4.1702819340644;
        Sun, 17 Dec 2023 05:22:20 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.103])
        by smtp.gmail.com with ESMTPSA id h29-20020a0564020e9d00b0054c63cc0469sm9515323eda.33.2023.12.17.05.22.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Dec 2023 05:22:20 -0800 (PST)
Message-ID: <15c867d9-f77e-4b92-8b90-08d27116ce84@tuxon.dev>
Date: Sun, 17 Dec 2023 15:22:18 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 17/21] net: ravb: Keep clock request
 operations grouped together
Content-Language: en-US
To: Sergey Shtylyov <s.shtylyov@omp.ru>, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 richardcochran@gmail.com, p.zabel@pengutronix.de,
 yoshihiro.shimoda.uh@renesas.com, wsa+renesas@sang-engineering.com,
 geert+renesas@glider.be
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20231214114600.2451162-1-claudiu.beznea.uj@bp.renesas.com>
 <20231214114600.2451162-18-claudiu.beznea.uj@bp.renesas.com>
 <2cb29821-7135-4369-ebc7-c742226e6230@omp.ru>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <2cb29821-7135-4369-ebc7-c742226e6230@omp.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 16.12.2023 21:43, Sergey Shtylyov wrote:
> On 12/14/23 2:45 PM, Claudiu wrote:
> 
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> Keep clock request operations grouped togeter to have all clock-related
>> code in a single place. This makes the code simpler to follow.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>> ---
>>
>> Changes in v2:
>> - none; this patch is new
>>
>>  drivers/net/ethernet/renesas/ravb_main.c | 28 ++++++++++++------------
>>  1 file changed, 14 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
>> index 38999ef1ea85..a2a64c22ec41 100644
>> --- a/drivers/net/ethernet/renesas/ravb_main.c
>> +++ b/drivers/net/ethernet/renesas/ravb_main.c
>> @@ -2768,6 +2768,20 @@ static int ravb_probe(struct platform_device *pdev)
>>  	if (error)
>>  		goto out_reset_assert;
>>  
>> +	priv->clk = devm_clk_get(&pdev->dev, NULL);
>> +	if (IS_ERR(priv->clk)) {
>> +		error = PTR_ERR(priv->clk);
>> +		goto out_reset_assert;
>> +	}
>> +
>> +	if (info->gptp_ref_clk) {
>> +		priv->gptp_clk = devm_clk_get(&pdev->dev, "gptp");
>> +		if (IS_ERR(priv->gptp_clk)) {
>> +			error = PTR_ERR(priv->gptp_clk);
>> +			goto out_reset_assert;
>> +		}
>> +	}
>> +
>>  	priv->refclk = devm_clk_get_optional(&pdev->dev, "refclk");
>>  	if (IS_ERR(priv->refclk)) {
>>  		error = PTR_ERR(priv->refclk);
> 
>    Hmm... I think we currently have all these calls in one place.
> Perhaps you just shouldn't have moved this code around?

refclk have been moved at this point due to runtime PM. As refclk was
changed to be part of driver's runtime PM APIs we need to have it requested
(and prepared) before pm_runtime_resume_and_get(). Calling
pm_runtime_resume_and_get() will call driver's runtime PM resume.

The idea with this patch was to have all clock requests (clk, gptp, refclk)
in a single place (it's easier to follow the code this way, in my opinion).
If you prefer I can squash this patch with patch 07/21 "net: ravb: Move
reference clock enable/disable on runtime PM APIs". Please, let me know
what do you think.

> 
> MBR, Sergey

