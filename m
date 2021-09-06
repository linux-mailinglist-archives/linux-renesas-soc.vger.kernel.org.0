Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 749BE401DAB
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Sep 2021 17:33:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243212AbhIFPey (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 Sep 2021 11:34:54 -0400
Received: from mail-vk1-f177.google.com ([209.85.221.177]:45932 "EHLO
        mail-vk1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233979AbhIFPex (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Sep 2021 11:34:53 -0400
Received: by mail-vk1-f177.google.com with SMTP id h13so2324178vkc.12;
        Mon, 06 Sep 2021 08:33:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vurnog586LelhGKIAETgFB3SlUTlYV5Ye/u5xa1mces=;
        b=iPqBfO0RuUM+RRHA3TUlrOMvtdWUKHyxniFYnNYUylwI3osZJgFxLIxoQqDnHVbaDc
         0Yr2Yap9XBKStREbPqZpJI8tBYTXNQZF86Ol5eclf2OOj70OII3PzhtmudetI83pDYdu
         BaavdHDcQRDScSAuFq/HYa9bfTbW9OI0KCqrqneVsdI38puokNZkfRKjt2VvdvI98oDO
         NS7E0ZOO0CYyfLEE7bXyAGFi1GpkoFinqt7iRd1okEaR/65E2pHQajnuKR/fekw58w9u
         3izw2wNXGU6CeLWFXDOmcOSuvDxw3zPrkFKqmKn5Wou6g11JkfgJ2IwIGS+F5TKQGNsG
         PE9Q==
X-Gm-Message-State: AOAM532M+RdQsq8YR+pEqc071ki80cb0BR05pi18d+XzimFLujJTStvG
        Y9kca0PLpL6HAf63qkrJx0bVmLj+dt/ID9jdWBw=
X-Google-Smtp-Source: ABdhPJwbpu6+6jutpiO40IYUpYC/LGtFpT4vQkjLQimOl6eXfUeX70f6OavLgBYdFvcp4zyAc46Ik3ygTt/BGFgGcbs=
X-Received: by 2002:a1f:fc8f:: with SMTP id a137mr5454283vki.19.1630942428209;
 Mon, 06 Sep 2021 08:33:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210901102705.556093-1-yoshihiro.shimoda.uh@renesas.com> <20210901102705.556093-3-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20210901102705.556093-3-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 6 Sep 2021 17:33:37 +0200
Message-ID: <CAMuHMdXwf0_+VKfuiFQf6roZErz-JAm06P5RBzD-Jwm1uk=p9A@mail.gmail.com>
Subject: Re: [PATCH 2/2] iommu/ipmmu-vmsa: Add support for r8a779a0
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

On Wed, Sep 1, 2021 at 12:27 PM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Add support for r8a779a0 (R-Car V3U). The IPMMU hardware design
> of this SoC differs than others. So, add a new ipmmu_features for it.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

> --- a/drivers/iommu/ipmmu-vmsa.c
> +++ b/drivers/iommu/ipmmu-vmsa.c

> @@ -922,6 +922,20 @@ static const struct ipmmu_features ipmmu_features_rcar_gen3 = {
>         .utlb_offset_base = 0,
>  };
>
> +static const struct ipmmu_features ipmmu_features_r8a779a0 = {
> +       .use_ns_alias_offset = false,
> +       .has_cache_leaf_nodes = true,
> +       .number_of_contexts = 8,

Shouldn't this be 16?
Or do you plan to add support for more than 8 contexts later, as that
would require increasing IPMMU_CTX_MAX, and updating ipmmu_ctx_reg()
to handle the second bank of 8 contexts?

Regardless, I assume this will still work when when limiting to 8
contexts, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
