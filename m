Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED8C9416E42
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Sep 2021 10:52:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244904AbhIXIxm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 24 Sep 2021 04:53:42 -0400
Received: from mail-vs1-f42.google.com ([209.85.217.42]:38696 "EHLO
        mail-vs1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244931AbhIXIxl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 24 Sep 2021 04:53:41 -0400
Received: by mail-vs1-f42.google.com with SMTP id y141so9280790vsy.5;
        Fri, 24 Sep 2021 01:52:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Q0BaeUQ6JCya9Tv7N3LQqrnpJ0OXcLRhpfU8bHHqBiE=;
        b=hci1YUE6hqO9rk4tscfgU5Vbp190ifZokBmXy2kyOGqM12Rx4ABoCVOfZsSUlCBGOP
         2K6gLB0gRAU3naqjlh8RRUmQMGNxotSWmh02fZXLxcTRHMX39XYr7jZV476WItkiE3l9
         6HjbMZkH50Y+kFYgwjF5GlXpdthlnd07BvLQp5sFp+l8CJ6ZxzpIVykrmbFloDPizrtH
         lYRZXSaDpZsQX/I/EXh9qzwL9dXyY7kCBhmvOBBW6o38PIB46lcrVAELr3FxBuPrQgwr
         +U7yn71dYwHqE4mF6hpdpUUoQ5L1BTbl6SOB5T5oS7njl7DbBHegZ/KIAU5JLrcpA3nC
         EpEQ==
X-Gm-Message-State: AOAM532rWE3+pPKCii/ipsUPkOrJqrLjzWqRI2ImGKXqctPOtulC65EU
        LlRjDlpF9AHoiqMK9NSWvUKR2LmuOzHHn14L/+0=
X-Google-Smtp-Source: ABdhPJxiBTlQ3j+p4XoxWuAPoNBRzlFiPHCof3z2SG+GEwyGiE85wIA8mjeRhsnp4hEYHJ3mLza4pgwgzPZkPxo253M=
X-Received: by 2002:a67:f147:: with SMTP id t7mr8152389vsm.41.1632473528503;
 Fri, 24 Sep 2021 01:52:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210922212049.19851-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20210922212049.19851-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20210922212049.19851-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 24 Sep 2021 10:51:57 +0200
Message-ID: <CAMuHMdV8purUhfMR8UdRNeWOGhTynxXkEmpm7OX9UGkX9eu_dw@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: renesas: rzg2l-smarc-som: Move extal and
 memory nodes to SOM DTSI
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Sep 22, 2021 at 11:21 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Move extal and memory nodes to SOM DTSI.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.16.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
