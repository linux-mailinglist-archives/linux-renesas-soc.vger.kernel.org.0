Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 086E72589F6
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Sep 2020 10:00:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726298AbgIAIA2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 1 Sep 2020 04:00:28 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:43267 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726044AbgIAIA1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 1 Sep 2020 04:00:27 -0400
Received: by mail-ot1-f67.google.com with SMTP id v16so396944otp.10;
        Tue, 01 Sep 2020 01:00:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tfjwZecOvf9PlYjWmqCsC4ASTXGKL7VS6W1u6/SHeYw=;
        b=q6k/W3TcIMUu/QAGR+drLXmq3RT4d5jDgmEi8NNwgLALY9nSswuSF9/txJwhf+xyps
         D+5zv4Is5iqMLwJw6/pmKz0z2HvuShKOeXZkAzZkfwm8bfCvBEb9kkyD2p++FVtDsMjv
         k9z8I+IA0hpUKsSjBxPk+nyKhTfBkmjjeOmbkyzEQXOOGygMN7wx5RxEDtyVvl926MMV
         bHOOyu9YoeUY8Ud6C4jNHcw/CEr5aBKlYwxE4GI6aY9FHV8TcPE405GBkaPB1msRShar
         99y6G5RCGnDDvuyyH5/CZ9zAqQXpCnpacLfBIotsNBAqWvz7FZUAn5pgRaslUGh79AAM
         s8Cg==
X-Gm-Message-State: AOAM531zTdr/COSVNAHe6PMKLKVvhXbikJpLFPR210IV4Olbz7zrFPhv
        YEMhw54Y+moQlDLUEnL6KVDxQAp8W75d5cZeQHI=
X-Google-Smtp-Source: ABdhPJyak+o0FWIDI6uA2czIjPC1+5V/5hXLaQXa5ncT0xIXvPCkjyT1ltkeXU+ngALHqaWRSD8JzFrP/CkeaUSgRBU=
X-Received: by 2002:a9d:1b62:: with SMTP id l89mr523230otl.145.1598947227043;
 Tue, 01 Sep 2020 01:00:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200826093220.10266-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20200826093220.10266-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20200826093220.10266-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 1 Sep 2020 10:00:16 +0200
Message-ID: <CAMuHMdWuNc-Sb8yhSb3oNeBjPD5ixJ7mug54Uuwq7y=94dPnyg@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: shmobile: defconfig: enable CONFIG_PCIE_RCAR_HOST
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Russell King <linux@armlinux.org.uk>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Aug 26, 2020 at 11:33 AM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> config option PCIE_RCAR internally selects PCIE_RCAR_HOST which builds the
> same driver. So this patch renames CONFIG_PCIE_RCAR to
> CONFIG_PCIE_RCAR_HOST so that PCIE_RCAR can be safely dropped from Kconfig
> file.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.10.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
