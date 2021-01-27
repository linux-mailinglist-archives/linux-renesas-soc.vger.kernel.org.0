Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99DBE305DC9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Jan 2021 15:03:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232989AbhA0ODA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 27 Jan 2021 09:03:00 -0500
Received: from mail-ot1-f53.google.com ([209.85.210.53]:38984 "EHLO
        mail-ot1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232753AbhA0OA6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 27 Jan 2021 09:00:58 -0500
Received: by mail-ot1-f53.google.com with SMTP id i30so1718908ota.6;
        Wed, 27 Jan 2021 06:00:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=TW7Wpb2KIFFK4UfpSOStUKOiAJLMLAKkwYIFgobvHzQ=;
        b=T1e4/urpPab5XZo762gh2ejL6/ry8DmxwDnqlggQqadTKgY1KNgnpBdnzU7xc02+dJ
         UqZ02eBMVNK/FrrZlJ1XSS2GAUTRX2LFDuEVOsWf/Yv6OVkakzXa9FUVqVcAW8ACE526
         1oOG7TcL7mddpv7it1ygOes2FU06y2ptRCucbrKFKNp9KD9EzFclXSGMteyB5NMLbhL2
         6OsyQ+EhamaF3W/NpS100P9nVa97UCL26nTr6xflg5WSWkUColJpGjvxd+mEx1dicTBX
         BRSUH0FX7t3ftPIVWa1wetiVo7xAcPU7gdCu/AlctNlgXjfgtmKXjiBD7gHBClA6Ro63
         wZGw==
X-Gm-Message-State: AOAM5330dR1nZ3DN4mATufkOYM9d4a/GChmBKPs7kkEKeoCm2d4pl/Xq
        LwoRJoFEV8bFbHwxb4CU/w==
X-Google-Smtp-Source: ABdhPJytlWtURtPfHh2x0o/yCJoHwZCvTNmMqGIrab9kDn2vpXhT3od1CS/8GcqRerSXlHet00Pp2w==
X-Received: by 2002:a05:6830:18a:: with SMTP id q10mr7572829ota.115.1611756016756;
        Wed, 27 Jan 2021 06:00:16 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id f6sm373020ote.28.2021.01.27.06.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jan 2021 06:00:15 -0800 (PST)
Received: (nullmailer pid 1429690 invoked by uid 1000);
        Wed, 27 Jan 2021 14:00:11 -0000
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Luca Ceresoli <luca@lucaceresoli.net>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-renesas-soc@vger.kernel.org, Adam Ford <aford173@gmail.com>,
        linux-clk@vger.kernel.org
In-Reply-To: <20210126163955.1933893-1-geert+renesas@glider.be>
References: <20210126163955.1933893-1-geert+renesas@glider.be>
Subject: Re: [PATCH v3] dt-bindings: clk: versaclock5: Miscellaneous fixes and improvements:
Date:   Wed, 27 Jan 2021 08:00:11 -0600
Message-Id: <1611756011.227921.1429689.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, 26 Jan 2021 17:39:55 +0100, Geert Uytterhoeven wrote:
>   - Remove unneeded reference for "idt,slew-percent", as vendor specific
>     properties having a standard unit suffix don't need a type,
>   - Add missing "additionalProperties: false" for subnodes, to catch
>     typos in properties,
>   - Fix property names in example.
> 
> Fixes: 45c940184b501fc6 ("dt-bindings: clk: versaclock5: convert to yaml")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> This depends on "[PATCH dt-schema 0/2] dt-schema: Add percentage"
> https://lore.kernel.org/r/20210126162756.1932692-1-geert+renesas@glider.be
> 
> v3:
>   - Drop references for "idt,voltage-microvolt" and "idt,slew-percent",
> 
> v2:
>   - Settle on "idt,voltage-microvolt", cfr. commit 4b003f5fcadfa2d0
>     ('clk: vc5: Use "idt,voltage-microvolt" instead of
>     "idt,voltage-microvolts"'),
>   - Drop reference to clock.yaml, which is already applied
>     unconditionally,
>   - Drop removal of allOf around if condition, as it is unnecessary
>     churn.
> ---
>  .../devicetree/bindings/clock/idt,versaclock5.yaml       | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml: patternProperties:^OUT[1-4]$:properties:idt,slew-percent: 'oneOf' conditional failed, one must be fixed:
	'type' is a required property
	Additional properties are not allowed ('enum' was unexpected)
	/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml: patternProperties:^OUT[1-4]$:properties:idt,slew-percent: 'oneOf' conditional failed, one must be fixed:
		'$ref' is a required property
		'allOf' is a required property
	80 is not of type 'string'
	85 is not of type 'string'
	90 is not of type 'string'
	100 is not of type 'string'
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml: ignoring, error in schema: patternProperties: ^OUT[1-4]$: properties: idt,slew-percent
warning: no schema found in file: ./Documentation/devicetree/bindings/clock/idt,versaclock5.yaml

See https://patchwork.ozlabs.org/patch/1432164

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

