Return-Path: <linux-renesas-soc+bounces-7304-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B30692FC01
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jul 2024 16:00:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4D4AF1F228F0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jul 2024 14:00:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D70C616C6BE;
	Fri, 12 Jul 2024 14:00:40 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD0115DBAE;
	Fri, 12 Jul 2024 14:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720792840; cv=none; b=oOIA9+jleoLnJW4mgtC1Eqi38CJn9xC3Ri4vUujn8kxYhgxe5coo4IwdC20kh2XjjWqGyVbEgEEBSTrhunzghEpWoRgng+pJhyDWcnul/tVtqtKl7nIY9bsir5MZ0spajnYXyd1iFQTSONmNCNDdKNHmgco7b7r+kS/jZVIyGdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720792840; c=relaxed/simple;
	bh=dHJYcDC0Lei1SsAY91BIMUsBuZTwqN+2ZOEo+8vR6l0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CHIRqTPafl6eHOoh7naRiR+eZVp6Ge/5DLfQUmEqi9EgT88Q83X5CfzYiCNev41+Vx0+zN/9QDHHTLdCstwusbeYPkqGHWMkqlIYkFiw+q99pScYur20I5oKSBv1nTT2QHMCqGqPUs4lPHBcEHYVcaCw6SNgpYAoq+HRGmBH/vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-643f3130ed1so19010457b3.2;
        Fri, 12 Jul 2024 07:00:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720792838; x=1721397638;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MTq/V0P75/NUd20Q5A6O2om6T8uBfp2si5TUj0FwnZA=;
        b=CgHl05L+NIEeSLyN2YZ/BnTV+DmuMNJWzAOhH0ffvRcWvShMgzLAgwa4qIs47vhMdF
         Dp5NTFaPmotADE4eUHNypYSluNVmexeBiBQkv14k92Dr0c1p+nRpZEsvdHnsXdH1l4FT
         MLuuPoJAGoySCj2RgwIAfkQB2cx48+IUTJO4rNH37H935IbpcsgXyjO9Ru1YiL/HYJ7+
         OBisNOqV/35RgOq6u0l8ENMAe+4pZAEv1olR7jGgeitjKdbZ/AxjCtGb6i7r0wyhPuVm
         xDVnmJtYPsw7QZpw2a0ycReXaO2OyQQ/S8fqOyR4WpAmsaFmhR5nRraT+rI5TdT65djd
         e+kg==
X-Forwarded-Encrypted: i=1; AJvYcCVmzqVvjTtgkyFRJ+dfqRCDci+sbTJer/ubsp42FLfg1gsuBoJSlcJ0gjgLOpftgPg0QWF3EqODsDk+lyneuAH8t2eb90JhHmPodWvt73ZZqPYUd7G2ce8sI8L0I7Bbh6qb8RqQfd4VvM/0GQf6bvPP6ikQ1EH0ss+aWyql8DfLIY/Vxye5/X4umcA=
X-Gm-Message-State: AOJu0YzbzT9STk5T3yIAvmcuHZZ5FLDD9GPesDbYgqz5/8QC0GGy6tJI
	hOy0AJPjc6Ftpp3eKUrPLzGgcDWFCsfd2XBXKi3EB2P65L5DrvP8JK7hSnnN
X-Google-Smtp-Source: AGHT+IGk/OHsPJtvZe32d5Yq3AW8v0LI3e2426ZHIGUqhk36UvNJrJn88L1kw2bkei9epe+gjwBtng==
X-Received: by 2002:a81:834a:0:b0:631:6970:eac with SMTP id 00721157ae682-658eed5df81mr118568157b3.13.1720792837278;
        Fri, 12 Jul 2024 07:00:37 -0700 (PDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-658e68e5195sm14798647b3.105.2024.07.12.07.00.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jul 2024 07:00:37 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-654cf0a069eso17797167b3.1;
        Fri, 12 Jul 2024 07:00:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXTaMBBEFLbONyxa6bU2Iy1buCrTtvfo+ybH/cgf6iCo3eRxWXkc/zweL1PjTnBk/zZM/LmdEgcUFQ7KTAuqk7VtL0LYrsgXFoc2HYDTPJ/eEHPX0Mw75GXk2VodOiyaHwL7KhOeYMYMg7G1hYhnz/2eaG3RENSVC7wVn3g4PKegr7U6/aoJXruIO4=
X-Received: by 2002:a81:8d4a:0:b0:648:3fb2:753b with SMTP id
 00721157ae682-658ef2492a0mr112356657b3.24.1720792836854; Fri, 12 Jul 2024
 07:00:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240628131021.177866-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240628131021.177866-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240628131021.177866-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 12 Jul 2024 16:00:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUxUfEXZ5QVfG5HNjQ+MNKDqkX5COD4_v-fzkgZFAOheA@mail.gmail.com>
Message-ID: <CAMuHMdUxUfEXZ5QVfG5HNjQ+MNKDqkX5COD4_v-fzkgZFAOheA@mail.gmail.com>
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

On Fri, Jun 28, 2024 at 3:11=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Refactor the `rzg2l_cpg_sd_mux_clk_register` function to eliminate the
> unused `base` parameter. This parameter was redundant and not utilized
> within the function.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.12.

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

