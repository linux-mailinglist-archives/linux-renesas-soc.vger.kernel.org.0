Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EDF23B92A8
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Jul 2021 16:03:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232748AbhGAOFg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 1 Jul 2021 10:05:36 -0400
Received: from mail-il1-f179.google.com ([209.85.166.179]:39885 "EHLO
        mail-il1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232545AbhGAOFg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Jul 2021 10:05:36 -0400
Received: by mail-il1-f179.google.com with SMTP id o10so6466586ils.6;
        Thu, 01 Jul 2021 07:03:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=t8d1JVD+JV7Zgxco5WPYi4zIX7AeTaVK0hRhmb7TWLQ=;
        b=sRkeqTFpzFZj+ZDXGAwxMnTIXG8SD5jLPlxjuZlBPwho9bMJvSLeXmhHkq+rmPDWRa
         D4we/fYMbdQL2+xoFuXsd6rC2s1MIkLH3T8Hs0KdVesGg5D3I4OIj1e85Uo0GcKQ9FwQ
         kZkAVDKwBVTA13QnyDq8+lVJMPRMgwgP/AqmS2TrBfX/8CLArdq/bpBd/g+N/ULAmAaG
         tKs71QECchVRsNfSjd2tsm06XECCJtoIFnds4LVG2OCfY6m7zYJ92RfjZ586AmUnCGKT
         UihzGRsBBtxuKcwlaG85niVuDdtUpnAcourPry1AAaidoSqLSuSgy/V/sdV2Ea8H4NAy
         e/AA==
X-Gm-Message-State: AOAM5312I0VtgEcBtfWWrbFx61DPnSVp4WehVMMZmlIEC+DHSt4R364L
        BJ/q7BAPH6ZYZYWIVs5yFQ==
X-Google-Smtp-Source: ABdhPJxWevjwZSZU4Y/+M8nNnPhvWZqRpMcVNhMl3on/VJEnFzUFk6T0TNJk7cWKJBYGyphbGlzDBw==
X-Received: by 2002:a92:b30b:: with SMTP id p11mr28592991ilh.114.1625148185463;
        Thu, 01 Jul 2021 07:03:05 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id b9sm43571ilo.23.2021.07.01.07.03.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jul 2021 07:03:04 -0700 (PDT)
Received: (nullmailer pid 2278704 invoked by uid 1000);
        Thu, 01 Jul 2021 14:02:43 -0000
From:   Rob Herring <robh@kernel.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Biju Das <biju.das@bp.renesas.com>
In-Reply-To: <20210630073013.22415-4-biju.das.jz@bp.renesas.com>
References: <20210630073013.22415-1-biju.das.jz@bp.renesas.com> <20210630073013.22415-4-biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v3 03/11] dt-bindings: reset: Document RZ/G2L USBPHY Control bindings
Date:   Thu, 01 Jul 2021 08:02:43 -0600
Message-Id: <1625148163.555164.2278703.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, 30 Jun 2021 08:30:05 +0100, Biju Das wrote:
> Add device tree binding document for RZ/G2L USBPHY Control Device.
> It mainly controls reset and power down of the USB/PHY.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  v3:
>   * New patch.
>   * Modelled USBPHY control from phy bindings to reset bindings, since the
>     IP mainly contols the reset of USB PHY.
> ---
>  .../reset/renesas,rzg2l-usbphy-ctrl.yaml      | 66 +++++++++++++++++++
>  1 file changed, 66 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.example.dts:19:18: fatal error: dt-bindings/clock/r9a07g044-cpg.h: No such file or directory
   19 |         #include <dt-bindings/clock/r9a07g044-cpg.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:380: Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1416: dt_binding_check] Error 2
\ndoc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1498761

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

