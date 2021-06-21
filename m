Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB4F43AF22D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Jun 2021 19:40:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231614AbhFURmw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Jun 2021 13:42:52 -0400
Received: from mail-ot1-f54.google.com ([209.85.210.54]:39600 "EHLO
        mail-ot1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231514AbhFURmw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Jun 2021 13:42:52 -0400
Received: by mail-ot1-f54.google.com with SMTP id 5-20020a9d01050000b02903c700c45721so18540550otu.6;
        Mon, 21 Jun 2021 10:40:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=JumfKqag8sdEdMQKJRhYZtkbB2UISdlxsx7ZMK4r0eI=;
        b=IdI8sY3J5WTM8xIZwCIS3dQJmkWtiNq+NQ5tTBnRbjnHgKonosqpJgbNjW6Ry/KNYm
         a0iOgUPoFC7tAf3w3eE7ma1gz4T+IzPeFSBwcDYjjH7re99WcgpPev7WwIThy/q08kiQ
         f5/iTBo1eaIIU29dWHs+xpk8m2RxiyXCaJ95WnGPtaVhKtokgt9YaujeYYcQknQiWs43
         /4a3rFKDkmQWaBzEymb2p6fPPo1+1KShv8dwvR8A1L8jCrTX+633nJbSv4hYOTaigvnT
         syc3E661k7ZAqsrkQYikhbljTC0v89KKm12Grr5LqcG9LfHRqPhSSg6DEcMsnBK0G1mt
         IbHw==
X-Gm-Message-State: AOAM5308vPXEzJc8O3YCNEn3tcG7RM+45GiFwYiuRGhXmAF1u8cGdqCG
        LvsbR0PzlCSreLpJmc/+3Q==
X-Google-Smtp-Source: ABdhPJyIwirBm2rjwt09+rfxrFIW9U8PZbrrhyDXSZG7CHNuWEMnJLTebdB/bBrG6ruA5b6Z6HbI3g==
X-Received: by 2002:a9d:6e01:: with SMTP id e1mr2287421otr.178.1624297237510;
        Mon, 21 Jun 2021 10:40:37 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id p65sm3764178oop.0.2021.06.21.10.40.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jun 2021 10:40:36 -0700 (PDT)
Received: (nullmailer pid 1161639 invoked by uid 1000);
        Mon, 21 Jun 2021 17:40:02 -0000
From:   Rob Herring <robh@kernel.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Vinod Koul <vkoul@kernel.org>,
        linux-renesas-soc@vger.kernel.org,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-phy@lists.infradead.org, Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        devicetree@vger.kernel.org
In-Reply-To: <20210621093943.12143-2-biju.das.jz@bp.renesas.com>
References: <20210621093943.12143-1-biju.das.jz@bp.renesas.com> <20210621093943.12143-2-biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v2 01/11] dt-bindings: phy: renesas: Document RZ/G2L USB PHY Control bindings
Date:   Mon, 21 Jun 2021 11:40:02 -0600
Message-Id: <1624297202.375929.1161638.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, 21 Jun 2021 10:39:33 +0100, Biju Das wrote:
> Add device tree binding document for RZ/G2L USB PHY control driver.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> V1->V2:
>  * Add clock properties
> ---
>  .../phy/renesas,rzg2l-usbphyctrl.yaml         | 65 +++++++++++++++++++
>  1 file changed, 65 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/renesas,rzg2l-usbphyctrl.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/phy/renesas,rzg2l-usbphyctrl.example.dts:19:18: fatal error: dt-bindings/clock/r9a07g044-cpg.h: No such file or directory
   19 |         #include <dt-bindings/clock/r9a07g044-cpg.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:380: Documentation/devicetree/bindings/phy/renesas,rzg2l-usbphyctrl.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1416: dt_binding_check] Error 2
\ndoc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1494979

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

