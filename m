Return-Path: <linux-renesas-soc+bounces-20057-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E67AAB1C89D
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Aug 2025 17:23:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0E5387A70C5
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Aug 2025 15:22:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 041B628FFD8;
	Wed,  6 Aug 2025 15:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="rINUDcKI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BC5128F53F;
	Wed,  6 Aug 2025 15:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754493819; cv=none; b=XRL15dnd8PGz5I2BTzPEY140U8KChdwQUVuqukOVLyYjUiyqUb/sV1tXaSdS9o03XJRkT9y4H0RXrHROiVeWGY4uUTPmaIvEJTR1aWDp4cJ+CbRf9GADViBAPqn2OVXFKuj6T4V+g1xTNevVVryHtFxTFt6M3I9n2XdMb3gEUeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754493819; c=relaxed/simple;
	bh=kH8Q5MNOzZyI5HYMIOzlq0YxriVL0nLIBAICthPf1vY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=akUBcJtCgoJUa+OwO0LwnsLWFiMPfNg55/oFA9hGPfGfO81mHKWhTG9J3+RHZQkGjeYKaIKE41n/HOlvn0EB5XqTd4Of+Mh1mf9yaByqo2jKdFGTLDFIBlfNquL6aCjushipPI+EsfOpMpmPDzoYKn5rSv1HlXaG/N6TlSvoOGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=rINUDcKI; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4bxvFf4ZzLz9t1D;
	Wed,  6 Aug 2025 17:23:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1754493814;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ptD7RqG2Wfwe8QvHULRB9jljjN5BIARVY3LM/DAzOSM=;
	b=rINUDcKIArXUARYoVU8YTwFTGj6+5V7Wja6notBfGvVBFgdJPGZUoRKKNqv2AX00eR22MG
	HBrK/1y+6/MO/nuqE/PumgQKLzRJ3rdtqmbTlR4Q+SOpfDxcHQrwRF2ItT8ubDRcT96Eu1
	0JMzWe8H8aXIik/IrF4yuMmtaFXD08WxmpHc06zsSda7Ddym+cQCK6w9Kon2yX9vn3Lqaf
	xMw1jbKz+JhwBf3pKSmocCVHP2ZWC1ZF6gdEx3kxfNK1c9EeEBuN+PPbARvILHUP6eAVnG
	MwUE2Gbr6TcZD9QykA1Pv1A0QexP/376JN20RP5CoW3T3HFwZw4a/U9clUp2Kg==
Message-ID: <e1d465f7-43d7-471b-b8a7-7d24428bac4c@mailbox.org>
Date: Wed, 6 Aug 2025 17:23:31 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] arm64: dts: renesas: r8a779g3: Update thermal trip points
 on V4H Sparrow Hawk
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm
 <magnus.damm@gmail.com>, =?UTF-8?Q?Niklas_S=C3=B6derlund?=
 <niklas.soderlund@ragnatech.se>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20250625100330.7629-1-marek.vasut+renesas@mailbox.org>
 <CAMuHMdV3=c24KxO_Sbt50FGsFnNVYNnHAUhk-yoa+nM1f+7+kA@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAMuHMdV3=c24KxO_Sbt50FGsFnNVYNnHAUhk-yoa+nM1f+7+kA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: a0bef3196f4fbcb220b
X-MBO-RS-META: ahbupiudatrs3ous6js5scw7o1xdhufs

On 8/6/25 11:35 AM, Geert Uytterhoeven wrote:
> Hi Marek,

Hi,

>> +       #cooling-cells = <2>;
> 
> This is only present for the first CPU core, and map{0,1,3} refer
> only to a76_0, because all four CPU cores are driven by a single clock
> (Z0), right?

That seems correct.

>> +
>> +       a76_0_thermal_idle: thermal-idle {
>> +               #cooling-cells = <2>;
>> +               duration-us = <10000>;
>> +               exit-latency-us = <500>;
>> +       };
>> +};
> 
>> +/* THS sensor in SoC near CA76 cores does more progressive cooling. */
>> +&sensor_thermal_ca76 {
>> +       critical-action = "shutdown";
>> +
>> +       cooling-maps {
>> +               /*
>> +                * The cooling-device minimum and maximum parameters inversely
>> +                * match opp-table-0 {} node entries in r8a779g0.dtsi, in other
>> +                * words, 0 refers to 1.8 GHz OPP and 4 refers to 500 MHz OPP.
>> +                * This is because they refer to cooling levels, where maximum
>> +                * cooling level happens at 500 MHz OPP, when the CPU core is
>> +                * running slowly and therefore generates least heat.
> 
> That applies to cooling-device = <&a76_[0-3] ...>...

Do you want me to add this line into the comment ?

>> +                */
>> +               map0 {
>> +                       /* At 68C, inhibit 1.7 GHz and 1.8 GHz modes */
>> +                       trip = <&sensor3_passive_low>;
>> +                       cooling-device = <&a76_0 2 4>;
>> +                       contribution = <128>;
>> +               };
>> +
>> +               map1 {
>> +                       /* At 72C, inhibit 1.5 GHz mode */
>> +                       trip = <&sensor3_passive_mid>;
>> +                       cooling-device = <&a76_0 3 4>;
>> +                       contribution = <256>;
>> +               };
>> +
>> +               map2 {
>> +                       /* At 76C, start injecting idle states */
>> +                       trip = <&sensor3_passive_hi>;
>> +                       cooling-device = <&a76_0_thermal_idle 0 80>,
>> +                                        <&a76_1_thermal_idle 0 80>,
>> +                                        <&a76_2_thermal_idle 0 80>,
>> +                                        <&a76_3_thermal_idle 0 80>;
> 
> ... but what do "0 80" refer to? I couldn't find in the thermal-idle
> bindings what exactly are the minimum and maximum cooling states here.
The comments in drivers/thermal/cpuidle_cooling.c clarify that, it is 
the idle injection rate in percent, in this case the cooling can inject 
idle states up to 80% of time.

+CC Daniel in case they want to chime in on that.

