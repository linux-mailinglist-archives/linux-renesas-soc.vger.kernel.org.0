Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A25F39FA8C
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Jun 2021 17:26:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232827AbhFHP1X (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 8 Jun 2021 11:27:23 -0400
Received: from mail-vk1-f175.google.com ([209.85.221.175]:44738 "EHLO
        mail-vk1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232870AbhFHP0z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Jun 2021 11:26:55 -0400
Received: by mail-vk1-f175.google.com with SMTP id k71so242121vka.11;
        Tue, 08 Jun 2021 08:24:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uEZ+9ygqZRV0kKCM7ima6YxWy+TRRzvMYCQN8gmTeiE=;
        b=Y1Eh6wQfURUVBJMauZw6xVERcvXtOrITHB26+bWKYw73gLW7kbbF0OWjold8EnhENN
         X3nCtUrwNgqDhHV5uPot9uPDd8NMdhro7K1AiPQODqtEme+xRJjICCj4vmebrrFjxu/n
         uGsaKizBZnEHwqrFuKW36dbGyyHpSXtK5wypK5vNfKBZaAif0TyO9zEZewazhoIAdNTc
         s9Y/kmrF9l+BQsu5LTDn2Tw7gFnx69k49UbdRmOIBPrDScr1DGWKS7zmy/LRjds1PJ5I
         cHavDO2WXx5wxxH9RQj6R8mxj3tn05jrWvpzX8+V9Y9c0X22O8TePouyQBM+NUZnNesM
         3x5g==
X-Gm-Message-State: AOAM532yvjGWPOhxZWPiDWxn0zoLTGCpch/Ai50tPZGaiclCbIBv11NN
        qa6i7Hw4UM4XTECAI7uYdlTlPB5k5PrHoe7eXc8=
X-Google-Smtp-Source: ABdhPJx8A7r/ieKqO9oevpfnNcLDYV1Rc/V6wOd0w1NJqo84goIBUaDjRujQNqTspzVhMzDRfhm2v5BJzaOt5jAr4Rg=
X-Received: by 2002:a1f:9505:: with SMTP id x5mr493658vkd.6.1623165883984;
 Tue, 08 Jun 2021 08:24:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210603221758.10305-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20210603221758.10305-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20210603221758.10305-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 8 Jun 2021 17:24:32 +0200
Message-ID: <CAMuHMdUx6kx1xPwmvWGs6tpuHmuGNc1Psa_xrCvyosvu1aqHqg@mail.gmail.com>
Subject: Re: [PATCH v2 06/12] clk: renesas: Define RZ/G2L CPG Clock Definitions
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
> Define RZ/G2L (R9A07G044) Clock Pulse Generator Core Clock
> and module clock outputs, as listed in Table 8.3 ("Clock List")
> of the RZ/G2L Hardware User's Manual (Rev.0.42, Feb.2021).
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

LGTM.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
