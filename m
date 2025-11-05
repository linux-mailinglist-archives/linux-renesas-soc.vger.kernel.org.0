Return-Path: <linux-renesas-soc+bounces-24152-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B6DD9C366FE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 05 Nov 2025 16:46:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3331E4FE9B6
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Nov 2025 15:37:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 173FF261586;
	Wed,  5 Nov 2025 15:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cKwA9SZ1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C78025F984
	for <linux-renesas-soc@vger.kernel.org>; Wed,  5 Nov 2025 15:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762356981; cv=none; b=h8nMKs92DvROLuQ3Fy16f8VsJaQT3rpdVXbW2ulF29zgjElr/Lgg9uHj+7Vlb638vDT1Q9bkH3fRktr/J61wCYEe7oj9LVnQqsw4WHeQTTmDJNGzTXE28TtxnoyutE6PuJOC6Xn0I/7pZKL+6LDXRb14Xyd5Exd0Ta4j9RDjWj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762356981; c=relaxed/simple;
	bh=h6IY44+n9svW+bU+6obg1JzZFLK66f2qfn9IWru+JoI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ECAaSRrTnjkeAis9WWEA/prz37ljgKqca0gsPtiW8YdE/SlJufUKVnih0JUajgHjTqYIB7Yj5b85JcVHVZeHLjwyJn9V7EaRTs0xCa2gXI8SpeuceEZRwwmXQBzcG8ydkOpqipKVKVYpZA8RaEWaSYALt1+RUzgH82x3ScTZmK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cKwA9SZ1; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3f0ae439b56so3577223f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 05 Nov 2025 07:36:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762356977; x=1762961777; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hlm+t7ywPqSKVErvoumWaf2NiXRnADmmBeAkOgqc8tM=;
        b=cKwA9SZ17wKgofWuP+eHT8cciozVLGMh5l3Ay/r93mWAeqR3zIYFWFS1me6sJLYjVF
         x6lzRmvO6CJgYMY7AOCPeNvwOg8eG7+jaLdEx9fQDHMuhBTLI2UDUt4qiSBY2rKrBHqa
         sBp6XTkSVduu/At8L97nBXBwXudLu1NLE6CCzfm6nJEJxciTZqBrUH/A9jwvjwTwNXXc
         BoyaeB/DV6cA11oAvt4i7PlzADUR8MCqVJm+pnO+yoiNRUaFYQoi/W5iZvVyTh/BunAw
         diGHe744CH4u+a15oRtTMFbvWXGKbv+Qi28McBbl+vdSvWPLDvebRoFOgb/7iAva1/DW
         8xpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762356977; x=1762961777;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hlm+t7ywPqSKVErvoumWaf2NiXRnADmmBeAkOgqc8tM=;
        b=QtJbkuS6732PqCeuvubjrR2JwfNvycieP1r47JQT6GUo5a/dMITLi3Ct5NJ/RXSf4E
         tOXDamPPP4vM3nxrhZ8Jlpk480CAWia2pmZze99j2j4S3qXvVWxKKJH8flEZ5WH6cX8s
         LOL+Pj/YLcQLYc28ZtJiylAmju4ULyvS1Wesg8NX/qwnsFKkgonyDVmmAz4JfLibNT3A
         xjV8cZ1PGP8ehsRfvMGgI6GamXZyRqL8drrRtRT85iappsW9vXr3EbZgHnmShMoT4smE
         0EAyhPtoXsYvroAmP045Et2BgEP7HNDIFwUFVga54ph6ZChSJ4pZmbMpqGuh94amZGxM
         Sskw==
X-Forwarded-Encrypted: i=1; AJvYcCWITS2mbky7JlCz6Rr5EVhVySKjz0FBkvuHVCaB0LK1r5os1kYV2HaGKtLY0xnQjSYTl8R4T6Kk3WQusfskf0T2TA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyix9Kghw67VZnig4+8M+pRJ7nBlu9fgzKkxuK1EMTAE/8f2LaT
	ZzHYp2cEsfPGYLR1/0z/iQe9fmMq7r8UDMQmRfx0OilxUPjzD2RsRlDf4vtV8EMTU3E=
X-Gm-Gg: ASbGncvm5ez3E1NWIlG3COQF9pnzqAWoCKnhZuFj6zI+BK9ZhFgle5Dw//aA6xUrrGm
	rMLoHQjLPP6Dt4UBMx1tvh4vhT6dmuicHnPwz2MlZK+vjys+EgOdmACtrh4EoeoVkyeyrJ5Aqxm
	ILuKVsDx8lcYzpQPV2jscGyX9FiJeFOJUTu5FDmCqBONVBzwhpcmam1nB/nXZ274YMZu9uQX3pt
	PvOOjp/3x6WOmramjzjW7VkN52KBZrZ3LocprJ7e10jOHOcGuZFM8lnMljxhnFT1RC2KmBcG4a0
	AslYqEyCULxzKOSwniGGZSlijlgTIpsDEnO1hppPydQRaHrq7jyak5eDMLeFsmkkmPuvgk5eeII
	7xTWSUcXocDwlqef/FSJ3NQfNrqsgi4xMaQA4f7Y9Bhz9+tU+XJ2Db8yXq79ySwhHm/FdrAQnzg
	wdtzknE5ylIBgbiI02/8hb0168g2PwK1letV2p
X-Google-Smtp-Source: AGHT+IGc9Sr28tzgsM4FYJTg13n93hwv53wS3yAGxhmgy8eKjduRfr7nJLFOgLBuJ91Z09L6XqZX5Q==
X-Received: by 2002:a05:6000:4212:b0:429:c7b5:ed9f with SMTP id ffacd0b85a97d-429e3333311mr3850220f8f.63.1762356977489;
        Wed, 05 Nov 2025 07:36:17 -0800 (PST)
Received: from [192.168.2.1] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-429dc1f9cdbsm11645493f8f.34.2025.11.05.07.36.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Nov 2025 07:36:16 -0800 (PST)
Message-ID: <c07ae384-4042-43f4-b876-7207b72260f7@linaro.org>
Date: Wed, 5 Nov 2025 16:36:15 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] clocksource/drivers/sh_cmt: Always leave device
 running after probe
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?=
 <niklas.soderlund+renesas@ragnatech.se>, Thomas Gleixner
 <tglx@linutronix.de>, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
References: <20251016182022.1837417-1-niklas.soderlund+renesas@ragnatech.se>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20251016182022.1837417-1-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/16/25 20:20, Niklas Söderlund wrote:
> The CMT device can be used as both a clocksource and a clockevent
> provider. The driver tries to be smart and power itself on and off, as
> well as enabling and disabling its clock when it's not in operation.
> This behavior is slightly altered if the CMT is used as an early
> platform device in which case the device is left powered on after probe,
> but the clock is still enabled and disabled at runtime.
> 
> This has worked for a long time, but recent improvements in PREEMPT_RT
> and PROVE_LOCKING have highlighted an issue. As the CMT registers itself
> as a clockevent provider, clockevents_register_device(), it needs to use
> raw spinlocks internally as this is the context of which the clockevent
> framework interacts with the CMT driver. However in the context of
> holding a raw spinlock the CMT driver can't really manage its power
> state or clock with calls to pm_runtime_*() and clk_*() as these calls
> end up in other platform drivers using regular spinlocks to control
> power and clocks.

So the fix is to remove PM management in the driver ?


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

