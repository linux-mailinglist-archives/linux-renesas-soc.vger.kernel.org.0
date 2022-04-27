Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E1D251191F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Apr 2022 16:55:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233911AbiD0NNp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 27 Apr 2022 09:13:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229655AbiD0NNo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 27 Apr 2022 09:13:44 -0400
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C0DA3898D9;
        Wed, 27 Apr 2022 06:10:31 -0700 (PDT)
Received: by mail-qt1-f182.google.com with SMTP id hf18so1075228qtb.0;
        Wed, 27 Apr 2022 06:10:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=r/ssOtiNsqa5EWnUNFE/Qav7i9mLXfcPE14X9cxwoYo=;
        b=fM1P4fUusm/I6yu/BTE39bjTk0jEi6gSw7ADItNHR23VjoPeqK89x+fuidCcMkwmdO
         NS3d8l14TabPW2AYf2p++1+kI0q8mjSzx7LRShNhwMqzdrWASnon15ze8ZQqOheRPCzg
         /eeHxeHJ9KQzJfaLNMj0YYi2laZAq/OjvAan28EDDMKkFJoUS9PpgwNLPefPhjcGbO98
         aCQkP9AFIPG4suCglPCWKQEtctZX17S7nQH1HPEX2GAjrHHXVx4wTwSIGZpZt5wSHiVb
         wRNYLcGAwyI+Skqep1UO2bCAnaN7ESNWXoGUM1FRs3v5J+JxyZB8VR6hrZ9TZFDBzrCl
         YUUA==
X-Gm-Message-State: AOAM531a3AleQAN2+wean01zWfsultBD6ibhvLrlfccmmysh+ZFNRkyF
        Avn4Bi4nPtHaMdHU7SJezOtxQr+8PA7CWw==
X-Google-Smtp-Source: ABdhPJzbtPosCGiepB9sC041KNflSiHkvDs10m/0PEbWB0/l9B0HA2VVh1NjhssgMRB/nFSj7yG7Sg==
X-Received: by 2002:a05:622a:651:b0:2f2:600:d146 with SMTP id a17-20020a05622a065100b002f20600d146mr18997963qtb.88.1651065029992;
        Wed, 27 Apr 2022 06:10:29 -0700 (PDT)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id c145-20020ae9ed97000000b0069f97fea9absm289784qkg.26.2022.04.27.06.10.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Apr 2022 06:10:29 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-2ef5380669cso17785547b3.9;
        Wed, 27 Apr 2022 06:10:29 -0700 (PDT)
X-Received: by 2002:a81:618b:0:b0:2db:d952:8a39 with SMTP id
 v133-20020a81618b000000b002dbd9528a39mr27060501ywb.132.1651065029390; Wed, 27
 Apr 2022 06:10:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220420025450.289578-1-yoshihiro.shimoda.uh@renesas.com> <20220420025450.289578-5-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20220420025450.289578-5-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 27 Apr 2022 15:10:16 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXn=qm_gutcq64y+XCa=CchKPqPnZqoc7jMMjcw-G0vmA@mail.gmail.com>
Message-ID: <CAMuHMdXn=qm_gutcq64y+XCa=CchKPqPnZqoc7jMMjcw-G0vmA@mail.gmail.com>
Subject: Re: [PATCH v4 4/7] scsi: ufs-renesas: Add support for Renesas R-Car
 UFS controller
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>, avri.altman@wdc.com,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        scsi <linux-scsi@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

On Wed, Apr 20, 2022 at 11:39 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Add support for Renesas R-Car UFS controller which needs vender specific
> initialization.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Thanks for your patch!

> --- /dev/null
> +++ b/drivers/scsi/ufs/ufs-renesas.c
> @@ -0,0 +1,418 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> +/*
> + * Renesas UFS host controller driver
> + *
> + * Copyright (C) 2022 Renesas Electronics Corporation
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/err.h>
> +#include <linux/iopoll.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/pm_runtime.h>
> +
> +#include "ufshcd.h"
> +#include "ufshcd-pltfrm.h"
> +
> +struct ufs_renesas_priv {
> +       bool initialized;       /* The hardware needs initialization once */
> +};
> +
> +enum {
> +       SET_PHY_INDEX_LO = 0,
> +       SET_PHY_INDEX_HI,
> +       TIMER_INDEX,
> +       MAX_INDEX
> +};
> +
> +enum ufs_renesas_init_param_mode {
> +       MODE_RESTORE,
> +       MODE_SET,
> +       MODE_SAVE,
> +       MODE_POLL,
> +       MODE_WAIT,
> +       MODE_WRITE,
> +};
> +
> +#define PARAM_RESTORE(_reg, _index) \
> +               { .mode = MODE_RESTORE, .reg = _reg, .index = _index }
> +#define PARAM_SET(_index, _set) \
> +               { .mode = MODE_SET, .index = _index, .u.set = _set }
> +#define PARAM_SAVE(_reg, _mask, _index) \
> +               { .mode = MODE_SAVE, .reg = _reg, .mask = (u32)(_mask), \
> +                 .index = _index }
> +#define PARAM_POLL(_reg, _expected, _mask) \
> +               { .mode = MODE_POLL, .reg = _reg, .u.expected = _expected, \
> +                 .mask = (u32)(_mask) }
> +#define PARAM_WAIT(_delay_us) \
> +               { .mode = MODE_WAIT, .u.delay_us = _delay_us }
> +
> +#define PARAM_WRITE(_reg, _val) \
> +               { .mode = MODE_WRITE, .reg = _reg, .u.val = _val }
> +
> +#define PARAM_WRITE_D0_D4(_d0, _d4) \
> +               PARAM_WRITE(0xd0, _d0), PARAM_WRITE(0xd4, _d4)
> +
> +#define PARAM_WRITE_800_80C_POLL(_addr, _data_800)             \
> +               PARAM_WRITE_D0_D4(0x0000080c, 0x00000100),      \
> +               PARAM_WRITE_D0_D4(0x00000800, ((_data_800) << 16) | BIT(8) | (_addr)), \
> +               PARAM_WRITE(0xd0, 0x0000080c),                  \
> +               PARAM_POLL(0xd4, BIT(8), BIT(8))
> +
> +#define PARAM_RESTORE_800_80C_POLL(_index)                     \
> +               PARAM_WRITE_D0_D4(0x0000080c, 0x00000100),      \
> +               PARAM_WRITE(0xd0, 0x00000800),                  \
> +               PARAM_RESTORE(0xd4, _index),                    \
> +               PARAM_WRITE(0xd0, 0x0000080c),                  \
> +               PARAM_POLL(0xd4, BIT(8), BIT(8))
> +
> +#define PARAM_WRITE_804_80C_POLL(_addr, _data_804)             \
> +               PARAM_WRITE_D0_D4(0x0000080c, 0x00000100),      \
> +               PARAM_WRITE_D0_D4(0x00000804, ((_data_804) << 16) | BIT(8) | (_addr)), \
> +               PARAM_WRITE(0xd0, 0x0000080c),                  \
> +               PARAM_POLL(0xd4, BIT(8), BIT(8))
> +
> +#define PARAM_WRITE_828_82C_POLL(_data_828)                    \
> +               PARAM_WRITE_D0_D4(0x0000082c, 0x0f000000),      \
> +               PARAM_WRITE_D0_D4(0x00000828, _data_828),       \
> +               PARAM_WRITE(0xd0, 0x0000082c),                  \
> +               PARAM_POLL(0xd4, _data_828, _data_828)
> +
> +#define PARAM_WRITE_PHY(_addr16, _data16)                      \
> +               PARAM_WRITE(0xf0, 1),                           \
> +               PARAM_WRITE_800_80C_POLL(0x16, (_addr16) & 0xff), \
> +               PARAM_WRITE_800_80C_POLL(0x17, ((_addr16) >> 8) & 0xff), \
> +               PARAM_WRITE_800_80C_POLL(0x18, (_data16) & 0xff), \
> +               PARAM_WRITE_800_80C_POLL(0x19, ((_data16) >> 8) & 0xff), \
> +               PARAM_WRITE_800_80C_POLL(0x1c, 0x01),           \
> +               PARAM_WRITE_828_82C_POLL(0x0f000000),           \
> +               PARAM_WRITE(0xf0, 0)
> +
> +#define PARAM_SET_PHY(_addr16, _data16)                                \
> +               PARAM_WRITE(0xf0, 1),                           \
> +               PARAM_WRITE_800_80C_POLL(0x16, (_addr16) & 0xff), \
> +               PARAM_WRITE_800_80C_POLL(0x17, ((_addr16) >> 8) & 0xff), \
> +               PARAM_WRITE_800_80C_POLL(0x1c, 0x01),           \
> +               PARAM_WRITE_828_82C_POLL(0x0f000000),           \
> +               PARAM_WRITE_804_80C_POLL(0x1a, 0),              \
> +               PARAM_WRITE(0xd0, 0x00000808),                  \
> +               PARAM_SAVE(0xd4, 0xff, SET_PHY_INDEX_LO),       \
> +               PARAM_WRITE_804_80C_POLL(0x1b, 0),              \
> +               PARAM_WRITE(0xd0, 0x00000808),                  \
> +               PARAM_SAVE(0xd4, 0xff, SET_PHY_INDEX_HI),       \
> +               PARAM_WRITE_828_82C_POLL(0x0f000000),           \
> +               PARAM_WRITE(0xf0, 0),                           \
> +               PARAM_WRITE(0xf0, 1),                           \
> +               PARAM_WRITE_800_80C_POLL(0x16, (_addr16) & 0xff), \
> +               PARAM_WRITE_800_80C_POLL(0x17, ((_addr16) >> 8) & 0xff), \
> +               PARAM_SET(SET_PHY_INDEX_LO, ((_data16 & 0xff) << 16) | BIT(8) | 0x18), \
> +               PARAM_RESTORE_800_80C_POLL(SET_PHY_INDEX_LO),   \
> +               PARAM_SET(SET_PHY_INDEX_HI, (((_data16 >> 8) & 0xff) << 16) | BIT(8) | 0x19), \
> +               PARAM_RESTORE_800_80C_POLL(SET_PHY_INDEX_HI),   \
> +               PARAM_WRITE_800_80C_POLL(0x1c, 0x01),           \
> +               PARAM_WRITE_828_82C_POLL(0x0f000000),           \
> +               PARAM_WRITE(0xf0, 0)
> +
> +#define PARAM_INDIRECT_WRITE(_gpio, _addr, _data_800)          \
> +               PARAM_WRITE(0xf0, _gpio),                       \
> +               PARAM_WRITE_800_80C_POLL(_addr, _data_800),     \
> +               PARAM_WRITE_828_82C_POLL(0x0f000000),           \
> +               PARAM_WRITE(0xf0, 0)
> +
> +#define PARAM_INDIRECT_POLL(_gpio, _addr, _expected, _mask)    \
> +               PARAM_WRITE(0xf0, _gpio),                       \
> +               PARAM_WRITE_800_80C_POLL(_addr, 0),             \
> +               PARAM_WRITE(0xd0, 0x00000808),                  \
> +               PARAM_POLL(0xd4, _expected, _mask),             \
> +               PARAM_WRITE(0xf0, 0)
> +
> +struct ufs_renesas_init_param {
> +       enum ufs_renesas_init_param_mode mode;
> +       u32 reg;
> +       union {
> +               u32 expected;
> +               u32 delay_us;
> +               u32 set;
> +               u32 val;
> +       } u;
> +       u32 mask;
> +       u32 index;
> +};
> +
> +/* This setting is for SERIES B */
> +static const struct ufs_renesas_init_param ufs_param[] = {
> +       PARAM_WRITE(0xc0, 0x49425308),
> +       PARAM_WRITE_D0_D4(0x00000104, 0x00000002),
> +       PARAM_WAIT(1),
> +       PARAM_WRITE_D0_D4(0x00000828, 0x00000200),
> +       PARAM_WAIT(1),
> +       PARAM_WRITE_D0_D4(0x00000828, 0x00000000),
> +       PARAM_WRITE_D0_D4(0x00000104, 0x00000001),
> +       PARAM_WRITE_D0_D4(0x00000940, 0x00000001),
> +       PARAM_WAIT(1),
> +       PARAM_WRITE_D0_D4(0x00000940, 0x00000000),
> +
> +       PARAM_WRITE(0xc0, 0x49425308),
> +       PARAM_WRITE(0xc0, 0x41584901),
> +
> +       PARAM_WRITE_D0_D4(0x0000080c, 0x00000100),
> +       PARAM_WRITE_D0_D4(0x00000804, 0x00000000),
> +       PARAM_WRITE(0xd0, 0x0000080c),
> +       PARAM_POLL(0xd4, BIT(8), BIT(8)),
> +
> +       PARAM_WRITE(REG_CONTROLLER_ENABLE, 0x00000001),
> +
> +       PARAM_WRITE(0xd0, 0x00000804),
> +       PARAM_POLL(0xd4, BIT(8) | BIT(6) | BIT(0), BIT(8) | BIT(6) | BIT(0)),
> +
> +       PARAM_WRITE(0xd0, 0x00000d00),
> +       PARAM_SAVE(0xd4, 0x0000ffff, TIMER_INDEX),
> +       PARAM_WRITE(0xd4, 0x00000000),
> +       PARAM_WRITE_D0_D4(0x0000082c, 0x0f000000),
> +       PARAM_WRITE_D0_D4(0x00000828, 0x08000000),
> +       PARAM_WRITE(0xd0, 0x0000082c),
> +       PARAM_POLL(0xd4, BIT(27), BIT(27)),
> +       PARAM_WRITE(0xd0, 0x00000d2c),
> +       PARAM_POLL(0xd4, BIT(0), BIT(0)),
> +
> +       /* phy setup */
> +       PARAM_INDIRECT_WRITE(1, 0x01, 0x001f),
> +       PARAM_INDIRECT_WRITE(7, 0x5d, 0x0014),
> +       PARAM_INDIRECT_WRITE(7, 0x5e, 0x0014),
> +       PARAM_INDIRECT_WRITE(7, 0x0d, 0x0003),
> +       PARAM_INDIRECT_WRITE(7, 0x0e, 0x0007),
> +       PARAM_INDIRECT_WRITE(7, 0x5f, 0x0003),
> +       PARAM_INDIRECT_WRITE(7, 0x60, 0x0003),
> +       PARAM_INDIRECT_WRITE(7, 0x5b, 0x00a6),
> +       PARAM_INDIRECT_WRITE(7, 0x5c, 0x0003),
> +
> +       PARAM_INDIRECT_POLL(7, 0x3c, 0, BIT(7)),
> +       PARAM_INDIRECT_POLL(7, 0x4c, 0, BIT(4)),
> +
> +       PARAM_INDIRECT_WRITE(1, 0x32, 0x0080),
> +       PARAM_INDIRECT_WRITE(1, 0x1f, 0x0001),
> +       PARAM_INDIRECT_WRITE(0, 0x2c, 0x0001),
> +       PARAM_INDIRECT_WRITE(0, 0x32, 0x0087),
> +
> +       PARAM_INDIRECT_WRITE(1, 0x4d, 0x0061),
> +       PARAM_INDIRECT_WRITE(4, 0x9b, 0x0009),
> +       PARAM_INDIRECT_WRITE(4, 0xa6, 0x0005),
> +       PARAM_INDIRECT_WRITE(4, 0xa5, 0x0058),
> +       PARAM_INDIRECT_WRITE(1, 0x39, 0x0027),
> +       PARAM_INDIRECT_WRITE(1, 0x47, 0x004c),
> +
> +       PARAM_INDIRECT_WRITE(7, 0x0d, 0x0002),
> +       PARAM_INDIRECT_WRITE(7, 0x0e, 0x0007),
> +
> +       PARAM_WRITE_PHY(0x0028, 0x0061),
> +       PARAM_WRITE_PHY(0x4014, 0x0061),
> +       PARAM_SET_PHY(0x401c, BIT(2)),
> +       PARAM_WRITE_PHY(0x4000, 0x0000),
> +       PARAM_WRITE_PHY(0x4001, 0x0000),
> +
> +       PARAM_WRITE_PHY(0x10ae, 0x0001),
> +       PARAM_WRITE_PHY(0x10ad, 0x0000),
> +       PARAM_WRITE_PHY(0x10af, 0x0001),
> +       PARAM_WRITE_PHY(0x10b6, 0x0001),
> +       PARAM_WRITE_PHY(0x10ae, 0x0000),
> +
> +       PARAM_WRITE_PHY(0x10ae, 0x0001),
> +       PARAM_WRITE_PHY(0x10ad, 0x0000),
> +       PARAM_WRITE_PHY(0x10af, 0x0002),
> +       PARAM_WRITE_PHY(0x10b6, 0x0001),
> +       PARAM_WRITE_PHY(0x10ae, 0x0000),
> +
> +       PARAM_WRITE_PHY(0x10ae, 0x0001),
> +       PARAM_WRITE_PHY(0x10ad, 0x0080),
> +       PARAM_WRITE_PHY(0x10af, 0x0000),
> +       PARAM_WRITE_PHY(0x10b6, 0x0001),
> +       PARAM_WRITE_PHY(0x10ae, 0x0000),
> +
> +       PARAM_WRITE_PHY(0x10ae, 0x0001),
> +       PARAM_WRITE_PHY(0x10ad, 0x0080),
> +       PARAM_WRITE_PHY(0x10af, 0x001a),
> +       PARAM_WRITE_PHY(0x10b6, 0x0001),
> +       PARAM_WRITE_PHY(0x10ae, 0x0000),
> +
> +       PARAM_INDIRECT_WRITE(7, 0x70, 0x0016),
> +       PARAM_INDIRECT_WRITE(7, 0x71, 0x0016),
> +       PARAM_INDIRECT_WRITE(7, 0x72, 0x0014),
> +       PARAM_INDIRECT_WRITE(7, 0x73, 0x0014),
> +       PARAM_INDIRECT_WRITE(7, 0x74, 0x0000),
> +       PARAM_INDIRECT_WRITE(7, 0x75, 0x0000),
> +       PARAM_INDIRECT_WRITE(7, 0x76, 0x0010),
> +       PARAM_INDIRECT_WRITE(7, 0x77, 0x0010),
> +       PARAM_INDIRECT_WRITE(7, 0x78, 0x00ff),
> +       PARAM_INDIRECT_WRITE(7, 0x79, 0x0000),
> +
> +       PARAM_INDIRECT_WRITE(7, 0x19, 0x0007),
> +
> +       PARAM_INDIRECT_WRITE(7, 0x1a, 0x0007),
> +
> +       PARAM_INDIRECT_WRITE(7, 0x24, 0x000c),
> +
> +       PARAM_INDIRECT_WRITE(7, 0x25, 0x000c),
> +
> +       PARAM_INDIRECT_WRITE(7, 0x62, 0x0000),
> +       PARAM_INDIRECT_WRITE(7, 0x63, 0x0000),
> +       PARAM_INDIRECT_WRITE(7, 0x5d, 0x0014),
> +       PARAM_INDIRECT_WRITE(7, 0x5e, 0x0017),
> +       PARAM_INDIRECT_WRITE(7, 0x5d, 0x0004),
> +       PARAM_INDIRECT_WRITE(7, 0x5e, 0x0017),
> +       PARAM_INDIRECT_POLL(7, 0x55, 0, BIT(6)),
> +       PARAM_INDIRECT_POLL(7, 0x41, 0, BIT(7)),
> +       /* end of phy setup */
> +
> +       PARAM_WRITE(0xf0, 0),
> +       PARAM_WRITE(0xd0, 0x00000d00),
> +       PARAM_RESTORE(0xd4, TIMER_INDEX),
> +};
> +
> +static void ufs_renesas_dbg_register_dump(struct ufs_hba *hba)
> +{
> +       ufshcd_dump_regs(hba, 0xc0, 0x40, "regs: 0xc0 + ");
> +}
> +
> +static void ufs_renesas_reg_control(struct ufs_hba *hba,
> +                                   const struct ufs_renesas_init_param *p)
> +{
> +       static u32 save[MAX_INDEX];
> +       int ret;
> +       u32 val;
> +
> +       pr_debug("%s: %d %04x %08x, %08x, %d\n", __func__, p->mode, p->reg,
> +                p->u.val, p->mask, p->index);

Do you need this?
If yes, perhaps dev_dbg(hba->dev, ...)?

> +
> +       WARN_ON(p->index >= MAX_INDEX);
> +
> +       switch (p->mode) {
> +       case MODE_RESTORE:
> +               ufshcd_writel(hba, save[p->index], p->reg);
> +               break;
> +       case MODE_SET:
> +               pr_debug("%s: %d %x %x\n", __func__, p->index, save[p->index],
> +                        p->u.set);

Likewise.

> +               save[p->index] |= p->u.set;
> +               break;
> +       case MODE_SAVE:
> +               save[p->index] = ufshcd_readl(hba, p->reg) & p->mask;
> +               pr_debug("%s: index = %d, save = %08x\n", __func__,
> +                        p->index, save[p->index]);

Likewise.

> +               break;
> +       case MODE_POLL:
> +               ret = readl_poll_timeout_atomic(hba->mmio_base + p->reg,
> +                                               val,
> +                                               (val & p->mask) == p->u.expected,
> +                                               10, 1000);
> +               if (ret)
> +                       pr_err("%s: poll failed %d (%08x, %08x, %08x)\n",
> +                              __func__, ret, val, p->mask, p->u.expected);
> +               break;
> +       case MODE_WAIT:
> +               if (p->u.delay_us > 1000)
> +                       mdelay(p->u.delay_us / 1000);

mdelay(DIV_ROUND_UP(p->u.delay_us, 1000));
(cfr. include/linux/delay.h:ndelay())


> +               else
> +                       udelay(p->u.delay_us);
> +               break;
> +       case MODE_WRITE:
> +               ufshcd_writel(hba, p->u.val, p->reg);
> +               break;
> +       default:
> +               break;
> +       }
> +}
> +
> +static void ufs_renesas_pre_init(struct ufs_hba *hba)
> +{
> +       const struct ufs_renesas_init_param *p = ufs_param;
> +       int i;

unsigned int i

> +
> +       for (i = 0; i < ARRAY_SIZE(ufs_param); i++)
> +               ufs_renesas_reg_control(hba, &p[i]);
> +}

> +static const struct of_device_id __maybe_unused ufs_renesas_of_match[] = {
> +       { .compatible = "renesas,r8a779f0-ufs" },

As pointed out by the kernel test robot, this lack a sentinel.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
