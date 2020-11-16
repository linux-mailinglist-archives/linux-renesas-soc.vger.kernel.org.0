Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD4F22B4B98
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Nov 2020 17:47:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731082AbgKPQrT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 Nov 2020 11:47:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729645AbgKPQrS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Nov 2020 11:47:18 -0500
Received: from mail-vk1-xa43.google.com (mail-vk1-xa43.google.com [IPv6:2607:f8b0:4864:20::a43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48FB2C0613D1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Nov 2020 08:47:17 -0800 (PST)
Received: by mail-vk1-xa43.google.com with SMTP id i3so3858355vkk.11
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Nov 2020 08:47:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sbTo3mgYFvbTARlRSygN/TcLDmrBnBcHt2mvwSR3LJM=;
        b=UJWylnb8emsSP1WSmTZSSbeG5/KKPMt2egqsp0BZySKO3eXLbbH3RO7yLV56nvU8nx
         9kdeqiBCXUQ9h2W9hckvcmhBWrflkDGddyvUGj6cLTv9xO60u1dE84RhtXhiLhxY+zn4
         4ngibTT9G8DerRUCdWgWEzgVzv0UdVSWZQC3dKFMPSurwSlOnBLVT9sJGC1DyyA9uxPc
         VbN8dg+GNgSoRCgqTNB86Wsk/KLOt5COjZByNDytbfaBn6/n/WkNyoUWyjItWW5HQKXU
         0hdc7ztrQ70W1VgSjNHP8kIZ101FTs3GFTjTpJOrzVAEMrAZff462SDth4YjgYJ6H5Qf
         qeiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sbTo3mgYFvbTARlRSygN/TcLDmrBnBcHt2mvwSR3LJM=;
        b=BSqRa9P3cnIbBIFEaBcR9+YXJv/Si8VMvLO9E1sjwClBUHPcr9h+8Lcq492/C3i3Xi
         wQdUdc3guCam+XIs/gLVyN3LWPyz8gD7tg6JN3TrKLc0xG3RdwNKJp5LrWsyoEEOg4cr
         m2Y9DBMbgnKXH7+MlPa8N5wVKR0xYpmZLmfo2TDFBklWdBNhGtCwEBI+O1gTzFC4D9aA
         ZlYJzxrU8MbKW0/Jzsw4R4QWpFFUSnPw3+AuwgJz89Q3753B2WZlywV3RlPVh4tOaEcM
         q6PxP90N+a+FoGk4SRLMZxsWs2ZNKUXrSnMBl7A8gfAe7N3ZbriULZZS0YewXTHVI1B+
         4oYg==
X-Gm-Message-State: AOAM533dLlmkr2ndAG6yPs2sN88OgZZ8vgumJ5xlQe8lBPBFEtkMD0Sa
        KW+K2iBEfLaq55QEV4m4+Ht6EgdzcMdft7NXOnguYlkVAbKpUoTe
X-Google-Smtp-Source: ABdhPJwJaOStr8lGyXOgumEjMrG+8xRLMioKH2Gnqw+c2QFTCt7O0QJ7WjvA2MPv+sj4Tr17eo4YIXzwgAcMbofKLFw=
X-Received: by 2002:a1f:41cc:: with SMTP id o195mr8085795vka.15.1605545236387;
 Mon, 16 Nov 2020 08:47:16 -0800 (PST)
MIME-Version: 1.0
References: <1605005330-7178-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1605005330-7178-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Mon, 16 Nov 2020 17:46:40 +0100
Message-ID: <CAPDyKFoGNfn_9Zc-Q_0q+vRNnE=4Y0WH-Nm=cEyJeo1NiaGUxg@mail.gmail.com>
Subject: Re: [PATCH v3] mmc: core: Issue power off notification in mmc_remove()
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, 10 Nov 2020 at 11:48, Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
>
> User is possible to turn the power off after a host was removed.
> So, call mmc_poweroff_notify(EXT_CSD_NO_POWER_NOTIFICATION)
> in mmc_remove(). Note that the mmc and host driver will be
> in the following modes when mmc_remove() is called:
>
>  1. mmc_card_suspended() == false &&
>     power_off_notification == EXT_CSD_POWER_ON
>  2. mmc_card_suspended() == true &&
>     power_off_notification == EXT_CSD_POWER_OFF_{SHORT,LONG}
>  3. mmc_card_suspended() == true && mmc_sleep() was called
>
> So, mmc_remove() calls _mmc_resume() anyway for the cases.
> Otherwise:
>
>  - _mmc_resume will be called via mmc_runtime_resume() and then
>    power_off_notification will be set to EXT_CSD_POWER_ON.
>  - timeout will happen in mmc_blk_part_switch() via mmc_blk_remove()
>    if "part_curr" of mmc block is not set to default.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  Changes from v2:
>  - Fix an issue which timeout happens if part_curr is not default.
>  https://patchwork.kernel.org/project/linux-renesas-soc/patch/1604311475-15307-1-git-send-email-yoshihiro.shimoda.uh@renesas.com/
>
>  Changes from v1:
>  - Reuse _mmc_suspend() instead of direct mmc_poweroff_notify() calling
>   to check suspended flag while removing.
>   https://patchwork.kernel.org/project/linux-renesas-soc/patch/1602581312-23607-1-git-send-email-yoshihiro.shimoda.uh@renesas.com/
>
>
>  drivers/mmc/core/mmc.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>
> diff --git a/drivers/mmc/core/mmc.c b/drivers/mmc/core/mmc.c
> index ff3063c..18413f2 100644
> --- a/drivers/mmc/core/mmc.c
> +++ b/drivers/mmc/core/mmc.c
> @@ -1983,11 +1983,35 @@ static int mmc_poweroff_notify(struct mmc_card *card, unsigned int notify_type)
>         return err;
>  }
>
> +static int _mmc_resume(struct mmc_host *host);
>  /*
>   * Host is being removed. Free up the current card.
>   */
>  static void mmc_remove(struct mmc_host *host)
>  {
> +       /*
> +        * The mmc and host driver will be in the following modes here:
> +        *  1. mmc_card_suspended() == false &&
> +        *     power_off_notification == EXT_CSD_POWER_ON
> +        *  2. mmc_card_suspended() == true &&
> +        *     power_off_notification == EXT_CSD_POWER_OFF_{SHORT,LONG}
> +        *  3. mmc_card_suspended() == true && mmc_sleep() was called
> +        *
> +        * So, call _mmc_resume() here anyway for the cases. Otherwise:
> +        *  - _mmc_resume will be called via mmc_runtime_resume() and then
> +        *    power_off_notification will be set to EXT_CSD_POWER_ON.
> +        *  - timeout will happen in mmc_blk_part_switch() via mmc_blk_remove()
> +        *    if "part_curr" of mmc block is not set to default.
> +        */
> +       _mmc_resume(host);
> +
> +       /* Disable power_off_notification byte in the ext_csd register */
> +       if (host->card->ext_csd.rev >= 6) {
> +               mmc_claim_host(host);
> +               mmc_poweroff_notify(host->card, EXT_CSD_NO_POWER_NOTIFICATION);
> +               mmc_release_host(host);
> +       }

Unfortunate, I think there is even more complexity involved here. I
don't think the above work for all cases.

Let me try to elaborate - there are two scenarios of when mmc_remove()
is called.

1)
When the card becomes removed, likely not the case for eMMC but it may
happen for a legacy MMC card, for example. In this case, there is not
much we can do to fix the problem, as the card is already "dead".

2)
The card is working properly (it may be suspended though) while
mmc_remove_host() gets called because the host driver is being
unbinded.

For 1)
We should only clean up and remove the card structs, which the current
code already does.

For 2)
We want to support a graceful power off sequence or the card (to
prevent data corruption for example). However, depending on the
platform and host, it may not be possible to power off both VCC and
VCCQ. For example, it's quite common that VCCQ remains powered on,
while only VCC can be power gated. Just disabling the power off
notification of the eMMC card (as you suggest above), doesn't really
help. In fact, it could mean that we may violate the eMMC spec when
power gating VCC through mmc_power_off().

I am thinking of a few possible solutions. Perhaps easier if I post a
patch that you try - unless you have ideas yourself of how to fix
this.

> +
>         mmc_remove_card(host->card);
>         host->card = NULL;
>  }
> --
> 2.7.4
>

Kind regards
Uffe
