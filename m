Return-Path: <linux-renesas-soc+bounces-7305-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E4992FC3B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jul 2024 16:08:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 37EABB2094E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jul 2024 14:08:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D9DA171641;
	Fri, 12 Jul 2024 14:08:05 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9540416F856;
	Fri, 12 Jul 2024 14:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720793285; cv=none; b=sfEu8bUurgG26pW3sgtImNbIDz8hJw+Vj+C5wOvJluC9y3GzHCnV871/dSV3XoEZKrupK2KMR0iTCAdSQ7Y7VX8i4zqd90kjxjy/xvW3gCTt8fBVRqHkS6+/JBPnit1q9N8GY8QWTjkmc6KxKzy7TIethq+D7yGXcxQtkDYSJQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720793285; c=relaxed/simple;
	bh=OEkXmnJv1Va64K3BAw9ZpLQK/PeP8omSQYGhtCvKTWs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B8Av53IE8UgpVe5lmKHPPCoX4dPR7np+iYNhipJDgmYF2wCOnp8mojiVIL4j8fVPCiPevFEmeI2HTwC8OQ/ANhIXzXtJZfRwFZ7Aq5vlXpepEkSgDkhOxqTGauEFxveR0cBaKEQTX+5MINNVDxycGluADC6OCe9YAp0VsNJ53pI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e03a8955ae3so2057165276.1;
        Fri, 12 Jul 2024 07:08:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720793282; x=1721398082;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KJU2bngvyaK5TX7ldRu1TpOwr67dBrlCem9HBqyBt+0=;
        b=F8PoWPtkEwwekC7E01ME1XCsxE7AN5JvPvJbsJ3BPHn4X+PE9exHnG+KKHBj0ojAvJ
         D1K+M0mLsvg9/US9xnBKH4vkFCL0AjsjtGnmZr9Tbcwtc4f5IDHQEaSeGJARxE1QG4+E
         Ae+Io1PAUDII1XimiRwUbmSccBxUuevxv509Skq38K+70OvIfe4yLdL03aQrtPvwBWwf
         zZI6L4XOieXVmAp+G0DHKkOsh6eurJCC84ahwNT3v4ab5JZtLKSqdlgya1KdNC6E3SYo
         bkkJHxzOoDWQ+yfK3votZX3g18aFVLTNG5tdfpbAVJJJNbDUyPwq1GeMNcG5/gmd6jhn
         IBMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXAcgK8xJSYXXa8hPdIhJJtPyPiux8R7llfaAynvXesxzJcWAiW9mVZuZ6wFyl1fxy5xocKEjdC11G4qeJp1upcpBGfZPo0JfiwL/1PRTY6kowunUKieSB2v7Qc0XbwT6h1QrhtKvMfZr/BDsVzlO9L+CV5cPgJrIcAAM7Pz3fuDNF+RwDGmuILGOw=
X-Gm-Message-State: AOJu0YyHhQ8YQclO5nTMRskqQeBfB6O7AmhpDsJUrlTSiVPGO5CVsdyO
	ffiXbzKXwnKdUog6/K9qTTJvgsp0JwQmd85mFhxBp1Ongq21J4uFV/V4f/k2
X-Google-Smtp-Source: AGHT+IH2tOiSJnRXo1xo3f7K5spMFA2W8kxovuO4agbqZU8EjIoMCe1g7vr5J/6AE2or7lKGJvRGjA==
X-Received: by 2002:a81:8483:0:b0:650:8d5c:9615 with SMTP id 00721157ae682-658ef2494damr128215907b3.23.1720793282290;
        Fri, 12 Jul 2024 07:08:02 -0700 (PDT)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com. [209.85.219.175])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-658e4d2ab4bsm15142747b3.33.2024.07.12.07.08.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jul 2024 07:08:02 -0700 (PDT)
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e03a8955ae3so2057145276.1;
        Fri, 12 Jul 2024 07:08:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUTz0o0bx3EnGDuAloRaqqJqUsjDckXZdLLjvi/xj3UIkDJ04f663t42v1dXNA4uJDBxzkL566fmn6Z371CZ2AbRQu7yiZMkXTEkUiNL8eePn0mrY+M2m2fQ4lbX3LiMfjYm3e9wghL1xc0fSFmchS/VcH+DlsLtubi2H3K3PnVzTxUDn7j5/cLbns=
X-Received: by 2002:a81:834b:0:b0:62a:2a7d:b512 with SMTP id
 00721157ae682-658ee791db8mr131746987b3.10.1720793281776; Fri, 12 Jul 2024
 07:08:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240628131021.177866-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240628131021.177866-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240628131021.177866-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 12 Jul 2024 16:07:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW-NUdK23h7_tLe5nfgXHzFmJySFNCNTciZmJeHcxNSKw@mail.gmail.com>
Message-ID: <CAMuHMdW-NUdK23h7_tLe5nfgXHzFmJySFNCNTciZmJeHcxNSKw@mail.gmail.com>
Subject: Re: [PATCH 4/4] clk: renesas: rzg2l-cpg: Refactor to use priv for
 clks and base in clock register functions
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Fri, Jun 28, 2024 at 3:11=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Simplify the `rzg2l-cpg` driver by removing explicit passing of `clks` an=
d
> `base` parameters in various clock registration functions. These values
> are now accessed directly from the `priv` structure.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/rzg2l-cpg.c
> +++ b/drivers/clk/renesas/rzg2l-cpg.c
> @@ -400,10 +400,10 @@ rzg3s_cpg_div_clk_register(const struct cpg_core_cl=
k *core, struct rzg2l_cpg_pri
>
>  static struct clk * __init
>  rzg2l_cpg_div_clk_register(const struct cpg_core_clk *core,
> -                          struct clk **clks,
> -                          void __iomem *base,
>                            struct rzg2l_cpg_priv *priv)
>  {
> +       void __iomem *base =3D priv->base;
> +       struct clk **clks =3D priv->clks;

If "clks" is used only once in a function, then please use priv->clks[...]
directly instead of adding another local variable.
This applies to other functions in this patch.

BTW, why did you decide to have separate patch [2/4], [3/4],  and [4/4]?
They all follow the same pattern.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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

