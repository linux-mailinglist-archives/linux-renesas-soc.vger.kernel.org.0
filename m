Return-Path: <linux-renesas-soc+bounces-1114-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CBBC81453C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 Dec 2023 11:13:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A01211C22EE5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 Dec 2023 10:13:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0C0B199C5;
	Fri, 15 Dec 2023 10:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="aAuhIVol"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4877D1A702
	for <linux-renesas-soc@vger.kernel.org>; Fri, 15 Dec 2023 10:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-40c19f5f822so2244575e9.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 15 Dec 2023 02:13:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1702635191; x=1703239991; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H2CdcCJKkO0jEWGPVev2OgSogYyxT5fxlwX+UtYJ6qE=;
        b=aAuhIVolzUnQF/Yzce6EwM9sOKvXRmW23g+FVRVn5guO6lxIt1UoHmY8zheGQELuGK
         5s/EX347tQx1vf/xpI83LbBKe5LBBaOx6lhCO2Z8ywtc11QiOx8Dv/3TiYRmKFDOf722
         8uClnVw4hJ1bvr1GecdR+gscIJbuP+DHBhtT+CpGXRP4OqkVrMv/cAvb/Rm74EgUs+4C
         Gsd1E0VKjtP9S2AafH14Up89eOtvpP+kNZbLpuuNxZKhdhYx8n+c1HIWHBvsc7jAh40E
         lefB902pD6pzrSES7npw0NrmkmkSpjiayaWSZ6EVUPon5EDTb8NMQWxmH9MS8VifcGJ/
         IFrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702635191; x=1703239991;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H2CdcCJKkO0jEWGPVev2OgSogYyxT5fxlwX+UtYJ6qE=;
        b=uJg3WAVusUQyYV1VcAGPlxwOkYoz1Y1GUNvxsaa1Luw8jH1k/jhlf/gz2VqlqLvyS+
         haZqwF0XnQVB08yODYdx+uNXlFVXLatowpWGYRPqchB8LXWB53c/MczDsOHz1Yk+Z/Uz
         P0KWGFbk2GyTOcAd3Z7ovc2pkQsCT/vELFNZRsc3tEHESgJLJIOTwm3GX1EwldIZ2WjG
         aWzt6AVXVrj0+lboQJvPB+hPgAa0b91h4T9zFps41F0bGaWuWlAF8nv/RZ4/amo09MKE
         55XrsXdGqUL155h1MnPr1E8f5WDxB3YmKLKHXaf5ko6b4WsG8MyJVfruJ0Ds02sFUY+s
         0hgQ==
X-Gm-Message-State: AOJu0YzbFkEH7iEcNQPDGun1SjAkAiVX+Xl0bjdL5FShnkDqsjOwPv8e
	5kxjxt3I59tWob2AJsTs2GkOgg==
X-Google-Smtp-Source: AGHT+IHF/8+NAtYGoen5YwfftG+M9vepRTL+8NgDRqY9CvPc4G5Bkva4Tei8OUDpUGhORYM1Jz0iGA==
X-Received: by 2002:a7b:c4ca:0:b0:40c:2341:10a7 with SMTP id g10-20020a7bc4ca000000b0040c234110a7mr5646135wmk.128.1702635191446;
        Fri, 15 Dec 2023 02:13:11 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.103])
        by smtp.gmail.com with ESMTPSA id d13-20020a05600c34cd00b0040c496c64cfsm18393794wmq.12.2023.12.15.02.13.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Dec 2023 02:13:11 -0800 (PST)
Message-ID: <9c5f9c23-d28f-4400-a113-1bafc8f349b8@tuxon.dev>
Date: Fri, 15 Dec 2023 12:13:08 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 2/2] net: ravb: Check that GTI loading request is done
Content-Language: en-US
To: Sergey Shtylyov <s.shtylyov@omp.ru>, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 claudiu.beznea.uj@bp.renesas.com, yoshihiro.shimoda.uh@renesas.com,
 wsa+renesas@sang-engineering.com, niklas.soderlund+renesas@ragnatech.se,
 biju.das.jz@bp.renesas.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 mitsuhiro.kimura.kc@renesas.com, geert+renesas@glider.be
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20231214113137.2450292-1-claudiu.beznea.uj@bp.renesas.com>
 <20231214113137.2450292-3-claudiu.beznea.uj@bp.renesas.com>
 <884a4c36-25e4-1049-8410-cc5df9bcc4d1@omp.ru>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <884a4c36-25e4-1049-8410-cc5df9bcc4d1@omp.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 14.12.2023 22:22, Sergey Shtylyov wrote:
> On 12/14/23 2:31 PM, Claudiu wrote:
> 
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> Hardware manual specifies the following for GCCR.LTI bit:
>> 0: Setting completed
>> 1: When written: Issue a configuration request.
>> When read: Completion of settings is pending
>>
>> Thus, check the completion status when setting 1 to GCCR.LTI.
> 
>    But do we really need to? Seems quite dubious... currently we
> just let it the loading complete asynchronously...

Now, thinking again at it... we should be safe w/o it (even though I said
we need it in a previous thread, I think I was wrong).

> 
>> Fixes: 7e09a052dc4e ("ravb: Exclude gPTP feature support for RZ/G2L")
>> Fixes: 568b3ce7a8ef ("ravb: factor out register bit twiddling code")
>> Fixes: 0184165b2f42 ("ravb: add sleep PM suspend/resume support")
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>> ---
>>  drivers/net/ethernet/renesas/ravb_main.c | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
>> diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
>> index ce95eb5af354..1c253403a297 100644
>> --- a/drivers/net/ethernet/renesas/ravb_main.c
>> +++ b/drivers/net/ethernet/renesas/ravb_main.c
>> @@ -2819,6 +2819,10 @@ static int ravb_probe(struct platform_device *pdev)
>>  
>>  		/* Request GTI loading */
>>  		ravb_modify(ndev, GCCR, GCCR_LTI, GCCR_LTI);
>> +		/* Check completion status. */
>> +		error = ravb_wait(ndev, GCCR, GCCR_LTI, 0);
>> +		if (error)
>> +			goto out_disable_refclk;
>>  	}
>>  
>>  	if (info->internal_delay) {
>> @@ -3041,6 +3045,10 @@ static int __maybe_unused ravb_resume(struct device *dev)
>>  
>>  		/* Request GTI loading */
>>  		ravb_modify(ndev, GCCR, GCCR_LTI, GCCR_LTI);
>> +		/* Check completion status. */
>> +		ret = ravb_wait(ndev, GCCR, GCCR_LTI, 0);
>> +		if (ret)
>> +			return ret;
>>  	}
>>  
>>  	if (info->internal_delay)
>>
> 
>    BTW, seems worth factoring out into a separate function...
> 
> MBR, Sergey

