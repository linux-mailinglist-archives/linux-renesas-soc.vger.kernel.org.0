Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECAE83A2514
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Jun 2021 09:11:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229942AbhFJHNl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Jun 2021 03:13:41 -0400
Received: from mail-vs1-f48.google.com ([209.85.217.48]:38516 "EHLO
        mail-vs1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229725AbhFJHNl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Jun 2021 03:13:41 -0400
Received: by mail-vs1-f48.google.com with SMTP id x8so1329468vso.5;
        Thu, 10 Jun 2021 00:11:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vcFbB0zpMkf2v3bQbPR3LDvJ7wjTHUBgJDyynwLmudM=;
        b=GJq+RU0CSr2VFfoAYhnq+Q6bSNKN9Vake9sspskXpbWRNN6WcAJg9UD3/2NQvWBeDg
         mx0nUNfboJiy5J1m+2+c3BWy0tyVAyE62Xq6qucciCQLeLzQImzTBODzKU1o15IMFiVi
         Iw+uyKslgXMyH8wag/2bzIR2Bzac4/Rb0nzu+RQz9cYeD7PsvtKpsn+EjlTiNmwDV4qH
         1ZogQARLp6KLWstJsBEhtX+BDwEKZxv0zoZF/UEQigJcGMqGVd2hXHnLV+rpfDY9YhAK
         MOf5Ly37b4u2GeJUutK/8TaN9ErxaM1QaYPLefo81m7E4KZCZLoISPmOM/W0mhFFCsi6
         bVhA==
X-Gm-Message-State: AOAM533AGFb4MzI4USz+Cx4z7geos2JcmO+H7YDynS8wAQxXqZuDQrxD
        Tin2qZZOxsuiUvkwFz7we5/HT68EpzHzRJwkDPv3UmeJ1gA=
X-Google-Smtp-Source: ABdhPJxxKK0lDgIZmBN/w0exGQXCOUXElDHybpZDt8pGjC9+KkMUamFRGWqtpOd5WcXIyPXVAkygHVXiVo4bmTYyryY=
X-Received: by 2002:a05:6102:c4c:: with SMTP id y12mr3277130vss.18.1623309089805;
 Thu, 10 Jun 2021 00:11:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210316162643.2442885-1-geert+renesas@glider.be> <4d2edd16-2ca5-c732-d075-5c913e13114a@lucaceresoli.net>
In-Reply-To: <4d2edd16-2ca5-c732-d075-5c913e13114a@lucaceresoli.net>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 10 Jun 2021 09:11:18 +0200
Message-ID: <CAMuHMdUdEwD84HDs=GC_USFL1rjsfpL6qUXXgpLtpZKXc=voFw@mail.gmail.com>
Subject: Re: [PATCH v5] dt-bindings: clk: versaclock5: Miscellaneous fixes and improvements:
To:     Luca Ceresoli <luca@lucaceresoli.net>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Adam Ford <aford173@gmail.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Luca,

On Wed, Jun 9, 2021 at 10:56 PM Luca Ceresoli <luca@lucaceresoli.net> wrote:
> On 16/03/21 17:26, Geert Uytterhoeven wrote:
> >   - Remove unneeded references for "idt,xtal-load-femtofarads" and
> >     "idt,slew-percent", as vendor specific properties having a standard
> >     unit suffix don't need a type,
> >   - Add missing "additionalProperties: false" for subnodes, to catch
> >     typos in properties,
> >   - Fix property names in example.
> >
> > Fixes: 45c940184b501fc6 ("dt-bindings: clk: versaclock5: convert to yaml")
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > Acked-by: Stephen Boyd <sboyd@kernel.org>
>
> This patch seems to have gone MIA. It really should be applied. Geert,
> would you please rebase&resend in case it does not not apply anymore?
> (or tell me if you prefer me to take it over)

Send v6 (patch got smaller again ;-)

>
> > ---
> > This depends on dt-schema v2021.2.1.
> >
> > v4:
> >   - Add Reviewed-by, Acked-by,
> >
> > v3:
> >   - Drop references for "idt,voltage-microvolt" and "idt,slew-percent",
> >
> > v2:
> >   - Settle on "idt,voltage-microvolt", cfr. commit 4b003f5fcadfa2d0
> >     ('clk: vc5: Use "idt,voltage-microvolt" instead of
> >     "idt,voltage-microvolts"'),
> >   - Drop reference to clock.yaml, which is already applied
> >     unconditionally,
> >   - Drop removal of allOf around if condition, as it is unnecessary
> >     churn.
> >
> > squash! dt-bindings: clk: versaclock5: Miscellaneous fixes and improvements:
>
> heh, should be removed, but is's after --- so not a big deal.

Yeah, silly rebase mistake (I apply fixes with changelogs with --squash).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
