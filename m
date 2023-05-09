Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 884F16FC9BD
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 May 2023 17:00:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236016AbjEIPAA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 9 May 2023 11:00:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236039AbjEIO7y (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 May 2023 10:59:54 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D1444213
        for <linux-renesas-soc@vger.kernel.org>; Tue,  9 May 2023 07:59:46 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-50db91640d3so1427365a12.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 09 May 2023 07:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683644385; x=1686236385;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4QNDxAVS06GoP8n0KEV2fuwot1jbwReZl6TObJkeWW8=;
        b=tgOA/BzGg7NIvWl+ja6MXP0aRmdKRQ2MFnc4qC0ePu6IyInQ+hRMt536mhXTZQg16u
         414lgluARDnUtXmyV6UB5E6yS2SbkIOEX8mQDM6kqhJUVTvREqA6JzfU3W6LmmT8YmkA
         ntUyiDcqhvGMwECvxw4VWEjKfnL4OHXZpmIywEpqOiWP7c6oJ7UNK7xf/9FEdk5/+BeD
         ZEXXvYdLnLkK/UDCMiIFgEe9bfniHjlyDA4vzx/dp5/yHqophpF9IuUA+imWlx2jKqvE
         20a5T9i0+QbwrLoB2SnbXxx07g/xuaTv4BbcIhIUTvooXEs/xwx2I/ezL5oiI7IYGmSZ
         7P/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683644385; x=1686236385;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4QNDxAVS06GoP8n0KEV2fuwot1jbwReZl6TObJkeWW8=;
        b=H9fmHKHccQvgn24v1JSJxBlrdZmqlBA7mdnm+4EWjA+I9GApc6m+dqVmCHN1LQiA6S
         2G7S4Y3S6gRhyzZB83JPFFf745aQAvyKLluaobTwEI1lk5o5MHfZ2zEJbwcuMxOMXKa6
         nqXSGiutMAZQTBqq3JLP9dVZazXVyczFzuN/3uL8K0S1DHN5RjAlTzmyD7GtPUYnNFkG
         2CT7xMTcjSsO2WhLKBMC/qk3PPguopU3rblGyTzIRgM3x//JkroZSKlb1DNrWBMQvG3z
         8tNg0geov3MBJStGXFo6tNLd3HC9guIu2tr2OZ6r9xcCzWepm1Hd/MQrqM6TAbObhh9U
         7HEA==
X-Gm-Message-State: AC+VfDxbbxdpaqRU38MPCAEV0WnwygLD9wQEET7YK/7AIiXHpigx1k3t
        1Bv8u6JUz3d8gNP2ZknDzdaHpg==
X-Google-Smtp-Source: ACHHUZ6RwtSzlLFYAI5Co0N7WtvO4uMob8fwCoJvbTWu04mwg+/50zIjVbGWE8j++UCzlCUqrogIyw==
X-Received: by 2002:a17:906:dc93:b0:94f:a292:20cc with SMTP id cs19-20020a170906dc9300b0094fa29220ccmr13024161ejc.41.1683644384843;
        Tue, 09 May 2023 07:59:44 -0700 (PDT)
Received: from krzk-bin ([2a02:810d:15c0:828:d0d5:7818:2f46:5e76])
        by smtp.gmail.com with ESMTPSA id hz17-20020a1709072cf100b009664e25c425sm1435917ejc.95.2023.05.09.07.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 07:59:44 -0700 (PDT)
Date:   Tue, 9 May 2023 16:59:42 +0200
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     mani@kernel.org, bhelgaas@google.com,
        Rob Herring <robh@kernel.org>, robh+dt@kernel.org,
        kw@linux.com, fancer.lancer@gmail.com,
        marek.vasut+renesas@gmail.com, jingoohan1@gmail.com,
        linux-pci@vger.kernel.org, gustavo.pimentel@synopsys.com,
        lpieralisi@kernel.org, kishon@kernel.org,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v15 18/22] dt-bindings: PCI: renesas: Add R-Car Gen4 PCIe
 Endpoint
Message-ID: <20230509145942.t7gzybnr2yeepzex@krzk-bin>
References: <20230509124156.150200-1-yoshihiro.shimoda.uh@renesas.com>
 <20230509124156.150200-19-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230509124156.150200-19-yoshihiro.shimoda.uh@renesas.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, 09 May 2023 21:41:52 +0900, Yoshihiro Shimoda wrote:
> Document bindings for Renesas R-Car Gen4 and R-Car S4-8 (R8A779F0)
> PCIe endpoint module.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Serge Semin <fancer.lancer@gmail.com>
> Acked-by: Manivannan Sadhasivam <mani@kernel.org>
> ---
>  .../bindings/pci/rcar-gen4-pci-ep.yaml        | 98 +++++++++++++++++++
>  1 file changed, 98 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pci/rcar-gen4-pci-ep.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/rcar-gen4-pci-ep.example.dtb: pcie-ep@e65d0000: reg: [[0, 3864854528, 0, 8192], [0, 3864864768, 0, 2048], [0, 3864866816, 0, 8192], [0, 3864875008, 0, 4608], [0, 3864879616, 0, 3584], [0, 4261412864, 0, 4194304]] is too long
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/rcar-gen4-pci-ep.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/rcar-gen4-pci-ep.example.dtb: pcie-ep@e65d0000: reg-names: ['dbi', 'dbi2', 'atu', 'dma', 'app', 'addr_space'] is too long
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/rcar-gen4-pci-ep.yaml

See https://patchwork.ozlabs.org/patch/1778956

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.
