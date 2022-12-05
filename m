Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39F27642CB9
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Dec 2022 17:25:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231881AbiLEQZM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 5 Dec 2022 11:25:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230133AbiLEQZL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Dec 2022 11:25:11 -0500
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8E151DA50;
        Mon,  5 Dec 2022 08:25:10 -0800 (PST)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-1447c7aa004so5898368fac.11;
        Mon, 05 Dec 2022 08:25:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nazdpu5NA/yzv3brewocclL6XUkEccB3TGTof1h3fCI=;
        b=pqr6TerEjhxOsLOA6E16VhQsdWP6jIe9KPle/Or1vvMlaSdGtFJHYYWrwnIp0gG9Jy
         NFN5G2Z21slpsbclrh2vL3AD29T1qHrHDitIL7M8/V63vDRBEwCHnz3sME7H91Hhd9HJ
         vNKChNEZY9aVQgWq/uxBNGCKaKyEgcthb7+Li9imRUD3icSA2ngJZgqHb+dyGfobNjE8
         kZ5pWMgo1+UANmh8nn6pcIgnqMwYwyn+3h1salcQxSbHduQ3lHa+HJotMwAchKNJ4eRd
         SV0UeZWdydFKc834sgPi8DX6j7C4FmVQltsHBIgG6DOeuNjRxEMoPdDFkXMwqL5Itt68
         NfUw==
X-Gm-Message-State: ANoB5plHgbzfr5ceDmB0CvHGrPvNkNr7PxeTUm77z7ODFwV827iocC03
        PDJHLmD5mOforLDP7gFNfA==
X-Google-Smtp-Source: AA0mqf6b9a/2JVjrHrs9gtn3XTd/wBdw4WAOH5TxXmqIUyBPNjYrVJzgOxwTiw3L4gZ04JUs5qgfpg==
X-Received: by 2002:a05:6871:60d:b0:144:514c:434d with SMTP id w13-20020a056871060d00b00144514c434dmr6527676oan.50.1670257509908;
        Mon, 05 Dec 2022 08:25:09 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id c14-20020a9d784e000000b0066e83a74b99sm5026643otm.35.2022.12.05.08.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 08:25:09 -0800 (PST)
Received: (nullmailer pid 2023663 invoked by uid 1000);
        Mon, 05 Dec 2022 16:25:08 -0000
Date:   Mon, 5 Dec 2022 10:25:08 -0600
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Tudor Ambarus <tudor.ambarus@microchip.com>,
        Pratyush Yadav <pratyush@kernel.org>,
        Michael Walle <michael@walle.cc>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mtd: jedec,spi-nor: Document support for
 more MT25QU parts
Message-ID: <20221205162508.GA2012644-robh@kernel.org>
References: <363186079b4269891073f620e3e2353cf7d2559a.1669988238.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <363186079b4269891073f620e3e2353cf7d2559a.1669988238.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Dec 02, 2022 at 02:37:58PM +0100, Geert Uytterhoeven wrote:
> Document support for the Micron MT25QU256A and MT25QU512A Serial NOR
> FLASHes.
> 
> Merge the new entries with the existing entry for MT25QU02G.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> mt25qu512a is already in active use, causing "make dtbs_check" errors.
> mt25qu256a is supported by the Linux spi-nor driver, but there are no
> upstream users yet.
> ---
>  Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> index 6cc491083650a0f9..92f65f682059a6ea 100644
> --- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> +++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> @@ -19,6 +19,7 @@ properties:
>        - items:
>            - pattern: "^((((micron|spansion|st),)?\
>                (m25p(40|80|16|32|64|128)|\
> +              mt25qu(02g|256a|512a)|\

Let's not add new cases where the vendor is optional.

>                n25q(32b|064|128a11|128a13|256a|512a|164k)))|\
>                atmel,at25df(321a|641|081a)|\
>                everspin,mr25h(10|40|128|256)|\
> @@ -34,7 +35,6 @@ properties:
>        - items:
>            - enum:
>                - issi,is25lp016d
> -              - micron,mt25qu02g
>                - mxicy,mx25r1635f
>                - mxicy,mx25u6435f
>                - mxicy,mx25v8035f
> -- 
> 2.25.1
> 
> 
