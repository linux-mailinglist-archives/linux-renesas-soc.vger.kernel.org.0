Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FE41456C43
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Nov 2021 10:23:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233947AbhKSJ0r convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 19 Nov 2021 04:26:47 -0500
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:59397 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232838AbhKSJ0q (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 19 Nov 2021 04:26:46 -0500
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id DD04340003;
        Fri, 19 Nov 2021 09:23:41 +0000 (UTC)
Date:   Fri, 19 Nov 2021 10:23:40 +0100
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
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
Subject: Re: [PATCH 2/3] mtd: rawnand: rzn1: Add new NAND controller driver
Message-ID: <20211119102340.05f2f3e4@xps13>
In-Reply-To: <CAMuHMdUTj_kHV6=fMJ=CjiHjBSi_TrnrjeT0BdaHkONHPxwnQA@mail.gmail.com>
References: <20211118111940.1275351-1-miquel.raynal@bootlin.com>
        <20211118111940.1275351-3-miquel.raynal@bootlin.com>
        <CAMuHMdUTj_kHV6=fMJ=CjiHjBSi_TrnrjeT0BdaHkONHPxwnQA@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

geert@linux-m68k.org wrote on Fri, 19 Nov 2021 09:55:53 +0100:

> Hi Miquel,
> 
> CC Gareth
> 
> On Thu, Nov 18, 2021 at 12:19 PM Miquel Raynal
> <miquel.raynal@bootlin.com> wrote:
> > Introduce Renesas RZ/N1x NAND controller driver which supports:
> > - All ONFI timing modes
> > - Different configurations of its internal ECC controller
> > - On-die (not tested) and software ECC support
> > - Several chips (not tested)
> > - Subpage accesses
> > - DMA and PIO
> >
> > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>  
> 
> Thanks for your patch!
> 
> > --- a/drivers/mtd/nand/raw/Kconfig
> > +++ b/drivers/mtd/nand/raw/Kconfig
> > @@ -467,6 +467,12 @@ config MTD_NAND_PL35X
> >           Enables support for PrimeCell SMC PL351 and PL353 NAND
> >           controller found on Zynq7000.
> >
> > +config MTD_NAND_RZN1
> > +       tristate "Renesas RZ/N1D, RZ/N1S, RZ/N1L NAND controller"
> > +       depends on OF || COMPILE_TEST  
> 
> depends on ARCH_RENESAS || COMPILE_TEST

Yeah of course, sorry about that.

> 
> > +       help
> > +         Enables support for Renesas RZ/N1x SoC family NAND controller.
> > +
> >  comment "Misc"
> >
> >  config MTD_SM_COMMON  
> 
> > --- /dev/null
> > +++ b/drivers/mtd/nand/raw/rzn1-nand-controller.c  
> 
> > +static int rzn1_read_subpage_hw_ecc(struct nand_chip *chip, u32 req_offset,
> > +                                   u32 req_len, u8 *bufpoi, int page)
> > +{
> > +       struct rzn1_nfc *nfc = to_rzn1_nfc(chip->controller);
> > +       struct mtd_info *mtd = nand_to_mtd(chip);
> > +       struct rzn1_nand_chip *rzn1_nand = to_rzn1_nand(chip);
> > +       unsigned int cs = to_nfc_cs(rzn1_nand);
> > +       unsigned int page_off = round_down(req_offset, chip->ecc.size);
> > +       unsigned int real_len = round_up(req_offset + req_len - page_off,
> > +                                        chip->ecc.size);
> > +       unsigned int start_chunk = page_off / chip->ecc.size;
> > +       unsigned int nchunks = real_len / chip->ecc.size;
> > +       unsigned int ecc_off = 2 + (start_chunk * chip->ecc.bytes);
> > +       struct rzn1_op rop = {
> > +               .command = COMMAND_INPUT_SEL_AHBS | COMMAND_0(NAND_CMD_READ0) |
> > +                          COMMAND_2(NAND_CMD_READSTART) | COMMAND_FIFO_SEL |
> > +                          COMMAND_SEQ_READ_PAGE,
> > +               .addr0_row = page,
> > +               .addr0_col = page_off,
> > +               .len = real_len,
> > +               .ecc_offset = ECC_OFFSET(mtd->writesize + ecc_off),
> > +       };
> > +       unsigned int max_bitflips = 0;
> > +       u32 ecc_stat;
> > +       int bf, ret, i;  
> 
> unsigned int i

Strangely I'm used to always set my loop indexes as signed integers,
but I'll happily change that everywhere in the driver before
re-submitting.

[...]

> > +static int rzn1_write_page_hw_ecc(struct nand_chip *chip, const u8 *buf,
> > +                                 int oob_required, int page)
> > +{
> > +       struct rzn1_nfc *nfc = to_rzn1_nfc(chip->controller);
> > +       struct mtd_info *mtd = nand_to_mtd(chip);
> > +       struct rzn1_nand_chip *rzn1_nand = to_rzn1_nand(chip);
> > +       unsigned int cs = to_nfc_cs(rzn1_nand);
> > +       struct rzn1_op rop = {
> > +               .command = COMMAND_INPUT_SEL_DMA | COMMAND_0(NAND_CMD_SEQIN) |
> > +                          COMMAND_1(NAND_CMD_PAGEPROG) | COMMAND_FIFO_SEL |
> > +                          COMMAND_SEQ_WRITE_PAGE,
> > +               .addr0_row = page,
> > +               .len = mtd->writesize,
> > +               .ecc_offset = ECC_OFFSET(mtd->writesize + 2),
> > +       };
> > +       dma_addr_t dma_addr;
> > +       int ret;
> > +
> > +       memcpy(nfc->buf, buf, mtd->writesize);
> > +
> > +       /* Prepare controller */
> > +       rzn1_nfc_select_target(chip, chip->cur_cs);
> > +       rzn1_nfc_clear_status(nfc);
> > +       reinit_completion(&nfc->complete);
> > +       rzn1_nfc_en_interrupts(nfc, INT_MEM_RDY(cs));
> > +       rzn1_nfc_en_correction(nfc);
> > +
> > +       /* Configure DMA */
> > +       dma_addr = dma_map_single(nfc->dev, (void *)nfc->buf, mtd->writesize,
> > +                                 DMA_TO_DEVICE);
> > +       writel(dma_addr, nfc->regs + DMA_ADDR_LOW_REG);
> > +       writel(mtd->writesize, nfc->regs + DMA_CNT_REG);
> > +       writel(DMA_TLVL_MAX, nfc->regs + DMA_TLVL_REG);
> > +
> > +       rzn1_nfc_trigger_op(nfc, &rop);
> > +       rzn1_nfc_trigger_dma(nfc);
> > +
> > +       ret = rzn1_nfc_wait_end_of_io(nfc, chip);
> > +       dma_unmap_single(nfc->dev, dma_addr, mtd->writesize, DMA_TO_DEVICE);
> > +       rzn1_nfc_dis_correction(nfc);
> > +       if (ret) {
> > +               dev_err(nfc->dev, "Write page operation never ending\n");
> > +               return ret;
> > +       }
> > +
> > +       if (oob_required) {  
> 
> Return early if !oob_required, to reduce indentation below?

Yeah sure.

> > +               ret = nand_change_write_column_op(chip, mtd->writesize,
> > +                                                 chip->oob_poi, mtd->oobsize,
> > +                                                 false);
> > +               if (ret)
> > +                       return ret;
> > +       }
> > +
> > +       return 0;
> > +}  

[...]

> > +static int rzn1_nfc_probe(struct platform_device *pdev)
> > +{
> > +       struct rzn1_nfc *nfc;
> > +       int irq, ret;
> > +
> > +       nfc = devm_kzalloc(&pdev->dev, sizeof(*nfc), GFP_KERNEL);
> > +       if (!nfc)
> > +               return -ENOMEM;
> > +
> > +       nfc->dev = &pdev->dev;
> > +       nand_controller_init(&nfc->controller);
> > +       nfc->controller.ops = &rzn1_nfc_ops;
> > +       INIT_LIST_HEAD(&nfc->chips);
> > +       init_completion(&nfc->complete);
> > +
> > +       nfc->regs = devm_platform_ioremap_resource(pdev, 0);
> > +       if (IS_ERR(nfc->regs))
> > +               return PTR_ERR(nfc->regs);
> > +
> > +       rzn1_nfc_dis_interrupts(nfc);
> > +       irq = platform_get_irq(pdev, 0);  
> 
> platform_get_irq_optional()
> 
> > +       if (irq < 0) {  
> 
> What if this is a real error, or -EPROBE_DEFER?

If it's a real error I believe we should still fallback to polling? Or
do you prefer to only use polling on a fixed condition?

However it's true that I forgot to handle the deferred case here.

> > +               dev_info(&pdev->dev, "Using polling\n");
> > +               nfc->use_polling = true;
> > +       } else {
> > +               ret = devm_request_irq(&pdev->dev, irq, rzn1_nfc_irq_handler, 0,
> > +                                      "rzn1-nand-controller", nfc);
> > +               if (ret < 0)
> > +                       return ret;
> > +       }
> > +
> > +       ret = dma_set_mask(&pdev->dev, DMA_BIT_MASK(32));
> > +       if (ret)
> > +               return ret;
> > +
> > +       nfc->hclk = devm_clk_get(&pdev->dev, "hclk");
> > +       if (IS_ERR(nfc->hclk))
> > +               return PTR_ERR(nfc->hclk);
> > +
> > +       nfc->eclk = devm_clk_get(&pdev->dev, "eclk");
> > +       if (IS_ERR(nfc->eclk))
> > +               return PTR_ERR(nfc->eclk);
> > +
> > +       ret = clk_prepare_enable(nfc->hclk);
> > +       if (ret)
> > +               return ret;
> > +
> > +       ret = clk_prepare_enable(nfc->eclk);
> > +       if (ret)
> > +               goto disable_hclk;
> > +
> > +       rzn1_nfc_clear_fifo(nfc);
> > +
> > +       platform_set_drvdata(pdev, nfc);
> > +
> > +       ret = rzn1_nand_chips_init(nfc);
> > +       if (ret)
> > +               goto disable_eclk;
> > +
> > +       return 0;
> > +
> > +disable_eclk:
> > +       clk_disable_unprepare(nfc->eclk);
> > +disable_hclk:
> > +       clk_disable_unprepare(nfc->hclk);
> > +
> > +       return ret;
> > +}  
> 
> > +static const struct of_device_id rzn1_nfc_id_table[] = {
> > +       { .compatible = "renesas,r9a06g032-nand-controller" },  
> 
> Given my comment on the bindings, you probably want to match against
> "renesas,rzn1-nand-controller" instead.

Sure.

> 
> > +       {} /* sentinel */
> > +};
> > +MODULE_DEVICE_TABLE(of, nfc_id_table);
> > +
> > +static struct platform_driver rzn1_nfc_driver = {
> > +       .driver = {
> > +               .name   = "renesas-nfc",  
> 
> Perhaps s/nfc/nandc/ everywhere, to avoid confusion with the other nfc?

There are many NAND controller drivers that are abbreviated with nfc
because it's short and easy to write while still precise, but I have no
issue rewording nfc into nandc if you prefer.

> > +               .of_match_table = of_match_ptr(rzn1_nfc_id_table),
> > +       },
> > +       .probe = rzn1_nfc_probe,
> > +       .remove = rzn1_nfc_remove,
> > +};
> > +module_platform_driver(rzn1_nfc_driver);  
> 

Thanks,
Miquèl
