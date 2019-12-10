Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E07F11894B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2019 14:10:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727480AbfLJNKZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 10 Dec 2019 08:10:25 -0500
Received: from mail-vs1-f65.google.com ([209.85.217.65]:38755 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727535AbfLJNKY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Dec 2019 08:10:24 -0500
Received: by mail-vs1-f65.google.com with SMTP id y195so12967049vsy.5
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Dec 2019 05:10:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NSgXLY7zn19iKGK0lMSKicsXOogf2N1V6mwuOTacvso=;
        b=vFmxC2HFI6hes3oDbNBxlB7e0dsTQISm/o7uGplKJlNntWAXykRoxseuGeOWfL8Nrc
         oG/p72shYHiyVdWlxhO6k5FJoVVYtEOnQ/oOwC1IZJYxMaWvcP9KLStM+w8/cndN9zGi
         tLT7zg6pSYI3ur0g9WtUFtQtQU4uP4H/wZKJxmCd2NXJOgwuAC2T9xrpNdmIN4Z8gdGj
         XKfjT2CUSFAeSc1gdurBT2wT8zd69Q5XzAmAnFSayl3eHVccd5j3BxNiM84OJ6xYV4D/
         n7vm3UR105hvKvKJnwuyoHOxI80UpeLwS00vidyxYxpm4iIf8BL0L0qHrd8F262G0OUI
         YzCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NSgXLY7zn19iKGK0lMSKicsXOogf2N1V6mwuOTacvso=;
        b=kDIY6uOd6Jb3RhYpXn7gNXMlw1bXyEXAQPrhrC0jpHGuf2qW8ECZwFLjzhMyGx1j8S
         5mIvTMUGT3tExauwOHUmdYAsHK6lLeFEwzTGoxpYHBQiydwGDHlePoTyKtPQ6CGIKXid
         iEl9H10YDOd34JCV5WiXje8rZq5N3vML9WVqVT+Zp8h1ZkqGMI4vt8OtJkKByJyp+R85
         aggEwNJjnO6+bdieff12RnNnVtncgORZYmaX+QJq2WA+O8iJm20NB+HKP7KSvU/BTavp
         SadGed8G7SEQ9RiShYmADX0ZWN/QmLlCK45vkeNwbqnQAvJ1uOcEuOZYlj71Pyfixs7g
         wojQ==
X-Gm-Message-State: APjAAAUI3WEZyo9wrqYgTt5zRlR436bRl5na/Mfa+obir2ZbFe1udDjm
        KVZbjS5m8lgBly77sGszDnGSjPM3jFn/xFjnU+4LLtu2
X-Google-Smtp-Source: APXvYqxJRyVUMS3rG+TK07GWx93zHpQLUw1qnfmkvDmlYwKOM2YcUVvarh+8ZagtE16HG1PSCyMugCWFPdBpVnbG1W8=
X-Received: by 2002:a05:6102:5d1:: with SMTP id v17mr24811015vsf.200.1575983423704;
 Tue, 10 Dec 2019 05:10:23 -0800 (PST)
MIME-Version: 1.0
References: <20191203194859.917-1-wsa@the-dreams.de>
In-Reply-To: <20191203194859.917-1-wsa@the-dreams.de>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 10 Dec 2019 14:09:47 +0100
Message-ID: <CAPDyKFrngFAOUF0QN7+yjAyo3XxS9asT0Q5350i8K9h2TBavwQ@mail.gmail.com>
Subject: Re: [PATCH] mmc: renesas_sdhi: remove whitelist for internal DMAC
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, 3 Dec 2019 at 20:49, Wolfram Sang <wsa@the-dreams.de> wrote:
>
> From: Wolfram Sang <wsa+renesas@sang-engineering.com>
>
> We know now that there won't be Gen3 SoCs with both, SYS-DMAC and
> internal DMAC. We removed the blacklisting for SYS-DMAC already, so we
> can remove the whitelisting for internal DMAC, too. This makes adding
> new SoCs easier. We keep the quirk handling, of course.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/renesas_sdhi_internal_dmac.c | 23 ++++---------------
>  1 file changed, 4 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> index 68fb39a74b8b..47ac53e91241 100644
> --- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> +++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> @@ -298,38 +298,23 @@ static const struct tmio_mmc_dma_ops renesas_sdhi_internal_dmac_dma_ops = {
>   * Whitelist of specific R-Car Gen3 SoC ES versions to use this DMAC
>   * implementation as others may use a different implementation.
>   */
> -static const struct soc_device_attribute soc_whitelist[] = {
> -       /* specific ones */
> +static const struct soc_device_attribute soc_dma_quirks[] = {
>         { .soc_id = "r7s9210",
>           .data = (void *)BIT(SDHI_INTERNAL_DMAC_ADDR_MODE_FIXED_ONLY) },
>         { .soc_id = "r8a7795", .revision = "ES1.*",
>           .data = (void *)BIT(SDHI_INTERNAL_DMAC_ONE_RX_ONLY) },
>         { .soc_id = "r8a7796", .revision = "ES1.0",
>           .data = (void *)BIT(SDHI_INTERNAL_DMAC_ONE_RX_ONLY) },
> -       /* generic ones */
> -       { .soc_id = "r8a774a1" },
> -       { .soc_id = "r8a774b1" },
> -       { .soc_id = "r8a774c0" },
> -       { .soc_id = "r8a77470" },
> -       { .soc_id = "r8a7795" },
> -       { .soc_id = "r8a7796" },
> -       { .soc_id = "r8a77965" },
> -       { .soc_id = "r8a77970" },
> -       { .soc_id = "r8a77980" },
> -       { .soc_id = "r8a77990" },
> -       { .soc_id = "r8a77995" },
>         { /* sentinel */ }
>  };
>
>  static int renesas_sdhi_internal_dmac_probe(struct platform_device *pdev)
>  {
> -       const struct soc_device_attribute *soc = soc_device_match(soc_whitelist);
> +       const struct soc_device_attribute *soc = soc_device_match(soc_dma_quirks);
>         struct device *dev = &pdev->dev;
>
> -       if (!soc)
> -               return -ENODEV;
> -
> -       global_flags |= (unsigned long)soc->data;
> +       if (soc)
> +               global_flags |= (unsigned long)soc->data;
>
>         dev->dma_parms = devm_kzalloc(dev, sizeof(*dev->dma_parms), GFP_KERNEL);
>         if (!dev->dma_parms)
> --
> 2.20.1
>
