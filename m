Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 145DF580802
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Jul 2022 01:11:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235324AbiGYXL0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 25 Jul 2022 19:11:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237097AbiGYXLX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Jul 2022 19:11:23 -0400
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 679B913E3F;
        Mon, 25 Jul 2022 16:11:21 -0700 (PDT)
Received: by mail-oo1-f51.google.com with SMTP id j1-20020a4ab1c1000000b0043576bcb9b1so2432864ooo.10;
        Mon, 25 Jul 2022 16:11:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=VNdXVWht5zzjHjVhQhSusKUMhE8ELd1CfgAT3RGumig=;
        b=koHoDSfNCxBxtS1VCZepXqbEIg7uQ+AM7mwq79lWBeI5CunmoGontUp/zZmNx2Y0ud
         sNA0UpzT9e6deLDVcEmCDNt52ATi3wrFLS3qUtqWE6pmam1quckFQz4sw7F6UQ/WaNa8
         pzBj1OZ/BtHVL14MqSiiEHQhKKar8QLcU2Pr/SxGBYXl1di837hykblNj3CZJRwoCHnc
         5HmFxdEazyBqjlt5oTAKF78pRZGU8mgwpnXOORtC4P/ebysr2ZkUeIrIzV1bhB7KZVqI
         207z0cKpdaFHO+ejTQDNZB4GB1tYrAJ560NampQMfHrqsqHYLXEYr62mjiQPuNP6/bBY
         HXNQ==
X-Gm-Message-State: AJIora+Le6JrgK25NEuqHc8RRdE25up1TANE6Jti4tUyF/4BctjSbLLW
        w82QTLZeBQShKBaZUxt0Pw==
X-Google-Smtp-Source: AGRyM1t/aV8rKVmSzFYaQ2SEStr6U2W+xOIy+oVghT1U75c1dg0LahG8eURVPT/HXUpAh5ssvQ3zgQ==
X-Received: by 2002:a4a:6550:0:b0:435:f3e8:8d3e with SMTP id z16-20020a4a6550000000b00435f3e88d3emr926118oog.13.1658790680687;
        Mon, 25 Jul 2022 16:11:20 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id f97-20020a9d2c6a000000b0061c87262540sm5419037otb.65.2022.07.25.16.11.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jul 2022 16:11:20 -0700 (PDT)
Received: (nullmailer pid 2927686 invoked by uid 1000);
        Mon, 25 Jul 2022 23:11:18 -0000
Date:   Mon, 25 Jul 2022 17:11:18 -0600
From:   Rob Herring <robh@kernel.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     dri-devel@lists.freedesktop.org,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Biju Das <biju.das@bp.renesas.com>,
        David Airlie <airlied@linux.ie>
Subject: Re: [PATCH v4 1/2] dt-bindings: display: Document Renesas RZ/G2L DU
 bindings
Message-ID: <20220725231118.GA2927653-robh@kernel.org>
References: <20220722191353.544516-1-biju.das.jz@bp.renesas.com>
 <20220722191353.544516-2-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220722191353.544516-2-biju.das.jz@bp.renesas.com>
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

On Fri, 22 Jul 2022 20:13:52 +0100, Biju Das wrote:
> The RZ/G2L LCD controller is composed of Frame Compression Processor
> (FCPVD), Video Signal Processor (VSPD), and Display Unit (DU).
> 
> The DU module supports the following hardware features
> − Display Parallel Interface (DPI) and MIPI LINK Video Interface
> − Display timing master
> − Generates video timings
> − Selecting the polarity of output DCLK, HSYNC, VSYNC, and DE
> − Supports Progressive
> − Input data format (from VSPD): RGB888, RGB666
> − Output data format: same as Input data format
> − Supporting Full HD (1920 pixels x 1080 lines) for MIPI-DSI Output
> − Supporting WXGA (1280 pixels x 800 lines) for Parallel Output
> 
> This patch document DU module found on RZ/G2L LCDC.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v3->v4:
>  * Changed compatible name from renesas,du-r9a07g044->renesas,r9a07g044-du
>  * started using same compatible for RZ/G2{L,LC}
> v3: New patch
> ---
>  .../bindings/display/renesas,rzg2l-du.yaml    | 124 ++++++++++++++++++
>  1 file changed, 124 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
