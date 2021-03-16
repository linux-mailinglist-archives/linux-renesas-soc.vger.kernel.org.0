Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C130333D937
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Mar 2021 17:24:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235544AbhCPQXd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 16 Mar 2021 12:23:33 -0400
Received: from mail-vs1-f53.google.com ([209.85.217.53]:38125 "EHLO
        mail-vs1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235742AbhCPQWb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Mar 2021 12:22:31 -0400
Received: by mail-vs1-f53.google.com with SMTP id e21so16532505vsh.5;
        Tue, 16 Mar 2021 09:22:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MzgZ/YC5LPWruO2ySDLUBwGJe2XNmNius6rv5BDGjSA=;
        b=LX0QRTRMel18LsQlMbnG43Av+zCSijQzFK1+sYkVEORhslgeR47Vxhy0XWgidTflnm
         FshJArgAlCCXW+NROHykFqK5eC6uJAi5BPPOoECbPeDhru6ttq3OZ99Aat5d6pYtPJgF
         vzGyXiDnXKim1ZKpLO/WIslF8+6A407FDSTnhiUK0Cld8OWC22X+h2OIiuFg/28oDM52
         tAw3zPAZ90ewoOPp8AocslJduWgPlG6PDlxn7CcAMVKO9J3ratYAZI327uVPTu1qiu1K
         MoLXdHa9KPVfYkSQWTrla5/ZNudzYQgMGZQtWwY8RFgr/tKONfetZmRwCi96EoVUNUcz
         giSQ==
X-Gm-Message-State: AOAM532erNSgRG+OkGAJu6B++asYEG7k54d8ldzVcNZ+2L/gI89kNiHp
        xuHhrevnQ7S0LSj85eRKf72lyU0wXVLtJLoKI3Y=
X-Google-Smtp-Source: ABdhPJxl6m9KF1w3bYAumUZKmwAHSccUPMrWTeYX1Eh547gKwucsB5CR3lIj+/9tEmQ0mmHbEKOUmuyiB4SPdlwHAVI=
X-Received: by 2002:a67:fe90:: with SMTP id b16mr37142vsr.40.1615911750195;
 Tue, 16 Mar 2021 09:22:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210316140538.2403985-1-geert+renesas@glider.be> <CAL_JsqK+B+FqoR8CVcWHyEjmnpKivsacppX=nw-4ZMWHemx=tA@mail.gmail.com>
In-Reply-To: <CAL_JsqK+B+FqoR8CVcWHyEjmnpKivsacppX=nw-4ZMWHemx=tA@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 16 Mar 2021 17:22:19 +0100
Message-ID: <CAMuHMdXN7+_OLLeKR8Tiiswbjk0Y9v4NOVuGZstq=YZFKCgPBQ@mail.gmail.com>
Subject: Re: [PATCH v4] dt-bindings: clk: versaclock5: Miscellaneous fixes and improvements:
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Luca Ceresoli <luca@lucaceresoli.net>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Adam Ford <aford173@gmail.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:MEDIA DRIVERS FOR RENESAS - FCP" 
        <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Rob,

On Tue, Mar 16, 2021 at 5:11 PM Rob Herring <robh+dt@kernel.org> wrote:
> On Tue, Mar 16, 2021 at 8:05 AM Geert Uytterhoeven
> <geert+renesas@glider.be> wrote:
> >   - Remove unneeded reference for "idt,slew-percent", as vendor specific
> >     properties having a standard unit suffix don't need a type,
>
> Care to also fix 'idt,xtal-load-femtofarads' which was recently added?

Sure, stay tuned for v5.

(meh, that should have been "femtofarad", but given "picofarads" ...)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
