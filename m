Return-Path: <linux-renesas-soc+bounces-7302-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9A292FBE8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jul 2024 15:55:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 68D8D1F2137A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jul 2024 13:55:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CA2A17164D;
	Fri, 12 Jul 2024 13:55:12 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B59171E66;
	Fri, 12 Jul 2024 13:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720792512; cv=none; b=suUE8rnjF3Ll0w8PLt/OCxVasFG8nu4a95I83cEzQ2vfXc697kivpvrtyh62dXH/HQLiyKKnfbr7+itaHlFp/hFHPwcKGy4cuh5XJh3Hwg2E5xQ/C0szhMjdPhtVM51B8dV6ZBELcAUDtyvWhEPu+5GlZmIU2Wa5az608+6eW0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720792512; c=relaxed/simple;
	bh=PG7WDG2wxP6E4zUX9w3RjCYf8TYepGOJj7vXvWmU9zk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cZNKL5fS4udFglMIKKUB1glPZSwOIXookq+gv5yT5w8JBb2eiTkHhLu+iCeXbmpxu/4juxU5Uvs1j2Or3s/5//wX3IZpwIMDVxWeIFeEQkg2C22CGLFyTx4z4S5kEmmbl7I26EPPO6FBD6z3QFpofjDvwUSPgoMg9TxsPS5HyBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-651da7c1531so19825387b3.0;
        Fri, 12 Jul 2024 06:55:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720792507; x=1721397307;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=66ZxvuflQ1CFAf8nLezfYlKzbT94Oozorkv5Eix20iA=;
        b=Jho4WBH+1ZJq8L0X1xykC0sIJ9uz3mhsOe2dwNRivYno71uAI0lmEGksMtVe457aFw
         yj49DaGr1cxdVoPzwBvhPSYIVm0nUXZ/4FTxyD2azXgneAN3v9DclnhPPrFnFLB6iZ5v
         OGFTFugPP+ArtxJAi07483Z7gg0W6RelrI+4rUnIDKPWNKNoBTdXtSvukNmUjyG+n/Nt
         AsKs8MlQBoexgkULiY8POo/n5jvZF3/0B6vHBuogCvB4bwCIDorCRBho991MLBNixXbt
         wcu7MzE77DiDQPi1xzu0lyVtxmRcu6LSxFxcb9zM6WpWK7S3ja3ydSifmAaw8PF2LK0f
         578g==
X-Forwarded-Encrypted: i=1; AJvYcCWRIus5vYtqoG/Uag2dSUcXyE3OVdY0vIbtiXgBsy5iKCgrBOCRkwFC8HCenrXU5gFi9fZC6U50hUx2cDW7/xnqWMlPJRas7WswJXmD5vIDN7/V1s3BYdlm9j6oq+b997Hd2bmE9K+dVuuiTjcoJgAVu+ZbC7wTo89oNvBCwZTXU7MX/VRpe7e+nSM=
X-Gm-Message-State: AOJu0YwMtUsCxlqVq4hGacc7SPozY4sZvBZ/zJBO/0Pyz/0ng5xHm6N9
	t1hRuQyyuOBkCE5TAgM0imSUrf/NfHaQDqeIozfhzEUmfCItIUGyJunxFBu9
X-Google-Smtp-Source: AGHT+IGlpMZ4Bh2/+PjLddF/OgtvWciafZOaq/PuNY40RMa1Y8XZBmGVRjK412QkLzARZdMakpvZzw==
X-Received: by 2002:a81:8a84:0:b0:648:2c60:fdee with SMTP id 00721157ae682-658f0bc6201mr114554107b3.38.1720792507472;
        Fri, 12 Jul 2024 06:55:07 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-658e521c7bcsm14706647b3.65.2024.07.12.06.55.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jul 2024 06:55:07 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e03a581276eso1850321276.2;
        Fri, 12 Jul 2024 06:55:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVp+rs2cuTf1yUBSBZlkLGyQzuj8EVY11psplgqPcwlcP0vKkIL6lz4cyrRaIoSiOKPNVcygngaEvGQYPlIvfUBgdG1clryrnuy2WLHUyOHelkKa8fYAjmzVR6ur7Ejd1tAe4pR8UuP1WJZQSZ5yljgd7JQV4qA38vuU/swIeMZC3g3dzPwIezx75Q=
X-Received: by 2002:a25:c787:0:b0:e03:606b:ad2b with SMTP id
 3f1490d57ef6-e041b15aae9mr13588579276.57.1720792506677; Fri, 12 Jul 2024
 06:55:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240628131021.177866-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240628131021.177866-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240628131021.177866-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 12 Jul 2024 15:54:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVd2k7WsPU9htW1LmDrjOgoQ1C8J=8i7ZAs7LS5XYBCXQ@mail.gmail.com>
Message-ID: <CAMuHMdVd2k7WsPU9htW1LmDrjOgoQ1C8J=8i7ZAs7LS5XYBCXQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] clk: renesas: rzg2l-cpg: Use devres API to register clocks
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
> We are using devres APIs for divider, mux and pll5 clocks so for
> consistency use the devres APIs for module and PLL clocks.
>
> While at it switched to clk_hw_register() instead of clk_register()
> as this has been marked as deprecated interface.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/rzg2l-cpg.c
> +++ b/drivers/clk/renesas/rzg2l-cpg.c
> @@ -1023,6 +1023,7 @@ rzg2l_cpg_pll_clk_register(const struct cpg_core_cl=
k *core,
>         struct clk_init_data init;
>         const char *parent_name;
>         struct pll_clk *pll_clk;
> +       int ret;
>
>         parent =3D clks[core->parent & 0xffff];
>         if (IS_ERR(parent))
> @@ -1045,7 +1046,11 @@ rzg2l_cpg_pll_clk_register(const struct cpg_core_c=
lk *core,
>         pll_clk->priv =3D priv;
>         pll_clk->type =3D core->type;
>
> -       return clk_register(NULL, &pll_clk->hw);
> +       ret =3D devm_clk_hw_register(dev, &pll_clk->hw);
> +       if (ret)
> +               return NULL;

rzg2l_cpg_pll_clk_register() can return an ERR_PTR, so please
propagate the error code.

> +
> +       return pll_clk->hw.clk;
>  }

The rest LGTM.

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

