Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F28A52962F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 May 2022 02:51:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231331AbiEQAvS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 May 2022 20:51:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229885AbiEQAvQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 May 2022 20:51:16 -0400
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7457415FF7;
        Mon, 16 May 2022 17:51:15 -0700 (PDT)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-f189b07f57so8917830fac.1;
        Mon, 16 May 2022 17:51:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BN4iM9sQbJEV3JEbs6Nxmd/DqEFeyh4AGc2qP9BhUps=;
        b=Xy8PrIobRMpoxpyOUmwzhrDGks57OwlBVztCdxOfE3HT4wXIRUvI/9NjCVQ2UH/dPJ
         glGZP7zRBp3UAdsbHx1X0MGcY3e+ArATjqE8crRGVUaoFDxljUUWJWBE7kgw5YjWj0uc
         bdFHPTiEv86SzAHS1Pf1stfIHWj1RRaPSrTnI/P3vgVRypxPU98Iy5Ft+feg7+rqMETl
         fVgt15DstOtFrZnsMMHyG+B1l8UBRN/KnTrTDPbKPLBUfMEjrOYhei/O7Z6wJB76lOUx
         31C9qU3L4TBSr5pZ/3KO4M7t7oeq3UUW0kZyzdlFf0eXvja929pT+RzAIgXWt5Koo6Af
         NJrQ==
X-Gm-Message-State: AOAM533ASn01P+jKHo/IKFK7D4J3C3XSwFoHM+ydHMkvjPpGqsueTr+R
        KbJgJM0Wd0hTte8/xkfnXw==
X-Google-Smtp-Source: ABdhPJyBYMgt9qDgNwOKWlMSsg9Hins9woDar0FSMx89U7YzHjdTwYL0S9eYbYUUCjOUN8uMnjFa+w==
X-Received: by 2002:a05:6870:b620:b0:f1:8837:ecd0 with SMTP id cm32-20020a056870b62000b000f18837ecd0mr6844838oab.22.1652748674772;
        Mon, 16 May 2022 17:51:14 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id f27-20020a056830309b00b0060603221268sm124759ots.56.2022.05.16.17.51.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 May 2022 17:51:14 -0700 (PDT)
Received: (nullmailer pid 3690141 invoked by uid 1000);
        Tue, 17 May 2022 00:51:13 -0000
Date:   Mon, 16 May 2022 19:51:13 -0500
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Bastian Hecht <hechtb@googlemail.com>,
        linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH/RFC] dt-bindings: mtd: Remove Renesas FLCTL NAND
 controller support
Message-ID: <20220517005113.GA3685447-robh@kernel.org>
References: <ef70e24a57d2342458fe11b7b13775ffac1f1bd0.1652098726.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ef70e24a57d2342458fe11b7b13775ffac1f1bd0.1652098726.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, May 09, 2022 at 02:27:52PM +0200, Geert Uytterhoeven wrote:
> The DT bindings for the Renesas FLCTL NAND controller document only support a
> single SoC, namely the Renesas R-Mobile AP4 (SH7372).
> Linux dropped support for this SoC in commit 59b89af1d5551c12 ("ARM:
> shmobile: sh7372: Remove Legacy C SoC code") in v4.1.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> The FLCTL NAND controller (or an enhanced version) is also present on
> SH-Mobile AG5 (sh73a0) and R-Mobile A1 (r8a7740), but the sole boards
> supported upstream (KMC KZM-A9-GT resp. Atmark Techno Armadillo-800-EVA)
> use eMMC NAND instead of raw NAND FLASH.
> 
> What's the policy w.r.t. stale DT bindings?
> Should it be converted to json-schema instead?

Wouldn't be high on my list.

> drivers/mtd/nand/raw/sh_flctl.c still implements these bindings.
> The driver cannot be removed, as it is also used on the non-DT
> SH7723-based AP-325RXA platform.

But you could remove the DT support in the driver? I'd just leave this 
as-is if you don't do that.

Rob
