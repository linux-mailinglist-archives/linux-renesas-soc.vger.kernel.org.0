Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D384C318DCB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Feb 2021 16:04:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229848AbhBKPCY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 11 Feb 2021 10:02:24 -0500
Received: from mail-ot1-f47.google.com ([209.85.210.47]:37306 "EHLO
        mail-ot1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230493AbhBKO5K (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 11 Feb 2021 09:57:10 -0500
Received: by mail-ot1-f47.google.com with SMTP id a5so4196958otq.4;
        Thu, 11 Feb 2021 06:56:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=TjbeNA3eLxM67pt4EzxDtfbEhfsKL98gMENOheGeUvM=;
        b=ooQrJ5InLSk3UTK8IKz0uA7KSy2WsjM320wNeMDgii7Z8zvyef008mxFayX82cRGm+
         HeUX0bSinu6Qlac6GLm12rWEByKHv2+crUqTgpz2xoVVH0N7B8k0mbTPtYpdiENoj59+
         wzOFZY/uESH+8TQsa3fQpTtiydum1Bng83GhSJ3EmFXCVoNjdGnOKDNq+GhQOGWwIJzF
         x5+GNRBqZnOajA7HL+fXeHqQ2hj72Ih3T+UYewK7+0eQJa9nyvxgLF+32BYYWGyBgiw6
         nCjgR3D9p3dc6PSo0mdrFIu3lEGXgK0nXXOPaDE5nLq+k5R5hlXdYupZuqZqQcOMm6or
         9cVA==
X-Gm-Message-State: AOAM533eTdQelVD19grmyk151WjfBz2LaBTk5sp3Zg/sXRWyigAVzsY7
        bxG1mV+ChNUbdXpistE6XQ==
X-Google-Smtp-Source: ABdhPJyrbeVYaL17I7WAbzHs9bPCwE8Of5B7sZhvjKS6QNzKFmIWV1JYABdGn0/lFmtWPcnmlTvpzg==
X-Received: by 2002:a9d:6c8d:: with SMTP id c13mr5777561otr.333.1613055387426;
        Thu, 11 Feb 2021 06:56:27 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id r22sm1102130ote.12.2021.02.11.06.56.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Feb 2021 06:56:26 -0800 (PST)
Received: (nullmailer pid 519687 invoked by uid 1000);
        Thu, 11 Feb 2021 14:56:20 -0000
From:   Rob Herring <robh@kernel.org>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-power@fi.rohmeurope.com,
        Andy Gross <agross@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, mazziesaccount@gmail.com
In-Reply-To: <b7025d14fc8eb0eac95437ac62e74f64a7cf2b4c.1613042245.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1613042245.git.matti.vaittinen@fi.rohmeurope.com> <b7025d14fc8eb0eac95437ac62e74f64a7cf2b4c.1613042245.git.matti.vaittinen@fi.rohmeurope.com>
Subject: Re: [RFC PATCH 5/7] dt-bindings: regulator: bd9576 add FET ON-resistance for OCW
Date:   Thu, 11 Feb 2021 08:56:20 -0600
Message-Id: <1613055380.712974.519686.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, 11 Feb 2021 14:35:41 +0200, Matti Vaittinen wrote:
> BD9576MUF provides over-current protection and detection. Current is
> measured as voltage loss over external FET. Allow specifying FET's on
> resistance so current monitoring limits can be converted to voltages.
> 
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> ---
>  .../devicetree/bindings/regulator/rohm,bd9576-regulator.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/regulator/rohm,bd9576-regulator.yaml:31:34: [error] empty value in block mapping (empty-values)

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/regulator/rohm,bd9576-regulator.yaml: patternProperties:regulator-.+:properties:description: "External FET's ON-resistance. Required if VoutS1 OCP/OCW is to be set." is not of type 'object', 'boolean'
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/regulator/rohm,bd9576-regulator.yaml: patternProperties:regulator-.+:properties:rohm,ocw-fet-ron-milliohms: None is not of type 'object', 'boolean'
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/regulator/rohm,bd9576-regulator.yaml: patternProperties:regulator-.+:properties: {'enum': ['$ref', 'additionalItems', 'additionalProperties', 'allOf', 'anyOf', 'const', 'contains', 'default', 'dependencies', 'deprecated', 'description', 'else', 'enum', 'if', 'items', 'maxItems', 'maximum', 'minItems', 'minimum', 'multipleOf', 'not', 'oneOf', 'pattern', 'patternProperties', 'properties', 'propertyNames', 'required', 'then', 'unevaluatedProperties']} is not allowed for 'description'
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/regulator/rohm,bd9576-regulator.yaml: patternProperties:regulator-.+:properties:rohm,ocw-fet-ron-milliohms: None is not of type 'object'
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/regulator/rohm,bd9576-regulator.yaml: ignoring, error in schema: patternProperties: regulator-.+: properties: rohm,ocw-fet-ron-milliohms
warning: no schema found in file: ./Documentation/devicetree/bindings/regulator/rohm,bd9576-regulator.yaml

See https://patchwork.ozlabs.org/patch/1439442

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

