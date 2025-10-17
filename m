Return-Path: <linux-renesas-soc+bounces-23201-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AFDBBE6E95
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Oct 2025 09:20:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 86F341A64FC9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Oct 2025 07:20:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64C37242D72;
	Fri, 17 Oct 2025 07:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="h/8ed2y5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E4823EA84;
	Fri, 17 Oct 2025 07:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760685615; cv=none; b=HJrTt5LIqF7Sq41/vd44UTYMS4onobsEoNCYtd5YPQVnu8KS5Gx2mkwX0OlFufTlUWE0D7v4SD44rDV5AP/Ifc2t48jW1d1OUtW0GukOJRMqt+yzaQP9gCt5xfTA1QxjNxNJO/ClKOOKY4UVtZgsAt21BtvsdZDHM8jXsK+Ko+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760685615; c=relaxed/simple;
	bh=HXX0/37stiErNT7VNDt6pFF4lGDbSDSS7WuXjl3ZtLQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hOmOPkMdfmi7snVmJa7+UiriVbYNrij9/Ex4zJbQ96smqKSvOzRVjl0IeyOJqD08RLCJsWnSmMP7UChEqx2SlHH+N3tUQNczv2aOzmP/Rh4ftixSc3+RsBN3XKJ1yO9czaTqrVFuYU7dKuL+ghC5pSnOXQ5e70kk9PX6nLPBqPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=h/8ed2y5; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id CE8DA1A1461;
	Fri, 17 Oct 2025 07:20:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A1A83606DB;
	Fri, 17 Oct 2025 07:20:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0B549102F22FF;
	Fri, 17 Oct 2025 09:20:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760685609; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=rPwgQwOEbmECpvf2nrCLqVNNoa0+FAgD6K8XsAcWgq4=;
	b=h/8ed2y5yQEizZbD8esXrBpgqBXhFmiLgBWEIswUEVVHRwN7nO+AQXkfTC2rveQuTI73Ww
	X5n60Z+Zi4xaO37JnOfqa8wGp0mnd1RMHqYsUt2t7323nQBnSckPWYRmYsbis97AI/Vafp
	70eqAD8aCXf9WAwWIEUNmIBveBNVrzoGriZ9u6NBL6dvNmgH1PGzCB5fZACX3Er7c+zC8c
	+OWlvpTTFlozakJ7sTdQmAaIfv+htw3Yj2wufLCRfUxK07U4VMMWOPHUlunCgbvBiV7R+m
	053o01v9mAU0pMJI2dq2el9DLVmmzTyO9Uc8GdsrOJ2pQ2U09pjgpzLCrngI8A==
Date: Fri, 17 Oct 2025 09:20:00 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, Jonathan Cameron
 <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, Nuno
 =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Liam
 Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 linux-iio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Pascal Eberhard
 <pascal.eberhard@se.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 1/4] dt-bindings: iio: adc: Add the Renesas RZ/N1 ADC
Message-ID: <20251017092000.53b467d3@bootlin.com>
In-Reply-To: <57def480-6f42-4f84-a9ff-3452520b3c3f@kernel.org>
References: <20251015142816.1274605-1-herve.codina@bootlin.com>
	<20251015142816.1274605-2-herve.codina@bootlin.com>
	<57def480-6f42-4f84-a9ff-3452520b3c3f@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Krzysztof,

On Thu, 16 Oct 2025 17:49:33 +0200
Krzysztof Kozlowski <krzk@kernel.org> wrote:

> On 15/10/2025 16:28, Herve Codina (Schneider Electric) wrote:
> > +  clocks:
> > +    items:
> > +      - description: APB internal bus clock
> > +      - description: ADC clock
> > +
> > +  clock-names:
> > +    items:
> > +      - const: pclk
> > +      - const: adc-clk  
> 
> Just 'adc'
> 
> clk is redundant

Ok, will be update.

...

> > +
> > +additionalProperties: false  
> 
> This goes just before example

Ok, will be update

> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - clock-names
> > +  - power-domains
> > +  - '#io-channel-cells'
> > +
> > +dependencies:
> > +  # None or both adc1-avdd-supply / adc1-vref-supply should be present
> > +  adc1-avdd-supply: [ adc1-vref-supply ]
> > +  adc1-vref-supply: [ adc1-avdd-supply ]
> > +  # None or both adc2-avdd-supply / adc2-vref-supply should be present
> > +  adc2-avdd-supply: [ adc2-vref-supply ]
> > +  adc2-vref-supply: [ adc2-avdd-supply ]  
> 
> Above seems unnecessary. The anyOf below should already enforce that, no?

Yes, I will remove the above dependencies and keep only the anyOf.

> 
> > +
> > +# At least one of avvd/vref supplies
> > +anyOf:
> > +  - required:
> > +      - adc1-vref-supply
> > +      - adc1-avdd-supply
> > +  - required:
> > +      - adc2-vref-supply
> > +      - adc2-avdd-supply
> > +  
> 

Best regards,
Hervé

