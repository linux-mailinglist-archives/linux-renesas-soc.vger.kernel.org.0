Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 845272DD0C2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Dec 2020 12:50:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726291AbgLQLsd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 17 Dec 2020 06:48:33 -0500
Received: from mail-oi1-f178.google.com ([209.85.167.178]:37210 "EHLO
        mail-oi1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725988AbgLQLsc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Dec 2020 06:48:32 -0500
Received: by mail-oi1-f178.google.com with SMTP id l207so31873542oib.4;
        Thu, 17 Dec 2020 03:48:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Y9xB6D/W3k8umguBfnnqeO8oQ/2IiZz/QJstabN5T7w=;
        b=J+IOkTbQtmxAA1XW0U10KDAUPR2W/wVXA4RlYJ7PsE6AS+TTYIIolJWzavwSeffc0H
         elJWuMBmRGrZSZIf9PlzUYiHRMwvv9X8hDkQfya80yo4gAP6V57mKxfjuPWeC+8BZl7t
         N4uuzaDLpKvbUTY18UtFTxyM++Z43ZIiLHuP6XUO93RjDs1Oahb9Suc6bCuzqIxBLW6S
         Q4ol/USUjcPCKuRFiJ6bUExmc4i67QnBS4+Weti742FKJ8G6ys4QkZHAoOsJe8ei9kTz
         Ya+ICmUXe0UwABgEWGFLNiR9ZYnO+9LKxW6RlQiH6t6kCOaoL/TDndEtUDEq6ugXGRbz
         akDA==
X-Gm-Message-State: AOAM530g6Jx0FTaRgP3JqTfjYe4nlmpvie26KLi4Ux8WEmXNovCKWsnp
        hG6RFgvzP1Sd4vfhTCjdz0Kr7d6ynbdKy7v7iQ0=
X-Google-Smtp-Source: ABdhPJyGq9XFxL3/QNAeh7KpIJlpKYjssH+UH7JVszjpu64ESYgeg9GFh0bo1wfVhQ+jZA3RQO2mDS+VE0GEmt/8Ps8=
X-Received: by 2002:aca:5c08:: with SMTP id q8mr4544172oib.54.1608205671229;
 Thu, 17 Dec 2020 03:47:51 -0800 (PST)
MIME-Version: 1.0
References: <20201213183759.223246-1-aford173@gmail.com> <20201213183759.223246-16-aford173@gmail.com>
 <CAMuHMdUjaqWE9GmW+JuxHjUJe4XvB=AtgBv_kFtDomHTwF7J-w@mail.gmail.com>
In-Reply-To: <CAMuHMdUjaqWE9GmW+JuxHjUJe4XvB=AtgBv_kFtDomHTwF7J-w@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 17 Dec 2020 12:47:39 +0100
Message-ID: <CAMuHMdXx9HYzHW2YerZpaYSBQL0O9TeTd17wBCxFts24ABZsBA@mail.gmail.com>
Subject: Re: [PATCH 15/18] arm64: dts: renesas: beacon-rzg2m-kit: Rearange SoC
 unique functions
To:     Adam Ford <aford173@gmail.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Adam Ford-BE <aford@beaconembedded.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Adam,

On Thu, Dec 17, 2020 at 12:41 PM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Sun, Dec 13, 2020 at 7:38 PM Adam Ford <aford173@gmail.com> wrote:
> > In preparation for adding new dev kits, move anything specific to the
> > RZ/G2M from the SOM-level and baseboard-levels and move them to the
> > kit-level.  This allows the SOM and baseboard to be reused with
> > other SoC's.
> >
> > Signed-off-by: Adam Ford <aford173@gmail.com>
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-devel for v5.12.

Sorry, spoke too soon. What happened to:

-       pinctrl-0 = <&du_pins>;
-       pinctrl-names = "default";
-       status = "okay";

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
