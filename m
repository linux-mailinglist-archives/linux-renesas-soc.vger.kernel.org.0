Return-Path: <linux-renesas-soc+bounces-19025-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3A6AF137B
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Jul 2025 13:17:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 69A9A3B5325
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Jul 2025 11:16:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C03F5264609;
	Wed,  2 Jul 2025 11:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cinJtd5W"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE6552620D5;
	Wed,  2 Jul 2025 11:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751455003; cv=none; b=ZWvIlkyQM1WOUp5fJVeyi5dH+rKm7YdzoqdAih2gi1c3DYd0SYoXsPZDrbwP2FSVhs0oMY0amlld5g4XBiNtgBM9wAuLN+g8FJz0uo8LncNtE/n28nmdPRTTTnK2fwdP77Z73F/SGlXFmzowIl6YRhIMViudcoh5X6gy4Wn1fKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751455003; c=relaxed/simple;
	bh=iai0tW//mVRNAaFjjMnCpnaKmwhfswFybX05OfYaVN4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qa3Tz6nLQ61ilSva4eYqC1aHuejoI6gZgbBfjeBaiaYRKVLAiV27Mfb0r5i7ZMUAgciDuojJEYRf6nRdAg/ckAWLy+oh6NtObDzjJqIppK5Zzr3MD6wPrXLY0V2M1GRhdcLQ9YJV4OAJhm9q/JKwH28p7l6qfb3ys4SR8bmz7MI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cinJtd5W; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-453643020bdso58137615e9.1;
        Wed, 02 Jul 2025 04:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751455000; x=1752059800; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=549RYgSqBKWypR35lL4+7WsRiiZbDOpf2dghVsPGmpY=;
        b=cinJtd5WaVCtDTZ011LM8TWoc/p3qFiro//4Eda/f1QqMs/JSvhrC1Nj6tf6jXLeHC
         4+SPETwi/Dv6L78QqXwIZavuDGRESoHN2B2VFU+kaq4yDSOLAETzAeWhJIs7h4YtHFqC
         cxSvEy7OJrKyfK3KjyW0cjQSKfJZdVh4Ynj7CWE6s2RD/ef8LKIrh+B4flBJA8FcgqKN
         1l3NOognVJ96oJzZuAJItE9/apuMcLedKrVzXhBxCcsoSZZ0WEWmxSMldTF3lhWiURI9
         xc2259kwh8mbIHvpjMmApsgep81hsUq9LG7YXPF1KY6znG0j2oSOK2ejkqE6wSI5bkFJ
         a4ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751455000; x=1752059800;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=549RYgSqBKWypR35lL4+7WsRiiZbDOpf2dghVsPGmpY=;
        b=MsS24RrNBbKhgkTDpTfLiqyZbvq5UkVrezjXL5zf06BqCZHR5cdpY4F94DzITJWdaJ
         CONePv5wEVZc9IkUYBb+QeThvRyRqrdSTb8BVymANq2y6oNgA9b0bS1cIvXJ0a9SURGd
         6tb1lCeRrHLwECl4rH3v4eUS3VnXYOz53JbmXuJG4mIpqdKFfMrTMqkPjpksSqW4o0XE
         mio8U/LmZ9MZy1J8xXLn6pvhc7HrG1Ak9mqq/w63aBonFNo/BU6Mu1zAruIRWPgRf8Fz
         2BMO+62N0X9kCJKvciePpNlr9Kcn+yzOi4SocS7MH53CA7DdBO7Ga/Tn3vhCTqwHsMBt
         tCYw==
X-Forwarded-Encrypted: i=1; AJvYcCV1mtDbCvn7nXKo2jp15ctZr1gAMEysNJnuAb+4sei2zbuQGziP5qodyi9r5geVzEWgRbKybweqpfIT@vger.kernel.org, AJvYcCVjLpwKt4wWKwHtISflVyiguP/atBkF5lHCOgmpOFze+l2IfjbvYLEbB8FkJvz4cEK46+gENXl8Adjuv1Pz@vger.kernel.org, AJvYcCWJDwfSBKp01wFRXVIlBHh+8sMrhaChgI4W7tsil6aJZjSwyEIAW/pod9uHEDX19AEFLcP6lLVx8qg0fs7sej9bVlk=@vger.kernel.org, AJvYcCWTDmOh0aPCk7i/sI5I0uAhI1XifmMoAtmtpXLgf01ri1aLB/1WSeIbV9BC2O7+Dj0vfmlsLsT7Y/q0@vger.kernel.org, AJvYcCXOBH19+uYvcm3gk4ktZPVavvtQDpqJcM015WMoP+hdCFpIEny3Q3mFS1KtrNhv53Ur8xiZ5HCD@vger.kernel.org
X-Gm-Message-State: AOJu0YwhxKnnJSKASmDRz4e/baB/Icz1TlG00vTyN8rKlAfmDuMpjGgQ
	vRLuVseWPePiIE5ADILcASu9Z62J58KiV3f2+87NNpxdeUQIoG7NlVyuxlHgrJ4IPd4SVk5NjQz
	haYpt3L1yKupk7RMRtXWjVODlaIdFDY3qNOk8
X-Gm-Gg: ASbGncsjMbiu0nUWhO2OMViKtGzssirWIOGlfUNdv7kQmHJk8XKtu2NTxSKyEFeJpfi
	5Z2WQRihAsltul05f3mWPEZnqjJ7WMuMLadqoH57eRhDcsMt2hQuqPKxQcQgaX3rLMUwiCsiplI
	SdRIgjucI/zYuPPrEFf1f/3zOkwK85iGwtPE1PII23D7H3LrG0kJnGc2QFTtbgCnHvaN66zgGH6
	vuBksQ8rP8kZNo=
X-Google-Smtp-Source: AGHT+IFeKN0FvjV/iKqE42THXeDbLi9oziLlix03inqM9yiGjQuLrcguM/r8tfbOm1mYwyZ+nUwAsTk4bCYzYh2DZSA=
X-Received: by 2002:a05:600c:628c:b0:442:ccf9:e6f2 with SMTP id
 5b1f17b1804b1-454a3708f05mr28698715e9.16.1751454999782; Wed, 02 Jul 2025
 04:16:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250702005706.1200059-1-john.madieu.xa@bp.renesas.com>
 <20250702005706.1200059-4-john.madieu.xa@bp.renesas.com> <CAMuHMdVOhJaYuKqJeJA4N1n-_a=msyaYbiSHpaMw8OkHrprZSA@mail.gmail.com>
In-Reply-To: <CAMuHMdVOhJaYuKqJeJA4N1n-_a=msyaYbiSHpaMw8OkHrprZSA@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 2 Jul 2025 12:16:13 +0100
X-Gm-Features: Ac12FXxKgI7r15K6Lifif8agJoG7VZyyIB7KQTuknktkKr34MscCH7t7bPpgpoA
Message-ID: <CA+V-a8tUVgvYeMd5g8Y_FUTiE1v0eNcYFvdJsW2Rk3-a2ui1DA@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] pinctrl: renesas: rzg2l: Add PFC_OEN support for
 RZ/G3E SoC
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: John Madieu <john.madieu.xa@bp.renesas.com>, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	magnus.damm@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
	richardcochran@gmail.com, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, netdev@vger.kernel.org, biju.das.jz@bp.renesas.com, 
	john.madieu@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Wed, Jul 2, 2025 at 10:55=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi John, Prabhakar,
>
> On Wed, 2 Jul 2025 at 02:57, John Madieu <john.madieu.xa@bp.renesas.com> =
wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add support to configure the PFC_OEN register on the RZ/G3E SoC for
> > specific pins that require direction control via output-enable.
> >
> > On the RZ/G3E SoC, certain pins such as TXC_TXCLK must be switchable
> > between input and output modes depending on the PHY interface mode
> > (MII or RGMII). This behavior maps to the `output-enable` property in
> > the device tree and requires configuring the PFC_OEN register.
> >
> > Update the r9a09g047_variable_pin_cfg array to include PB1, PE1, PL0,
> > PL1, PL2, and PL4 with PIN_CFG_OEN flags to indicate support for this
> > feature. Define a new rzg3e_hwcfg structure with SoC-specific pin names
> > used for OEN bit mapping.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> > +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
>
> > @@ -3283,6 +3307,19 @@ static const char * const rzv2h_oen_pin_names[] =
=3D {
> >         "XSPI0_CKN", "XSPI0_CKP"
> >  };
> >
> > +static const char * const rzg3e_oen_pin_names[] =3D {
> > +       "PB1", "PE1", "PL4", "PL1", "PL2", "PL0"
> > +};
> > +
> > +static const struct rzg2l_hwcfg rzg3e_hwcfg =3D {
> > +       .regs =3D {
> > +               .pwpr =3D 0x3c04,
> > +       },
> > +       .tint_start_index =3D 17,
> > +       .oen_pin_names =3D rzg3e_oen_pin_names,
> > +       .oen_pin_names_len =3D ARRAY_SIZE(rzg3e_oen_pin_names),
> > +};
> > +
> >  static const struct rzg2l_hwcfg rzv2h_hwcfg =3D {
> >         .regs =3D {
> >                 .pwpr =3D 0x3c04,
> > @@ -3352,7 +3389,7 @@ static struct rzg2l_pinctrl_data r9a09g047_data =
=3D {
> >         .dedicated_pins =3D rzg3e_dedicated_pins,
> >         .n_port_pins =3D ARRAY_SIZE(r9a09g047_gpio_configs) * RZG2L_PIN=
S_PER_PORT,
> >         .n_dedicated_pins =3D ARRAY_SIZE(rzg3e_dedicated_pins),
> > -       .hwcfg =3D &rzv2h_hwcfg,
> > +       .hwcfg =3D &rzg3e_hwcfg,
> >         .variable_pin_cfg =3D r9a09g047_variable_pin_cfg,
> >         .n_variable_pin_cfg =3D ARRAY_SIZE(r9a09g047_variable_pin_cfg),
> >         .num_custom_params =3D ARRAY_SIZE(renesas_rzv2h_custom_bindings=
),
>
> I would rather use the existing .oen_{read,write}() abstraction,
> and thus provide new rzg3e_oen_{read,write}() implementations:
>
Ok.

>     -    .oen_read =3D &rzv2h_oen_read,
>     -    .oen_write =3D &rzv2h_oen_write,
>     +    .oen_read =3D &rzg3e_oen_read,
>     +    .oen_write =3D &rzg3e_oen_write,
>
> Of course this requires refactoring the existing rzv2h_pin_to_oen_bit()
> and rzv2h_oen_{read,write}() functions to avoid duplication.
> Do you agree?
>
Agreed.

Cheers,
Prabhakar

