Return-Path: <linux-renesas-soc+bounces-1258-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D82B882001C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 Dec 2023 16:07:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C95CC1C218C6
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 Dec 2023 15:07:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CD57125A2;
	Fri, 29 Dec 2023 15:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="DWmOWCwZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C310311CBA
	for <linux-renesas-soc@vger.kernel.org>; Fri, 29 Dec 2023 15:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-40d2764c0f2so91095245e9.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 29 Dec 2023 07:07:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1703862453; x=1704467253; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tfEUssq66775g5rv0X3EdttVr6Qz6vvAn3f8fmKq6k4=;
        b=DWmOWCwZl7kLEnbKecRZcrppO65lE+zcGzUU3rdJjMbu9kMCo+dNg+niDXO6RoG9Ay
         VnQIIr6+Fo90zgwzYlnm0oR9ZW5xNFu9ylaveW+QcnBYdjkSj7RqYMM0baptjfabO/w2
         zBRMLDOkhohANxqT4U5fqdz3y3i3arcnInfRjlFu6UoTlhLBC7wOJ5tKcXIOxdMETbNu
         RsaX5x1RCpu2Gf+k5jZpWEV28S/udRBh5zphgBZS1TlpdCGT7vrx6Ktk2j8S5fun3voi
         9aW+7iR2XnknIF6VKixdrvVZxaFG8WxVACrRfsl7ME+Z2uAlBpuHcCku/+s5yrH6VLRu
         X++A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703862453; x=1704467253;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tfEUssq66775g5rv0X3EdttVr6Qz6vvAn3f8fmKq6k4=;
        b=P3gYWFwdn2K4XhyMF9z7AUwjEN5YU5EPLNi87p7vj09+0F9WxqECLBFFXpG+MlpwB2
         bHlN0UvYhp3rE2jqMd39K8mLIJQpfBAsNcRenBlQD3hVK505kw+Sw9brp6d1mhY9uR33
         6GcOmvc5hdmaWAUoowDjIKP/3d+WO1QJu9+gC1JpQINSWp9sdfHF4Ms0/5g8X8tQUX/d
         r1zCxjOJEEIpPBcoGotaLGngggFHB0tC+4zmu/6CLAvAl9Nt3JDlcHC7qvyzTalWBHkm
         Y0XEimv3TvUpP3P0AbfFTMpwrjDpbk3R+f2vKWgHbEfdA18lh+DukF0ejQTSwwdIszGI
         1Afw==
X-Gm-Message-State: AOJu0YwCQZo76g69dcsoCWlVLc+gGIlbHtQYEXtqmpI+tEL37GVdaKQm
	ZWVHD6XhMI9Cl3kNmCKFe5NndC3mXKjfIA==
X-Google-Smtp-Source: AGHT+IFOhefH6uyfP+oL9e2jb6KzF0vgMPeDuZLKZilG2UW7+TBcW0F93pNTf9V3XDx5UAcbNn3DtA==
X-Received: by 2002:a05:600c:354d:b0:40d:5a6d:edcb with SMTP id i13-20020a05600c354d00b0040d5a6dedcbmr2806177wmq.24.1703862452733;
        Fri, 29 Dec 2023 07:07:32 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.5])
        by smtp.gmail.com with ESMTPSA id j16-20020a05600c191000b0040c11fbe581sm31381314wmq.27.2023.12.29.07.07.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Dec 2023 07:07:32 -0800 (PST)
Message-ID: <ca01da5f-0928-4a95-83f4-8d9056107f42@tuxon.dev>
Date: Fri, 29 Dec 2023 17:07:30 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2 1/1] net: ravb: Wait for operation mode to be
 applied
Content-Language: en-US
To: Sergey Shtylyov <s.shtylyov@omp.ru>, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 yoshihiro.shimoda.uh@renesas.com, wsa+renesas@sang-engineering.com,
 mitsuhiro.kimura.kc@renesas.com
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20231222113552.2049088-1-claudiu.beznea.uj@bp.renesas.com>
 <20231222113552.2049088-2-claudiu.beznea.uj@bp.renesas.com>
 <98efc508-c431-2509-5799-96decc124136@omp.ru>
 <d5448a91-a4d8-444d-9f96-083049b1e33e@tuxon.dev>
 <9ebf96fb-c07a-8269-e5cd-0e71110941dd@omp.ru>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <9ebf96fb-c07a-8269-e5cd-0e71110941dd@omp.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 28.12.2023 21:07, Sergey Shtylyov wrote:
> On 12/27/23 1:10 PM, claudiu beznea wrote:
> 
> [...]
> 
>>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>>
>>>> CSR.OPS bits specify the current operating mode and (according to
>>>> documentation) they are updated by HW when the operating mode change
>>>> request is processed. To comply with this check CSR.OPS before proceeding.
>>>>
>>>> Commit introduces ravb_set_opmode() that does all the necessities for
>>>> setting the operating mode (set DMA.CCC and wait for CSR.OPS) and call it
>>>> where needed. This should comply with all the HW manuals requirements as
>>>> different manual variants specify that different modes need to be checked
>>>> in CSR.OPS when setting DMA.CCC.
>>>>
>>>> Fixes: c156633f1353 ("Renesas Ethernet AVB driver proper")
>>>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>> ---
>>>>  drivers/net/ethernet/renesas/ravb_main.c | 52 ++++++++++++++----------
>>>>  1 file changed, 31 insertions(+), 21 deletions(-)
>>>>
>>>> diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
>>>> index 664eda4b5a11..ae99d035a3b6 100644
>>>> --- a/drivers/net/ethernet/renesas/ravb_main.c
>>>> +++ b/drivers/net/ethernet/renesas/ravb_main.c
>>>> @@ -66,14 +66,15 @@ int ravb_wait(struct net_device *ndev, enum ravb_reg reg, u32 mask, u32 value)
>>>>  	return -ETIMEDOUT;
>>>>  }
>>>>  
>>>> -static int ravb_config(struct net_device *ndev)
>>>> +static int ravb_set_opmode(struct net_device *ndev, u32 opmode)
>>>
>>>    Since you pass the complete CCC register value below, you should
>>> rather call the function ravb_set_ccc() and call the parameter opmode
>>> ccc.
>>
>> This will be confusing. E.g., if renaming it ravb_set_ccc() one would
>> expect to set any fields of CCC though this function but this is not true
>> as ravb_modify() in this function masks only CCC_OPC. The call of:
>>
>> error = ravb_set_opmode(ndev, CCC_OPC_CONFIG | CCC_GAC | CCC_CSEL_HPB);
>>
>> bellow is just to comply with datasheet requirements, previous code and at
>> the same time re-use this function.
> 
>    How about the following then (ugly... but does the job):
> 
> 	/* Set operating mode */
> 	if (opmode & ~CCC_OPC)
> 		ravb_write(ndev, opmode, CCC);
> 	else
> 		ravb_modify(ndev, CCC, CCC_OPC, opmode);
> 
>    Either that or just don't use ravb_set_opmode() when writing the whole
> 32-bit value below...

This looks uglier to me...

We have this discussion because of ccc_gac. For ccc_gac platforms we need
to set OPC, GAC, CSEL at the same time. This is how we can change the
operating mode to configuration mode in case we also need to configure GAC
(due to restrictions imposed by hardware).

What I want to say is that setting GAC and CSEL along with CCC is part of
changing the operating mode to configuration mode for platforms supporting
GAC because of hardware limitations.

> 
> [...]
> 
>>>> @@ -2560,21 +2559,23 @@ static int ravb_set_gti(struct net_device *ndev)
> [...]
>>>
>>>>  		/* Set CSEL value */
>>>>  		ravb_modify(ndev, CCC, CCC_CSEL, CCC_CSEL_HPB);
>>>>  	} else if (info->ccc_gac) {
>>>> -		ravb_modify(ndev, CCC, CCC_OPC, CCC_OPC_CONFIG |
>>>> -			    CCC_GAC | CCC_CSEL_HPB);
>>>> +		error = ravb_set_opmode(ndev, CCC_OPC_CONFIG | CCC_GAC | CCC_CSEL_HPB);
> 
>    ... like this?
> 
> 		ravb_write(ndev, CCC_OPC_CONFIG | CCC_GAC | CCC_CSEL_HPB, CCC);
> 		error = ravb_wait(ndev, CSR, CSR_OPS, CSR_OPS_CONFIG);
> 
> [...]
> 
> MBR, Sergey

