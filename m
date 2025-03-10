Return-Path: <linux-renesas-soc+bounces-14225-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B39CA59622
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Mar 2025 14:23:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 59DE21890BAC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Mar 2025 13:23:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C81F22AE7E;
	Mon, 10 Mar 2025 13:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Vz+qn6jX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 000CF22AE7F
	for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Mar 2025 13:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741612965; cv=none; b=S9YRAWfdO4JZjuE9fPEvP5B+5PTrw2gOtq3JzMU/iiSlD/lceKkCqq1PmvD8CBO1K3I1o+jzeOH1w2stzXYX8Bq/Mtb7G4FTvc9ss0DeMDsVRm7uwyhA0ZgC6ki2ipj//Io1a5YRxSK2rCgZwVpwzTVeGrwzhxK4xkXRKMTbs+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741612965; c=relaxed/simple;
	bh=DPKb8ThpUtf/tZId/Di1QGFds3FHv0BZjzDL63AUYKA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u8WhmERjyvnrSBvcj0hMwaAXdAQNo9rCvh1ousrR7spIClKLzvacpqEKDw+s+gO5YTqtWjDyk+C04rVk26vPFqDhnDNrC0KTe5zWmaY/NZthtqdVKNqJG4PjWCw8TwaskTj7iOjdHybSXr1pfjFjN/Nzlc0D9Gnc8nL7Oe0I9R8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Vz+qn6jX; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-30613802a04so47560611fa.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Mar 2025 06:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741612961; x=1742217761; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BIR94qx8xpSJrcrgyo8EcRbXb4tKFO0K352zXBNzI/Q=;
        b=Vz+qn6jXUoH0dwlwtlJsM/oxic8bB7UUO0LC2g4VJ1mDUGgmJBCTY1XsZxAWfWkkc7
         U8gXFUdVQeEuBr3TdBy1a1jQT8/dK4bDdI+RQ40ZG4xogl/S5s0zTqzVhCUg/+3N/xcL
         f65qFxW69HUKA19A2YE9B3B+qEZAbwn64BUj54AYkzLIvMLiQZgJkjeEL2r6rP1yIKUo
         OXNd9yZaod8dwVZlSrliQdIJajhAvdHq26HIn0DY8X0aRt95XG+bfbW9/qytrmUlCeT/
         oAwXm+OdVJ6V9sZeWtnyZPWc0gA7xTi+n+LQe4LZfH3q0DCY+kNes/4YZuvv9tgF7SI0
         /0hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741612961; x=1742217761;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BIR94qx8xpSJrcrgyo8EcRbXb4tKFO0K352zXBNzI/Q=;
        b=WrZ7TYkGXgQvSuGOMrGRvjMn5MzPV5R9JnMRWHQ4lVMg6/EcevA99xL2sOAyXfmUav
         ikTFOvMpPSCJ053KCLd7OyU4i8avszwqBkXYM8J3B6mxCOv9sd1WMRVGWDIrHYoiGw6B
         lyWiHHGCxGHkymBoZyQFnEanJ5Uf4GY7z39dlXCU8/9vx/BoQcv7zNuZUj9FeOY54tL3
         M/nqDAzs4+uyBH18adcvKFzXC6R57OJwCK0Aq+U+hauvYZM7G4atXrx1kWHAPdtaa3PU
         8MVrq/6CLH5Moi/34qQgl6e4sj/XBki8yz29Iitwj1xLptglOdUiN2IR3kzs1sSz1D6U
         ThWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdnp+JcCtWwLfMpPy+BPnpbk3U457SONrwdo8R3jj/Mcw7EBCGekzvoyqESgsW+MV0Vjk9U5sajHNji9he2D8RQw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxRXlLp3KVYtTP6khCXqV3HRvtquWNr6zb36/qwRho8kbl+5gsk
	hqAE90cEipUhMeZ1GzCRsmiNeDj/h+ib/uFAFQtY1cZUjj7w6i/Ex+XSKlbolmECXjaF44aR/Jv
	73A+P6M0ytHM5nB3yuIqsp/lP8jiIeK068JuSsg==
X-Gm-Gg: ASbGncuki1Xdvg9A1ZalcCZ2mfgLPju78zy2FHSCrVn+4nmeE3D/EHgAyF7Jo0sUBL9
	mzpUF/IRPK/RBphJxweuC99kVbnyS5FkWyaZqWJ/xdqD0g57QYrloznQ3Pv6pX/HyiSGSFAK3/9
	6jxaLcFx2NLjRs91mnYSOXCkphOyJKfP3ssG1G5iJvhSB2zH1/DbIV4RvMXw==
X-Google-Smtp-Source: AGHT+IEt6orrR0LbnqijRHsXsXIoP9u4govV2U4kennnDAB8LKxqgLR624RGe5IQ9d0SgevP43EOtHRqT3+K9YyJF4I=
X-Received: by 2002:a05:6512:3b14:b0:545:2c2c:5802 with SMTP id
 2adb3069b0e04-54990ec1da0mr4456748e87.48.1741612960898; Mon, 10 Mar 2025
 06:22:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250310-gpiochip-set-conversion-v1-0-03798bb833eb@linaro.org>
 <20250310-gpiochip-set-conversion-v1-4-03798bb833eb@linaro.org> <475375c9-9d72-4583-a21e-37b17c6b8c46@gmail.com>
In-Reply-To: <475375c9-9d72-4583-a21e-37b17c6b8c46@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 10 Mar 2025 14:22:29 +0100
X-Gm-Features: AQ5f1Jr6exc6jnbdN8OgJKfOfnFqkqPylc587CtLf_MV91ith_zm5SakUGtCL8Q
Message-ID: <CAMRc=MfofTMnfCYenUTstWUeGN5RYzJTrg2nGSzCe8tdBMksmw@mail.gmail.com>
Subject: Re: [PATCH 04/15] gpio: bd71828: use new line value setter callbacks
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Ray Jui <rjui@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Marek Vasut <marek.vasut+renesas@gmail.com>, 
	Michael Buesch <m@bues.ch>, Thomas Richard <thomas.richard@bootlin.com>, 
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Andy Shevchenko <andy@kernel.org>, 
	Support Opensource <support.opensource@diasemi.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	chrome-platform@lists.linux.dev, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 10, 2025 at 2:20=E2=80=AFPM Matti Vaittinen
<mazziesaccount@gmail.com> wrote:
>
> > @@ -28,12 +27,10 @@ static void bd71828_gpio_set(struct gpio_chip *chip=
, unsigned int offset,
> >        * we are dealing with - then we are done
> >        */
> >       if (offset =3D=3D HALL_GPIO_OFFSET)
> > -             return;
> > +             return 0;
>
> Should this be -EINVAL (or, can this check be just dropped?) Value of an
> input pin is tried to be set.
>

I don't want to break existing users but I did notice that and figured
that we should rather check this in core GPIO code not each individual
driver.

I put that on my TODO list.

Bart

