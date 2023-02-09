Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1286E690C1E
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Feb 2023 15:46:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230022AbjBIOqU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 Feb 2023 09:46:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229918AbjBIOqT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Feb 2023 09:46:19 -0500
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 680AB36FE7;
        Thu,  9 Feb 2023 06:46:18 -0800 (PST)
Received: by mail-ot1-f41.google.com with SMTP id j6-20020a9d7686000000b0068d4ba9d141so594372otl.6;
        Thu, 09 Feb 2023 06:46:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=L0IsK2xSsS5OLgO8WkubMEfQeWPK1YLozz7woppgDfo=;
        b=jN/SOsGcjEhNG03rxix+ngIT3pVOx3Wj1hCah7QK3IIxG7+WZgJYsJoyeu6eyFdglk
         x56m28rDz/zXWfmrvbzjklgvdlCRMrIuM+czvGYM4Z5Zk7pQ8mb9j8Be5ACyBWqUZ4SJ
         eiGlCQnXxkQJtK8cA6si4XHds9OwiOUhZdznICW7yNv+dx3x6J04HjekiRVZYxtXHqKd
         6XBRbEBziTQqqJRtIRxpVH9nlQfl8YUP3vmanfu3922MEm2iWej4ci2o6jiEen821VmA
         5JDx892njyyy1IZMxhHryFmPTfMUYCGCBHtEY5M194meAJvdW3I7d9/Solh1kfiY8iyl
         Xtow==
X-Gm-Message-State: AO0yUKXiOqD5cFirmqmUPLpG7gJAORkWcA1haFszLa/RawHqiOo6K3g/
        OOpYe24fslxnn3eoaDC6Kg==
X-Google-Smtp-Source: AK7set+q5OalpUjikAsspoQdb8nUMQnZ0KiQ2l5msb6Jvx61NEus/27RAUZRuZ5dYtRx9n0wbx6Q5w==
X-Received: by 2002:a05:6830:410c:b0:68b:e109:c40f with SMTP id w12-20020a056830410c00b0068be109c40fmr7637238ott.26.1675953977627;
        Thu, 09 Feb 2023 06:46:17 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id h23-20020a9d6f97000000b006884c42a38asm757231otq.41.2023.02.09.06.46.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 06:46:17 -0800 (PST)
Received: (nullmailer pid 222556 invoked by uid 1000);
        Thu, 09 Feb 2023 14:46:16 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From:   Rob Herring <robh@kernel.org>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     will@kernel.org, iommu@lists.linux.dev, joro@8bytes.org,
        krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org,
        robin.murphy@arm.com
In-Reply-To: <20230209133440.2643228-1-yoshihiro.shimoda.uh@renesas.com>
References: <20230209133440.2643228-1-yoshihiro.shimoda.uh@renesas.com>
Message-Id: <167595345406.213374.1795032702431324096.robh@kernel.org>
Subject: Re: [PATCH v3] dt-bindings: iommu: renesas,ipmmu-vmsa: Update for
 R-Car Gen4
Date:   Thu, 09 Feb 2023 08:46:16 -0600
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


On Thu, 09 Feb 2023 22:34:40 +0900, Yoshihiro Shimoda wrote:
> Since R-Car Gen4 doens't have the main IPMMU IMSSTR register, update
> the renesas,ipmmu-main property which sets maxItems as 1.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
> Changes from v2:
> https://lore.kernel.org/all/20230127140446.1728102-1-yoshihiro.shimoda.uh@renesas.com/
>  - Set maxItems to renesas,ipmmu-main if R-Car Gen4.
> 
> Changes from v1:
> https://lore.kernel.org/all/20230123012940.1250879-1-yoshihiro.shimoda.uh@renesas.com/
>  - Change number of argument for R-Car Gen4 instead of "module id".
>    On the discussion, using 'minItems' is a solution. But, it causes
>    "too short" errors on dtbs_check. So, using "oneOf" instead.
> 
>  .../bindings/iommu/renesas,ipmmu-vmsa.yaml    | 19 ++++++++++++++-----
>  1 file changed, 14 insertions(+), 5 deletions(-)
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230209133440.2643228-1-yoshihiro.shimoda.uh@renesas.com


iommu@ee480000: renesas,ipmmu-main: [[40], [10]] is too long
	arch/arm64/boot/dts/renesas/r8a779f0-spider.dtb

iommu@ee480000: renesas,ipmmu-main: [[70], [10]] is too long
	arch/arm64/boot/dts/renesas/r8a779a0-falcon.dtb

iommu@ee4c0000: renesas,ipmmu-main: [[40], [19]] is too long
	arch/arm64/boot/dts/renesas/r8a779f0-spider.dtb

iommu@ee4c0000: renesas,ipmmu-main: [[70], [19]] is too long
	arch/arm64/boot/dts/renesas/r8a779a0-falcon.dtb

iommu@eed00000: renesas,ipmmu-main: [[40], [0]] is too long
	arch/arm64/boot/dts/renesas/r8a779f0-spider.dtb

iommu@eed00000: renesas,ipmmu-main: [[70], [0]] is too long
	arch/arm64/boot/dts/renesas/r8a779a0-falcon.dtb

iommu@eed40000: renesas,ipmmu-main: [[40], [2]] is too long
	arch/arm64/boot/dts/renesas/r8a779f0-spider.dtb

iommu@eed40000: renesas,ipmmu-main: [[70], [1]] is too long
	arch/arm64/boot/dts/renesas/r8a779a0-falcon.dtb

iommu@eed80000: renesas,ipmmu-main: [[70], [3]] is too long
	arch/arm64/boot/dts/renesas/r8a779a0-falcon.dtb

iommu@eedc0000: renesas,ipmmu-main: [[70], [12]] is too long
	arch/arm64/boot/dts/renesas/r8a779a0-falcon.dtb

iommu@eee00000: renesas,ipmmu-main: [[70], [6]] is too long
	arch/arm64/boot/dts/renesas/r8a779a0-falcon.dtb

iommu@eee80000: renesas,ipmmu-main: [[70], [14]] is too long
	arch/arm64/boot/dts/renesas/r8a779a0-falcon.dtb

iommu@eeec0000: renesas,ipmmu-main: [[70], [15]] is too long
	arch/arm64/boot/dts/renesas/r8a779a0-falcon.dtb

iommu@eef00000: renesas,ipmmu-main: [[70], [5]] is too long
	arch/arm64/boot/dts/renesas/r8a779a0-falcon.dtb

iommu@eef40000: renesas,ipmmu-main: [[70], [11]] is too long
	arch/arm64/boot/dts/renesas/r8a779a0-falcon.dtb

