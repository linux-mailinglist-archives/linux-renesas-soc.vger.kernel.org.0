Return-Path: <linux-renesas-soc+bounces-27973-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UKVSCGa7hWmOFgQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27973-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Feb 2026 10:59:02 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4469EFC572
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Feb 2026 10:59:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DB2A7300982A
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Feb 2026 09:58:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2643C363C53;
	Fri,  6 Feb 2026 09:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="ftapXC+n"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8737832F75F
	for <linux-renesas-soc@vger.kernel.org>; Fri,  6 Feb 2026 09:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770371937; cv=none; b=S1XG6oGXNY1Ve1aotdBbrG3mLJUuosEyE3ytCY8PWF2CLEhJvHuUFj4Pz9J2ojAd3Jz3/kJNZjF4D/ircBZC7E7Idji2DxVLjNThcxtJituKrbkuWo9eOUy950KF//ksKLSi4g5F8QdcEv9tVr48VmKYorqybaE7yqQMEoue7BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770371937; c=relaxed/simple;
	bh=jEHVM2uAFpnYm9PtPyvn7k9l3RglrtAY0EfiLY0es90=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pVMe3qWufPz9UlGg/0h/MagCGiATqAFPO2gO7+5wiivlv8UuIWjEC3F8etgulIwnAyY/Lb9XvVjoX8e1Lmy71ZZF8EXKvSBskiqx67AXq9Q1NjjSE9g/3KRJm4o967oUdlJJZbVvRok4AR0vdRKodT9mbaSsJ7LbCZmhg2q2J5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=ftapXC+n; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48327b8350dso1725525e9.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 06 Feb 2026 01:58:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1770371935; x=1770976735; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QFozp/2BFyrawQi8Bi3WGk4TGqqtNng52TReapzy6oA=;
        b=ftapXC+njD6iuyDVMsjMkryPKO2duqrT+B6YKm8HS8w99MlkEtN9NyOWxN+d+qRc7v
         wxNZ9xXOpsjCKQ4celJ85HAqf0FG2N3QyF74MMY+Oeu4/txiK4Uv+XgJ4bdNLdH8YAX2
         tVQYydeLypiNdS9TTVZ1x8lzZtxD14MIx6jWw+2d0pIWnAAktSrcauSvTeQnm5SXSZbO
         y1C7y0/68C1A+FjvzNwnsEKuiB5h+FRjNURq+CnCW7xEhEQVvayHjHiPW1AO38V/oKqp
         ArkzJENwcveQIx4hJYGtBcSpgQWMO0xQgul6o8aknfs2rWwPECaEv7izA/pjSW4qq24P
         MPNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770371935; x=1770976735;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QFozp/2BFyrawQi8Bi3WGk4TGqqtNng52TReapzy6oA=;
        b=vXFD/iPMBLhzNOQz142z0rNaJ1nQMVpqX/LnIzJkHZN2JV0z6W/HFzI/VLIk5/dZJn
         7lL+Hpzukxbve9k7qiTGmVH1RCR6nG8rEr9ffNJ4Eb17RKW+RTAIHeYuzKRZ1UNLOazW
         k4WDwvXKStBKtREWkOjA0fkwScdXtdjJHpKAD2E9orMjc7batw4YBQmadwmg1iFqOqGX
         prdxndngA5P6SaHHFkSmVQEOFYzGnisZTJOTd0NhIbh/NjJ8SL5UrxwXXUCCq8EYpHwv
         PKdvJ1ClOjEeuNIh/hv/aZJpgXTd+pBuwv/V/Ky/j0o6hFM/+ugCItSPy/toXkeRmgno
         Qyyw==
X-Forwarded-Encrypted: i=1; AJvYcCVDhP9Yv4b/KhPXbGea+w99HWQATEp/FDPYRfry5Rihuyc/imUJkymMqyG7dQdfBkLN4Hym4Xy7PrAL5WsQD3M4/g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzqGnPdhC3NlOkPptDd1G6z5EKsExEyBGDGCfSFXBBpjopBFTne
	7o/XlCra8bbicWT5pQKEOIpuoGGdGs4m5cJVJRGG5COwG62oyy62FjEJZEtIoDXHDuE=
X-Gm-Gg: AZuq6aKe2klhsskHbU1Hvk6KSL4vLVClEU/xMGpQiC00kOZmHaJDJJsZ0ztviL3vc0J
	6R7BnP4BESymyNHtfP34A9HAgWj/uKTOOMpknIJnH/w8srtTJ7h11TKGrkrJRmPNkbHhQ+/IPgs
	Ozyld25NpTfWSUWdKLe9hUaU9f04AhCpmZ+JGCOuF+4ky7immK9i+bMs8d6F2QXfSmUwMR6ihzl
	Osy2QfuHPXPh1AauA14k7G6TFo2juB/37uK6DAAH2ppxwn7xD5fcRnn2wpKvroJfYpOBhHgfzXE
	Lgje4GEJRqUFO1nbniMAJSiK5q7mNbnjCDnFNuk/jxBD4wJtl6QfMqAQfI5OpKzg0hLaMmJMTWT
	tfcSDbuaEUeKTvmizWjI/D2zaLKGLPiNEtC7NyOUJiV1JH7BjgNd1UWYIQfDR4a+Ypx/8WID490
	3WG55si7cY5NW1hmBFiGY=
X-Received: by 2002:a05:600c:470c:b0:477:7ae0:cd6e with SMTP id 5b1f17b1804b1-483201daa3amr29029995e9.5.1770371934663;
        Fri, 06 Feb 2026 01:58:54 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.215])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-436296c0f2esm4622854f8f.19.2026.02.06.01.58.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Feb 2026 01:58:54 -0800 (PST)
Message-ID: <4dd522fe-8143-4423-b428-2774a185ad73@tuxon.dev>
Date: Fri, 6 Feb 2026 11:58:52 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] dmaengine: sh: rz-dmac: Add suspend to RAM support
To: Biju Das <biju.das.jz@bp.renesas.com>, geert <geert@linux-m68k.org>
Cc: "vkoul@kernel.org" <vkoul@kernel.org>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "broonie@kernel.org" <broonie@kernel.org>, "perex@perex.cz"
 <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20260126103155.2644586-1-claudiu.beznea.uj@bp.renesas.com>
 <16a6f14a-93e6-472c-8718-d46972f0ac5e@tuxon.dev>
 <TY3PR01MB113463BE8A4B1A40DBB0860538693A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <5438ccc8-ed5a-4dd6-8995-e8e9926883a5@tuxon.dev>
 <TY3PR01MB11346325F46C2BCA6B2B181D08693A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <ad752abc-275b-43ca-aec3-188c1a69c50b@tuxon.dev>
 <TY3PR01MB113460006A458AB2F8B96542C8693A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <TY3PR01MB11346C8AD27554E40EC5746E38693A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <7f0305f6-ae2d-4069-b53a-d2a81e75d164@tuxon.dev>
 <TY3PR01MB11346321A9AAE93C7070C6E578699A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CAMuHMdWUpq1bUbNLu4WGheovQ1pYdEJGBMN3jdb6PZqXanN_GA@mail.gmail.com>
 <TY3PR01MB1134661E4B93CE785700FC5AF8699A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <32ea84f2-621a-47d9-a661-9acd62d50662@tuxon.dev>
 <TY3PR01MB113460619AE8C46BC674B28078699A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <TY3PR01MB113460619AE8C46BC674B28078699A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[tuxon.dev:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[kernel.org,bp.renesas.com,gmail.com,perex.cz,suse.com,pengutronix.de,glider.be,renesas.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[tuxon.dev];
	TAGGED_FROM(0.00)[bounces-27973-lists,linux-renesas-soc=lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[tuxon.dev:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@tuxon.dev,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,tuxon.dev:email,tuxon.dev:dkim,tuxon.dev:mid,renesas.com:email,linux-m68k.org:email]
X-Rspamd-Queue-Id: 4469EFC572
X-Rspamd-Action: no action

Hi, Biju,

On 2/5/26 19:41, Biju Das wrote:
> Hi Claudiu,
> 
>> -----Original Message-----
>> From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
>> Sent: 05 February 2026 17:21
>> Subject: Re: [PATCH 5/7] dmaengine: sh: rz-dmac: Add suspend to RAM support
>>
>> Hi, Biju,
>>
>> On 2/5/26 16:06, Biju Das wrote:
>>> Hi Geert,
>>>
>>>> -----Original Message-----
>>>> From: Geert Uytterhoeven <geert@linux-m68k.org>
>>>> Sent: 05 February 2026 13:34
>>>> Subject: Re: [PATCH 5/7] dmaengine: sh: rz-dmac: Add suspend to RAM
>>>> support
>>>>
>>>> Hi Biju,
>>>>
>>>> On Thu, 5 Feb 2026 at 14:30, Biju Das <biju.das.jz@bp.renesas.com> wrote:
>>>>>> From: Claudiu Beznea <claudiu.beznea@tuxon.dev> On 1/26/26 17:28,
>>>>>> Biju Das wrote:
>>>>>>>> For s2idle issue on RZ/G3L is DMA device is in asserted state,
>>>>>>>> not forwarding any IRQ to cpu for wakeup.
>>>>>>>>
>>>>>>>> For S2RAM issue on RZ/G3L is during suspend hardware turns
>>>>>>>> DMAACLK off/ Asserted state. Clock framwork is not turning On DMAACLK as it critical clk.
>>>>>>>>
>>>>>>>> Can you please check your TF-A for the second case? First case,
>>>>>>>> RZ/G3S may ok for reset assert state, it can forward IRQs to CPU.
>>>>>>>
>>>>>>> Just to summarize, currently there are 2 differences identified between RZ/G3S and RZ/G3L:
>>>>>>>
>>>>>>> SoC differences for s2idle:
>>>>>>>
>>>>>>> RZ/G3S: Can wake the system if the DMA device is in the assert
>>>>>>> state
>>>>>>>
>>>>>>> RZ/G3L: Cannot wake the system if the DMA device is in the assert state.
>>>>>>>
>>>>>>>
>>>>>>> TF-A differences for s2ram:
>>>>>>>
>>>>>>> RZ/G3S: TF_A turns on DMA_ACLK during boot/resume.
>>>>>>>
>>>>>>> RZ/G3L: TF_A does not handle DMA_ACLK during boot/resume.
>>>>>>
>>>>>> I'm seeing at [1] you are addressing these differences in the
>>>>>> clock/reset drivers. With that, are you still considering this patch is breaking your system?
>>>>>
>>>>> Still, thinking whether to add critical reset or go with SoC quirk in DMA driver.
>>>>> Some SoCs need DMA should be deasserted like critical clock that can
>>>>> be handled either
>>>>>
>>>>> 1) Add a simple SoC quirk in DMA driver
>>>>>
>>>>> Or
>>>>>
>>>>> 2) Implement critical reset in SoC specific clock driver and check for all resets.
>>>>>
>>>>> Is simple SoC quirk in DMA driver, something can be done for RZ/G2L family SoCs?
>>>>
>>>> What if the DMA driver is not enabled?
>>>
>>> The below use cases will work (patch[1] - removing the code for
>>> deassert in cpg_resume) as there is no DMA driver to assert the reset.
>>>
>>> 1) system will boot without DMA driver
>>> 2) s2idle will work as there is no DMA driver to assert the reset.
>>> 3) s2ram will work without DMA driver.
>>>
>>> If DMA driver is enabled, then there is an issue with  s2idle as DMA
>>> driver assert the reset and we cannot use serial console as wakeup
>>> source
>>
>> I think we're taking here about both DMA clocks and resets.
>>
>> What if the DMA clocks are declared critical in Linux and clocks and resets are not handled by
>> bootloader in probe or resume? Who will restore critical clocks?
> 
> Patch [1] will restore critical clocks.
>>
>>>
>>> One solution is SoC quirk will prevent assert/deassert  of the DMA
>>> reset during
>>> suspend/resume() for affected SoCs.
>>
>> This can't work w/o taking care of the DMA clocks in the clock driver resume function (in case DMA
>> clocks are critical). If so, why handling DMA clocks and resets differently?
> 
> 
> What will you prefer
> 
> a single check in suspend/resume of DMA driver?
> 
> Or
> 
> Around 100 checks in suspend/resume in clock driver for checking critical resets for skipping DMA reset?

I see no conditions in your code. Just raw writes for DMA clocks and resets. I 
suspect the intention for v2 is to loop over all the resets in the resume path 
to find the critical one.

While reviewing it I asked to avoid asserting the DMA resets on reset assert 
API. That could be handled either by adding the concept of critical assert in 
the reset driver (or framework) of by just checking directly the reset ID to 
match the DMA reset ID (as this is the only critical reset identified at the 
moment).

To answer you, my personal taste would be:
- to handle the setup of the critical clocks and resets in a single driver, for
   probe and suspend/resume as well
- to handle it in a SoC specific code as this is micro-architecture specific
   issue; this problem is only for some of the SoCs, if I'm not wrong; the
   manuals for some of the SoCs using this DMA driver states the following
   (RZ/G3S HW manual, Rev.1.20., chapter 8.8.1):

In addition, need following register settings *even if DMA controller is not used*.

● Set CPG_CLKON_DMAC_REG register to supply a clock for DMA Controller.

Refer to Section 7.2.4, Clock Control Register DMAC_REG for register detail.

● Set CPG_RST_DMAC register to release a reset for DMA Controller.

Refer to Section 7.2.4, Reset Control Register DMAC for register detail.

Geert, Vinod: could you please let us know how would you like us to handle this?

Thank you,
Claudiu

