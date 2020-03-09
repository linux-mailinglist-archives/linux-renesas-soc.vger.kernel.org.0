Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0946117DC48
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Mar 2020 10:21:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726071AbgCIJVn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 9 Mar 2020 05:21:43 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:39420 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725796AbgCIJVn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Mar 2020 05:21:43 -0400
Received: by mail-ot1-f66.google.com with SMTP id a9so2637779otl.6;
        Mon, 09 Mar 2020 02:21:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0chbd4nwR5irzruqlvYBPN4eYq66a85QmEWWjg+J+Uc=;
        b=ftFFfTmlYSK+tVcqUNZjYko0G2v9U+ke+zdonK/orm2gDzNYhv+udaO+j4nWtck6BD
         gWaEstT1hw12aUX8adrBxxYlAumYmPGUHDQd7X8uqjE1+W+PGuGqmbEXPwDKV/MlAOZO
         +fvlDT4hLwAcOGWasL+wu6A1Ys6yoVEXFoigwYs2pZ1/B3MoCfZnV0rLzoHxAqqIglqg
         OWTbOak2vtBj2xoeURlE3aMaM/ukjZulPjkGu6KcvKvtdm7kWwnX38s4KUXCpOf+Q5wP
         c2unonQRak+9yOBinuc9qZ0FZDGkhrdzZixhUOwRt86ST1J1+rPEvq82awjm5BCisgR8
         Gfsw==
X-Gm-Message-State: ANhLgQ17339ilcHlXivhvNEicRFTeZWw7I9/gTOSWQgGkAay1pf3Nqcf
        k3V5yHX3cBorQ7LpPCP3Zxzk8p2VGllDh9Uf4UHOcg==
X-Google-Smtp-Source: ADFU+vuhP8K63glnB2X4iEc7HTPTFJXZEPkIIW22Q78fMzb/B95Goj5cxitaZ8igflDkbBXOM7yVb7ajPKCM3OcTgZw=
X-Received: by 2002:a9d:4d02:: with SMTP id n2mr2907132otf.107.1583745702518;
 Mon, 09 Mar 2020 02:21:42 -0700 (PDT)
MIME-Version: 1.0
References: <1583304137-28482-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1583304137-28482-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 9 Mar 2020 10:21:31 +0100
Message-ID: <CAMuHMdVQ=evfYLP09q7UMZB1gry-y=g+sP0FDgSmk-iwuRf3kQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] clk: renesas: rcar-usb2-clock-sel: Fix clks/resets handling
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimda-san,

On Wed, Mar 4, 2020 at 7:42 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> This patch series is based on the latest renesas-drivers.git /
> renesas-drivers-2020-02-25-v5.6-rc3 branch.
> The hardware also needs multiple clocks/resets management like
> renesas_usbhs driver [1], so this patch series fixes it.
>
> [1]
> 3df0e24 usb: renesas_usbhs: Add multiple clocks management
> f181dbb usb: renesas_usbhs: Add reset_control
>
> Changes from v3:
>  - Add reset-names property in patch 2/4.
>  - Use devm_clk_bulk_get() instead of multiple devm_clk_get() in patch 3/4.
>  - Add Geert's Reviewed-by into the patch 4/4.
>  https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=196577
>
> Changes from v2:
>  - Add Rob's Reviewed-by into the patch [12]/4.
>  - Fix typo in patch 2/4.
>  https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=194309
>
> Changes from v1:
>  - Add Reviewed-by into this series' patch 1/4.
>  - (new) Add resets and power-domains properties into the patch 2/4.
>  - Use clk_bulk_* APIs (except clk_bulk_get() because this driver has
>    4 clocks and used only 2 clocks).
>  - Add "select RESET_CONTROLLER" into Kconfig
>  - Use devm_reset_control_array_get() instead of optional API.
>  https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=192869
>
> Yoshihiro Shimoda (4):
>   dt-bindings: clock: renesas: rcar-usb2-clock-sel: Fix clock[-name]s
>     properties
>   dt-bindings: clock: renesas: rcar-usb2-clock-sel: Add power-domains
>     and resets properties
>   clk: renesas: rcar-usb2-clock-sel: Add multiple clocks management
>   clk: renesas: rcar-usb2-clock-sel: Add reset_control
>
>  .../bindings/clock/renesas,rcar-usb2-clock-sel.txt | 17 +++++++--
>  drivers/clk/renesas/Kconfig                        |  1 +
>  drivers/clk/renesas/rcar-usb2-clock-sel.c          | 40 ++++++++++++++++++++--
>  3 files changed, 53 insertions(+), 5 deletions(-)

Thanks, queued in clk-renesas-for-v5.7.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
