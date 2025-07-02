Return-Path: <linux-renesas-soc+bounces-19021-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F60FAF10B1
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Jul 2025 11:55:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A9EF91BC227B
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Jul 2025 09:55:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1126A246797;
	Wed,  2 Jul 2025 09:55:23 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F48123C4E5;
	Wed,  2 Jul 2025 09:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751450122; cv=none; b=Ltf1df00VPPJpeW7giHEKY/TuYiR6TIWb/o3escnjSVvjIuAC8TUm+O7spFIY5P32aURkKlILvLFtk9/+GngVB3UHZWMZurvJmEneIc/gMXDW512csZIGzFJn+/YJXuZLRkVg3cxdJUmfwgDeRvkbTNwWDINOZQ2H/Sq8KUEkmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751450122; c=relaxed/simple;
	bh=C5QXblfrBCzvu7BdLvGifTigoPSkoFM22gBY88eg8Hc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=raegWlGORjMdb4eTrT1ntRSkYipBaNNepGZpe8zxZtDvbwjXC/VnqQwClpQcNQr7sYzddMr9JTWV1Ue9B6X2B2v9VApiEe31ssXJ2C+AukkqohtTR7a8LC5Y0mSE2I3m8zaFKcjViC8OlCjw2RRRlmlVa84fa1caTJSvzhylxPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-53159d11cecso4112713e0c.2;
        Wed, 02 Jul 2025 02:55:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751450119; x=1752054919;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aOx75XV9/OUc0GtT1FSm/gKABj7KC8EmhXbi5Ta+wgM=;
        b=PwskfG/nB6t+tj8b5o9dCBp/Wl6ZGN+uw/FCV6TAuXearukzrmvIg46VYtCvOguTTq
         IYCYICfQSVtEnVu6dJUkl5X6vi19QSgjqM2jYcLPD2ZYgia1sTdVlbe810zAn5M+WikR
         Yyw155Cr3XVMP87JdQr/lCE88i0ihWBonR2CFUNBkl8eRccEBvZnC3rAiSwqhzAu9Zly
         K60dt4oA/BQYB12vrvkFmNHMsgnOUxelI+/hjaxcR7F2o3BySEUgg0E2GuEjxTp/IJea
         e/5wXXUr9Me/3SzRF4QX5ZjP6bzCoZlfvMK+njt+ikAomEuAME90/rK2ovC1v4eXGZp+
         nyOA==
X-Forwarded-Encrypted: i=1; AJvYcCVrjZ1HI8i3KIuB/LPECEjXQX9AtCMVSoxygiRgpAn2Eme9UatzGJEAFWzCDacNJl5cUqn4RJ4lHi6U@vger.kernel.org, AJvYcCVv3VB+vzqA3WbCoN2mDxCNj5ga0OZHZUF5xBZSuMbGfza80YI//rBEhMAi53HhxA9+j7HZ1cQgswu22/Ug205Iba0=@vger.kernel.org, AJvYcCWYZD9JSSA+4jwlejHfF+ef0EWf+pwnjNI9hxOpx8O5D+zxyV0Blg9youc/G7n0Qy+NWfjtga9C@vger.kernel.org, AJvYcCWeMw0O5Flx38Z4ZfhPY/LaFRKWKNv9Auf3OOLr/GuEC0Tc3xMHQlwD5Yt+CAH9ovbU1w7bO8VpAs+B5ZS4@vger.kernel.org, AJvYcCX8CxOKmf/qII8t4AbU6zhaymTsaQAq8l8QFOvVqidSZQQ2KNc00qgHUYHY9rEH7qxGq+pn0JvQL/pN@vger.kernel.org
X-Gm-Message-State: AOJu0YxlrpYDJascPfi+Hiw6fTcbiIEIo/XuCHTAD4eGwwf19hfIelex
	ggX/UcQjbQdyGwrEJ0HH4jKm0zJEDhflZYTCTQgLQBLjgOdunI1t0GIyJhgQs8ZU
X-Gm-Gg: ASbGnctahUWVgFEpLYm4KUnwzSMmTnAf+FOmHVmHfUq4ntieh8VSYpFAzaO7FeNXGSC
	XJdrogviDx3yPPWfZoyH6xwJICOHxgMbn1BPOBMknaOC21wRIUR+KqyS4HO93r940SdpVYJhH8t
	PwDzfevl/EUHN07KwEoglCw72qW5ZMfn5JXwm82EWQnrFKOJC7JvgwJOn79cd0iBXsOxcrph2MM
	N2Zn27BVyZ6VmPjB0vdS3Mqy8PKdEg3BQ3hB5IFAs9mWp+r5lTnvODJMW3wchklDV8BJFV+PCPB
	O1jTuOZSK5rhP4xZ0kFiCRePMfKEbbDdB18tZgHByoetwDm6SQ+FGxx3jWA3anaRSD/aZ2X2/gN
	bOs449iGjLROoA046OCD5zX74
X-Google-Smtp-Source: AGHT+IHQUTerjig7jhM2oeODUMFmoGxzKZinnz4Sg/Dq0Dcvk1urc/btp22t9YpRxgsyIH8VOMyerw==
X-Received: by 2002:a05:6122:2381:b0:531:2906:7525 with SMTP id 71dfb90a1353d-534583bf125mr1534408e0c.6.1751450119081;
        Wed, 02 Jul 2025 02:55:19 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5345ae35c6esm154196e0c.37.2025.07.02.02.55.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 02:55:18 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-4e80d19c7ebso4062278137.3;
        Wed, 02 Jul 2025 02:55:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU3cWRs0mgX1RiqAX/+TdgVjeaIL4Izdw+5inlmy1CzlVCj5JcYlHpo4VKoXl7jf0AkfgNm5jiDNqc8@vger.kernel.org, AJvYcCUvIehNGd9DmP4ucsAYFY/jEV0pduDD2D7+8IpA7jWR9oRfWTVsE4Hwh6OtsDCn3OB+y45B5EHLr50Uur4WNRBSk8o=@vger.kernel.org, AJvYcCUzYa/CT+RiKhiohni+v22MuIx9IjzLhSGQBdL1w7x042uxuce1qUV2SjjYKfjUUHx3N+nmZ0UNurJQ@vger.kernel.org, AJvYcCW/ZTnOf+I+qbufyDCLNrpcWMGivIX1MthUujcdy7NuInPDDSriK+VqyL5Kee74JF+RnJWZ+11zfdZkmt2J@vger.kernel.org, AJvYcCWu5tlv0A0CuoKa13jnGoyf497eWeV4DEoeTDVqahnnzHMYzpK4z4bYcATCU+AJiZzzTOXqcc0/@vger.kernel.org
X-Received: by 2002:a05:6102:2d0c:b0:4e5:992e:e397 with SMTP id
 ada2fe7eead31-4f1611b63aemr846718137.19.1751450118032; Wed, 02 Jul 2025
 02:55:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250702005706.1200059-1-john.madieu.xa@bp.renesas.com> <20250702005706.1200059-4-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20250702005706.1200059-4-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 2 Jul 2025 11:55:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVOhJaYuKqJeJA4N1n-_a=msyaYbiSHpaMw8OkHrprZSA@mail.gmail.com>
X-Gm-Features: Ac12FXzTWEhjeOAh5YAp_gztZRfyET2-t76qHKNwKKlCmIBxnbJjNyzV2hJk3lE
Message-ID: <CAMuHMdVOhJaYuKqJeJA4N1n-_a=msyaYbiSHpaMw8OkHrprZSA@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] pinctrl: renesas: rzg2l: Add PFC_OEN support for
 RZ/G3E SoC
To: John Madieu <john.madieu.xa@bp.renesas.com>, prabhakar.mahadev-lad.rj@bp.renesas.com
Cc: magnus.damm@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
	richardcochran@gmail.com, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, netdev@vger.kernel.org, biju.das.jz@bp.renesas.com, 
	john.madieu@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi John, Prabhakar,

On Wed, 2 Jul 2025 at 02:57, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add support to configure the PFC_OEN register on the RZ/G3E SoC for
> specific pins that require direction control via output-enable.
>
> On the RZ/G3E SoC, certain pins such as TXC_TXCLK must be switchable
> between input and output modes depending on the PHY interface mode
> (MII or RGMII). This behavior maps to the `output-enable` property in
> the device tree and requires configuring the PFC_OEN register.
>
> Update the r9a09g047_variable_pin_cfg array to include PB1, PE1, PL0,
> PL1, PL2, and PL4 with PIN_CFG_OEN flags to indicate support for this
> feature. Define a new rzg3e_hwcfg structure with SoC-specific pin names
> used for OEN bit mapping.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c

> @@ -3283,6 +3307,19 @@ static const char * const rzv2h_oen_pin_names[] = {
>         "XSPI0_CKN", "XSPI0_CKP"
>  };
>
> +static const char * const rzg3e_oen_pin_names[] = {
> +       "PB1", "PE1", "PL4", "PL1", "PL2", "PL0"
> +};
> +
> +static const struct rzg2l_hwcfg rzg3e_hwcfg = {
> +       .regs = {
> +               .pwpr = 0x3c04,
> +       },
> +       .tint_start_index = 17,
> +       .oen_pin_names = rzg3e_oen_pin_names,
> +       .oen_pin_names_len = ARRAY_SIZE(rzg3e_oen_pin_names),
> +};
> +
>  static const struct rzg2l_hwcfg rzv2h_hwcfg = {
>         .regs = {
>                 .pwpr = 0x3c04,
> @@ -3352,7 +3389,7 @@ static struct rzg2l_pinctrl_data r9a09g047_data = {
>         .dedicated_pins = rzg3e_dedicated_pins,
>         .n_port_pins = ARRAY_SIZE(r9a09g047_gpio_configs) * RZG2L_PINS_PER_PORT,
>         .n_dedicated_pins = ARRAY_SIZE(rzg3e_dedicated_pins),
> -       .hwcfg = &rzv2h_hwcfg,
> +       .hwcfg = &rzg3e_hwcfg,
>         .variable_pin_cfg = r9a09g047_variable_pin_cfg,
>         .n_variable_pin_cfg = ARRAY_SIZE(r9a09g047_variable_pin_cfg),
>         .num_custom_params = ARRAY_SIZE(renesas_rzv2h_custom_bindings),

I would rather use the existing .oen_{read,write}() abstraction,
and thus provide new rzg3e_oen_{read,write}() implementations:

    -    .oen_read = &rzv2h_oen_read,
    -    .oen_write = &rzv2h_oen_write,
    +    .oen_read = &rzg3e_oen_read,
    +    .oen_write = &rzg3e_oen_write,

Of course this requires refactoring the existing rzv2h_pin_to_oen_bit()
and rzv2h_oen_{read,write}() functions to avoid duplication.
Do you agree?

The actual pin parts LGTM.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

