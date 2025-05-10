Return-Path: <linux-renesas-soc+bounces-16936-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2A4AB23D8
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 10 May 2025 14:43:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A51DA1BA51AB
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 10 May 2025 12:44:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 437542561B3;
	Sat, 10 May 2025 12:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GvdgU2l0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B6F21E2823;
	Sat, 10 May 2025 12:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746881032; cv=none; b=AMwIxIDfZH0JrxlHh3VoqCNC9FALRWlNuwK/jj7dYuPlEKT0QuZ1Ti0JzMb1/a+ETrNTD3r0Ci/NblQ1HaKPJYtTDoq9lyQSv6lJRvzkgR7WlbxousJ4Z9n0IXY+WCD0QlWTlHTNQNBphgVavOp64iZgBatR4fTxQNTURy/YApA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746881032; c=relaxed/simple;
	bh=trncF2ch2f9wThK0XhP2o7y6aAgeGr4VGQNU8FblCxY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Cc4zBRYHiFAQhcGqEdE+fYr13doLu2RHeu9UzKbD/S55d5xJ1Qq4hNGoTKjTs084/IKoSTAHIVhKtzidq2i1h6AgEzbKUYqiJg3wkPznmrwAY2ZAmBFkQ6/IEFEzutxgT51L6rvTGJB50fP/hIZ93XB6zeY3zG74mRt8ZQQuoG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GvdgU2l0; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ace3b03c043so475881666b.2;
        Sat, 10 May 2025 05:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746881028; x=1747485828; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ubcPxVSJoCjrOpHWdJpI4Qq6nS9/mQgyw8SAiSHnS8Y=;
        b=GvdgU2l0EUGmM8b4ihCk04JyVO6g0+NX1TJipk0sRRj+jH1g9AajK7rVmjmtSoztan
         iEztdT9F2jBeT3aP46NwSU3sI3Ei/vpdd5N/n+W/spHC6XmV9ARPXatabwOzyC/nJc43
         CH8xXtZRB0ht0y8TpIJZtgWqUoLFIzBR3rpe8xsimkHjGY0VQazTIvLYPNfeW3QcsCdu
         KtkN4hsyc6IrOlp3icUt2KRHsHKilogfHxBvBqvbyuwg01Pl7gLSsSk0S75OPRaBiYqV
         5az8M9Sx4CBxzTTRfHPnUcTNI/ybawWWvnU5jSHA+shTzKcbTwKwCS0pqfYFw/olM6rx
         yX2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746881028; x=1747485828;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ubcPxVSJoCjrOpHWdJpI4Qq6nS9/mQgyw8SAiSHnS8Y=;
        b=Leo3T3KeDW/RM9GDLeO8A2NmoPWZYrHgdKPm1ix7W+gR1v4Lv/fkORGYFUIA4vsM4I
         6dUfHe8wIoXQ9R4/umQjXtVK4r2eqI25grIvs1Nn632YkIxTkPKKvz7uYPBQKXLnrXRA
         g4/tJEwtQV6eMxRrqeU7Yfl8+evefn5TeBJevu88Mm/7gq7oP8o2/cZdbdtjNmsZ6G/g
         jaIh+2XfjSFesPfm1tiyJGbvJ4y4UQ+OrQtVm0Nan8YvwrV3uAi1uJAf/y0ZiG3It7Gs
         VMrieBHpRW0uanRDI0R9LAVHaeGvRu14xuDtV+BWtTIiZR+HCKrQqF6ViGhEFhWOWDUh
         w8VQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlZbA5j+nnfD993DHD4WI+B2gKnEj7VWcx5Q6fp5jlPbUPJmWzDYPmsmRWveWi4ctaQ4qjfKYI9Mnc@vger.kernel.org, AJvYcCWV+ksC4EVNszfqgFH0LoqsTTbVExfy+bBkq7ivsmT3ST9+Ep9xiUupZok6vN577FyHaDBs/nFVWE5jJA==@vger.kernel.org, AJvYcCXlTPh/5zaTr1rcZNZcrZ0nEZAywnW5A3427Gp2gQT8kisU+x1se2jxQryiTyOH5GSd2IIQy/VRHvrkPtw9lAqRdbs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFeGpDMDjvbNRZhnxsSeFRyhXaaI3PbuVL4ci+5JPi1QGFEZt7
	FJkcrfc4Hr8aSHraMDMvGi2vGimPQEWe94sN35wY0SeCjeVZ3gm0
X-Gm-Gg: ASbGncuqcyrHFqYHig3HDtXc4nF3pDLsfGoAyWAd+blUIyjhFz4WNqoa5Do2IwolYSK
	2fGE90CZ8RzuWYqTpjYsIF9Zf2JNRAkKkxjyaBeM147snkWJyprUcqgTGv7HKiIBuYb3ibqKsms
	LgVxzMigZ0puO1xNuXBU97d59Gp+DDLTWFZ31bibbPSBAvlLdWRn62Ei/BjvgKlxJCVUahkno5O
	b84UTzaUEpBerPFicDSQH6Rmu5P9OglTsYfbTJnl6mCILi00hjFFh9YCmygdQOcg5gKpzI9JLWi
	s9Tj+UPdsqehdPypoMyH9PBJygqj4xZ0bEpzPK11/zwxyKZfCdkTw02sadUsm9oSFZ99EIvXHxk
	=
X-Google-Smtp-Source: AGHT+IGCOa0FPbF9zop9VsT0ViWLdGmKzNJps6ZrrRToviv16o7BPM+Glk4iGbUKHtctCaWusK1zsQ==
X-Received: by 2002:a17:907:7856:b0:ad2:1f65:8569 with SMTP id a640c23a62f3a-ad21f65877amr425571366b.28.1746881027734;
        Sat, 10 May 2025 05:43:47 -0700 (PDT)
Received: from [192.168.0.131] ([194.183.54.57])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad2192c81bfsm312421466b.33.2025.05.10.05.43.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 May 2025 05:43:47 -0700 (PDT)
Message-ID: <18b78845-3f01-444d-835a-aa39f84a2689@gmail.com>
Date: Sat, 10 May 2025 14:43:45 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] ARM: dts: renesas: r9a06g032-rzn1d400-db: describe
 Debug LEDs
To: Lee Jones <lee@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 Pavel Machek <pavel@kernel.org>, linux-leds <linux-leds@vger.kernel.org>
References: <20250417093256.40390-2-wsa+renesas@sang-engineering.com>
 <CAMuHMdWN-QDrmogJ+7x8sdc6UmDAoF+0z0hZ3SQ7ajN2V2+mSw@mail.gmail.com>
 <aBxjvofZCEi_1Fna@shikoro> <20250508134930.GM3865826@google.com>
Content-Language: en-US
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
In-Reply-To: <20250508134930.GM3865826@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,

On 5/8/25 15:49, Lee Jones wrote:
> On Thu, 08 May 2025, Wolfram Sang wrote:
> 
>> On Thu, Apr 17, 2025 at 01:39:14PM +0200, Geert Uytterhoeven wrote:
>>> Hi Wolfram,
>>>
>>> CC leds
>>>
>>> On Thu, 17 Apr 2025 at 11:33, Wolfram Sang
>>> <wsa+renesas@sang-engineering.com> wrote:
>>>> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>>>> ---
>>>>
>>>> Changes since v2:
>>>> * using function, color, function-enumerator properties now
>>>>
>>>> Honestly, this is better than using node names? With V2, the LEDs were
>>>> named as in the schematics, now they are called:
>>>>
>>>> lrwxrwxrwx    1 root     root             0 May 12 12:10 green:programming-0 -> ../../devices/platform/leds/leds/green:programming-0
>>>> lrwxrwxrwx    1 root     root             0 May 12 12:10 green:programming-1 -> ../../devices/platform/leds/leds/green:programming-1
>>>> lrwxrwxrwx    1 root     root             0 May 12 12:10 green:programming-2 -> ../../devices/platform/leds/leds/green:programming-2
>>>> ...
>>>>
>>>> Which gets even more confusing if we might later add LEDs not on this
>>>> board, but on the expansion board. 'green:programming-8' sits where?
>>>>
>>>> I really wonder, but if this is the official way now...
>>>
>>> Good point!  So I'm inclined to take v2...
>>>
>>> Let's raise this with the LED people. I don't want to fight Pavel when
>>> v2 hits the CiP tree ;-)
>>
>> So, if there is no other opinion here, can we remove function, color,
>> function-enumerator and just use the node names which match the
>> schematics? Basically apply V2?
> 
> I didn't author the semantics nor the rules surrounding them, but I am
> obliged to enforce them.  Therefore "LED people" say, please stick to
> convention as stated in the present documentation:
> 
> https://docs.kernel.org/leds/leds-class.html#led-device-naming
> 
> Please note that a "debug" (LED_FUNCTION_DEBUG) option already exists if
> that is more appropriate to your use-case.
> 
> Let's also bring Jacek into the conversion, since I know that he did a
> bunch of work around this topic.

The question is if the LED name from the schematics tells anything to
the user of the equipment?

The idea behind LED naming is to facilitate matching the LED class
device name as reported by the system with the LED location on the
equipment.

The LED naming standardization intended to enforce consistent
LED naming, and not allowing to add multiple interchangeable
names like wifi/wlan. It also helps to keep LED name sections order in
accordance with Linux documentation, which before had been often
abused by allowing to assign anything to the now deprecated 'label'
DT property.

Regarding expansion boards - we never have control over what
LED names DT overlays will define, thus LED core adds numeric suffix to
the LED class device name in case of the name clash.

-- 
Best regards,
Jacek Anaszewski

