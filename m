Return-Path: <linux-renesas-soc+bounces-27959-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EOYpIY7ShGlo5gMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27959-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Feb 2026 18:25:34 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E21CBF5E16
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Feb 2026 18:25:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 55332301A701
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Feb 2026 17:20:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6CC130C616;
	Thu,  5 Feb 2026 17:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="ib21pSIc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E7C62FC871
	for <linux-renesas-soc@vger.kernel.org>; Thu,  5 Feb 2026 17:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770312056; cv=none; b=DHwju8zvln6fRZBLkkF3obybvOGFlLx+l+UycUYkVgDfk070i6f4/uRsdUOXk1Us1y0aXvS6XhAHEs+Q4rLRijDMC+AqjpX13XY8nQtz7y+56UkbqwFyCp8oM0paBPLmywcgwxPnIVJIXIpIWJByH4SJ7Yfi8DbqxYyDSEPUgS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770312056; c=relaxed/simple;
	bh=QJK1uJ/Ofymouhtx5IE+w0SZJJKRvkpRBFhbN/MqoBA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kvNXRKOJlz+oZcgQdto2BQaG+IsRpgfKkGW3JvVI9VXJD6zSqoqjd/IWaoEgRgIjoahr1YJ1Z3YD1zOelGbwOrwZVk3RzQTR7h1arSbeyBK5ueGn0TWJ7oj2PiHsGqPFte4TPN/GUxGBVEf3IGFz6zpjWPHbPIUTMMIATEeh6Io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=ib21pSIc; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-47f5c2283b6so10521525e9.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 05 Feb 2026 09:20:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1770312054; x=1770916854; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2hxJi4LjvJCxCRYfV2t2DUtZ8pEMp5AK+WWUAjd9I7o=;
        b=ib21pSIc/QG98V35fTlyJQbCQmxScZQDkn1iXThhVc9wHDD4rqWZk6txGgYmOMXUtk
         9NqtMHJktOTGBUx4ms/ENcLufjraTqEgvmHjBpoJJsUNWgfwH1zz85/C1M817bRplabo
         6Z+Ek5gig8KQSMAG4Uyh2JWapAp9i5r+ucoAcifKKPOEc4HFZaKhPeNQTC+Ft/0d0Gi0
         cp4SfKq2mIpNvhcYUp2NNY8X+VE9Wqen/fx/8FT1moeq/d9VkuFGpK4mhEuQpl2ycYEp
         nnMjLILaiHnlRfKAfYMhcZwY9xFmH+P39DgW9RAXvR64W3DTjTPuAqe2mDjl6E/C8TKE
         gawQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770312054; x=1770916854;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2hxJi4LjvJCxCRYfV2t2DUtZ8pEMp5AK+WWUAjd9I7o=;
        b=T6F30MRutv7bd1Da6oGm357+8Ia4gRYqzYmOzb3jVdZvtW9flvMTkPywdpX/FJsMtK
         zZAqFRW3421LIEd2jPLMPx2QxThDu/2Fz5Vev213VsluPYTN3mGhEZhytTdx7lNiX7o+
         M9lOwXSFJ9YqbwMwW6YNXXxmc52at7s4O6BhUbDXeyG2yLWcpLf7P27YQWVAHGben73q
         nb5CRNIqq2izeCMhBgYIHlC+tcdbezP8sPwWqaNoDMg3z+2hEsCiH3l6rkrZO6/OG3b7
         d8EY4CF+T96bTfwnWO+5Egw0gzl3D6EOB9FlArtALFrj4ApEdCchgvT+Th86SJj72g3/
         bQ2A==
X-Forwarded-Encrypted: i=1; AJvYcCU7KPq8jczj7q0xl0Io3ScCAPSSdZxQzxnszCjeAv3S7qiZIhoslry7zyvJHXgl/q7jAV/OtWcxlZdupo5KN/I05g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7QT5CRiV30jNkD5U6sn544DYLJnfBvVvna204SVKERHajmJGN
	Tq3YvEFjp0xssv0046cxYNsKcoNc9EfONjfiTkgS/rjaKiZFHYC5+HB4vzcKaVcx0Ao=
X-Gm-Gg: AZuq6aLbPbP66BMTBaCvZdmHGlUSVzm9nnOPo5l1jnB7DskBh6MRGAyN5HmK5eU/0+Z
	NQNSY1JnAap2bP0MGXQJveXqNwQZKGvjAVZOEdC7zZO0rtTvNK+5rNOcKi3E53JTuVAxKnA5ZyV
	E/errPvZUKYFUoNE6aBE2k5uUDU9PmGGe5UMZSCgCvumtrL23v+teAJWpUj9O/lZYneWu+AuVZR
	AIc0FbTJfvRHFyvfJ45SMqtynPW9xL4VphW6vCACMNUwhh9E0lG39zYwMZ6OE1zHsEh3MdxOoxj
	+EWhVnHYM4m/OfwCuYkpWwvb5VMOSz3cLVN56egCq9mIID8l3SybcNG4lvRkZsndormyL9ISAKS
	g7bQRCnJC2dE4QhnBuQXNaGMh9ANSDwYcJvOLqpE9gT8o2JRvDQYfjF8ZKZPmI1QuTSqKmczdi7
	32xsynAuNf2TStHyo5O9E=
X-Received: by 2002:a05:600c:4f54:b0:47d:403e:9cd5 with SMTP id 5b1f17b1804b1-4832020df4emr1729315e9.11.1770312054098;
        Thu, 05 Feb 2026 09:20:54 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.215])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4830fe567b4sm81538565e9.5.2026.02.05.09.20.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Feb 2026 09:20:53 -0800 (PST)
Message-ID: <32ea84f2-621a-47d9-a661-9acd62d50662@tuxon.dev>
Date: Thu, 5 Feb 2026 19:20:51 +0200
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
 <20260126103155.2644586-6-claudiu.beznea.uj@bp.renesas.com>
 <TY3PR01MB113461F734BA087B60605C6FC8693A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
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
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <TY3PR01MB1134661E4B93CE785700FC5AF8699A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[tuxon.dev:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[kernel.org,bp.renesas.com,gmail.com,perex.cz,suse.com,pengutronix.de,glider.be,renesas.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[tuxon.dev];
	TAGGED_FROM(0.00)[bounces-27959-lists,linux-renesas-soc=lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[tuxon.dev:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@tuxon.dev,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,tuxon.dev:email,tuxon.dev:dkim,tuxon.dev:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E21CBF5E16
X-Rspamd-Action: no action

Hi, Biju,

On 2/5/26 16:06, Biju Das wrote:
> Hi Geert,
> 
>> -----Original Message-----
>> From: Geert Uytterhoeven <geert@linux-m68k.org>
>> Sent: 05 February 2026 13:34
>> Subject: Re: [PATCH 5/7] dmaengine: sh: rz-dmac: Add suspend to RAM support
>>
>> Hi Biju,
>>
>> On Thu, 5 Feb 2026 at 14:30, Biju Das <biju.das.jz@bp.renesas.com> wrote:
>>>> From: Claudiu Beznea <claudiu.beznea@tuxon.dev> On 1/26/26 17:28,
>>>> Biju Das wrote:
>>>>>> For s2idle issue on RZ/G3L is DMA device is in asserted state,
>>>>>> not forwarding any IRQ to cpu for wakeup.
>>>>>>
>>>>>> For S2RAM issue on RZ/G3L is during suspend hardware turns
>>>>>> DMAACLK off/ Asserted state. Clock framwork is not turning On DMAACLK as it critical clk.
>>>>>>
>>>>>> Can you please check your TF-A for the second case? First case,
>>>>>> RZ/G3S may ok for reset assert state, it can forward IRQs to CPU.
>>>>>
>>>>> Just to summarize, currently there are 2 differences identified between RZ/G3S and RZ/G3L:
>>>>>
>>>>> SoC differences for s2idle:
>>>>>
>>>>> RZ/G3S: Can wake the system if the DMA device is in the assert
>>>>> state
>>>>>
>>>>> RZ/G3L: Cannot wake the system if the DMA device is in the assert state.
>>>>>
>>>>>
>>>>> TF-A differences for s2ram:
>>>>>
>>>>> RZ/G3S: TF_A turns on DMA_ACLK during boot/resume.
>>>>>
>>>>> RZ/G3L: TF_A does not handle DMA_ACLK during boot/resume.
>>>>
>>>> I'm seeing at [1] you are addressing these differences in the
>>>> clock/reset drivers. With that, are you still considering this patch is breaking your system?
>>>
>>> Still, thinking whether to add critical reset or go with SoC quirk in DMA driver.
>>> Some SoCs need DMA should be deasserted like critical clock that can
>>> be handled either
>>>
>>> 1) Add a simple SoC quirk in DMA driver
>>>
>>> Or
>>>
>>> 2) Implement critical reset in SoC specific clock driver and check for all resets.
>>>
>>> Is simple SoC quirk in DMA driver, something can be done for RZ/G2L family SoCs?
>>
>> What if the DMA driver is not enabled?
> 
> The below use cases will work (patch[1] - removing the code for deassert in cpg_resume)
> as there is no DMA driver to assert the reset.
> 
> 1) system will boot without DMA driver
> 2) s2idle will work as there is no DMA driver to assert the reset.
> 3) s2ram will work without DMA driver.
> 
> If DMA driver is enabled, then there is an issue with  s2idle
> as DMA driver assert the reset and we cannot use serial console
> as wakeup source

I think we're taking here about both DMA clocks and resets.

What if the DMA clocks are declared critical in Linux and clocks and resets are 
not handled by bootloader in probe or resume? Who will restore critical clocks? 
clk_prepare_enable() skips applying the setting to hardware as the critical 
clock refcount cannot reach zero.

> 
> One solution is SoC quirk will prevent assert/deassert  of the DMA reset during
> suspend/resume() for affected SoCs.

This can't work w/o taking care of the DMA clocks in the clock driver resume 
function (in case DMA clocks are critical). If so, why handling DMA clocks and 
resets differently?

> 
> Other solution is implement the critical reset and check for all assert calls to skip
> the DMA resets.

I prefer this solution + restore the DMA critical clocks on clock driver 
suspend/resume.

Thank you,
Claudiu

