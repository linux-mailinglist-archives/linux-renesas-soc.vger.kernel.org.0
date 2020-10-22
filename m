Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 733BC295F58
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Oct 2020 15:05:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2899212AbgJVNFn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 22 Oct 2020 09:05:43 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:38704 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2507266AbgJVNFm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 22 Oct 2020 09:05:42 -0400
Received: by mail-ot1-f66.google.com with SMTP id i12so1408292ota.5;
        Thu, 22 Oct 2020 06:05:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8FFAd/eJZE1Yn1pz9IpvcrWplNn+a/oQdfzvpZYK5X0=;
        b=AjHU5PzzFce/QIg303hKIvlFus6G2c1kfviYvyNRwVzxO78n6l+506JAY0yA+8zCqr
         +xgkv2XdcR+suiU98la4Y5J2DH4sv9iN+4iIbynZBqL3QSQGmV2qYOlXTjKFQUBED4Al
         phwEzoyDhDd/cw/9Ejl2f7yUsDD7m8g02+bz5Vrg5zHPQutw/CSblC7zgGLkWET19DVn
         v9srkkfBHcMV/YSsgR8KLlf69z8d+hHmBtu+1JqgwHr1E1DVj8gCQ5AwPFubF8cuDUni
         BGqin5IDSCRxlQQQ7Ono4hAofKLl89xDezfUb1KUwABBDPU6Np24kDgKj0DZKaqi5NBB
         1KSw==
X-Gm-Message-State: AOAM530Zpk31ybUORGGNlfZtXMaTB3z5RnL7DFIAAg/wPBvaAwEoEeUn
        3P1Atr9R/mhOG+LYrBVAi4wO/Z03vnIdqOj1x54=
X-Google-Smtp-Source: ABdhPJywLgvsw0OStkR4P9MyJaZd3A1JOy3t/IQFaQV5YWbCduI41fzTz1M/mU+H9MCaXB4x8Cfk+5gTBhd9lkPivhg=
X-Received: by 2002:a9d:5e14:: with SMTP id d20mr1652961oti.107.1603371941785;
 Thu, 22 Oct 2020 06:05:41 -0700 (PDT)
MIME-Version: 1.0
References: <20201014145558.12854-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdX6g5dh2jU5DKUiOLbxXcwPodUcrYS6=mU53F=oLAw0PA@mail.gmail.com> <CA+V-a8vNGtC9bAhAf+xX-pYqjEmT1z8nNcChb9dSvRF9GUQqKw@mail.gmail.com>
In-Reply-To: <CA+V-a8vNGtC9bAhAf+xX-pYqjEmT1z8nNcChb9dSvRF9GUQqKw@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 22 Oct 2020 15:05:30 +0200
Message-ID: <CAMuHMdUfEtd5-LGqKA_B98Z8TXAiyQorZaRdeTZVPsF7uDDH3g@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: r8a7742-iwg21d-q7-dbcm-ca: Enable VIN instances
To:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Prabhakar,

On Thu, Oct 22, 2020 at 3:02 PM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
> On Thu, Oct 22, 2020 at 12:43 PM Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
> > On Wed, Oct 14, 2020 at 4:56 PM Lad Prabhakar
> > <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > > Enable VIN instances along with OV5640 as endpoints on the adapter board.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > Thanks for your patch!
> >
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> > I believe the "data-shift" patches for rcar-vin haven't been accepted yet,
> > and this patch depends on it, logically?
> >
> They have been accepted and is currently in linux-next [1] (should be
> part of v5.10)
>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=e88349437654f9d1b3c144049b9990026f911e56

Thanks, I seem to have missed that in my git grep output earlier today.
Will queue in renesas-devel for v5.11.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
