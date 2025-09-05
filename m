Return-Path: <linux-renesas-soc+bounces-21476-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FAB0B456DC
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Sep 2025 13:50:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4CFA6188CB76
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Sep 2025 11:51:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95154346A07;
	Fri,  5 Sep 2025 11:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="r62uWWWh";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="W6wzAmKE"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF3F32275E;
	Fri,  5 Sep 2025 11:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757073053; cv=none; b=ij6xlVY0zEsDM1HXFGNGrH4xILtekP1v5NWsZCSwNcJPnV3ZYiVtHl/AjX5ood/hLL9zsWZqTenF1bm/W5XhsU2IJR3GEQ/zcLoGDRKpisnx4Gzc+BybnYInZ6ZeGl7MofFm1IQbuOygrY3WNcqKXi1J2asKNZOeSgGJLkpedDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757073053; c=relaxed/simple;
	bh=tcSEN58BXjNM5vZbAs0QFk1JcSFB+ZzKPWZNLOR4fuQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u+5C0XKnXc+jcKIXXFrBGLDsSROrTKwWnkUIC9HQJi3tlLi840OuxlrqY2buFM0bInMwQFGlmesrc4hhQ6y5JcKNPikUwwY1u+7pGyw8TVq4dwtPeJyDsNCGc1JsIBOu9dDiwL1eFJ4iUpKyeVwgr8UmUrnnDm7RBsimJoH4YeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=r62uWWWh; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=W6wzAmKE; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4cJF6K5HQ3z9sps;
	Fri,  5 Sep 2025 13:50:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1757073049;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZGW/ungxqDBJW9YXMQpQD4nhCcnvrpn3JZwjvrh6Cg0=;
	b=r62uWWWhiP+/TNFM9ojD9hGOynWoFijOzN0tq8G8HZ+DH/2n3Pw/zLcSbKG1tuQh15S/4U
	vYHUt9u0M4vxS4Lq7D8jIFgpMuguuMGAPnhJw8KSZ+G6B9xywnWbwIDYMK/6KZxCREjcaD
	MKufHBi/U2WL0I1I3TjEoiiyl94sFHp+EVJVYSZ2JklUhf8m7dZ13fEFrFRyeaf1CPAvE+
	MHbJOB2FZd/rW3nFItO7Y9ArvnRYCanrtJD8CEwe8fmifsMQjjVJcFYJHcwcr/AjTRG7bp
	VPeACTxdXHSuSPuRELq2FzUw2tlmD4Gn76UvfqMVzpFVG8KyW+c3s8lg+RJGKA==
Message-ID: <82c9133b-050d-443f-afa5-31cb31c9e858@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1757073047;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZGW/ungxqDBJW9YXMQpQD4nhCcnvrpn3JZwjvrh6Cg0=;
	b=W6wzAmKEzXq3BtGTj/djFy2owFTO21A6RLHkXJCc369J1pED64e2IMAZ2sgP7OuQuRnt5r
	WHHY5XizfwW1eW/pLMK86HCW2NduJZtzCbja5jq8dHi5sggtmtnxsqYU/8D3Y32h89/f9O
	wB1widfF2KK8Tqvc82m2OEvFrVAat8IkoDTKtfAktnAFmxOvH9Hmwyjw7Hc2D2BBFeg3JP
	eLMFpRXPa4YDeq/QB4uYG2U0y8zq64tcIc+E3DmbbL/tWwN7EqTd00Ee6HMJ5AYnMSTzOZ
	cYOc13vzgnETEEBeLQIKQZPdrTtWV0z8y4JhvqwlPWw+sKx9fLkYujfpzG2f7g==
Date: Fri, 5 Sep 2025 13:50:45 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2] arm64: dts: renesas: r8a779g3: Add RPi Display 2 DTO
 to Retronix R-Car V4H Sparrow Hawk
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm
 <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20250904202838.172579-1-marek.vasut+renesas@mailbox.org>
 <CAMuHMdWnusjKE8FNQWX-0arcdbV-18KTCHKZmhs5r5kRXn46ZA@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAMuHMdWnusjKE8FNQWX-0arcdbV-18KTCHKZmhs5r5kRXn46ZA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: 3wqf1r8wd9xns1m3kdf8exxcee66ncs1
X-MBO-RS-ID: 82a828f7ef46ba3f18d

On 9/5/25 11:25 AM, Geert Uytterhoeven wrote:

Hello Geert,

>> +++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-rpi-display-2-7in.dtso
> 
>> +&i2c0_mux3 {
>> +       #address-cells = <1>;
>> +       #size-cells = <0>;
>> +
>> +       mcu: gpio@45 {
>> +               compatible = "raspberrypi,touchscreen-panel-regulator-v2";
>> +               reg = <0x45>;
>> +               gpio-controller;
>> +               #gpio-cells = <2>;
>> +               #pwm-cells = <3>;
> 
> make dtbs_check:
> 
>      arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-rpi-display-2-5in.dtb:
> gpio@45 (raspberrypi,touchscreen-panel-regulator-v2): '#gpio-cells',
> '#pwm-cells', 'gpio-controller' do not match any of the regexes:
> '^pinctrl-[0-9]+$'
>              from schema $id:
> http://devicetree.org/schemas/regulator/raspberrypi,7inch-touchscreen-panel-regulator.yaml#
> 
> I noticed you posted patches to fix all other issues in DT bindings
> triggered by this series, so I assume you just forgot to post the
> fixes for this one (which you authored ;-)?
I think the following patch handles this:

[PATCH] regulator: dt-bindings: rpi-panel: Split 7" Raspberry Pi 
720x1280 v2 binding

