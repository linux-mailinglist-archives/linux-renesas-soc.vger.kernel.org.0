Return-Path: <linux-renesas-soc+bounces-25237-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 437EFC8E134
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 12:42:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 371E13AAF97
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 11:42:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09B7832C31C;
	Thu, 27 Nov 2025 11:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IRkc8HwR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hNSLMM1w"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7360F32ABEF
	for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Nov 2025 11:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764243741; cv=none; b=I3iO3yKvBN+N2Zw+OuD5NHB7d0qc+GF7f17/B+0AFbFBe79VY6yA/VITktjbCO5op7VTVY6ApaKqBK1lAtPO+kEEd4L5Dyrw1BKxlteDMQwqUxOBLAA9aP/UtcPgt6NyDIdMtx87IbQV+tsAWcf2Z6qwZNUm6CbOIgIj/QzdH9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764243741; c=relaxed/simple;
	bh=GtE72Ankb4nUu2YrFan7jIWAfAtl5cnT0r2NZt+paZM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eZ1lRVOh6MUlpLe5mAFPgPN0jRdUE6U549NB9SmlqP1JZ7gHI015BKNFfnK0okKxGwDVTfUYxbGs0Jz7e2JAMtcfki5lS8/FpDxZ5LNB3QHxQ5Ces9ZFVxCW+BLrzPZ0YvR1B8tOcV5qZElExqJGIPFO+lwNqvP9Zyzr/POrJOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IRkc8HwR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hNSLMM1w; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ARA3e4w848650
	for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Nov 2025 11:42:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/92bqtvgAxvIabGbLUTwTlYWV1H5f0gHUXTStPmWSTg=; b=IRkc8HwRf5t7IjA0
	RO3qR4JTom9HCGU4kHWfC6UTBxTo28ohnb89ooAe58qMUN75GeLNPD9951+i26Ep
	ttU/L5I03AxHOKkdT/TtKr4xz5maA6x4iCN5jOPA+ERGodQwVV9kYEQzTG+++fH0
	rLvRPW1h/eFLAhCPjsWKEOW6Y+ktEAElJe+CmEppq2CyTSh1AOqpLmUWQOs4613p
	Zzs9JNDvZnCg6eG/RyjT1fAh8SwsnpQAX0PU5WXMMeZ3LU/M1vbhuoIU4/GD6h/z
	Y5LVuqMQ2Wz1qa+4GaIda0HnGsT+dXUg27SPBC7zz/th62uhUdwk6OyZgvK14mNw
	bVTM/w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apmjd88jj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Nov 2025 11:42:19 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b1d8f56e24so176225785a.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Nov 2025 03:42:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764243738; x=1764848538; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/92bqtvgAxvIabGbLUTwTlYWV1H5f0gHUXTStPmWSTg=;
        b=hNSLMM1wL14nLvJoxI8Ar5c24fMvr6RrqzfFhsmJwg+Tm4L5mwjSSlKxiI5iudRyVJ
         mpJz0ueWVmEVYp0LD5TfuZMyg4MRN4NZzQW4MAg/HsO/hsAaVfiSb597t0z05GgRzzpb
         OMPT0lsUvE2/+GQINJRHE2Hyf09VuPmJTcUdaXUMjfwUYtNC6OZvIu56V+pYx+iC+Ykh
         LLCvidnElu9FRjLqUDgubzaHkSDfw5Z/zleGW/AlpIC9bH1yrhzQ1wWW3vqmRCiRFXBt
         ke1hzx/AVEKv77pFsMIS8EH9VguAa/KAn0gMObRFh6hgpM7Horbyu5q/4aufl29xoBTE
         914w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764243738; x=1764848538;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/92bqtvgAxvIabGbLUTwTlYWV1H5f0gHUXTStPmWSTg=;
        b=PS7O/SgxQDsh/G1isYbRoMtFNnMtuQaQUhhYADf+pVrjOS5dYUL/hhKncFBsbUsD+Z
         whyB2vPfdTlmbaat9tSh2pDe8NNp+vBuR2x+EtONOppge0u6tQG08QV5TEctG1cWJ3gy
         MD7N8nYSq9Kx22kXxRriRSXyZWd24Ktp4QYW+I1u6OZitgCrzORZsru5BHCX39Evf58F
         efuqBCmokawsVrBxLE99fGH3bHZoB/2OF3zIRESCL1fziUzF0q2FCVhktXPNFeEf4992
         JAuxHsQ7Zs/ZvHHlmRR6//wRhQ76VYvKgsuTyehzvf8WapiwwlorCRFFhXjThHHY4I+R
         +Ptw==
X-Forwarded-Encrypted: i=1; AJvYcCWIrC0FA0yLfmiT7eS7DSyrV1NjYhEOlCLdjnFnodPDa4MZYCd27moiQ8rCRUJfX7tcHNj1ZuZuFwGQuysM2KkwzA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNWu6fUaPJi+0uQlzmOS5+yaZ80AoEmWQ8tXuaDDRVsakZeGrz
	qVwxhFj+xcFbw0dwa+/YRn8OuEBSS+AV6Ouru2ynuTGQ5ewNI5P/DmUaPt/JLiSgqo0ERsUrMa2
	P129mLvgGEJpJKE6qJHRZgNgFsP1VXc6t7UH8+5qcRonz1mPdW5aIyrwMDNoE2z3pmq/Z9Bt5IA
	==
X-Gm-Gg: ASbGncvqhymKHdri+GF9ggPs3+JP7AFj0W8kb+EmDLjZruFzEnmHdNux4lsHGFMddxw
	kMZ8Od/YscA7xBntRAUAEEjTha7zEEuxK8n1RRbWt0yS9rnmGOVbuqDkiiwNCKPNoDbrkRX8YMH
	SehkoB/De3xYhQQEsKrUutm3KxqmHaAxXbY7uvYuPUruPaY2AbfBJkepEyCXr9dYbp6PiF8K3Y8
	WQZgGJlbsYaVFnGeGrugZ5ziw1JZpW4/Iel7C2RNrx2KPc9XYUBYEhU3S038XzxpJEaneoqtJRq
	yh9C9P5i9p/zsFS24exR+Y0i59KW1VvWeeq3gBmDkHVXy6fFtvsk96NgAZh8pICdupL1GV6c5rK
	rPvMQ3dEBzd27MQr1Bixe1kEubEFlgUtaY0qg2A==
X-Received: by 2002:a05:620a:4402:b0:8a3:f8c2:5ee4 with SMTP id af79cd13be357-8b4ebd821bemr1333096385a.37.1764243738275;
        Thu, 27 Nov 2025 03:42:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHLHuJkpysrZAeyvEty4uFC8IBgU2xb/kZ57e2oHNqTYOlrQ2/iZ42+5b2yAz3us3STsiX/Pw==
X-Received: by 2002:a05:620a:4402:b0:8a3:f8c2:5ee4 with SMTP id af79cd13be357-8b4ebd821bemr1333094185a.37.1764243737838;
        Thu, 27 Nov 2025 03:42:17 -0800 (PST)
Received: from [192.168.1.29] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f5a48c7bsm137242466b.64.2025.11.27.03.42.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 03:42:17 -0800 (PST)
Message-ID: <dbb94fb1-2f78-4bd2-9254-c435ab3325c0@oss.qualcomm.com>
Date: Thu, 27 Nov 2025 12:42:15 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] i2c: rcar: Fix Wvoid-pointer-to-enum-cast warning
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Andi Shyti <andi.shyti@kernel.org>, Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, llvm@lists.linux.dev
References: <20251126182257.157439-4-krzysztof.kozlowski@oss.qualcomm.com>
 <20251126182257.157439-6-krzysztof.kozlowski@oss.qualcomm.com>
 <CAMuHMdX7t=mabqFE5O-Cii3REMuyaePHmqX+j_mqyrn6XXzsoA@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <CAMuHMdX7t=mabqFE5O-Cii3REMuyaePHmqX+j_mqyrn6XXzsoA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 9wbmUIIGxWxCrDExBsbH1MgYqImWlqHT
X-Proofpoint-ORIG-GUID: 9wbmUIIGxWxCrDExBsbH1MgYqImWlqHT
X-Authority-Analysis: v=2.4 cv=OPcqHCaB c=1 sm=1 tr=0 ts=6928391b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Iax6wTeSMpqzYiZSKl48GQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=l25Wfm-L5A7WpkZik0gA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI3MDA4NiBTYWx0ZWRfX+lshwXnAtDh2
 vQkNSed7rRdKq4Tg9paWNPmHdt3aro8UgDCkUgovOSRSb1JGYk48UZ4Z6aecoN7DtXzz2XI9y+Z
 OHjeiDwCiaylDjNU05JHJ3rmGcG9CX6tLU/mbdBFvIy0Watbmeud7NtSEKb/AktZZcAPW243c64
 bTxBEi3nfBfpR2QIKJxJ0XIlwXTzrQndDaGrz+nBlTHjGcvOvJmS2d7+zwjUg4jnqT5B7597IRP
 dl/KBN17yKV1d/vTDGDoVpEIY8xsElKxZBh9Lair7li2ooN+n8tVeZyl2ecBzwFZAV0ZZuxkhID
 jqkPhJBMMPK0r8NcpKKKJl/gwhlxH9HxgRBxlbupJlgx8o7mxUh1WSaduHuo4q2X+FHzUwNi8zv
 bFU2Nlai0/L4iYyhzpgZp9fFBsOang==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 phishscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511270086

On 27/11/2025 10:02, Geert Uytterhoeven wrote:
> Hi Krzysztof,
> 
> On Wed, 26 Nov 2025 at 19:23, Krzysztof Kozlowski
> <krzysztof.kozlowski@oss.qualcomm.com> wrote:
>> 'i2c_types' is an enum, thus cast of pointer on 64-bit compile test with
>> clang and W=1 causes:
>>
>>   i2c-rcar.c:1144:18: error: cast to smaller integer type 'enum rcar_i2c_type' from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]
>>
>> One of the discussions in 2023 on LKML suggested warning is not suitable
>> for kernel.  Nothing changed in this regard since that time, so assume
>> the warning will stay and we want to have warnings-free builds.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> Thanks for your patch!
> 
> =
>> --- a/drivers/i2c/busses/i2c-rcar.c
>> +++ b/drivers/i2c/busses/i2c-rcar.c
>> @@ -1141,7 +1141,7 @@ static int rcar_i2c_probe(struct platform_device *pdev)
>>         if (IS_ERR(priv->io))
>>                 return PTR_ERR(priv->io);
>>
>> -       priv->devtype = (enum rcar_i2c_type)of_device_get_match_data(dev);
>> +       priv->devtype = (kernel_ulong_t)of_device_get_match_data(dev);
> 
> Any specific reason you picked "kernel_ulong_t" instead of "unsigned long"?
> The former seems to be the least common option.

As I wrote in the first patch, because to my knowledge it is the
preferred form for holding driver data which are in general pointers. We
do not store pointers as unsigned long. It is also already used for the
driver data types - see include/linux/mod_devicetable.h.

> FWIW, the most common option is "uintptr_t", which torvalds doesn't like...

Because it is discouraged in the kernel.

https://lore.kernel.org/all/2023081004-lapped-handbag-0324@gregkh/


Best regards,
Krzysztof

