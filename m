Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B351D4561B8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Nov 2021 18:46:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231996AbhKRRte (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 18 Nov 2021 12:49:34 -0500
Received: from mail-vk1-f170.google.com ([209.85.221.170]:33335 "EHLO
        mail-vk1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231787AbhKRRtd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 Nov 2021 12:49:33 -0500
Received: by mail-vk1-f170.google.com with SMTP id d130so4329868vke.0;
        Thu, 18 Nov 2021 09:46:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=p1lPpkXFSgUv7yrQilxvI2d8ridWrFbToRTwtg1A234=;
        b=4Cp+8WTNDFQK854045gAs2dBzGiikD4qxR5W+xLiVdv8bFrrjvgCOPbFG/XDAN2yX+
         0PgxMi4f6LDtpdOJBxplfJXuclbAVpM4z5Fez/pXSNluaHcuaBySb8H/JHwQTnTFmqh3
         rmiAU9iz131d5yilLWoMH9tizrW7H8BzI9xxtHteJkfCUnYpvJ0a6aYu9SZwI5fopBnc
         QSITHZnIRXNUeEWwOWldyb84HAo4+F4B/k6lpGrV18yNdH+jiWVkY9c/kZdHhXW55cMT
         DV3QbFTyZcPBPSZue2FbF0YsQKUDN18XiKPgFHAlXzcP+pBEx+P4JXGdJbI7az29xLSi
         VSwQ==
X-Gm-Message-State: AOAM530ElEKfJWbtVrza+r6Upp1t9xZgM6un5vPGHTRqhnwQBLcEtOJF
        Zcc+xiab3F3qLFUVTP0dwEmUkuHncO9u5w==
X-Google-Smtp-Source: ABdhPJyR0rYmEt3aqmCLH/DU2iquiCkP8LILND/1rdOWYpEHRJmDbyc26FIHqwrkTOijIuuDYsNDSg==
X-Received: by 2002:a05:6122:da7:: with SMTP id bc39mr105262623vkb.22.1637257592606;
        Thu, 18 Nov 2021 09:46:32 -0800 (PST)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id h24sm258036uab.5.2021.11.18.09.46.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Nov 2021 09:46:32 -0800 (PST)
Received: by mail-ua1-f48.google.com with SMTP id p37so15430778uae.8;
        Thu, 18 Nov 2021 09:46:32 -0800 (PST)
X-Received: by 2002:ab0:5552:: with SMTP id u18mr38074036uaa.78.1637257591918;
 Thu, 18 Nov 2021 09:46:31 -0800 (PST)
MIME-Version: 1.0
References: <20211117115101.28281-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20211117115101.28281-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdUi_Aj6JQ5n31R3DROUMG8F+032+L43AMmkiBwB_TQhWw@mail.gmail.com> <a427dace-171d-3cf7-ece6-ea7b15d586d0@omp.ru>
In-Reply-To: <a427dace-171d-3cf7-ece6-ea7b15d586d0@omp.ru>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 18 Nov 2021 18:46:20 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUpu2yA1OYuWmzagXChdcT_B6yb8mmSutY4SNAGin-nDQ@mail.gmail.com>
Message-ID: <CAMuHMdUpu2yA1OYuWmzagXChdcT_B6yb8mmSutY4SNAGin-nDQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] clk: renesas: cpg-mssr: Check return value of pm_genpd_init()
To:     Sergey Shtylyov <s.shtylyov@omp.ru>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Michael Turquette <mturquette@baylibre.com>,
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

Hi Sergey,

On Thu, Nov 18, 2021 at 6:44 PM Sergey Shtylyov <s.shtylyov@omp.ru> wrote:
> On 11/18/21 6:29 PM, Geert Uytterhoeven wrote:
>
> [...]
> >> Make sure we check the return value of pm_genpd_init() which might fail.
> >> Also add a devres action to remove the power-domain in-case the probe
> >> callback fails further down in the code flow.
> >>
> >> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > i.e. will queue in renesas-clk-for-v5.17.
> >
> >> @@ -574,7 +580,13 @@ static int __init cpg_mssr_add_clk_domain(struct device *dev,
> >>                        GENPD_FLAG_ACTIVE_WAKEUP;
> >>         genpd->attach_dev = cpg_mssr_attach_dev;
> >>         genpd->detach_dev = cpg_mssr_detach_dev;
> >> -       pm_genpd_init(genpd, &pm_domain_always_on_gov, false);
> >> +       ret = pm_genpd_init(genpd, &pm_domain_always_on_gov, false);
> >> +       if (ret)
> >> +               return ret;
> >> +       ret = devm_add_action_or_reset(dev, cpg_mssr_genpd_remove, genpd);
> >
> > Will insert a blank line here.
>
>    You mean after *return*? Else I don't think we need an empty line. :-)

Meh, fortunately I'm better at making the actual code change ;-)

>
> >
> >> +       if (ret)
> >> +               return ret;
> >> +
> >>         cpg_mssr_clk_domain = pd;
> >>
> >>         of_genpd_add_provider_simple(np, genpd);

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
