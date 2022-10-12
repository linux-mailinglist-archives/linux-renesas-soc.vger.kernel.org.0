Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 01A125FC641
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Oct 2022 15:19:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229736AbiJLNTv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 12 Oct 2022 09:19:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229727AbiJLNTs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Oct 2022 09:19:48 -0400
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05459B7EE;
        Wed, 12 Oct 2022 06:19:41 -0700 (PDT)
Received: by mail-oo1-f42.google.com with SMTP id c17-20020a4aa4d1000000b0047653e7c5f3so12134190oom.1;
        Wed, 12 Oct 2022 06:19:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rwuKV1ggoVQHJXNXiTOiZX1LGGk+Z76m8URtdYCCRFc=;
        b=Dd7pQTxgwLzzMp78dhzPMqY/sFxggvAm+/1IwJRYDA0TzpFrznfHH6oOI1AYAAk8Fb
         akfmlm8Ei9batpvUDp882AbQ/JSdMS7WGCMcd6tL53SF8WnTxGOeRnx86RlS1xabWJO/
         hEWd3nYzBuYLdBhFB4wor6cb9lB4xAZ8wtxnbt3ieMZjwIyAu1DF7diX1WQ2/gcWOSNY
         bly5/tlOKyT6rLhXsMMeXce5ux5oLpOiCQSti09K2v6WtZRqVu1CHO4AW4Lo05sYjqmW
         MzGF7nwsyRR5Y73XuDI0IhciSymYNoP0DeXuYmXN/3AbTdvPlKfKxcQ5uQQ6MZ9d8BzR
         fd3w==
X-Gm-Message-State: ACrzQf2G/1fo0q0c1C1y6ZQGeEqDIrEaCDbupHjshfxluCddr/Jicurc
        iDcIiZCUBhOpsOk4ahT2FSyhWif+JA==
X-Google-Smtp-Source: AMsMyM7gNjxp6TbgltCXjxRpzzz2aiX0BAazUsfBCrDW7VOqel1re3TVmjfOmwtowvdsJAAlY0r9qw==
X-Received: by 2002:a4a:4e41:0:b0:480:8a3c:a797 with SMTP id r62-20020a4a4e41000000b004808a3ca797mr2391372ooa.71.1665580780845;
        Wed, 12 Oct 2022 06:19:40 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id c17-20020aca1c11000000b00354d732ed87sm916814oic.36.2022.10.12.06.19.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Oct 2022 06:19:40 -0700 (PDT)
Received: (nullmailer pid 1941578 invoked by uid 1000);
        Wed, 12 Oct 2022 13:19:39 -0000
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org, linux-mmc@vger.kernel.org,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
In-Reply-To: <7ee7fdb6a46fc9f0e50c2b803ede6b4b2fdfa450.1665558324.git.geert+renesas@glider.be>
References: <7ee7fdb6a46fc9f0e50c2b803ede6b4b2fdfa450.1665558324.git.geert+renesas@glider.be>
Message-Id: <166558066055.1938423.17466826000089973236.robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: mmc: renesas,sdhi: Document R-Car V4H support
Date:   Wed, 12 Oct 2022 08:19:39 -0500
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, 12 Oct 2022 09:05:56 +0200, Geert Uytterhoeven wrote:
> Document support for the SD Card/MMC Interface on the Renesas R-Car V4H
> (R8A779G0) SoC.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/


mmc@ee100000: Unevaluated properties are not allowed ('iommus' was unexpected)
	arch/arm64/boot/dts/renesas/r8a774e1-beacon-rzg2h-kit.dtb
	arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h.dtb
	arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h-ex.dtb
	arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h-ex-idk-1110wr.dtb
	arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h-ex-mipi-2.1.dtb
	arch/arm64/boot/dts/renesas/r8a77950-salvator-x.dtb
	arch/arm64/boot/dts/renesas/r8a77950-ulcb.dtb
	arch/arm64/boot/dts/renesas/r8a77950-ulcb-kf.dtb
	arch/arm64/boot/dts/renesas/r8a77951-salvator-x.dtb
	arch/arm64/boot/dts/renesas/r8a77951-salvator-xs.dtb
	arch/arm64/boot/dts/renesas/r8a77951-ulcb.dtb
	arch/arm64/boot/dts/renesas/r8a77951-ulcb-kf.dtb
	arch/arm64/boot/dts/renesas/r8a77960-salvator-x.dtb
	arch/arm64/boot/dts/renesas/r8a77960-salvator-xs.dtb
	arch/arm64/boot/dts/renesas/r8a77960-ulcb.dtb
	arch/arm64/boot/dts/renesas/r8a77960-ulcb-kf.dtb
	arch/arm64/boot/dts/renesas/r8a77961-salvator-xs.dtb
	arch/arm64/boot/dts/renesas/r8a77961-ulcb.dtb
	arch/arm64/boot/dts/renesas/r8a77961-ulcb-kf.dtb
	arch/arm64/boot/dts/renesas/r8a77965-salvator-x.dtb
	arch/arm64/boot/dts/renesas/r8a77965-salvator-xs.dtb
	arch/arm64/boot/dts/renesas/r8a77965-ulcb.dtb
	arch/arm64/boot/dts/renesas/r8a77965-ulcb-kf.dtb
	arch/arm64/boot/dts/renesas/r8a77990-ebisu.dtb
	arch/arm64/boot/dts/renesas/r8a779m1-salvator-xs.dtb
	arch/arm64/boot/dts/renesas/r8a779m1-ulcb.dtb
	arch/arm64/boot/dts/renesas/r8a779m1-ulcb-kf.dtb
	arch/arm64/boot/dts/renesas/r8a779m3-salvator-xs.dtb
	arch/arm64/boot/dts/renesas/r8a779m3-ulcb.dtb
	arch/arm64/boot/dts/renesas/r8a779m3-ulcb-kf.dtb
	arch/arm64/boot/dts/renesas/r8a779m5-salvator-xs.dtb

mmc@ee120000: Unevaluated properties are not allowed ('iommus' was unexpected)
	arch/arm64/boot/dts/renesas/r8a774e1-beacon-rzg2h-kit.dtb
	arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h.dtb
	arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h-ex.dtb
	arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h-ex-idk-1110wr.dtb
	arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h-ex-mipi-2.1.dtb
	arch/arm64/boot/dts/renesas/r8a77950-salvator-x.dtb
	arch/arm64/boot/dts/renesas/r8a77950-ulcb.dtb
	arch/arm64/boot/dts/renesas/r8a77950-ulcb-kf.dtb
	arch/arm64/boot/dts/renesas/r8a77951-salvator-x.dtb
	arch/arm64/boot/dts/renesas/r8a77951-salvator-xs.dtb
	arch/arm64/boot/dts/renesas/r8a77951-ulcb.dtb
	arch/arm64/boot/dts/renesas/r8a77951-ulcb-kf.dtb
	arch/arm64/boot/dts/renesas/r8a77960-salvator-x.dtb
	arch/arm64/boot/dts/renesas/r8a77960-salvator-xs.dtb
	arch/arm64/boot/dts/renesas/r8a77960-ulcb.dtb
	arch/arm64/boot/dts/renesas/r8a77960-ulcb-kf.dtb
	arch/arm64/boot/dts/renesas/r8a77961-salvator-xs.dtb
	arch/arm64/boot/dts/renesas/r8a77961-ulcb.dtb
	arch/arm64/boot/dts/renesas/r8a77961-ulcb-kf.dtb
	arch/arm64/boot/dts/renesas/r8a77965-salvator-x.dtb
	arch/arm64/boot/dts/renesas/r8a77965-salvator-xs.dtb
	arch/arm64/boot/dts/renesas/r8a77965-ulcb.dtb
	arch/arm64/boot/dts/renesas/r8a77965-ulcb-kf.dtb
	arch/arm64/boot/dts/renesas/r8a77990-ebisu.dtb
	arch/arm64/boot/dts/renesas/r8a779m1-salvator-xs.dtb
	arch/arm64/boot/dts/renesas/r8a779m1-ulcb.dtb
	arch/arm64/boot/dts/renesas/r8a779m1-ulcb-kf.dtb
	arch/arm64/boot/dts/renesas/r8a779m3-salvator-xs.dtb
	arch/arm64/boot/dts/renesas/r8a779m3-ulcb.dtb
	arch/arm64/boot/dts/renesas/r8a779m3-ulcb-kf.dtb
	arch/arm64/boot/dts/renesas/r8a779m5-salvator-xs.dtb

mmc@ee140000: compatible: 'oneOf' conditional failed, one must be fixed:
	arch/arm64/boot/dts/renesas/r8a779a0-falcon.dtb

mmc@ee140000: Unevaluated properties are not allowed ('iommus' was unexpected)
	arch/arm64/boot/dts/renesas/r8a774e1-beacon-rzg2h-kit.dtb
	arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h.dtb
	arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h-ex.dtb
	arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h-ex-idk-1110wr.dtb
	arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h-ex-mipi-2.1.dtb
	arch/arm64/boot/dts/renesas/r8a77950-salvator-x.dtb
	arch/arm64/boot/dts/renesas/r8a77950-ulcb.dtb
	arch/arm64/boot/dts/renesas/r8a77950-ulcb-kf.dtb
	arch/arm64/boot/dts/renesas/r8a77951-salvator-x.dtb
	arch/arm64/boot/dts/renesas/r8a77951-salvator-xs.dtb
	arch/arm64/boot/dts/renesas/r8a77951-ulcb.dtb
	arch/arm64/boot/dts/renesas/r8a77951-ulcb-kf.dtb
	arch/arm64/boot/dts/renesas/r8a77960-salvator-x.dtb
	arch/arm64/boot/dts/renesas/r8a77960-salvator-xs.dtb
	arch/arm64/boot/dts/renesas/r8a77960-ulcb.dtb
	arch/arm64/boot/dts/renesas/r8a77960-ulcb-kf.dtb
	arch/arm64/boot/dts/renesas/r8a77961-salvator-xs.dtb
	arch/arm64/boot/dts/renesas/r8a77961-ulcb.dtb
	arch/arm64/boot/dts/renesas/r8a77961-ulcb-kf.dtb
	arch/arm64/boot/dts/renesas/r8a77965-salvator-x.dtb
	arch/arm64/boot/dts/renesas/r8a77965-salvator-xs.dtb
	arch/arm64/boot/dts/renesas/r8a77965-ulcb.dtb
	arch/arm64/boot/dts/renesas/r8a77965-ulcb-kf.dtb
	arch/arm64/boot/dts/renesas/r8a77970-eagle.dtb
	arch/arm64/boot/dts/renesas/r8a77970-v3msk.dtb
	arch/arm64/boot/dts/renesas/r8a77980-condor.dtb
	arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dtb
	arch/arm64/boot/dts/renesas/r8a77995-draak.dtb
	arch/arm64/boot/dts/renesas/r8a779a0-falcon.dtb
	arch/arm64/boot/dts/renesas/r8a779m1-salvator-xs.dtb
	arch/arm64/boot/dts/renesas/r8a779m1-ulcb.dtb
	arch/arm64/boot/dts/renesas/r8a779m1-ulcb-kf.dtb
	arch/arm64/boot/dts/renesas/r8a779m3-salvator-xs.dtb
	arch/arm64/boot/dts/renesas/r8a779m3-ulcb.dtb
	arch/arm64/boot/dts/renesas/r8a779m3-ulcb-kf.dtb
	arch/arm64/boot/dts/renesas/r8a779m5-salvator-xs.dtb

mmc@ee160000: Unevaluated properties are not allowed ('iommus' was unexpected)
	arch/arm64/boot/dts/renesas/r8a774e1-beacon-rzg2h-kit.dtb
	arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h.dtb
	arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h-ex.dtb
	arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h-ex-idk-1110wr.dtb
	arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h-ex-mipi-2.1.dtb
	arch/arm64/boot/dts/renesas/r8a77950-salvator-x.dtb
	arch/arm64/boot/dts/renesas/r8a77950-ulcb.dtb
	arch/arm64/boot/dts/renesas/r8a77950-ulcb-kf.dtb
	arch/arm64/boot/dts/renesas/r8a77951-salvator-x.dtb
	arch/arm64/boot/dts/renesas/r8a77951-salvator-xs.dtb
	arch/arm64/boot/dts/renesas/r8a77951-ulcb.dtb
	arch/arm64/boot/dts/renesas/r8a77951-ulcb-kf.dtb
	arch/arm64/boot/dts/renesas/r8a77960-salvator-x.dtb
	arch/arm64/boot/dts/renesas/r8a77960-salvator-xs.dtb
	arch/arm64/boot/dts/renesas/r8a77960-ulcb.dtb
	arch/arm64/boot/dts/renesas/r8a77960-ulcb-kf.dtb
	arch/arm64/boot/dts/renesas/r8a77961-salvator-xs.dtb
	arch/arm64/boot/dts/renesas/r8a77961-ulcb.dtb
	arch/arm64/boot/dts/renesas/r8a77961-ulcb-kf.dtb
	arch/arm64/boot/dts/renesas/r8a77965-salvator-x.dtb
	arch/arm64/boot/dts/renesas/r8a77965-salvator-xs.dtb
	arch/arm64/boot/dts/renesas/r8a77965-ulcb.dtb
	arch/arm64/boot/dts/renesas/r8a77965-ulcb-kf.dtb
	arch/arm64/boot/dts/renesas/r8a77990-ebisu.dtb
	arch/arm64/boot/dts/renesas/r8a779m1-salvator-xs.dtb
	arch/arm64/boot/dts/renesas/r8a779m1-ulcb.dtb
	arch/arm64/boot/dts/renesas/r8a779m1-ulcb-kf.dtb
	arch/arm64/boot/dts/renesas/r8a779m3-salvator-xs.dtb
	arch/arm64/boot/dts/renesas/r8a779m3-ulcb.dtb
	arch/arm64/boot/dts/renesas/r8a779m3-ulcb-kf.dtb
	arch/arm64/boot/dts/renesas/r8a779m5-salvator-xs.dtb

