Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C8A33A66F0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Jun 2021 14:49:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232894AbhFNMvM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Jun 2021 08:51:12 -0400
Received: from mail-vs1-f44.google.com ([209.85.217.44]:44961 "EHLO
        mail-vs1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232764AbhFNMvL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Jun 2021 08:51:11 -0400
Received: by mail-vs1-f44.google.com with SMTP id x13so7691428vsf.11;
        Mon, 14 Jun 2021 05:49:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BnoRbSerCMEUBQHU+v5tCGfthACY5dC5nOxu0PQXFk4=;
        b=oSNxn5e78lDEV96msjH42g3VaAa/LFdYn0VOxhxZ8bfOniNqlog/hF4j7CZCWlgXMd
         88tIVV1mSwqm6miLCCoGMOVlEovP1/z1DbFYwrkCb3HkqN2+ionnA5KkZCOt4W0R4wG2
         aHmQj24OhfYXjMqkHmSK54VlACL947uXkl+on3EXPTffCEUGpxX5vXxdzuNBR0nrBJx2
         InSelkkthooGrf5tLg+jZpNmH5AJwDxZsO5H6ylJOpTg3iz52JW9DHqe7E+ulG25qij7
         s/ufAQsrKyO5ioz1SlKSDyPVOJne72oVswV/CQpERw13HkeEwn4cv39NhnYSOuvUTuXo
         dy2g==
X-Gm-Message-State: AOAM531kqgdQh13bB0H0Tkluo/x+e4OXtcDwVb5wmWSSasRIa1A2qe/l
        7t30h+681keN4unDkcScvT/ifxAGL2XH7MywL6I=
X-Google-Smtp-Source: ABdhPJyyaxvIqDxyaGe2uyottyRXGXc/Bmn8sxBFVX0ds42Rx4OjDhTe6r8de2zi4eEgQvJ8JFNKKJ40o7de/WusdeQ=
X-Received: by 2002:a67:3c2:: with SMTP id 185mr17476825vsd.42.1623674947875;
 Mon, 14 Jun 2021 05:49:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210611152108.6785-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20210611152108.6785-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 14 Jun 2021 14:48:56 +0200
Message-ID: <CAMuHMdWJQESFmhV+c-QmivXCWPx21QcB-HSzjxf8KsXh_DAvfw@mail.gmail.com>
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

On Fri, Jun 11, 2021 at 5:21 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Add the below missing properties into GIC node,
> - clocks
> - clock-names
> - power-domains
> - resets
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Queueing pending on[1].

> [1] https://lore.kernel.org/linux-devicetree/
>     20210609155108.16590-1-prabhakar.mahadev-lad.rj@bp.renesas.com/


Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
