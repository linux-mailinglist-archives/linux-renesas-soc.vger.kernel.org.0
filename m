Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2E2C455F86
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Nov 2021 16:31:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232303AbhKRPdp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 18 Nov 2021 10:33:45 -0500
Received: from mail-ua1-f54.google.com ([209.85.222.54]:38462 "EHLO
        mail-ua1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232326AbhKRPdo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 Nov 2021 10:33:44 -0500
Received: by mail-ua1-f54.google.com with SMTP id w23so14520063uao.5;
        Thu, 18 Nov 2021 07:30:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cWbgo8PKSGKJr3zLyC4gZLnDiH16ZCT+ZaBLyQp5tCU=;
        b=hPfeMQ+0LKO6z3iigSIr4NnjtwKpRieLVt48lLcnhm6G9X1YAgvFWT8wDvADonJxvw
         Nlew5pOgPmX14ETj+tj/YH50U1Fxd/iUecYW8tiKipvUe/QBpRyQIWjqj1NZecSX6ZTH
         ZyvPTgPFFOIxsKQybmKJcUq9cUB9DYSW0I1T837usPl7maLy8q6HW2L68g5IkmDno/jf
         pE2n6sM8eFnPeMoY5RRciM13tbjnsCqxbijFVBm8ybonQPBkI9957q2cXCJoM3AV+Mt9
         bbgKoAouCpXlAfHRwCsKxFaofpzGku1TiRFX4aJxGfygiysO4LMzFX4hgpz2ZY586l29
         8hkA==
X-Gm-Message-State: AOAM530fFvNthwTu8In6vWiatolq0/+tUMz1EO/Go536Tf0Fhr5IXTNf
        kRxHRvfQlgi+eH/dSVhAVKmySrz3xYChmg==
X-Google-Smtp-Source: ABdhPJz+f9cyc/jATvZmQqj826TqBkdg9TOeVrzWUGVaCan/Srp6Dlz25EP65WRvkB7TZGcGcWTJCw==
X-Received: by 2002:ab0:1c02:: with SMTP id a2mr37555256uaj.115.1637249443222;
        Thu, 18 Nov 2021 07:30:43 -0800 (PST)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id z188sm81203vsz.12.2021.11.18.07.30.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Nov 2021 07:30:43 -0800 (PST)
Received: by mail-ua1-f54.google.com with SMTP id i6so14511905uae.6;
        Thu, 18 Nov 2021 07:30:42 -0800 (PST)
X-Received: by 2002:ab0:15a1:: with SMTP id i30mr37755691uae.122.1637249442562;
 Thu, 18 Nov 2021 07:30:42 -0800 (PST)
MIME-Version: 1.0
References: <20211117115101.28281-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20211117115101.28281-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20211117115101.28281-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 18 Nov 2021 16:30:31 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV00Xp3SKwsiA+QvPLYzPXSQEHJRMbmMYwakk_vfbhTyQ@mail.gmail.com>
Message-ID: <CAMuHMdV00Xp3SKwsiA+QvPLYzPXSQEHJRMbmMYwakk_vfbhTyQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] clk: renesas: cpg-mssr: propagate return value of_genpd_add_provider_simple()
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
> of_genpd_add_provider_simple() might fail, this patch makes sure we check
> the return value of of_genpd_add_provider_simple() by propagating the
> return value to the caller of cpg_mssr_add_clk_domain().
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v5.17.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
