Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 943CC39FA6C
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Jun 2021 17:25:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231363AbhFHP0Q (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 8 Jun 2021 11:26:16 -0400
Received: from mail-vs1-f51.google.com ([209.85.217.51]:45039 "EHLO
        mail-vs1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232034AbhFHP0E (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Jun 2021 11:26:04 -0400
Received: by mail-vs1-f51.google.com with SMTP id x13so2656121vsf.11;
        Tue, 08 Jun 2021 08:24:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Wx/M/vTCLzfAljvUsfDDC4hJP/0AZQpZIen1/HK/Vmc=;
        b=PsnzhnDMDSVuw79UxY+VunKzhIipArXAZpMTDaXC66NWUTW3Hl507CXlJgq1ITWFWj
         p0Z42BjmrQh0eWmVXn/Za1DAdSZXcWTxQPVWJN1TKu8TwGXK5e4o6VuSZZhl80JzHmpk
         bINq570xRWq3RLNLiypaytCnkViHyrLbSI3ZUBUzSEhNFj7PB329HnOgrIuWASDLGzFb
         ohvXM8+dvxUa/gQNVYmtFAXUMGnHhlsN1ge7//viGDnGx2DV3P4iQ9LVyOseEHMBn979
         NAvUM2mdjErCWXVrsWrncwc3sz0eYAl2GrIWU5Ux5zv/Dfazcnrk00+yqmhDU34v487a
         3mqg==
X-Gm-Message-State: AOAM531kJd5WHGVZi1fmSeX4IrNIup4PTfe8LRPkExJNNB/8c3Afk29a
        e32MzBeUr1HkhSScCXxjvViH8zoUJuK+5CpuNwI=
X-Google-Smtp-Source: ABdhPJxUTGTA7RWZ/pMIrdZXxg8bzFtl4gl22fyPZdmiPQjuEV1RWdBcq833Nq8NonhQ83nFtMW9StC/w//jKatGSc4=
X-Received: by 2002:a67:efd6:: with SMTP id s22mr394812vsp.3.1623165850476;
 Tue, 08 Jun 2021 08:24:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210603221758.10305-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20210603221758.10305-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20210603221758.10305-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 8 Jun 2021 17:23:59 +0200
Message-ID: <CAMuHMdXgMEB3YKJipbSmXuVE-BAwhHJ1JxOBRqziVYXAn18ZnQ@mail.gmail.com>
Subject: Re: [PATCH v2 03/12] dt-bindings: arm: renesas: Document SMARC EVK
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
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
> Document Renesas SMARC EVK board which are based on RZ/G2L (R9A07G044)
> SoC. The SMARC EVK consists of RZ/G2L SoM module and SMARC carrier board,
> the SoM module sits on top of carrier board.
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
