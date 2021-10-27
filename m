Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D091343CBB9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Oct 2021 16:12:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242435AbhJ0OO7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 27 Oct 2021 10:14:59 -0400
Received: from mail-oo1-f42.google.com ([209.85.161.42]:40584 "EHLO
        mail-oo1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242432AbhJ0OO6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 27 Oct 2021 10:14:58 -0400
Received: by mail-oo1-f42.google.com with SMTP id m37-20020a4a9528000000b002b83955f771so957538ooi.7;
        Wed, 27 Oct 2021 07:12:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=LsneOJe1Pj6rcbVZRUHWvbL7fvihA0muo/WGRb93zS0=;
        b=iLvPqPyuyscD3hg2/nzeCwPTOmiEYMmpz4qDZHQu0gTOYiDVvQ5fHOAfcL3iAZFFTF
         2o/G3SYKtQsORW/WRsXK0COOUg6cmTt/f5GE556x1rd73xyWeda8s0f/SnPFPGziR4km
         JN2KyiNuaaE/EhTQaMWJJX84ORazyceV+/soezqrF6TbxGDlTF9IWnhBYKrNiNPn2ssy
         vr/G1yhEO6wyxWzxBjWKMNOG/3Nm7C99eKIS4TrE87aEG/uV56K5H2LigMjH4tyI6DFv
         TPMH7DnZ81cO45P9XyvofKJtTyZMolU36GsNnwXxF3s5p/XIGIhrh0clfAuGvlFJELj8
         Nmig==
X-Gm-Message-State: AOAM531Kb3gQtRHMDG7W5LzLWhBPT7s1EWIQBWL3EYrwNmX8sBZR29w+
        kFha+gbeY9HtSj0Iz3zHrMOV8Zksew==
X-Google-Smtp-Source: ABdhPJwsD40Rm0+OwnHUfh6zr514sAYlnuCSTokESxJDBfvsf1sDdrM4EL+17+CODeIQF2qt2BQwJQ==
X-Received: by 2002:a05:6820:54e:: with SMTP id n14mr22301768ooj.89.1635343952764;
        Wed, 27 Oct 2021 07:12:32 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id j6sm38053oot.18.2021.10.27.07.12.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Oct 2021 07:12:32 -0700 (PDT)
Received: (nullmailer pid 862171 invoked by uid 1000);
        Wed, 27 Oct 2021 14:12:28 -0000
From:   Rob Herring <robh@kernel.org>
To:     Julien Massot <julien.massot@iot.bzh>
Cc:     geert+renesas@glider.be, bjorn.andersson@linaro.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, mathieu.poirier@linaro.org
In-Reply-To: <20211027073020.17055-2-julien.massot@iot.bzh>
References: <20211027073020.17055-1-julien.massot@iot.bzh> <20211027073020.17055-2-julien.massot@iot.bzh>
Subject: Re: [RFC PATCH 1/3] dt-bindings: remoteproc: Add Renesas R-Car
Date:   Wed, 27 Oct 2021 09:12:28 -0500
Message-Id: <1635343948.051238.862170.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, 27 Oct 2021 09:30:18 +0200, Julien Massot wrote:
> Renesas R-Car SoCs may contains a Realtime processor.
> This patch adds binding for this remote processor.
> 
> Signed-off-by: Julien Massot <julien.massot@iot.bzh>
> ---
>  .../remoteproc/renesas,rcar-rproc.yaml        | 66 +++++++++++++++++++
>  1 file changed, 66 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/renesas,rcar-rproc.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/remoteproc/renesas,rcar-rproc.example.dts:26.17-46: Warning (reg_format): /example-0/reserved-memory/cr7_ram@40040000:reg: property has invalid length (8 bytes) (#address-cells == 2, #size-cells == 1)
Documentation/devicetree/bindings/remoteproc/renesas,rcar-rproc.example.dts:22.13-20: Warning (ranges_format): /example-0/reserved-memory:ranges: empty "ranges" property but its #address-cells (2) differs from /example-0 (1)
Documentation/devicetree/bindings/remoteproc/renesas,rcar-rproc.example.dt.yaml: Warning (pci_device_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/remoteproc/renesas,rcar-rproc.example.dt.yaml: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/remoteproc/renesas,rcar-rproc.example.dt.yaml: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/remoteproc/renesas,rcar-rproc.example.dt.yaml: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/remoteproc/renesas,rcar-rproc.example.dt.yaml: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/remoteproc/renesas,rcar-rproc.example.dts:24.39-27.15: Warning (avoid_default_addr_size): /example-0/reserved-memory/cr7_ram@40040000: Relying on default #address-cells value
Documentation/devicetree/bindings/remoteproc/renesas,rcar-rproc.example.dts:24.39-27.15: Warning (avoid_default_addr_size): /example-0/reserved-memory/cr7_ram@40040000: Relying on default #size-cells value
Documentation/devicetree/bindings/remoteproc/renesas,rcar-rproc.example.dt.yaml: Warning (unique_unit_address): Failed prerequisite 'avoid_default_addr_size'

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1546783

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

