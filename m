Return-Path: <linux-renesas-soc+bounces-17180-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C4DAABB088
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 18 May 2025 16:37:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B82243B17DD
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 18 May 2025 14:36:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAA5B21C166;
	Sun, 18 May 2025 14:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S1LXyOa0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DDA935280;
	Sun, 18 May 2025 14:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747579019; cv=none; b=HHCi9/CfwfM9UtX9vlr1rMhqbBSith8UcJNxJWog8Wa3K/KTli70RvND9gH6mAFpEnZDidfEsXBSZcItg9GHCJO1gYFAUR3Piquo9zA0naoH4w1APsD9uwoL03JH6kZkmNHunV9rMK9Lk2hv9rtuFuXHLc08B6ZpKIY5Q4B+Yck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747579019; c=relaxed/simple;
	bh=JDYFQwNkUpRNz0Ot0nyyBFBzzKxQGlYrt9uVU74z2PI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=sa6MVrvu1moviG1qBZ+g1CuI3vrwHM66LeysmHPvX1X4p3rjmKZG/1NWDF3hbyMgyYqt5bq3Htmzkxnea8Vd+vvHHd2k/ixG7L+uaeDmzSXbH5fl4AIgj7nRbLtZPR2eZ50N1P9JcNz1Eh7abgmcwUSOL/7JcQbNChqZ6UPfBdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S1LXyOa0; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ad1b94382b8so650876566b.0;
        Sun, 18 May 2025 07:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747579016; x=1748183816; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JnV/s93dzvcaoekSUAB82qNiIRGdZbYoiZP16FpDPb8=;
        b=S1LXyOa0kEaordOWu09PlZlq1rnXyL4F6B263e+Bw6eZI3ASy/leU5aNtHgCiPZSi3
         /Em5NdcZGY+zUpa0Uy3bsB05Vy92UoOIOQJru6Yvx9GBPczuUy5chmwANzFV4Hp91RFM
         P7ZCt6zvmjZhnRZEcGYSfOTPvlVzNdwNljwnv7trSnSzPo6KcbR/+KyhnzYRUsaNtBqE
         10bwjTHZZqq72e7rYu9YxCEZPLkcS9ad3+PL67EV/B2ft6+EKZ34vbccJ81JjQpVJ0aU
         E8xnrCKJbf9+J2PVmdtA05JdWJtzDqFDEkxh9g/iSMBisMDTUvMdL/ZjCGXxcGwUjN4X
         OVgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747579016; x=1748183816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JnV/s93dzvcaoekSUAB82qNiIRGdZbYoiZP16FpDPb8=;
        b=eY05l1ehUkzTmWBSzXXETqtEi8hLpCa/aiZoUp7KKsEo6ViPat+2IfTi3FCNx08MbO
         6w2tEbayev5WSXTTe+/6/qShO25gnPUuo1wuHANSJZGOPozkokeM9fl59oJdWC7aS8WV
         K2jaWnukkvbYIEj1lJtdhS05QHxjxv4jBg/czRZr1Q6kkNX4mjJR1xMjzxQ0or+8YM8v
         KzJq2/p8wPCIFofO+H2SDP0Ih0GjRb3wXwnd/iMOVeXtt8JkjR3n7eNw/lPEBcgPZCOn
         PsLB6YnzQrTpuVyly0Xe9D2i2m/mQTEO76195KEGT+WgMkMPBj+cR5EWPy5jQd4s0BKE
         836w==
X-Forwarded-Encrypted: i=1; AJvYcCUtRTEQl9etLxy1zZTPIsATrNId9uXuLkjfNtjoJU9qp3wv1EzsIZn4MOoOariaUUm4m4cxmsi186fKhw==@vger.kernel.org, AJvYcCV85ibJ/AwdydgKVvWLNdjTw8E57HU4JHfJ8JZR2RMWxrIrDsAnMD+nhOOtoxA42/y8P3v1BTUnEsY2@vger.kernel.org, AJvYcCVF/hqdgFcYqWOZlwfIfb65tvwMz7ZMy6MMB/8E0eWg7CFgBkWWYGmc2HchNHBtdYCc47hbMR+3tZ/KX4Lz9FxJ/nw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyep5ifstz5J17lPtUzfzBSTPSkiwGIbxOHofb3PwFpsF4RRNP8
	fq/r+5JU9rfm9WRFj6GOpl/uEECG8rgNFAz3sTlnxwOTogF3UOZptWlV
X-Gm-Gg: ASbGncvzW+YKiA53jaDipBBzZzxNS+k/y3DShlLzjtCwdJ/mVtZZzYXONxl8fFzHZV9
	SgvmRNAqKX9fkhrxoUQbYplFGe9DCLAkP1pI3KaRFhP4wdWkAecLbdktR/rDk2rZBdelMb7TD3R
	9Il69t47mQmY9a/Ike/H2iGC/DLR3TUy7kVq6WXSwnqQdgWiBHiE0SfxO0vBz0BTWsM/zekggiV
	UU/pegEoVd2yLG5JP4djEkbO3kZ+SRVzNPjVn+weAEms7aqFdeMnAwLmPpJmR7PE9Fcu/jG/VFk
	OkaNsgRLOku6YXMVj8YWnLxGokMR3luZwy7jgek63pngbdlzTI7S8od+BGxB7DVKbCtlYcTJkJ8
	=
X-Google-Smtp-Source: AGHT+IHItumTh5zPaNlVOYO5ClBNo1LutZ7e9IQ89Qek7/GMPvUbMoeftaS67SfMtiVf06UbUJy+1g==
X-Received: by 2002:a17:907:3d0c:b0:ad2:378f:99ef with SMTP id a640c23a62f3a-ad52d45ad86mr900868766b.8.1747579015435;
        Sun, 18 May 2025 07:36:55 -0700 (PDT)
Received: from [192.168.0.131] ([194.183.54.57])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d438384sm459523366b.106.2025.05.18.07.36.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 May 2025 07:36:54 -0700 (PDT)
Message-ID: <c9c6b734-30c4-467c-bd5b-b73784aa0f27@gmail.com>
Date: Sun, 18 May 2025 16:36:52 +0200
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
Content-Language: en-US
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
In-Reply-To: <20250516-plating-early-c5f8017b7466@thorsis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Alexander,

On 5/16/25 09:35, Alexander Dahl wrote:
> Hei hei,
> 
> just wanted to create a new thread on a similar topic, but this is so
> close, just hooking in here …
> 
> Am Sat, May 10, 2025 at 02:43:45PM +0200 schrieb Jacek Anaszewski:
>> Hi all,
>>
>> On 5/8/25 15:49, Lee Jones wrote:
>>> On Thu, 08 May 2025, Wolfram Sang wrote:
>>>
>>>> On Thu, Apr 17, 2025 at 01:39:14PM +0200, Geert Uytterhoeven wrote:
>>>>> Hi Wolfram,
>>>>>
>>>>> CC leds
>>>>>
>>>>> On Thu, 17 Apr 2025 at 11:33, Wolfram Sang
>>>>> <wsa+renesas@sang-engineering.com> wrote:
>>>>>> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>>>>>> ---
>>>>>>
>>>>>> Changes since v2:
>>>>>> * using function, color, function-enumerator properties now
>>>>>>
>>>>>> Honestly, this is better than using node names? With V2, the LEDs were
>>>>>> named as in the schematics, now they are called:
>>>>>>
>>>>>> lrwxrwxrwx    1 root     root             0 May 12 12:10 green:programming-0 -> ../../devices/platform/leds/leds/green:programming-0
>>>>>> lrwxrwxrwx    1 root     root             0 May 12 12:10 green:programming-1 -> ../../devices/platform/leds/leds/green:programming-1
>>>>>> lrwxrwxrwx    1 root     root             0 May 12 12:10 green:programming-2 -> ../../devices/platform/leds/leds/green:programming-2
>>>>>> ...
>>>>>>
>>>>>> Which gets even more confusing if we might later add LEDs not on this
>>>>>> board, but on the expansion board. 'green:programming-8' sits where?
>>>>>>
>>>>>> I really wonder, but if this is the official way now...
>>>>>
>>>>> Good point!  So I'm inclined to take v2...
>>>>>
>>>>> Let's raise this with the LED people. I don't want to fight Pavel when
>>>>> v2 hits the CiP tree ;-)
>>>>
>>>> So, if there is no other opinion here, can we remove function, color,
>>>> function-enumerator and just use the node names which match the
>>>> schematics? Basically apply V2?
>>>
>>> I didn't author the semantics nor the rules surrounding them, but I am
>>> obliged to enforce them.  Therefore "LED people" say, please stick to
>>> convention as stated in the present documentation:
>>>
>>> https://docs.kernel.org/leds/leds-class.html#led-device-naming
>>>
>>> Please note that a "debug" (LED_FUNCTION_DEBUG) option already exists if
>>> that is more appropriate to your use-case.
>>>
>>> Let's also bring Jacek into the conversion, since I know that he did a
>>> bunch of work around this topic.
>>
>> The question is if the LED name from the schematics tells anything to
>> the user of the equipment?
>>
>> The idea behind LED naming is to facilitate matching the LED class
>> device name as reported by the system with the LED location on the
>> equipment.
>>
>> The LED naming standardization intended to enforce consistent
>> LED naming, and not allowing to add multiple interchangeable
>> names like wifi/wlan. It also helps to keep LED name sections order in
>> accordance with Linux documentation, which before had been often
>> abused by allowing to assign anything to the now deprecated 'label'
>> DT property.
> 
> You see devicetree changes frequently which change the sysfs path of
> existing LEDs, last example I saw today:
> 
> https://lore.kernel.org/linux-devicetree/20250513170056.96259-1-didi.debian@cknow.org/
> 
> Consider this change:
> 
>   		led-lan1 {
>   			color = <LED_COLOR_ID_GREEN>;
> +			default-state = "off";
>   			function = LED_FUNCTION_LAN;
>   			function-enumerator = <1>;
>   			gpios = <&gpio3 RK_PD6 GPIO_ACTIVE_HIGH>;
> +			label = "LAN-1";

So this change was made without understanding how LED naming works,
and without reading LED common bindings [0], which clearly states
that 'label' property is deprecated. It makes no sense to add 'label'
when there are already 'function' and 'color' properties present.
Label takes precedence to keep backwards compatibility.

> +			linux,default-trigger = "netdev";
>   		};
> 
> Before the sysfs path probably was /sys/class/leds/green:lan-1 and
> with the addition of the label property now it's probably
> /sys/class/leds/LAN-1 … so it changed.  This might break userspace,
> which relies on certain sysfs paths, maybe.
> 
> The main question is: Is that sysfs path considered to be a stable
> interface for accessing a particular LED or not?

It should be stable, but since LED sysfs interface is influenced by
DT implementation, then the responsibility for keeping it stable is on
given dts file maintainer.

> I've seen this pattern also the other way round, were an old dts only
> has the node name determing the sysfs path, people change the node
> name or add color/function properties, gone is the supposedly stable
> path.
> 
> New idea: what about making this somewhat more flexible and less
> suprising by _always_ creating the standardized sysfs entry based on
> color/function by default, and let label only create an additional
> symlink linking to that?
> 
> So in the above example /sys/class/leds/green:lan-1 would be the
> canonical name/path of that LED, and /sys/class/leds/LAN-1 would only
> be a symlink on it?

IMO it would be cheaper to keep DTS implementation stable.

[0] Documentation/devicetree/bindings/leds/common.yaml

-- 
Best regards,
Jacek Anaszewski


