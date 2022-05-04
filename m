Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0E8351AF22
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 May 2022 22:31:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235653AbiEDUfS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 4 May 2022 16:35:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234671AbiEDUfR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 May 2022 16:35:17 -0400
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF4AE4D9E0;
        Wed,  4 May 2022 13:31:40 -0700 (PDT)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-e9027efe6aso2359363fac.10;
        Wed, 04 May 2022 13:31:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+GJhEibm6sfq+JdSCxkElhUgA8eadFPm7j/iCqOF+VM=;
        b=pvWqSWcOEqXFlb3G/HckPRXo/jvlmKcssEOkrz5AcltgnCIes0zjAIzqpnpc45kUAI
         nNubQvd+U1SY+jBJFEArFRzEyZemSzYLhATBrkiBoZmU5z0KxPG1+6/YPhAzY0hq2BaU
         kUiyVCmcmcvr6Bqavns3PyBcHWhAfOmBOCBp1pmzSpvD3qUhdt/ABa5xGvItiyewnpl9
         qr9nza9kZWWoRF0hZJuNBlUuj787rNDdS1DFl2Ql+VDOvqHTMkfKlHYefuzPYLEbALI0
         pX3piT5fTlfdFj47EjFvxfaj/C2xvSlVfIHF4yWMM7c97HDk1HZZ1YdGt3+Hel/wbucg
         j05w==
X-Gm-Message-State: AOAM533Q9JDrjGnQuMbcJMDX3xZQED13bJKV1paQdbwAa4GGvzTb95mO
        k/2wweWeSnTYHQLSmzb4zA==
X-Google-Smtp-Source: ABdhPJzf5wa3VE2Z7BWReg5pDcHZOn+75YroPHZGKL5Xku3QI4YKBc2pheB/DFPOUbdniXBgUoIFhw==
X-Received: by 2002:a05:6870:a788:b0:de:c1c1:ac07 with SMTP id x8-20020a056870a78800b000dec1c1ac07mr690242oao.68.1651696300163;
        Wed, 04 May 2022 13:31:40 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id z12-20020a056808064c00b00325cda1ffb8sm4665980oih.55.2022.05.04.13.31.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 13:31:39 -0700 (PDT)
Received: (nullmailer pid 2175935 invoked by uid 1000);
        Wed, 04 May 2022 20:31:38 -0000
Date:   Wed, 4 May 2022 15:31:38 -0500
From:   Rob Herring <robh@kernel.org>
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Pratyush Yadav <p.yadav@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-mtd@lists.infradead.org,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        devicetree@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>,
        Tudor Ambarus <Tudor.Ambarus@microchip.com>,
        linux-renesas-soc@vger.kernel.org,
        Richard Weinberger <richard@nod.at>,
        Michael Walle <michael@walle.cc>
Subject: Re: [PATCH 1/3] dt-bindings: mtd: renesas: Fix the NAND controller
 description
Message-ID: <YnLiqlWKriAAlszN@robh.at.kernel.org>
References: <20220429105229.368728-1-miquel.raynal@bootlin.com>
 <20220429105229.368728-2-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220429105229.368728-2-miquel.raynal@bootlin.com>
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

On Fri, 29 Apr 2022 12:52:27 +0200, Miquel Raynal wrote:
> Add the missing power-domain property which is needed on all the
> RZ/N1 SoC IPs.
> 
> Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  Documentation/devicetree/bindings/mtd/renesas-nandc.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
