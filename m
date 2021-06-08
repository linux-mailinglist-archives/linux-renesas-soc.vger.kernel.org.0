Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BB3E39FA8F
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Jun 2021 17:26:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233233AbhFHP1g (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 8 Jun 2021 11:27:36 -0400
Received: from mail-vk1-f180.google.com ([209.85.221.180]:43539 "EHLO
        mail-vk1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232956AbhFHP1C (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Jun 2021 11:27:02 -0400
Received: by mail-vk1-f180.google.com with SMTP id d13so240842vkl.10;
        Tue, 08 Jun 2021 08:24:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ad+EBgofQNw1MfBBcdhLWexkoajVnv5JnIhLXQOx13o=;
        b=YJW+iaoLs9yoJlGZqtEHZx7VHsyIN94S4n91m4BeScx519XZJkEy3sVT/FtSwoHVoe
         457eIheSXiL4Ylwn7TdQh7+GO0UQINg4rr5L+SlmtTKL2+odSyqghVtbAI3KlerZ/BTq
         S8UBKXoqsVqUHff5J/EIiU24XxMm85fNxdY7WQ73r1QgH8/XQNqLXBOZj1ag+kdyTO5l
         vG/6q/ezNXIhMITBpZ19QxrFTP6Zo4pgYM5Uaoj/DUfgzrGvlJ4oS81URCiRuxO8zVBz
         4SQpE1bvWdpvHQHsBFMFkW1eBjokb+XSHVQ3Q4jZZaEh5HPcxub2UbtZw2LMeznEOFyo
         jTXg==
X-Gm-Message-State: AOAM531KiRZFU4VyZSIw1bJXTYVymhOIaWZKX5NBYI52R0lf6hrImDDt
        gi3mRCmS54VtG6u9jgJmXPsYI+x6NyeYMb/04jE=
X-Google-Smtp-Source: ABdhPJxFvJflEZlUr55+YSzTOMgbS4a7skjPqZXcucnn5AZVvlKzPy0Ni14TW7ujM4pgHc4clcRKAeENUXDtTdCvKRQ=
X-Received: by 2002:a1f:b4c5:: with SMTP id d188mr396167vkf.5.1623165894383;
 Tue, 08 Jun 2021 08:24:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210603221758.10305-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20210603221758.10305-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20210603221758.10305-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 8 Jun 2021 17:24:42 +0200
Message-ID: <CAMuHMdUqJFnkK=0tX10ud-3vZFyaQ7p8oKxxuWnrY8Z6cbM2qA@mail.gmail.com>
Subject: Re: [PATCH v2 05/12] arm64: defconfig: Enable ARCH_R9A07G044
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Jun 4, 2021 at 12:18 AM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Enable the Renesas RZ/G2L SoC variants in the ARM64 defconfig.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
