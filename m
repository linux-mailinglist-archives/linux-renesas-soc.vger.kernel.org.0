Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F31B426757
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Oct 2021 12:04:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239488AbhJHKGE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 8 Oct 2021 06:06:04 -0400
Received: from mail-vs1-f52.google.com ([209.85.217.52]:33381 "EHLO
        mail-vs1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239040AbhJHKGD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Oct 2021 06:06:03 -0400
Received: by mail-vs1-f52.google.com with SMTP id 188so10006228vsv.0;
        Fri, 08 Oct 2021 03:04:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IG1zG8hjjixHU5HadJfOCwY+Dd3QiJXF0mBzg0TG0Z4=;
        b=a9MyF9RA4/QebD2MvLBzLnBlwea884dlZAp0cFuufuxyDuGZBgWKLkIcwcTSZNc6Wa
         W9oFUNzrzX+OKcDButQYI1hOJVco4tXCDtFeMM8lfndhxx8PTlyKDq9/XkkupSRtr9sI
         c4SNKcie/4KLdzdIdR8kTmqqrwqd0EUvo2x+WoA4Ol3o+Vc6guFZZwqYEGuqTPojaosz
         tcLYx1aRDJjkB1ja4UD7nr7xtE4ROhTjtTQmwdXZ8DSW/YfQGrRA3Y9lFd87oaA2h6wb
         W2vyY8zJp3bofRzSVnJAI+fD5RoclXwNgC/FlVTl1v3Duk95xA8ZNSYyhnqU/qjZADsO
         s1HQ==
X-Gm-Message-State: AOAM532H+3/+XfFLGVqSPbjGDRdqlLUawnT9YnZnipkWIMbfYkcTASiT
        EE344qF+hUbNE1fHh5iVZpyaxnHWDWrO7vG9D24CgjAx
X-Google-Smtp-Source: ABdhPJz5HbXHeyLHFAe7u3Yd2zr2xWxyb/vDETASScdAbDpF5lPlEo+OLkoFyRqu5BCGdnPBDFYhGrat1nSelkh2fmo=
X-Received: by 2002:a67:d111:: with SMTP id u17mr8361098vsi.37.1633687448326;
 Fri, 08 Oct 2021 03:04:08 -0700 (PDT)
MIME-Version: 1.0
References: <20211007155451.10654-1-biju.das.jz@bp.renesas.com> <20211007155451.10654-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20211007155451.10654-2-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 8 Oct 2021 12:03:57 +0200
Message-ID: <CAMuHMdVQ5nZGUZnAYmdzEu0cavZYDTG4K86WRQ7z4n6umPj3fA@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: renesas: r9a07g044: Add SDHI nodes
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Oct 7, 2021 at 5:55 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add SDHI{0, 1} nodes to RZ/G2L SoC DTSI.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.16.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
