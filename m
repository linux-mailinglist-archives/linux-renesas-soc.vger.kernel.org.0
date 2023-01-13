Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A77666A46E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Jan 2023 21:50:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230138AbjAMUua (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 13 Jan 2023 15:50:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229824AbjAMUu3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Jan 2023 15:50:29 -0500
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E92F25F1;
        Fri, 13 Jan 2023 12:50:28 -0800 (PST)
Received: by mail-ot1-f51.google.com with SMTP id f88-20020a9d03e1000000b00684c4041ff1so3174382otf.8;
        Fri, 13 Jan 2023 12:50:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MmwP4Rb8WrG4OWWaTcP5VsoJGDs2z5alc36kX9a7U9I=;
        b=OI5jqFj6UwtDlc7/6P6GUbxoA1JDja6iNmYNLkVMA7VJI9RVMegmvO/hei/UlI2qpk
         0nT3DtVMWumqFO7MjIsBvJvwyPpUayd/ztnHLkYfpbru9yYZ5SRXdSx57R25IOsqrjLo
         kEANcmnOZvD8ea2gNqj7l9yomRVolF85/9O05N4hnVzc0aDTdiABUMQrxO1sT4doe4Nj
         blT7xO3YPgTQwQs0pXNTkeMrlIgPtWy6X8xCn/jYsRbuiDD6nibkIaIDS+/ldSn4zZdH
         l5eJsOKfc95sXJvV8zVVkA2DAZhRkbaOVe9KxPPB0LHwaG+GjjBM3ZB/dgdOMR1p6bs/
         U9Hg==
X-Gm-Message-State: AFqh2kpfgm7ZjzRq5OpOoh0M7PdBm+nJ0FdCBxmKLCADEKtrAaSm8+2a
        6hd+0yXZP4ltUCCLuw/M0w==
X-Google-Smtp-Source: AMrXdXtE672Vr5u0elEAemBVLmKQpsd8BXIQuPwwqLt59Janh1pugciZXo8pMOkb7P5S7DfkktUGoQ==
X-Received: by 2002:a9d:7604:0:b0:66d:68ab:2882 with SMTP id k4-20020a9d7604000000b0066d68ab2882mr35631756otl.11.1673643027682;
        Fri, 13 Jan 2023 12:50:27 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id x88-20020a9d37e1000000b00684ba33a544sm3805798otb.65.2023.01.13.12.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 12:50:27 -0800 (PST)
Received: (nullmailer pid 2897447 invoked by uid 1000);
        Fri, 13 Jan 2023 20:50:26 -0000
Date:   Fri, 13 Jan 2023 14:50:26 -0600
From:   Rob Herring <robh@kernel.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-usb@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 04/12] dt-bindings: usb: Add RZ/V2M USB3DRD binding
Message-ID: <167364302614.2897398.6929450863005255935.robh@kernel.org>
References: <20230112215906.494394-1-biju.das.jz@bp.renesas.com>
 <20230112215906.494394-5-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230112215906.494394-5-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


On Thu, 12 Jan 2023 21:58:58 +0000, Biju Das wrote:
> Add device tree bindings for the RZ/V2{M, MA} USB3DRD module.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Added DRD interrupts and interrupt-names
>  * Dropped peripheral reset and reset-names
>  * Added reg property for usb3 device ctrlr
>  * Renamed peri_axi->axi and apb->reg
>  * Updated pattern properties and example.
> ---
>  .../bindings/usb/renesas,rzv2m-usb3drd.yaml   | 129 ++++++++++++++++++
>  1 file changed, 129 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/renesas,rzv2m-usb3drd.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
