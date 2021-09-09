Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE14C404764
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Sep 2021 10:54:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232139AbhIIIzr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 Sep 2021 04:55:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231281AbhIIIzr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Sep 2021 04:55:47 -0400
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6B2BC061757
        for <linux-renesas-soc@vger.kernel.org>; Thu,  9 Sep 2021 01:54:37 -0700 (PDT)
Received: by mail-ot1-x32f.google.com with SMTP id m7-20020a9d4c87000000b0051875f56b95so1583661otf.6
        for <linux-renesas-soc@vger.kernel.org>; Thu, 09 Sep 2021 01:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nUwxPK2qnu6YfMpPqLgyWf8PKUvt9ipGKjT6xs3uR2U=;
        b=S3x8mkSe0GgTbDfxfxP0HaYii2BexzY72c8nSwNgE+CgK8uQ8haJWuL212g8B7Tf7p
         HiiDZRW0Rf29a3+MIgSjFWFu/GYxDHYVmHnW/Stx/cbnYej8wMbiUo8wO/pUaGcTIJYR
         2bCxft7WlwUg8778/PwAHIPW7PdVGiWhGzhc5gluLIQDT97nTZ2se/NgLcO+H83TIOgZ
         fY+iuBE7fcnGLYjT+zo7PSahRd0tprNUG+JmbnON86vk5XkQZBKy8Qxva9xrx6XfMviA
         etHYgjwOBAgUWoH2NNyJOjqBoM3YsqtmcKbXgmvQx2JNIlWkS/JJ0EPMUwUMpP/wg2a/
         ldkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nUwxPK2qnu6YfMpPqLgyWf8PKUvt9ipGKjT6xs3uR2U=;
        b=2Gt5aUNouMaVUiuTDITt4G4BsYrnmYOo76cf44fXX1bh68Vnb+zBSRJbBu0Z/uAkYC
         O6HJZVqlKHZkqhpLrbXgH+K5UXMgCQPpuiUFvqwaiBEaAsJiyQJsJ341xeSQLoR8twxm
         o8qDY6lFgwzj8U0kD8+tdjjj482ccKcyvVpePJtORzR1n30slSbwGCAfE1FlwsFE3zC0
         a/yZYaGy0u7etBMry05FuXSl+gpHPx02OEUhTPnL4J06BNODTt07DrfRDqWFmkycbca2
         mkZTK85XrjjARszv9CiC/+ZkcRfkyOlyVE/1FzoOPyk1aDB8+J0kTEY/CM5iDLw62oHd
         muSw==
X-Gm-Message-State: AOAM530CIV9CTvPnS1oA7tq2xFA94fPlgAwbw8i2bAJBvFpKBA6UsgQj
        yffl+R0OU71sXltW0YgHq2Rdy7d2l5mgWOCam7HRvA==
X-Google-Smtp-Source: ABdhPJy42YR/0tp9VhUslFmgSrIGKuKfDSEyPCb+BFSIwUmZSTBWxpIHxsdk8F1KXqlbkHkBdibH2a+Rng6rpxHR1g4=
X-Received: by 2002:a9d:4e97:: with SMTP id v23mr1504061otk.236.1631177676988;
 Thu, 09 Sep 2021 01:54:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210831133349.18203-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20210831133349.18203-1-wsa+renesas@sang-engineering.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Thu, 9 Sep 2021 10:54:00 +0200
Message-ID: <CAPDyKFptgZgDsKyHt-sO6yyRBm+LqeWkwOSoB9ED+b3QTPqD-w@mail.gmail.com>
Subject: Re: [PATCH RFC] HACK: mmc: core: also abort tuning with CMD12 for SD
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-mmc <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, 31 Aug 2021 at 15:34, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> We have various SanDisk cards which fail tuning to SDR104 unless we
> allow a CMD12 also to be sent to abort a broken tuning. It is true that
> the SD specs do not mention that CMD12 is allowed, but they also don't
> say it is forbidden. And now reality tells that it is needed to make
> some cards work. Other cards I tried did not regress.
>
> If we can agree to allow this for SD, then the problem is now SDIO which
> does not support CMD12. mmc_card_sdio() does not work at this stage
> because host->card is still NULL. Is there any other way to distinguish
> SD and SDIO here?
>
> Not-Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>
> Hey guys,
>
> so, there are two questions here:
> 1) despite not being mentioned in the spec, do we want to allow CMD12 to
>    abort tuning for SD as well?

It sounds like we should give it a try with the CMD12 command for SD
cards as well.

>
> 2) If so, how to make sure not apply it to SDIO but SD only?

For now, I am fine with adding a new bus_ops callback
(->abort_tuning()) and then let mmc_send_abort_tuning() to call it.

I have some additional plans to improve life cycle issues for the
bus_ops, but let's ignore that for now. I can deal with that later.

That said, mmc_send_abort_tuning() should no longer need to take the
opcode as an in-parameter, thus some additional cleanup should be
needed in a few host drivers because of that.

Would that work?

>
> Thanks for your input! Kind regards,
>
>    Wolfram

Kind regards
Uffe

>
>
>  drivers/mmc/core/mmc_ops.c | 8 --------
>  1 file changed, 8 deletions(-)
>
> diff --git a/drivers/mmc/core/mmc_ops.c b/drivers/mmc/core/mmc_ops.c
> index 973756ed4016..02d378255895 100644
> --- a/drivers/mmc/core/mmc_ops.c
> +++ b/drivers/mmc/core/mmc_ops.c
> @@ -704,14 +704,6 @@ int mmc_send_abort_tuning(struct mmc_host *host, u32 opcode)
>  {
>         struct mmc_command cmd = {};
>
> -       /*
> -        * eMMC specification specifies that CMD12 can be used to stop a tuning
> -        * command, but SD specification does not, so do nothing unless it is
> -        * eMMC.
> -        */
> -       if (opcode != MMC_SEND_TUNING_BLOCK_HS200)
> -               return 0;
> -
>         cmd.opcode = MMC_STOP_TRANSMISSION;
>         cmd.flags = MMC_RSP_SPI_R1 | MMC_RSP_R1 | MMC_CMD_AC;
>
> --
> 2.30.2
>
