Return-Path: <linux-renesas-soc+bounces-9689-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3ED99A5C1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Oct 2024 16:07:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CA7C8B22AF3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Oct 2024 14:07:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78F2D216A0D;
	Fri, 11 Oct 2024 14:07:39 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA39AD517;
	Fri, 11 Oct 2024 14:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728655659; cv=none; b=CTS0zLDyUGA1Wj7QTAD/1m/5hDTWDW2HAxBNe7MUIoqXm9lz3C3bOki69le3I/o0q6PRpGj+ci6ZyXYPxE5/b291t1muwpNEtlvF1iPH7XmhpeCc0Wn/ljU2hLBeLQvLVyktnIDhQE0EuDwhEoFft8PW4WthwBUoGGi2viSJqRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728655659; c=relaxed/simple;
	bh=hG/jykT7QHfvwaNO55epxr06bSo42Z23cANCczqq4+U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G6sdfH321b5DjrfGokxNsf1BTzc3Wu8MZOF1URDtgNSpLAIozyXRR+wHX22kZABvj3ltFDA3QtpY+z9ppo94gUIEvjqa2wSaJ8xiJMAHN1I9muKmqSYgW/6dVba8nGfytKLRujhRtONXGO5GOT3RqPK61VX/9YJSbee6OShsK58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6e22f10cc11so16410437b3.1;
        Fri, 11 Oct 2024 07:07:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728655656; x=1729260456;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wVDkZZ6poqKkGgdiVyl21O+WAwmeYpsejUHDYlcSNIo=;
        b=PNAtkrcevTB1efbbTQUoFeoLgrpd/JAgf7nkEWj0LBcHQqXVBNLRg91k+ltU9xbXk6
         FThdZJlP4UPVHxl/TzZr1GBgDTP/6wu8fxf9IHEDFBTG2SDfGJLpzCedE2QgDAzgGAeH
         QWhnLcgQfwwHyTJRiYWsd+IidhyuqgRWTDtbYnlRHpuDWcWyxwBTsSTy4pGQmZpBMZEC
         AaphZjHZspqxDABW70t3Wccz1ryvcr8eP5ogf79mHu2rDYbQWXXb6gNZEkI4KCziPyTt
         0X3nafBHvf0v6zq4VbMskZqCMxWb9g5OpAdR4JSc2lTO6dBoaP+jQG0mhOniiVFvswl6
         q20Q==
X-Forwarded-Encrypted: i=1; AJvYcCWhm1kAV8iqpfLSkdxd2BwymrT5D6AV7Aa2KimdvuxR9uD6eJ7eLfKnnBKph5Pi0t/T3OCbiV9zPRQ=@vger.kernel.org, AJvYcCX7gnknoWkMllaZwAxEYZm0juL36mE4kDgkANLyIpnxAnNFBZBC5U7RvnH3NfdeR7d4AnwI8dXRfwEmVmofrsnyH1I=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfXkMdFBrWnGwop5nn8WbBpcPnNlP1DfRU0K83PjvRMhymEBuz
	2+eRWtIBalOFhdhL1Cbb6bbzm44/kbAVcF/lCFvi6345i5vRFu6CS8OE1mlMX6U=
X-Google-Smtp-Source: AGHT+IHE6TcFklBEmEOAc/BBbbiQcLnVZn1VSxdYqwUSgbR0QicT+QitSU2jwl1XklgVjQbQnEoPqg==
X-Received: by 2002:a05:690c:60c2:b0:6e3:116c:ec0c with SMTP id 00721157ae682-6e347b4b818mr19813657b3.30.1728655656120;
        Fri, 11 Oct 2024 07:07:36 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e332bad813sm6048617b3.69.2024.10.11.07.07.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Oct 2024 07:07:35 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6e1f48e7c18so17741837b3.3;
        Fri, 11 Oct 2024 07:07:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUUq26gHlRsaw3oi5FBurRXPefQ/E9oPGKHiGZ4NGL+hc4XUnooKzYhrH3/HmfR1zJMW2gcGF6KPSRMfZvlYBI4MUI=@vger.kernel.org, AJvYcCV6CD9gggkJaRBBhqlwovTpRCo/Mzi4F81sd2vECQuK41Z9dhQRF90OmUgR5N/bi62SrrHIojzG0kU=@vger.kernel.org
X-Received: by 2002:a05:690c:670e:b0:6e2:636:d9ee with SMTP id
 00721157ae682-6e3477bae02mr20153267b3.9.1728655655180; Fri, 11 Oct 2024
 07:07:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241009140251.135085-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20241009140251.135085-1-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 11 Oct 2024 16:07:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXqZYqGnNZqNu=8mMbfidCH-+E1Nn1Fr=tjNReqw5gLZw@mail.gmail.com>
Message-ID: <CAMuHMdXqZYqGnNZqNu=8mMbfidCH-+E1Nn1Fr=tjNReqw5gLZw@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: rzg2l: Fix FOUTPOSTDIV clk
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>, 
	Hien Huynh <hien.huynh.px@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju,

On Wed, Oct 9, 2024 at 4:03=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.com=
> wrote:
> While computing foutpostdiv_rate, the value of params->pl5_fracin
> is discarded, which results in the wrong refresh rate. Fix the formula
> for computing foutpostdiv_rate.
>
> Fixes: 1561380ee72f ("clk: renesas: rzg2l: Add FOUTPOSTDIV clk support")
> Signed-off-by: Hien Huynh <hien.huynh.px@renesas.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/rzg2l-cpg.c
> +++ b/drivers/clk/renesas/rzg2l-cpg.c
> @@ -548,7 +548,7 @@ static unsigned long
>  rzg2l_cpg_get_foutpostdiv_rate(struct rzg2l_pll5_param *params,
>                                unsigned long rate)
>  {
> -       unsigned long foutpostdiv_rate;
> +       unsigned long foutpostdiv_rate, foutvco_rate;
>
>         params->pl5_intin =3D rate / MEGA;
>         params->pl5_fracin =3D div_u64(((u64)rate % MEGA) << 24, MEGA);
> @@ -557,10 +557,12 @@ rzg2l_cpg_get_foutpostdiv_rate(struct rzg2l_pll5_pa=
ram *params,
>         params->pl5_postdiv2 =3D 1;
>         params->pl5_spread =3D 0x16;
>
> -       foutpostdiv_rate =3D
> -               EXTAL_FREQ_IN_MEGA_HZ * MEGA / params->pl5_refdiv *
> -               ((((params->pl5_intin << 24) + params->pl5_fracin)) >> 24=
) /
> -               (params->pl5_postdiv1 * params->pl5_postdiv2);
> +       foutvco_rate =3D EXTAL_FREQ_IN_MEGA_HZ * MEGA / params->pl5_refdi=
v;
> +       foutvco_rate =3D mul_u64_u32_shr(foutvco_rate,
> +                                      (params->pl5_intin << 24) + params=
->pl5_fracin,
> +                                      24);

The first parameter is not u64, but unsigned long, and its value always
fits in u32, so "mul_u32_u32(..., ...) >> 24" should do?

However, if you care about precision, the division by params->pl5_refdiv
should be done after all multiplication, too.

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

