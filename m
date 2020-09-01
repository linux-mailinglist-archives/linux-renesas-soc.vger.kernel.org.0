Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2975D258DD3
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Sep 2020 14:04:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726140AbgIAMDt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 1 Sep 2020 08:03:49 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:39741 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727103AbgIAMCc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 1 Sep 2020 08:02:32 -0400
Received: by mail-oi1-f193.google.com with SMTP id r64so38649oib.6
        for <linux-renesas-soc@vger.kernel.org>; Tue, 01 Sep 2020 05:02:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aYPkPxc2xghElyJTlKFTwtZzb1O35lCLPj5cWFAJt0w=;
        b=CRNMBsAr1yitIv3T/yCVGZ8n3vev3pSauk3nwL8ENCqccbid1jqlPtUsugtTH+pmja
         rP6Tna7TVsKrYzUWulAxlHbMaHxTsEnxv9IicJUVo1M/bYmK3Cob76Tc3McyXLSrya8Y
         QevrBaFU3uAxgrLJPUVUOGD+0aiEfzW4iFuVUzpxHfukRlho7gLvq5BPzmvmp35vTEKE
         dx8aoYSXqLRvCGh7DoXFPHASjsnZJGhAxXkKDFShfZV/EnBuK553naY7FCPaMi4UeRrz
         k/AJa2eZqmtpldArHTxjiu4hBWlY9mbqRO9accptJJu5BUNoAORArq7t5XQPcyA/o6tw
         LVmQ==
X-Gm-Message-State: AOAM531EOZq6rAk2uDw3PGFzbTrXOVgwbLkyvv8ntTGVnTJykqvwjD+I
        qQKJQsU0i+2Cn3FmI8NBb1wHhNHtHMSEegjs3hE=
X-Google-Smtp-Source: ABdhPJx2jpJA9uGwtjLbrHKwpxEKQimhG85Ux+CMs8ZZ8qUaRkqQVp6R7C1nY9/in1aFW3FWB4aOagDLJmQWsI5ThqY=
X-Received: by 2002:aca:b742:: with SMTP id h63mr813514oif.148.1598961750172;
 Tue, 01 Sep 2020 05:02:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200826100358.5936-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200826100358.5936-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdVGjV_DXkgEEDcoKwwTwKyxiMuLFMPdHU9HOurs9DnL7A@mail.gmail.com>
In-Reply-To: <CAMuHMdVGjV_DXkgEEDcoKwwTwKyxiMuLFMPdHU9HOurs9DnL7A@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 1 Sep 2020 14:02:19 +0200
Message-ID: <CAMuHMdUwBa6zM-a0nWYfCV56qRjGm8szwXWAyRsTfQ8Ni_M5mA@mail.gmail.com>
Subject: Re: [PATCH LOCAL 2/2] arm64: renesas: defconfig: Enable R-Car PCIe
 endpoint driver
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Aug 31, 2020 at 2:51 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Wed, Aug 26, 2020 at 12:04 PM Lad Prabhakar
> <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > Enable R-Car PCIe endpoint driver on RZ/G2E board, including enabling
> > endpoint configurations CONFIG_PCI_ENDPOINT, CONFIG_PCI_ENDPOINT_CONFIGFS,
> > CONFIG_PCI_EPF_TEST and CONFIG_PCI_ENDPOINT_TEST required to use and test
> > the driver.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will apply to topic/renesas-defconfig.

After dropping now auto-selected CONFIG_CONFIGFS_FS=y.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
