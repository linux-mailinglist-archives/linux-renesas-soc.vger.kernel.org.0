Return-Path: <linux-renesas-soc+bounces-24712-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 72134C693AD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Nov 2025 13:00:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4D63E4F5426
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Nov 2025 11:55:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 359DA351FA3;
	Tue, 18 Nov 2025 11:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="UtYCYypw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A497B311C3C
	for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Nov 2025 11:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763466931; cv=none; b=XExB7sOaAT7yDoZtfHOwH4/RY/awFV6Qrx2S/xgBcfrKC48d8P0N9fIYlDRicOkRdbsbSWxnSttVlLy2RFR23XtXrv8y3ZX45WJJrwQ4N9kXmzMg30tfmZUzLktzxdVVzF1Ikwu5pOV17D1elyD65m+tMy9Lrqnsx2Iq/Fir1uM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763466931; c=relaxed/simple;
	bh=7NvckXgOmhlaS1luLens2/AyeapQUcV0Gd0X3q3WZcg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kj4d3j1IxHqx8XGe1xq94oOWLBM+bJtwxrNZ4F5k5vb/kuIwcmxKaPLsgRCEbZFyHyblHoORzr9Z33CorjEZ/JRDu2YjFvH6BsRam6bQRKKAyHVvWrab0uexFnOZ9riEnBahe4X/oGi+2uM6pI+kUnqWEFhCnqyiF/p8s1L4Xwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=UtYCYypw; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-59583505988so6025369e87.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Nov 2025 03:55:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763466927; x=1764071727; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VAcO7q7zqxgeS0imixs883Z4+k4vz8bf0wnP3745THQ=;
        b=UtYCYypwKX2vwCHE0aQLMgCKqnlbea2mYh2WQaXJX1iyr/KL1mPdzCvgDRlbhmnjU2
         zuVmPhTJvW08YjM3PFqfRcqS8/z8DSsdBtvQK11FR+XFNYvxmLdyl+N+Ls63ipWW3VFb
         zj2SmgsiIT7/gFD892SvB75Jlu50EbFpt7Tl3SOo5EGdpeJuWywqClc0jJWZv178ovKN
         1hriMWUqmTY0ioe+wbc7rVAtGPE5wRer1T3ZFmxnGvdalOVNZSnuZBV++UV4uzzhyw4Y
         4pgU5rlGgVnteDncijVNCslFluga9yNZPjzY3GQPwe5VwQMa9nRBKewzwp/2xyKLpb9R
         5ACg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763466927; x=1764071727;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VAcO7q7zqxgeS0imixs883Z4+k4vz8bf0wnP3745THQ=;
        b=I8glYATbzpG5NwH76xicOd4b+K47MAMr99q0hg6QYhWPf097RhNoePtLBDo4v9/dDJ
         m76WM6NWm0UJRFzXnRrds+coVhd0JRbfG4+RggwcGYxKP7jSTi6Rjx5PAWGyO6HC03Z+
         wPPukb9TawHpRq10spcwlAM4rODmHie0uHtonsTecGEzSOS1PE/ISs/KA94SlB8Gpwvm
         IF9ezwHBYSZhJnV+4j/4oh8r35/oYKKUvS6cQX4VIDTtDGUkYMGxe0vZ7Alm4MzNVRkk
         4aZN1wxJoWDZSHT0tg7Q22W5RoOEwCXyFRYDAH18cpBvdDApgClKVXl6S4qcYq65lgN1
         A0+w==
X-Forwarded-Encrypted: i=1; AJvYcCV8KiADBjgfdMhbL01sSxT+lL3cAdgdHahc4DCIxmkoAl7JLHr8wnMPZ4+/UJFJDdn6AMRnisO8u1wx4Mjr0tvinw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzmckoyVw3jBf2WGyWRC2AS9yeu9cZE4PiO07AbHl9aPmBNw2Jf
	La4M1mlLGodYTIJmuXgiOKyObZtL/kTQDC9bfyKcSgCekBavig32PKWOH53sntp7DsuWzEXWx6t
	ZvklqGQrnKHWMFQkIT1w1NAqLaPb++fFHMYTBAmNnjA==
X-Gm-Gg: ASbGncvllsaD1/G6ugJ/UVCLBtJv3wzHdKUDGlXBGPftYvuop9h5Sh/+KFYt8k4hvZL
	1iTzQpZVGDyXbbr33/lPTJrWbEzbXBnaJvK8jkDonPtLdFob3t+TIekdmIP9h0lU/8kN5cBARcn
	t71kyD+Jcp40nSxqTOHE5jYp2DYMHQcUeKDpYkY/ZgouLF3MgLaOUUNDbzZorx1iXytP5ZYI3z+
	Cr8NL6d7ondo7TGhrm31ZkJb4wOPFETD1gWoEyoBGCRdizc+atnr4w+Qct+0n2Ng2jVa9qzKUG8
	9E444ObDYxVssk1MxhnofncH5VIDY77pSiYOarrS7SX1gNE=
X-Google-Smtp-Source: AGHT+IGDj1fu8TGEfRae1dCaea+bpUY0Apdk1ZxozSAuzubtr5iVRx8MiJ8vS3jXjFPu3bh5BDU2zV53DZhLtQaNGVE=
X-Received: by 2002:a05:6512:b86:b0:594:2cf5:22be with SMTP id
 2adb3069b0e04-5959874bce8mr962524e87.8.1763466926615; Tue, 18 Nov 2025
 03:55:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org> <CAMuHMdVR9Z70+M-SqHYrHiC6H_yw=VRuDOOg=YnXSNKjPnx3WQ@mail.gmail.com>
In-Reply-To: <CAMuHMdVR9Z70+M-SqHYrHiC6H_yw=VRuDOOg=YnXSNKjPnx3WQ@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 18 Nov 2025 12:55:13 +0100
X-Gm-Features: AWmQ_bl_VSi2dixCvr3uCiITk7ZJGEZEI2dpEDQt1kKit_562qgby4AFxFkY8D0
Message-ID: <CAMRc=Mdo__Yzigqoy4xKt0LWSvES5Jse1HeXkePfhiWyiz6tBQ@mail.gmail.com>
Subject: Re: [PATCH v4 00/10] gpio: improve support for shared GPIOs
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Alexey Klimov <alexey.klimov@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 18, 2025 at 12:16=E2=80=AFPM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Bartosz,
>
> On Wed, 12 Nov 2025 at 15:05, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > Bjorn, Konrad: I should have Cc'ed you on v1 but I just went with what
> > came out of b4 --auto-to-cc. It only gave me arm-msm. :( Patch 7 from
> > this series however impacts Qualcomm platforms. It's a runtime dependen=
cy
> > of patches 8 and 9. Would you mind Acking it so that I can take it into
> > an immutable branch that I'll make available to Mark Brown for him to
> > take patches 8-10 through the ASoC and regulator trees for v6.19?
> >
> > Problem statement: GPIOs are implemented as a strictly exclusive
> > resource in the kernel but there are lots of platforms on which single
> > pin is shared by multiple devices which don't communicate so need some
> > way of properly sharing access to a GPIO. What we have now is the
> > GPIOD_FLAGS_BIT_NONEXCLUSIVE flag which was introduced as a hack and
> > doesn't do any locking or arbitration of access - it literally just han=
d
> > the same GPIO descriptor to all interested users.
> >
> > The proposed solution is composed of three major parts: the high-level,
> > shared GPIO proxy driver that arbitrates access to the shared pin and
> > exposes a regular GPIO chip interface to consumers, a low-level shared
> > GPIOLIB module that scans firmware nodes and creates auxiliary devices
> > that attach to the proxy driver and finally a set of core GPIOLIB
> > changes that plug the former into the GPIO lookup path.
> >
> > The changes are implemented in a way that allows to seamlessly compile
> > out any code related to sharing GPIOs for systems that don't need it.
> >
> > The practical use-case for this are the powerdown GPIOs shared by
> > speakers on Qualcomm db845c platform, however I have also extensively
> > tested it using gpio-virtuser on arm64 qemu with various DT
> > configurations.
>
> Thanks for your series, part of which is now present linux-next.
> IIUIC, this requires the direction of the GPIO to be fixed?
>
> We have a long-standing use-case on various Renesas R-Car Gen3 boards
> (e.g. Salvator-X(S) and ULCB[1]), where GPIOs are shared by LEDs and
> key switches.  Basically, the GPIO is connected to:
>   1. A key switch connecting to GND when closed, with pull-up.
>   2. The gate of an N-channel MOSFET, turning on an LED when driven
>      high.
>
> Hence:
>   - In output mode, the LED can be controlled freely,
>   - In input mode, the LED is on, unless the key is pressed,
>   - Hence the switch state can only be read when the LED is turned on.
> If you have any idea how to handle this, feel free to reply ;-)
>
> Thanks!
>

How is this done currently? Even without this series and using the
GPIOD_FLAGS_BIT_NONEXCLUSIVE, the descriptor has a well-defined
direction so it's not possible for two drivers to request it as input
and output simultaneously. The second requester will override the
previous settings.

Bart

