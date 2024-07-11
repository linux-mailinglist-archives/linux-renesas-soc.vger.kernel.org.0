Return-Path: <linux-renesas-soc+bounces-7249-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8181792E2C5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Jul 2024 10:53:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B12E21C21AC7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Jul 2024 08:53:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33C56152534;
	Thu, 11 Jul 2024 08:53:19 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A0C813B59F;
	Thu, 11 Jul 2024 08:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720687999; cv=none; b=rv/PoAUbdUrvihnaCDJZdHYDx5PZaE+ZJ7RcBdqhlgsoABvBhuW8htBLlpypEBfOpTuMROgf2p3o1yatUwIpk90hROO+AoF8k8BoikLinpngJ1vbD+jVEwIIbHFJN0S3JEkczu+4zHq5NRisoMKPoRbzy42DeCvpOiHk4m/Hm7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720687999; c=relaxed/simple;
	bh=2ou+YsYEEugMGdtQXAJCZ+aAgYO2v5aJq4d7CBht9bA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TyZ/s6lDTEtVGTrdy7DBwk2w50grxhTvWbEiL5if/LWiMkYc9RM8QgvcB3749Mb0zGRM+j3JfI731Bd4BP/0AtZBQpQTsQhNAbouWkvHjh1F51gT15atkmVvFBAmzfgbW2QX7GqgyMV1oYRetxlBPqfm4VBf+yHcfmpFjYiz9Y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-654ce021660so6656817b3.1;
        Thu, 11 Jul 2024 01:53:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720687995; x=1721292795;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W6f3oSyeWf8yYBWfaEbvUGQAKgtspXaPeuysnNn5pHw=;
        b=GR8CClR260goFc+bhr2rkbeYznRn1zNKHiahW5GWiabsgVjcrqn4V9+pjz6XVa/ZxT
         jlE8C4s5CLNxFxkvG9sum0QXFsO6OtT7i6xVcQ1simPdcIn5nSAJPgvv+GCRLwwNo+QV
         1JAyB9lXlb4fxqWu6WjR0qVxROHsrR1g92lcyy8pDejvgjAnqGFVFEdB8bUkAkHxd6VY
         yanWigzaB4pOAtcwkb4/bmaXZFEdhE+q0RlIVfJwnQhoq5TGXJ/r06RufICKOVrPEHkH
         g9hQ1yXnSz6zEe5WGmraOlpH8qXUIuayHGOvNpGITebRgdVRZeTurvuLLU12PRopFZ58
         f2TA==
X-Forwarded-Encrypted: i=1; AJvYcCWfg6ekCf+r7uj5xphUPdixZ4jtozeIhAg6R8opZvBQHMa2SUkw4f4wKn8JqJ1NdVL1mqQBxEPfV1u+Uc0dPnBWlSP3GSCLREsu
X-Gm-Message-State: AOJu0YyPSW9ou/yQcSajDr29mYM9snOJHdQAbBMZ+ynbORyj64LsaJLl
	3gRKo1X5wJhHchb/1Gq60VGfVASiTEHkrWt5YzsnEAB/UlI50HZ8qC1TLZOd
X-Google-Smtp-Source: AGHT+IHUdxAbZMOJ1MqrAUxn4ANA6HwI9JatpKzYhOcm/ziAyjFj1DHBkPWB2+D7AsAPIoXpUIakpQ==
X-Received: by 2002:a0d:dcc1:0:b0:647:eaea:f4de with SMTP id 00721157ae682-658f11a56d1mr75338347b3.47.1720687994975;
        Thu, 11 Jul 2024 01:53:14 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-658e4a316e9sm10287977b3.17.2024.07.11.01.53.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jul 2024 01:53:14 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e03a9f7c6a6so594779276.3;
        Thu, 11 Jul 2024 01:53:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX/Jmj9JnikEJV7mYh4fJGpGq2guoZRMSy0CB/f2ZITn7JxOzaL5mcYH29ztAxwH7tajANbW+loTYWrhnBg2OjDPSAdjPDOBOfN
X-Received: by 2002:a81:5b42:0:b0:650:8f3a:2ac6 with SMTP id
 00721157ae682-658ee790066mr90288287b3.1.1720687994228; Thu, 11 Jul 2024
 01:53:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1720616233.git.geert+renesas@glider.be> <3b3e769977dba9c487ec12cf9594e99af4eaceb7.1720616233.git.geert+renesas@glider.be>
In-Reply-To: <3b3e769977dba9c487ec12cf9594e99af4eaceb7.1720616233.git.geert+renesas@glider.be>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 11 Jul 2024 10:53:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWa26+9BCz9Hokn+9HNjAqwG_V+G1JJ07X2ye0m7bWS-A@mail.gmail.com>
Message-ID: <CAMuHMdWa26+9BCz9Hokn+9HNjAqwG_V+G1JJ07X2ye0m7bWS-A@mail.gmail.com>
Subject: Re: [PATCH 05/14] clk: renesas: rcar-gen4: Add support for fractional multiplication
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 10, 2024 at 3:10=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> R-Car Gen4 PLLs support fractional multiplication, which can improve
> accuracy when configuring a specific frequency.
>
> Add support for fractional multiplication to the custom clock driver
> for PLLs, which is currently used only for PLL2 on R-Car V4H.
> While at it, add the missing blank line after the function.
>
> Note that Fractional Multiplication is not enabled by the driver,
> but used only if the boot loaded enabled it before.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/drivers/clk/renesas/rcar-gen4-cpg.c
> +++ b/drivers/clk/renesas/rcar-gen4-cpg.c
> @@ -77,17 +79,26 @@ static unsigned long cpg_pll_8_25_clk_recalc_rate(str=
uct clk_hw *hw,
>                                                   unsigned long parent_ra=
te)
>  {
>         struct cpg_pll_clk *pll_clk =3D to_pll_clk(hw);
> -       unsigned int mult;
> -
> -       mult =3D FIELD_GET(CPG_PLLxCR0_NI8, readl(pll_clk->pllcr0_reg)) +=
 1;
> +       u32 cr0 =3D readl(pll_clk->pllcr0_reg);
> +       unsigned int ni, nf;
> +       unsigned long rate;
> +
> +       ni =3D (FIELD_GET(CPG_PLLxCR0_NI8, cr0) + 1) * 2;
> +       rate =3D parent_rate * ni;
> +       if (cr0 & CPG_PLLxCR0_SSMODE_FM) {
> +               nf =3D FIELD_GET(CPG_PLLxCR1_NF25, readl(pll_clk->pllcr1_=
reg));
> +               rate +=3D ((u64)parent_rate * nf) >> 24;

This (and every other similar calculation in this series) can use
mul_u64_u32_shr(), for better performance when reused on 32-bit,
at the cost of a slight code increase on arm64.

> +       }
>
> -       return parent_rate * mult * 2;
> +       return rate;
>  }

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

