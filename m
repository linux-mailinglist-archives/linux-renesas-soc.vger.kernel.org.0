Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 89C4634C3A
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Jun 2019 17:29:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728007AbfFDP3O (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 4 Jun 2019 11:29:14 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:36344 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727951AbfFDP3O (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Jun 2019 11:29:14 -0400
Received: by mail-lj1-f196.google.com with SMTP id i21so5559307ljj.3;
        Tue, 04 Jun 2019 08:29:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eRn6ZUH48TOGqsFJXDxIEsklGvs2yDgvovf/2ozhDpk=;
        b=I0AuA4cmyZWXpgFAgpzIXJc9qBosLowOV1b3AY7qWSAKKlB4NElNZm0zs9QZV3foJa
         HwDSiFNIPJ1UUUxGa2pY05Hr4EFtR0MFQfnjTQnrEqj0g/f89eGqxUj4lUw+srza10Fd
         VBVKcV4wJ6SjdYDh3fXhr65WA4kEdhGuLg2+0E6wP6b/KLYehv6LAb5rlqrqrRNWvi5e
         oQGTG5epHa9xV1wljMc4hf/sNN5GHBJdac5PcbsFBzhiFj9FRdDWV8WdeTkXfUfkwSHG
         FiSgwxsFEcTea2HJWGqdm1LGMqg8F46Pz6R21co34fnHy+yh29VpmfjANcRTns/TQwbF
         /Qqw==
X-Gm-Message-State: APjAAAU9Vs7n3Uj1g+hPg1Sg1ffMqpIXV2t4Nl6zPKBwZJts43ynVgfj
        Z4H18/spQcHlDwXXMaTv6HnVWazo/JokhZADj1iSMITnWXc=
X-Google-Smtp-Source: APXvYqwYz2/CFeMckochz6IGluLcvKKajaDDzKliM6VK1pN36+liDhvSkL2ptC2siaTHwUfblUyTrfqX+/50uTm2wKo=
X-Received: by 2002:a2e:8555:: with SMTP id u21mr16876658ljj.133.1559662151853;
 Tue, 04 Jun 2019 08:29:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190604151530.7023-1-wsa+renesas@sang-engineering.com> <20190604151530.7023-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20190604151530.7023-2-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 4 Jun 2019 17:28:59 +0200
Message-ID: <CAMuHMdVhv2GAv6ha-Z6OQZC-yFmYDSMexsrNxHXf2w-6B+tj=A@mail.gmail.com>
Subject: Re: [PATCH 1/3] mmc: sdhi: disallow HS400 for M3-W ES1.2 and V3H
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On Tue, Jun 4, 2019 at 5:17 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Our HW engineers informed us that HS400 is not working on these SoC
> revisions.
>
> Fixes: 0f4e2054c971 ("mmc: renesas_sdhi: disable HS400 on H3 ES1.x and M3-W ES1.[012]")
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -620,11 +620,17 @@ static const struct renesas_sdhi_quirks sdhi_quirks_h3_es2 = {
>         .hs400_4taps = true,
>  };
>
> +static const struct renesas_sdhi_quirks sdhi_quirks_nohs400 = {
> +       .hs400_disabled = true,
> +};
> +
>  static const struct soc_device_attribute sdhi_quirks_match[]  = {
>         { .soc_id = "r8a7795", .revision = "ES1.*", .data = &sdhi_quirks_h3_m3w_es1 },
>         { .soc_id = "r8a7795", .revision = "ES2.0", .data = &sdhi_quirks_h3_es2 },
>         { .soc_id = "r8a7796", .revision = "ES1.0", .data = &sdhi_quirks_h3_m3w_es1 },
>         { .soc_id = "r8a7796", .revision = "ES1.1", .data = &sdhi_quirks_h3_m3w_es1 },
> +       { .soc_id = "r8a7796", .revision = "ES1.2", .data = &sdhi_quirks_h3_m3w_es1 },

I think the above 3 lines can be combined in:

     { .soc_id = "r8a7796", .revision = "ES1.[012]", .data =
&sdhi_quirks_h3_m3w_es1 },

Or do you prefer separate lines for easier grepping?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
