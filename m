Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 33C8D4A6DBC
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Feb 2022 10:23:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234114AbiBBJXu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 2 Feb 2022 04:23:50 -0500
Received: from mail-vk1-f173.google.com ([209.85.221.173]:36708 "EHLO
        mail-vk1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234059AbiBBJXu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Feb 2022 04:23:50 -0500
Received: by mail-vk1-f173.google.com with SMTP id u25so8842304vkk.3;
        Wed, 02 Feb 2022 01:23:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hCUm6YJgeaBSW2LffvWnBA0o47V64tlsOuuAWMjoV6M=;
        b=HUGQGUQIvvd8cF4Gt5lrI/cx0Dq8oFrAfjgU0FiSenwWE6raJL6ZJpW3rckJGaYukh
         ocCkdewXwJf5x5NxFkNbh3mxw6lBvSg0O8tYCBQFbrRqcuS5RCc36lXWKyUntiHomGlk
         gjSWMZAZsnZAYYsE1240r5vEv623QcKs6b/xRHIE6gsNpSZc6AvVF3Hfuci5Fjt5+Xz8
         BhSTszRV/mEycUH2tcWF2PPLY+ykCqcwMPZrkSNbPKWL91xHPJFYfGi2ZDxKt/01so+K
         aZP9eGnDNQrI5fSTZLM7QmB2iO1Gm9EkldycowXUBUMxyLQqbQqqFyrau79darGVjSXx
         F+MA==
X-Gm-Message-State: AOAM531LxJL8/D0c1Jy9Gq6Y/fSrEuCCnr0c4fKVZmdtNkdcXsxWZ+pd
        LHs6e1Vu01dDrQn3AulenM9VNEYKhwJD0g==
X-Google-Smtp-Source: ABdhPJyusAZaeIpQR2yczMEy4TTTrc3XGnOmJElFX6KGORzcMsZODr3iTKoj3jpjLVt2IqnNPHIFvA==
X-Received: by 2002:a05:6122:d07:: with SMTP id az7mr12150708vkb.35.1643793829441;
        Wed, 02 Feb 2022 01:23:49 -0800 (PST)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id r4sm4718925vsk.2.2022.02.02.01.23.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Feb 2022 01:23:49 -0800 (PST)
Received: by mail-ua1-f42.google.com with SMTP id r8so4923266uaj.0;
        Wed, 02 Feb 2022 01:23:49 -0800 (PST)
X-Received: by 2002:a67:5f83:: with SMTP id t125mr10939867vsb.68.1643793828948;
 Wed, 02 Feb 2022 01:23:48 -0800 (PST)
MIME-Version: 1.0
References: <20220125125602.4144793-1-yoshihiro.shimoda.uh@renesas.com> <20220125125602.4144793-3-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20220125125602.4144793-3-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 2 Feb 2022 10:23:38 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXmievc1U0PXfv01wsibUs+B+5U6kPbcE8=v2GKTvFbTA@mail.gmail.com>
Message-ID: <CAMuHMdXmievc1U0PXfv01wsibUs+B+5U6kPbcE8=v2GKTvFbTA@mail.gmail.com>
Subject: Re: [PATCH 2/2] iommu/ipmmu-vmsa: Add support for R-Car Gen4
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linux IOMMU <iommu@lists.linux-foundation.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

On Tue, Jan 25, 2022 at 6:36 PM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Add support for R-Car Gen4 like r8a779f0 (R-Car S4-8). The IPMMU
> hardware design of r8a779f0 is the same as r8a779a0. So, rename
> "r8a779a0" to "rcar_gen4".
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Thanks for your patch!

> --- a/drivers/iommu/ipmmu-vmsa.c
> +++ b/drivers/iommu/ipmmu-vmsa.c

> @@ -743,7 +744,7 @@ static bool ipmmu_device_is_allowed(struct device *dev)
>         unsigned int i;
>
>         /*
> -        * R-Car Gen3 and RZ/G2 use the allow list to opt-in devices.
> +        * R-Car Gen3, Gen4 and RZ/G2 use the allow list to opt-in devices.
>          * For Other SoCs, this returns true anyway.
>          */
>         if (!soc_device_match(soc_needs_opt_in))

There are a few more references to "Gen3" that can be extended.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
