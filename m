Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 015653AF224
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Jun 2021 19:40:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231630AbhFURmi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Jun 2021 13:42:38 -0400
Received: from mail-oi1-f175.google.com ([209.85.167.175]:34659 "EHLO
        mail-oi1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231599AbhFURmg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Jun 2021 13:42:36 -0400
Received: by mail-oi1-f175.google.com with SMTP id u11so20738760oiv.1;
        Mon, 21 Jun 2021 10:40:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=NiwyQX8lqU+xqmCr8Fm4w/OcGtce3FSVkndbdiJtpF4=;
        b=Ab5Xw7PExmAJZbs5auqmOhxK+GJ4q3AsM5m4gPzQpesnKcv/+SQ4NZ8ABgy+m8OMWR
         kHVReP3uWWYA0D2OMYizJavj0j83nFQpqXtZsWA3Z4aDI9mN1k0qIiFFPCyHj6yVSDVU
         hNri8hewUEcK5+Vntl9aYj6a3aIDZcnIbKgtcffD6JeDhhNGaLSYKdCFrUWMBKRYATXm
         jCcoYk7/+Ezml+NEwZSUN8HfSJuM+/eqA9cH9PaZcvj343g53ypnXlBjIrZoQtepTl6S
         EaEwvVUbeZDjhr5ywcz2yZoFQMwlv2zlEpv4bGWpFJd5K1VhPl30LO0YGhP1YRYg7avi
         HSyQ==
X-Gm-Message-State: AOAM531qVeTvItrLCzKR/E/JZpQolI02pEiq27dWwOZDYk2QRPcnBjAQ
        CD0JuHZ62pocSNARscfEwlOXbupzDQ==
X-Google-Smtp-Source: ABdhPJzbPfb/Y28dy/MWbQmLnRce9SBrwv07dwj3K58T+jt6Fqi9fqCoUZNhy2xeU0HpvRCRk66DpA==
X-Received: by 2002:aca:3102:: with SMTP id x2mr24018935oix.112.1624297221566;
        Mon, 21 Jun 2021 10:40:21 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id a22sm1516862otq.10.2021.06.21.10.40.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jun 2021 10:40:21 -0700 (PDT)
Received: (nullmailer pid 1161643 invoked by uid 1000);
        Mon, 21 Jun 2021 17:40:02 -0000
From:   Rob Herring <robh@kernel.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
In-Reply-To: <20210621093943.12143-8-biju.das.jz@bp.renesas.com>
References: <20210621093943.12143-1-biju.das.jz@bp.renesas.com> <20210621093943.12143-8-biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v2 07/11] dt-bindings: usb: generic-ehci: Document RZ/G2L SoC bindings
Date:   Mon, 21 Jun 2021 11:40:02 -0600
Message-Id: <1624297202.390358.1161642.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, 21 Jun 2021 10:39:39 +0100, Biju Das wrote:
> Renesas RZ/G2L SoC has USBPHY Control and USB2.0 PHY module. We need to
> turn on both these phy modules before accessing host registers.
> 
> Apart from this, document the optional property dr_mode present on both
> RZ/G2 and R-Car Gen3 SoCs.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  .../devicetree/bindings/usb/generic-ehci.yaml | 33 +++++++++++++++++--
>  1 file changed, 31 insertions(+), 2 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/usb/generic-ehci.yaml:28:13: [warning] wrong indentation: expected 10 but found 12 (indentation)

dtschema/dtc warnings/errors:
\ndoc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1494982

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

