Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC64D455F80
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Nov 2021 16:30:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232370AbhKRPdO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 18 Nov 2021 10:33:14 -0500
Received: from mail-ua1-f51.google.com ([209.85.222.51]:40910 "EHLO
        mail-ua1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232255AbhKRPdL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 Nov 2021 10:33:11 -0500
Received: by mail-ua1-f51.google.com with SMTP id y5so14469969ual.7;
        Thu, 18 Nov 2021 07:30:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6WlBFhFdLaiNrzdAPfTzWOZByLWbYzJb4NTghlT9WrI=;
        b=UU3yGyZiROXYsaBx2gjhM60eWmw6dUN0sNw0CFAxf3mXCcmVOKvyTshMxZmtn76EY+
         vxxSAun24U7IdPBe+v6DGNHLqJeOMrTny7bDTCeJiLIBKThR4Be42Y3vwwur+1k+7/2g
         h0LkR73Ua1s7rAccbekGnaq86fc/znLEeDYXt1AM5LCw5SPxryQi1bzJYiR8QIAn3a3s
         x0XCEwSEcjTsD/HT2rLSesKCRaUe2sqUrvTSto02c7KOBTa66bMoqnt6tf+omXjET9ac
         LmzsfD6yFrXV3+2tWz4r3QQKtkWFR/OHjtwnR5N8HQy5fA6k3zC4XWeyQmBsVl7s9F4k
         XTmA==
X-Gm-Message-State: AOAM531mVxMHya+r/qcRMWZ8sfkvtbawI59J1Ts8MHEimII/qrtFk6lT
        oa2qyafQcyV6fKxAT5fQ3V/54SKrjvmbbw==
X-Google-Smtp-Source: ABdhPJz6hoAdzIZ6+jEpqzRupXbOO/TmrgMCCm7VRRs9Uqso7sY4Ka2GDnJ3vxDkkINL2REliWd1ZA==
X-Received: by 2002:a67:fad4:: with SMTP id g20mr83633737vsq.1.1637249410849;
        Thu, 18 Nov 2021 07:30:10 -0800 (PST)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id t189sm56207vsb.13.2021.11.18.07.30.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Nov 2021 07:30:10 -0800 (PST)
Received: by mail-ua1-f45.google.com with SMTP id t13so14455133uad.9;
        Thu, 18 Nov 2021 07:30:10 -0800 (PST)
X-Received: by 2002:a05:6102:e82:: with SMTP id l2mr82475115vst.37.1637249410167;
 Thu, 18 Nov 2021 07:30:10 -0800 (PST)
MIME-Version: 1.0
References: <20211117115101.28281-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20211117115101.28281-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20211117115101.28281-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 18 Nov 2021 16:29:59 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUi_Aj6JQ5n31R3DROUMG8F+032+L43AMmkiBwB_TQhWw@mail.gmail.com>
Message-ID: <CAMuHMdUi_Aj6JQ5n31R3DROUMG8F+032+L43AMmkiBwB_TQhWw@mail.gmail.com>
Subject: Re: [PATCH 3/4] clk: renesas: cpg-mssr: Check return value of pm_genpd_init()
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Jiri Kosina <trivial@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Nov 17, 2021 at 12:51 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Make sure we check the return value of pm_genpd_init() which might fail.
> Also add a devres action to remove the power-domain in-case the probe
> callback fails further down in the code flow.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v5.17.

> @@ -574,7 +580,13 @@ static int __init cpg_mssr_add_clk_domain(struct device *dev,
>                        GENPD_FLAG_ACTIVE_WAKEUP;
>         genpd->attach_dev = cpg_mssr_attach_dev;
>         genpd->detach_dev = cpg_mssr_detach_dev;
> -       pm_genpd_init(genpd, &pm_domain_always_on_gov, false);
> +       ret = pm_genpd_init(genpd, &pm_domain_always_on_gov, false);
> +       if (ret)
> +               return ret;
> +       ret = devm_add_action_or_reset(dev, cpg_mssr_genpd_remove, genpd);

Will insert a blank line here.

> +       if (ret)
> +               return ret;
> +
>         cpg_mssr_clk_domain = pd;
>
>         of_genpd_add_provider_simple(np, genpd);

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
