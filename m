Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 668132159E4
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Jul 2020 16:49:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729393AbgGFOt1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 Jul 2020 10:49:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729395AbgGFOt1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Jul 2020 10:49:27 -0400
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com [IPv6:2607:f8b0:4864:20::e44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B39BC061794
        for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Jul 2020 07:49:27 -0700 (PDT)
Received: by mail-vs1-xe44.google.com with SMTP id q15so9982747vso.9
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Jul 2020 07:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fEE00lTxrbosdgIqIaqvUZI5lzQxeJC3uSrMdVGgH3c=;
        b=uwd9QsHx+hRawr7wbADUBvTDIvaEER2HMGv6b9WUptMf6iXVzo22U95mZQtdhq3SEL
         PZmHdPbMf7eS9ZMgkgnel/6Imc/Ty9Qs48CLmE0rC/41Mb4Pu7+HInvid1G1P3YDsRet
         aepYkrU0R3o/H37avjYFQbgmjoujgtJxz9i10YAZkpPgTc6X8rsSMLcUOKKYehrIdyvT
         Ql+vvIpoYrQp3gbZ1pkMnPWp9Cd/4Dmtm/YaiibIE5G/3u8OzwHFiYBXBc6DdaZzlQNB
         jLr9OBV4IwdSIa3qYdI4kaRU3MzHTO+fquVaa2kHBJMoEyuNpi88rcHNs/kgxGeXZDUv
         qHwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fEE00lTxrbosdgIqIaqvUZI5lzQxeJC3uSrMdVGgH3c=;
        b=fQdmjdzxI2ttpFFp4nOH5ZdSe4JJrTs3uQuLTGhy9A0EgqeUzcPWi7M/Y/eSaKyxAi
         /7K/1F2tx2MXkgh55WQreTlOT46/IULlOi3f92dQoWMrBN7QaCbBfs31iKb3hccBGVWf
         i6gX8XaAk1dP3g7jRCg3VuobkTKJ/hzBjRNtXFftiCnxnGjtcUDnHxFpHNW1+DeDBjDQ
         XfKZZ0/YSt4NUmTzjA83FrH3pzdwZPOxiVLtJE8vGh5UDqGLqIUFvY5LsohpS1nF2a4P
         CMBo8MqiVuG0uH2p60qvpaTkLXS2J10JB8hwQgpIm6HR8xQtnpum8KzLc5UjaATltVG9
         0uJA==
X-Gm-Message-State: AOAM533LJPwVZXKyFnA/gjXKicjEq1fm37cQwFHugnR0yo8RnXi5F71r
        lyZXBkBCPat3ijEnU5sfyIYHoyX5DRvSOMHgUXNp3A==
X-Google-Smtp-Source: ABdhPJxuUfHrM/YTSR1hVzXVVwk3ONsflJzRm5iISRLnO8jS/qXJkwuvAeWFCAS2pvPF43fihBlAw8aCgbv3ZZvugNs=
X-Received: by 2002:a05:6102:126a:: with SMTP id q10mr18464626vsg.35.1594046966597;
 Mon, 06 Jul 2020 07:49:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200618080321.16678-1-geert+renesas@glider.be>
In-Reply-To: <20200618080321.16678-1-geert+renesas@glider.be>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Mon, 6 Jul 2020 16:48:48 +0200
Message-ID: <CAPDyKFq2BV72hqqW0P0d+=+8Hy4oONhYc2gAf7U9nCvUfYxedA@mail.gmail.com>
Subject: Re: [PATCH] mmc: sh_mmcif: Use "kHz" for kilohertz
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, 18 Jun 2020 at 10:03, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> "K" stands for "kelvin".
>
> While at it, make the spacing before units consistent.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/sh_mmcif.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/mmc/host/sh_mmcif.c b/drivers/mmc/host/sh_mmcif.c
> index 7e1fd557109c0476..9f53634aa41184c8 100644
> --- a/drivers/mmc/host/sh_mmcif.c
> +++ b/drivers/mmc/host/sh_mmcif.c
> @@ -191,9 +191,9 @@
>                                  STS2_AC12BSYTO | STS2_RSPBSYTO |       \
>                                  STS2_AC12RSPTO | STS2_RSPTO)
>
> -#define CLKDEV_EMMC_DATA       52000000 /* 52MHz */
> -#define CLKDEV_MMC_DATA                20000000 /* 20MHz */
> -#define CLKDEV_INIT            400000   /* 400 KHz */
> +#define CLKDEV_EMMC_DATA       52000000 /* 52 MHz */
> +#define CLKDEV_MMC_DATA                20000000 /* 20 MHz */
> +#define CLKDEV_INIT            400000   /* 400 kHz */
>
>  enum sh_mmcif_state {
>         STATE_IDLE,
> --
> 2.17.1
>
