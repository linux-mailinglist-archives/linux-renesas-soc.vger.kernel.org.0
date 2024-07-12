Return-Path: <linux-renesas-soc+bounces-7306-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1EFD92FC41
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jul 2024 16:09:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1E0501C21552
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jul 2024 14:09:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32C68171094;
	Fri, 12 Jul 2024 14:08:43 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89BC8172BAC;
	Fri, 12 Jul 2024 14:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720793323; cv=none; b=D1HExWdw1Enw1J44z7LwCM73W2sREzh3781J9IeCUFZeYO3F6Iteo/cm6pzzqlUVjvApXNofVsPstoDDyO4WdxD8lYSueJfgLcx8fynjB/7rVg2RPFE+rDP0uRDnKu0aXhQrt3lFyrH162u3WqCq3p6yJwT/+IQcQfdL1+JfAdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720793323; c=relaxed/simple;
	bh=ZMV862XG5ZXS7MdCvwqZsegUajSDV5qPNV+1pjuAxdE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oOU0AvxKEHt0u32E8fRGTCD4S9cKhm8/pFbidZnav6p+jIdsfvOJwRjV+u4rSh25kR0yEYsuCfNUyTPJL8+h3Yl0hsKFxKVi2YtbVTMn5+iyxG1OXPnBzTHCApZQ4wk8r962+LwFdvPIwESqrDhgAufFicJizkpyJrvrach+0uE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-643efaf0786so19596067b3.1;
        Fri, 12 Jul 2024 07:08:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720793320; x=1721398120;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=36jm4ncNntQjYvNTjj8I1FYvqAR5U860RhpC5WMkBQQ=;
        b=PDoyo1GwRYDSIF4P7sPEEAGxcbja9hC1n0q6S5WUUNsz0k5a/YQnyZR+DB9VQi8Lrc
         VPTUn7SbfT1UpXQwDHpJMvcKFaQFSvynTCe5gD9jRWgeU4OLwRviOq1fqNQi4EB69+wu
         M25tfG75axGbaxqyb7znq/0Se25f/mOB7HfpshMlTuMwiApdRgIShxwyznMGhWiStHl2
         fC1KI44oL5WP91PP6/2C70cXNJV9jYGH+RjOBQm49wlGdwdN2/tIAkO5P9Ql/fx53SGF
         z4Iuz4y1Sf6z/7A9LZWcf5e9WWZqH7jKuVGK69sKyU6zcOmO6fR5JIA/kx+KaMeFWfSA
         JJAw==
X-Forwarded-Encrypted: i=1; AJvYcCXoTgEWO++XkzfBBk6lhoyHMcxWVSBbn5bu3njNJeCQpPpnH8VR6lQGV3PA2D6ZdZ32Z5OpPxU61pEI2C86D2aGG/FSoNRmuCE5CaBEcv/cvgkf+chwy2obkgQuJ7Du2h2/o+DoTMUxODnNZCh9uxTboxZ8JE5qwQOEm6pVis3O8I2RzSyedPIMeTA=
X-Gm-Message-State: AOJu0Yz+Z0wMJDtPImn76yt1TIAEhEUCTubY1RPvGS0wmiOdznyH/zkd
	T2Ao+5T7neKJHCy6eeSmG1ZLsSyqB3ePkhaHoabsas2+0GzyrjXBeaZKHq3Z
X-Google-Smtp-Source: AGHT+IE56f82HP7SNwBAkVoXt+P0fiBHTQsNWzjHJhs4Jac0UiEWUx2tUiqvFLrl/mVxLuEbV6Anxw==
X-Received: by 2002:a0d:f942:0:b0:647:7782:421a with SMTP id 00721157ae682-658f0dc5e12mr120137007b3.45.1720793320086;
        Fri, 12 Jul 2024 07:08:40 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-658e5219a67sm14963757b3.59.2024.07.12.07.08.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jul 2024 07:08:39 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-651961563d6so20137807b3.0;
        Fri, 12 Jul 2024 07:08:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWTCy9kNYkXgR00Q4gjPpOxmKcyQ3ThyEqlbC09TbI3WagMjPxGYmBuQKFuv2D6E7C8l9eeHQfEEiCn5B/h5CTKgfgQE59qrM+80PPacaMszfgKq71pLTjtevnLZNGVyiC2AY64CtHIuAuY1XkLsoRJKhDrB9GNQFdVuzfhUBKe8vLmDuG+qQBOMBE=
X-Received: by 2002:a05:690c:e05:b0:651:6888:9fee with SMTP id
 00721157ae682-658eed5faccmr141839637b3.18.1720793319631; Fri, 12 Jul 2024
 07:08:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240628131021.177866-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240628131021.177866-4-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdUxUfEXZ5QVfG5HNjQ+MNKDqkX5COD4_v-fzkgZFAOheA@mail.gmail.com>
In-Reply-To: <CAMuHMdUxUfEXZ5QVfG5HNjQ+MNKDqkX5COD4_v-fzkgZFAOheA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 12 Jul 2024 16:08:27 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXwAod7e8rxrEj1Z28jn9dVwcN9ko1jKZs97u+FTnZNPw@mail.gmail.com>
Message-ID: <CAMuHMdXwAod7e8rxrEj1Z28jn9dVwcN9ko1jKZs97u+FTnZNPw@mail.gmail.com>
Subject: Re: [PATCH 3/4] clk: renesas: rzg2l-cpg: Remove unused base pointer
 from rzg2l_cpg_sd_mux_clk_register
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 12, 2024 at 4:00=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
> On Fri, Jun 28, 2024 at 3:11=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail=
.com> wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Refactor the `rzg2l_cpg_sd_mux_clk_register` function to eliminate the
> > unused `base` parameter. This parameter was redundant and not utilized
> > within the function.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-clk for v6.12.

I will wait for a new merged [2/4], [3/4], [4/4] instead ;-)

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

