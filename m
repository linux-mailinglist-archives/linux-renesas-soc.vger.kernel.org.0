Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E25925898E
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Sep 2020 09:46:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727075AbgIAHqv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 1 Sep 2020 03:46:51 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:44341 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726144AbgIAHqu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 1 Sep 2020 03:46:50 -0400
Received: by mail-oi1-f196.google.com with SMTP id 185so346020oie.11
        for <linux-renesas-soc@vger.kernel.org>; Tue, 01 Sep 2020 00:46:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kB5Wagw3aNn/sYDFl3PaoN9yPWzPx8S2SSIgHi/MIcc=;
        b=P9WuDAMLXv8NLbL4WgGXzUg/KzB9snECwMNoqkS7W5MYT+i1Zo9geheISYOXMgtvY6
         RK8+iIdXs030XV7HhCF3kGpOA7D1uqIZOB6FvyajTEt6/tphxt9G2kreDvchE26FjHhd
         +5GJSQsan3gXCh9T9NCEkaSxvYRtsYzG5X9DiZaeDXH9nInJuFCoax7UdU2TLwZML2a9
         sgCNj0oWO4bdVBkqU9E2iL2ZKAUicYdIQR0dkat4ZAFvKcpGdOoHvcxjO3CBYJxpUxSw
         7YcepY8pHXRfoEWNdk+LKW1krbYi5XfBUk9Zsi+K0glQZ9SiKxM/6FnLFT/OTRRtx2c4
         itzA==
X-Gm-Message-State: AOAM530keoxaGE/ezwkU2JZpVuYwVaGWE89cEMVWk75oYMqjc1QBJMuY
        96s8qvhkBuT9NgjS+fiLJEH9rRB5KaRhxBGDoJxM2Von
X-Google-Smtp-Source: ABdhPJxdOwnep+QCJkfM/mAokK8p1t7HjXnpM+Q5RIKoE5AtTlbJcyEUbpIy3Hz14s0ScDI/J1C3FgjwN2La3BShiVY=
X-Received: by 2002:aca:52d6:: with SMTP id g205mr353466oib.54.1598946409504;
 Tue, 01 Sep 2020 00:46:49 -0700 (PDT)
MIME-Version: 1.0
References: <87364czszt.wl-kuninori.morimoto.gx@renesas.com> <87zh6kyedc.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87zh6kyedc.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 1 Sep 2020 09:46:38 +0200
Message-ID: <CAMuHMdVNonrbvdfrGBqoEDCe895jXX+AOfNAGYSTx+qv6J_mMg@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] soc: renesas: align driver description title
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Magnus <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Aug 24, 2020 at 4:22 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> Now, Renesas SoC drivers are under menu,
> but current description are not aligned.
> This patch align these.
>
>         - R-Car H2 System Controller support
>         - R-Car M2-W/N System Controller support
>         - R-Car V2H System Controller support
>         - R-Car E2 System Controller support
>         - R-Car H3 System Controller support
>         - R-Car M3-W System Controller support
>         - R-Car M3-W+ System Controller support
>         - R-Car M3-N System Controller support
>
>         + System Controller support for R-Car H2
>         + System Controller support for R-Car M2-W/N
>         + System Controller support for R-Car V2H
>         + System Controller support for R-Car E2
>         + System Controller support for R-Car H3
>         + System Controller support for R-Car M3-W
>         + System Controller support for R-Car M3-W+
>         + System Controller support for R-Car M3-N
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Will queue in renesas-devel for v5.10.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
