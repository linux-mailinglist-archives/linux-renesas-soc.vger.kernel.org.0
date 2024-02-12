Return-Path: <linux-renesas-soc+bounces-2600-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B5A850E37
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Feb 2024 08:57:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BB89F1C212B0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Feb 2024 07:57:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2A238832;
	Mon, 12 Feb 2024 07:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="JFKnocQQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6886A2CA2
	for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Feb 2024 07:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707724610; cv=none; b=taLNp39F2sdgsjCC/MKKBsIIID+K6uSFheaL5KhL32JWnVBEWmRHpUcWi4mIjWaoJz7NETo/glDRCfhUedUKh52vZBSE3mnYQyYCwXOcHccS3IiyaIhTiFjCE4cFoIhXJumggmQyYV8Dg+ZU0b2jSew95ZfXlYOR51E63ap6Q+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707724610; c=relaxed/simple;
	bh=vF3ZMNbgbWn6zoLtbs5zwCVb+flfkmdV+uWUse2yxew=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m1Byxs2tClMht+UtGMzEgW6H3mrouv0Si33oKyNTiMFXtE/YZiPRhOGBn2evoLrLPKAESf9wibeTrkuiK3cuV/yzQJQqE7mzu/oNaP9yeuowiyqqd9hkWAhKGaXV2SEcOL2I+YSEZaKG7pRGxCOxvDVXrJ4LIZzHAbSbJF2MCTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=JFKnocQQ; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3392b045e0aso1973394f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Sun, 11 Feb 2024 23:56:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1707724605; x=1708329405; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IbiB9TdZhTbH/caE8LqMkXLHViwXHf+uAIAh1n4o0eY=;
        b=JFKnocQQpZg/Ktsw70CzeprbS8vd7F/a1mGw116RRUp2u2gXpXM7DsGT6qT56F5P3T
         3vFinKJufj9UBCiYXCdcJyMt0JzIDhASWFGHAgNTpwKnGhERhO5fqYEs8SEN2xYVLX8v
         8OtW9Vs0v5tNHVV4N22jtu4nbJLIH1Cf1Ld3nIGp0k9pjJdAmPwf8XcXXBe3BTBmrWPK
         KMw6tqhYeyX8j6aAQP3voLDU6ayKtoNzi8ab8NxXfHTADlAXKaGkmYSFc/or87KP0Yj3
         Zo8vdN74QcT/O/AbiyY9w5laOJkQYTpvGgd6H2qQ9fxXf9JdHNWxCAuLJCPD4s4H8xE0
         DtCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707724605; x=1708329405;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IbiB9TdZhTbH/caE8LqMkXLHViwXHf+uAIAh1n4o0eY=;
        b=D9PUOmKVDa3wi3qTrjf9AVlErCN+EPi09xkJQ3lwXLtUE2vL0yA5uYnCnAarpw2QXy
         KdI2SkVXzsMRggOMf7e/fhwYvO/GZCvkVCgExBeaoi98XlLeT1HBiOdqNAt4DtVZZ5DL
         uFGas7j28gLVuB2HM1xw+joVJj9f0My2aSg95wiQeo4gQLipyXc16ZxBYakWfoabKiNT
         SV9JRsRgOPXf5FwtCXlgZwXM7Hsn8D6/xNadgmtfyApYPHbL0av1GnNbKPIkdJZY+e4t
         u9odAkg5Il3U84u1sUeSUHR7bStQ7SatnGBoVHXrZzzLqDxaz0ZruVjZ4jRvnMgi3rWO
         EArA==
X-Gm-Message-State: AOJu0Yxm0DUwNOLpmCG6Zt6OTL4CHPxPC9CXiwPpcMVLPCxDT/qcpSz7
	oYUoydJSnICr2vW8wvAappLBSqJLgxtx8QG7F2Xg2Du569eH2che6li5S6X6ZbkEMlqFGL+VN6J
	x
X-Google-Smtp-Source: AGHT+IGQlOsXCCeGTX2vr90Sut/bNRRJF3w43WIdCDzlGuvQAdWt5wb1NmGBFX5ZT2+Bf//jzI6Lgw==
X-Received: by 2002:adf:cd8a:0:b0:33b:810c:7868 with SMTP id q10-20020adfcd8a000000b0033b810c7868mr1569572wrj.57.1707724605383;
        Sun, 11 Feb 2024 23:56:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUAwB++3eta271PwmThU1J/ZAL4ipZIhzcOYDMcw3keg2ipPXCHZVLOspdB8cLyF3NTaMGDjVK07kt1ZYaYuGV1+293HjkVFwsdU3cc4HiI/IustiALVqi06/z8Z1EDJcFxlsVVk3A5gfssl9SlRwNBlOt05q4ostuwTsVWjL+YlK5nlozwVWTQWYpuX2A9yk5dhPFCi660y0eYiLgrsvrcBShoLiDap9oB/+Iz4BaJ0Rf4ffFmSyktPSsuRzYEIwQ1HO6EnBK/mbviw29V7NXgcohDsx56ngYWMfoMEte2yGQUKsFTMIlyrULGcVDEtLrVU+S10lubCM4=
Received: from [192.168.50.4] ([82.78.167.20])
        by smtp.gmail.com with ESMTPSA id bq26-20020a5d5a1a000000b0033b4335dce5sm6087448wrb.85.2024.02.11.23.56.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Feb 2024 23:56:45 -0800 (PST)
Message-ID: <7d0ae75d-2fdb-47cb-b57b-20ee477d6081@tuxon.dev>
Date: Mon, 12 Feb 2024 09:56:43 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 5/5] net: ravb: Add runtime PM support
Content-Language: en-US
To: Sergey Shtylyov <s.shtylyov@omp.ru>, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240209170459.4143861-1-claudiu.beznea.uj@bp.renesas.com>
 <20240209170459.4143861-6-claudiu.beznea.uj@bp.renesas.com>
 <3808dee0-b623-b870-7d96-94cc5fc12350@omp.ru>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <3808dee0-b623-b870-7d96-94cc5fc12350@omp.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 09.02.2024 23:00, Sergey Shtylyov wrote:
> On 2/9/24 8:04 PM, Claudiu wrote:
> 
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> Add runtime PM support for the ravb driver. As the driver is used by
>> different IP variants, with different behaviors, to be able to have the
>> runtime PM support available for all devices, the preparatory commits
>> moved all the resources parsing and allocations in the driver's probe
>> function and kept the settings for ravb_open(). This is due to the fact
>> that on some IP variants-platforms tuples disabling/enabling the clocks
>> will switch the IP to the reset operation mode where registers' content is
> 
>    This pesky "registers' content" somehow evaded me -- should be "register
> contents" as well...
> 
>> lost and reconfiguration needs to be done. For this the rabv_open()
>> function enables the clocks, switches the IP to configuration mode, applies
>> all the registers settings and switches the IP to the operational mode. At
>> the end of ravb_open() IP is ready to send/receive data.
>>
>> In ravb_close() necessary reverts are done (compared with ravb_open()), the
>> IP is switched to reset mode and clocks are disabled.
>>
>> The ethtool APIs or IOCTLs that might execute while the interface is down
>> are either cached (and applied in ravb_open()) or rejected (as at that time
>> the IP is in reset mode). Keeping the IP in the reset mode also increases
>> the power saved (according to the hardware manual).
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>> Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>
> [...]
> 
>> diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
>> index f4be08f0198d..5bbfdfeef8a9 100644
>> --- a/drivers/net/ethernet/renesas/ravb_main.c
>> +++ b/drivers/net/ethernet/renesas/ravb_main.c
>> @@ -1939,16 +1939,21 @@ static int ravb_open(struct net_device *ndev)
>>  {
>>  	struct ravb_private *priv = netdev_priv(ndev);
>>  	const struct ravb_hw_info *info = priv->info;
>> +	struct device *dev = &priv->pdev->dev;
>>  	int error;
>>  
>>  	napi_enable(&priv->napi[RAVB_BE]);
>>  	if (info->nc_queues)
>>  		napi_enable(&priv->napi[RAVB_NC]);
>>  
>> +	error = pm_runtime_resume_and_get(dev);
>> +	if (error < 0)
>> +		goto out_napi_off;
> 
>    Well, s/error/ret/ -- it would fit better here...

Using error is the "trademark" of this driver, it is used all around the
driver. I haven't introduced it here, I don't like it. The variable error
in this particular function is here from the beginning of the driver.

So, I don't consider changing error to ret is the scope of this series.

> 
> [...]
>> @@ -3066,6 +3089,12 @@ static void ravb_remove(struct platform_device *pdev)
>>  	struct net_device *ndev = platform_get_drvdata(pdev);
>>  	struct ravb_private *priv = netdev_priv(ndev);
>>  	const struct ravb_hw_info *info = priv->info;
>> +	struct device *dev = &priv->pdev->dev;
>> +	int error;
>> +
>> +	error = pm_runtime_resume_and_get(dev);
>> +	if (error < 0)
>> +		return;
> 
>    Again, s/erorr/ret/ in this case.

error was used here to comply with the rest of the driver. So, if you still
want me to change it here and in ravb_remove() please confirm.

Thank you,
Claudiu Beznea

> 
> [...]
> 
> MBR, Sergey

