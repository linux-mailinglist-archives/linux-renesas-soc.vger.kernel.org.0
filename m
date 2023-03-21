Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA4CB6C3B35
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Mar 2023 21:05:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229666AbjCUUFX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 21 Mar 2023 16:05:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229496AbjCUUFW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 21 Mar 2023 16:05:22 -0400
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D76D55527;
        Tue, 21 Mar 2023 13:04:46 -0700 (PDT)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-17aa62d0a4aso17426454fac.4;
        Tue, 21 Mar 2023 13:04:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679429063;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5N90XyIxbKyLkJXYLM1vAYGNvhjgTfxNeBEga+2DXaA=;
        b=07F25SpFCfYytMM8uDjkzinSRctowGoEbGRSu5gf81WAKQ5ApHXv3Nqjh3v+b6Fqu4
         7j5LVgjoVs1wiirvc4dm+oYMAEE+N2wnbBdTfsQLXHnH93io7lsAjSxRBgZ022q+PFSS
         XALUWuYaCKiwgpJuvQ0cVyPoi0hUr0gvD2GXsNXqH2QqSp7g7O/s/LiTwVGQnAliOxlE
         AK+pSyhpZhUQ8cjmw1e27MSYG5PSplc4s8nVPkGjvbnidNlye/oQKRH9kGP+tiHxhHFK
         sorXis+rgq37ebIANkTQ87tRCAzU2fGctNug6UCTaXzoUvlgzGjnAJOGIgKnc3206ww0
         Wt0w==
X-Gm-Message-State: AO0yUKXABoYfOyiK139wgn6pCQYfB6tdwND2Buv9yMDCeaevYY7ALk1Z
        rmRwRN8b+8V0roRpn7uvUl8qijpuOQ==
X-Google-Smtp-Source: AK7set+BujNjHzku3uTLqRhdbQ+UDuw1QKFffw3xfZjiNEaXc46GCjn96WH6hYU2jdnpwijCR3OXKw==
X-Received: by 2002:a05:6870:7085:b0:17d:22f3:244e with SMTP id v5-20020a056870708500b0017d22f3244emr162900oae.14.1679429062848;
        Tue, 21 Mar 2023 13:04:22 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id bp8-20020a056808238800b0037d8c2ff0acsm5106802oib.12.2023.03.21.13.04.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 13:04:22 -0700 (PDT)
Received: (nullmailer pid 1362413 invoked by uid 1000);
        Tue, 21 Mar 2023 20:04:21 -0000
Date:   Tue, 21 Mar 2023 15:04:21 -0500
From:   Rob Herring <robh@kernel.org>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
        joro@8bytes.org, robh+dt@kernel.org, geert+renesas@glider.be,
        robin.murphy@arm.com, iommu@lists.linux.dev,
        linux-renesas-soc@vger.kernel.org, will@kernel.org
Subject: Re: [PATCH v4] dt-bindings: iommu: renesas, ipmmu-vmsa: Update for
 R-Car Gen4
Message-ID: <167942906116.1362361.13221797709558007164.robh@kernel.org>
References: <20230313124026.954514-1-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230313124026.954514-1-yoshihiro.shimoda.uh@renesas.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


On Mon, 13 Mar 2023 21:40:26 +0900, Yoshihiro Shimoda wrote:
> Since R-Car Gen4 does not have the main IPMMU IMSSTR register, update
> the bindings to drop the interrupt bit number from the
> renesas,ipmmu-main property.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> [geert: Re-add removed items level, add minItems/maxItems constraints]
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Changes from v3:
> https://lore.kernel.org/all/20230209133440.2643228-1-yoshihiro.shimoda.uh@renesas.com/
>  - Revise the dt-bindings by Geert-san (Thanks a lot!).
> 
>  .../bindings/iommu/renesas,ipmmu-vmsa.yaml    | 32 ++++++++++++++-----
>  1 file changed, 24 insertions(+), 8 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

