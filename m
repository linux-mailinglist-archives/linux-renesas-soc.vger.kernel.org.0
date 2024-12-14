Return-Path: <linux-renesas-soc+bounces-11345-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC219F1F55
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 14 Dec 2024 15:30:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C8509163816
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 14 Dec 2024 14:30:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E3D2197521;
	Sat, 14 Dec 2024 14:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JmA8uzaK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B60D01991A4;
	Sat, 14 Dec 2024 14:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734186616; cv=none; b=U5sdXltJY9tvZVCpAA7y3CCNbsO5ro6Tl6U3HrydfbU/4xnnBtxtLl96mo4pb7defXmXlOcTHAKsPBDmGlDtDr61purEdlbUB0U6wy7gzZiteom9q/Nf2T3eiXL3/uWZW6MFUUW7iGAz7cndSwFJ2AFYQclxeBMDMHu14d4XH08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734186616; c=relaxed/simple;
	bh=qTX71VsvCqcO5GM2Pj5zN9mF8da20E6t7FM3Kn7/XD8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=CeVAuQL5p+AJysFT7p3qRT1EcY7HKBq0Bt16ZCZ4QGirba9DYo2D5EcSmWGN/10NAFg4GfDV9nmF/j0mRdN6SEf7iNE+FOdacbCmwVXE+/QkNcRc3zFxbZqfrsQY2aHJCsWwPG4ACzBpMToKlG2C516iUsS1eEnVetoq2W8ser0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JmA8uzaK; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-216395e151bso17614025ad.0;
        Sat, 14 Dec 2024 06:30:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734186614; x=1734791414; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=AR5LsJhDtlocPcj99i9gi9dzv6mD0Mw+NVwPsN2j1Ok=;
        b=JmA8uzaK87pBcG9j2PgzJtTcaSw/MPqy5NFQ5HJQ4LN8L8roNh8wceiWsCL/isiw2W
         opAMDlFaUdtck1MTWZNyJEPUl7Hl5oIt0EeJj1daaXIhSCxfUM4/PSRL9jdJy1eV4MVf
         ifwgOjLycb9MdXwq7yK9A5oMvtMZPru3PUlpDtR5bzBZSMYSPnc1iF4uClHn9AdURyY/
         pnHWG0qGBM/EUSsjZzp8WRGQYsbxCfruSk83gYUo7qbPQdgX0yAVqXYfRL7YE5OAgMs+
         crFTyCofa3jAEnUcoASwd4Y4CxwnCWYJeoEDYkT1Asl02zwd/bWML81hfYLhDRrqYuXD
         7vjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734186614; x=1734791414;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AR5LsJhDtlocPcj99i9gi9dzv6mD0Mw+NVwPsN2j1Ok=;
        b=uO2g2mde4tzgImTZPIUSM/nszCMbv8EK5CaJ6q++cD9NvtuZ5GwMPgwlFgncih0/R9
         b3xn00jhT+6ZrIr8BgjdFDD2YMIGQs+YvobeTCX/ChaL/NSIOB1DWXBZFUcmihOX8aDj
         c/d5g9ilzbJ8w8fs4fEwJ5D7S7PwmFKRCpFKTVkik3gBiFsMulYFi9IE2Egrqh+hUi3f
         smE0cmzP0f2ySF2a2na5EoNLauT5CtQEjXcNTwHmMykglIkNlhYH6n+5vCaPtjQ/xZ5x
         l+TIV4qsZniqEZxZmsuZeuaFlvBzTmuNgjYnmXd8uJHw/940XdnkS2G77sXr6jLfklUl
         BNlQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNHcNv5k/Wfkt1Dj2D2j8j1pBfKC35hkJoAWTr4epyZOdNpTQMf/MP+wToGJ7as+aSHbOaaThuOLdXxw==@vger.kernel.org, AJvYcCVEFZXjVynrvTkeoDYP+Q4+uZFU1Hq3hlLd8WiNsDFZ0FnasSyNUvsq+xL5F4KEIMe1Egc7FP4tWEUvoV9u0c0d9ZE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+KKH7GYQeNGaeldKcmCgmB1rzZha8d0QyYK7FB+TpVSDe5sM/
	1Wqh5ekYga32D83OLoJcd8yN1CuXNE6p/RRcBYb9L0uKqLBZRW2FsDpYtA==
X-Gm-Gg: ASbGncv69V/P4ucQTRhbwCfgdxu2cIykRSGEoP8vJCDrHb4Yw4iwUm4jLxEDsS6/E2O
	jdseLcFZeKLrwXl4pYBKkvhVWo4Ko8TEx9zA3A/PYPBd+zRQlEXjJ+JlyWi6uqc2gmxEowlb2Ug
	Kqjy0WA+F4NTGQFOZn+hYbSfw6200cV8nzKxylEi49oqXZg2PsjQi1MjI7QMMMBKEhpMA1vlPvo
	qQ+kh9FJ+5NdLm8pSiv7GNz2duWcPEnxG8/TjHC1bVFwQq01VINXTUh1P8rhMt5/ZTQDflEMRed
	gJwtIP2ACzHzZNVT+YM11dvogRamSg==
X-Google-Smtp-Source: AGHT+IFjgkJvooRDY0RGjzc/vlUpjMwrcJw9QBsd8wtcSE0IHwljKyguUu6uS02Rwst0rKIXY8efjg==
X-Received: by 2002:a17:902:e80c:b0:215:a808:61cf with SMTP id d9443c01a7336-2189420684bmr112031425ad.25.1734186613969;
        Sat, 14 Dec 2024 06:30:13 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-218a1dd3ef6sm13384565ad.106.2024.12.14.06.30.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Dec 2024 06:30:13 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <2e8e63f2-3a1b-4ca4-b095-4a6cbb20ae25@roeck-us.net>
Date: Sat, 14 Dec 2024 06:30:11 -0800
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/2] bitops: add generic parity calculation for u8
From: Guenter Roeck <linux@roeck-us.net>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
 Yury Norov <yury.norov@gmail.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>
References: <20241214085833.8695-1-wsa+renesas@sang-engineering.com>
 <20241214085833.8695-2-wsa+renesas@sang-engineering.com>
 <6fec7aa8-32b4-47de-8fb5-4ab6890c1f46@roeck-us.net>
Content-Language: en-US
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <6fec7aa8-32b4-47de-8fb5-4ab6890c1f46@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/14/24 06:19, Guenter Roeck wrote:
> On 12/14/24 00:58, Wolfram Sang wrote:
>> There are multiple open coded implementations for getting the parity of
>> a byte in the kernel, even using different approaches. Take the pretty
>> efficient version from SPD5118 driver and make it generally available by
>> putting it into the bitops header. As long as there is just one parity
>> calculation helper, the creation of a distinct 'parity.h' header was
>> discarded. Also, the usage of hweight8() for architectures having a
>> popcnt instruction is postponed until a use case within hot paths is
>> desired. The motivation for this patch is the frequent use of odd parity
>> in the I3C specification and to simplify drivers there.
>>
>> Changes compared to the original SPD5118 version are the addition of
>> kernel documentation, switching the return type from bool to int, and
>> renaming the argument of the function.
>>
> 
> Curious: Why not bool ?
> 

Never mind. It returns the parity, after all, not "parity is odd".

Thanks,
Guenter


