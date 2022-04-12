Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE4B34FE47F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Apr 2022 17:18:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244498AbiDLPVH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 12 Apr 2022 11:21:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230387AbiDLPVH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Apr 2022 11:21:07 -0400
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB81351310;
        Tue, 12 Apr 2022 08:18:48 -0700 (PDT)
Received: by mail-oi1-f182.google.com with SMTP id z8so19353621oix.3;
        Tue, 12 Apr 2022 08:18:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=/eBgFE3+v/JrgJ5QVL8qFdJ6/l7Z8S1/IKP48UxbtWo=;
        b=ls7X4uYhL0muTyQhMSs7Qufo2eYX8odsu/FojTXBhoIJyJL82pGzhoTqwmz2YSJCRr
         oYN/okKN1BrPJdEZifCb5atkCShtgk76a1/E3YwSy28wRqPsnO3fuE1/pkVP+7S2FVPn
         zxrrz0bDhnXVR/XpGJ424wtseC6dxEEPt2J0z51Tvb/4E+ZL8qcoeRqJMzmgoaE2/hQe
         KPNh64rw49zp9VUbYL660Y//5mlPlkUNyfC7s3nOOP6wzt8kbzbwyCng1wOyH7YG0tct
         1kdOn01gOQi+SoLZyuEVGBBXCR11AoAe69HM+76Ar8o4UqnCUclIdlJu0q2lTZBt98qo
         AxUg==
X-Gm-Message-State: AOAM531zE8/uFNDAjbAX0p7kb0Mwrjc3SN27QV/KoR2Jl76cqE9/70St
        zM8v406h/dQvIBD4j0riUA==
X-Google-Smtp-Source: ABdhPJyhKXRe59NFPqeMmqRnlhkDQBioD3JKtpkLbkyl0UQaJoPM2GaohHKpRpBQWOhFsxpPdeFLLw==
X-Received: by 2002:a05:6808:300f:b0:2f9:81c1:7691 with SMTP id ay15-20020a056808300f00b002f981c17691mr2018771oib.208.1649776728229;
        Tue, 12 Apr 2022 08:18:48 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id r10-20020a056830448a00b005c9344dac06sm13770640otv.19.2022.04.12.08.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 08:18:47 -0700 (PDT)
Received: (nullmailer pid 224541 invoked by uid 1000);
        Tue, 12 Apr 2022 15:18:47 -0000
From:   Rob Herring <robh@kernel.org>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     martin.petersen@oracle.com, avri.altman@wdc.com,
        alim.akhtar@samsung.com, linux-scsi@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, krzk+dt@kernel.org, jejb@linux.ibm.com
In-Reply-To: <20220412073647.3808493-2-yoshihiro.shimoda.uh@renesas.com>
References: <20220412073647.3808493-1-yoshihiro.shimoda.uh@renesas.com> <20220412073647.3808493-2-yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH 1/7] dt-bindings: ufs: Document Renesas R-Car UFS host controller
Date:   Tue, 12 Apr 2022 10:18:47 -0500
Message-Id: <1649776727.144250.224540.nullmailer@robh.at.kernel.org>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, 12 Apr 2022 16:36:41 +0900, Yoshihiro Shimoda wrote:
> Document Renesas R-Car UFS host controller for R-Car S4-8 (r8a779f0).
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  .../devicetree/bindings/ufs/renesas,ufs.yaml  | 63 +++++++++++++++++++
>  1 file changed, 63 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/ufs/renesas,ufs.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/ufs/renesas,ufs.yaml: properties:clock-names: {'maxItems': 2, 'items': [{'const': 'fck'}, {'const': 'ref_clk'}]} should not be valid under {'required': ['maxItems']}
	hint: "maxItems" is not needed with an "items" list
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/ufs/renesas,ufs.yaml: ignoring, error in schema: properties: clock-names
Documentation/devicetree/bindings/ufs/renesas,ufs.example.dtb:0:0: /example-0/scsi@e686000: failed to match any schema with compatible: ['renesas,r8a779f0-ufs']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

