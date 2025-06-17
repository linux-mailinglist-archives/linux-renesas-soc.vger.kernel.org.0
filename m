Return-Path: <linux-renesas-soc+bounces-18408-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5EA9ADBE4A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Jun 2025 02:52:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9DD713AD8A6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Jun 2025 00:52:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87CEE1465A5;
	Tue, 17 Jun 2025 00:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="CcZBDJeY";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="xsoxXZHF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B46EA13C8FF;
	Tue, 17 Jun 2025 00:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750121550; cv=none; b=d25RNy3jZAOCSma1xXazRH/CRQOXt/7JIvaZQARShJX8dPj0aKhHyLx58WdGtNFkS9yWHxf+JAe5HPOpqyFmH8O8rC0sJsHuSqsjm31SmhS9ZNr9ZlE46Tik4VQ9wNm9/5gINAXzhTb5RMLp97B8Sz/eEczVJ++twDClDzM2Zw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750121550; c=relaxed/simple;
	bh=BMeJHJZeh7nzRRAmyp5Ofwe0imxCzvXyfrCW0D2XahU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bL6mWp2No3rr+MvHyX/bxDJEZ5TuNL7F4J3oti5kXRxqS5/1ffaD8CI+WB8hnwK9Axfi5qcT4piWt2mWD1nfOvDPQY2PZmrgh+VnGD9ch1k7JLLx6JF8oROR42Wb0QyXUPXGRCMMe7uQEJ3jFKFicHGgmqHxLw66Qe5YSJFBNKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=CcZBDJeY; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=xsoxXZHF; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4bLpHZ6fCXz9sWq;
	Tue, 17 Jun 2025 02:52:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1750121547;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YgVYAUuQxNBGpksGSE7ef8CIrk0d79xyGwAbs8yQkls=;
	b=CcZBDJeY4BP03GL321ItPOuI1wf2HwjCwPafZOswgrMfVFlCFr+JAj5VmRHsYlf46eF+OM
	VMwhvmXN82IKZcyctbZRJkQ0/vKI1jsGGrcISpUo4RC+KnF8l+ARrhMM3chm6MTjGXs2o7
	BVsdLaxzG/obx+6OX0mtUnjParPLCIFYAtXZF9Xg4VS/zsHP9j3vdGMW8CQrWfK1TstaEV
	k+zbYZP3EjMHkC0iovy2beN1ZKxnJyBf3qysj9yRJa/Z4qw0X6rFX6PW8JEAYZPrh0x1ax
	Fiq461mJExgfh8t0BnfYDX6/Co4Cps9o583DSON3ZMAumQaR47grqAjPI21NMQ==
Message-ID: <4036ada7-faf8-4b23-b6ce-ade5bafbe6ba@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1750121545;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YgVYAUuQxNBGpksGSE7ef8CIrk0d79xyGwAbs8yQkls=;
	b=xsoxXZHFO40aQyD9DIJkodKMU/z+sX200Zze3DcYXB/8iPi0P+3GBNVeuRhsEImaNDuRlz
	9CAURi80b9MmeSN9GEIBkUFIFwZ6vVGj92QqAWmsEg/htMrKVP58/hX7oq1FN0LA/chEFQ
	kTAp4GCH4kDxQsqC4CDlM1OL/0U0egVvOnO4WLJLT+3owEhM0Tc6BoC1D16GX6sqVAPDQj
	1kfOtzoKqwiP0/7oi5C2zxSOgcKCf/KsM+WuH6ilYde/YeR683Aq0E3X9Sg+TX7I+eZjTM
	qBlUZYE/6J0vy/xjt1f5lmFoRE20D5mf7g7O8GEHkTXOPFx3+p0F8JBOKsrgIA==
Date: Tue, 17 Jun 2025 02:52:22 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] regulator: rpi-panel-v2: Add regulator for 7"
 Raspberry Pi 720x1280
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-rpi-kernel@lists.infradead.org
References: <20250609000748.1665219-1-marek.vasut+renesas@mailbox.org>
 <20250609000748.1665219-2-marek.vasut+renesas@mailbox.org>
 <fsihsojbs3pex6i6vag4njw27esv257nz3yuacl2bbflyfzfvx@6cc6k7tczdi7>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <fsihsojbs3pex6i6vag4njw27esv257nz3yuacl2bbflyfzfvx@6cc6k7tczdi7>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 9a510f01bb172c81bdc
X-MBO-RS-META: ihm8obj8xbenxckxjr1zogz6pack7gwp

On 6/11/25 10:30 PM, Uwe Kleine-König wrote:
> Hello Marek,

Hi,

> On Mon, Jun 09, 2025 at 02:06:42AM +0200, Marek Vasut wrote:
>> +static int rpi_panel_v2_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
>> +				  const struct pwm_state *state)
>> +{
>> +	struct regmap *regmap = pwmchip_get_drvdata(chip);
>> +	unsigned int duty;
>> +
>> +	if (state->polarity != PWM_POLARITY_NORMAL)
>> +		return -EINVAL;
>> +
>> +	if (!state->enabled)
>> +		return regmap_write(regmap, REG_PWM, 0);
> 
> I would swap these two if blocks to ensure that disable works even if
> the wrong polarity is passed.
I have now sent the conversion to waveform ops patch, so I hope that 
addresses all the topics in this feedback. Thanks!

