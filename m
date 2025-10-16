Return-Path: <linux-renesas-soc+bounces-23134-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 62850BE27D5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Oct 2025 11:48:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D3A33E43D5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Oct 2025 09:48:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9A08241686;
	Thu, 16 Oct 2025 09:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="LY6pxnqu";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="iRCKiYjV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C5173254BF;
	Thu, 16 Oct 2025 09:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760608088; cv=none; b=Uv/3D/T+HZt16cZ3n6bg4OuW5oXindFROH9BbppsfMUHRSuFb9r7hBdM1StUG9wo/cbP6v7XByaeNx1ZKq9inxB353o7aieeEjvbLeuznbmnJ3geC4G2rv4ZWYYm5zrpLRgnGrWie7+KiJesMJJaKxYpUMt2NZUTFVDizMjx6vI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760608088; c=relaxed/simple;
	bh=p14FaJn027QFv3xWUKqNHV1qfH6V9WZev1jnqi2J0Jc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W9aBualbCv2lNaLKhmZvlBdy/I32LkeOnCZA6ufSWNI9RmVTiozpVQZP0rcDoVw6wUPoqEQiVOEFSCQYSxxrXCeCp4u6I91tIL5/AtoaWVOKn5YHyPwquF56QpYajWCmneznIvbJd9W3FddVd/6X+pbTTTvAZJn9ISMehAHm18g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=LY6pxnqu; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=iRCKiYjV; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4cnNRk5kTGz9tjH;
	Thu, 16 Oct 2025 11:48:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760608082;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dDU4MHtIXNjqAS9JJD27/CnM+BvS39aAL00HB1wKmUs=;
	b=LY6pxnquYPZzf/vnpVqvwnv42pmxyX6hS/LsDWtU2B5JF97gz28NKgw1jRUUjFmYd0WhY4
	DhTdpjEhwlwi09VKAedBaCkcFWVxDpPVQBRvnyexpFgvr6thnM+qsFM/SXawGC24Snlkop
	BAlxbv5sxRJcOfBbSTOPE3I5IkN2mwUjqU7cMUagSLRmPbwbsde288GtVU5kgwWl8HpOMt
	guOm0DFxFFkYnqDc5YhclS3FSNnqn2mBeSvrLomnHRcn4bpZcLw3l6XGd3EqNTvCt/hEb/
	4ZXRIj0BaM9G+H8AA7kE358iZM8WoKe7Dyz9W4zW7/b2OscjuPZVdG6sXIfCIA==
Message-ID: <51ff107d-126d-4481-b94a-f614f31c7bb8@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760608080;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dDU4MHtIXNjqAS9JJD27/CnM+BvS39aAL00HB1wKmUs=;
	b=iRCKiYjVaNQjr7ciL/76PHWjl/5d+opl6I8j9fSY+qFPEtSc5dnwYavGolev5MM93Ngcdu
	jI9veoq6Z/SRRV+gM+fLHysHUfIk4n6YOTzptX/Y5KOBvYVIGf9NxaiUXHF/VBNUqF8gta
	JygcaVjXZOjfL9Bz15/lXRRO2RvvdX8l2LnnxfYIjgc3KZJ6PtM5oWJKIAY3RpwBrlVJB7
	hELhC2z0tVptxe9FamxUsaGGnVtlkgWapRFm9F1p5+5PQGGCk+676DDTZJ4TEJKOh/H97j
	UhVs3Q/nD4Joq2xP7oZKdzJqq6GnWFwTGSgJupUhHQ04ka4rG1+CeIQwMtmcXQ==
Date: Thu, 16 Oct 2025 11:47:56 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 2/3] arm64: dts: renesas: r8a77960: Add GX6250 GPU node
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Adam Ford <aford173@gmail.com>, Conor Dooley <conor+dt@kernel.org>,
 David Airlie <airlied@gmail.com>, Frank Binns <frank.binns@imgtec.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Matt Coster <matt.coster@imgtec.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org
References: <20251015153952.185249-1-marek.vasut+renesas@mailbox.org>
 <20251015153952.185249-2-marek.vasut+renesas@mailbox.org>
 <CAMuHMdVdW+tMA1=g9D+BQV0fk0kis8FzyQgf7BpN-u=pi5eQfA@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAMuHMdVdW+tMA1=g9D+BQV0fk0kis8FzyQgf7BpN-u=pi5eQfA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 6f731996ea0c40a0a5a
X-MBO-RS-META: oz5jm67tb1wz1eczi1ucb737inbcuyn3

On 10/16/25 10:22 AM, Geert Uytterhoeven wrote:

Hello Geert,

>> --- a/arch/arm64/boot/dts/renesas/r8a77960.dtsi
>> +++ b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
>> @@ -2575,6 +2575,22 @@ gic: interrupt-controller@f1010000 {
>>                          resets = <&cpg 408>;
>>                  };
>>
>> +               gpu: gpu@fd000000 {
>> +                       compatible = "renesas,r8a7796-gpu",
>> +                                    "img,img-gx6250",
>> +                                    "img,img-rogue";
>> +                       reg = <0 0xfd000000 0 0x40000>;
>> +                       interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
>> +                       clocks = <&cpg CPG_CORE R8A7796_CLK_ZG>,
>> +                                <&cpg CPG_CORE R8A7796_CLK_S2D1>,
>> +                                <&cpg CPG_MOD 112>;
>> +                       clock-names = "core", "mem", "sys";
>> +                       power-domains = <&sysc R8A7796_PD_3DG_A>,
>> +                                       <&sysc R8A7796_PD_3DG_B>;
>> +                       power-domain-names = "a", "b";
>> +                       resets = <&cpg 112>;
> 
> status = "disabled"; ?

The GPU is always present in the SoC, similar to IPMMU/GIC/DMA/VSP/... 
which are also never disabled, do we want to disable the GPU by default 
and enable per-board ?

I would argue the GPU should be enabled by default, so the GPU driver 
can do a proper power management of the GPU. If firmware is missing, at 
least power it off on failed probe, if nothing else.

[...]

