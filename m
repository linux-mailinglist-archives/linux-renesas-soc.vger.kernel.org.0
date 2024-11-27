Return-Path: <linux-renesas-soc+bounces-10730-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 624EE9DA872
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Nov 2024 14:26:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2240E2822CB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Nov 2024 13:26:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BE8D1FCF40;
	Wed, 27 Nov 2024 13:26:38 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A48541FAC29;
	Wed, 27 Nov 2024 13:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732713998; cv=none; b=VNS8QGd+RzfUSf4eBJoiNJMzZrpRCNA/PHU0m5LH0hK7Wbb94a9dK/8CSUtbVsaUA1fsYypykW7wBwaqvl5hv2OZRtcF2HOXeOyRS/5gJsQ4BXAtAj/nxcXMiBA+6gdbWbyDW+c6TKY/UC+c2QnNJ8CKCFu+ULluNh+zYmgXebY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732713998; c=relaxed/simple;
	bh=VrlZ5IEgCvEHIEiSIQpR2+Ht2H34GXLOS95yrTIXEfU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JWxF06vNW8+wbrNfc2c7hn5fa/66m8MkPAlo+ct9PSclHFHdBodjc6E8qDy0L2iJH3CyBX3kIyCGQzoTZ0FUFCf81YYh7bCjNbLGCRkROAxwpuQmwOGETWQjdbkNYp4pWmTBJNahsO0Il+df5z2QQek50vRm+KZw7KKHA8abC3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a9f1c590ecdso1084481066b.1;
        Wed, 27 Nov 2024 05:26:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732713992; x=1733318792;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XyeDQfwEDN0ttnkxwawP/koNscFpewJqgUMH52pWJCg=;
        b=kvTaIw237vWiHGJDV+jeHuWYcWl04n9TP+yS3W9hVuQF6ReLRlywRgrln5Tcp2l/JJ
         f5QfAbEhXGzoCQX4lDN9eHMOoyj8ecTHx5q3S3/2W5y2dtv474OAOTaMlO8B10k8L4U5
         ghEj+JDo6RCcbNLv9fDude/HvxuYf+Q+m6wQ2VC+xWS7XPXaN3gl8RRf6TXtzjm8Ynsu
         ZXap1WuZ0fXfS8StsZ/P+mAXCh72vHM7PqWDJNw1hqeYTGTkaW5rs8jkH5P++RUgrhfG
         WKOZNJQYyy8nMiVwCoyyODB6D6GbMN7D94D64qVIVCxuumBJxZPntn5Bpazvl1C51ajZ
         vyrg==
X-Forwarded-Encrypted: i=1; AJvYcCVpv9SMpggQcTHKav7BrlQUaHdz3KojHnvdLDoHNJ9zqNxRk8jQntwSzALqOcb3IlmDyzayeA6ILxiewmpY@vger.kernel.org, AJvYcCXQA1IUKbees+6SukZ1R99E7RnabhmsX9D0S38+eOYr945hyMmXo2ivczLfx/NB1t+BmscblT4jzc0pLACkRYf8lpw=@vger.kernel.org, AJvYcCXhtppEdTVbQGmXhzysjfKFsl/eYWsqYCepqfEHUjr0RNcobBNSEylkypXi2BPK8Dq8woTWicjN4Vw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxN2F6CB34/n5W+G4AJ7I3FcrkeTIHerdQoKfedyFvRUYR2Vji1
	kXvfgsU9k98W/kNcbd4/xao3dre68/rk7zliYXG2NmLw9EfwWqkKzuxks3EANUM=
X-Gm-Gg: ASbGncsP6gE9cxGXkmBnUMLy5OUT9x/J3N5Sp2EjqSm6j6QbAyKc5SZYiPxrbV9KXpS
	4+ib/dqMOEEeKE3vCLWldfNcID2iTb8J1Fbczbatll4/RyT8DJ9sLDbUJq7IW/w8C0mEQ+tMhHA
	mgKiOfATz0UcowoMTuXJ6xa23pXqcXGeu7a4DsI6GNiHo6j6xCYmYBt099jlcyIbVKaCOzFWfBG
	E7d9i/gn5GPJruOQ3eBP5qdzX7Lf62Gg0y+gfkox6suRrXiRD53IeukPeRt1uYXARQT0axO2v65
	BAvP6FrRkZGe
X-Google-Smtp-Source: AGHT+IEa6/NTuqgOSXxD/LPWNJRlGPIE88EUNsL40W1192c9Z0ArK8E+MVh6VTMBLdHhON0kx05NEg==
X-Received: by 2002:a17:906:23ea:b0:aa5:d1d:1e7 with SMTP id a640c23a62f3a-aa581033172mr202463266b.38.1732713992519;
        Wed, 27 Nov 2024 05:26:32 -0800 (PST)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com. [209.85.218.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa54f7fb6e7sm392870166b.30.2024.11.27.05.26.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Nov 2024 05:26:31 -0800 (PST)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a9ec267b879so969460666b.2;
        Wed, 27 Nov 2024 05:26:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVjbYSbN6DssMnCdMWtLQE5wop7uml8eMGbc1dhmslGXWmLvZ/mDXSmVJPXM0Nd13CAomkcidKnU50tIY9K/UP1mvY=@vger.kernel.org, AJvYcCWxYHcWX7CF/ze0XW4Aa+l76kxWxJzo46BY2YZfyEJSW9Zeq158xMhd4V0Lyeo/hQWke0iMs/N0NL2Ld0RJ@vger.kernel.org, AJvYcCXo7gImFLxNphPXyaR9GPkF6UQ9d8WXryigfZB0OE4aYsFlpHb+EmgsO1vL4PP5/WYjQFdkchIyohA=@vger.kernel.org
X-Received: by 2002:a17:906:1db1:b0:a99:f6ee:1ee3 with SMTP id
 a640c23a62f3a-aa5810328b9mr182689266b.43.1732713991418; Wed, 27 Nov 2024
 05:26:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241104232401.290423-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20241104232401.290423-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdX0p4KhTNpNKMfZBjrCDxsyGO7sSwcJZWxBgxoHBZy9jQ@mail.gmail.com> <CA+V-a8vMMwyZ0rsdzrMuhvWDXa5dMtgYXf9+6YEAm1dXYUU+DQ@mail.gmail.com>
In-Reply-To: <CA+V-a8vMMwyZ0rsdzrMuhvWDXa5dMtgYXf9+6YEAm1dXYUU+DQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 27 Nov 2024 14:26:17 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVz5QWvi-aTGQrh3EUS9t9S45X8LoV1gXUiFSXJEpUXhQ@mail.gmail.com>
Message-ID: <CAMuHMdVz5QWvi-aTGQrh3EUS9t9S45X8LoV1gXUiFSXJEpUXhQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] clk: renesas: rzv2h-cpg: Add selective Runtime PM
 support for clocks
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Wed, Nov 27, 2024 at 1:41=E2=80=AFPM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
> On Wed, Nov 27, 2024 at 9:54=E2=80=AFAM Geert Uytterhoeven <geert@linux-m=
68k.org> wrote:
> > On Tue, Nov 5, 2024 at 12:24=E2=80=AFAM Prabhakar <prabhakar.csengg@gma=
il.com> wrote:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > Update `rzv2h_cpg_attach_dev` to prevent external clocks not tied to =
the
> > > power domain from being managed by Runtime PM. This ensures that only
> > > clocks originating from the domain are controlled, thereby avoiding
> > > unintended handling of external clocks.
> > >
> > > Additionally, introduce a `no_pm` flag in `mod_clock` and `rzv2h_mod_=
clk`
> > > structures to exclude specific clocks from Runtime PM when needed. So=
me
> > > clocks, such as those in the CRU block, require unique enable/disable
> > > sequences that are incompatible with standard Runtime PM. For example=
,
> > > the CSI-2 D-PHY clock initialization requires toggling individual clo=
cks,
> > > making Runtime PM unsuitable.
> > >
> > > The helper function `rzv2h_cpg_is_pm_clk()` checks whether a clock sh=
ould
> > > be managed by Runtime PM based on this `no_pm` flag. New macros, such=
 as
> > > `DEF_MOD_NO_PM`, allow straightforward declaration of clocks that byp=
ass
> > > PM.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com=
>
> > > ---
> > > v1->v2
> > > - Updated code to skip external clocks to be controlled from runtime =
PM
> > > - Updated id range check
> > > - Updated commit message

> > Note that this series conflicts with "[PATCH 00/12] Add support for
> > Renesas RZ/G3E SoC and SMARC-EVK platform", which you are probably
> > already aware of.
> >
> > [1] https://lore.kernel.org/all/20241122124558.149827-1-biju.das.jz@bp.=
renesas.com/
> >
> Yep, I'll ask Biju kindly to rebase the changes on top of v3 while he
> sends v2. Or do you want me to rebase on the above?

I guess your series is closer to the point of acceptance.

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

