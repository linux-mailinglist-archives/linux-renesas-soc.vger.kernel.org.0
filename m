Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4D2F3A2BA4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Jun 2021 14:31:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230199AbhFJMdh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Jun 2021 08:33:37 -0400
Received: from mail-vs1-f43.google.com ([209.85.217.43]:37421 "EHLO
        mail-vs1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229937AbhFJMdg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Jun 2021 08:33:36 -0400
Received: by mail-vs1-f43.google.com with SMTP id f21so1766705vsl.4;
        Thu, 10 Jun 2021 05:31:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=08jpqaqjMBquAJbVxUlmQz04OQKPoM0VYJHIDUfmrEo=;
        b=EmapAsN5AgCLnk5whgzMRd1Af/6RS6V4R3Bq7c2ItD/1FNwzySfglqsokQjquIILI1
         5muSDGQh/DPjt+2Dq597ZOn6utXNdj0Sr8UiBkjk3y5MqQkHE+n+xosD+GUVW+ILiOv3
         Qv29r1ypFHPY+hlUodoX24jBIR3RF6Ciu+Y7/hgW3Sb8TObGne5tV+DDwdCXK19l/htL
         i1msgl0t96o4fiXEaO1y0n3n3JrHIRazju9pUIOxlXOS4zsF1gyR0qh5KcI6KKWbImDv
         c50WTBLeJE4SY/0gJNT71Kmm7eYAE2eQjoM46zmCazo4J8S3znuh/09vcmHDlHseD2ef
         Z1Pw==
X-Gm-Message-State: AOAM530ZLO3+HGeQ1YPrd3C48iUhUhzuUHycEC7suRSKKoUjzOoJmk49
        MI7+Rm+qgSz0zUJTuWtw0h+n1DHkCVB1Ux1ojgo=
X-Google-Smtp-Source: ABdhPJwQNrgjh3H9DPIVwXAmbg3JYZlI9gIJnCLIRt8n+YCXFKPj4IVYMRKkvUPWz4GutkNh6nzAUsTow4Fthc79Nlk=
X-Received: by 2002:a67:efd6:: with SMTP id s22mr4393021vsp.3.1623328287879;
 Thu, 10 Jun 2021 05:31:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210609153230.6967-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20210609153230.6967-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20210609153230.6967-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 10 Jun 2021 14:31:16 +0200
Message-ID: <CAMuHMdXyTAnV7sPZaWBbp1fQAkEdZc-kvwiHQB0iMJOL7zJfRQ@mail.gmail.com>
Subject: Re: [PATCH v3 06/11] clk: renesas: Define RZ/G2L CPG Clock Definitions
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Jun 9, 2021 at 5:33 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Define RZ/G2L (R9A07G044) Clock Pulse Generator Core Clock
> and module clock outputs, as listed in Table 8.3 ("Clock List")
> of the RZ/G2L Hardware User's Manual (Rev.0.42, Feb.2021).
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v5.14.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
