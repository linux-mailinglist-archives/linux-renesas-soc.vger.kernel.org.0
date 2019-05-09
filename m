Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 778F718780
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 May 2019 11:11:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725991AbfEIJLX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 May 2019 05:11:23 -0400
Received: from mail-vs1-f66.google.com ([209.85.217.66]:44380 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725963AbfEIJLW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 May 2019 05:11:22 -0400
Received: by mail-vs1-f66.google.com with SMTP id j184so935014vsd.11
        for <linux-renesas-soc@vger.kernel.org>; Thu, 09 May 2019 02:11:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gXkRO+XQYGy7/LWPQ5fKlNK8ZU/OfB3zQej18Hwz8ws=;
        b=KR+SE+gHjVuJfblyGYpBxgp/dXkSOvnBE2JKY5PJrZpzrVYkOfNC0WtRVh/yVfP2pu
         SWuDZAZwgVvRP/UM821+hjBOE6+pCKPuHANHZFL2HjvFLIUV7BGSiUhaIuDYck2c1kuU
         tLApmfxH77oPTopran09mTvrLrx3U1WndxtxrfjiKoyAUxdN73eoEiTEY1syKrIhdJGb
         jIOg3XyTUuqsg1jvEvonZsRXN34gK4dl9BK+qOTNPyYU6eX0iCiGEEmB+p02L/PSMv/9
         koPtqtLyobUg1Ux0KLQG6ybFMapW6wtvSca7eeIwr4lsEkUKi4EISix8Lf+QwMq+B4Qe
         qktg==
X-Gm-Message-State: APjAAAX9M17apKhYnsWdkCoivcKxZr5Dcou2jYZpq6v0fxEhUiD3cueK
        oKQVWngqIpVz3BZ9aBNfOBHzX1YKd5alIAtQhVQ=
X-Google-Smtp-Source: APXvYqyFtFQFzOBs1h2wojiIalCn9FY+WK9+fjvSepNFI+zbP6LZxRuSLRMlT+KN9dTtXapDj+Ze1KlPzPP6kTlsXoE=
X-Received: by 2002:a67:f956:: with SMTP id u22mr1550424vsq.11.1557393081736;
 Thu, 09 May 2019 02:11:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190320071605.4289-1-jonas@norrbonn.se> <20190320071605.4289-3-jonas@norrbonn.se>
 <CAMuHMdVH85iFJngkU6W61ybwR2j3YQ7=cugPxgC57hUgBOc5KA@mail.gmail.com>
 <1f33e1e5-d7bf-76a0-c4d3-ecbc35fbfd4f@microchip.com> <CAMuHMdU83vLeVSqMZuJwR4yd382mau-OE1saMAOC2+6HodsHvg@mail.gmail.com>
 <fac5fa6d-95e9-cfb0-4d5a-6b16d4470190@norrbonn.se> <CAMuHMdUEdNr5rgCdaGAFJ-WK4oL2DC419smk+QYOJ7qJvkWA8A@mail.gmail.com>
 <a9ad3641-1eb8-782c-9dfd-0db41256d3f1@microchip.com> <ad49240c-2073-4045-c11c-fb6bad231321@microchip.com>
 <CAMuHMdVcp--qRo3m8kSQ=++Vx33kvxBWEHFVHfh-j=pq1x-GPQ@mail.gmail.com>
 <898831ba-b8bb-7c2b-e623-2e6c26da91b5@microchip.com> <CAMuHMdXFwFAPzYPKqj+FZgSq01VAD0izS3ELyOg1YBwTAQ_QkQ@mail.gmail.com>
 <8b004a57-0fd9-04fe-d031-1d98d890f826@microchip.com> <CAMuHMdXghAWmNJLUq_uOUVPrrNTAcFq=QqCGjLU51FchvOu3=g@mail.gmail.com>
 <6a8d9a6c-5281-88d2-51ae-e2afad847a8f@microchip.com>
In-Reply-To: <6a8d9a6c-5281-88d2-51ae-e2afad847a8f@microchip.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 9 May 2019 11:11:09 +0200
Message-ID: <CAMuHMdVBguF4ZQHTqwr6GAJKuUcvBGu-5p0GeYRmZ3dG8tXa2g@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] spi-nor: s25fl512s supports region locking
To:     Tudor Ambarus <Tudor.Ambarus@microchip.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Jonas Bonn <jonas@norrbonn.se>,
        MTD Maling List <linux-mtd@lists.infradead.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Tudor,

On Thu, May 9, 2019 at 8:56 AM <Tudor.Ambarus@microchip.com> wrote:
> When the configuration register QUAD bit CR[1] is 1, only the WRR command format
> with 16 data bits may be used, WRR with 8 bits is not recognized and hence the
> FFs. You probably set quad bit in u-boot, while others don't. We can verify this
> assumption with the patch form below. Can you try it?

Thanks!

> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c

> +static int spi_nor_clear_block_protection(struct spi_nor *nor)
> +{
> +       int ret;
> +       u8 sr, cr, sr_cr[2] = {0};
> +       u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
> +
> +       ret = read_cr(nor);
> +       dev_dbg(nor->dev, "CR = %08x\n", ret);
> +        if (ret < 0) {
> +                dev_err(nor->dev, "error while reading CR\n");
> +               return ret;
> +       }
> +       cr = ret;
> +
> +       if (cr & CR_QUAD_EN_SPAN) {
> +               /* disable quad if already set, must do it with 16-bit WRR */
> +               ret = write_sr_cr(nor, sr_cr);
> +               if (ret) {
> +                       dev_err(nor->dev, "error diasbling quad mode\n");

disabling

> +                       return ret;
> +               }

renesas_spi e6b10000.spi: DMA available
renesas_spi e6b10000.spi: registered master spi0
spi spi0.0: setup mode 3, 8 bits/w, 30000000 Hz max --> 0
m25p80 spi0.0: bfpt.dwords[1] = ffffffff
m25p80 spi0.0: bfpt.dwords[2] = ffffffff
m25p80 spi0.0: bfpt.dwords[3] = ffffffff
m25p80 spi0.0: bfpt.dwords[4] = ffffffff
m25p80 spi0.0: bfpt.dwords[5] = ffffffff
m25p80 spi0.0: bfpt.dwords[6] = ffffffff
m25p80 spi0.0: bfpt.dwords[7] = ffffffff
m25p80 spi0.0: bfpt.dwords[8] = ffffffff
m25p80 spi0.0: bfpt.dwords[9] = ffffffff
m25p80 spi0.0: bfpt.dwords[10] = 00000000
m25p80 spi0.0: bfpt.dwords[11] = 00000000
m25p80 spi0.0: bfpt.dwords[12] = 00000000
m25p80 spi0.0: bfpt.dwords[13] = 00000000
m25p80 spi0.0: bfpt.dwords[14] = 00000000
m25p80 spi0.0: bfpt.dwords[15] = 00000000
m25p80 spi0.0: bfpt.dwords[16] = 00000000
m25p80 spi0.0: failed to parse BFPT: err = -22
m25p80 spi0.0: spi_nor_init_params sfdp parse failed, ret =-22
m25p80 spi0.0: SR and CR before quad_enable:
m25p80 spi0.0: SR = 00000000
m25p80 spi0.0: CR = 00000002
m25p80 spi0.0: SR and CR after quad_enable:
m25p80 spi0.0: SR = 00000000
m25p80 spi0.0: CR = 00000002
m25p80 spi0.0: s25fl512s (65536 Kbytes)
m25p80 spi0.0: mtd .name = spi0.0, .size = 0x4000000 (64MiB),
.erasesize = 0x00040000 (256KiB) .numeraseregions = 0
3 fixed-partitions partitions found on MTD device spi0.0
Creating 3 MTD partitions on "spi0.0":
0x000000000000-0x000000080000 : "loader"
0x000000080000-0x000000600000 : "user"
0x000000600000-0x000004000000 : "flash"
renesas_spi e6b10000.spi: registered child spi0.0
renesas_spi e6b10000.spi: probed

And /dev/mtd0 reading works fine.
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
