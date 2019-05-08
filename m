Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D94217A14
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 May 2019 15:12:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725910AbfEHNL5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 May 2019 09:11:57 -0400
Received: from mail-ua1-f65.google.com ([209.85.222.65]:43041 "EHLO
        mail-ua1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726776AbfEHNL5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 May 2019 09:11:57 -0400
Received: by mail-ua1-f65.google.com with SMTP id 94so5077792uaf.10
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 May 2019 06:11:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=p4suxyOeYY7YF8NJlBucfgasWMidvZty5HNK0l9NOMs=;
        b=hmIwpDJckgkEvzU1KrjQKmCQP6NQcQchabJSwzo0csKCi7WCKxWL06DcqYo4eW4STt
         3iGdik76rxwWvU4O19YrHjTZRr8qZOCLuEdqw/ii3uetKcl3AMUrpqh4RUvDoZxWj7Bf
         TF0J1m24SL7dPHgPMxtCOIBkYW66H7Uk3mrJR/LKfJ3xRE0mLXq8h+KjqOXAHQgxfAGm
         gQRSpcWDXZaZRSikhfjoJ8hMMjWMAPifBJSB4BvNcaGBLodYDcEhsad1NYCEN/3wTn1g
         /PliK7m31aBwYERqK+AWXHOwqAyQghAXz3ikPDopuuUcP5+BKTgBZYn5lSUe4FWNuYAR
         4wIw==
X-Gm-Message-State: APjAAAV7cu/yOpG7fgVlqpPjV51Rf2Iv9V/RIIDqEvKlunjs3wPL+MGc
        ZeMmpvo2XXgSUiQSZgoABiNPPQwxieK8e7N8/zc=
X-Google-Smtp-Source: APXvYqzQAVH/7hNvRuVsT2UoCtHA9NuQmI6bThtezzUSzCnNOY6KBvWo1f5eGePMIHM0tub0nAtXL0476G15j4SCLRQ=
X-Received: by 2002:a9f:2b84:: with SMTP id y4mr16973368uai.28.1557321115724;
 Wed, 08 May 2019 06:11:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190320071605.4289-1-jonas@norrbonn.se> <20190320071605.4289-3-jonas@norrbonn.se>
 <CAMuHMdVH85iFJngkU6W61ybwR2j3YQ7=cugPxgC57hUgBOc5KA@mail.gmail.com>
 <1f33e1e5-d7bf-76a0-c4d3-ecbc35fbfd4f@microchip.com> <CAMuHMdU83vLeVSqMZuJwR4yd382mau-OE1saMAOC2+6HodsHvg@mail.gmail.com>
 <fac5fa6d-95e9-cfb0-4d5a-6b16d4470190@norrbonn.se> <CAMuHMdUEdNr5rgCdaGAFJ-WK4oL2DC419smk+QYOJ7qJvkWA8A@mail.gmail.com>
 <a9ad3641-1eb8-782c-9dfd-0db41256d3f1@microchip.com> <ad49240c-2073-4045-c11c-fb6bad231321@microchip.com>
 <CAMuHMdVcp--qRo3m8kSQ=++Vx33kvxBWEHFVHfh-j=pq1x-GPQ@mail.gmail.com> <898831ba-b8bb-7c2b-e623-2e6c26da91b5@microchip.com>
In-Reply-To: <898831ba-b8bb-7c2b-e623-2e6c26da91b5@microchip.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 8 May 2019 15:11:32 +0200
Message-ID: <CAMuHMdXFwFAPzYPKqj+FZgSq01VAD0izS3ELyOg1YBwTAQ_QkQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] spi-nor: s25fl512s supports region locking
To:     Tudor Ambarus <Tudor.Ambarus@microchip.com>
Cc:     Jonas Bonn <jonas@norrbonn.se>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        MTD Maling List <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Tudor,

On Wed, May 8, 2019 at 12:44 PM <Tudor.Ambarus@microchip.com> wrote:
> Would you run this debug patch on top of mtd/next? I dumped the SR and CR before
> and after the operations in cause.

Thanks, giving it a try...

> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 73172d7f512b..20d0fdb1dc92 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -22,6 +22,8 @@
>  #include <linux/spi/flash.h>
>  #include <linux/mtd/spi-nor.h>
>
> +#define DEBUG

Should be moved to the top of the file, before dev_dbg() is defined.

Result is:

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
m25p80 spi0.0: SR = 00000000
m25p80 spi0.0: CR = 00000002
m25p80 spi0.0: Erase Error occurred
m25p80 spi0.0: timeout while writing SR, ret = -5
m25p80 spi0.0: SR = 000000ff
m25p80 spi0.0: CR = 000000ff
m25p80 spi0.0: SR and CR before quad_enable:
m25p80 spi0.0: SR = 000000ff
m25p80 spi0.0: CR = 000000ff
m25p80 spi0.0: Erase Error occurred
m25p80 spi0.0: timeout while writing configuration register
m25p80 spi0.0: SR and CR after quad_enable:
m25p80 spi0.0: SR = 000000ff
m25p80 spi0.0: CR = 000000ff
m25p80 spi0.0: quad mode not supported, err = -5
m25p80: probe of spi0.0 failed with error -5

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
