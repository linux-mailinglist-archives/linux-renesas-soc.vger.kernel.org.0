Return-Path: <linux-renesas-soc+bounces-22164-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B48E9B91F62
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Sep 2025 17:35:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BEE054275AB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Sep 2025 15:34:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B4A52E03FB;
	Mon, 22 Sep 2025 15:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="EbcZ8RqS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 310E42E92B4
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Sep 2025 15:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758555219; cv=none; b=a6yJqb16OqNJltS7HJSJnXN39aZvbmtzMGhPKyLvXDVI7AO8OEHqBLxQJ2akdBbtlQtcKGTvBHpW5psgxr+FfmFg21sdqpslnYNdaYlJfA2LJAHsjTBbT0teBANT/Tf5Ow+NkuCYaOB/mBq/38EMgKm3p7xvHIAQThP6Ys/DH4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758555219; c=relaxed/simple;
	bh=9GDSk+7eMD2m4olz8yNUDHsfzJO5iPrhK7AiGouP2SQ=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a1f04txMb22nPZ0N0Sn8p46Rxa4JSXbwLos5weDZ8uKqtdNRNO1pLXeLskq80jcoSY6gzpBAKHiy3NcXBJmK5SfKV4YPR1hupHQdsTpJVCrWmMYSaYHiB4CbPFKeHfzSu4Oud8Qj4uSmb13jTpZNS04xD2/AZ1Dvch4Bjpm3vXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=EbcZ8RqS; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-57d93a4b637so1551321e87.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Sep 2025 08:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1758555215; x=1759160015; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=9GDSk+7eMD2m4olz8yNUDHsfzJO5iPrhK7AiGouP2SQ=;
        b=EbcZ8RqS4mvV5MmSP0RIRTEncBjwbZHP744uU278APuleIi9lH8l/VbXf+kqOevmgM
         SHzScm36ygXeXwUT11qNhOeXs6KR+Ugfegk7vO2eSCUzSd9WAwSEgHXGrtwyeeAojEaZ
         dEkjj5GImdttddn7cX6K7yZxi2MBkN2M+ht1N7M1qh3I37jt7FaIPCtsdYqnS+IyMNQ7
         973Ir883NnIApSuoAYxUsmJ0FLrm2fRP69vDPz6LKdAihXiuVoMTByn7skf1VqU4wdqt
         cwyTeqQVSzis4elHj9vFijnySwYUIgvHqESIgC7Cgl8zSA+QOS8jHCx0lxEQWuFjwalZ
         FPig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758555215; x=1759160015;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9GDSk+7eMD2m4olz8yNUDHsfzJO5iPrhK7AiGouP2SQ=;
        b=jIA40k+iKr5y865BH3FrLpsI/QM1VgtugST4gUAxn855DW4i1jhujHmn+SHMyfrlTe
         XDKrLApJEHmXJiGF9vA3HVP3nXdOFd5nTeto9EG32kGeP76fnzkPORnVjXbrvwI2oyYb
         9au5aPDowREUMaQVTZ8/chtfDSITcBIIDullE/3qqxpGMMFfaGNBvqas09rjVsxIVpu1
         CrvYDAHOsYs77bB6HSWaV3+9SudOGvYzkmByOJErB1fGXQgwILwy9c7uOMvJk4rT8CUI
         JqLfmU0stJMz9aA3ByMYQz/YJ58QtUrHX64zhHEm4fgB5864iu520GP8DsMhjraYYQBL
         4MuA==
X-Forwarded-Encrypted: i=1; AJvYcCWZLOdlQWaI4xYv5ImlbCqukHOfO30M3iOa4laIQkXXC+JhbKFRfK0/45FAmsJ7he7g6DL1p3Tw+VXa/5jPnpk+Fg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxVADGKzYXNCjR6PevTpK/zTpmRDu8U8GiSZtk0s0S6eVdaVD1p
	ka7cqz+pejLIlZPQpMZ9CzNZilv7QXOWUIohPrb7aK9juWyew/rKOmzjAInbzj6C03TfKJqabce
	CGMBw9nv/W+ZSz2cxRRL8tbOj3WmKbScxV4MK61s3LQ==
X-Gm-Gg: ASbGncu+weHpFx7Y+tKrD9NarfQrRSe5tAQ+Ca2zpLeA7pPCU/cbrMIaPt+tdILSCoj
	HLpi7sNHPvY2AU7D6wb+luPLlvhe7ZPgbW4kMGRQpc2M/g8UKvSvZfHOPAEGw7GLOCYkz75KHJ4
	B1sRof5giHwHDSfbYCjxtsQmPZgyHV+vILgrTgnGEvLI8ZY5d/07/GQu74hi9VU84uoPQFTAylq
	hONKj3pU9h4CfOU0tFUJrU0ev+fugqsMfX+og==
X-Google-Smtp-Source: AGHT+IGlZY4kCJWeN5dqXhMVz0wVth63k88LkQRY0NMxqg5N9plQEniHvw0FL0I709EW4Ka6RI0ByvFRASCxDMR0/MQ=
X-Received: by 2002:a05:6512:799:b0:55f:49ab:884a with SMTP id
 2adb3069b0e04-579e1f43c06mr3621448e87.21.1758555215241; Mon, 22 Sep 2025
 08:33:35 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 22 Sep 2025 18:33:33 +0300
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 22 Sep 2025 18:33:33 +0300
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <20250922152640.154092-9-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250922152640.154092-1-herve.codina@bootlin.com> <20250922152640.154092-9-herve.codina@bootlin.com>
Date: Mon, 22 Sep 2025 18:33:33 +0300
X-Gm-Features: AS18NWCFatxNFArvnh5SmkTj0DfmC7GBtzmB19TRGxTfynwgSMsjCS139sdcpWc
Message-ID: <CAMRc=Mfh_6kfreC6WNFvFE2X5RZmuHfuVQK+GQ2q6Df-4kJXCQ@mail.gmail.com>
Subject: Re: [PATCH v4 8/8] ARM: dts: r9a06g032: Add support for GPIO interrupts
To: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
Cc: Phil Edworthy <phil.edworthy@renesas.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Pascal Eberhard <pascal.eberhard@se.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Hoan Tran <hoan@os.amperecomputing.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Saravana Kannan <saravanak@google.com>, Serge Semin <fancer.lancer@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 22 Sep 2025 17:26:39 +0200, "Herve Codina (Schneider
Electric)" <herve.codina@bootlin.com> said:
> In the RZ/N1 SoC, the GPIO interrupts are multiplexed using the GPIO
> Interrupt Multiplexer.
>
> Add the multiplexer node and connect GPIO interrupt lines to the
> multiplexer.
>
> The interrupt-map available in the multiplexer node has to be updated in
> dts files depending on the GPIO usage. Indeed, the usage of an interrupt
> for a GPIO is board dependent.
>
> Up to 8 GPIOs can be used as an interrupt line (one per multiplexer
> output interrupt).
>
> Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootlin.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

