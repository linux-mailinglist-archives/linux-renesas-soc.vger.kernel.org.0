Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 158B33379A3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Mar 2021 17:41:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229673AbhCKQlS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 11 Mar 2021 11:41:18 -0500
Received: from mail-il1-f178.google.com ([209.85.166.178]:37497 "EHLO
        mail-il1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229530AbhCKQlL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 11 Mar 2021 11:41:11 -0500
Received: by mail-il1-f178.google.com with SMTP id k2so19492431ili.4;
        Thu, 11 Mar 2021 08:41:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=WJe+Al4qm0TlWJf1+/8W5HUdeHTdNJA3rf8BM2iIptk=;
        b=AzJcO3wSF//A/H6wlYrvP1gsRK6NLXNJQbpM6PU25xBHeGT+z8VDjSSemb4FRQfVGw
         0euEULDjyW4RtKpHDbVVCAowCwCPw+D3Pk3FBZa69gdzWILj2lQz4mOob9oZ++z1zgcp
         fQJzXnQbz02sMZZK9zBQVbnDtJhEWKFC+gOsEcFGEmvKow2pGmo2GXybi5Rr852skOGr
         LhZSzod/vXWl2r6orGg03QgChgqwVU0Nb9xLblkfmfYN/XjzAS6Hz/FuVC3RGunWqbYW
         aSUO7z8nOM6qO+nPJl9jlUZIn4J197uzrJq/5LJyzd8uL5p2YiQ01GJPnDS3t66G9H7L
         9Ohw==
X-Gm-Message-State: AOAM532IvssVqgFHUi2HzELwlEgl0nWxRqrM0qRoxzF8RBzFAcDQRgFF
        0X9y6ju8XkCAysDqP/zCwQ==
X-Google-Smtp-Source: ABdhPJy5JH73VdS/BWpz9w3adZarKXeH/Kn/+riDA2p7RpMCJf639DgSqQxK8bSDmbnL693mxvBLDw==
X-Received: by 2002:a05:6e02:1154:: with SMTP id o20mr7664202ill.236.1615480870559;
        Thu, 11 Mar 2021 08:41:10 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id y18sm1588767ili.16.2021.03.11.08.41.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 08:41:08 -0800 (PST)
Received: (nullmailer pid 841935 invoked by uid 1000);
        Thu, 11 Mar 2021 16:41:02 -0000
From:   Rob Herring <robh@kernel.org>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org, mazziesaccount@gmail.com,
        devicetree@vger.kernel.org, Mark Brown <broonie@kernel.org>,
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org,
        linux-power@fi.rohmeurope.com,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org
In-Reply-To: <6793280eb1a3376a1aa4d408a8931202050c828d.1615454845.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1615454845.git.matti.vaittinen@fi.rohmeurope.com> <6793280eb1a3376a1aa4d408a8931202050c828d.1615454845.git.matti.vaittinen@fi.rohmeurope.com>
Subject: Re: [RFC PATCH v3 5/7] dt-bindings: regulator: bd9576 add FET ON-resistance for OCW
Date:   Thu, 11 Mar 2021 09:41:02 -0700
Message-Id: <1615480862.535831.841934.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, 11 Mar 2021 12:23:33 +0200, Matti Vaittinen wrote:
> BD9576MUF provides over-current protection and detection. Current is
> measured as voltage loss over external FET. Allow specifying FET's on
> resistance so current monitoring limits can be converted to voltages.
> 
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> ---
> v3:
>  - no changes
> v2:
>  - use standard micro-ohms suffix
> 
>  .../devicetree/bindings/regulator/rohm,bd9576-regulator.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/regulator/rohm,bd9576-regulator.yaml:31:35: [error] empty value in block mapping (empty-values)

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/regulator/rohm,bd9576-regulator.yaml: patternProperties:regulator-.+:properties:description: "External FET's ON-resistance. Required if VoutS1 OCP/OCW is to be set." is not of type 'object', 'boolean'
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/regulator/rohm,bd9576-regulator.yaml: patternProperties:regulator-.+:properties:rohm,ocw-fet-ron-micro-ohms: None is not of type 'object', 'boolean'
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/regulator/rohm,bd9576-regulator.yaml: patternProperties:regulator-.+:properties: {'enum': ['$ref', 'additionalItems', 'additionalProperties', 'allOf', 'anyOf', 'const', 'contains', 'default', 'dependencies', 'deprecated', 'description', 'else', 'enum', 'if', 'items', 'maxItems', 'maximum', 'minItems', 'minimum', 'multipleOf', 'not', 'oneOf', 'pattern', 'patternProperties', 'properties', 'propertyNames', 'required', 'then', 'unevaluatedProperties']} is not allowed for 'description'
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/regulator/rohm,bd9576-regulator.yaml: ignoring, error in schema: patternProperties: regulator-.+: properties: rohm,ocw-fet-ron-micro-ohms
warning: no schema found in file: ./Documentation/devicetree/bindings/regulator/rohm,bd9576-regulator.yaml

See https://patchwork.ozlabs.org/patch/1451051

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

