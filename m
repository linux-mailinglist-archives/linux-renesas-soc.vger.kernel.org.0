Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD48E422ADA
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Oct 2021 16:20:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235602AbhJEOVy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 5 Oct 2021 10:21:54 -0400
Received: from mail-ua1-f46.google.com ([209.85.222.46]:42515 "EHLO
        mail-ua1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235524AbhJEOVx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Oct 2021 10:21:53 -0400
Received: by mail-ua1-f46.google.com with SMTP id c33so14972252uae.9;
        Tue, 05 Oct 2021 07:20:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZsiLQowr4dhRO4ZjojPIeEJxCcz4NxfUulcGoFnBsRg=;
        b=iMOPzSUmxXMNBW7Zqo7fLpZJpt5ejyvLoiVrXucMVMkbnGKLIUkZa+aA+7nyL06Gki
         qcGZ4zSz+3FVOspYCvU40lDVwoYfEtOgaqbCuKu0sMzMXFPyt7oXxyXdnWPOXJssIANw
         aTIH3QzD6pGskMYiL+cNpr6x8y7Jwc4iqt/+67qPY+Jt7rW7Y25mUhd5jI2edDAO41Ar
         A77NmeptTANEFdNHvrRYWqhNzjIkMkTdPeDgp7NvGGHLsigf9Ycn/Dtw4N9HDp2lcrSU
         Pd5zq9N6xlB+SNq9U0GXZl6jMI73MEtjdeat7PoV0wrfsxiTCE5y2SfugAiEXX6bptQs
         arJA==
X-Gm-Message-State: AOAM532N+vyECXsGKZaaOfD7inV/v5lkAl8cVYhrNwMXGBiNWKeZZoCg
        kdL3iOeewQmO19ZH5sy7OmqXbOHti6k0b5BfDy8=
X-Google-Smtp-Source: ABdhPJwbX0bv3d6cnzEiJdyoXXCC2z0J1QalhQzgibPPXevn+FB0srI+5BaF2vwcsf9msNCU0KS+wu3Pezau/u9StB0=
X-Received: by 2002:ab0:58c1:: with SMTP id r1mr12347091uac.89.1633443602509;
 Tue, 05 Oct 2021 07:20:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210928130132.15022-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20210928130132.15022-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 5 Oct 2021 16:19:51 +0200
Message-ID: <CAMuHMdVoAkJHedLwjN6v2Tqtc7Rj36PJ3DotSB-QXg-_VcAHVQ@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: r9a07g044-cpg: Add clock and reset entries
 for SPI Multi I/O Bus Controller
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Sep 28, 2021 at 3:01 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Add clock and reset entries for SPI Multi I/O Bus Controller.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v5.16.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
