Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D2A624D74F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Aug 2020 16:25:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727074AbgHUOZk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 Aug 2020 10:25:40 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:35269 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726118AbgHUOZj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Aug 2020 10:25:39 -0400
Received: by mail-ot1-f65.google.com with SMTP id 93so1710534otx.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Aug 2020 07:25:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Y34XEhj4RuRufGhOxeAb3NrXjBMTTvFfjJ5tpIAlIKA=;
        b=Ecy+9vBXw8BJSluoEiDYnMCUuFYaFcN2C0DdJlxkZ+fSm/VJs575WHXawppBoFviV+
         wskjegSGxnAcpFIsUX46LFaVFq95DOKTGeTKVDHlB2tqv1IZim6YFr4zcfDTWAPfihMS
         CB6mAZn0LdhvMyLtuta/BwAXcwnpibDkIEgRfAboIic2SkuzDjQxQCy3RCy7aZhkFB3z
         QN/w/9QnJnIB7LC4OfMSdYeZviwvrnbTKQYT1jiR8neIBavEogeIw7/IqvmzuIErltxP
         40qX97EHYm5J+JKwfX1O6ieyUPOTSozRaaRKY2kwN7sIG6P1zbdY5OoxTkZKGqdbynkR
         1Tzg==
X-Gm-Message-State: AOAM533uzhIp5QoYOf8UnNjqxLCDp3LNEpxAAcrLth543vlRa5Fz9jZW
        ItO4Ewak8usqgCEbgmivnbdHT6eyIFWjrjxJ7qA=
X-Google-Smtp-Source: ABdhPJzKyhsnrhMhiPeCi+qC/XaWdNq7a1JIY8XuJ3U3BDQFZPwkl8/d7sPhA+1oNxNdAKwhzf/RzcEKN0XtsxisaeE=
X-Received: by 2002:a05:6830:1b79:: with SMTP id d25mr1958048ote.107.1598019938510;
 Fri, 21 Aug 2020 07:25:38 -0700 (PDT)
MIME-Version: 1.0
References: <87lfidho8o.wl-kuninori.morimoto.gx@renesas.com> <87h7t1ho6f.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87h7t1ho6f.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 21 Aug 2020 16:25:27 +0200
Message-ID: <CAMuHMdU7-kGCP4gZ-MD=yZh=Kjemt0tLirvqM2Dn=kWPcxzrQg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] soc: renesas: sort driver description title
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Morimoto-san,

Thanks for your patch!

On Mon, Aug 17, 2020 at 6:51 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> Some Renesas drivers are not organized, or organized by Chip number.

They are sorted by SoC part number?

> Because of it, menu table is not readable.
> This patch sort these.
>
> This patch do
>         - Collect RZ/xx in one place
>         - Collect SH-Mobile xx in one place
>         - align chip number on each groups
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

So now we have:

    $ grep 'bool "' drivers/soc/renesas/Kconfig  | sed -e 's/   /        /g'
        bool "Renesas SoC driver support" if COMPILE_TEST && !ARCH_RENESAS
        bool "Emma Mobile EV2"
        bool "SH-Mobile AG5 (R8A73A00)"
        bool "R-Mobile APE6 (R8A73A40)"
        bool "R-Mobile A1   (R8A77400)"
        bool "RZ/A1H (R7S72100)"
        bool "RZ/A2  (R7S9210)"
        bool "RZ/G1H (R8A77420)"
        bool "RZ/G1M (R8A77430)"
        bool "RZ/G1N (R8A77440)"
        bool "RZ/G1E (R8A77450)"
        bool "RZ/G1C (R8A77470)"
        bool "RZ/N1D (R9A06G032)"
        bool "R-Car M1A  (R8A77781)"
        bool "R-Car H1   (R8A77790)"
        bool "R-Car H2   (R8A77900)"
        bool "R-Car M2-W (R8A77910)"
        bool "R-Car V2H  (R8A77920)"
        bool "R-Car M2-N (R8A7793)"
        bool "R-Car E2   (R8A77940)"

What about changing all the above to match the below?
I.e. "SoC Platform support for <foo>"?

        bool "SoC Platform support for RZ/G2M"
        bool "SoC Platform support for RZ/G2N"
        bool "SoC Platform support for RZ/G2E"
        bool "SoC Platform support for RZ/G2H"
        bool "SoC Platform support for R-Car H3 ES1.x"
        bool "SoC Platform support for R-Car H3 ES2.0+"
        bool "SoC Platform support for R-Car M3-W"
        bool "SoC Platform support for R-Car M3-W+"
        bool "SoC Platform support for R-Car M3-N"
        bool "SoC Platform support for R-Car V3M"
        bool "SoC Platform support for R-Car V3H"
        bool "SoC Platform support for R-Car E3"
        bool "SoC Platform support for R-Car D3"
        bool "System Controller support for RZ/G1H" if COMPILE_TEST
        bool "System Controller support for RZ/G1M" if COMPILE_TEST
        bool "System Controller support for RZ/G1E" if COMPILE_TEST
        bool "System Controller support for RZ/G1C" if COMPILE_TEST
        bool "System Controller support for RZ/G2M" if COMPILE_TEST
        bool "System Controller support for RZ/G2N" if COMPILE_TEST
        bool "System Controller support for RZ/G2E" if COMPILE_TEST
        bool "System Controller support for RZ/G2H" if COMPILE_TEST
        bool "System Controller support for R-Car H1" if COMPILE_TEST
        bool "System Controller support for R-Car H2" if COMPILE_TEST
        bool "System Controller support for R-Car M2-W/N" if COMPILE_TEST
        bool "System Controller support for R-Car V2H" if COMPILE_TEST
        bool "System Controller support for R-Car E2" if COMPILE_TEST
        bool "System Controller support for R-Car H3" if COMPILE_TEST
        bool "System Controller support for R-Car M3-W" if COMPILE_TEST
        bool "System Controller support for R-Car M3-W+" if COMPILE_TEST
        bool "System Controller support for R-Car M3-N" if COMPILE_TEST
        bool "System Controller support for R-Car V3M" if COMPILE_TEST
        bool "System Controller support for R-Car V3H" if COMPILE_TEST
        bool "System Controller support for R-Car E3" if COMPILE_TEST
        bool "System Controller support for R-Car D3" if COMPILE_TEST
        bool "Reset  Controller support for R-Car" if COMPILE_TEST
        bool "System Controller support for R-Car" if COMPILE_TEST
        bool "System Controller support for R-Mobile" if COMPILE_TEST



Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
