Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E2D61C9B85
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Oct 2019 12:05:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726472AbfJCKCC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Oct 2019 06:02:02 -0400
Received: from mail-vs1-f67.google.com ([209.85.217.67]:33207 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726978AbfJCKCC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Oct 2019 06:02:02 -0400
Received: by mail-vs1-f67.google.com with SMTP id p13so1307256vso.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 03 Oct 2019 03:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WZwCwSWOc22kro/2vgaznXfgYQv3kw7oQQTG/2sS/lI=;
        b=HOfcCttDVtAQO4QKBPRfTckaGADehLqGF2iEvR1F78kBciOlBBcNrpNWotOrVlki2Y
         3IlmlUNSmZ7G+Yb3b+rYvA9vLbJScsfl2RJsabQw4O2WNoT5yxRrFomLCzhDBiko3eiA
         LzrG2tJHBI0p9x/bqjLhg0qaN2czPFI5ZtgpiR4SnlxAiKSbdzc24AgaE+wLOcmARTpU
         TTl5qTBXdZT9eMHKeRF08rGC62PxihtovXvH+cbl3o1lXu+1MZRPHSL8JJoGkV7CGFVt
         JWjWRDMLY2Lv6Sh26QeG2c2vOn9gHUSpTBPrJp9680bPTzohE1+btOAq8gXypg47gWe8
         GmuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WZwCwSWOc22kro/2vgaznXfgYQv3kw7oQQTG/2sS/lI=;
        b=F2HUbQ1kMFw3PhZze3zhyMqwNVn2JpavpgEG/OSogq/i6ys18SeB3qVfqOL1vBZXmm
         zW/BzemHYmwlpzEPOcosS5J9OlkKENhcwGdDqxUl/7yYmWMt00vSfqFGOUoXEFrGHrHj
         Nt6806NLOqa+uQ9fXkYDPl26WgeoZx+YqbKy3Z6kje+gps66bEXjNvAX5pA9UApEiwbh
         yCKGK5cN0hPLqP2+wrC8DgnUvx/hd66Ck9m9O3BQq2/e28OwbuNdRkLPuFNaTXLCezH6
         mDIwcnG2jNUDOPbGcPOmu0DxQmIhaFhZIWx+70+NI3zSn8f0/lSxqbbhfyFz7hT/8K5+
         Ex7Q==
X-Gm-Message-State: APjAAAW8fjIPVA3iU6IyPdliGYbDcyLSqgcPz/+Xv9eMZd1RCNRia36U
        vYqqfVTF0Z9Ll+nGrR1NRHu2cbLmL+0HEaFhCVxSeA==
X-Google-Smtp-Source: APXvYqyvTemNF6sB2ZOwkWKuYJdVxx6KlAP43NRkOij0K3U4Fa3wXm7HzorJbnnhEJ3ufyHC0AhucGjoXHSdz6Os5SA=
X-Received: by 2002:a67:fc42:: with SMTP id p2mr4562222vsq.34.1570096921334;
 Thu, 03 Oct 2019 03:02:01 -0700 (PDT)
MIME-Version: 1.0
References: <20190917183652.7310-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20190917183652.7310-1-wsa+renesas@sang-engineering.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Thu, 3 Oct 2019 12:01:25 +0200
Message-ID: <CAPDyKFrDsYsOyhP7j0kGv=a7hYn88pYzM2gM8aaEJQQTgnD2VA@mail.gmail.com>
Subject: Re: [PATCH] mmc: tmio: remove workaround for NON_REMOVABLE
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, 17 Sep 2019 at 20:36, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> PM has been reworked, so eMMC gets now detected on R-Car H3 ES1.0 and
> 2.0 as well as M3-N without the workaround. Card detect and write
> protect also still work. Remove the workaround.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/tmio_mmc_core.c | 9 ---------
>  1 file changed, 9 deletions(-)
>
> diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
> index 9b6e1001e77c..63dc37481fba 100644
> --- a/drivers/mmc/host/tmio_mmc_core.c
> +++ b/drivers/mmc/host/tmio_mmc_core.c
> @@ -1208,15 +1208,6 @@ int tmio_mmc_host_probe(struct tmio_mmc_host *_host)
>         if (!_host->reset)
>                 _host->reset = tmio_mmc_reset;
>
> -       /*
> -        * On Gen2+, eMMC with NONREMOVABLE currently fails because native
> -        * hotplug gets disabled. It seems RuntimePM related yet we need further
> -        * research. Since we are planning a PM overhaul anyway, let's enforce
> -        * for now the device being active by enabling native hotplug always.
> -        */
> -       if (pdata->flags & TMIO_MMC_MIN_RCAR2)
> -               _host->native_hotplug = true;
> -
>         /*
>          * While using internal tmio hardware logic for card detection, we need
>          * to ensure it stays powered for it to work.
> --
> 2.20.1
>
