Return-Path: <linux-renesas-soc+bounces-23041-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5476CBDBB86
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Oct 2025 01:00:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BCED71925D65
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Oct 2025 23:00:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23F3923875D;
	Tue, 14 Oct 2025 22:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="lDEcy0Il";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="xUVFUheZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C1B1DE3B5;
	Tue, 14 Oct 2025 22:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760482796; cv=none; b=aWTImHNpg8QnRcoetRmiPhW6jKAbuabyjJaRVfIEAwaQ40kGcIHeSbJtgeH5hdRlSw/RnmvD559gCzYiruULzoR2ORkzkIAkSdTGwEbObCrvqq8Fe+6kFBxuHjbSKJUi/JjDt3Mmo+iGDgf3Vn8nS1kB8CPjYvwk8jvEkBGiiwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760482796; c=relaxed/simple;
	bh=54Lw6WuONADJipcfNA/jrZLbeEpDfXKq1CjyfzsyzL0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eC5L5imBI3jvkHyOr5CR3WLQ/rXp7SOtc4rxuUESnN2dE7yvesv4lKozuyL52nPq8TQ3tEyjrDetIpLKiCPVaInAFqu45+47JeL6KFToZfFq6T4Aj0Wi3+0OiqZY6T7T3dU7quUfSk/Y6gj7rZ2pfc8j4/5qo4yCrCqg3Y8lT7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=lDEcy0Il; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=xUVFUheZ; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4cmV6J1LRGz9tvJ;
	Wed, 15 Oct 2025 00:59:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760482792;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4hfowH2iHudGa0LkdrtS84kdcHbiN+9po/FhXQJzKNc=;
	b=lDEcy0IlAKe7LED+HzIzOHqp7CRKXKALzRrQvDKmrcT+wSLI8n83tfSuSjmrDfFXpayuFZ
	D/To6s3CvThP/7sijhPgJ0EAXtGCAvTCiKU0hr6VoOZ2EXwEd+pirxb2DYcmsWOwxuzKe7
	v2fyfqfHItH+5h09GPlqQAPfuAxAu2azo2UqNy56zXTOW4MqPFdpitQ2Xxx4iE9aNGqlC8
	nb8nbZLPr4IhuTRN8T7YfzqaTccW2zL4BslS3CNut000rO3wDjAN+VZeuR/mrLzeHKRzKc
	ypTa4p2sU3wR40taTxUJFxAGHWs3Yr4evv0CtGzFYK5qYoB/fC8RKzR3INpzsw==
Message-ID: <e93779e7-026b-4b48-9d9b-dfef3d953749@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760482790;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4hfowH2iHudGa0LkdrtS84kdcHbiN+9po/FhXQJzKNc=;
	b=xUVFUheZfugfP5J1pOCixDTQUpRLR9ZwawCcYGvcbW0pX3TvbJAVoSQR0l//+64oGR/MuC
	blIqT6PMlEMDE32pIZjKikeZZZ6Esi+Tluf4fTwEaEqODCW8cHnbbowg5IEy5Pol3VmG/t
	wJdllMmbnaVfbRqAKkNHWe9SxD7JNhKUw1Iq4FYbKsa0Bd/x04aPTN5wXuX/CIicFhqQY2
	NXckdpuJlHBs606HssIwzgcfZWsjPuVfR2lY02+kbvVV2raxdD0+jRTlQzkqilhKH6y4h/
	TS/wUVguGXKs4890cebtTyZCBWI10ZFHQBYEgCllVDjVFIe98h00NosUuw2sug==
Date: Wed, 15 Oct 2025 00:59:45 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 2/3] arm64: dts: renesas: r8a77960: Add GX6250 GPU node
To: Matt Coster <Matt.Coster@imgtec.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: Adam Ford <aford173@gmail.com>, Conor Dooley <conor+dt@kernel.org>,
 David Airlie <airlied@gmail.com>, Frank Binns <Frank.Binns@imgtec.com>,
 Alessio Belle <Alessio.Belle@imgtec.com>,
 Alexandru Dadu <Alexandru.Dadu@imgtec.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
References: <20251013190210.142436-1-marek.vasut+renesas@mailbox.org>
 <20251013190210.142436-2-marek.vasut+renesas@mailbox.org>
 <d4ec2cc2-882a-4842-ad8c-42033ceb2bc7@imgtec.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <d4ec2cc2-882a-4842-ad8c-42033ceb2bc7@imgtec.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: ya4auwctb7mmsqbrry9umriad1d3o4wa
X-MBO-RS-ID: 34d82dfc4b4fa9568db

On 10/14/25 1:52 PM, Matt Coster wrote:

Hello Matt,

>> +++ b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
>> @@ -2565,6 +2565,18 @@ gic: interrupt-controller@f1010000 {
>>   			resets = <&cpg 408>;
>>   		};
>>   
>> +		gpu: gpu@fd000000 {
>> +			compatible = "renesas,r8a77960-gpu",
>> +				     "img,img-gx6250",
>> +				     "img,img-rogue";
>> +			reg = <0 0xfd000000 0 0x40000>;
>> +			interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
>> +			clocks = <&cpg CPG_MOD 112>;
>> +			clock-names = "core";
>> +			power-domains = <&sysc R8A7796_PD_3DG_B>;
> 
> My comments here apply to the other dts patch (P3/3) as well since the
> integration appears to be identical between the two SoCs.
> 
> There are two power domains on this GPU and the SoC exposes both of
> them; no reason to fall back to the single-domain scheme here.
> 
> I know the sysc driver declares the dependency of _B on _A, but the dts
> shouldn't rely on that, so can we have:
> 
>     power-domains = <&sysc R8A7796_PD_3DG_A>, <&sysc R8A7796_PD_3DG_B>;
>     power-domain-names = "a", "b";

Both SoCs fixed in V2 , which I will post in a few days , thanks !

>> +			resets = <&cpg 112>;
> 
> Is this a reset line? Is it a clock?

This is a reset line. The MSTP controls both clocks and resets, but this 
particular phandle describes reset control.

> I see this pattern used throughout
> the Renesas dts, but I'm just thinking how this will interact with the
> powervr driver. The reset line is optional since some hardware
> integrations manage it for us during the power-up/down sequences, which
> appears to be the case here with the MSTP control (from my brief dig
> through the Renesas TRM).

As far as I can tell, the pvr_power.c toggles the IP reset after the IP 
clock were already enabled, so the IP should be correctly reset. What 
kind of problem do you expect ?

> Related, see my comments on the bindings patch (P1/3) about how clocks
> are wired up in this SoC.
I tried to reply to that one, hopefully it makes some sense.

