Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88EF7401B59
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Sep 2021 14:44:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242131AbhIFMph (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 Sep 2021 08:45:37 -0400
Received: from mail-vs1-f53.google.com ([209.85.217.53]:38758 "EHLO
        mail-vs1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239993AbhIFMpg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Sep 2021 08:45:36 -0400
Received: by mail-vs1-f53.google.com with SMTP id a25so5480192vso.5;
        Mon, 06 Sep 2021 05:44:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NE9yqvERx1jexGCpoCeUWapXoVcz4FJ9N8an1ofnzbQ=;
        b=MzlsFkqkOnAcC0r9u73uMseUef5dOPVub8+JPFiqA7e2bf87mBY49uCM/1AWO+rFmV
         7h/fX85Vmjjd6qldwjxiOIJyh15XHKU+y4tK2B3TYNu7vaYnxa8nTsz2fDiZgg7+LXuM
         EIZr1tpRgeeB2tYr73mErKSHbqIVKLxP5rTRRYRqD99Pml1OyB+H2of0NI54Jmgw5MqR
         Uhtq8hTZf8VydizRDyYapwQWhKGr/JCnE/McrPuslkjui3TzVv5/Me9QxIeUx7NycE0c
         tmYjkMMHuh9Nz94zrzFPFjzVMzRU6CTyGnYZlWTvsRqqFZMfjkpYdKXOcTvu1274iq9O
         eg6Q==
X-Gm-Message-State: AOAM531ZE0RbwX0xV6SqGR86ShRQY00Uy0cJltVaX12Q6gl8R2X7aiK0
        BV2Kyo4Hl/yQjTWJM/bIA7bSrY2Ed7mRO0s1iiE=
X-Google-Smtp-Source: ABdhPJx6BRR15g/gl1PImxu9CO2Y4yDk+C1QtYjUGHn+2M6q4Dhkg7/n1Eu8uVgiwswox5ZM2+E1kjYNo9ek95VR2z4=
X-Received: by 2002:a67:efd6:: with SMTP id s22mr5773494vsp.50.1630932271538;
 Mon, 06 Sep 2021 05:44:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210814135526.15561-1-biju.das.jz@bp.renesas.com> <20210814135526.15561-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20210814135526.15561-2-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 6 Sep 2021 14:44:20 +0200
Message-ID: <CAMuHMdVTsgfBd0YfVvL0gtUrZy6+tDro8A0NpC-kaeR6HLe5JA@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r9a07g044: Add external audio
 clock nodes
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
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

On Sat, Aug 14, 2021 at 3:55 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add external audio clocks nodes to RZ/G2L (a.k.a R9A07G044) SoC DTSI.
>
> The external audio clocks are configured as 0 Hz fixed frequency clocks by
> default. Boards that provide audio clocks should override them.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.16.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
