Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 721053C6BE2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Jul 2021 10:08:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234305AbhGMILO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 13 Jul 2021 04:11:14 -0400
Received: from mail-vs1-f50.google.com ([209.85.217.50]:38837 "EHLO
        mail-vs1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234157AbhGMILO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Jul 2021 04:11:14 -0400
Received: by mail-vs1-f50.google.com with SMTP id o7so11810302vss.5;
        Tue, 13 Jul 2021 01:08:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wRoIJpTR/M6E5j1WnKRpCzpdmXhgP0lgm/zazhAiEy8=;
        b=nltWMV9arxqpmM20wLW3yVspCYYagVq56Js980Ox3UpCnIdNX2GqGTNso9TrWIOJMN
         Heqhj75gXkcxBO6cbPg9oyvKg911bVEPRaCCn7amh/j/tYVSNnOSQC61sNkzS4RHhgRl
         qDsKIFoyzsJ4wk6NmFo/KcEv30hMyDwa4i8yN0g9BbcY4XhjJtRBLvB+gw6JCJQ1IIMn
         miXAXzKiewFvsKk70Nwioppn7EmA0UD4tUd22/81UTOz2FziF3n1LhZusJ1cumuzP15t
         /9uIsynCd6wmWa60Q//UTK2IJoesAdEmgiUcpiBLNgZ1pIzcEjakWc1k1XU5VQo3+/7p
         UpvA==
X-Gm-Message-State: AOAM533BqoG0XtVJ7cW1qC8UWuYJdF6lz47tcHVsYNjCO6VuzIKvab5W
        p86LaGCiN4xzzHXQJoH562G0tlQQfgnVzk/Eg1o=
X-Google-Smtp-Source: ABdhPJwukdhbY8ARFewuWNPEQEWTUmgD2WTIYo0XJnQqmsT8lxfdDdQ+HYZoG9zmtA5gdyctP4W9nh7zSOqNi5H5OjA=
X-Received: by 2002:a67:3c2:: with SMTP id 185mr4711906vsd.42.1626163703197;
 Tue, 13 Jul 2021 01:08:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210611152108.6785-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdWJQESFmhV+c-QmivXCWPx21QcB-HSzjxf8KsXh_DAvfw@mail.gmail.com>
In-Reply-To: <CAMuHMdWJQESFmhV+c-QmivXCWPx21QcB-HSzjxf8KsXh_DAvfw@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 13 Jul 2021 10:08:12 +0200
Message-ID: <CAMuHMdXG9H_mOtA_a9t0K8BVaR4p0DcWgNeL0786YvybV2Hqgw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r9a07g044: Add missing GICv3 node properties
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Prabhakar,

On Mon, Jun 14, 2021 at 2:48 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Fri, Jun 11, 2021 at 5:21 PM Lad Prabhakar
> <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > Add the below missing properties into GIC node,
> > - clocks
> > - clock-names
> > - power-domains
> > - resets
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Queueing pending on[1].
>
> > [1] https://lore.kernel.org/linux-devicetree/
> >     20210609155108.16590-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

The dependency has been accepted, but this patch needs a respin
for the changed clocks.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
