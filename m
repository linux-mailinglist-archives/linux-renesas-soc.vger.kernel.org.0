Return-Path: <linux-renesas-soc+bounces-21388-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B2FB44745
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 22:25:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4099B1894B3F
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 20:26:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A529627FB1F;
	Thu,  4 Sep 2025 20:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="vFGyPpds";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="CMw4HwYf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20088253F05;
	Thu,  4 Sep 2025 20:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757017556; cv=none; b=GrfAJXFqWt4XuhAj3omPLMMdSWvZg0h3pvmGbwNWVgRAt4+kgUYIjWWNK/o95x5VUHoLUcKfwNRhZF5Ao0RNxDaL9X0GFXwAveNICKV7vT/YhHlYntVfbrou/ciY7Tz0vD2H/dSTOBJ5KuM+KqU2IWxzEUf+lTSJ7NQCW9HcFC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757017556; c=relaxed/simple;
	bh=KI3b0a4lrd4YjmIf7pBw9exlvbEUt6E6eSnJoaseDHk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X5hDNYciR9ETE5CLr3UE4oPZyoUDcQxy+bC2BkF/6HR5REetFqX9gBzkX2E+MCnEcnhhFr/PbvpT55FNsX9dUWM5sF9XYqaRNBLRDV/XGo7+RvU9eZgW6kvHijvKSlaB9KgnivVOP1q94ihkD6Cd6CFyZ75m3zIYq407nfdztmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=vFGyPpds; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=CMw4HwYf; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4cHrb52fZVz9tVR;
	Thu,  4 Sep 2025 22:25:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1757017553;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OCbw5c5RH08/3iWhVXYJBwj4/n0wTQaKln6EJVz/2Xs=;
	b=vFGyPpdsxilX+Hl+eye+5z2VObsfBJ2jo44J/mDVj7aAEi4JN/rKflE2/krTSlcuTkjS44
	FCZSIjj3QKs/G2DeKLN5CYpQYpIOi5WWQvNUhTrVIheP/ULewPlBBAwe3ZrForrorPMSgB
	h8//xpotWa2VRev9NCTvhNt1A+hisKyGmSAMXk4CB6l2To4KESNKVy/OF7fHGXTEVA5eSs
	4XEcSIY6ByZA5qO3gvNnKtRonUJnxyLp3ysr3Ex4MAMpgJOTcV+rNsLGT0SqmVsLue1kev
	KMKTWfe2e0TC/emsjJkkpFuY3Wqt6jdscbfXMPsbCpnPWOJ5WYmxZgseATxI9Q==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=CMw4HwYf;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=marek.vasut@mailbox.org
Message-ID: <94870c77-aeb1-432d-a951-27a0ff793eeb@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1757017551;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OCbw5c5RH08/3iWhVXYJBwj4/n0wTQaKln6EJVz/2Xs=;
	b=CMw4HwYfz4h5joU6L4tPmsmztaBJ/GKqo7d4kb3TlSitgpiOcBLcAHnzanutJkUWqB+XVT
	/oWjDuo4qQSi6UdpbZgM7vupEFaNqgxvAuYLjpZF14VtTecCfEUyGFlQU6OGKpEfFBZDl/
	Z/YjqLObhQFfOryWKOg30gjQEb6p1ypThOKsRjQQ8+dsuUZFKW1txA3u1mSr7Deba5fCgK
	JU6ajKqX+bS1IGBmW4tTmq3Q7GUW+52PLNEnvzQraKK3zQbGCDvzwoEuY8fvkB0h2Tym9i
	mj9BXf07B+1hmBnVxidnsFkDN5EZhrtAUbioDBgXEFawS8ZnT1GlXk1Lv4p9Nw==
Date: Thu, 4 Sep 2025 22:25:49 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] arm64: dts: renesas: r8a779g3: Add RPi Display 2 DTO to
 Retronix R-Car V4H Sparrow Hawk
To: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 linux-arm-kernel@lists.infradead.org
Cc: Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm
 <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20250904200936.169536-1-marek.vasut+renesas@mailbox.org>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20250904200936.169536-1-marek.vasut+renesas@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: 9rxpaercojqkobmp3jbnbb65osqtqkhi
X-MBO-RS-ID: c3086cc37f5c9633d31
X-Rspamd-Queue-Id: 4cHrb52fZVz9tVR

On 9/4/25 10:08 PM, Marek Vasut wrote:

> diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
> index d8c9237624664..b14e593208758 100644
> --- a/arch/arm64/boot/dts/renesas/Makefile
> +++ b/arch/arm64/boot/dts/renesas/Makefile
> @@ -99,6 +99,10 @@ dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk.dtb
>   dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-fan-pwm.dtbo
>   r8a779g3-sparrow-hawk-fan-pwm-dtbs := r8a779g3-sparrow-hawk.dtb r8a779g3-sparrow-hawk-fan-pwm.dtbo
>   dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-fan-pwm.dtb
> +r8a779g3-sparrow-hawk-rpi-display-2-5in-dtbs := r8a779g3-sparrow-hawk.dtb r8a779g3-sparrow-hawk-rpi-display-2-5in.dtbo
> +dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-rpi-display-2-5in.dtb
> +r8a779g3-sparrow-hawk-rpi-display-2-7in-dtbs := r8a779g3-sparrow-hawk.dtb r8a779g3-sparrow-hawk-rpi-display-2-7in.dtbo
> +dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-rpi-display-2-7in.dtb
Make sure you also build the plain DTBOs , not just the DTBs here.

I'll send a V2.

