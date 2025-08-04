Return-Path: <linux-renesas-soc+bounces-19960-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E23B19F28
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Aug 2025 12:00:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 66733189A15F
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Aug 2025 10:01:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13EB6246769;
	Mon,  4 Aug 2025 10:00:24 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544B01ACECE;
	Mon,  4 Aug 2025 10:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754301624; cv=none; b=n7OB1k+7x0qTBxDpMKCwI4Y5kUn4vGCFKBs4BU0KRs/xtTPoi8giNxgt5vh603GGEYnydkSTw6XroX1TbBBewc/cBw2ThtUWTbzZ6xromJU3I4eFEhsEJwLYoJL6YoYlmR2D3fo/oyd4pu7ybo+q5PvklecsmNDVY9YQR6lbKOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754301624; c=relaxed/simple;
	bh=mpe7T74dmtR2fuAVUZ57VuLLcRGspxTnziRewsuDca8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HUuq7HHAYrfsRFmUdyOTeICW+RWNtu2UOPsitEfzUe5PL5vXKVuBQWMdGLVx0SYs/ztkM4bn85s4OIaUsyJb818u7wO0zxt92yMH2m70owgiW9ZR+QC9IaS+Itfm2suo8qtrEtmAAjTSW9lR0S/+TNeexk7eJkOxqVlqkLirRmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-53987d78f0bso93784e0c.2;
        Mon, 04 Aug 2025 03:00:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754301620; x=1754906420;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eS3bsjfBxf7Nb9K34UhVoW/iQd5gmVco36iifAHyUH4=;
        b=QwKJaMQde2rW6Ch+bldUMckL7T7aXSLDQPe6hiXI+l2xlAm+olGXUvq0ZCISSci1sN
         fW3IOwVKAkQlj1ZHNPuVrfz2PlUGjtwIMYXOhDivPpQmh5oKh/+oOIYAwGyzV/N+dVEi
         pzHlHtfXRRnIyKtWEF4Fo+O5TtwCfdDFcVCQBMtt687EUYuQrR7iS3ywPrbe2xs5FaCi
         JWde+CTA0wOYctBJ5yk2xqQLQ60z9d1Cmf9S9kTT61Eiemk5jAT/HQX1eCrj9O0oJyCS
         75GkkwfxQAo6zDjbMkxaDBgbr6fq4PzuEZKfbT/RVTSgr+qN/NjkDZ5ZrjeYvwJSIq7H
         yMiQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhqqfCKS/ltYuR7Ah9u6Qh4UDi+X7pArNlyVROfB+9jQd2iaV462B+uQiyo2wXZEaFW4RdbBXKWHY=@vger.kernel.org, AJvYcCUslQhpbKtk3GNLWQHzic6l3GkHhSL1GovuFDGxx0fF8KOZ8qXUz225le7fBb+HdtmnQHcDZ0fP77eOACJ3@vger.kernel.org, AJvYcCW4fYvVrWzvEV3e2hpGK8Dc2c6TVpMx29xNjmn5MxDk8fn/UNzYkd91x/+SGoCZVFaJ9EW5FxU04b/z+Wr1MyqTGIk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjabdmI2DCosl+2arMFPs+BCunXE9dSP4e232QHHYpjDF1BiG/
	rLTOTqtyk6UMP/yLyPyVAFrF/Cg2m0/53GpUt5K1zfYttQcRiGtcCTG0u1377k8g
X-Gm-Gg: ASbGncu8C/mVFJengRbCfkfnzQzsOAPMFiw24JKuRD6owEOK1A5dA/G+AxJfD4uDR1W
	21gXO1NqFKQfpc5PErQxwy7qJAya71U4DbCHy5UyoDu72n2vOMHQbc8mkUPIkqMBwTbnXbvx3LS
	USnsOKb3hYRmbrWiO/1rdEGHpjaogSz6y6MzV8M2OcCz8kBj2LEPktkk0cHy60abhbJsTrmV0f1
	qLEnvoIdnDKwdDejfrIBOQ1C6YKP3rzBppBDDpwoPbtx9l5LfVDK09j2qDo2N40Wa1/ayfY0hAH
	jVFpzGG8Yt9Uzxi1aSbiOVcQBN2ooDFMTEdI7y8JhYepXnwP1SJepzpToXJd9am3j2MIgr4PBvM
	cQE6fcrODOg8scXWy6TIVnDE9k2jCDo4kw4cpO+0xxQ4ZmoJZbSvF6lpTw+vJ
X-Google-Smtp-Source: AGHT+IENtw1Pl2XfXzdX5f/eq7kLU/oCjtOnKedw46nsNgdICvK8xN5ZPz+sxsbSSFUILJi8BcEYtQ==
X-Received: by 2002:a05:6122:1697:b0:535:e789:6ccc with SMTP id 71dfb90a1353d-5395f1f80f0mr3360433e0c.3.1754301619863;
        Mon, 04 Aug 2025 03:00:19 -0700 (PDT)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-53936d4f0bdsm2709173e0c.36.2025.08.04.03.00.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Aug 2025 03:00:19 -0700 (PDT)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-88bbfe763ecso920708241.3;
        Mon, 04 Aug 2025 03:00:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWWRpxZTJrV5fJo/e8kx/ldMqzPArUSCBsUCdwtKi4n0G3PqejQ1HfrfLspnTyI5gsLyWXa9Cp4HtfRzx2F@vger.kernel.org, AJvYcCWuqvVOvNhZjvog5m69Uoo+6PIIg/rDDcZWWxgCf/34g6AkP3LXiIavkiq1xxkNFwKXfT+nL/v/vYKiaFVkkAZDRWE=@vger.kernel.org, AJvYcCXr+tQSaaxvtbuIy1x1d2mYECxbXET0ML7sZq2kWMtgp5ZH9uziSooLc6Dx96HzXNMbpkc7/D7TG+4=@vger.kernel.org
X-Received: by 2002:a05:6102:c4b:b0:4e7:bf03:cd79 with SMTP id
 ada2fe7eead31-4fdc1f3ba82mr2731697137.5.1754301618843; Mon, 04 Aug 2025
 03:00:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250704134328.3614317-1-claudiu.beznea.uj@bp.renesas.com> <20250704134328.3614317-3-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20250704134328.3614317-3-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 4 Aug 2025 12:00:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXGvNgv9hGhcr5MhTL+X_E2f-2kz2NEqhG1fw_dBC0uBA@mail.gmail.com>
X-Gm-Features: Ac12FXxP7Z5IRMS9eyyB2n6CzdU8SZtDG8X1mpfYCayxF7CUSCgAeogY_9GSFEo
Message-ID: <CAMuHMdXGvNgv9hGhcr5MhTL+X_E2f-2kz2NEqhG1fw_dBC0uBA@mail.gmail.com>
Subject: Re: [PATCH 2/3] clk: renesas: r9a07g044: Add MSTOP for RZ/G2L
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: mturquette@baylibre.com, sboyd@kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Claudiu,

On Fri, 4 Jul 2025 at 15:43, Claudiu <claudiu.beznea@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Add MSTOP configuration for all the module clocks on the RZ/G2L
> based SoCs (RZ/G2L, RZ/G2LC).
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/r9a07g044-cpg.c
> +++ b/drivers/clk/renesas/r9a07g044-cpg.c
> @@ -242,163 +242,163 @@ static const struct {
>  } mod_clks = {
>         .common = {

>                 DEF_MOD("gpu_clk",      R9A07G044_GPU_CLK, R9A07G044_CLK_G,
> -                                       0x558, 0, 0),
> +                                       0x558, 0, MSTOP(BUS_REG1, BIT(4))),
>                 DEF_MOD("gpu_axi_clk",  R9A07G044_GPU_AXI_CLK, R9A07G044_CLK_P1,
>                                         0x558, 1, 0),
>                 DEF_MOD("gpu_ace_clk",  R9A07G044_GPU_ACE_CLK, R9A07G044_CLK_P1,
>                                         0x558, 2, 0),

Perhaps these two should have "MSTOP(BUS_REG1, BIT(4))", too?

>                 DEF_MOD("canfd",        R9A07G044_CANFD_PCLK, R9A07G044_CLK_P0,
> -                                       0x594, 0, 0),
> +                                       0x594, 0, MSTOP(BUS_MCPU2, BIT(9))),
>                 DEF_MOD("gpio",         R9A07G044_GPIO_HCLK, R9A07G044_OSCCLK,
>                                         0x598, 0, 0),

"MSTOP(BUS_PERI_CPU, BIT(6))"?

>                 DEF_MOD("adc_adclk",    R9A07G044_ADC_ADCLK, R9A07G044_CLK_TSU,
> -                                       0x5a8, 0, 0),
> +                                       0x5a8, 0, MSTOP(BUS_MCPU2, BIT(14))),


The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

