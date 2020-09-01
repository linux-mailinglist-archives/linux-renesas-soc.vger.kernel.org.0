Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9287C2589C7
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Sep 2020 09:55:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727970AbgIAHzj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 1 Sep 2020 03:55:39 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:33922 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726050AbgIAHz3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 1 Sep 2020 03:55:29 -0400
Received: by mail-ot1-f67.google.com with SMTP id k20so412999otr.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 01 Sep 2020 00:55:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=k9T4Grb2SCuj2LT7JjxMWkxsfzstfmZ4NFINJ0nMD0Y=;
        b=lN+wkylp3VL5hfc1oXDH7ClPZ/f9QpL1JmgKvf9ccVmnfx9Mui8stWVTKy4moNpctj
         sTKKK/RBjxiubkahzDzyX4AuebpQYAdOLZj815vxkG7R09rLy++4Dl3Y5ML5RtBvF9sS
         ZZRC/n9ojSBRbKsr2/ejZxPez4jJS/jn7hm32e44hB1q6e8VaFzsxNT1c8It5XjOjEGK
         /UnrPoZd+8vC9DhWTf5zHBoMeRHX/7GDAbEfXx4cgRO4sX/vZUj5JQi43azbRKQp2D/N
         1RMoSFkpBlr+ScCpUpbjU+IiDbv/SgX1Xjt/7vHJuEEcrsbRmcwDFHpDTLvMou7i7xuU
         n0jw==
X-Gm-Message-State: AOAM533ZqX8mEbBxQD0dGX2AJB2Xshpt1mv4BYLZpqc0YGU8qiAWBCbZ
        xBGsabrUborq1HJB6l6cW7A6S7kMHR5mgYIsnXU=
X-Google-Smtp-Source: ABdhPJzXOLp114KXLK98MDG5R98t92nBXIX7Ce6Q2YoYDmDk65+aZrvGK2mulYZFo8/upm2sAVeidvCr/LJv6IqTpg4=
X-Received: by 2002:a9d:1b62:: with SMTP id l89mr511729otl.145.1598946928673;
 Tue, 01 Sep 2020 00:55:28 -0700 (PDT)
MIME-Version: 1.0
References: <87364czszt.wl-kuninori.morimoto.gx@renesas.com> <87y2m4yeck.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87y2m4yeck.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 1 Sep 2020 09:55:17 +0200
Message-ID: <CAMuHMdVXiwkmEZg-GL64Eg6jTFnonXzPL+MKeXztS0ac9F-hKA@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] soc: renesas: Merge if xxx into menu description
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Magnus <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Morimoto-san,

On Mon, Aug 24, 2020 at 4:22 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> Current Kconfig is using if - endif.
> This patch merges it into each menu description.
> This is prepare for menu sorting.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thanks for your patch!

> --- a/drivers/soc/renesas/Kconfig
> +++ b/drivers/soc/renesas/Kconfig
> @@ -44,17 +44,15 @@ config ARCH_RZN1
>         bool
>         select ARM_AMBA
>
> -if ARM && ARCH_RENESAS
> -
>  #comment "Renesas ARM SoCs System Type"
>
>  config ARCH_EMEV2
> -       bool "SoC Platform support for Emma Mobile EV2"
> +       bool "SoC Platform support for Emma Mobile EV2" if ARM && ARCH_RENESAS
>         select HAVE_ARM_SCU if SMP
>         select SYS_SUPPORTS_EM_STI

I'm not convinced duplicating these dependencies is better than a
big #if block.  It does allow you to sort all SoCs alphabetically, but that
mixes ARM32 and ARM64 parts, while choosing between ARM32 and ARM64
is an early and important decision (different ARCH= and CROSS_COMPILE=,
too).
In addition, only one set of Kconfig options is shown to the user
anyway.

What do other people think?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
