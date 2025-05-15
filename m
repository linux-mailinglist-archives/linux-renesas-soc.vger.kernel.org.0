Return-Path: <linux-renesas-soc+bounces-17152-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2C5AB90A1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 May 2025 22:14:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ECF133A7319
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 May 2025 20:14:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2799028032E;
	Thu, 15 May 2025 20:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KFHoPreq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22DC2282F1;
	Thu, 15 May 2025 20:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747340066; cv=none; b=gDpPoqy6neGohbdPh7BtwcoSw8G9EdZdRJW6xAQ3+3vMwghBl/ldnaOI/uVKOwK2o3osWg6GQvKc8qD7W5L1D8DdarynAH8F4hw0yp1DWPEI8TY/YChsVIR7Ubf6f4y9Kw+4krbJkDOLEMlaSdxKUFOsBQGYwr1h3y4yeRDwXVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747340066; c=relaxed/simple;
	bh=kNEmHNLQ3pb97RXU8bfwihUYrQbUdrnOYTTJk/YIajI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LiOBLtaQpVuuVlqDtidl1dfR/aNvq+jGk9zrponXRYQ/pSGnVtsw4bH7Le8D1EKDG868oVHN94Vi22LDvqm8V7GcDYrJIESEVqn5RiWQYeiPV5YFzE4lEnoHf/RBVh1E9VCppAVy0+a8h6i0/M2LUa28ApyzT1T8uDZ/962Higk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KFHoPreq; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ad1a87d93f7so226492366b.0;
        Thu, 15 May 2025 13:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747340062; x=1747944862; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HEww0RLnuOf3O4aPcDL2ObdxTzi591/uGv+GIzeWBhY=;
        b=KFHoPreqqs6kjTxaLD09Ee1IBq4GqJNdtD8Zv80Nztat0ryAu8O87GMOQo8F4Xor8o
         /rZkNGAClSRciB+HWgQgfs/73kB/dEAMDWsTgGFZDNRPOpGvzkgmvkeRROg5O9d3c2wI
         MLQ5mNLLasoM3zC/6p+nlRYZG2QxF9JcxxkLoallweOaW+JhKmM5W+iBo8RRVoWET+Yz
         g4VRKJRC0kbq0+tpnj5mGKKfHUKm3JjDUtGnEytd1CYopkUF3X5xYxPdlMd8hTuMPm7u
         Mcy3DTkn6ziGOa90F8RN9TNX9og3wZvDgW03OZ0YcBtg3EfCm3t9TceRZfwnSysNVYXl
         Pc5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747340062; x=1747944862;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HEww0RLnuOf3O4aPcDL2ObdxTzi591/uGv+GIzeWBhY=;
        b=DVobfs47UP/nafY3ZAGjwi8AWb88GFJUdIQW0t+dGYiKPDX7hQbgrBfSh2lCsOuUDi
         hQieXJMkLBZ2X1vo5HUiCygWbfzBGufWqqtjzRY36JV4IkbI9nsLaqHatzA7RruJqSED
         jU5jxz2vEzk9xAGnvqrF89NVocM+R6Pb684yN/Pdll+GefdvYaL3Ie2cUi2ZMGCj+lHN
         PxcFc4kObOzwNrvhgzPeuB22XBfHeUSX1QROrVvsA8CI5cNf015G/3MN3gLdjb6CRLuD
         w/RBAFjHd5pbwvTIhh2bKUbBLZjruW+FO4lzF1e/BB4da9OmwPDwoC6vCWLCi1/GpWaa
         /k5w==
X-Forwarded-Encrypted: i=1; AJvYcCWHFFDj7exagbYoqWf43EA4KqCjO81GYgC4oTMYx0wf6uR+YA113WclRrCiSBz1+FxCMq6wInHK8ldGeQ==@vger.kernel.org, AJvYcCWJO4cWEGUjbb5CKiuFBgdWZqTPVAQslz9GMwcwrbpNRh+4VN1rUejGJhFe25jMdD23jq/YMhni2EjB5C0rxI6zKOM=@vger.kernel.org, AJvYcCWoK4OHbVLNzsRDN/j+5NDSxGmHy3r2ig5jSeSww5r5cgKh9iKATNE1sD5Xad8mVhcnIPPJkdKdUWlQ@vger.kernel.org
X-Gm-Message-State: AOJu0YyD6fHiPALQhSezvOy7B1eCVXXdl2ObFHezHHZsgK04RFd6iw+/
	748KrflckAOxknbbpN1HGavFtHKumTFDf/WX+Qs0NdUbcMLiZfRGHUU9
X-Gm-Gg: ASbGnctbhCrX1qq+3y5P1y2o4wZR7/9lcz39P8V6HjR+mXv+zVLhcKOwuiS7Iy1d9AN
	S1Gtp0b/vtutc6wtRsFhtdMLRhUb05Kdo9kF0yMzqayWYZ+Ki2NL34hJVQL3n19YeAIGePt4b2Y
	AfgwVHPNfOnC1RKvdg60sQVOEiUs9Y4kIIsQHYt6z8dNjKBVlLDuqolnkGx9rjhCy6wpYJQ0t0m
	2om3OSAT8DHxL0Xpu4EKDI38vEaRBglDSE28uq6OzThqjPsdcIice06DPOJj59v9Lj8B3jVmMDa
	DAfkmIMInt1Ea9iMHgJa6jdoxsr0oJXfzMONltASrFZmegx7VT/uUtDPeaevJd+n
X-Google-Smtp-Source: AGHT+IFa3/o2NA8eu95HEckP0lGgOHPO7zuNkNw67KWV9l5jTuB2tZed9TE/eLLmKVa1AeGImZTd4w==
X-Received: by 2002:a17:907:c04:b0:ad2:28be:9a0d with SMTP id a640c23a62f3a-ad52d5d628fmr95553466b.52.1747340061998;
        Thu, 15 May 2025 13:14:21 -0700 (PDT)
Received: from [192.168.0.131] ([194.183.54.57])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d06b497sm35469666b.42.2025.05.15.13.14.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 13:14:21 -0700 (PDT)
Message-ID: <77f6870b-55a3-4397-bc4a-77c335a8dc65@gmail.com>
Date: Thu, 15 May 2025 22:14:20 +0200
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
 <a26c7cce-df72-47a7-b501-1b66faa3e38f@gmail.com>
 <20250515065305.GB2936510@google.com>
Content-Language: en-US
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
In-Reply-To: <20250515065305.GB2936510@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/15/25 08:53, Lee Jones wrote:
> On Wed, 14 May 2025, Jacek Anaszewski wrote:
> 
>> On 5/14/25 17:28, Lee Jones wrote:
>>> On Mon, 12 May 2025, Jacek Anaszewski wrote:
>>>
>>>> Hi Geert,
>>>>
>>>> On 5/12/25 09:13, Geert Uytterhoeven wrote:
>>>>> Hi Jacek,
>>>>>
>>>>> Thanks for your answer!
>>>>
>>>> You're welcome.
>>>>
>>>>> On Sat, 10 May 2025 at 14:43, Jacek Anaszewski
>>>>> <jacek.anaszewski@gmail.com> wrote:
>>>>>> On 5/8/25 15:49, Lee Jones wrote:
>>>>>>> On Thu, 08 May 2025, Wolfram Sang wrote:
>>>>>>>> On Thu, Apr 17, 2025 at 01:39:14PM +0200, Geert Uytterhoeven wrote:
>>>>>>>>> On Thu, 17 Apr 2025 at 11:33, Wolfram Sang
>>>>>>>>> <wsa+renesas@sang-engineering.com> wrote:
>>>>>>>>>> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>>>>>>>>>> ---
>>>>>>>>>>
>>>>>>>>>> Changes since v2:
>>>>>>>>>> * using function, color, function-enumerator properties now
>>>>>>>>>>
>>>>>>>>>> Honestly, this is better than using node names? With V2, the LEDs were
>>>>>>>>>> named as in the schematics, now they are called:
>>>>>>>>>>
>>>>>>>>>> lrwxrwxrwx    1 root     root             0 May 12 12:10 green:programming-0 -> ../../devices/platform/leds/leds/green:programming-0
>>>>>>>>>> lrwxrwxrwx    1 root     root             0 May 12 12:10 green:programming-1 -> ../../devices/platform/leds/leds/green:programming-1
>>>>>>>>>> lrwxrwxrwx    1 root     root             0 May 12 12:10 green:programming-2 -> ../../devices/platform/leds/leds/green:programming-2
>>>>>>>>>> ...
>>>>>>>>>>
>>>>>>>>>> Which gets even more confusing if we might later add LEDs not on this
>>>>>>>>>> board, but on the expansion board. 'green:programming-8' sits where?
>>>>>>>>>>
>>>>>>>>>> I really wonder, but if this is the official way now...
>>>>>>>>>
>>>>>>>>> Good point!  So I'm inclined to take v2...
>>>>>>>>>
>>>>>>>>> Let's raise this with the LED people. I don't want to fight Pavel when
>>>>>>>>> v2 hits the CiP tree ;-)
>>>>>>>>
>>>>>>>> So, if there is no other opinion here, can we remove function, color,
>>>>>>>> function-enumerator and just use the node names which match the
>>>>>>>> schematics? Basically apply V2?
>>>>>>>
>>>>>>> I didn't author the semantics nor the rules surrounding them, but I am
>>>>>>> obliged to enforce them.  Therefore "LED people" say, please stick to
>>>>>>> convention as stated in the present documentation:
>>>>>>>
>>>>>>> https://docs.kernel.org/leds/leds-class.html#led-device-naming
>>>>>>>
>>>>>>> Please note that a "debug" (LED_FUNCTION_DEBUG) option already exists if
>>>>>>> that is more appropriate to your use-case.
>>>>>>>
>>>>>>> Let's also bring Jacek into the conversion, since I know that he did a
>>>>>>> bunch of work around this topic.
>>>>>>
>>>>>> The question is if the LED name from the schematics tells anything to
>>>>>> the user of the equipment?
>>>>>
>>>>> As this is a development board and not a finished product, I would
>>>>> answer yes.
>>>>
>>>> OK.
>>>>
>>>>>> The idea behind LED naming is to facilitate matching the LED class
>>>>>> device name as reported by the system with the LED location on the
>>>>>> equipment.
>>>>>>
>>>>>> The LED naming standardization intended to enforce consistent
>>>>>> LED naming, and not allowing to add multiple interchangeable
>>>>>> names like wifi/wlan. It also helps to keep LED name sections order in
>>>>>> accordance with Linux documentation, which before had been often
>>>>>> abused by allowing to assign anything to the now deprecated 'label'
>>>>>> DT property.
>>>>>
>>>>> I agree this all makes perfect sense for a final product, where the
>>>>> purpose of each LED is clear, and sometimes indicated by an icon
>>>>> on the case.
>>>>> For a development board, some LEDs may have a fixed purpose.
>>>>> But typically there is also a collection of generic user LEDs, which
>>>>> do not have a fixed purpose, and are identified by a label on the
>>>>> schematics.  Imposing an arbitrary numbering scheme on the latter is
>>>>> confusing for the user (developer).
>>>>
>>>> Using DT child node name for LED class device name is only
>>>> a last resort fallback. However if it is devboard and we want to have
>>>> a reference to the schematics then I'd say it makes sense to take
>>>> LED names from DT nodes. What about the colors? Are the LEDs replaceable
>>>> or soldered?
>>>
>>> Looks like this option does what you want:
>>>
>>> https://github.com/torvalds/linux/blob/master/drivers/leds/led-core.c#L578
>>>
>>> For this to execute you need to provide init_data when calling
>>> *led_classdev_register*(), omit the; label, function, color_present DT
>>> properties and also init_data's default_label attribute.  At which point
>>> the DT node name should be taken as the LED class name.
>>
>> Yep, I know how it works, I wrote that code after all.
> 
> Sorry for the ambiguity.  I was attempting to address Wolfram.

No problem.

>> Here, I wanted to clarify whether it wouldn't make sense to stick to
>> the approach with 'function' and 'color' properties if LEDs are fixed
>> on the board and the colors are known.
>>
>>  From [0] I infer that LEDs are green, so we should use 'color' DT
>> property definitely. And as a 'function' we can assign plain text "pcaN"
>> if you feel it makes sense for that board.
> 
> The 'function' documentation specifically says to use one of the
> predefined LED_FUNCTION_* entries.  If we are officially accepting
> caveats to that, we should probably update it.

We could add a note saying that if required function name is unlikely
to be reused in other devices, then it is acceptable to use custom
string.

-- 
Best regards,
Jacek Anaszewski


