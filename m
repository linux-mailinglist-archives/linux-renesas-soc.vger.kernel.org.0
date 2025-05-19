Return-Path: <linux-renesas-soc+bounces-17224-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 56578ABC8EB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 May 2025 23:14:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D93423B80FA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 May 2025 21:13:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CBCB21ADA9;
	Mon, 19 May 2025 21:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R75yD/ph"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE7B42116F2;
	Mon, 19 May 2025 21:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747689249; cv=none; b=I72Jt6Mx5FMMdWC0XBAEnE/4dBJLybH86b+l296U1J8bFhRS8WHx4ssLuxQaWNcSVKpNV7vYMoQXyfE/bqtTr27hsJnPN9ycMDrG3ccJgiBqE/3ZS9weqmvT+xI3ZRVqr0Ebbrb0d9MG5zb7mqtnHXndlpiZJe2na7O2IfLt064=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747689249; c=relaxed/simple;
	bh=OU+Jakld/TMTxxVKfdhF3ggOCo2ZBgkGEtx8OrbGD7w=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=BUnPMjPV/HCWaSB6SJ6aOxqtSUiaHlq1/nRuhtqfe7/kwoVvqSe7TREAr9wx4k2whOYSJ/Vp0vjLZElGxQdAiGiQyZMewHuQtoW3+IJEXOmW9HHiyFwpXtKeOAqBvIwmJTSbhqgbte5eZFnqjteShpU4ZbV8yWwm3FIdB2GYXAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R75yD/ph; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ace333d5f7bso794874366b.3;
        Mon, 19 May 2025 14:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747689246; x=1748294046; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=INlfNClito0M/A1g5VdM/y65CyhnXKxSbDbKHIJcYNY=;
        b=R75yD/phve7idB4z+uKmjLGHgUSwGhnZMv7aNJuY5x2moYO+xQ5NnSOKcPxc8V+rgT
         YJBeO18tn5ZT+bfG2UavcXe96QjpI1wFi/YMWbkajyneUBHPCgCiKSg4zhT12jUegRZn
         m/n0HZgqW+JkElnqvmlgjTRTZWOtXoJ0w+3dutvC17DLpnmZlsRBU7pF2IyJnGN+e0c7
         KVY4cmNQY6lYb4ixC/lran4c6zuw5yQHVkv3oOGZjeDK2A9YRQlZKczovb1dJTu94Gge
         Vfz8Xa8esw0wG2urR/sJ/1nC1iJMhckcGRRXVKzoMRl5Mf0plasctLchwR320Ax+EfnS
         B/yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747689246; x=1748294046;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=INlfNClito0M/A1g5VdM/y65CyhnXKxSbDbKHIJcYNY=;
        b=G0J/Sbrb+kFmLWU6yZ782D8jsV3TuFEXPG2Me4p9b/c5zDpnsS+3+y5fd+9bgjIG6T
         eCmz2S8Cw3ZLAzPZLaIvrxGWjfpvF/QCO96XJvxUKTqp6zpJFe+2rvm7lXOkIYAM4XFD
         CZVeVTuL5x7epbOLicu79AXBY5t93uJ96nWo6G1cALMHdIzi9YTlPVLUyxT9QbBfo1a2
         JF8I5RigvsBkOqlJbZDyrgzBl6QxmOF9f7dQf3oRsCrERZwCT+l2Pj8X3SvNAz7FmHuq
         wcThuU59caTUBkJ/kPPR3nzG2wHZUhFIhXuMvVBtfML5o+TzBnB0xsuHUXY1VYk5BGBg
         +hcA==
X-Forwarded-Encrypted: i=1; AJvYcCU7CqzXnwSOXchxCqy7dRqY34e/lts8KLOuCEX0IhnPgv8m1lT6oOQ/Oen4NdgSiJOoyJjCfTEmnHEh@vger.kernel.org, AJvYcCVB8hC0mixDV9+9Q+3hfKc2lyeRJjHnIOsfFiwts9DF+j9T6ifRjwkon6r+0HWWni3iNVjpAWoWe1PJFg==@vger.kernel.org, AJvYcCXE+8ksFh5ukU9yEv84z0KLGIzDOOWjiD1VgHgIpwyWQlpqI155W5zwknVKPNOEzbO70VetAl27nhjQOKC+a8Yuiwo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwB5SkM6m/wljpB5tuIxsE5w07Soln6o1GWJvyC7FI2mhk5DaPx
	wACCnvrYaqOD5zQwT2PGUZ5XFxuEi43aPJAHTFtEXLH+YQB+0QVTvRO42UzzMgLq
X-Gm-Gg: ASbGncufonQeXWOxWcyLmmW38XDa/XQlVmGxFseyxBwwhJMa+Z7g7i+ZThu9IySMqEC
	+hzdFTEQv83yYS4135Mpk0235gMaIGLHUV6TVInDuQ5Z5wPxF4P3V68AIBvJlj3x4wRRFCux6I9
	+PwfGDIrWq6J1ds2QYEhvdNlSf3oQj3JUilwCZQLLDNgtUJfe3sGiDLA+cR8O9YI2iXq5m3dshL
	S2xsO5kRIHy/fNb6uD228lWM8nsmgW62qZm4Puq3in5WJ+haRunAg5mXduJB8liJOXcGrBFvp5D
	tp/GoWFaI1ffWOhNnjqbaaRrlH/CzM4dC2weUOG7FxskHTE6iiVnFe9QNwy7oGJv
X-Google-Smtp-Source: AGHT+IG8bk+kyT5BXR3K5trGf85iSP8MErm8cm8b1N3d+t2LIPk1iILutdL42LORJGY9jBjPWswf/Q==
X-Received: by 2002:a17:907:9408:b0:ad5:27f5:7189 with SMTP id a640c23a62f3a-ad536bbf095mr1062199366b.13.1747689245753;
        Mon, 19 May 2025 14:14:05 -0700 (PDT)
Received: from [192.168.0.131] ([194.183.54.57])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d498d05sm646996166b.149.2025.05.19.14.14.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 14:14:05 -0700 (PDT)
Message-ID: <83d527cc-36ce-449c-9e7a-29c47cbc7822@gmail.com>
Date: Mon, 19 May 2025 23:14:03 +0200
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
 <18b78845-3f01-444d-835a-aa39f84a2689@gmail.com>
 <20250516-plating-early-c5f8017b7466@thorsis.com>
 <c9c6b734-30c4-467c-bd5b-b73784aa0f27@gmail.com>
 <20250519-crudeness-hatchery-3c9f02fc95ad@thorsis.com>
Content-Language: en-US
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
In-Reply-To: <20250519-crudeness-hatchery-3c9f02fc95ad@thorsis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/19/25 09:37, Alexander Dahl wrote:
> Hello Jacek,
> 
> Am Sun, May 18, 2025 at 04:36:52PM +0200 schrieb Jacek Anaszewski:
>> Hi Alexander,
>>
>> On 5/16/25 09:35, Alexander Dahl wrote:
>>> Hei hei,
>>>
>>> just wanted to create a new thread on a similar topic, but this is so
>>> close, just hooking in here …
>>>
>>> Am Sat, May 10, 2025 at 02:43:45PM +0200 schrieb Jacek Anaszewski:
>>>> Hi all,
> 
> […]
> 
>>>> The question is if the LED name from the schematics tells anything to
>>>> the user of the equipment?
>>>>
>>>> The idea behind LED naming is to facilitate matching the LED class
>>>> device name as reported by the system with the LED location on the
>>>> equipment.
>>>>
>>>> The LED naming standardization intended to enforce consistent
>>>> LED naming, and not allowing to add multiple interchangeable
>>>> names like wifi/wlan. It also helps to keep LED name sections order in
>>>> accordance with Linux documentation, which before had been often
>>>> abused by allowing to assign anything to the now deprecated 'label'
>>>> DT property.
>>>
>>> You see devicetree changes frequently which change the sysfs path of
>>> existing LEDs, last example I saw today:
>>>
>>> https://lore.kernel.org/linux-devicetree/20250513170056.96259-1-didi.debian@cknow.org/
>>>
>>> Consider this change:
>>>
>>>    		led-lan1 {
>>>    			color = <LED_COLOR_ID_GREEN>;
>>> +			default-state = "off";
>>>    			function = LED_FUNCTION_LAN;
>>>    			function-enumerator = <1>;
>>>    			gpios = <&gpio3 RK_PD6 GPIO_ACTIVE_HIGH>;
>>> +			label = "LAN-1";
>>
>> So this change was made without understanding how LED naming works,
>> and without reading LED common bindings [0], which clearly states
>> that 'label' property is deprecated. It makes no sense to add 'label'
>> when there are already 'function' and 'color' properties present.
>> Label takes precedence to keep backwards compatibility.
>>
>>> +			linux,default-trigger = "netdev";
>>>    		};
>>>
>>> Before the sysfs path probably was /sys/class/leds/green:lan-1 and
>>> with the addition of the label property now it's probably
>>> /sys/class/leds/LAN-1 … so it changed.  This might break userspace,
>>> which relies on certain sysfs paths, maybe.
>>>
>>> The main question is: Is that sysfs path considered to be a stable
>>> interface for accessing a particular LED or not?
>>
>> It should be stable, but since LED sysfs interface is influenced by
>> DT implementation, then the responsibility for keeping it stable is on
>> given dts file maintainer.
> 
> Okay thanks for clarification.
> 
> Follow-up question: should the linux-leds list be included in Cc if
> someone changes LED related DTS properties?  This is often not the
> case, like in the case quoted above.

It would for sure allow to limit improper application of
LED common bindings.

>>> I've seen this pattern also the other way round, were an old dts only
>>> has the node name determing the sysfs path, people change the node
>>> name or add color/function properties, gone is the supposedly stable
>>> path.
>>>
>>> New idea: what about making this somewhat more flexible and less
>>> suprising by _always_ creating the standardized sysfs entry based on
>>> color/function by default, and let label only create an additional
>>> symlink linking to that?
>>>
>>> So in the above example /sys/class/leds/green:lan-1 would be the
>>> canonical name/path of that LED, and /sys/class/leds/LAN-1 would only
>>> be a symlink on it?
>>
>> IMO it would be cheaper to keep DTS implementation stable.
>>
>> [0] Documentation/devicetree/bindings/leds/common.yaml
> 
> Ack.  Sounds for me like it would be okay to point users to those
> bindings and the deprecation notice, if one stumbles over such changes
> on the devicetree list?

LED common bindings should be always the main source of truth when
adding LED controller node to a dts file.

-- 
Best regards,
Jacek Anaszewski


