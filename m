Return-Path: <linux-renesas-soc+bounces-18893-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3529AAECCF0
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 29 Jun 2025 15:39:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 57E811717E2
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 29 Jun 2025 13:39:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF11F20766E;
	Sun, 29 Jun 2025 13:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="LoGbuL0b";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="VIFsH+TA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A3A579C4;
	Sun, 29 Jun 2025 13:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751204339; cv=none; b=V7o+TuSVMrxFORUsbA/WsjuLmWOYKOkX3eKJ266rgp5hRPYOt8gn0MVigUzB9LJy8BBGJzooKxKOMvZMcDgK+R29WdU82RPgzClTXaweaeZrrySaiD2B9UIrLK33t1CtttQuMgdxU1fsNmqqQ8jGYB8PZZQ0zMAZToPeTEFBWSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751204339; c=relaxed/simple;
	bh=/t9GDmtQGRRo7HQnTqMcSQyKeLGv2bGFIcooBtlP13M=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=SAS4Rc7LLjvAEXVBziEgk9m1JOJrozDqQmFuSj8I98tUEX8GnP80ssIo/4AmeDzszWsiagMmu53NpBJpqM8oSsJkCTQzxBNPmRB67tbE0PmpMd2lgRDCVH5W700p/Co4ZlMLWVM9X2KjrmKg9asX3iJnzvq+ACOCgMTHN1DauyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=LoGbuL0b; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=VIFsH+TA; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4bVVkL4Htpz9spB;
	Sun, 29 Jun 2025 15:38:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1751204330;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=22TNUrpWs0dCvXFS4EC9TI2wCwRpAAoj9nfiemj7nQY=;
	b=LoGbuL0bV2Hu8vi8cOUEmUrKEKA8ekZJF1bSVVnZnAsH6gpPKx7IV+jCMo8EHBqT91QfsP
	+fUHor4+7R2LEPDreYXJGBPBiRb6JyPSUR4JWUUvYD5EZ47hpHfwfULHD2uIx7n15tm26f
	eL8ceKgXTtSfNw4OzV5WPHG7y4zV+AnnSwJ8Bb7iKWt4Vdn9wQfbV3ZcO+BMGcv/RgM3vC
	Ay5fDB8haiMr/dNiPmOdeA8o/wzcwwC1HHqYNVusZwEG7TfU6zh0U1cmcBOEceXCR3i2vt
	WOmFRKx+LTEuqIv/P2eQGOXKA1TDv8oZhQU4HznF8pwJSRoF3XtSKlaabor3UQ==
Message-ID: <5b33d136-3a9f-4fc8-b57e-b24f91950998@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1751204328;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=22TNUrpWs0dCvXFS4EC9TI2wCwRpAAoj9nfiemj7nQY=;
	b=VIFsH+TAzkRbEAVZprrXTP7WyTuBICjxLFBaylRDEkTJT/0//NU6CBCbvx8D87zPbbHkJw
	fcHQVJ8ANvnUH6jdtNxYy4RUdgVm2jtXvF7Yt35kjcDEuVsOfx+cLGRKKOMBBC/WFYUZSM
	B+VMXzzQJZXRiwYY/DrV8Atlu3Zl9BD9HldN9pnk7lU2XNP0MBnafDmNJF/FTjRb8DTOgC
	iwS9G5b8kEE73zLENZVCDzExr4jQrBrwL/ZGntucGjCajbxQGeHEteuJ05IN6TTpFLHWdM
	siV+TWbuINCR+/QSK3vSRRlsX62wMd5HgNcMnN+uVTYwg2TjASCps7/QtO4E2A==
Date: Sun, 29 Jun 2025 15:38:46 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 1/5] arm64: dts: renesas: r8a779g3-sparrow-hawk-fan-pwm:
 Add missing install target
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?=
 <niklas.soderlund+renesas@ragnatech.se>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Marek Vasut <marek.vasut+renesas@mailbox.org>,
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
References: <20250628215337.1688969-1-niklas.soderlund+renesas@ragnatech.se>
 <20250628215337.1688969-2-niklas.soderlund+renesas@ragnatech.se>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20250628215337.1688969-2-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: e066797296566a4f44f
X-MBO-RS-META: 3wtntsc6w9k99eq8ayzqdxuoknk953c4
X-Rspamd-Queue-Id: 4bVVkL4Htpz9spB

On 6/28/25 11:53 PM, Niklas Söderlund wrote:
> The target to consider the dtbo file for installation is missing, add
> it.
> 
> Fixes: a719915e76f2 ("arm64: dts: renesas: r8a779g3: Add Retronix R-Car V4H Sparrow Hawk board support")
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>   arch/arm64/boot/dts/renesas/Makefile | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
> index 677ba3aa8931..47e46ef99d36 100644
> --- a/arch/arm64/boot/dts/renesas/Makefile
> +++ b/arch/arm64/boot/dts/renesas/Makefile
> @@ -96,6 +96,7 @@ dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g2-white-hawk-single-ard-audio-da7212.dtb
>   
>   DTC_FLAGS_r8a779g3-sparrow-hawk += -Wno-spi_bus_bridge
>   dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk.dtb
> +dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-fan-pwm.dtbo
>   r8a779g3-sparrow-hawk-fan-pwm-dtbs := r8a779g3-sparrow-hawk.dtb r8a779g3-sparrow-hawk-fan-pwm.dtbo
>   dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-fan-pwm.dtb

Reviewed-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

I was not aware of this, thanks for pointing this out.

