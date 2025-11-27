Return-Path: <linux-renesas-soc+bounces-25276-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A79C3C8E8AC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 14:44:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 626EA4EB3AA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 13:42:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C04572874F6;
	Thu, 27 Nov 2025 13:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jKuBGtkR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L8Lzhi99"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1697D27E06C
	for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Nov 2025 13:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764250947; cv=none; b=Fc15EugsOK8qKNZkyyegG4tDb43F9N2M2oRBQK3X1m9PMkSBDaFRyIThdFX3Wty0R56T5f+2FjGBIncyK8tWBnQij9gmnrglCTIbtS7GuBRsTdNL5mhV7etMlb5nUXRjaMFbZdaNMavdrtediEmYDwP3Ik7CbLK5xku5zVrTALQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764250947; c=relaxed/simple;
	bh=R9dPhLuK1onF4dCRQ+094LsOQKh+XIVI8g0bRwXb+hs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jh6Vt6FMjndACsYa3clPUnmCtnIhQFqLGF0hI1sNHrkE2o2KTyGrAK7fuHbp5A+dmohKSDmS2xWR1BEnSev48zfFDMmmNCdTdvEWY1rzZJbFWZNjfg4uG5WL3b+2TiBSHqmKnGFAnzP3qjTNPWP+VwE9NJz2mLJMTDe3zsE2MLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jKuBGtkR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L8Lzhi99; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AR9bMWr785511
	for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Nov 2025 13:42:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wBsuMWDT50l9fpxTrmFtEsFBa7H7uACR9TerGQtNXCQ=; b=jKuBGtkRFNXB9Vh3
	IgbIPQeLt2MLSBpkL6pic/TCbbH9zFzEIW/CfmymcIexW+z2KgsdrkeTwzl02Gqa
	zgqyFtB0stqKwfqUxCrFt8wZmEOl1Q46CZTohkKPcb8flGkBWcLSf+OlDK2szexy
	2MxybXvTqBD3I+WsZIL3qaZNECG1o3Z4vXbWUw/lfYQy45ir5oauixNq+MOQcz6A
	L3IN397gjgycaoVQRckfO1Ry2tQJMn93W3z+HezEEeMREsCjZb9TFjqeuYmT5IOj
	0g00n4m6Rz9X2L/BnH532gGQ/43Ie4w5ZW5POrMzicRxSk1l4CvXVWfdARMlYnZ4
	dS9x0A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apm61rm4e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Nov 2025 13:42:24 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b29b4864b7so188510385a.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Nov 2025 05:42:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764250944; x=1764855744; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wBsuMWDT50l9fpxTrmFtEsFBa7H7uACR9TerGQtNXCQ=;
        b=L8Lzhi99oM23CHdGLucAy1vQpVZ8v71UbGxe4X0zfAMu/2Sg+o4vTXg6S8kHoq58hT
         8/mOVyJA4jKaFi3uaB1zwU3wlb8LzjziDYkoKM1veoqzR0uSVGSP7It8CS94cmNa/m06
         I9wyVRXTJNZopk+7zXbAzCLR1z2PdNwE7J9NfFlCBfN86E42Jon7V9yGx3bAicZGwytM
         Y1XeXvuD87aoL+LW8fGgNlQiEWEwEK7kN/Z/UdbCbIlMj8S2IO0EIvSCP7gcW2rK/AAy
         3WEskeoBHjRuY6zHz+xMdXkq1AjbYw2rCEy59o22K1etCsE2tH9wQccaWdMk+Ob4Q4X0
         Fj1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764250944; x=1764855744;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wBsuMWDT50l9fpxTrmFtEsFBa7H7uACR9TerGQtNXCQ=;
        b=g/j7BcApqRnLpXN+J/k7gnl/1UOs79/jtZQo8MQ2b67UgZdOMdC+CJGEqQAroVZDE7
         zve2FQWhfBH4UBcSCglJkhqLLI5olEnvYhJsBbzxruSl6BAVix/35Ps1mKF9Srv9yjZf
         WEI2pC62YZK5kalKIhSk51plVBfM8kYePpvWe8VIM5+45Xw/hrAc8+0bll+3lK4u9MAK
         Cb7eISGUF0bK6yGBcDJ7fjByYbpH8WuliglucfD2icXqeHs16SNykl3LhlQwJZQbGIl5
         DdOVr4na1kixjed6nklRiy6mECMKA+CSRF8ct5Yv3zztnVS0YBDApB2F7Wi79wGFn264
         aM8A==
X-Forwarded-Encrypted: i=1; AJvYcCWMzfyLnfGgOczPeQSOCRXVrElMv3D1BKBeO0SAGn7KAyFUv9pikQVDGqkVZ4YUFPVuBnGBGyBur4Ww2hk41Na2cg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7+nnBxhdUZjeBDcPKD0pzVrd8m0swGBEmW/H+UphL/rG/UeTU
	MQ8PWyPBHiETuLxKDhBHcGK4F7T+WJw3SHlcYWiGZR94tGO5OW6Ds3JhD9aiif4ZyBVoUqT2AwN
	mAI6NmzjiOZ3p967G2+ezcXSfUNQEUxbzlyVFDOdF3lYMmKi6GQLvSGSC5kg/v4aiNhd2aUlnYA
	==
X-Gm-Gg: ASbGncvKw1BGS+4Evp/sd/OFNSU3mzjpSQQ67kpgS2g3LAaY++1q1MKeHZtHSEXonrp
	LGCLRc/6zpX4OMQAblHGBU+4irao+lfENgzuKQF5w6AAkmG0cDwy5Kcq9rsVGMOIiXVQ/FqKbVM
	MU7PT2KstC8YXlrwN8qRWXnOBUwMvogo8dJaCCPfCv7ogNMELHkV4LGykY48/JQenipSscMlgiu
	9b5bwRpEWKK79oTGQyeWBPqsGDz/r5+IxgFfBrsG6YpPzv8E4fVfoTNwxeTC/FcX8TIS9b+Ro4O
	ZwXz3vx/WCQyHUfUdgoRw6hP0e8Na1MdTJYPD2hZX3WWXfIadLZ8239ZZNlfrL6/V5WPhgSEYxR
	40LycBrt2S+g0+h6jruYF6H+whge0pwCqzsfE5w==
X-Received: by 2002:a05:620a:44c5:b0:8b2:dabe:de38 with SMTP id af79cd13be357-8b4ebdae979mr1429401885a.43.1764250944194;
        Thu, 27 Nov 2025 05:42:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFNvzt/PrOfhGZ8fmsoq/xodudy4WzNIdA5X/QjQaFX8lD5yGjc3Qp54CgRzqeLcTbs7sQX8A==
X-Received: by 2002:a05:620a:44c5:b0:8b2:dabe:de38 with SMTP id af79cd13be357-8b4ebdae979mr1429398285a.43.1764250943695;
        Thu, 27 Nov 2025 05:42:23 -0800 (PST)
Received: from [192.168.1.29] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1caae37esm3639930f8f.40.2025.11.27.05.42.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 05:42:23 -0800 (PST)
Message-ID: <ebb0d41c-1836-42d1-8406-ead97c4d6886@oss.qualcomm.com>
Date: Thu, 27 Nov 2025 14:42:21 +0100
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
 <dbb94fb1-2f78-4bd2-9254-c435ab3325c0@oss.qualcomm.com>
 <0e90817e-1c05-4fa3-a6fd-8e755608a2c9@oss.qualcomm.com>
 <CAMuHMdX2qv2YBbvkM8tkSTWDPe-paMp5=fdv=4tGKheTseK9Pw@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <CAMuHMdX2qv2YBbvkM8tkSTWDPe-paMp5=fdv=4tGKheTseK9Pw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: WWn5it-Jjyk1TvpCAV5DEKiQkd-QHQhW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI3MDEwMSBTYWx0ZWRfX1P2rbnmkUJWM
 iNYMIO9GerlCHTPHx9GNK6Ehhvy43ox/XsQNNsk6/OsxwoWSWgdqtNsXN2cB7j6+2CtfOsC6+Px
 61U9lOL6v4fcsyEOzuK5VPsF5Sw6mwxJAmlDH8R30MteUErRxm99hwTAQQC0a3AfW/ItjrIMhKt
 Itnjt4sUzNMRUfk+uP4OpmAezJbm3Odta0sA/T60/SUX6VQgtJ9ydzdzvrIkNUWhyFxs/pXmL41
 84NWW49bi1QKsHq9fKYqTLOhvtF0i28X1glMjofg+ORjr8lgTn8AIoVcYRPfs2TsWsJ2jImFjTS
 0bxi0RkB7a4zoBjNReSgGxcQBFtWmViNhBAWkTLNs8aK46FrMSKUhz0Nj1nt1bkc46dGEwyPkGx
 ajgQM1MJFVjpMieRl2JOU57tvV3Kew==
X-Proofpoint-ORIG-GUID: WWn5it-Jjyk1TvpCAV5DEKiQkd-QHQhW
X-Authority-Analysis: v=2.4 cv=IciKmGqa c=1 sm=1 tr=0 ts=69285540 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Iax6wTeSMpqzYiZSKl48GQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=-5l79d-VV7xRAF-9bO4A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511270101

On 27/11/2025 13:52, Geert Uytterhoeven wrote:
> Hi Krzysztof,
> 
> On Thu, 27 Nov 2025 at 12:48, Krzysztof Kozlowski
> <krzysztof.kozlowski@oss.qualcomm.com> wrote:
>> On 27/11/2025 12:42, Krzysztof Kozlowski wrote:
>>>>> --- a/drivers/i2c/busses/i2c-rcar.c
>>>>> +++ b/drivers/i2c/busses/i2c-rcar.c
>>>>> @@ -1141,7 +1141,7 @@ static int rcar_i2c_probe(struct platform_device *pdev)
>>>>>         if (IS_ERR(priv->io))
>>>>>                 return PTR_ERR(priv->io);
>>>>>
>>>>> -       priv->devtype = (enum rcar_i2c_type)of_device_get_match_data(dev);
>>>>> +       priv->devtype = (kernel_ulong_t)of_device_get_match_data(dev);
>>>>
>>>> Any specific reason you picked "kernel_ulong_t" instead of "unsigned long"?
>>>> The former seems to be the least common option.
>>>
>>> As I wrote in the first patch, because to my knowledge it is the
> 
> I don't see that written in the first patch; it has the same patch description
> as the other patches in the series (mutatis mutandis)?

https://lore.kernel.org/all/20251126182257.157439-4-krzysztof.kozlowski@oss.qualcomm.com/

I meant that brief statement in the patch changelog.

> 
>>> preferred form for holding driver data which are in general pointers. We
>>> do not store pointers as unsigned long. It is also already used for the
>>> driver data types - see include/linux/mod_devicetable.h.
>>
>> ... and in case it is still not obvious: I do not cast here to final
>> type, because that cast is the reason for the warning.
>>
>> I cast to an intermediary type to help compiler suppressing the warning
> 
> I know...
> 
>> - to integer representing the pointer. Unsigned long is not representing
>> pointers in the kernel. Integer type representing the pointer is
> 
> "unsigned long" indeed does not represent a pointer, but in the Linux
> kernel, it is guaranteed to be the same size as a pointer.
> 
> '"unsigned long" is superior'
> https://lore.kernel.org/CAHk-=wj2OHy-5e+srG1fy+ZU00TmZ1NFp6kFLbVLMXHe7A1d-g@mail.gmail.com
> (he doesn't seem to have said anything about kernel_ulong_t)

Yes, that was again comparing to uintptr_t, so we both agree.

> 
>> kernel_ulong_t, I think.
> 
> include/linux/mod_devicetable.h:typedef unsigned long kernel_ulong_t;
> 
> IIRC, it was introduced originally because "unsigned long" might have
> a different size in userspace.  Nowadays (for x32), uapi uses
> __kernel_ulong_t, though.

Maybe, but if you look at the data structures all have kernel_ulong_t,
so this fits the logic I was following here - I cast to the type which
is both representing pointer and is already used for driver data,
because this match data serves similar purpose as mentioned driver data.

I don't mind casting via unsigned long, but:
1. these are old and trivial issues,
2. they are quite annoying when people want to compile test with W=1,
3. I was trying to fix them (although not sure if for I2C) already,
4. and some others probably as well were trying to fix them,
so how many people need to send them and debate before we fix them finally?

unsigned long vs kernel_ulong_t is a nit-style discussion IMO, unless we
have here more concrete arguments, e.g. statement from Linus that
kernel_ulong_t is wrong.

If maintainers of this code want unsigned long, please apply the patch
and fix directly, but for the sake, let's get it merged...

Best regards,
Krzysztof

