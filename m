Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C15F91F0CDA
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  7 Jun 2020 18:19:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726699AbgFGQTW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 7 Jun 2020 12:19:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726571AbgFGQTV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 7 Jun 2020 12:19:21 -0400
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A5C3C08C5C3;
        Sun,  7 Jun 2020 09:19:20 -0700 (PDT)
Received: by mail-ot1-x343.google.com with SMTP id g7so10581858oti.13;
        Sun, 07 Jun 2020 09:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Yvqqjpz8FLcRLU/Z9njJcbhcfbr9e0dc02EzTHwAy1c=;
        b=iEH/Y385SAxjITQMr8HP6Wy6Hqk3IVEl0k0mOtOrSYN4kiCc5fEAOGT6WaLlr0EmXn
         O+/GTitiKZgOruElL6myxHULmun0D9L825Qd2l9FygrLwX67fNU+EH1XL+nf99hXcqdA
         1thSwFV0DhZXjc3UpY/8DEJFf0A9OAk05SaaUHoNv6bsBPwBR5mn8h9YSeR/XeR+HNKP
         7Y9yVDledNcXcU5zXMh2U4WWnrGPgT7RYOPZh8vMsDkas/IjjFKu+Wwu0oNqzSNfocLz
         dADCf5a/On4iU+684qR9FyZWVjmtphhp2S4FnzRZR4XKVHJrHPAMMI8Xj8TpzsqJ9QI8
         wZsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Yvqqjpz8FLcRLU/Z9njJcbhcfbr9e0dc02EzTHwAy1c=;
        b=Sy4JRJOWT1CQHkz8X8FCEOrqM0AD2cPbdKzH+2wS/2/01LGZnCP8ybhUhOIJbgz9Zg
         gO254MnyIIP2jFQBDU+c6M7aOmnGi7aqCueglOGjFQXj+cSazEawJszt3BHfnuPRyCkQ
         SbaoPqm8ksPY5t/KZjp8tFdfATKOZZmCP4skVAwS4Te9moyq+f9RfKKHQucIFWI4cUnI
         DozkmHmP0HYs3PaT6gbtmf5W8WD8uxdEQ4sbyuqR3tRK7heiXLznTL2Zz/y9r1jBgEJj
         XgW6szmTpEPYoPg9kGdG2OWahCJcZUwKIJcOY3Zdhhf6Ce5yN2E78X0d2+OsY4LBl98a
         jQew==
X-Gm-Message-State: AOAM530HMLzGn6l2HJkg0RkfJADxRJL3qWUM1a3v2CUxC8C+uuPGa/75
        oRJUeJP+zLcL9d4fKCw5cSJOQFh7q0fHtrUtPf0=
X-Google-Smtp-Source: ABdhPJxuHXTvZ3k3Ejp2FG8p1vqAlKmRauM/Mz6q1l4gsB1emJvN1QNRTSYIVujyIJIu1/s6/WCTLJeKNnikSdQFjaE=
X-Received: by 2002:a05:6830:1d47:: with SMTP id p7mr9694409oth.43.1591546759531;
 Sun, 07 Jun 2020 09:19:19 -0700 (PDT)
MIME-Version: 1.0
References: <1590586141-21006-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdX+M+k-JRy1Ps=hRZR=mSuexSQbJ0+Cw1337uO6nak_qQ@mail.gmail.com>
In-Reply-To: <CAMuHMdX+M+k-JRy1Ps=hRZR=mSuexSQbJ0+Cw1337uO6nak_qQ@mail.gmail.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Sun, 7 Jun 2020 17:18:53 +0100
Message-ID: <CA+V-a8vDVa0DSX_XT=NsmBta4O=v0p_Nn9M5x9N7gw_zc0yoyg@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: r8a7742-iwg21d-q7-dbcm-ca: Add device tree for
 camera DB
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thank you for the review.

On Fri, Jun 5, 2020 at 1:27 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Wed, May 27, 2020 at 3:29 PM Lad Prabhakar
> <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > Add support for the camera daughter board which is connected to
> > iWave's RZ/G1H Qseven carrier board. Also enable ttySC[0135] and
> > ethernet1 interfaces.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts
>
> > +&scifb1 {
> > +       pinctrl-0 = <&scifb1_pins>;
> > +       pinctrl-names = "default";
> > +       status = "okay";
>
> Before I queue this in renesas-devel for v5.9, I have on question:
> As this port carries RTS/CTS signals, perhaps you want to add
>
>     rts-gpios = <&gpio4 21 GPIO_ACTIVE_LOW>;
>     cts-gpios = <&gpio4 17 GPIO_ACTIVE_LOW>;
>
Aaha the user manual mentioned RTS/CTS wasn't connected, but I tested
this with the above which disproves the Doc. Shall I post it as a
separate patch or post a v2 including it.

Cheers,
--Prabhakar

> ?
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
