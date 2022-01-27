Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C636249E030
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Jan 2022 12:05:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239949AbiA0LFp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 27 Jan 2022 06:05:45 -0500
Received: from mail-vk1-f171.google.com ([209.85.221.171]:45634 "EHLO
        mail-vk1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239778AbiA0LFo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 27 Jan 2022 06:05:44 -0500
Received: by mail-vk1-f171.google.com with SMTP id l14so344579vko.12;
        Thu, 27 Jan 2022 03:05:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=loIa7nlMENziG0/c90oCJAPlR/jhhazB44r3+ZnUWXw=;
        b=IBY66V0MKfOA/9mXcGUlPJR9T+RJM8NGgumAEsoybDOSmQmmDxpvDeDpMsllqGCUR9
         IPEhVcNiEf7F3RKvrUWYsPZm8vsnWy36PymqcvHD5Tkv2BjHmqsOEgpnw1y5CeAlVzhx
         4kYHyR4WTNya27s7FaL7zViThu/5cL76qeL6rb8rHT86Z4HPZnIzARnZ98sLzGTiWFwP
         NAT2gknN2o9nmdu92CqveoCElEADt75QvqkfyN0sxCUIXC6+0cGMNkV+HlFFtkEWLClV
         mx0PGwu1xDDFUopfJUleC0XOoceciSCe5Ut3yjhMoyfhDD4ZHyMQG6PrZaQGS6OF2RkN
         VB4A==
X-Gm-Message-State: AOAM532iPNjFxYiz1WoCR8cNzxL2ZrheSjJjPMJJwbazVGn5t2xXUOoV
        cyuru42Z1QdTZUuRpwa7D46btYX6wqgp6w==
X-Google-Smtp-Source: ABdhPJw2HCNkci18Z052sl6+J9PLBNzpERDmtQ363NQlMuxZpE1FSWZNt670nUOMM5zZBulUUSplZg==
X-Received: by 2002:a05:6122:20a0:: with SMTP id i32mr1260273vkd.36.1643281543554;
        Thu, 27 Jan 2022 03:05:43 -0800 (PST)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id b191sm504711vkb.32.2022.01.27.03.05.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jan 2022 03:05:43 -0800 (PST)
Received: by mail-vk1-f171.google.com with SMTP id w17so1586188vko.9;
        Thu, 27 Jan 2022 03:05:43 -0800 (PST)
X-Received: by 2002:a05:6122:1254:: with SMTP id b20mr1332640vkp.0.1643281542969;
 Thu, 27 Jan 2022 03:05:42 -0800 (PST)
MIME-Version: 1.0
References: <20220125125602.4144793-1-yoshihiro.shimoda.uh@renesas.com> <20220125125602.4144793-2-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20220125125602.4144793-2-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 27 Jan 2022 12:05:31 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXgg8XApJETkN1oDDSy=N01kJaTz4DADyD9ZOM0ZXXttA@mail.gmail.com>
Message-ID: <CAMuHMdXgg8XApJETkN1oDDSy=N01kJaTz4DADyD9ZOM0ZXXttA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: iommu: renesas,ipmmu-vmsa: add r8a779f0 support
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linux IOMMU <iommu@lists.linux-foundation.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

CC Laurent, Magnus.

On Tue, Jan 25, 2022 at 6:33 PM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Document the compatible values for the IPMMU-VMSA blocks in
> the Renesas R-Car S4-8 (R8A779F0) SoC and R-Car Gen4.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.yaml
> +++ b/Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.yaml
> @@ -44,6 +44,10 @@ properties:
>                - renesas,ipmmu-r8a77990 # R-Car E3
>                - renesas,ipmmu-r8a77995 # R-Car D3
>                - renesas,ipmmu-r8a779a0 # R-Car V3U
> +      - items:
> +          - enum:
> +              - renesas,ipmmu-r8a779f0 # R-Car S4-8
> +          - const: renesas,rcar-gen4-ipmmu-vmsa  # R-Car Gen4
>

I'm wondering if we need the family-specific fallback.
For R-Car Gen3, we don't have it, and match on (all) the SoC-specific
compatible values instead.
Do you remember why we decided to do it that way?

At least R-Car V3M/V3H/D3 have slight differences in the register bits,
but I don't think that was the reason.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
