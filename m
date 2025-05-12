Return-Path: <linux-renesas-soc+bounces-16989-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A61E0AB40A2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 May 2025 19:56:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D12093A8875
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 May 2025 17:54:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D8DD25742B;
	Mon, 12 May 2025 17:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L18I7cpD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4812550D0;
	Mon, 12 May 2025 17:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747072495; cv=none; b=BA1psxcu9BwHDDhyaLup/bMgNBBvlZTpCRrSBsLg0W7LKYxkSdMzCETjSnd51i280eutIixdrvmoVfbo4Meg8GKsxM1w0QbJ6gEtHaQNYwcHOJqsoT7EZBhweuPSXMnAdje2SlKQwasYI8Mwk0p/T8xIln/LEuf9GrGkM2tbGgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747072495; c=relaxed/simple;
	bh=W+cYK9ITPo664dkM5LrWET5c4Pp0BmrymUTIQeGymT8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PqZura04xjYSuqpw9NXj7jlJ6Sgw6G44USJ1WmIqaW/9Aoonj9mZuWEx191xhlUrd+KEpRgqZxFOloIFzhH+CsnyhTFj4nmsoIkYERDyHQhZ1ZafunoZYxJ7jAb29rbEK0NNZn4d3v4UFI6ZwgdKBlxEPmP+9LjG5dl5ic95Twg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L18I7cpD; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-acb5ec407b1so827321366b.1;
        Mon, 12 May 2025 10:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747072491; x=1747677291; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JgvoCOwXjWIE8mFgjOg/q+OJocGn0SRHVfdafB1Adu0=;
        b=L18I7cpDaS/Yj0CwhkeQIon8dr18PGkJHMlVWrjyGnB1AQoUTdU1eSoPDXWYma6zl9
         S0gjZYGEt0EsmTjtQe0ZAfHco8k1WHnPsGVx63+icZ7K4I+O/3J0UV7QkjvW+7k+VAdN
         OX5HQ2OoamTlXEHvmIqeOULC43bowngybNaXK9KT/S3O/ekwsZaBTSTdD1psvPFyaMQW
         znaFDZfo25JEwFANIF1yA1o6E4nmDoXgCMNhrtjYx5pfauYeYnKxnz2p6pU0nXC512hJ
         NdePc/2dxu01mFIv578tOWbkSPEJYZpxtckX/slvLu8qQ9MRR8b9kzNew0m248Xxpjs2
         wYAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747072491; x=1747677291;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JgvoCOwXjWIE8mFgjOg/q+OJocGn0SRHVfdafB1Adu0=;
        b=gWZJU1EmrOQOvyAzIqSkuX8Aeyh8FELZtmglvO1j9Rf1rUhrDHS9jgzV4AuNaD0yS9
         1ikkzs/QYubrEcueHiQPhPRV/8PnRUWvPhyVKBeqgvWDXK+pR5jBW15TVut4JrDyb3Sy
         JDn2iGbYDaU6wkStUaaryPv6wyTQ51hJCkLBsha2UOj/sKp0qAKSdmXKCNDhtoMi+tCc
         3+TG1ApXvRj5fyq/B9CHMNiDq2Qnli1eBdz5fm60de3SkQjO3rJBWCRSZYlyfhYaeLC5
         MI5Pl9HJrCrQqsHpLkEhXQknPUQZp9crssdyLl0Q7fvMIN2MwGfrXZ7JAWSDIbzrCQaS
         gk5g==
X-Forwarded-Encrypted: i=1; AJvYcCUqsCeUpfgJNZfJJdKWyNEcR0MXt8/qeZcoP2H21CKqzj7m01X38C6TtaYOzzmBYx6lFsuUSTW8L0mR0iWwZTxqRlw=@vger.kernel.org, AJvYcCWe/BzpX2+6VIDqRRyPNXyAUtvS2xOkJ9ZsVO+xPpT4kL2cEic1Igo6jr5m9gm/ab1gCMVAm/y0V/4eSg==@vger.kernel.org, AJvYcCWojndDjOrdTgpHEAR1SB1lV6YnZFW8PUk9EcUfdZ1kIWtoubWSbQQg/MMPUpUvU1Uto16MjdkiaLgC@vger.kernel.org
X-Gm-Message-State: AOJu0YyqeV1yhYPgO7B9FPShfEn63c1tr7ihh0E2/q40csF3x5RrlcBQ
	sPGLX0Dbc4wDDgTK2u8eO8eqLMTcNhq0Mwdxp6f/rY6LqMv//CRT
X-Gm-Gg: ASbGnctVgYgTgt1lrwAh134NayqxAwlIrmyZUAAL/xP3WSLFX/TrdHcSviazDWkxhJT
	xeloiFuPbA/sRhqNqrP1KnJXMhl54JWVSsRNLmzWlMfqEEyRzsbl86WW8Sv73oBnY/7pKobDrRJ
	xH3usCAS37OVRgwKShJXkE2EVtuVVZ2wF0R9kaNGK+zPH1+PH780I6CcMEYDOLJsPxE5hVLE1il
	7rcvpUazf+N2V48Of5hc10pFC7c9oMrNj/h8An/toPiNtuUce6KLwlHhMH2+fTS9cAOO7WPux3K
	XNvbI+sJ2DypPTa0C1JOcm3KhEjWiQL1BOEg15ouDUbZWEwWStwv6vqwBCBp4+MINKo4ehWb1mU
	=
X-Google-Smtp-Source: AGHT+IE5XLkS6iNiZBAhCKnwDI5UrEGId9RLGaIEQw8M6sC/PYnL+4gjrD34QfwVKGjX0jJf7gWvMg==
X-Received: by 2002:a17:906:4796:b0:ac6:fc40:c996 with SMTP id a640c23a62f3a-ad218f22586mr1373648166b.23.1747072491143;
        Mon, 12 May 2025 10:54:51 -0700 (PDT)
Received: from [192.168.0.131] ([194.183.54.57])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad21974701dsm642160066b.116.2025.05.12.10.54.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 10:54:50 -0700 (PDT)
Message-ID: <ebb257c6-33f9-4841-b9af-c2744b59e513@gmail.com>
Date: Mon, 12 May 2025 19:54:49 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] ARM: dts: renesas: r9a06g032-rzn1d400-db: describe
 Debug LEDs
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Lee Jones <lee@kernel.org>,
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
Content-Language: en-US
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
In-Reply-To: <CAMuHMdW1Hn51R-6MstS1Ojuu-CR0eNs504YEruPbe2L-H_zBHA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Geert,

On 5/12/25 09:13, Geert Uytterhoeven wrote:
> Hi Jacek,
> 
> Thanks for your answer!

You're welcome.

> On Sat, 10 May 2025 at 14:43, Jacek Anaszewski
> <jacek.anaszewski@gmail.com> wrote:
>> On 5/8/25 15:49, Lee Jones wrote:
>>> On Thu, 08 May 2025, Wolfram Sang wrote:
>>>> On Thu, Apr 17, 2025 at 01:39:14PM +0200, Geert Uytterhoeven wrote:
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
> 
> As this is a development board and not a finished product, I would
> answer yes.

OK.

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
> I agree this all makes perfect sense for a final product, where the
> purpose of each LED is clear, and sometimes indicated by an icon
> on the case.
> For a development board, some LEDs may have a fixed purpose.
> But typically there is also a collection of generic user LEDs, which
> do not have a fixed purpose, and are identified by a label on the
> schematics.  Imposing an arbitrary numbering scheme on the latter is
> confusing for the user (developer).

Using DT child node name for LED class device name is only
a last resort fallback. However if it is devboard and we want to have
a reference to the schematics then I'd say it makes sense to take
LED names from DT nodes. What about the colors? Are the LEDs replaceable
or soldered?

>> Regarding expansion boards - we never have control over what
>> LED names DT overlays will define, thus LED core adds numeric suffix to
>> the LED class device name in case of the name clash.
> 
> FTR, the RZN1D400 Expansion Board does not use a DT overlay.
> Linux carries a DTS for it, which just includes the base board .dts,
> and treats it as a single system.

Ack.

-- 
Best regards,
Jacek Anaszewski


