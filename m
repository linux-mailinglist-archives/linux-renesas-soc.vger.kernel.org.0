Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50448458AA9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Nov 2021 09:47:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238892AbhKVIuL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 22 Nov 2021 03:50:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233105AbhKVIuK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Nov 2021 03:50:10 -0500
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D723C061574;
        Mon, 22 Nov 2021 00:47:04 -0800 (PST)
Received: by mail-yb1-xb2f.google.com with SMTP id 131so47977117ybc.7;
        Mon, 22 Nov 2021 00:47:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=k7dFNlJV0aiK4eRfnLcjhzT0QcNW9OU+Syl2O1W9rtM=;
        b=jveALE0mGgLPe3soMNH88c5rEXlhrV7EBCdkqjm33Gp8KySjWC150GQDLD9kL85aF3
         XcvZ61D7oWAnz4+Jg8lrnoV+8AYaM9w6kwjlVDalJVtE/LF0WFE0IBiEIB8EPERV76XY
         /obdbspS5CUrN+tngGjJOlxcNhDxKrNNQiRooau3HKBjV2TO6/3XxQZLcmp1DSYTvnX/
         CoipyRH7c1kKg3dNjMe3KT9MLpC6QtvqH306ryiiHwZA+SJSTx7kVUGf/9HqkaWEziX3
         8k9hPM3rwP8ZP5iGUle6RYYC7K2RlKrLsFVhq6YbbRVF7dZgysy7yESc0VX4hoB/zmll
         H6OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=k7dFNlJV0aiK4eRfnLcjhzT0QcNW9OU+Syl2O1W9rtM=;
        b=hIq+yubFEViOL2oCLwFKxThyRLzIn8fG33PAXUBzCp8crktCDnRpGkg6Aww/4CVbxa
         Nxl+QlGeLYHM4LJ4Eetn5VdWEBQtuSNNPFmsdL4FF324HQbGAaP7M+Lh3yIknI1KS6gc
         5NewhzMKjH8XWB49NmbIA4IoYmCCLI8uYbkUvhvAFkmAhi5iqjQgudnzqiuoOS57ddbn
         08upKPrJNiGMIyBr828yukjz2YoMwufEUAuA11/IzCrqzi5H/DeIw2PP0TW2+Thf+IlC
         vPwKzBZczMPlH+SFaBkkhpigcVgHxdEDydrdSiJt5Vn5yKVbW3p3JWvFUYBJtCJEGKzD
         Qhqg==
X-Gm-Message-State: AOAM531eL/Qc3sK62TaNO88gh6JurgVu3hHxdlXWwJRdHU6Fx2ivfZ3n
        q+/kzcjqe42fCMzFbsduVQvbRJ50EgPzTzr05nwqSgWWRvEsgw==
X-Google-Smtp-Source: ABdhPJz9LYLMASit0aK9KFAkCvkJvAyq3Jjhdm/QzHUW7PTiMFuur7T93e5gGx6hEkzHPT6kg3pLL0+RIQ5nqf5cOnw=
X-Received: by 2002:a25:dc4d:: with SMTP id y74mr58492098ybe.422.1637570823634;
 Mon, 22 Nov 2021 00:47:03 -0800 (PST)
MIME-Version: 1.0
References: <20211121180155.9062-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdUTLYn=14RzJORp1mn-TSwC1rk1BO_9L6TG4g9JhH27JA@mail.gmail.com>
In-Reply-To: <CAMuHMdUTLYn=14RzJORp1mn-TSwC1rk1BO_9L6TG4g9JhH27JA@mail.gmail.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Mon, 22 Nov 2021 08:46:37 +0000
Message-ID: <CA+V-a8sGA4=oxwp87VonC6zdPYT5-BHmsVoV8L1ggTUV8m4ooA@mail.gmail.com>
Subject: Re: [PATCH] memory: renesas-rpc-if: Silence clang warning
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thank you for the review.

On Mon, Nov 22, 2021 at 7:50 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Sun, Nov 21, 2021 at 7:05 PM Lad Prabhakar
> <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > This patch silences the following clang warning:
> >
> > | drivers/memory/renesas-rpc-if.c:253:14: warning: cast to smaller integer
> > | type 'enum rpcif_type' from 'const void *' [-Wvoid-pointer-to-enum-cast]
> > |           rpc->type = (enum rpcif_type)of_device_get_match_data(dev);
> > |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >
> > Fixes: b04cc0d912eb8 ("memory: renesas-rpc-if: Add support for RZ/G2L")
> > Reported-by: kernel test robot <lkp@intel.com>
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> > --- a/drivers/memory/renesas-rpc-if.c
> > +++ b/drivers/memory/renesas-rpc-if.c
> > @@ -250,7 +250,7 @@ int rpcif_sw_init(struct rpcif *rpc, struct device *dev)
> >                 return PTR_ERR(rpc->dirmap);
> >         rpc->size = resource_size(res);
> >
> > -       rpc->type = (enum rpcif_type)of_device_get_match_data(dev);
> > +       rpc->type = (enum rpcif_type)(uintptr_t)of_device_get_match_data(dev);
>
> While correct, the cast to "enum rpcif_type" is not stricly needed anymore.
>
Agreed.

@Krzysztof, let me know if you want me to resend the patch with the
cast to "enum rpcif_type" dropped.

Cheers,
Prabhakar

> >         rpc->rstc = devm_reset_control_get_exclusive(&pdev->dev, NULL);
> >
> >         return PTR_ERR_OR_ZERO(rpc->rstc);
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
