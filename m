Return-Path: <linux-renesas-soc+bounces-10027-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A8AA19AE22C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Oct 2024 12:12:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5F0321F23549
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Oct 2024 10:12:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A32DF1BFE0D;
	Thu, 24 Oct 2024 10:12:44 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D6E11AF0DA;
	Thu, 24 Oct 2024 10:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729764764; cv=none; b=ml2Kk6lHHZ8EqTHjJKKdvSfGOcKHiMTcK2zLDBDpWAR/8Kl4V8Ev13v1adwBhS2qfuwS4T4EQ4QwGqmIUl5yFP2D44Is4kuT9vrkMgwWdDGASntm64EQBwj7jEOZ0z56jUfZPUwS3r0RD5Tbk38X5LVXV/DuheaNHEqYYjDXq4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729764764; c=relaxed/simple;
	bh=MGOf7ZMyi95QFP31KZrV4c/ynaQc4Pken5UbVPfGmeQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fe9OMWDnygTRHMyckcijfOuEri8DSVo5axIHzhiMt3+57YNrtdSjvSl8Qm2hT8FwbdwL0LrW2rs/mW7rMsJe+vsce8VE7uI5k/rARvaPt2erw2D92DyHubBnEcKeohXmiMlb3HLhzAZSwAWHnDHOtYI5kZq+BrsYY1U0RdyH0vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e29047bec8fso1522680276.0;
        Thu, 24 Oct 2024 03:12:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729764761; x=1730369561;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jNrlohlRDru7xpuT59x3QjydCvV40I8c/+c4YvwuOb0=;
        b=q2BWr7sEYwEnrU4U8SR2Cg7t6DI6K1lIdi6pqHayWHX8Lv5wuXDIbgOXaIJPXXYe/b
         BnEmQlyCE1jS937b0R5QWxm/WpTcyxRN26WrWScSe0EpRk2ilS1NYm1bfnucZX6XEBdQ
         yAtdAgd3485h2I96HIY0FQpJ7Ji2SdlRqVvle5tTEgxUml3bYNKZ5Qwq7phtmHTNPsim
         BrJHLXIuJSdF6tpcrMqPJlRJ7RnJ6ds1Gt6/0WQaJhE1ceApqAZRB7/DcGqvOkCXdB80
         RThp18wexnMNirQGMQIglTapA3lFYlS4ajkXs/Cl+awuK5gBjPqVI4DZsEdcZ5VQr0NT
         V27Q==
X-Forwarded-Encrypted: i=1; AJvYcCXIpAbYJ89KCG4/yS1teqrYoEjOfBDYmW09cfbw5UWyYQBJmJ8Dp+WG+uMFR4IoJX1SZLALeMF74jXwQY1/E8S2Jpk=@vger.kernel.org, AJvYcCXP6fHOof6dtaSgs7jqsC7pVChy6TXmx1FWl0cf9i5ty1PhQByE/9k/ZVLXyI3ytlR2HHwRZ69tSpo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyX1t1lvCKM2pGR3NjsPBy+ilQyZf4Apy38y4ZQcU8Ikdnrdbx9
	hQYqNQCq+an+sjll5Ecg/zMk9R6nM83fnUO+QjycQo2+7Pq3y1XEUXpu0irz
X-Google-Smtp-Source: AGHT+IEEQRkA08o4IQAySlmaX1A2lXWd2j1v9lAyUvvLh8Pqkntbve61SKt7GwyWFXBo84Nldcd1Hw==
X-Received: by 2002:a05:690c:74c5:b0:6e2:1eaa:1c90 with SMTP id 00721157ae682-6e857fe6e2cmr10052157b3.18.1729764760660;
        Thu, 24 Oct 2024 03:12:40 -0700 (PDT)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f59f592asm19343467b3.9.2024.10.24.03.12.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Oct 2024 03:12:39 -0700 (PDT)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6e314136467so7154087b3.0;
        Thu, 24 Oct 2024 03:12:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUI8Dat6nrAV5qv+icLwUfswfAN/LSdOTvZg0A5dnV6lQQXlLbMPd2cy0n+kTWsb0q01WmyFtX8B9o=@vger.kernel.org, AJvYcCVU2z5qfBnJguMxXl28PJdwwOF/EkqlNPcGeCXSW8iIDvIahwgq9oNXTmZ4JXRLu1SHHGDEqFYCwnAEgT9lklqv2wc=@vger.kernel.org
X-Received: by 2002:a05:690c:6e05:b0:64b:1eb2:3dd4 with SMTP id
 00721157ae682-6e84dec1a66mr10607027b3.8.1729764759423; Thu, 24 Oct 2024
 03:12:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241016101513.39984-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20241016101513.39984-1-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 24 Oct 2024 12:12:27 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXwxWAm=XiGFw_j+L8ebmAvJx7r8oQ_Bhon6tsWX47yXA@mail.gmail.com>
Message-ID: <CAMuHMdXwxWAm=XiGFw_j+L8ebmAvJx7r8oQ_Bhon6tsWX47yXA@mail.gmail.com>
Subject: Re: [PATCH v3] clk: renesas: rzg2l: Fix FOUTPOSTDIV clk
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>, 
	Hien Huynh <hien.huynh.px@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju,

On Wed, Oct 16, 2024 at 12:15=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.c=
om> wrote:
> While computing foutpostdiv_rate, the value of params->pl5_fracin
> is discarded, which results in the wrong refresh rate. Fix the formula
> for computing foutpostdiv_rate.
>
> Fixes: 1561380ee72f ("clk: renesas: rzg2l: Add FOUTPOSTDIV clk support")
> Signed-off-by: Hien Huynh <hien.huynh.px@renesas.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2->v3:
>  * Used mul_u32_u32() for 32-bit multiplication.

Thanks for the update!

> --- a/drivers/clk/renesas/rzg2l-cpg.c
> +++ b/drivers/clk/renesas/rzg2l-cpg.c
> @@ -557,10 +557,10 @@ rzg2l_cpg_get_foutpostdiv_rate(struct rzg2l_pll5_pa=
ram *params,
>         params->pl5_postdiv2 =3D 1;
>         params->pl5_spread =3D 0x16;
>
> -       foutpostdiv_rate =3D
> -               EXTAL_FREQ_IN_MEGA_HZ * MEGA / params->pl5_refdiv *
> -               ((((params->pl5_intin << 24) + params->pl5_fracin)) >> 24=
) /
> -               (params->pl5_postdiv1 * params->pl5_postdiv2);
> +       foutvco_rate =3D mul_u32_u32(EXTAL_FREQ_IN_MEGA_HZ * MEGA, (param=
s->pl5_intin << 24) +
> +                                  params->pl5_fracin) / params->pl5_refd=
iv >> 24;

The division is a 64-by-32 division, so it should use the div_u64() helper.

> +       foutpostdiv_rate =3D DIV_ROUND_CLOSEST_ULL(foutvco_rate,
> +                                                params->pl5_postdiv1 * p=
arams->pl5_postdiv2);
>
>         return foutpostdiv_rate;
>  }

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

