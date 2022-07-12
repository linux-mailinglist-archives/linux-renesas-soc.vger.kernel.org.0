Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1621B571813
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Jul 2022 13:09:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232897AbiGLLJy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 12 Jul 2022 07:09:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232970AbiGLLJr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Jul 2022 07:09:47 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 613DAB0F90
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Jul 2022 04:09:44 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id bp17so5498109lfb.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Jul 2022 04:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rJNsmRBN9XMMewM4dixUdOuJWF6NQdfQJFUhCm2GmqE=;
        b=wwkMQvCzM7u1O0f6k81nmx0LgJi/2k2B5awHdNOzXwYk/WXPTRp1g7UsfWlSei1FCw
         DCMRI5CdRrIxuT6w4PF5PD3MxQNEsBJlPKszWXTzzBhxfMIhplg7c46yd7T+cKtG/L3d
         WuQD8l33q5uM4ka1hjFhF/DJLGT8HjiKfSi1Z7Po+87LFeUV3YabPSsOiKYPw1KOL/+o
         MGA5F+OJc+i1ODAJmH5oV3SECYd1Nd8pfvWsfC9eiqJl+fXVUYRGowxW6K1Ot8ifmmaM
         8lZb6ZnrQzy97V09cscWiO0R/yjP6XiW0hYV6MI1lgYgkBrrtxTE3ILPYaLln6xpW9LF
         1leA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rJNsmRBN9XMMewM4dixUdOuJWF6NQdfQJFUhCm2GmqE=;
        b=dsKEajDSTGDCaRAOcTy8asFUXS/iFmK8dNO/yKRxYKKoFbQwzdeaMWnn1hc2tKDvHN
         P0bm1V7o9N9Yd89Up2xXOd8ShrzOJLQzmlXk6NND9i8xO86MtoXY10fdfQkX1aY8DC47
         B0qmvgrvckdURtxaUvE+Yapnh6q01E8vR3ByL9TCkFCDNLQUAr7vvOS0GMpvoXG0tQkF
         8f38EwaQmAEzH9X+0Zo5FIWOokyUdUSbV2dC860QKPe9Pqzryu+yz5fYn3l4eipBbIN1
         8Xj8QmT1JD3BC9q2nXCwJY68MbBUZ9snFXhX9FQQwnfI4JhWOxwBemoKn0jy2OA/mYnI
         dxmw==
X-Gm-Message-State: AJIora/VHrD5vyPlCKE7Zy4Ipr0vLROPVYf5AZkoLWpjht3Wg3uts7no
        /aw50s2LgeKs+zGGpaEDHRp9zZPXDJtCcuD73FkMyg==
X-Google-Smtp-Source: AGRyM1v/2PBFYkOmy1mrkLPKQE9pT2l7myodsl7AjlP6VNKchqTLPrWqKf6+rysiJ2ZcctYS0zOKOq7bn5YHjyhYi78=
X-Received: by 2002:a05:6512:2522:b0:489:daa9:467 with SMTP id
 be34-20020a056512252200b00489daa90467mr7514869lfb.71.1657624182307; Tue, 12
 Jul 2022 04:09:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220625131722.1397-1-wsa@kernel.org>
In-Reply-To: <20220625131722.1397-1-wsa@kernel.org>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 12 Jul 2022 13:09:02 +0200
Message-ID: <CAPDyKFphYtMhFHu0c+WF9hsm7Y9KgjCqKqSZ_uDTY3ddCYZ-7w@mail.gmail.com>
Subject: Re: [PATCH] mmc: tmio: avoid glitches when resetting
To:     Wolfram Sang <wsa@kernel.org>
Cc:     linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sat, 25 Jun 2022 at 15:17, Wolfram Sang <wsa@kernel.org> wrote:
>
> From: Wolfram Sang <wsa+renesas@sang-engineering.com>
>
> If we reset because of an error, we need to preserve values for the
> clock frequency. Otherwise, glitches may be seen on the bus.
>
> To achieve that, we introduce a 'preserve' parameter to the reset
> function and the IP core specific reset callbacks to handle everything
> accordingly.
>
> Reported-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Tested-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/renesas_sdhi_core.c | 29 ++++++++++++++--------------
>  drivers/mmc/host/tmio_mmc.c          |  2 +-
>  drivers/mmc/host/tmio_mmc.h          |  6 +++++-
>  drivers/mmc/host/tmio_mmc_core.c     | 28 +++++++++++++++++++++------
>  4 files changed, 42 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
> index 4404ca1f98d8..5fa365d0c7fd 100644
> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -49,9 +49,6 @@
>  #define HOST_MODE_GEN3_32BIT   (HOST_MODE_GEN3_WMODE | HOST_MODE_GEN3_BUSWIDTH)
>  #define HOST_MODE_GEN3_64BIT   0
>
> -#define CTL_SDIF_MODE  0xe6
> -#define SDIF_MODE_HS400                BIT(0)
> -
>  #define SDHI_VER_GEN2_SDR50    0x490c
>  #define SDHI_VER_RZ_A1         0x820b
>  /* very old datasheets said 0x490c for SDR104, too. They are wrong! */
> @@ -562,23 +559,25 @@ static void renesas_sdhi_scc_reset(struct tmio_mmc_host *host, struct renesas_sd
>  }
>
>  /* only populated for TMIO_MMC_MIN_RCAR2 */
> -static void renesas_sdhi_reset(struct tmio_mmc_host *host)
> +static void renesas_sdhi_reset(struct tmio_mmc_host *host, bool preserve)
>  {
>         struct renesas_sdhi *priv = host_to_priv(host);
>         int ret;
>         u16 val;
>
> -       if (priv->rstc) {
> -               reset_control_reset(priv->rstc);
> -               /* Unknown why but without polling reset status, it will hang */
> -               read_poll_timeout(reset_control_status, ret, ret == 0, 1, 100,
> -                                 false, priv->rstc);
> -               /* At least SDHI_VER_GEN2_SDR50 needs manual release of reset */
> -               sd_ctrl_write16(host, CTL_RESET_SD, 0x0001);
> -               priv->needs_adjust_hs400 = false;
> -               renesas_sdhi_set_clock(host, host->clk_cache);
> -       } else if (priv->scc_ctl) {
> -               renesas_sdhi_scc_reset(host, priv);
> +       if (!preserve) {
> +               if (priv->rstc) {
> +                       reset_control_reset(priv->rstc);
> +                       /* Unknown why but without polling reset status, it will hang */
> +                       read_poll_timeout(reset_control_status, ret, ret == 0, 1, 100,
> +                                         false, priv->rstc);
> +                       /* At least SDHI_VER_GEN2_SDR50 needs manual release of reset */
> +                       sd_ctrl_write16(host, CTL_RESET_SD, 0x0001);
> +                       priv->needs_adjust_hs400 = false;
> +                       renesas_sdhi_set_clock(host, host->clk_cache);
> +               } else if (priv->scc_ctl) {
> +                       renesas_sdhi_scc_reset(host, priv);
> +               }
>         }
>
>         if (sd_ctrl_read16(host, CTL_VERSION) >= SDHI_VER_GEN3_SD) {
> diff --git a/drivers/mmc/host/tmio_mmc.c b/drivers/mmc/host/tmio_mmc.c
> index b55a29c53d9c..53a2ad9a24b8 100644
> --- a/drivers/mmc/host/tmio_mmc.c
> +++ b/drivers/mmc/host/tmio_mmc.c
> @@ -75,7 +75,7 @@ static void tmio_mmc_set_clock(struct tmio_mmc_host *host,
>         tmio_mmc_clk_start(host);
>  }
>
> -static void tmio_mmc_reset(struct tmio_mmc_host *host)
> +static void tmio_mmc_reset(struct tmio_mmc_host *host, bool preserve)
>  {
>         sd_ctrl_write16(host, CTL_RESET_SDIO, 0x0000);
>         usleep_range(10000, 11000);
> diff --git a/drivers/mmc/host/tmio_mmc.h b/drivers/mmc/host/tmio_mmc.h
> index e754bb3f5c32..501613c74406 100644
> --- a/drivers/mmc/host/tmio_mmc.h
> +++ b/drivers/mmc/host/tmio_mmc.h
> @@ -42,6 +42,7 @@
>  #define CTL_DMA_ENABLE 0xd8
>  #define CTL_RESET_SD 0xe0
>  #define CTL_VERSION 0xe2
> +#define CTL_SDIF_MODE 0xe6 /* only known on R-Car 2+ */
>
>  /* Definitions for values the CTL_STOP_INTERNAL_ACTION register can take */
>  #define TMIO_STOP_STP          BIT(0)
> @@ -98,6 +99,9 @@
>  /* Definitions for values the CTL_DMA_ENABLE register can take */
>  #define DMA_ENABLE_DMASDRW     BIT(1)
>
> +/* Definitions for values the CTL_SDIF_MODE register can take */
> +#define SDIF_MODE_HS400                BIT(0) /* only known on R-Car 2+ */
> +
>  /* Define some IRQ masks */
>  /* This is the mask used at reset by the chip */
>  #define TMIO_MASK_ALL           0x837f031d
> @@ -181,7 +185,7 @@ struct tmio_mmc_host {
>         int (*multi_io_quirk)(struct mmc_card *card,
>                               unsigned int direction, int blk_size);
>         int (*write16_hook)(struct tmio_mmc_host *host, int addr);
> -       void (*reset)(struct tmio_mmc_host *host);
> +       void (*reset)(struct tmio_mmc_host *host, bool preserve);
>         bool (*check_retune)(struct tmio_mmc_host *host, struct mmc_request *mrq);
>         void (*fixup_request)(struct tmio_mmc_host *host, struct mmc_request *mrq);
>         unsigned int (*get_timeout_cycles)(struct tmio_mmc_host *host);
> diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
> index a5850d83908b..437048bb8027 100644
> --- a/drivers/mmc/host/tmio_mmc_core.c
> +++ b/drivers/mmc/host/tmio_mmc_core.c
> @@ -179,8 +179,17 @@ static void tmio_mmc_set_bus_width(struct tmio_mmc_host *host,
>         sd_ctrl_write16(host, CTL_SD_MEM_CARD_OPT, reg);
>  }
>
> -static void tmio_mmc_reset(struct tmio_mmc_host *host)
> +static void tmio_mmc_reset(struct tmio_mmc_host *host, bool preserve)
>  {
> +       u16 card_opt, clk_ctrl, sdif_mode;
> +
> +       if (preserve) {
> +               card_opt = sd_ctrl_read16(host, CTL_SD_MEM_CARD_OPT);
> +               clk_ctrl = sd_ctrl_read16(host, CTL_SD_CARD_CLK_CTL);
> +               if (host->pdata->flags & TMIO_MMC_MIN_RCAR2)
> +                       sdif_mode = sd_ctrl_read16(host, CTL_SDIF_MODE);
> +       }
> +
>         /* FIXME - should we set stop clock reg here */
>         sd_ctrl_write16(host, CTL_RESET_SD, 0x0000);
>         usleep_range(10000, 11000);
> @@ -190,7 +199,7 @@ static void tmio_mmc_reset(struct tmio_mmc_host *host)
>         tmio_mmc_abort_dma(host);
>
>         if (host->reset)
> -               host->reset(host);
> +               host->reset(host, preserve);
>
>         sd_ctrl_write32_as_16_and_16(host, CTL_IRQ_MASK, host->sdcard_irq_mask_all);
>         host->sdcard_irq_mask = host->sdcard_irq_mask_all;
> @@ -206,6 +215,13 @@ static void tmio_mmc_reset(struct tmio_mmc_host *host)
>                 sd_ctrl_write16(host, CTL_TRANSACTION_CTL, 0x0001);
>         }
>
> +       if (preserve) {
> +               sd_ctrl_write16(host, CTL_SD_MEM_CARD_OPT, card_opt);
> +               sd_ctrl_write16(host, CTL_SD_CARD_CLK_CTL, clk_ctrl);
> +               if (host->pdata->flags & TMIO_MMC_MIN_RCAR2)
> +                       sd_ctrl_write16(host, CTL_SDIF_MODE, sdif_mode);
> +       }
> +
>         if (host->mmc->card)
>                 mmc_retune_needed(host->mmc);
>  }
> @@ -248,7 +264,7 @@ static void tmio_mmc_reset_work(struct work_struct *work)
>
>         spin_unlock_irqrestore(&host->lock, flags);
>
> -       tmio_mmc_reset(host);
> +       tmio_mmc_reset(host, true);
>
>         /* Ready for new calls */
>         host->mrq = NULL;
> @@ -961,7 +977,7 @@ static void tmio_mmc_set_ios(struct mmc_host *mmc, struct mmc_ios *ios)
>                 tmio_mmc_power_off(host);
>                 /* For R-Car Gen2+, we need to reset SDHI specific SCC */
>                 if (host->pdata->flags & TMIO_MMC_MIN_RCAR2)
> -                       tmio_mmc_reset(host);
> +                       tmio_mmc_reset(host, false);
>
>                 host->set_clock(host, 0);
>                 break;
> @@ -1189,7 +1205,7 @@ int tmio_mmc_host_probe(struct tmio_mmc_host *_host)
>                 _host->sdcard_irq_mask_all = TMIO_MASK_ALL;
>
>         _host->set_clock(_host, 0);
> -       tmio_mmc_reset(_host);
> +       tmio_mmc_reset(_host, false);
>
>         spin_lock_init(&_host->lock);
>         mutex_init(&_host->ios_lock);
> @@ -1285,7 +1301,7 @@ int tmio_mmc_host_runtime_resume(struct device *dev)
>         struct tmio_mmc_host *host = dev_get_drvdata(dev);
>
>         tmio_mmc_clk_enable(host);
> -       tmio_mmc_reset(host);
> +       tmio_mmc_reset(host, false);
>
>         if (host->clk_cache)
>                 host->set_clock(host, host->clk_cache);
> --
> 2.35.1
>
