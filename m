Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6EF4616189
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 May 2019 11:53:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726454AbfEGJxr convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 7 May 2019 05:53:47 -0400
Received: from mail-vs1-f67.google.com ([209.85.217.67]:45195 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726607AbfEGJxq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 May 2019 05:53:46 -0400
Received: by mail-vs1-f67.google.com with SMTP id o10so9963163vsp.12
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 May 2019 02:53:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=u4pDcu4cLmQ9pY2lZyQVJRk796bPYX93JYn15L/1wMU=;
        b=bfBJ4uBlGgWdoShH5XDPxg/YRAIl8NW/1nShcq7kKki1G5wKC2tY0WIOJ2X64lhhh0
         9Jeq+Tvcp/dVwf+udeQKEGBALYbWkFjd42bUzMPOCPQEjPzdHIwhLtbfA+0bUvgcfvTD
         XYMOV4CORIR+qNnpVvQnQztCCi5tbU4HiLTAoHFzo1t0uF+lYutNqpqJitjk8RmQAzpE
         c726wTanS8GGl2rTEgYufWFYhTA7QtVFdWvWBwt4ks9g3+/183LYM7xsKdhc7J/Ant60
         VXSfaBqPApUONKAvhucIBMbISr/keQ4sATBLAAyTchHGWm8s9wJ0ZnzjME4+lMNu76oM
         pJnw==
X-Gm-Message-State: APjAAAVydOyHzuMk7TiHLrpT0SRE0BSIJuo7hILDA+c4O/FBUoPe/ZEF
        YtEa0PjkxNkRHlYcNk8nluOC/KVdfWp5xmRxG74=
X-Google-Smtp-Source: APXvYqyk7xDFeHcU8hslon/yZgyHt5QxCpAEjQ6Jg5C0V1ygJJOPiavk3SekbRsJ8ocrdrf2Nm/+8ZO2/RSuiwpuTPc=
X-Received: by 2002:a05:6102:406:: with SMTP id d6mr9208379vsq.63.1557222825657;
 Tue, 07 May 2019 02:53:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190320071605.4289-1-jonas@norrbonn.se> <20190320071605.4289-3-jonas@norrbonn.se>
In-Reply-To: <20190320071605.4289-3-jonas@norrbonn.se>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 7 May 2019 11:53:34 +0200
Message-ID: <CAMuHMdVH85iFJngkU6W61ybwR2j3YQ7=cugPxgC57hUgBOc5KA@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] spi-nor: s25fl512s supports region locking
To:     Jonas Bonn <jonas@norrbonn.se>
Cc:     MTD Maling List <linux-mtd@lists.infradead.org>,
        Tudor Ambarus <tudor.ambarus@microchip.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jonas,

On Wed, Mar 20, 2019 at 8:16 AM Jonas Bonn <jonas@norrbonn.se> wrote:
> Both the BP[0-2] bits and the TBPROT bit are supported on this chip.
> Tested and verified on a Cypress s25fl512s.
>
> Signed-off-by: Jonas Bonn <jonas@norrbonn.se>

This is now commit dcb4b22eeaf44f91 ("spi-nor: s25fl512s supports region
locking") in mtd/next.

> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -1898,7 +1898,9 @@ static const struct flash_info spi_nor_ids[] = {
>                         SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
>         { "s25fl256s0", INFO(0x010219, 0x4d00, 256 * 1024, 128, USE_CLSR) },
>         { "s25fl256s1", INFO(0x010219, 0x4d01,  64 * 1024, 512, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
> -       { "s25fl512s",  INFO6(0x010220, 0x4d0080, 256 * 1024, 256, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
> +       { "s25fl512s",  INFO6(0x010220, 0x4d0080, 256 * 1024, 256,
> +                       SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
> +                       SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | USE_CLSR) },

Setting SPI_NOR_HAS_LOCK causes the QSPI FLASH on r8a7791/koelsch to fail
probing.

Before/after:

    -m25p80 spi0.0: s25fl512s (65536 Kbytes)
    -3 fixed-partitions partitions found on MTD device spi0.0
    -Creating 3 MTD partitions on "spi0.0":
    -0x000000000000-0x000000080000 : "loader"
    -0x000000080000-0x000000600000 : "user"
    -0x000000600000-0x000004000000 : "flash"
    +m25p80 spi0.0: Erase Error occurred
    +m25p80 spi0.0: Erase Error occurred
    +m25p80 spi0.0: timeout while writing configuration register
    +m25p80 spi0.0: quad mode not supported
    +m25p80: probe of spi0.0 failed with error -5

FLASH chip is SPANSION FL512SAIFG1 311QQ063 A ©11 SPANSION
JEDEC id bytes: 01 02 20 4d 00 80

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
