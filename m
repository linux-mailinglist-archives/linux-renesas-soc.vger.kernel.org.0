Return-Path: <linux-renesas-soc+bounces-17115-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D146AB74DD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 May 2025 20:57:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 68ED68C3D07
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 May 2025 18:56:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 677D528981D;
	Wed, 14 May 2025 18:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bh/97uOa"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 538E91DE4C5;
	Wed, 14 May 2025 18:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747249029; cv=none; b=BYVKDJmNJGZ/Kz7EsbC3O2JUcTZifcuHPmwKthzEHooGHqZjUxM7Zizfe2NZZRMOMbH4WUlzwjNcftOOby2pBRvO69iIrzVy9sWk4+m3awtyLGzW2BX09QG68qnStivZyWRGhtzH/m1lfmXmXmnSf0wSchBEyq1X000LQkDJyVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747249029; c=relaxed/simple;
	bh=2yDlDsuPnZgCeJCUIv0EgLRBGpl4yleEhb4ZuUNB5eE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j4MxHiTKRTNFCuO03TeSM0yOQGskHZIEhleer0J0PzOPkVVhGaBoMapQUFA/EtuiikHYniS+5KsnuGSip3R1EpF8+aHIIdUZM2lhWVltwxe1//nGB2Y28bfh6kYCOxnwYKwWzYaRCVBkgmSgYB94U4Qjqe4WP2qcOFuvwQWCyfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bh/97uOa; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ad1a87d93f7so25468066b.0;
        Wed, 14 May 2025 11:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747249025; x=1747853825; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1LH24cLf45WsutS7BVVf9uY22x5+Bvy63C/JPI9H2xY=;
        b=Bh/97uOaJ0q6up94RJFK7SGV3XpactFK38fbZwdg1xiFgsM2ibK/Qb6yAUYooEJVE2
         rbmWX+lTOgPanlZ7iyia00IypY95ZBZF4f4uNu/fHHRiu4anq05g5CKVoT9B5cXLu73H
         GUY4JLRrE8yHJnAXvbufg/LzmkPX6IB2gK12O/xOSjtUz+uGUA9TVecoHsLtEJKU7dRG
         ts8HmzLAe0hADqit7zbyx82+3hrosNQxhm2ZYyfijFno3uF0e7UlS3XgyUqPdhgPqwDi
         jYd1aCif42eLuxsipjWQNN9qr4WCrSw5b5RyXeV/uG3gBz0TehQ8TlIayskh9FjfbhFd
         PoDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747249025; x=1747853825;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1LH24cLf45WsutS7BVVf9uY22x5+Bvy63C/JPI9H2xY=;
        b=UNcnrDR1NMphzSgIVq/pQjp4dL5x840Ippl7qCV5AB0Ms7RML6kTBsrKKAtGHnFMp9
         kN9pRLsk3ONj9ngNz9sBhkicF/zF0QDgX6a0lM9u7iaIkkDPAgAJnaTsSiSrqbx1e+sr
         ihoZ/hqt8QgQF1NlWSUE0llqm0gwo6d6PK8JanNoxieWwWto79owZbfymTCDJ1y2Ts3T
         sOzlVXNCJ2OCBGerHA6KAimxsvUXln3V1u60/ztrawkCneQLbZ39X3PPbyo1vT9JJo6L
         uTZyvEavwrdPgbuNsVE7f3mWP8siN4g7/ViQ1OtUOOKdD4X5+ub3gGoDmTlzypsExjwT
         Bn0g==
X-Forwarded-Encrypted: i=1; AJvYcCV/hvD4Gf2MazIkypWZl3xlwwuc42HwVH2mgoEJeZ2ccrHEnPFO0RmeHXPJebyuU2gagUZUJDJhksa4bb5gxpln4N8=@vger.kernel.org, AJvYcCX+ig2oKnzeJl9aYBS4GoNiH/mfXhvWWVpq11hjkOjFoZH1oaTE6jLltwN8RzkWW2ZRQS27HRU/gm/rYw==@vger.kernel.org, AJvYcCXvBe876PS3oSDDJiUr7GlczDqA7xTrE5u86ADyTF9KByyI8mEIVTXo4Z41VNjE70Boc8PiIwW7yNBa@vger.kernel.org
X-Gm-Message-State: AOJu0YwIMyT/d7uMEyvWDrIVvfzNUdv5u3r3VoW6z6OI3rC1eWJTl8wu
	yKOvNYivFN8eE/lPWbXpQrjL4HjTg4Of+s8AWTloc4nKE+xpMEPg6Vj1Ky/p
X-Gm-Gg: ASbGncvwPui4+RPmsy6Y8Uox9R/7P9K1OJrR3edcY5d3KUy0A+BoHhrPVyFC41Fl2Ma
	Ie7CGsA8uwvFkPinndiTPWTKyqGAfHmzXw4Jn3ct4nJsdUOdQjrE2xewPFJbnGn+FT5GJGM3o5Y
	+XG5BL2IZeAb/+R3sitLuQBMcMQLC5EDANkc2cwYXBrjldAfr/fJC1FNBLnrAROT1FvGw3uhzdS
	hDaQp1J3T0Q5wY54p7s5G50HgWMKOWRgJkG1G5kEogNo4AVnqRLc+q4gODFvS9IL8K2TsEY5wtC
	ZUpmyHHXQrSYH1Rwe7NSVIIwet54CxSrQz59k53A+EERXsIYSyUAOLqlWQIiF2v3
X-Google-Smtp-Source: AGHT+IGMn3hTiNb3Ab38HQ6Dx7X/wwKJLgWucnu/9EnuGl6naF/biuFPZrPQepO+dtQv2mfZz8rXOQ==
X-Received: by 2002:a17:907:60c9:b0:ad2:46b2:78ad with SMTP id a640c23a62f3a-ad4f7153c1cmr483374266b.24.1747249025242;
        Wed, 14 May 2025 11:57:05 -0700 (PDT)
Received: from [192.168.0.131] ([194.183.54.57])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad2197463edsm988741066b.105.2025.05.14.11.57.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 May 2025 11:57:04 -0700 (PDT)
Message-ID: <a26c7cce-df72-47a7-b501-1b66faa3e38f@gmail.com>
Date: Wed, 14 May 2025 20:57:03 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] ARM: dts: renesas: r9a06g032-rzn1d400-db: describe
 Debug LEDs
To: Lee Jones <lee@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 Pavel Machek <pavel@kernel.org>, linux-leds <linux-leds@vger.kernel.org>
References: <20250417093256.40390-2-wsa+renesas@sang-engineering.com>
 <CAMuHMdWN-QDrmogJ+7x8sdc6UmDAoF+0z0hZ3SQ7ajN2V2+mSw@mail.gmail.com>
 <aBxjvofZCEi_1Fna@shikoro> <20250508134930.GM3865826@google.com>
 <18b78845-3f01-444d-835a-aa39f84a2689@gmail.com>
 <CAMuHMdW1Hn51R-6MstS1Ojuu-CR0eNs504YEruPbe2L-H_zBHA@mail.gmail.com>
 <ebb257c6-33f9-4841-b9af-c2744b59e513@gmail.com>
 <20250514152852.GA2936510@google.com>
Content-Language: en-US
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
In-Reply-To: <20250514152852.GA2936510@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/14/25 17:28, Lee Jones wrote:
> On Mon, 12 May 2025, Jacek Anaszewski wrote:
> 
>> Hi Geert,
>>
>> On 5/12/25 09:13, Geert Uytterhoeven wrote:
>>> Hi Jacek,
>>>
>>> Thanks for your answer!
>>
>> You're welcome.
>>
>>> On Sat, 10 May 2025 at 14:43, Jacek Anaszewski
>>> <jacek.anaszewski@gmail.com> wrote:
>>>> On 5/8/25 15:49, Lee Jones wrote:
>>>>> On Thu, 08 May 2025, Wolfram Sang wrote:
>>>>>> On Thu, Apr 17, 2025 at 01:39:14PM +0200, Geert Uytterhoeven wrote:
>>>>>>> On Thu, 17 Apr 2025 at 11:33, Wolfram Sang
>>>>>>> <wsa+renesas@sang-engineering.com> wrote:
>>>>>>>> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>>>>>>>> ---
>>>>>>>>
>>>>>>>> Changes since v2:
>>>>>>>> * using function, color, function-enumerator properties now
>>>>>>>>
>>>>>>>> Honestly, this is better than using node names? With V2, the LEDs were
>>>>>>>> named as in the schematics, now they are called:
>>>>>>>>
>>>>>>>> lrwxrwxrwx    1 root     root             0 May 12 12:10 green:programming-0 -> ../../devices/platform/leds/leds/green:programming-0
>>>>>>>> lrwxrwxrwx    1 root     root             0 May 12 12:10 green:programming-1 -> ../../devices/platform/leds/leds/green:programming-1
>>>>>>>> lrwxrwxrwx    1 root     root             0 May 12 12:10 green:programming-2 -> ../../devices/platform/leds/leds/green:programming-2
>>>>>>>> ...
>>>>>>>>
>>>>>>>> Which gets even more confusing if we might later add LEDs not on this
>>>>>>>> board, but on the expansion board. 'green:programming-8' sits where?
>>>>>>>>
>>>>>>>> I really wonder, but if this is the official way now...
>>>>>>>
>>>>>>> Good point!  So I'm inclined to take v2...
>>>>>>>
>>>>>>> Let's raise this with the LED people. I don't want to fight Pavel when
>>>>>>> v2 hits the CiP tree ;-)
>>>>>>
>>>>>> So, if there is no other opinion here, can we remove function, color,
>>>>>> function-enumerator and just use the node names which match the
>>>>>> schematics? Basically apply V2?
>>>>>
>>>>> I didn't author the semantics nor the rules surrounding them, but I am
>>>>> obliged to enforce them.  Therefore "LED people" say, please stick to
>>>>> convention as stated in the present documentation:
>>>>>
>>>>> https://docs.kernel.org/leds/leds-class.html#led-device-naming
>>>>>
>>>>> Please note that a "debug" (LED_FUNCTION_DEBUG) option already exists if
>>>>> that is more appropriate to your use-case.
>>>>>
>>>>> Let's also bring Jacek into the conversion, since I know that he did a
>>>>> bunch of work around this topic.
>>>>
>>>> The question is if the LED name from the schematics tells anything to
>>>> the user of the equipment?
>>>
>>> As this is a development board and not a finished product, I would
>>> answer yes.
>>
>> OK.
>>
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
>>> I agree this all makes perfect sense for a final product, where the
>>> purpose of each LED is clear, and sometimes indicated by an icon
>>> on the case.
>>> For a development board, some LEDs may have a fixed purpose.
>>> But typically there is also a collection of generic user LEDs, which
>>> do not have a fixed purpose, and are identified by a label on the
>>> schematics.  Imposing an arbitrary numbering scheme on the latter is
>>> confusing for the user (developer).
>>
>> Using DT child node name for LED class device name is only
>> a last resort fallback. However if it is devboard and we want to have
>> a reference to the schematics then I'd say it makes sense to take
>> LED names from DT nodes. What about the colors? Are the LEDs replaceable
>> or soldered?
> 
> Looks like this option does what you want:
> 
> https://github.com/torvalds/linux/blob/master/drivers/leds/led-core.c#L578
> 
> For this to execute you need to provide init_data when calling
> *led_classdev_register*(), omit the; label, function, color_present DT
> properties and also init_data's default_label attribute.  At which point
> the DT node name should be taken as the LED class name.

Yep, I know how it works, I wrote that code after all.
Here, I wanted to clarify whether it wouldn't make sense to stick to
the approach with 'function' and 'color' properties if LEDs are fixed
on the board and the colors are known.

 From [0] I infer that LEDs are green, so we should use 'color' DT
property definitely. And as a 'function' we can assign plain text "pcaN"
if you feel it makes sense for that board.

This way you'll get LED name "pcaN:green", that will be according to the
naming standard.

So the node would look like this, for the pca1 LED:

led-1 {
	function = "pca1";
	color = <LED_COLOR_GREEN>;
	default-state = "keep";
};

[0] 
https://patchwork.kernel.org/project/linux-renesas-soc/patch/20250328153134.2881-11-wsa+renesas@sang-engineering.com/#26336000

-- 
Best regards,
Jacek Anaszewski


