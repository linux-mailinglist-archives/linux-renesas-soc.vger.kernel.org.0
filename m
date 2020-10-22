Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64043295F80
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Oct 2020 15:15:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2899420AbgJVNPL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 22 Oct 2020 09:15:11 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:33638 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2899418AbgJVNPK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 22 Oct 2020 09:15:10 -0400
Received: by mail-ot1-f65.google.com with SMTP id t15so1440584otk.0;
        Thu, 22 Oct 2020 06:15:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+DwNBiOfd/W1wJmAT2LUI2b+7Yl1dva8JuD4+CTDhpQ=;
        b=sMpPP7oBKow0TFFpiWvCtS8U3LljnKXTvmDobe8QV//0JhVAVCDESe6BidzBQMjc0J
         T7z7gAy6m9jN3GHOss/IcA9KvYnRWYI2D12jAadYUrhOh258teFRkx+pu+iqIE/AhKpM
         8rvhu9qHUPsrBqB8bRsyRm8m40BnEF33w7Olnu0TKFFkVdH3U321mTyhmhKCbhB8XQ1H
         mnREQZHil1EntduT0UO6YLSpZY0gd4LSiKkUVpK2jBGZJyrEkUUDtfrw3F7cZhXcViEQ
         aaW0kXs8ZTbs3tC/1dDmWiuSPjXduQHpwOb05lQOXGjDH79UiIEGCiKJkHD/UepzVNik
         0kAw==
X-Gm-Message-State: AOAM531WQNgpprULBPmq4pVCnHzRqp/ReXllCCI9fgFuhGUyiZvJp3Hl
        3UqVCGDNgxCkMWzK88lgp8Ldu7UEC6ZiwzERyvM=
X-Google-Smtp-Source: ABdhPJxO5jd7p0wI597lNPcO+CZVGy8EEE2WT/eF+ljkV8+bCY8q7sHDk3uEBW+i+dyZUIiDXEj9+GB5hdDClsh7ugI=
X-Received: by 2002:a9d:3b76:: with SMTP id z109mr1917794otb.250.1603372509185;
 Thu, 22 Oct 2020 06:15:09 -0700 (PDT)
MIME-Version: 1.0
References: <20201016115549.31369-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20201016115549.31369-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 22 Oct 2020 15:14:57 +0200
Message-ID: <CAMuHMdV2HxxAijk0hd8y_Czvpkz9O2edSpx3tn0JB+Yajfk9Pg@mail.gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: winbond: Add support for w25m512jw
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Tudor Ambarus <tudor.ambarus@microchip.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        MTD Maling List <linux-mtd@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Oct 16, 2020 at 1:56 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> This chip is (nearly) identical to the Winbond w25m512jv which is
> already supported by Linux. Compared to the w25m512jv, the 'jw'
> has a different JEDEC ID.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Datasheets available at
https://www.winbond.com/hq/product/code-storage-flash-memory/spistack-flash/?__locale=en&partNo=W25M512JV
https://www.winbond.com/hq/product/code-storage-flash-memory/spistack-flash/?__locale=en&partNo=W25M512JW

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
