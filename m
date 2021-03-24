Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1DF53475D7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Mar 2021 11:22:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230452AbhCXKVu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 24 Mar 2021 06:21:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232804AbhCXKVS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Mar 2021 06:21:18 -0400
Received: from mail-vs1-xe36.google.com (mail-vs1-xe36.google.com [IPv6:2607:f8b0:4864:20::e36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 535A0C061763
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Mar 2021 03:21:18 -0700 (PDT)
Received: by mail-vs1-xe36.google.com with SMTP id e5so11048629vse.4
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Mar 2021 03:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Rai9ptA+xC3/Xny8ivCblg6SnvuofFN/hfASAUVEIaY=;
        b=rarJ86KGS7v2+Yw3UgGnGrsYvjfihF4O+nb0O7Vgrh3C5fvOyNJ5LgMGSwTpXmyb66
         umOw25twZS8UP8tB/lZwc+fNTtZ0N0SDightizjnoEQy6a/H1e3J9WtyRNQvXqQelBtN
         OCp/fGEDxTuy9ZHDY3rTNsCLwxzstezONxnef0UDo18LbZt8XwoaPtCFywUTk5eOFBx/
         n8Q8oHBfiAv6FnzUP2wNklX/kewvcpsfEDhtzr5vwpQJIGkqmntxjeGUQCsM0emLr5Sc
         Y2CaOHBguTco4R7SMw72k3euQ2cr1DBvdmdbE/So4hdNNd3SGThn7fZflUVrL060/99m
         I0oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Rai9ptA+xC3/Xny8ivCblg6SnvuofFN/hfASAUVEIaY=;
        b=FMSb3YkFFEGUC9PS1Q5TwYkwhmtl5xf4bE64LFkIgQvsoVNk6C8kZitqmpbvZ72QWr
         qddIb8hude3Zn6iM2GilwCXg/DdrF1IMYBYVin8+ec8/RRdcFdINUyCosLB6dLaZQZ8A
         CX6ZtGlgwBhYziAwxVSKOhNHozLZIDlNJ7MJiuYfI/1oOLTyrKCxmPeRlGtsjNPsf5sV
         +z7y9cRNQ/xVjwsOj+C4IbADJ+tggP37DLd/OB9JxbZlO6uGfCawryZRFqnFS83vQqn+
         zGZNHRY01wljnT/QdwGHUfxfHE0W0utqa9mrPcUjp/4K1BENsaAdyktoTP2NbT0JAdkp
         0P/Q==
X-Gm-Message-State: AOAM531JaVaQO0bBhlrPSm/+cL39iEbD/itCDaHVZcuKmi8OeihDHgMA
        DghzWCEbj7f9fIpwTTDlCcou2MrNIPdipEsSuzlrkw==
X-Google-Smtp-Source: ABdhPJyeFiT+4f3vNk0w+3cOIxyfVF5oBZdNxtqnXYYRA1Gm7IkUZAEtbmPIP217xMPG1nqaZpPFIyJusF7YFCS3BLA=
X-Received: by 2002:a67:77c1:: with SMTP id s184mr929694vsc.55.1616581277550;
 Wed, 24 Mar 2021 03:21:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210316085717.7276-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20210316085717.7276-1-wsa+renesas@sang-engineering.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Wed, 24 Mar 2021 11:20:41 +0100
Message-ID: <CAPDyKFrKsZ3CSTF-eN_dSmcwmhETG5O4kg_qoNMYHA=-VizB4g@mail.gmail.com>
Subject: Re: [PATCH RFT 0/2] mmc: tmio: make resets more robust
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-mmc <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, 16 Mar 2021 at 09:58, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Here are two more patches improving the robustness of resetting the IP
> core. Patches are on top of mmc/next and this series "[PATCH v2 0/3]
> mmc: renesas_sdhi: reset via reset controller", especially "[PATCH v2
> 1/3] mmc: tmio: abort DMA before reset".
>
> Tested on Salvator-XS with H3 ES2.0 and M3-N. A branch for testing can
> be found here:
>
> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/sdhi/for-5.13
>
> Some additional testing by Shimoda-san or the BSP team would be much
> appreciated!
>
>    Wolfram
>
>
> Takeshi Saito (1):
>   mmc: tmio: restore bus width when resetting
>
> Wolfram Sang (1):
>   mmc: tmio: always flag retune when resetting and a card is present
>
>  drivers/mmc/host/tmio_mmc_core.c | 37 +++++++++++++++++---------------
>  1 file changed, 20 insertions(+), 17 deletions(-)
>

Applied for next, thanks!

Kind regards
Uffe
