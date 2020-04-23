Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8C4F1B5B81
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Apr 2020 14:35:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726540AbgDWMf2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 23 Apr 2020 08:35:28 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:33301 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726090AbgDWMf1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 23 Apr 2020 08:35:27 -0400
Received: by mail-ot1-f67.google.com with SMTP id j26so5720253ots.0;
        Thu, 23 Apr 2020 05:35:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4x6FTGCsrJ3hbA1mW2+NSyYwsMhG1J7BygmKTUppr0k=;
        b=nPDWJFavyYa3i9NOvyP196SQFfqwLs3txv0FOhSkmmAyzqT692CFACksPmqCWqUEic
         JA095zGyB8lchu1stTCupDplB3WSCHverX6PU9MMEQdrsUG7t9sm2+YatgCwFTJsSGMk
         Wl8tV2r6vmRSRQ0GkZhTT7R6ZOAR9cr5QSqTznRadUrVGPWRrdkQWUftLa2Y2+oFx+KM
         sq/qHDKxpvXHjflXYBm6+tLpXru0VX6vdLAQe2uMbHjnCs2yJ7NI1kziFdnGhBbaWWFk
         KD54fOzFw7vwMvVERptAaAQ982g3Iw9KpyZ2O45DIXZmPiJ0YV+mIgK8J5g2GBtmx0MW
         DRLQ==
X-Gm-Message-State: AGi0PuYt2Ed2yA990cdl4G0HecJKhGr0TD8RdQOD2JITHy2YJiiqBmGG
        Xez+uNwztAZG7lB8+7Mg8qvsXqdZ3II8vtWREBUhbA==
X-Google-Smtp-Source: APiQypLwmLk6ZBbBkKuqE1Asu77jQ2nZxTw7kq7BBGrsXFSZbeNsYJL/WNMejote48n1dx2RdAwOFQAmqwjBsCOo7bE=
X-Received: by 2002:a9d:564:: with SMTP id 91mr3211055otw.250.1587645326692;
 Thu, 23 Apr 2020 05:35:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200423122448.8099-1-wsa+renesas@sang-engineering.com> <20200423122448.8099-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20200423122448.8099-2-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 23 Apr 2020 14:35:15 +0200
Message-ID: <CAMuHMdW0OuHy4ikQz3oY+koqLskXtcXJkUVLZYqsW+niT1pLDQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] mmc: renesas_sdhi: handle M3-N ES1.2 and 1.3 revisions
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

Thanks for your patch!

On Thu, Apr 23, 2020 at 2:26 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> For ES1.2, add a comment explaining the situation. For ES1.3 (and
> later, although unlikely), add a new entry defining it as 4tap.

Usually we don't add soc_device_match quirks for unknown future revisions.

> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -711,11 +711,17 @@ static const struct renesas_sdhi_quirks sdhi_quirks_nohs400 = {
>         .hs400_disabled = true,
>  };
>
> +/*
> + * Note for r8a7796 / r8a774a1: we can't distinguish ES1.1 and 1.2 as of now.
> + * So, we want to treat them equally and only have a match for ES1.2 to enforce
> + * this if there ever will be a way to distinguish ES1.2.
> + */
>  static const struct soc_device_attribute sdhi_quirks_match[]  = {
>         { .soc_id = "r8a774a1", .revision = "ES1.[012]", .data = &sdhi_quirks_4tap_nohs400 },
>         { .soc_id = "r8a7795", .revision = "ES1.*", .data = &sdhi_quirks_4tap_nohs400 },
>         { .soc_id = "r8a7795", .revision = "ES2.0", .data = &sdhi_quirks_4tap },
>         { .soc_id = "r8a7796", .revision = "ES1.[012]", .data = &sdhi_quirks_4tap_nohs400 },
> +       { .soc_id = "r8a7796", .revision = "ES1.*", .data = &sdhi_quirks_4tap },

R-Car M3-N is r8a77965, not r8a7796?

>         { .soc_id = "r8a77980", .data = &sdhi_quirks_nohs400 },
>         { /* Sentinel. */ },
>  };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
