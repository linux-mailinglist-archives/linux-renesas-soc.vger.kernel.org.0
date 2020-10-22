Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD202295D9C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Oct 2020 13:43:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2897481AbgJVLnL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 22 Oct 2020 07:43:11 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:40782 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2897466AbgJVLnK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 22 Oct 2020 07:43:10 -0400
Received: by mail-oi1-f195.google.com with SMTP id m128so1376965oig.7;
        Thu, 22 Oct 2020 04:43:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7LNL9SMZw9qpSCk8GZhm70132hDMn3rbfgSHkf94S/o=;
        b=dzQ5usE9xENDDpj31Sqmb/Yt/vEzvbGSAgRGswtc3AiZAtSFyrqOZRs0dv1EjBkrY+
         ajhetBnCc5Ye9htTcoIg1wYISr0JZZWpyCGwDIwnSFTl5u9gBbYl8yHbo6VXgTZPdWeH
         QfMGvcjP8GGpVJujXoTIhucle7l7od+tujStENDd8ppyTaiWASJZNkMkrGOMyoAdfyIq
         KZUw5mr10sUdtgqpRe8reJJ6RAZarw0Y+zxxyfL20h7h2GTKCnphOLUjXXcpiJ7F4u28
         PtoJ4ULpOjlHOlx8E7v7HoLzq6PvxtnAoKEn8X258u4rGaiZQLWLZBBZZuezm95lGH6e
         qwYQ==
X-Gm-Message-State: AOAM5303di7elToOhlP8Vfvlao086wxeR7TA7rD74gCLXSQovzrby2NU
        CVPecnE24RRBK5oleyYG1BY87BUs2C9zJ2I7nKQ=
X-Google-Smtp-Source: ABdhPJyoWSe5gedUBlCvZliNqeh5RzoieS2KyldrSUtBmYEpnHMIT9ajIQ0m3aNgeH3Sex1CGgExiVeu86sgKxwdWjQ=
X-Received: by 2002:a05:6808:8f5:: with SMTP id d21mr1124215oic.153.1603366989748;
 Thu, 22 Oct 2020 04:43:09 -0700 (PDT)
MIME-Version: 1.0
References: <20201014145558.12854-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20201014145558.12854-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 22 Oct 2020 13:42:58 +0200
Message-ID: <CAMuHMdX6g5dh2jU5DKUiOLbxXcwPodUcrYS6=mU53F=oLAw0PA@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: r8a7742-iwg21d-q7-dbcm-ca: Enable VIN instances
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Prabhakar,

On Wed, Oct 14, 2020 at 4:56 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Enable VIN instances along with OV5640 as endpoints on the adapter board.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

I believe the "data-shift" patches for rcar-vin haven't been accepted yet,
and this patch depends on it, logically?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
