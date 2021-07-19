Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10EE83CDC35
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Jul 2021 17:32:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242932AbhGSOvl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 19 Jul 2021 10:51:41 -0400
Received: from mail-io1-f48.google.com ([209.85.166.48]:36481 "EHLO
        mail-io1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245585AbhGSOry (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Jul 2021 10:47:54 -0400
Received: by mail-io1-f48.google.com with SMTP id u7so20340960ion.3;
        Mon, 19 Jul 2021 08:28:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=eFIkG9Q3na2P9WfVxEfmGfFeBva/wNkbIdbDdNfP9ss=;
        b=uVVxhfzz/SzKY2O4Dj50b7XIxkvoBL/28mZVj5BG2lybkhle+p5Op8hN/d6KlB4ej6
         KSdrM/GuFRZ0OZvCxl0IDAStQFvq3Qv6R6aIRmm1bb7kKvAXWqydFKU29Z1LWT6ce2vm
         7D4y9s4bUaKJ1EiJoDtPxOos8RCpERT+J0n90g0dDEDzBKMghXGkTiLhyLoTtPvt+Ex5
         OyaaaZ6555piBg0N9pPsCsWMasNMeiVsCppvlR1uQmOuC2Sq23J4yfCBCqFoNkhA1jf4
         joo3Oo9PgBQddxi3Uw9QhJIbyL5ilWoOlyCSzeea0BBqyNTnRQ/OC8MwnNFTN7ewNc8Y
         lrRw==
X-Gm-Message-State: AOAM530hCou6nHDcR/T8vuT4fWyC8r/Uim5i4WyRDM89UXV3otXL1lUi
        pF8CcNpul2oWAJeyOdbgqhE9xF484w==
X-Google-Smtp-Source: ABdhPJw8/LevWrg619EkdpGNxWnCipTPa+LBctYPqT12T8/8LeJEgpwWD4Dno/0xyBYDRyHsBk8Olw==
X-Received: by 2002:a6b:7948:: with SMTP id j8mr18912639iop.32.1626708483880;
        Mon, 19 Jul 2021 08:28:03 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id 10sm483907iln.39.2021.07.19.08.28.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 08:28:03 -0700 (PDT)
Received: (nullmailer pid 1967265 invoked by uid 1000);
        Mon, 19 Jul 2021 15:27:59 -0000
From:   Rob Herring <robh@kernel.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20210719121938.6532-4-biju.das.jz@bp.renesas.com>
References: <20210719121938.6532-1-biju.das.jz@bp.renesas.com> <20210719121938.6532-4-biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v4 03/10] dt-bindings: reset: Document RZ/G2L USBPHY Control bindings
Date:   Mon, 19 Jul 2021 09:27:59 -0600
Message-Id: <1626708479.397199.1967264.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, 19 Jul 2021 13:19:31 +0100, Biju Das wrote:
> Add device tree binding document for RZ/G2L USBPHY Control Device.
> It mainly controls reset and power down of the USB/PHY.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
> v3->v4:
>   * Dropped reset reference.
>   * Added Rb-tag from Rob.
>  v3:
>   * New patch.
>   * Modelled USBPHY control from phy bindings to reset bindings, since the
>     IP mainly contols the reset of USB PHY.
> ---
>  .../reset/renesas,rzg2l-usbphy-ctrl.yaml      | 65 +++++++++++++++++++
>  1 file changed, 65 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.example.dts:25.30-31 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:380: Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1418: dt_binding_check] Error 2
\ndoc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1506961

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

