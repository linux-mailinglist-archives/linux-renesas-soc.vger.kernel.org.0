Return-Path: <linux-renesas-soc+bounces-23008-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A61BD9AE2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Oct 2025 15:23:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CDDF5502055
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Oct 2025 13:22:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78902315D53;
	Tue, 14 Oct 2025 13:20:02 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE81631618B
	for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Oct 2025 13:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760448002; cv=none; b=gdgSn5+JzzMUDMZ/fNQPHEZeSZD8Ipicd2u9BF1hMBD8ykMIbehK13SYiJhiFWhB1k6eTbY0i4+W5VH4E80b/pSecc90PKNl3MPEmbyDyAdYyXnktfO5HoQmRhkDlQdCuAj952c78EzLBJLz2h3Zcz6e4by3KPbFTQ20bVwoHOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760448002; c=relaxed/simple;
	bh=aSDd+KL4NOTNpSwWZ1vV1gh67WYD6fXPWRozSjlK8ZE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U88UaEGaDCHFBnCzpD14Y8DpwoCXb3Hh9XKvJPHvI2K8Hs+wQByfrW+WzwikxRtC9S8jYy+kvJofLbbl3EnZT5ZiYb6NCheykmYUgUn3lRHXOQfXfKvudgSmdE4h0xBWPXXPfQFkkqDiq7te+IMUKM/lcDZ+iDMqeFmdBv6Xurs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-54a8f6a2d80so1763567e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Oct 2025 06:20:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760447999; x=1761052799;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Njz6v4Ye7icNa6eer5LCY0z/OUSx/xsBh5FobUmXyGU=;
        b=N9yLANQl2BcZZLPfPTnCDP9bU5me9VrZNn0AsvkoRMAg2C4+DFgNHzzJMFJ3V4+Fr4
         KpbmKhuPsh1orTFjrmG8vL6vNbDAq7IiXIFAJYenPAJRtA37umyTkzoE8dke5UEoVayA
         ar5s+Axa2sGZWL4Y2nsVfc8rG+7yf0DnV9MWFTW62GRv6CFW9jGgfmgJLkprdab4RPMz
         5rAz+4FUGrRDwjC8s0XnB0Pn7nXHqJf8V+qh/hpqHLY850suS1ynTujc5osqWQDa+nW2
         7Iw6JRtKYZvwhYtTO0ggHg4fzJkBm18fIuAiTfKA54xRWtt+xNU0INW49QY2r/chgnMm
         SKNg==
X-Forwarded-Encrypted: i=1; AJvYcCWhE0LtC+E59oTUVfDwqDuR8TcZZ2nKrdBmDscOD6Me+Je+q0KA7e+EczRY1sRVKZL77oHjTIj7pchxshAsHNYlTw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxj4IBjccAi1G7D2swbPBtoDCvAlM3/w9yGOPlnEM6z3jkf4EAB
	B/CO0YmCrEqJMg1+l2FKCoHd7xYOA+SYjVhuZWgg88UeqxQmjH/y/1/PSzvJTME3
X-Gm-Gg: ASbGncu1HXcEOeDEdWbalFgb3jxH9f2/TTqK5RuZT/quDYkvz7PllLlWrO29QI//s1R
	jft75piy+tIjy2E5PmMkblcmC67SpORAwVE54g8EoQ1BrsnRBoMXf/tmyoxktTkXDlvtU6hMNOU
	bMI10AVVcKyPDPcJbpzUlduXVL3DPrzTMp2PByzV3sgwagAVI/mLjy4PkNxG+3b77yZ8wegBBk4
	yk+FMxtNIWiBHv6K349N15EyW03Q/1AhzjJDhS9KJH5Tm7pL7K7MMbtFJqV6aKqXWmBHixsn2Fh
	44tv7fjjBXTKghdlm7lpOgi+o7YsnWpMGl7lDcFsQbUm5nUeC14TjDHiU6qIeuMXkdidFmXExlI
	G1+421KNFj6IByQQa03Zjf5qGfpasibtuK6V8fxmXdjrhHcAKtpVbdcohyt7h8ATijLrNIa0vAg
	+2kH+/MH4=
X-Google-Smtp-Source: AGHT+IHSnvQI6+aNONxZaZyfU91KfLqboGgwVCV0J0XX1f09VqnMtXIpqQ07an/O5YfOpE6LIt7iJQ==
X-Received: by 2002:a05:6122:3c8e:b0:552:2c5a:c057 with SMTP id 71dfb90a1353d-554b8c06316mr8212720e0c.13.1760447999239;
        Tue, 14 Oct 2025 06:19:59 -0700 (PDT)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-554d81148c6sm4000624e0c.26.2025.10.14.06.19.58
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 06:19:58 -0700 (PDT)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-5d6266f1a33so672754137.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Oct 2025 06:19:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVVWS+CbPhFwjukpLEuoTnm3ysVK45DVR5vYE+NP2AkWnBe2MVezxaBM0ZSaGgJuEpfVRKz+u42Os3ABlZHXWp0Qg==@vger.kernel.org
X-Received: by 2002:a05:6102:6ca:b0:5d5:f6ae:38de with SMTP id
 ada2fe7eead31-5d5f6ae3c7cmr5745861137.41.1760447998299; Tue, 14 Oct 2025
 06:19:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250918104009.94754-1-herve.codina@bootlin.com> <20250918104009.94754-8-herve.codina@bootlin.com>
In-Reply-To: <20250918104009.94754-8-herve.codina@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 14 Oct 2025 15:19:46 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWNErzjfqXXgJZOn2viPYmGeuJekY_WLDeK6vzYZzdJmA@mail.gmail.com>
X-Gm-Features: AS18NWCbANtqchYIwTz4iekVik6u-ZIED4wJm4rfdVFvh3ZW_Tu4x1cmyNlu-78
Message-ID: <CAMuHMdWNErzjfqXXgJZOn2viPYmGeuJekY_WLDeK6vzYZzdJmA@mail.gmail.com>
Subject: Re: [PATCH v3 7/8] soc: renesas: Add support for Renesas RZ/N1 GPIO
 Interrupt Multiplexer
To: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Hoan Tran <hoan@os.amperecomputing.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Saravana Kannan <saravanak@google.com>, Serge Semin <fancer.lancer@gmail.com>, 
	Phil Edworthy <phil.edworthy@renesas.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Pascal Eberhard <pascal.eberhard@se.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Herv=C3=A9,

On Thu, 18 Sept 2025 at 12:40, Herve Codina (Schneider Electric)
<herve.codina@bootlin.com> wrote:
> On the Renesas RZ/N1 SoC, GPIOs can generate interruptions. Those
> interruption lines are multiplexed by the GPIO Interrupt Multiplexer in
> order to map 32 * 3 GPIO interrupt lines to 8 GIC interrupt lines.
>
> The GPIO interrupt multiplexer IP does nothing but select 8 GPIO
> IRQ lines out of the 96 available to wire them to the GIC input lines.
>
> Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootlin.co=
m>

Thanks for your patch!

> --- /dev/null
> +++ b/drivers/soc/renesas/rzn1_irqmux.c

> +static const struct of_device_id irqmux_of_match[] =3D {
> +       { .compatible =3D "renesas,rzn1-gpioirqmux", },
> +       { /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, irq_mux_of_match);
                           ^^^^^^^^^^^^^^^^
                           irqmux_of_match

Interestingly, this built fine for me before, presumably until commit
5ab23c7923a1d2ae ("modpost: Create modalias for builtin modules")
in v6.18-rc1.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

