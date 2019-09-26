Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0DAF7BF4F0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Sep 2019 16:21:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727099AbfIZOVi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 26 Sep 2019 10:21:38 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:46553 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726500AbfIZOVi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Sep 2019 10:21:38 -0400
Received: by mail-oi1-f193.google.com with SMTP id k25so2190736oiw.13;
        Thu, 26 Sep 2019 07:21:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cgHzLkYplj2i4qoYgDi3569/ZWf0OLMkzDgo6QeJPTI=;
        b=td9RU0MNSwk9uGoJ3sPUQ/bgFuO94nZ60O6Ptu7cLBzxHq0Xc0QyR32qcMTkrlU6Us
         rygMqLAN2LXDmHCyw3NvcfYYKe09GhZaDDPruJytcOYFtV1pMwWzzeku9Y6Hr0tOBvol
         4ysBEB+8g0KKTmkLw75hFV6Viam4X7fugInRCnRPU8zJa5TVdwDwMvlZud0RglQAB0xo
         LN6pQSEes8/c87wkCSFuhLmp/Zj+gIjxTtUYmX41TI95E/XIEWA6DO0Duu+NpsVqrv4M
         s//7T6ezpqSVLlfiOR11CEwVlJB4ZSDA/J633SC+zN13Erh0W7JRp0Tckwot4sL7SvD+
         A2wA==
X-Gm-Message-State: APjAAAWUPsT+UpMtZU1qs09/D0ShKidXg6OdrHR4nqp0riW8NROENond
        93lBtlKYEhOuRfO/HvMJBrqkTOQoGb7VhM7jHj8=
X-Google-Smtp-Source: APXvYqxlkEXAncwfUIVu29icOsjQzyxCZCopagTQDcmg791smqspqnoLki272BMstIRGwhww/jALs9/hzP1BO2R4z6M=
X-Received: by 2002:aca:b654:: with SMTP id g81mr2672480oif.153.1569507697259;
 Thu, 26 Sep 2019 07:21:37 -0700 (PDT)
MIME-Version: 1.0
References: <1569307744-42479-1-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1569307744-42479-1-git-send-email-biju.das@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 26 Sep 2019 16:21:26 +0200
Message-ID: <CAMuHMdUsLCciw7KFudSC7pRqfwwaGH5iJSgv906kY342V+6ocQ@mail.gmail.com>
Subject: Re: [PATCH] mmc: renesas_sdhi_internal_dmac: Add r8a774b1 support
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Ulf Hansson <ulf.hansson@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Tue, Sep 24, 2019 at 8:49 AM Biju Das <biju.das@bp.renesas.com> wrote:
> This patch adds SDHI support for RZ/G2N (R8A774B1) SoC.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> ---
>  drivers/mmc/host/renesas_sdhi_internal_dmac.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> index 751fe91..7c6020e 100644
> --- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> +++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> @@ -308,6 +308,7 @@ static const struct soc_device_attribute soc_whitelist[] = {
>           .data = (void *)BIT(SDHI_INTERNAL_DMAC_ONE_RX_ONLY) },
>         /* generic ones */
>         { .soc_id = "r8a774a1" },
> +       { .soc_id = "r8a774b1" },
>         { .soc_id = "r8a774c0" },
>         { .soc_id = "r8a77470" },
>         { .soc_id = "r8a7795" },

Is this sufficient?
Do you need a tuning quirk entry in sdhi_quirks_match[]?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
