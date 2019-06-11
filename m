Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA2063C606
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Jun 2019 10:36:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391273AbfFKIgO convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 11 Jun 2019 04:36:14 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:41295 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391272AbfFKIgO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Jun 2019 04:36:14 -0400
Received: by mail-lf1-f65.google.com with SMTP id 136so8628386lfa.8;
        Tue, 11 Jun 2019 01:36:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=GUp8qliVx03zllgkYDK8ocvKtbFURF4tyvvuVMWSXJU=;
        b=DGjVijvJhxsU9XOJsZTqixJOUCUjQ+JG5IjSEQrgnGNBYwBdAmAei3xqdoXsNZcJQ1
         NCSZEFGO4T32PyXbefXgNBNvI3q44nT5vcMnZ8j2pktOH1Se4HXoj0gy/a4H51aC811T
         lY54O97LjYqyTtIApbt+uGockin1RuxXmS1N49Q6mq5qdFVlmrTIyxsGuK+Kxu7AQrYt
         tvIyK2ledWM8+WTYC+TINbgcx+birrKT9CZf/I0VrjfsPGK8+zZ74zJDySntKSKmv9BI
         luL4yPcZ+LPjTrDfAJ76gdZFdNTOCTc2qItjmmfTY4yynm+U6b2xiKGDDwmX5SmtcOGE
         MXiQ==
X-Gm-Message-State: APjAAAVpcH8UtE5hEA0HG07mxEUQC4cgKcPVMPJZq1mOx/9gaODUbfxR
        jIcjr5Ph0bQ8v8XEhGjMofr7bJITouJPChwoif0=
X-Google-Smtp-Source: APXvYqwd/QOgBJwyleqHVMRIDIpSd3upHGdxLIZdMQ2+GlhKJ5bW8QObXfMjmP33hbygmeS7kdgIlsZS8CVKSZyz6fA=
X-Received: by 2002:ac2:546a:: with SMTP id e10mr37353204lfn.75.1560242171986;
 Tue, 11 Jun 2019 01:36:11 -0700 (PDT)
MIME-Version: 1.0
References: <c57fe97b-ad4a-874e-663f-7f3a737824c9@microchip.com> <20190610062351.24405-1-tudor.ambarus@microchip.com>
In-Reply-To: <20190610062351.24405-1-tudor.ambarus@microchip.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 11 Jun 2019 10:35:59 +0200
Message-ID: <CAMuHMdW3=fzFvt+ZmC2B6qf0zEwfvV--HVEoxa06Tk=a=Q1cWA@mail.gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: use 16-bit WRR command when QE is set on
 spansion flashes
To:     Tudor Ambarus <Tudor.Ambarus@microchip.com>
Cc:     Marek Vasut <marek.vasut+renesas@gmail.com>,
        Marek Vasut <marek.vasut@gmail.com>,
        "R, Vignesh" <vigneshr@ti.com>, Jonas Bonn <jonas@norrbonn.se>,
        David Woodhouse <dwmw2@infradead.org>,
        Brian Norris <computersforpeace@gmail.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        MTD Maling List <linux-mtd@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Tudor,

On Mon, Jun 10, 2019 at 8:24 AM <Tudor.Ambarus@microchip.com> wrote:
> From: Tudor Ambarus <tudor.ambarus@microchip.com>
>
> SPI memory devices from different manufacturers have widely
> different configurations for Status, Control and Configuration
> registers. JEDEC 216C defines a new map for these common register
> bits and their functions, and describes how the individual bits may
> be accessed for a specific device. For the JEDEC 216B compliant
> flashes, we can partially deduce Status and Configuration registers
> functions by inspecting the 16th DWORD of BFPT. Older flashes that
> don't declare the SFDP tables (SPANSION FL512SAIFG1 311QQ063 A ©11
> SPANSION) let the software decide how to interact with these registers.
>
> The commit dcb4b22eeaf4 ("spi-nor: s25fl512s supports region locking")
> uncovered a probe error for s25fl512s, when the QUAD bit CR[1] was set
> in the bootloader. When this bit is set, only the Write Register
> WRR command format with 16 data bits may be used, WRR with 8 bits
> is not recognized and hence the error when trying to clear the block
> protection bits.
>
> Fix the above by using 16-bits WRR command when Quad bit is set.
>
> Backward compatibility should be fine. The newly introduced
> spi_nor_spansion_clear_sr_bp() is tightly coupled with the
> spansion_quad_enable() function. Both assume that the Write Register
> with 16 bits, together with the Read Configuration Register (35h)
> instructions are supported.
>
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
> Geert, Jonas,
>
> This patch is compile-tested only. I don't have the flash, I need your
> help for testing this.

Thanks, this revives access to the s25fl512s on Koelsch.

Fixes: dcb4b22eeaf44f91 ("spi-nor: s25fl512s supports region locking")
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>Hi Tudor,

Two questions below...

> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c

> +static int spi_nor_spansion_clear_sr_bp(struct spi_nor *nor)
> +{

[...]

> +        * When the configuration register QUAD bit CR[1] is 1, only
> +        * the WRR command format with 16 data bits may be used.

s/WRR/WRSR/?

> +        */
> +       if (ret & CR_QUAD_EN_SPAN) {
> +               sr_cr[1] = ret;
> +
> +               ret = read_sr(nor);
> +               if (ret < 0) {
> +                       dev_err(nor->dev,
> +                               "error while reading status register\n");
> +                       return ret;
> +               }
> +               sr_cr[0] = ret & ~mask;
> +
> +               ret = write_sr_cr(nor, sr_cr);
> +               if (ret)
> +                       dev_err(nor->dev, "16-bit write register failed\n");
> +               return ret;
> +       }
> +
> +       /* If quad bit is not set, use 8-bit WRR command. */

Likewise.

> +       return spi_nor_clear_sr_bp(nor);
> +}

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
