Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C4034623E8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Nov 2021 23:03:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233167AbhK2WG3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Nov 2021 17:06:29 -0500
Received: from mail-ot1-f46.google.com ([209.85.210.46]:42711 "EHLO
        mail-ot1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231650AbhK2WE3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Nov 2021 17:04:29 -0500
Received: by mail-ot1-f46.google.com with SMTP id 47-20020a9d0332000000b005798ac20d72so27448881otv.9;
        Mon, 29 Nov 2021 14:01:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ntfA5gkRhMVJoS1Zo+ZVOScfKDImals7GHKfKOpJLx0=;
        b=nHFnpRhuJwxmIlMcXzjDxuXOdUBhVqRpNZA5oxaEvDRM+Fk170yAP+ojiMML34RlGG
         1c0vAWFMrEA/jtvhklbgAmi/3USyk4iW7u7kqi2Sz8Xq7jMO2SPIbqVctY8GdMoCH9Gd
         g77Twxdpg2g3BEW6sZpZkrCRGIFGpIjEudMmWtg7r2tqgT+P3WCMZun9+k/S9MZLSWXE
         CQZLAMTXrEr26idSTviKlNdqphWYx6peJKHwCj8lRHrNHDhrzDMGGvyPFHGck7xjGb3+
         ngOhbys9KJPavw6tOe6a9gZERFQE0cYOgX3X+tQuUQYAbELd+NwMnswGn82EuYaip3s7
         EN5w==
X-Gm-Message-State: AOAM533TbnYYLsN5eLzrEE/kY2ozoQrU1Xflvfm127IaXjFuYsbtVhIs
        xKyw5QzXDRshV3CBHaQC1phl43DlVw==
X-Google-Smtp-Source: ABdhPJwz7RkFJIybwrrQobNKFCy9baUiR4GndvW31uDvqIQGPAuKgjPmQHzAAPPQ19/i1/FDIyg6Xw==
X-Received: by 2002:a05:6830:44c:: with SMTP id d12mr46086049otc.66.1638223270667;
        Mon, 29 Nov 2021 14:01:10 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id r10sm2523754ool.1.2021.11.29.14.01.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Nov 2021 14:01:09 -0800 (PST)
Received: (nullmailer pid 687058 invoked by uid 1000);
        Mon, 29 Nov 2021 22:01:09 -0000
Date:   Mon, 29 Nov 2021 16:01:09 -0600
From:   Rob Herring <robh@kernel.org>
To:     Julien Massot <julien.massot@iot.bzh>
Cc:     bjorn.andersson@linaro.org, mathieu.poirier@linaro.org,
        geert+renesas@glider.be, linux-renesas-soc@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v1 1/3] dt-bindings: remoteproc: Add Renesas R-Car
Message-ID: <YaVNpcv/R/iKxn1w@robh.at.kernel.org>
References: <20211115135032.129227-1-julien.massot@iot.bzh>
 <20211115135032.129227-2-julien.massot@iot.bzh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211115135032.129227-2-julien.massot@iot.bzh>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Nov 15, 2021 at 02:50:30PM +0100, Julien Massot wrote:
> Renesas R-Car SoCs may contains a Realtime processor.
> This patch adds binding for this remote processor.
> 
> Signed-off-by: Julien Massot <julien.massot@iot.bzh>
> ---
> Change since RFC:
> Adds missing address-cells and size-cells and change reg cell
> accordingly.
> ---
>  .../remoteproc/renesas,rcar-rproc.yaml        | 66 +++++++++++++++++++
>  1 file changed, 66 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/renesas,rcar-rproc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/renesas,rcar-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/renesas,rcar-rproc.yaml
> new file mode 100644
> index 000000000000..dcb6b0f75dda
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/remoteproc/renesas,rcar-rproc.yaml
> @@ -0,0 +1,66 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/remoteproc/renesas,rcar-rproc.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Renesas R-Car remote processor controller bindings
> +
> +maintainers:
> +  - Julien Massot <julien.massot@iot.bzh>
> +
> +description: |
> +  This document defines the binding for the remoteproc component that loads and
> +  boots firmwares on the Renesas R-Car family chipset.
> +  R-Car gen3 family may have a realtime processor, this processor share peripheral
> +  and RAM with the host processor with the same address map.
> +
> +properties:
> +  compatible:
> +    const: renesas,rcar-cr7
> +
> +  resets:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  memory-region:
> +    description:
> +      List of phandles to the reserved memory regions associated with the
> +      remoteproc device. This is variable and describes the memories shared with
> +      the remote processor (e.g. remoteproc firmware and carveouts, rpmsg
> +      vrings, ...).
> +      (see ../reserved-memory/reserved-memory.yaml)
> +
> +required:
> +  - compatible
> +  - resets
> +  - memory-region
> +  - power-domains
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/r8a7795-cpg-mssr.h>
> +    #include <dt-bindings/power/r8a7795-sysc.h>
> +    reserved-memory {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        cr7_ram: cr7_ram@40040000 {
> +            no-map;
> +            reg = <0x0 0x40040000 0x0 0x1fc0000>;
> +        };
> +    };
> +
> +    cr7_rproc: cr7 {
> +        compatible = "renesas,rcar-cr7";
> +        memory-region = <&cr7_ram>;
> +        power-domains = <&sysc R8A7795_PD_CR7>;
> +        resets = <&cpg 222>;
> +        status = "okay";

Don't show status in examples.

With that,

Reviewed-by: Rob Herring <robh@kernel.org>
