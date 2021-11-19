Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7352456BEC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Nov 2021 09:56:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233643AbhKSI7J (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 19 Nov 2021 03:59:09 -0500
Received: from mail-ua1-f41.google.com ([209.85.222.41]:44878 "EHLO
        mail-ua1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230027AbhKSI7I (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 19 Nov 2021 03:59:08 -0500
Received: by mail-ua1-f41.google.com with SMTP id p2so19737097uad.11
        for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Nov 2021 00:56:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Hor3EEYI9D9avRR4fz8RyU4t30hMlnEbgv5uVugQFeA=;
        b=SHYCQEJpFOvIqGr9EaGlkDig7vMxnJFpVVyXdjFOEhDpAG3Tf0XyBL8xQDY4KeNcEv
         eiKeq+zQICFoJk8XVYRsAnSjLoKh37pPA0HAbVC2LUlTijVDH4/jH73NEMO4U3kARXFA
         icLQZwxR/HgTuXmxcjp5EUnrLOmVhQ+oXtKOeDiCmAgtKskvywXENYlsEmhbNwbwUO/O
         r4B4F2yvbJgPBaIdQrgoWvvbtc/koAGGxClsqcxKFDvkhy6vUKJTvTrvxjRe/XahskFv
         Og1k0R1x28a/MG/8i2Sv3HmTWz70BEeQJj/H+YgwY792NAUnyegxmJiOpp1LDxcdhNNk
         suLQ==
X-Gm-Message-State: AOAM531UwGQc+hAc3H8FSrHOHSYNjZU8t06xz03u/1jaiDeii3KM9xIk
        Cjtnfgq0qtw7Xvs5Bb8+zUk7cdi/Uq7njg==
X-Google-Smtp-Source: ABdhPJwvSMsBdPx29NjpF+nQnNmxCVoOZvHEao8Ki8QLiNAdIWmjWxr1FQJddD4RZprfhTxpXySWOg==
X-Received: by 2002:ab0:719a:: with SMTP id l26mr46490736uao.88.1637312166579;
        Fri, 19 Nov 2021 00:56:06 -0800 (PST)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com. [209.85.221.177])
        by smtp.gmail.com with ESMTPSA id 62sm1493910uam.6.2021.11.19.00.56.06
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Nov 2021 00:56:06 -0800 (PST)
Received: by mail-vk1-f177.google.com with SMTP id t127so5439733vke.13
        for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Nov 2021 00:56:06 -0800 (PST)
X-Received: by 2002:a05:6122:20ab:: with SMTP id i43mr115054181vkd.19.1637312165815;
 Fri, 19 Nov 2021 00:56:05 -0800 (PST)
MIME-Version: 1.0
References: <20211118111940.1275351-1-miquel.raynal@bootlin.com> <20211118111940.1275351-3-miquel.raynal@bootlin.com>
In-Reply-To: <20211118111940.1275351-3-miquel.raynal@bootlin.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 19 Nov 2021 09:55:53 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUTj_kHV6=fMJ=CjiHjBSi_TrnrjeT0BdaHkONHPxwnQA@mail.gmail.com>
Message-ID: <CAMuHMdUTj_kHV6=fMJ=CjiHjBSi_TrnrjeT0BdaHkONHPxwnQA@mail.gmail.com>
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

CC Gareth

On Thu, Nov 18, 2021 at 12:19 PM Miquel Raynal
<miquel.raynal@bootlin.com> wrote:
> Introduce Renesas RZ/N1x NAND controller driver which supports:
> - All ONFI timing modes
> - Different configurations of its internal ECC controller
> - On-die (not tested) and software ECC support
> - Several chips (not tested)
> - Subpage accesses
> - DMA and PIO
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks for your patch!

> --- a/drivers/mtd/nand/raw/Kconfig
> +++ b/drivers/mtd/nand/raw/Kconfig
> @@ -467,6 +467,12 @@ config MTD_NAND_PL35X
>           Enables support for PrimeCell SMC PL351 and PL353 NAND
>           controller found on Zynq7000.
>
> +config MTD_NAND_RZN1
> +       tristate "Renesas RZ/N1D, RZ/N1S, RZ/N1L NAND controller"
> +       depends on OF || COMPILE_TEST

depends on ARCH_RENESAS || COMPILE_TEST

> +       help
> +         Enables support for Renesas RZ/N1x SoC family NAND controller.
> +
>  comment "Misc"
>
>  config MTD_SM_COMMON

> --- /dev/null
> +++ b/drivers/mtd/nand/raw/rzn1-nand-controller.c

> +static int rzn1_read_subpage_hw_ecc(struct nand_chip *chip, u32 req_offset,
> +                                   u32 req_len, u8 *bufpoi, int page)
> +{
> +       struct rzn1_nfc *nfc = to_rzn1_nfc(chip->controller);
> +       struct mtd_info *mtd = nand_to_mtd(chip);
> +       struct rzn1_nand_chip *rzn1_nand = to_rzn1_nand(chip);
> +       unsigned int cs = to_nfc_cs(rzn1_nand);
> +       unsigned int page_off = round_down(req_offset, chip->ecc.size);
> +       unsigned int real_len = round_up(req_offset + req_len - page_off,
> +                                        chip->ecc.size);
> +       unsigned int start_chunk = page_off / chip->ecc.size;
> +       unsigned int nchunks = real_len / chip->ecc.size;
> +       unsigned int ecc_off = 2 + (start_chunk * chip->ecc.bytes);
> +       struct rzn1_op rop = {
> +               .command = COMMAND_INPUT_SEL_AHBS | COMMAND_0(NAND_CMD_READ0) |
> +                          COMMAND_2(NAND_CMD_READSTART) | COMMAND_FIFO_SEL |
> +                          COMMAND_SEQ_READ_PAGE,
> +               .addr0_row = page,
> +               .addr0_col = page_off,
> +               .len = real_len,
> +               .ecc_offset = ECC_OFFSET(mtd->writesize + ecc_off),
> +       };
> +       unsigned int max_bitflips = 0;
> +       u32 ecc_stat;
> +       int bf, ret, i;

unsigned int i

> +
> +       /* Prepare controller */
> +       rzn1_nfc_select_target(chip, chip->cur_cs);
> +       rzn1_nfc_clear_status(nfc);
> +       rzn1_nfc_en_correction(nfc);
> +       rzn1_nfc_trigger_op(nfc, &rop);
> +
> +       while (!FIFO_STATE_C_EMPTY(readl(nfc->regs + FIFO_STATE_REG)))
> +               cpu_relax();
> +
> +       while (FIFO_STATE_R_EMPTY(readl(nfc->regs + FIFO_STATE_REG)))
> +               cpu_relax();
> +
> +       ioread32_rep(nfc->regs + FIFO_DATA_REG, bufpoi + page_off,
> +                    real_len / 4);
> +
> +       if (!FIFO_STATE_R_EMPTY(readl(nfc->regs + FIFO_STATE_REG))) {
> +               dev_err(nfc->dev, "Clearing residual data in the read FIFO\n");
> +               rzn1_nfc_clear_fifo(nfc);
> +       }
> +
> +       ret = rzn1_nfc_wait_end_of_op(nfc, chip);
> +       rzn1_nfc_dis_correction(nfc);
> +       if (ret) {
> +               dev_err(nfc->dev, "Read subpage operation never ending\n");
> +               return ret;
> +       }
> +
> +       ecc_stat = readl_relaxed(nfc->regs + ECC_STAT_REG);
> +
> +       if (ECC_STAT_UNCORRECTABLE(cs, ecc_stat)) {
> +               ret = nand_change_read_column_op(chip, mtd->writesize,
> +                                                chip->oob_poi, mtd->oobsize,
> +                                                false);
> +               if (ret)
> +                       return ret;
> +
> +               for (i = start_chunk; i < nchunks; i++) {
> +                       unsigned int dataoff = i * chip->ecc.size;
> +                       unsigned int eccoff = 2 + (i * chip->ecc.bytes);
> +
> +                       bf = nand_check_erased_ecc_chunk(bufpoi + dataoff,
> +                                                        chip->ecc.size,
> +                                                        chip->oob_poi + eccoff,
> +                                                        chip->ecc.bytes,
> +                                                        NULL, 0,
> +                                                        chip->ecc.strength);
> +                       if (bf < 0) {
> +                               mtd->ecc_stats.failed++;
> +                       } else {
> +                               mtd->ecc_stats.corrected += bf;
> +                               max_bitflips = max_t(unsigned int, max_bitflips, bf);
> +                       }
> +               }
> +       } else if (ECC_STAT_CORRECTABLE(cs, ecc_stat)) {
> +               bf = ECC_CNT(cs, readl_relaxed(nfc->regs + ECC_CNT_REG));
> +               /*
> +                * The number of bitflips is an approximation given the fact
> +                * that this controller does not provide per-chunk details but
> +                * only gives statistics on the entire page.
> +                */
> +               mtd->ecc_stats.corrected += bf;
> +       }
> +
> +       return 0;
> +}
> +
> +static int rzn1_write_page_hw_ecc(struct nand_chip *chip, const u8 *buf,
> +                                 int oob_required, int page)
> +{
> +       struct rzn1_nfc *nfc = to_rzn1_nfc(chip->controller);
> +       struct mtd_info *mtd = nand_to_mtd(chip);
> +       struct rzn1_nand_chip *rzn1_nand = to_rzn1_nand(chip);
> +       unsigned int cs = to_nfc_cs(rzn1_nand);
> +       struct rzn1_op rop = {
> +               .command = COMMAND_INPUT_SEL_DMA | COMMAND_0(NAND_CMD_SEQIN) |
> +                          COMMAND_1(NAND_CMD_PAGEPROG) | COMMAND_FIFO_SEL |
> +                          COMMAND_SEQ_WRITE_PAGE,
> +               .addr0_row = page,
> +               .len = mtd->writesize,
> +               .ecc_offset = ECC_OFFSET(mtd->writesize + 2),
> +       };
> +       dma_addr_t dma_addr;
> +       int ret;
> +
> +       memcpy(nfc->buf, buf, mtd->writesize);
> +
> +       /* Prepare controller */
> +       rzn1_nfc_select_target(chip, chip->cur_cs);
> +       rzn1_nfc_clear_status(nfc);
> +       reinit_completion(&nfc->complete);
> +       rzn1_nfc_en_interrupts(nfc, INT_MEM_RDY(cs));
> +       rzn1_nfc_en_correction(nfc);
> +
> +       /* Configure DMA */
> +       dma_addr = dma_map_single(nfc->dev, (void *)nfc->buf, mtd->writesize,
> +                                 DMA_TO_DEVICE);
> +       writel(dma_addr, nfc->regs + DMA_ADDR_LOW_REG);
> +       writel(mtd->writesize, nfc->regs + DMA_CNT_REG);
> +       writel(DMA_TLVL_MAX, nfc->regs + DMA_TLVL_REG);
> +
> +       rzn1_nfc_trigger_op(nfc, &rop);
> +       rzn1_nfc_trigger_dma(nfc);
> +
> +       ret = rzn1_nfc_wait_end_of_io(nfc, chip);
> +       dma_unmap_single(nfc->dev, dma_addr, mtd->writesize, DMA_TO_DEVICE);
> +       rzn1_nfc_dis_correction(nfc);
> +       if (ret) {
> +               dev_err(nfc->dev, "Write page operation never ending\n");
> +               return ret;
> +       }
> +
> +       if (oob_required) {

Return early if !oob_required, to reduce indentation below?

> +               ret = nand_change_write_column_op(chip, mtd->writesize,
> +                                                 chip->oob_poi, mtd->oobsize,
> +                                                 false);
> +               if (ret)
> +                       return ret;
> +       }
> +
> +       return 0;
> +}

> +/*
> + * This controller is simple enough and thus does not need to use the parser
> + * provided by the core, instead, handle every situation here.
> + */
> +static int rzn1_nfc_exec_op(struct nand_chip *chip,
> +                           const struct nand_operation *op, bool check_only)
> +{
> +       struct rzn1_nfc *nfc = to_rzn1_nfc(chip->controller);
> +       const struct nand_op_instr *instr = NULL;
> +       struct rzn1_op rop = {
> +               .command = COMMAND_INPUT_SEL_AHBS,
> +               .gen_seq_ctrl = GEN_SEQ_IMD_SEQ,
> +       };
> +       unsigned int cmd_phase = 0, addr_phase = 0, data_phase = 0,
> +               delay_phase = 0, delays = 0;
> +       unsigned int op_id, col_addrs, row_addrs, naddrs, remainder, words;
> +       const u8 *addrs;
> +       u32 last_bytes;
> +       int i, ret;

unsigned int i

> +
> +       if (!check_only)
> +               rzn1_nfc_select_target(chip, op->cs);
> +
> +       for (op_id = 0; op_id < op->ninstrs; op_id++) {
> +               instr = &op->instrs[op_id];
> +
> +               nand_op_trace("  ", instr);
> +
> +               switch (instr->type) {
> +               case NAND_OP_CMD_INSTR:
> +                       switch (cmd_phase++) {
> +                       case 0:
> +                               rop.command |= COMMAND_0(instr->ctx.cmd.opcode);
> +                               rop.gen_seq_ctrl |= GEN_SEQ_CMD0_EN;
> +                               break;
> +                       case 1:
> +                               rop.gen_seq_ctrl |= GEN_SEQ_COMMAND_3(instr->ctx.cmd.opcode);
> +                               rop.gen_seq_ctrl |= GEN_SEQ_CMD3_EN;
> +                               if (addr_phase == 0)
> +                                       addr_phase = 1;
> +                               break;
> +                       case 2:
> +                               rop.command |= COMMAND_2(instr->ctx.cmd.opcode);
> +                               rop.gen_seq_ctrl |= GEN_SEQ_CMD2_EN;
> +                               if (addr_phase <= 1)
> +                                       addr_phase = 2;
> +                               break;
> +                       case 3:
> +                               rop.command |= COMMAND_1(instr->ctx.cmd.opcode);
> +                               rop.gen_seq_ctrl |= GEN_SEQ_CMD1_EN;
> +                               if (addr_phase <= 1)
> +                                       addr_phase = 2;
> +                               if (delay_phase == 0)
> +                                       delay_phase = 1;
> +                               if (data_phase == 0)
> +                                       data_phase = 1;
> +                               break;
> +                       default:
> +                               return -EOPNOTSUPP;
> +                       }
> +                       break;
> +
> +               case NAND_OP_ADDR_INSTR:
> +                       addrs = instr->ctx.addr.addrs;
> +                       naddrs = instr->ctx.addr.naddrs;
> +                       if (naddrs > 5)
> +                               return -EOPNOTSUPP;
> +
> +                       col_addrs = min(2U, naddrs);
> +                       row_addrs = naddrs > 2 ? naddrs - col_addrs : 0;
> +
> +                       switch (addr_phase++) {
> +                       case 0:
> +                               for (i = 0; i < col_addrs; i++)
> +                                       rop.addr0_col |= addrs[i] << (i * 8);
> +                               rop.gen_seq_ctrl |= GEN_SEQ_COL_A0(col_addrs);
> +
> +                               for (i = 0; i < row_addrs; i++)
> +                                       rop.addr0_row |= addrs[2 + i] << (i * 8);
> +                               rop.gen_seq_ctrl |= GEN_SEQ_ROW_A0(row_addrs);
> +
> +                               if (cmd_phase == 0)
> +                                       cmd_phase = 1;
> +                               break;
> +                       case 1:
> +                               for (i = 0; i < col_addrs; i++)
> +                                       rop.addr1_col |= addrs[i] << (i * 8);
> +                               rop.gen_seq_ctrl |= GEN_SEQ_COL_A1(col_addrs);
> +
> +                               for (i = 0; i < row_addrs; i++)
> +                                       rop.addr1_row |= addrs[2 + i] << (i * 8);
> +                               rop.gen_seq_ctrl |= GEN_SEQ_ROW_A1(row_addrs);
> +
> +                               if (cmd_phase <= 1)
> +                                       cmd_phase = 2;
> +                               break;
> +                       default:
> +                               return -EOPNOTSUPP;
> +                       }
> +                       break;
> +
> +               case NAND_OP_DATA_IN_INSTR:
> +                       rop.read = true;
> +                       fallthrough;
> +               case NAND_OP_DATA_OUT_INSTR:
> +                       rop.gen_seq_ctrl |= GEN_SEQ_DATA_EN;
> +                       rop.buf = instr->ctx.data.buf.in;
> +                       rop.len = instr->ctx.data.len;
> +                       rop.command |= COMMAND_FIFO_SEL;
> +
> +                       switch (data_phase++) {
> +                       case 0:
> +                               if (cmd_phase <= 2)
> +                                       cmd_phase = 3;
> +                               if (addr_phase <= 1)
> +                                       addr_phase = 2;
> +                               if (delay_phase == 0)
> +                                       delay_phase = 1;
> +                               break;
> +                       default:
> +                               return -EOPNOTSUPP;
> +                       }
> +                       break;
> +
> +               case NAND_OP_WAITRDY_INSTR:
> +                       switch (delay_phase++) {
> +                       case 0:
> +                               rop.gen_seq_ctrl |= GEN_SEQ_DELAY0_EN;
> +
> +                               if (cmd_phase <= 2)
> +                                       cmd_phase = 3;
> +                               break;
> +                       case 1:
> +                               rop.gen_seq_ctrl |= GEN_SEQ_DELAY1_EN;
> +
> +                               if (cmd_phase <= 3)
> +                                       cmd_phase = 4;
> +                               if (data_phase == 0)
> +                                       data_phase = 1;
> +                               break;
> +                       default:
> +                               return -EOPNOTSUPP;
> +                       }
> +                       break;
> +               }
> +       }
> +
> +       /*
> +        * Sequence 19 is generic and dedicated to write operations.
> +        * Sequence 18 is also generic and works for all other operations.
> +        */
> +       if (rop.buf && !rop.read)
> +               rop.command |= COMMAND_SEQ_GEN_OUT;
> +       else
> +               rop.command |= COMMAND_SEQ_GEN_IN;
> +
> +       if (delays > 1) {
> +               dev_err(nfc->dev, "Cannot handle more than one wait delay\n");
> +               return -EOPNOTSUPP;
> +       }
> +
> +       if (check_only)
> +               return 0;
> +
> +       rzn1_nfc_trigger_op(nfc, &rop);
> +
> +       words = rop.len / sizeof(u32);
> +       remainder = rop.len % sizeof(u32);
> +       if (rop.buf && rop.read) {
> +               while (!FIFO_STATE_C_EMPTY(readl(nfc->regs + FIFO_STATE_REG)))
> +                       cpu_relax();
> +
> +               while (FIFO_STATE_R_EMPTY(readl(nfc->regs + FIFO_STATE_REG)))
> +                       cpu_relax();
> +
> +               ioread32_rep(nfc->regs + FIFO_DATA_REG, rop.buf, words);
> +               if (remainder) {
> +                       last_bytes = readl_relaxed(nfc->regs + FIFO_DATA_REG);
> +                       memcpy(rop.buf + (words * sizeof(u32)), &last_bytes,
> +                              remainder);
> +               }
> +
> +               if (!FIFO_STATE_R_EMPTY(readl(nfc->regs + FIFO_STATE_REG))) {
> +                       dev_warn(nfc->dev,
> +                                "Clearing residual data in the read FIFO\n");
> +                       rzn1_nfc_clear_fifo(nfc);
> +               }
> +       } else if (rop.len && !rop.read) {
> +               while (FIFO_STATE_W_FULL(readl(nfc->regs + FIFO_STATE_REG)))
> +                       cpu_relax();
> +
> +               iowrite32_rep(nfc->regs + FIFO_DATA_REG, rop.buf,
> +                             DIV_ROUND_UP(rop.len, 4));
> +
> +               if (remainder) {
> +                       last_bytes = 0;
> +                       memcpy(&last_bytes, rop.buf + (words * sizeof(u32)), remainder);
> +                       writel_relaxed(last_bytes, nfc->regs + FIFO_DATA_REG);
> +               }
> +
> +               while (!FIFO_STATE_W_EMPTY(readl(nfc->regs + FIFO_STATE_REG)))
> +                       cpu_relax();
> +       }
> +
> +       ret = rzn1_nfc_wait_end_of_op(nfc, chip);
> +       if (ret)
> +               return ret;
> +
> +       return 0;
> +}


> +static int rzn1_nfc_probe(struct platform_device *pdev)
> +{
> +       struct rzn1_nfc *nfc;
> +       int irq, ret;
> +
> +       nfc = devm_kzalloc(&pdev->dev, sizeof(*nfc), GFP_KERNEL);
> +       if (!nfc)
> +               return -ENOMEM;
> +
> +       nfc->dev = &pdev->dev;
> +       nand_controller_init(&nfc->controller);
> +       nfc->controller.ops = &rzn1_nfc_ops;
> +       INIT_LIST_HEAD(&nfc->chips);
> +       init_completion(&nfc->complete);
> +
> +       nfc->regs = devm_platform_ioremap_resource(pdev, 0);
> +       if (IS_ERR(nfc->regs))
> +               return PTR_ERR(nfc->regs);
> +
> +       rzn1_nfc_dis_interrupts(nfc);
> +       irq = platform_get_irq(pdev, 0);

platform_get_irq_optional()

> +       if (irq < 0) {

What if this is a real error, or -EPROBE_DEFER?

> +               dev_info(&pdev->dev, "Using polling\n");
> +               nfc->use_polling = true;
> +       } else {
> +               ret = devm_request_irq(&pdev->dev, irq, rzn1_nfc_irq_handler, 0,
> +                                      "rzn1-nand-controller", nfc);
> +               if (ret < 0)
> +                       return ret;
> +       }
> +
> +       ret = dma_set_mask(&pdev->dev, DMA_BIT_MASK(32));
> +       if (ret)
> +               return ret;
> +
> +       nfc->hclk = devm_clk_get(&pdev->dev, "hclk");
> +       if (IS_ERR(nfc->hclk))
> +               return PTR_ERR(nfc->hclk);
> +
> +       nfc->eclk = devm_clk_get(&pdev->dev, "eclk");
> +       if (IS_ERR(nfc->eclk))
> +               return PTR_ERR(nfc->eclk);
> +
> +       ret = clk_prepare_enable(nfc->hclk);
> +       if (ret)
> +               return ret;
> +
> +       ret = clk_prepare_enable(nfc->eclk);
> +       if (ret)
> +               goto disable_hclk;
> +
> +       rzn1_nfc_clear_fifo(nfc);
> +
> +       platform_set_drvdata(pdev, nfc);
> +
> +       ret = rzn1_nand_chips_init(nfc);
> +       if (ret)
> +               goto disable_eclk;
> +
> +       return 0;
> +
> +disable_eclk:
> +       clk_disable_unprepare(nfc->eclk);
> +disable_hclk:
> +       clk_disable_unprepare(nfc->hclk);
> +
> +       return ret;
> +}

> +static const struct of_device_id rzn1_nfc_id_table[] = {
> +       { .compatible = "renesas,r9a06g032-nand-controller" },

Given my comment on the bindings, you probably want to match against
"renesas,rzn1-nand-controller" instead.

> +       {} /* sentinel */
> +};
> +MODULE_DEVICE_TABLE(of, nfc_id_table);
> +
> +static struct platform_driver rzn1_nfc_driver = {
> +       .driver = {
> +               .name   = "renesas-nfc",

Perhaps s/nfc/nandc/ everywhere, to avoid confusion with the other nfc?

> +               .of_match_table = of_match_ptr(rzn1_nfc_id_table),
> +       },
> +       .probe = rzn1_nfc_probe,
> +       .remove = rzn1_nfc_remove,
> +};
> +module_platform_driver(rzn1_nfc_driver);

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
