Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAFF7456C88
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Nov 2021 10:42:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233761AbhKSJpc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 19 Nov 2021 04:45:32 -0500
Received: from mail-ua1-f46.google.com ([209.85.222.46]:35430 "EHLO
        mail-ua1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232120AbhKSJpb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 19 Nov 2021 04:45:31 -0500
Received: by mail-ua1-f46.google.com with SMTP id l24so20073870uak.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Nov 2021 01:42:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kctW9Zk6L95r7ERn3VUjwJRtDaEfXk5crM2DrX9uDGM=;
        b=ca2tbwkxWT8N5f6MUD9uwby6MogRBndkTiCk74ui2GeSl0pHd9zyhKEpRTXFiHeUI6
         SBtv8jXysvISCb5zm5BuOKlugciPyI4vVPweBK5WM+1dVNhvJiZ8BQ8YHb4WLH28456P
         w81BkGV0nWr4TVFdYjQgcLAAQ/cijbid+jRCPtk4en9Z4fYlFeQHuZhFMhc9L7i6ku7I
         cyJkgx9omg0QoFBmOAoEqUmVERbgnYF3wubQlAVH/Widm2RdR0/D6S+YJfjagykAom3B
         LY1Md5j+Z7CFQQIGvHoJ2hvNOF0JyPHYCjjObLAmv7S//dPBZNySSpGygWi6I1Nquorn
         Wx9w==
X-Gm-Message-State: AOAM531FxJn0ucyav8kDh43KS44ERz6R8+1HZDAYtIcRAhxpSV9Y/zl9
        VbRTysB66NwvOUnvxVXRdGQT3EeH8WE6cg==
X-Google-Smtp-Source: ABdhPJyxwudw7omEY+tQybn7KwBnXeBDL83Bfh6IjZHa2Rd2bHsT0qBTZPk66l3i6tyrD632ZJIyyQ==
X-Received: by 2002:a67:eb54:: with SMTP id x20mr66073978vso.18.1637314949668;
        Fri, 19 Nov 2021 01:42:29 -0800 (PST)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id bl34sm1413917vsb.31.2021.11.19.01.42.28
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Nov 2021 01:42:28 -0800 (PST)
Received: by mail-ua1-f49.google.com with SMTP id r15so20050205uao.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Nov 2021 01:42:28 -0800 (PST)
X-Received: by 2002:a9f:2431:: with SMTP id 46mr47040755uaq.114.1637314947944;
 Fri, 19 Nov 2021 01:42:27 -0800 (PST)
MIME-Version: 1.0
References: <20211118111940.1275351-1-miquel.raynal@bootlin.com>
 <20211118111940.1275351-3-miquel.raynal@bootlin.com> <CAMuHMdUTj_kHV6=fMJ=CjiHjBSi_TrnrjeT0BdaHkONHPxwnQA@mail.gmail.com>
 <20211119102340.05f2f3e4@xps13>
In-Reply-To: <20211119102340.05f2f3e4@xps13>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 19 Nov 2021 10:42:16 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVa41F-E_0Gfw0S25NEyuDMDzDVUEWknw4nVCNm4mG7eQ@mail.gmail.com>
Message-ID: <CAMuHMdVa41F-E_0Gfw0S25NEyuDMDzDVUEWknw4nVCNm4mG7eQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] mtd: rawnand: rzn1: Add new NAND controller driver
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tudor Ambarus <Tudor.Ambarus@microchip.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Michael Walle <michael@walle.cc>,
        MTD Maling List <linux-mtd@lists.infradead.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Gareth Williams <gareth.williams.jx@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Miquel,

On Fri, Nov 19, 2021 at 10:23 AM Miquel Raynal
<miquel.raynal@bootlin.com> wrote:
> geert@linux-m68k.org wrote on Fri, 19 Nov 2021 09:55:53 +0100:
> > On Thu, Nov 18, 2021 at 12:19 PM Miquel Raynal
> > <miquel.raynal@bootlin.com> wrote:
> > > Introduce Renesas RZ/N1x NAND controller driver which supports:
> > > - All ONFI timing modes
> > > - Different configurations of its internal ECC controller
> > > - On-die (not tested) and software ECC support
> > > - Several chips (not tested)
> > > - Subpage accesses
> > > - DMA and PIO
> > >
> > > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

> > > --- /dev/null
> > > +++ b/drivers/mtd/nand/raw/rzn1-nand-controller.c
> >
> > > +static int rzn1_read_subpage_hw_ecc(struct nand_chip *chip, u32 req_offset,
> > > +                                   u32 req_len, u8 *bufpoi, int page)
> > > +{
> > > +       struct rzn1_nfc *nfc = to_rzn1_nfc(chip->controller);
> > > +       struct mtd_info *mtd = nand_to_mtd(chip);
> > > +       struct rzn1_nand_chip *rzn1_nand = to_rzn1_nand(chip);
> > > +       unsigned int cs = to_nfc_cs(rzn1_nand);
> > > +       unsigned int page_off = round_down(req_offset, chip->ecc.size);
> > > +       unsigned int real_len = round_up(req_offset + req_len - page_off,
> > > +                                        chip->ecc.size);
> > > +       unsigned int start_chunk = page_off / chip->ecc.size;
> > > +       unsigned int nchunks = real_len / chip->ecc.size;
> > > +       unsigned int ecc_off = 2 + (start_chunk * chip->ecc.bytes);
> > > +       struct rzn1_op rop = {
> > > +               .command = COMMAND_INPUT_SEL_AHBS | COMMAND_0(NAND_CMD_READ0) |
> > > +                          COMMAND_2(NAND_CMD_READSTART) | COMMAND_FIFO_SEL |
> > > +                          COMMAND_SEQ_READ_PAGE,
> > > +               .addr0_row = page,
> > > +               .addr0_col = page_off,
> > > +               .len = real_len,
> > > +               .ecc_offset = ECC_OFFSET(mtd->writesize + ecc_off),
> > > +       };
> > > +       unsigned int max_bitflips = 0;
> > > +       u32 ecc_stat;
> > > +       int bf, ret, i;
> >
> > unsigned int i
>
> Strangely I'm used to always set my loop indexes as signed integers,
> but I'll happily change that everywhere in the driver before
> re-submitting.

It depends.  Some of the upper bounds are signed, as dictated by some
field in a struct.

> > > +static int rzn1_nfc_probe(struct platform_device *pdev)
> > > +{
> > > +       struct rzn1_nfc *nfc;
> > > +       int irq, ret;
> > > +
> > > +       nfc = devm_kzalloc(&pdev->dev, sizeof(*nfc), GFP_KERNEL);
> > > +       if (!nfc)
> > > +               return -ENOMEM;
> > > +
> > > +       nfc->dev = &pdev->dev;
> > > +       nand_controller_init(&nfc->controller);
> > > +       nfc->controller.ops = &rzn1_nfc_ops;
> > > +       INIT_LIST_HEAD(&nfc->chips);
> > > +       init_completion(&nfc->complete);
> > > +
> > > +       nfc->regs = devm_platform_ioremap_resource(pdev, 0);
> > > +       if (IS_ERR(nfc->regs))
> > > +               return PTR_ERR(nfc->regs);
> > > +
> > > +       rzn1_nfc_dis_interrupts(nfc);
> > > +       irq = platform_get_irq(pdev, 0);
> >
> > platform_get_irq_optional()
> >
> > > +       if (irq < 0) {
> >
> > What if this is a real error, or -EPROBE_DEFER?
>
> If it's a real error I believe we should still fallback to polling? Or
> do you prefer to only use polling on a fixed condition?

It's debatable: in this case, you have the option to fallback to polling if
it is a real error, in other drivers you haven't.  If it fails for real here,
it will probably fail for real in other drivers, too.

> > > +       {} /* sentinel */
> > > +};
> > > +MODULE_DEVICE_TABLE(of, nfc_id_table);
> > > +
> > > +static struct platform_driver rzn1_nfc_driver = {
> > > +       .driver = {
> > > +               .name   = "renesas-nfc",
> >
> > Perhaps s/nfc/nandc/ everywhere, to avoid confusion with the other nfc?
>
> There are many NAND controller drivers that are abbreviated with nfc
> because it's short and easy to write while still precise, but I have no
> issue rewording nfc into nandc if you prefer.

My main worry is that we ever get a "renesas-nfc" driver for Near
Field Communication.  Both drivers will have the same name, which
will still work with DT (board files are dead), but the output from
dev_*() may be confusing.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
