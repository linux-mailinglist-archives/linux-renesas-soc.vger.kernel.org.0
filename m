Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 498ED2C6325
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Nov 2020 11:35:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726039AbgK0Kdy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 27 Nov 2020 05:33:54 -0500
Received: from mail-oo1-f66.google.com ([209.85.161.66]:38652 "EHLO
        mail-oo1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726034AbgK0Kdy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 27 Nov 2020 05:33:54 -0500
Received: by mail-oo1-f66.google.com with SMTP id z13so1000813ooa.5
        for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Nov 2020 02:33:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Dt1GCnG5RHmVGHvSCBLpP5rg1mJjgGa7hOsnvGhVKhc=;
        b=Je2hSfANXRkbIxhRGCL625f0kLUZ46Z89CyZXI2Eam2fSjCSSjWXYliN32WgSGwTk0
         CQ9I/b/roPd+auOZBQNkwj/FdCjvIiXfQMUxjmTvKwGluNYjP2Oio51WbssnNbvEAkJ2
         +MXjmhiJ+6WvKc0UEEg7KvPZPx1/ZbFQnqe6cx5Vc0XXdMSIR9YfXudko1/NEFhPRHO+
         zpFPj3TvMCVC3lF6+LJBMtoOxyFo0ZmVeHO7G6iHRotFdsbP2s6Q5ThAvI6OQQ+YZGok
         34qWpY7bAW2oDvetdI0vsC12hyi8ot1GEPE4hAE2tckvBsRf3rL5VTw0HUJh/49iWTB3
         qkWw==
X-Gm-Message-State: AOAM531owZTsWYiOtY/JAwwQx/Y8WXB8o/Ca82ttq+FEsAbC4OGW94BP
        QhFxgXBMyIaRfBZJkxANM9aZBHa/6eD8o0MpjCI=
X-Google-Smtp-Source: ABdhPJyFTFbTLIF2z5e2cY1Qu1D6GOMtZrX10ErPsWxx6qHfLrMM2lCz9w7V9RmO9SO/7FSKpVjslreNdxD8c2GQ0Do=
X-Received: by 2002:a4a:274b:: with SMTP id w11mr5097710oow.11.1606473233890;
 Fri, 27 Nov 2020 02:33:53 -0800 (PST)
MIME-Version: 1.0
References: <20201126172154.25625-1-uli+renesas@fpond.eu>
In-Reply-To: <20201126172154.25625-1-uli+renesas@fpond.eu>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 27 Nov 2020 11:33:42 +0100
Message-ID: <CAMuHMdWt+NBD4u4iCf=OdSyFBBW0HU3HwWYyOK3tX87cUOSMwg@mail.gmail.com>
Subject: Re: [PATCH 00/11] pinctrl: renesas: R8A779A0 (V3U) device support
To:     Ulrich Hecht <uli+renesas@fpond.eu>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>, hoai.luu.ub@renesas.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Uli,

On Thu, Nov 26, 2020 at 6:22 PM Ulrich Hecht <uli+renesas@fpond.eu> wrote:
> This series adds V3U pin control support for EtherAVB, CANFD, DU, HSCIF,
> INTC-EX, MMC, MSIOF, PWM, QSPI, TMU and TPU.
>
> It has been ported from the BSP and has been compile-tested only. It
> depends on the "pinctrl: renesas: basic R8A779A0 (V3U) support" series
> posted earlier.

Thanks for your series!

> Ulrich Hecht (11):
>   pinctrl: renesas: r8a779a0: Add EtherAVB pins, groups and functions

This patch depends on i2c support, which was not included in your series?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
