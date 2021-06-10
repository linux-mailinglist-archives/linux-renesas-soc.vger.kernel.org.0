Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA5273A2B9E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Jun 2021 14:30:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230307AbhFJMcq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Jun 2021 08:32:46 -0400
Received: from mail-vs1-f42.google.com ([209.85.217.42]:46898 "EHLO
        mail-vs1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230130AbhFJMcp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Jun 2021 08:32:45 -0400
Received: by mail-vs1-f42.google.com with SMTP id z15so1745106vsn.13;
        Thu, 10 Jun 2021 05:30:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MY8WKRn2GArViRUc7bu5Utce7nrvaxhUEO/qAgCvVVQ=;
        b=BMiX/dWpodU/8iGyWfARFady0i9PE9BeEGW/GUMhioGBeKMBwLXz3wUPL57exeNmZS
         NoSGVef1FYC6YBHiFCijNFqcrkJxKCEW6usOZ8cXDscL0rPbCQP/EMoPlEO6lu0It/Lf
         r4herY2efNzMwEOA8UmhzNb8cgbo6rNWpHkNW0PMXdAXvBheMFJu3QDaZ6JasyCgbij5
         g7sZ8xnx13IRyINyx0uA3gHCh6GFVum0aB4Ac9ceMeLr5v6QcCI25vcAORX1Ta8m36oI
         9rSfrSuAfhiRet8DbD+HE6Px0E+bVIoNR6zEY/j5wlO4atsZRKOGkU9bhR4UxpTtp0As
         xvvQ==
X-Gm-Message-State: AOAM531vDGc0tknE9O32l8+EsA+/MQ2bkVBJ8i2NLM/9JSMB7sWqXTzZ
        4UhD3mI0mGZmiWG1quryz9U0tDt6nyoFMmegLKM=
X-Google-Smtp-Source: ABdhPJzUHkDQLE/1DEZ9wffgvMmXoWFgooq0Mjku7tNI2zXV1nEKtR9HvdAkcHPbXH0RU8CrNdhe+6n1afqegsY4Qgc=
X-Received: by 2002:a05:6102:2011:: with SMTP id p17mr3724515vsr.40.1623328247559;
 Thu, 10 Jun 2021 05:30:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210609153230.6967-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20210609153230.6967-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20210609153230.6967-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 10 Jun 2021 14:30:36 +0200
Message-ID: <CAMuHMdWcJGHxjQgHWPVsgvtsz=y0=y0QTocf879MvidrpEZDgQ@mail.gmail.com>
Subject: Re: [PATCH v3 07/11] dt-bindings: clock: renesas: Document RZ/G2L SoC
 CPG driver
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
> Document the device tree bindings of the Renesas RZ/G2L SoC clock
> driver in Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.yaml.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.14.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
