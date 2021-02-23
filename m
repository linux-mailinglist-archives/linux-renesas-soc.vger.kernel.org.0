Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB99032288F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Feb 2021 11:09:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232125AbhBWKHg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 23 Feb 2021 05:07:36 -0500
Received: from mail-ot1-f47.google.com ([209.85.210.47]:38818 "EHLO
        mail-ot1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231653AbhBWKHb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 23 Feb 2021 05:07:31 -0500
Received: by mail-ot1-f47.google.com with SMTP id s3so11806975otg.5;
        Tue, 23 Feb 2021 02:07:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qS91opuzKuj6UsKq1hsmw5SOC2S+9ux49qSaIDpiTMI=;
        b=Gd7TRRQtQoJ2XzxnIVsXEB/N+kJqwCjxUJgXrE5/BPpoz0633ys4U+ol1EnL6p/Jrn
         uFD2yCh529Zi5Yjmd82XxQsa7m/rn0Ceta81jcs30QzqhJ5xDY5Xa6cG6Xsw7u25Ih+H
         zkiQRdPt6akQux9qedkuJBAFTycDJfecJXaD1JG3LRZ55s3nuWf/JZm51psFizGlExRe
         eAaZyRIS6G7HepPvIxHioLPgArDcBzFC8FYz+ECEoGB/o1q04X/KD8zITJZWDNFNsETP
         zKGTllydbaQvB65ZZNiNb+livfWUlOhPd/eRzo8+7b2tmE/c99xFKUf8m6Bytbbqh/7C
         cVLg==
X-Gm-Message-State: AOAM530NorxbYPEYvwsixbqiGcY98HK0KHGT7MMnVq7qQbxeYMKys4fH
        3am/v++2kHCBjGg1Ukk61EF4wQTAUX+uC05DQR7DoT/0Y+I=
X-Google-Smtp-Source: ABdhPJxl4hts8ZrGqFxgamuICFlj+A5QLe6yTwfz6wTl6XQ6+d3Un6bm7LFOHopxClf+6O5h4f8rDnG6eA3qElDO6/g=
X-Received: by 2002:a9d:77d6:: with SMTP id w22mr20204993otl.145.1614074810420;
 Tue, 23 Feb 2021 02:06:50 -0800 (PST)
MIME-Version: 1.0
References: <20210222113955.7779-1-wsa+renesas@sang-engineering.com> <20210222113955.7779-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20210222113955.7779-3-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 23 Feb 2021 11:06:39 +0100
Message-ID: <CAMuHMdVFuof3C7JPw9BLUM0vBaiD+ZpUX2nSf8hiAZ4qw9doSQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 2/2] mmc: renesas_sdhi: do hard reset if possible
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On Mon, Feb 22, 2021 at 12:41 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Some SDHI instances can be reset via the reset controller. If one is
> found, use it instead of the custom reset.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c

> @@ -561,9 +563,16 @@ static int renesas_sdhi_prepare_hs400_tuning(struct mmc_host *mmc, struct mmc_io
>  static void renesas_sdhi_reset(struct tmio_mmc_host *host)
>  {
>         struct renesas_sdhi *priv = host_to_priv(host);
> +       int ret;
>         u16 val;
>
> -       if (priv->scc_ctl) {
> +       if (!IS_ERR(priv->rstc)) {

"if (priv->rstc)" if the reset is made optional.

> +               reset_control_reset(priv->rstc);
> +               /* Unknown why but without polling reset status, it will hang */
> +               read_poll_timeout(reset_control_status, ret, ret == 0, 1, 100,
> +                                 false, priv->rstc);
> +               priv->needs_adjust_hs400 = false;
> +       } else if (priv->scc_ctl) {
>                 renesas_sdhi_disable_scc(host->mmc);
>                 renesas_sdhi_reset_hs400_mode(host, priv);
>                 priv->needs_adjust_hs400 = false;
> @@ -1076,6 +1085,8 @@ int renesas_sdhi_probe(struct platform_device *pdev,
>         if (ret)
>                 goto efree;
>
> +       priv->rstc = devm_reset_control_get_exclusive(&pdev->dev, NULL);

devm_reset_control_get_optional_exclusive()?
+ missing error handling (real errors and -EPROBE_DEFER).

Perhaps you want to add a "select RESET_CONTROLLER" to "config
MMC_SDHI"?

> +
>         ver = sd_ctrl_read16(host, CTL_VERSION);
>         /* GEN2_SDR104 is first known SDHI to use 32bit block count */
>         if (ver < SDHI_VER_GEN2_SDR104 && mmc_data->max_blk_count > U16_MAX)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
