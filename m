Return-Path: <linux-renesas-soc+bounces-19535-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E5530B0304B
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 13 Jul 2025 10:49:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 00715189B974
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 13 Jul 2025 08:50:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA68426B956;
	Sun, 13 Jul 2025 08:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="DQsZjoHm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3EA1E5701
	for <linux-renesas-soc@vger.kernel.org>; Sun, 13 Jul 2025 08:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752396581; cv=none; b=l4gxmBb9c0r8L/mSGIVyM8cZoRKYOm5+SNJFOpYEfVjjVt2UnKqtjuCldYLKfnF37pQSA6w12sVYHw8EEbUj4wautiA8D7TP40NveRN+RwfAOqtBxPGDASwxfODjVGQ8RXvzgxIkJz84WbY6KVXky6/fWpErVOLjRUuE2ow/fek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752396581; c=relaxed/simple;
	bh=cV/NDwp/sNmpTSnX+YcZxa/+NKwprOpcCeD5lvtK6q0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G5Xgtr54uqBe6XWjB/uB7gpq6+bGemYpjt2SC2wg6YduvWLGpwm5C1ukA4oWglOdyEDs+9S/17dWenoQ7VwOIJY3LJHvaB9bWPJe/tMsj/7IhCdQpqozAC8L/eFiAR9Zfm2x2X/jcyumqvbkxvbXoZNutbfPOJzjCr3EO9PqfYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=DQsZjoHm; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-54b10594812so3377523e87.1
        for <linux-renesas-soc@vger.kernel.org>; Sun, 13 Jul 2025 01:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752396578; x=1753001378; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i68FJiG6+f1ETXgbeYCotuF64Qw8JxOf1zX940i2cSU=;
        b=DQsZjoHmVwV9MmKt7CfHZxdRcawgETMhaxaLPPte9pzg0WJ2HLeOhB9IVZmBKetjqk
         tomUXCW92R25h77mTh5r4xnEaHZFVwlrEjTa+MWQl1OtBr9d9gIjzA3Fg2iPIDD43n0f
         zXxSDfZXEXAbwoET2it2fvkNRN9z46eBDkVzq2QE20fXzwKBJwNnMw2Wg4hOjBQAe8ZA
         bXVp4ABKuzwBx2UFZhMNo6rx9W6sSwCn/JHagH6KGcM/zLn4Bk3PlFfbl4A+YR6QQrB0
         IaEhLBN+59p6f8QQUF9MTy6qqxDjWTYMwQHUy445FOxg0T16rlvGDFC/XawgyjwLcGp7
         mU6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752396578; x=1753001378;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i68FJiG6+f1ETXgbeYCotuF64Qw8JxOf1zX940i2cSU=;
        b=GscWgBtMZGcD6QZLg0SwptTEhojGn3z4m0IWfQyR4FJikehqxQzLcZMMdE3To4hzqe
         HGjcBfMXz/B6QF6IJY8YUFMSLpYRNYwaJdrQzxjEfDQej3A0vvffnZ+mj5fOgA9+/L06
         GBXYjhuVNJ2D1OrcOsUypCFiu5XnNB504wrsGNHu6aKXYN03Dj8s67JVCRsxmMdyq5IP
         Lwymeaz/HzmuyIPsIxHTAJO8AUEEl7bTGGIryEz3SnjcC1DLTZTBAKis6+2MXSHkVUAI
         N+od6Q86u7mYoBK0tqJn5ZUH50GZDFr4VU+vixkXEcXP7DABLEyBDZ70ujaHHjTte3Rx
         ycfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCwFmiyvxqFosm0bd4Muu1ie2fCMB8m3dV68ByCebmot6MpyJSnGrsWOjt6xEJC/sDAmsiiJ6Tb1TBol6LWT0MMA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yws2c9wSEkHprf3jYc/GZON9fCvE5XQ3XLuOmqvkwUbIBnMlUcl
	5oHTxWUBAMj73Di8dZRKM3583uHixRWztVOkjHS/vpYl4U6VZTrBJ9T/MYU/jN/ODCVcWfqCl4k
	b1WOlzqeZWUuST4XldDCASGN8Ea1NfaUWBZ/SINiaHg==
X-Gm-Gg: ASbGncsaAJzT6VKc1Vybd9r8n/dqNaIafGJgNFFXwGFVmTDrO0HuSIRdm0/WtJsG9ei
	VSuWa+x/m5xPKiGIfDr2hfqs9jFaihWfYCRh4vMPFb2T7RI+eoWmsX8MF/uLZcnRBmBPYVAO2Xy
	P/jea12P8GniO7edaF8blIp+Xr7oiwwbQQLB8JEL34eV8q9unnqjRc/OIUZAZHGY/tOw3z8iuHV
	Jpj9BOnOErT5Bk/xoby2Xi+F5pOLIRL26zW3jROL4Nk2u95Eg==
X-Google-Smtp-Source: AGHT+IHSVlR3f84ykKc18xLN16yOuI1UBS+R1HGXkNcrI5d6VuncH7GOy5up7ZkTvuUg5ocaceSyWG2pJHHAQMTtfQA=
X-Received: by 2002:a05:6512:6cd:b0:553:2355:1f26 with SMTP id
 2adb3069b0e04-55a0463d16fmr3003378e87.50.1752396578149; Sun, 13 Jul 2025
 01:49:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610-gpiochip-set-rv-soc-v1-0-1a0c36c9deed@linaro.org> <20250610-gpiochip-set-rv-soc-v1-1-1a0c36c9deed@linaro.org>
In-Reply-To: <20250610-gpiochip-set-rv-soc-v1-1-1a0c36c9deed@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Sun, 13 Jul 2025 10:49:27 +0200
X-Gm-Features: Ac12FXyhZJT7lfbn0I6DoUYvpi_8wvzLxArloCSn9kbjMpsbWPmC7MSTvAUWCwE
Message-ID: <CAMRc=Mc1UyWgWwUFVGw=1EVJb1u4MQYUKcguiQedmbxTK6pY1w@mail.gmail.com>
Subject: Re: [PATCH 1/2] soc: fsl: qe: use new GPIO line value setter callbacks
To: Qiang Zhao <qiang.zhao@nxp.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 2:38=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/soc/fsl/qe/gpio.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/soc/fsl/qe/gpio.c b/drivers/soc/fsl/qe/gpio.c
> index 3ef24ba0245b75471ffa10f579bb744c0c3b7e43..5391cce4e6efe6d120db7fdf7=
509dc5eb840f344 100644
> --- a/drivers/soc/fsl/qe/gpio.c
> +++ b/drivers/soc/fsl/qe/gpio.c
> @@ -57,7 +57,7 @@ static int qe_gpio_get(struct gpio_chip *gc, unsigned i=
nt gpio)
>         return !!(ioread32be(&regs->cpdata) & pin_mask);
>  }
>
> -static void qe_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val=
)
> +static int qe_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
>  {
>         struct of_mm_gpio_chip *mm_gc =3D to_of_mm_gpio_chip(gc);
>         struct qe_gpio_chip *qe_gc =3D gpiochip_get_data(gc);
> @@ -75,6 +75,8 @@ static void qe_gpio_set(struct gpio_chip *gc, unsigned =
int gpio, int val)
>         iowrite32be(qe_gc->cpdata, &regs->cpdata);
>
>         spin_unlock_irqrestore(&qe_gc->lock, flags);
> +
> +       return 0;
>  }
>
>  static void qe_gpio_set_multiple(struct gpio_chip *gc,
> @@ -317,7 +319,7 @@ static int __init qe_add_gpiochips(void)
>                 gc->direction_input =3D qe_gpio_dir_in;
>                 gc->direction_output =3D qe_gpio_dir_out;
>                 gc->get =3D qe_gpio_get;
> -               gc->set =3D qe_gpio_set;
> +               gc->set_rv =3D qe_gpio_set;
>                 gc->set_multiple =3D qe_gpio_set_multiple;
>
>                 ret =3D of_mm_gpiochip_add_data(np, mm_gc, qe_gc);
>
> --
> 2.48.1
>

Christophe: let me reping you here as there's no reason for this
relatively trivial patch to miss the upcoming merge window. Do you
have any objections to me queueing it via the GPIO tree?

Bartosz

