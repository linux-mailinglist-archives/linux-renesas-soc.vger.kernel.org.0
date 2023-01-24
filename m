Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A05F679C03
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Jan 2023 15:35:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234182AbjAXOfE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 24 Jan 2023 09:35:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234312AbjAXOfD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Jan 2023 09:35:03 -0500
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43FB3EF8B;
        Tue, 24 Jan 2023 06:34:58 -0800 (PST)
Received: by mail-qt1-f172.google.com with SMTP id g16so11112698qtu.2;
        Tue, 24 Jan 2023 06:34:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=spuGXbnEWjgnG1USxADlTAPQRT06VybqZm5i7nwtOM0=;
        b=SDdlplKCHNNb0rnUHU7YRPDFTPLHZtwt4qkVWqozgVEMcbfIudSQXdYVf6LDsvS9me
         9kZXfBZmIIHmgpe0m6aNU6Lw0c8KSczFDgSiYQhOF15zsXWKb+XC4hLsXNFIOpMZF9X9
         RUDWL0am3A4JDU0LoHTzaQhQBIe7dT8ZEguo+XHdWePCpM6dLYaBDWM1U2BeKNvh9LKC
         eZnJvUDS1r0FBEWneRkCrPe8jz3bEmeTUaV6mAQYcBe/ic0fmwML3oF3msbLRRaTl3Rh
         3vb1vmW2ItUS0st4mfc44FqMacAWkZ2PQC5ZbFPbr2VAo6eFgrJStd+F05UpvgDk1jeA
         Rs7w==
X-Gm-Message-State: AFqh2krrF/O8WYW5lqHBmtu5FCGqPUl3mlI+xblK4ryMPdxELP4t+KlS
        AJibBsI5yGFRIaALcHjoKJjci/h+PPFY3g==
X-Google-Smtp-Source: AMrXdXsDy9FSKo45eQK7Mvi196d+FJuViqiGBhqok09za/L24BYvqWUqmbOWvV6hXXmjYAn0GmLJUQ==
X-Received: by 2002:ac8:7383:0:b0:3ac:c2b8:18 with SMTP id t3-20020ac87383000000b003acc2b80018mr41384229qtp.19.1674570897026;
        Tue, 24 Jan 2023 06:34:57 -0800 (PST)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id q16-20020ae9e410000000b006ec62032d3dsm1549325qkc.30.2023.01.24.06.34.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jan 2023 06:34:56 -0800 (PST)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-50112511ba7so161260797b3.3;
        Tue, 24 Jan 2023 06:34:56 -0800 (PST)
X-Received: by 2002:a05:690c:c89:b0:4dd:7a8e:1cf3 with SMTP id
 cm9-20020a05690c0c8900b004dd7a8e1cf3mr3005151ywb.384.1674570896091; Tue, 24
 Jan 2023 06:34:56 -0800 (PST)
MIME-Version: 1.0
References: <20230123012940.1250879-1-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20230123012940.1250879-1-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 24 Jan 2023 15:34:44 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX92KMeON0xC9p17kiqWT7ksEBX_NyPiiQk0fLaucDZBA@mail.gmail.com>
Message-ID: <CAMuHMdX92KMeON0xC9p17kiqWT7ksEBX_NyPiiQk0fLaucDZBA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: iommu: renesas,ipmmu-vmsa: Update
 descriptions for R-Car Gen4
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     joro@8bytes.org, will@kernel.org, robin.murphy@arm.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

On Mon, Jan 23, 2023 at 2:35 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Since R-Car Gen4 doens't have the main IPMMU IMSSTR register, but
> each cache IPMMU has own module id. So, update descriptions of
> renesas,ipmmu-main property for R-Car Gen4.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Thanks for your patch!

> ---
>  The old R-Car S4-8 datasheet had described IPMMU IMSSTR register, but
>  the latest datasheet undocumented the register. So, update the propeties
>  description. Note that the second argument is not used on the driver.

DT describes hardware, not software policy.

>  So no behavior change.

So where do we get the module id numbers to use, if they are no longer
documented in the Hardware Manual?

> --- a/Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.yaml
> +++ b/Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.yaml
> @@ -76,14 +76,15 @@ properties:
>      items:
>        - items:
>            - description: phandle to main IPMMU
> -          - description: the interrupt bit number associated with the particular
> -              cache IPMMU device. The interrupt bit number needs to match the main
> -              IPMMU IMSSTR register. Only used by cache IPMMU instances.
> +          - description: The interrupt bit number or module id associated with
> +              the particular cache IPMMU device. The interrupt bit number needs
> +              to match the main IPMMU IMSSTR register. Only used by cache IPMMU
> +              instances.
>      description:
>        Reference to the main IPMMU phandle plus 1 cell. The cell is
> -      the interrupt bit number associated with the particular cache IPMMU
> -      device. The interrupt bit number needs to match the main IPMMU IMSSTR
> -      register. Only used by cache IPMMU instances.
> +      the interrupt bit number or module id associated with the particular
> +      cache IPMMU device. The interrupt bit number needs to match the main
> +      IPMMU IMSSTR register. Only used by cache IPMMU instances.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
