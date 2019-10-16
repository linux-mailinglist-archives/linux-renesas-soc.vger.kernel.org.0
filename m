Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2EA52D8BCD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Oct 2019 10:54:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733038AbfJPIyY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 16 Oct 2019 04:54:24 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:43653 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732135AbfJPIyY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Oct 2019 04:54:24 -0400
Received: by mail-ot1-f66.google.com with SMTP id o44so19463607ota.10
        for <linux-renesas-soc@vger.kernel.org>; Wed, 16 Oct 2019 01:54:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eE0fE70lvKBK40kuTLTesxoLAh4ymv8unjZ71vsj99c=;
        b=eRbwJ3oLNPengpweDJfmtwW/Ja2gYRCihv18bot16Z6z/rSIJP1JA9VP9zC3zfryvh
         SfD9DCQ/uxu7wksZSEHfu31LxV9KZ9s4ZPFnIfdrKhryiv/4ETDDp9PK8ZhcOt9ojz8Y
         gQ2NnAbnPxeftqmk+EqAHCL3jS5EsHqTOOTnqmtoaWNyBHpcI7ee0zDrNgwBlrvnu4iW
         g+77qKKRuhQ9yPIXzLSQZYE7gxtivvqGlMti/F0F05wff9dxUL7+N2AEUVXgSgahOl1y
         l2934vIVcckeGpkEzqvqva8FuwRlCO5DuJgJGHfswzwKsQoZFkkenheWiCb8lT1KF48U
         QqVw==
X-Gm-Message-State: APjAAAWbfmgsPkz2RmfWgYiShRwHcx9xjN9B5n5xFhqNj9OFwQFI6YTt
        s/rxr9ncWZE3LSQrML5F5K2BYlS9VZEtKZq2mLg=
X-Google-Smtp-Source: APXvYqwigLMDNG6pynTRnnXvWfpOvaEqJfvYhD6FOr/bOOIHmYQcRcHjfvubWgsoqlcfuY96Y0U0c26kOtPChigjN50=
X-Received: by 2002:a9d:7345:: with SMTP id l5mr23211247otk.39.1571216063456;
 Wed, 16 Oct 2019 01:54:23 -0700 (PDT)
MIME-Version: 1.0
References: <20191007102332.12196-1-geert+renesas@glider.be>
 <20191007102332.12196-18-geert+renesas@glider.be> <20191014175742.GA10194@vmlxhi-102.adit-jv.com>
In-Reply-To: <20191014175742.GA10194@vmlxhi-102.adit-jv.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 16 Oct 2019 10:54:12 +0200
Message-ID: <CAMuHMdU2CbuaS6yd8BTmkSx4h_kGF-ca2BRwjUcOaaX8EN02fA@mail.gmail.com>
Subject: Re: [PATCH/RFC 17/19] arm64: dts: renesas: Add support for
 Salvator-XS with R-Car M3-W+
To:     Eugeniu Rosca <erosca@de.adit-jv.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Eugeniu,

On Mon, Oct 14, 2019 at 7:57 PM Eugeniu Rosca <erosca@de.adit-jv.com> wrote:
> On Mon, Oct 07, 2019 at 12:23:30PM +0200, Geert Uytterhoeven wrote:
> > Add initial support for the Renesas Salvator-X 2nd version development
> > board equipped with an R-Car M3-W+ SiP with 8 (2 x 4) GiB of RAM.
> >
> > The memory map is as follows:
> >   - Bank0: 4GiB RAM : 0x000048000000 -> 0x000bfffffff
> >                     0x000480000000 -> 0x004ffffffff
> >   - Bank1: 4GiB RAM : 0x000600000000 -> 0x006ffffffff
> >
> > Based on a patch in the BSP by Takeshi Kihara
> > <takeshi.kihara.df@renesas.com>.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> >  arch/arm64/boot/dts/renesas/Makefile          |  1 +
> >  .../boot/dts/renesas/r8a77961-salvator-xs.dts | 31 +++++++++++++++++++
> >  2 files changed, 32 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/renesas/r8a77961-salvator-xs.dts
>
> It is common practice in Renesas BSP to specify the SiP memory
> split by suffixing the DTB names with '-{2,4}x{2,4}g' [1].
>
> Has this ever been discussed on ML?
>
> Here in particular, it would allow M3-W+ 2x4GiB Salvator-XS and
> M3-W+ 2x2GiB (or any other DRAM split flavor of) Salvator-XS to
> coexist in harmony, if the latter pops up at any point.

With mainline U-Boot, the memory configuration is passed from ATF
through U-Boot to Linux, see e.g. "ARM: renesas: Configure DRAM size
from ATF DT fragment" [1], so there's no longer a need to maintain
multiple DTS files.

[1] https://gitlab.denx.de/u-boot/u-boot/commit/175f5027345c7feaa41e8f4201778814bf72fe37

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
