Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94A826FC9C1
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 May 2023 17:00:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236011AbjEIPAR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 9 May 2023 11:00:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236007AbjEIPAP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 May 2023 11:00:15 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E42A3A97
        for <linux-renesas-soc@vger.kernel.org>; Tue,  9 May 2023 08:00:11 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-966287b0f72so627833066b.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 09 May 2023 08:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683644409; x=1686236409;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0QnnmW4wO2bBCex56QFAzIqgByYC00TFwSXpI3BM7bw=;
        b=ZIV614GOv8jAGJDLA81goCU+uqhJ/dWFazaRw8XXliyUs6eO+Yu7jI0fytq731db+8
         7M6pglSrNfZZ4kp9+kZInwUQf7zTTP3rHjs7XXTYzqxID6hKXvvZlI7S0frLGs6QnYkl
         pguDTR03XWBB7xlCk0WXh+5o31KLJXsbI7m/LnfVPdfhPK2znvWADYxwXTAfeE2S3VOg
         Mc+HNAdWiST9D8I9EJthI9830hlzs0zDMF6Et1C3Y55PHrSQoaw+TUq6R68sW9WnbuNe
         9m0viqVPS+Uu9diTQDUF4ss3j+sksmgKsjEhQhuFO1pUhmRWzapAw82dnumSNdYDFRI1
         PrTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683644409; x=1686236409;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0QnnmW4wO2bBCex56QFAzIqgByYC00TFwSXpI3BM7bw=;
        b=JwvspWayHKqTbP8zEDcxept1WiDzyEWsj8UPGCX0VZrz5HoiBdDZIQv4FrzVWh4eS0
         4YWWRK+EOn/zaf3GR1VrSTF86pWl2ZqjO/tjqJLhNG/YETAPye1fSjjPE69a4HSW0q+h
         nr2LPzw0rlJvx7qDOXaalWZW/s80AkjW4x2/gfJTJIRAxk73/JEgD7EW0DElsG6nfzjI
         FreQYvQdObTnl3ZKNzvuoCDD6GS667RGqcdWM7PzPcLIVfZsgpxZNLNXKX2h0FNC8lDN
         ThIaLzJU1qa3v0IoMhc/l+BJw5WoZOt+GQZKKJ+YgY1VvUtTLxdKReSGXNLHV2rMC24h
         b/2w==
X-Gm-Message-State: AC+VfDyeIEa23xczdx5yQcSZL6WI9f9D3DwSdeW3GNqXPIrt/QP/sQk1
        XiS3rXArXsAO2orj+MNr140uTQ==
X-Google-Smtp-Source: ACHHUZ5LmyVvkJty/e4wJLoGs3l/ibKZqBJEB07OZRKHzos5jAJ5N8snkFmRL/OqZDsSyVb4HlQCGQ==
X-Received: by 2002:a17:906:99c4:b0:94e:cf98:32f2 with SMTP id s4-20020a17090699c400b0094ecf9832f2mr14587357ejn.33.1683644409537;
        Tue, 09 May 2023 08:00:09 -0700 (PDT)
Received: from krzk-bin ([2a02:810d:15c0:828:d0d5:7818:2f46:5e76])
        by smtp.gmail.com with ESMTPSA id ze11-20020a170906ef8b00b00965b0eb7b0csm1408612ejb.103.2023.05.09.08.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 08:00:09 -0700 (PDT)
Date:   Tue, 9 May 2023 17:00:06 +0200
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     gustavo.pimentel@synopsys.com, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, bhelgaas@google.com,
        Rob Herring <robh@kernel.org>, marek.vasut+renesas@gmail.com,
        jingoohan1@gmail.com, fancer.lancer@gmail.com,
        lpieralisi@kernel.org, kw@linux.com, robh+dt@kernel.org,
        linux-renesas-soc@vger.kernel.org, kishon@kernel.org,
        mani@kernel.org
Subject: Re: [PATCH v15 17/22] dt-bindings: PCI: renesas: Add R-Car Gen4 PCIe
 Host
Message-ID: <20230509150006.fibburboyharlamb@krzk-bin>
References: <20230509124156.150200-1-yoshihiro.shimoda.uh@renesas.com>
 <20230509124156.150200-18-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230509124156.150200-18-yoshihiro.shimoda.uh@renesas.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, 09 May 2023 21:41:51 +0900, Yoshihiro Shimoda wrote:
> Document bindings for Renesas R-Car Gen4 and R-Car S4-8 (R8A779F0)
> PCIe host module.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Serge Semin <fancer.lancer@gmail.com>
> ---
>  .../bindings/pci/rcar-gen4-pci-host.yaml      | 109 ++++++++++++++++++
>  1 file changed, 109 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pci/rcar-gen4-pci-host.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/rcar-gen4-pci-host.example.dtb: pcie@e65d0000: reg: [[0, 3864854528, 0, 4096], [0, 3864862720, 0, 2048], [0, 3864866816, 0, 8192], [0, 3864875008, 0, 4608], [0, 3864879616, 0, 3584], [0, 4261412864, 0, 4194304]] is too long
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/rcar-gen4-pci-host.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/rcar-gen4-pci-host.example.dtb: pcie@e65d0000: reg-names: ['dbi', 'dbi2', 'atu', 'dma', 'app', 'config'] is too long
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/rcar-gen4-pci-host.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/rcar-gen4-pci-host.example.dtb: pcie@e65d0000: Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'dma-ranges', 'interrupt-map', 'interrupt-map-mask', 'ranges', 'snps,enable-cdm-check' were unexpected)
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/rcar-gen4-pci-host.yaml

See https://patchwork.ozlabs.org/patch/1778968

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.
