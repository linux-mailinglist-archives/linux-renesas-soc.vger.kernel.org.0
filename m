Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C46421D5DD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2020 14:25:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729772AbgGMMZW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Jul 2020 08:25:22 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:45173 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729757AbgGMMZV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Jul 2020 08:25:21 -0400
Received: by mail-oi1-f193.google.com with SMTP id j11so10766551oiw.12;
        Mon, 13 Jul 2020 05:25:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GnGGMntnoiilMQzeVa9S2/2zE2fDS9+6boTIn1/vaBU=;
        b=BsY+TqBs+JHBDt00+ilvz6uPZATFmXdChb/2oAE2SRBizA8uXJ1xRQG76O5fR0yfCZ
         m6J7+mhk/HHs0i9+dLCP9WpLheV0VyAczRsNqh+I+SP+jZlRi1dZheORmCm5KZe6vhKW
         siFfztqComUmTBXrQHUzb8HEyhkaInCTh+UQI1yZ/jYnGQBBFQtkYse0sF6zHtH2m066
         bF8Tv//P/oSK5o84ddn4Ze2BmYHqVi2wG5/krJ6r4HQ0kOkMx3iyVC6BkkxeC11hu+Th
         JYCc4PmLFYbfQz9w0gLSBeYkya0ugj6B4otd85KYRT+73Xja7mKSA6HD8ldBNlYMYls8
         72lg==
X-Gm-Message-State: AOAM532mS7AgKuGK7mQAlOK+0Fm/VuEO1dyy9b6Qun+rCqszd5VVxA0F
        4RYa3n2qJefbgdwmsjjWgDHEbUjvRzFKn5lgv5A=
X-Google-Smtp-Source: ABdhPJwAmhwu9B+iTktNne5eszduBaZaQJ5rUPIJfmOPf4UCVscP5R0scs62WV8RJybswCfGr8QUZZfHzjRAE0VJ3Tw=
X-Received: by 2002:aca:ac10:: with SMTP id v16mr13076978oie.153.1594643120559;
 Mon, 13 Jul 2020 05:25:20 -0700 (PDT)
MIME-Version: 1.0
References: <1594230511-24790-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594230511-24790-8-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <1594230511-24790-8-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 13 Jul 2020 14:25:09 +0200
Message-ID: <CAMuHMdWOimKWnkGe=wX5LVqSj2ayxZAeSG19-tATRRnm5mC-sA@mail.gmail.com>
Subject: Re: [PATCH 7/8] arm64: dts: renesas: Add HiHope RZ/G2H main board support
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Jul 8, 2020 at 7:49 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> From: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
>
> Basic support for the HiHope RZ/G2H main board:
>   - Memory,
>   - Main crystal,
>   - Serial console
>   - eMMC
>
> Signed-off-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.9.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
