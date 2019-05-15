Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B26481EA2C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 May 2019 10:32:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726212AbfEOIcb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 May 2019 04:32:31 -0400
Received: from mail-vs1-f66.google.com ([209.85.217.66]:33729 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725871AbfEOIca (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 May 2019 04:32:30 -0400
Received: by mail-vs1-f66.google.com with SMTP id y6so1163731vsb.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 May 2019 01:32:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=X66aPUwhrI15Mc7843XPcMM6A4ESFD/DW+9Zr96MNzo=;
        b=FWv8P8RTDfFZj7X5zXSY/737PpUq5gR8N3qTPenf1N9ZhMQyg5zvBOfUjmSxBHeysB
         N7CQRVkYeDmEJuW4aR2UL1DyY+6iYmQ/eZQW2nMzO3GCuglYD3wUVWbF7MLwmaAYVoll
         G89zHngc0vQwCDXvSuwYk3Fnns1EM/lTuyamnaH9ayhXyYcPZzCN8+utlv+HSFRzVHEG
         jM0t0BTz5lozWAc4lBSqtzEB+HQc4qd9IiTMT3timGNc1GZAlyrBPt03xdUzYweHO/eC
         rWkKPA+s/M0SXEXHCy86Rf82rMLHoX/27PoRKzEgX2ts9J1IRwSSH0hCOo0TJ5Eshjb4
         iwSA==
X-Gm-Message-State: APjAAAUA7/tbjCr6zVnATWE+pMyFG6dq+i4HaT1pJvqeIwFKJY4KyYyp
        6jLZWokQxzuLubws2FuRDCKxiDrvMFE3u0j8v/Q=
X-Google-Smtp-Source: APXvYqx0d/VMu0XUvJd5it4dptrX7nHvGfxaba8vMIg+65dvgKxh2HnfjNpefsnqvOBezEXBft1gB56Gn3bKpvfufno=
X-Received: by 2002:a67:770f:: with SMTP id s15mr11031195vsc.11.1557909149496;
 Wed, 15 May 2019 01:32:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190515082326.6449-1-marek.vasut@gmail.com>
In-Reply-To: <20190515082326.6449-1-marek.vasut@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 15 May 2019 10:32:18 +0200
Message-ID: <CAMuHMdVNskLjMpr+RgL_+d_g7=QfO_51wWVYb_itf_19kugLjA@mail.gmail.com>
Subject: Re: [PATCH V2] ARM: dts: r8a779x: Configure PMIC IRQ pinmux
To:     Marek Vasut <marek.vasut@gmail.com>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Marek,

On Wed, May 15, 2019 at 10:23 AM <marek.vasut@gmail.com> wrote:
> From: Marek Vasut <marek.vasut+renesas@gmail.com>
>
> The PMIC IRQ line pin multiplexing configuration is missing from the DTs.
> Since the line is configured correctly by default, the system works fine.
> However, add the IRQ line pin multiplexing configuration for completeness.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Simon Horman <horms+renesas@verge.net.au>
> Cc: linux-renesas-soc@vger.kernel.org
> To: linux-arm-kernel@lists.infradead.org
> ---
> V2: Move the pin control node from iic3 controller to pmic on 7792 Blanche,
>     since there's only one PMIC on that board.

Thanks for the update!

As the tag condition from v1 is now fulfilled:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
