Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAC3239FA60
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Jun 2021 17:24:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231987AbhFHP0C (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 8 Jun 2021 11:26:02 -0400
Received: from mail-ua1-f50.google.com ([209.85.222.50]:33333 "EHLO
        mail-ua1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231481AbhFHPZv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Jun 2021 11:25:51 -0400
Received: by mail-ua1-f50.google.com with SMTP id l12so11724067uai.0;
        Tue, 08 Jun 2021 08:23:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GCl6GAgMReDAs/7bqxGeGzaYaC6bBej11sTZvoGeehg=;
        b=k2ZShmMu04hGzP0YkBqWvgQd6Bi/L5z25d0e9qWivXkyo6CwaH44128RmubgDldf/X
         mZTV0KHSby+j+7x82yiiV6wK/LNsQ4M60luQcNvdo3riN92OQ1RiU/W/phAzEY/dTr/5
         hcw5vdTImrf+3URDfZvPPoApnQSoqwSJgdtWJAHLzCj4MU8qAOYEeremdixWLCDDyq42
         OKI4ZKq3WwKelQm2lWeQV0zIdEfa92PEkqwqSxJejyb4Cym0mYj5EMQG3IHjxv7yAGGJ
         j3u1dEUwz9KkGuCZQ8VigadLpU5kFYclk7BQCF+lkN6UxIwBEdL7gxj0wegVwxyjXc0I
         eSWQ==
X-Gm-Message-State: AOAM532M+4aCnr/5LbxeAYj1iLeEYKuo0fVbRSNWZA/YOXEy9fIEUU5R
        jJwLdAKK0QEtzDhhhMreQpqnkLsy7882dFzYQKQ=
X-Google-Smtp-Source: ABdhPJxtLW1a83L11lI5EV/HpEvSwpwvtt1UzpSBbg4Lyf+jtHGrJZtVf73FKUKAJtYZbZrrLcOaesjIt64XjYPHo6w=
X-Received: by 2002:ab0:708c:: with SMTP id m12mr14430400ual.4.1623165837564;
 Tue, 08 Jun 2021 08:23:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210603221758.10305-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20210603221758.10305-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20210603221758.10305-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 8 Jun 2021 17:23:46 +0200
Message-ID: <CAMuHMdXHt9r52gS+PUiEAr5mjL=a3_3_DUfbfgRaiMZAqZ790w@mail.gmail.com>
Subject: Re: [PATCH v2 02/12] dt-bindings: arm: renesas: Document Renesas
 RZ/G2{L,LC} SoC variants
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Jun 4, 2021 at 12:18 AM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Add device tree bindings documentation for Renesas RZ/G2{L,LC}
> SoC variants.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>
> Acked-by: Rob Herring <robh@kernel.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
