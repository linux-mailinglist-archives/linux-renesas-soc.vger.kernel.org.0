Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C9FE641CA3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Jun 2019 08:51:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405127AbfFLGvX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 12 Jun 2019 02:51:23 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:40207 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403835AbfFLGvX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Jun 2019 02:51:23 -0400
Received: by mail-lj1-f194.google.com with SMTP id a21so14071907ljh.7;
        Tue, 11 Jun 2019 23:51:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pucwXE/QknbFy+/4qfyb+M5v0P4sVxwv2U7mjkNDhPQ=;
        b=Tdd922gTUNgs+cBparXTgiFy2OnNkj28qIjnZYpXK3GWHo0ULPatA1RYD99lkGhwb8
         /fJQjnDYn2oAtJgfAcClh+z5NNbocV9aFZjkd5s/bva6F2Am3EmjB/iSG1zSTcTroqCF
         icOS22CVeVXG01/Cc6X2VcfirkHwj7IeJfLiQ56cFMSJZF+GTh5wDc5OXi1+tEIaVJxG
         LbHcuIFpn0+6CkZUO9gxFqhrRtmepbJffb88XyGqqwv6tkfsKWZc/MDYS3vCfdfhkwRr
         P38ijUTSu//vXBn07mtTl0v8evEymxHBs9S+WDoYVpwgillyHqZShswJLwbeQfCYfNUT
         b1nw==
X-Gm-Message-State: APjAAAX6ZMf1O9UNIb2IrS8c+AipRNzha0pF9uATxXjP/0kpvAHzUAXl
        0pya9DEvS4FD6yEaZDlhL0beBfOA5ZfA+j+4wr8=
X-Google-Smtp-Source: APXvYqxZX3SvmUqlpQPh/u3V+83oM1xF//NYqN8Vr/nAEHhftEAUyjR8v9uMGFiio+/Md5LYozZDDc2fWeBR7ZU1zvE=
X-Received: by 2002:a2e:2b8d:: with SMTP id r13mr31488250ljr.145.1560322280979;
 Tue, 11 Jun 2019 23:51:20 -0700 (PDT)
MIME-Version: 1.0
References: <1560258401-9517-1-git-send-email-fabrizio.castro@bp.renesas.com> <1560258401-9517-5-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1560258401-9517-5-git-send-email-fabrizio.castro@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 12 Jun 2019 08:51:08 +0200
Message-ID: <CAMuHMdWPTOJTWnfjTFgz5iX6AKVcKABXJbfQoMYVR2vJXB7zkw@mail.gmail.com>
Subject: Re: [PATCH 4/6] clk: renesas: r8a774a1: Add TMU clock
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Jun 11, 2019 at 3:07 PM Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
> This patch adds the TMU clocks to the R8A774A1 SoC.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in clk-renesas-for-v5.3.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
