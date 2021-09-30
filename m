Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7670341D5BD
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Sep 2021 10:51:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348927AbhI3Ixl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 30 Sep 2021 04:53:41 -0400
Received: from mail-vk1-f180.google.com ([209.85.221.180]:38602 "EHLO
        mail-vk1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348505AbhI3Ixk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 30 Sep 2021 04:53:40 -0400
Received: by mail-vk1-f180.google.com with SMTP id g15so2465523vke.5;
        Thu, 30 Sep 2021 01:51:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=m5P6ZyShaVeYhWVRJKP1PIOkI+YrZXWqg8sKMg41Lio=;
        b=fy22Rp1RURjm+z7bWEY5kc52B+INyF91Mbu0eIJlYGOIGFfo6QrBM/GgMarswAUvOz
         I5npValuWiy0Pk9XPY9hBvTPN7W6leUhueOmHe2WfZsYcn75Pj8wktw+JHpSUV0QpbOJ
         t+uoC2AiyUyPmO7yIDIiLaKTaEUVNPfPIcezWNeen0DjoIof8F8AzMlb4BERmh3vSDvR
         2im4vbz+uYGp66Em56W0ZmvgFgqcP9HA7ktkgVHLLvGB2DmVfYANjdRb/JrTGgUwW7nF
         A3apvmg5mfJwdJXyhZwWmtRt8Yuw9tIrCR8VRUk2088rWB9PmUaLbq1VOvAVsowLaA5W
         55sA==
X-Gm-Message-State: AOAM530UsWKOVTrga9jlJHIp7FixGCHmqo6dZX3CJ01TGmbbjg2J5WEP
        tPajh1ZkJG1XhuRvho61JJgWlDVXG6uv0jZsi10=
X-Google-Smtp-Source: ABdhPJz1vo+I+Wcsh48CwzD5470mzlIbp79s3RZD7B9rSW4uXBWkd8droNHqKLCdiQeyDI9NcnmkgI7w0r3FQDlmhBM=
X-Received: by 2002:a05:6122:e71:: with SMTP id bj49mr489886vkb.7.1632991918045;
 Thu, 30 Sep 2021 01:51:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210901102705.556093-1-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20210901102705.556093-1-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 30 Sep 2021 10:51:46 +0200
Message-ID: <CAMuHMdXkFWHrh1cs4YW_bpP0samT+gSkm99_AboZ=coO3iRj+g@mail.gmail.com>
Subject: Re: [PATCH 0/2] iommu/ipmmu-vmsa: Add support for r8a779a0
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
> This patch series adds support for r8a779a0 (R-Car V3U).
>
> Yoshihiro Shimoda (2):
>   dt-bindings: iommu: renesas,ipmmu-vmsa: add r8a779a0 support
>   iommu/ipmmu-vmsa: Add support for r8a779a0

Thanks to rcar-4.1.0.rc16 of the R-Car BSP, I was pointed to the fact
that the IPMMU modules on R-Car V3U have module clocks and resets,
unlike on other R-Car SoCs.
Probably they should be handled, too?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
