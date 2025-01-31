Return-Path: <linux-renesas-soc+bounces-12772-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85BDDA23975
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 31 Jan 2025 07:13:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E3F9E168984
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 31 Jan 2025 06:13:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9A6361FF2;
	Fri, 31 Jan 2025 06:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VF485y5w"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06CD94C7C;
	Fri, 31 Jan 2025 06:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738304000; cv=none; b=aKSFSLKiq57uAEu9M6QCwDyD8mXtjrW59JnBZvPQdw63ILUoC27mvAFbjNNxB8nc9tVPt8dDrKtbC4NMvoHKJuaRplcZXfyi1tVzF6JApkggGS2H8E/azZTWPMZo29/os/RIhHRoG2DxQP2EtM05UYaDVt+2N0oyF5g3RRuwNkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738304000; c=relaxed/simple;
	bh=PXAeB4DOHyrzhYax7RLwrfS3FalL+6UW7MIkQFYCS+k=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=s3a4wD407lCLrNQqP6rQQNhNmtwqC9QChuu2WeW0qv2pUqdNFRvsQI/IA+t6yd+CX0edHnAZyLnbvKyKcYeWZpqiO/1VTFteUComwUjgD9arN3qlH9Cj4JSXACCKsu1u8b4UFof6Jz6Mk9SekNSmElK7hogiXxia+Ef9Ak+NFbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VF485y5w; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-215770613dbso20834225ad.2;
        Thu, 30 Jan 2025 22:13:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738303998; x=1738908798; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=kmWe2eMC49F+ZBpukyG3nksc2sHJe9uIWjGCEmWf0Tg=;
        b=VF485y5wJFBNlYJsVBcddWizAXlVV8mUqyjd+7iYUK13r0cS4NYA2+4A06tKmZbtA7
         VCM0BjVmnY2GfEK3KLOl23EWgGGu1cvTXBWztnfAGJUkzY0goX9ueV0o0yp3e9a5Vtxm
         4+shiLeUxERZSqDgTmhUBNEXE+nP4lVjCuNKl/kyI78qtL/+c2HKU510aCgRW5frYZuD
         lmAJEoeKFZPKvpIHVqHPNRqmm0w009uu2Usj9xA0X5+WhVLIFcE0VFkucn3X2lNfmMn2
         KAQML5pBW2CO+OQ2klKVfEekF9HVaNiHxjpTRJxUSo8F/NZ7GEJ0exFTNdfuUECrymUm
         GxXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738303998; x=1738908798;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kmWe2eMC49F+ZBpukyG3nksc2sHJe9uIWjGCEmWf0Tg=;
        b=PJM/trKCdRBUVNA6Ik/8erEAxDeUGbg98rBDhoo6hp51Gtcp7GzUXM/DxtFg1L7PNy
         9ym6L+iuX1FyCXv9RjLbDT8v5XzxsYlUiXE8htVuWvg8mGpPZ9G8LmyYd5KVPAa4il5R
         grZDwpRq5Dxx611ehrouTd27XKKLDVOPr0y1DSeLH9Z+zYeg1gGnZWUKxDNFRAMHfThY
         bKiq3ipSB/aWXTZf5vSkItWr6DdFo0WWCKTEoTkyJ4W+bM3EEuLo7U5NmLD/PUcW7eCv
         eq2AacTj6wW1hCxe+nbmz9kAqFbw4Cr8MupJYtPwIzqa1gFa3IDtnAVBQGcgp97Gte/l
         tYuw==
X-Forwarded-Encrypted: i=1; AJvYcCWy4umI5p5qD4qp1BhXpGsM4K7zdr08pA8EoQB8B4LxwP0fQmTPX1wMKXjXmN/zlred8iXB6jqWjGUxzgbS4vGDg0s=@vger.kernel.org, AJvYcCXxU4m1jFmVnIyy9oFkZjTc7UnwT+vzHXOE/mf2ug69irmBwJAk0xhllOv/UQNWTUErlx51NfPt5x8kaA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ5+Wx32UPANvD66eDEDxMxOGiJqiJJlbu1wftJs+/cH8paaMB
	540kPjLm2VYnDKCbkMVenCMOeNpFXk4kUL1+djW++cF5pyyC4yJA
X-Gm-Gg: ASbGncv+4qAi5QX682EEGpMFUZipGVKuQVVVePgQ6b/ZF1I4lQxaXInbjXYGys0m2ed
	vntnPZanx5MAK2WD2EkBAEQwCldxFY8LvkrIty2rolq0d6J7hf3y1NBbilB/ZMa6w569nOIQfz7
	Xg19cuOSoF4YKDF1J3PXM0FKjPnWsDeFBDTBLxQidW1M6rac+y/XgGCAcAf2WZcQRMEPZQ3vCcZ
	4IBrLulvy69kEdJPbVvyyXkXKCGXO/CRgfvm5iVR5+FEqNL+oBESVL3eXA0tUBPAiFiFYTccw6p
	X6J8c7wdR18HSif0Bau3cdHCU1ecpOwZ4GKclWv7DE4dr5X3i7vVGaaBXTFoTrke
X-Google-Smtp-Source: AGHT+IGg00AJKY+TjJPsbGQp5gLxiQES6SUMEnCLUjSsZDiBY6LCeeNW/tS/WstaJJ6C8n88XhGOMg==
X-Received: by 2002:a05:6a20:841e:b0:1e7:6f82:321f with SMTP id adf61e73a8af0-1ed7a4dccfbmr15184508637.17.1738303998096;
        Thu, 30 Jan 2025 22:13:18 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe6a188b4sm2468485b3a.168.2025.01.30.22.13.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 22:13:17 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <25c44907-b693-4f15-8e3e-05350760d951@roeck-us.net>
Date: Thu, 30 Jan 2025 22:13:16 -0800
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] hwmon: (isl28022) Use per-client debugfs entry
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-renesas-soc@vger.kernel.org, =?UTF-8?Q?Carsten_Spie=C3=9F?=
 <mail@carsten-spiess.de>, Jean Delvare <jdelvare@suse.com>,
 linux-hwmon@vger.kernel.org
References: <20250123160347.44635-1-wsa+renesas@sang-engineering.com>
 <50e84380-f054-4c2f-9961-6b8a1784ea10@roeck-us.net>
 <Z5s-e0JwnO7o5hj0@shikoro>
 <557697b2-caf0-4d60-8c42-2bcdb69919ce@roeck-us.net>
 <Z5xhvfG4GDStIYYH@shikoro>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <Z5xhvfG4GDStIYYH@shikoro>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/30/25 21:38, Wolfram Sang wrote:
> 
>> You dropped
>>
>> 	if (IS_ERR(client->debugfs))
>> 		client->debugfs = NULL;
> 
> I have no idea how that got lost :( Darn, will fix!
> 

If you didn't do it on purpose, I assume you took the prototype patch
I attached to this exchange instead of the real one. I always find it
a nuisance that patchwork picks up such "attached" patches, but I keep
forgetting about it.

No worries, though, I already added checks for ERR_PTR() into the pmbus code.

Guenter


