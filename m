Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F00364A96A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Dec 2022 22:18:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233238AbiLLVSr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 12 Dec 2022 16:18:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233574AbiLLVSV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Dec 2022 16:18:21 -0500
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4807E9596;
        Mon, 12 Dec 2022 13:17:43 -0800 (PST)
Received: by mail-oi1-f172.google.com with SMTP id v82so12471874oib.4;
        Mon, 12 Dec 2022 13:17:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5i3OUjIfqgpyWppxSNZ/0sQhPXWrsfvFFv33+eGTUl4=;
        b=xkdIkh01XL3IPla8T1y5AODCOrMR0+Dpcl7jQceuBqsaMXjkfuckMiVz3dqY8V1zbf
         yVXKWLJkmXVsitAz818K4m5p9XtuNt25dU97mjr0P7cSM2HJqdnbqP5YqvKJ04/3Lel3
         oSbyoV/K44XF/63RLSh3H6HmMfOzuYCQnnv/Wn7cyFAQQ37gfxG8dB8H6IQYhTLCGaXq
         o6x1nEb0BFkYscmY97kaFXLsYZlhzKzZNlPF2XUOfMbp+wQby4OVD/BFNkYdXDrp8fN2
         2GZrZuFuGM2cYkhJt1+tyYh8ujOAmZqya3OuQ1LmWzykLmaTabpoO4Y/sbiJ22EDiACA
         Hm1g==
X-Gm-Message-State: ANoB5plMNEiqTi1YnUduD4pN+fMWPSOr11AsJ3iajMFoEM74FMP0zY6t
        S52NyOn1fgv8xn1Y8aIeXg==
X-Google-Smtp-Source: AA0mqf4+AKSiMJMkNJ6/wMjadMR4/AaXI94WHnBBeADPelFXDpvkXG1yHfFrwDbRA398jUaokJufjw==
X-Received: by 2002:a05:6808:a9c:b0:35c:1301:3ec6 with SMTP id q28-20020a0568080a9c00b0035c13013ec6mr6822938oij.28.1670879862511;
        Mon, 12 Dec 2022 13:17:42 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id j11-20020a056808034b00b00354d8589a15sm3875940oie.45.2022.12.12.13.17.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Dec 2022 13:17:42 -0800 (PST)
Received: (nullmailer pid 1545272 invoked by uid 1000);
        Mon, 12 Dec 2022 21:17:41 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From:   Rob Herring <robh@kernel.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-renesas-soc@vger.kernel.org, linux-usb@vger.kernel.org
In-Reply-To: <20221212172804.1277751-3-biju.das.jz@bp.renesas.com>
References: <20221212172804.1277751-1-biju.das.jz@bp.renesas.com>
 <20221212172804.1277751-3-biju.das.jz@bp.renesas.com>
Message-Id: <167087981089.1543932.15032317950577945818.robh@kernel.org>
Subject: Re: [PATCH 02/16] dt-bindings: usb: Add RZ/V2M USB3DRD binding
Date:   Mon, 12 Dec 2022 15:17:41 -0600
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


On Mon, 12 Dec 2022 17:27:50 +0000, Biju Das wrote:
> Add device tree bindings for the RZ/V2{M, MA} USB3DRD module.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  .../bindings/usb/renesas,rzv2m-usb3drd.yaml   | 123 ++++++++++++++++++
>  1 file changed, 123 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/renesas,rzv2m-usb3drd.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/usb/renesas,rzv2m-usb3drd.example.dtb: usb@85070000: usb3peri:resets: [[4294967295, 29]] is too short
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/usb/renesas,rzv2m-usb3drd.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/usb/renesas,rzv2m-usb3drd.example.dtb: usb@85070000: usb3peri: 'reset-names' is a required property
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/usb/renesas,rzv2m-usb3drd.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/usb/renesas,rzv2m-usb3drd.example.dtb: usb@85070000: usb@85060000:compatible: 'oneOf' conditional failed, one must be fixed:
	'renesas,r9a09g011-xhci' is not one of ['renesas,xhci-r8a7742', 'renesas,xhci-r8a7743', 'renesas,xhci-r8a7744', 'renesas,xhci-r8a7790', 'renesas,xhci-r8a7791', 'renesas,xhci-r8a7793']
	'renesas,r9a09g011-xhci' is not one of ['renesas,xhci-r8a774a1', 'renesas,xhci-r8a774b1', 'renesas,xhci-r8a774c0', 'renesas,xhci-r8a774e1', 'renesas,xhci-r8a7795', 'renesas,xhci-r8a7796', 'renesas,xhci-r8a77961', 'renesas,xhci-r8a77965', 'renesas,xhci-r8a77990']
	'renesas,rcar-gen2-xhci' was expected
	'renesas,rcar-gen3-xhci' was expected
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/usb/renesas,rzv2m-usb3drd.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/usb/renesas,rzv2m-usb3drd.example.dtb: usb@85070000: usb@85060000:clocks: [[4294967295, 1, 34], [4294967295, 1, 36]] is too long
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/usb/renesas,rzv2m-usb3drd.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/usb/renesas,rzv2m-usb3drd.example.dtb: usb@85070000: usb@85060000: Unevaluated properties are not allowed ('clock-names', 'clocks', 'compatible' were unexpected)
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/usb/renesas,rzv2m-usb3drd.yaml
Documentation/devicetree/bindings/usb/renesas,rzv2m-usb3drd.example.dtb:0:0: /example-0/usb@85070000/usb@85060000: failed to match any schema with compatible: ['renesas,r9a09g011-xhci', 'renesas,rzv2m-xhci']
Documentation/devicetree/bindings/usb/renesas,rzv2m-usb3drd.example.dtb:0:0: /example-0/usb@85070000/usb@85060000: failed to match any schema with compatible: ['renesas,r9a09g011-xhci', 'renesas,rzv2m-xhci']
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/usb/renesas,rzv2m-usb3drd.example.dtb: usb3peri: resets: [[4294967295, 29]] is too short
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/usb/renesas,usb3-peri.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/usb/renesas,rzv2m-usb3drd.example.dtb: usb3peri: 'reset-names' is a required property
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/usb/renesas,usb3-peri.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20221212172804.1277751-3-biju.das.jz@bp.renesas.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

