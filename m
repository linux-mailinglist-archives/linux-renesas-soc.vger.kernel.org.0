Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E31C6299C2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Nov 2022 14:13:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230420AbiKONNI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Nov 2022 08:13:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230355AbiKONNH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Nov 2022 08:13:07 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5CF12AC7D
        for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Nov 2022 05:13:03 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id s8so7197449lfc.8
        for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Nov 2022 05:13:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kTB4xFkuSqDJkguPgbNRXgSTiSjC5T2+Eayiy8u0drU=;
        b=qkr1mPq/Iaq6jH68zz8NMaNhWjw1jXQNLTUA5ro/GwxRqLhvYOZZJggPfjJLkD/sDC
         OybF5JEtdGoOcSJxev4oDb3DAV/yywXLFJre0xAjokkiNWsg3uVG9YHJdmit0j0MpjIC
         eapXuzqulT4CYxV4+AsCscwvDmRIK+62394ng8bV4CSuxQL3wmriKBpy+2TApOKbthG3
         hA09F9owNUYO9l4rc+W0cwptaDo2BnaUgPk8XFlfhZwYF2sJRUzYymXKaAbwFsQc5dKc
         crN8yNqhipyN9V2aV7rBaJjk6g2aC+z9RyAwL4+U0e3b4bDXGENEaJ4Ri57Kv/Gf4fyR
         Hapw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kTB4xFkuSqDJkguPgbNRXgSTiSjC5T2+Eayiy8u0drU=;
        b=3aei8cHUAVbE/fRnhF3MCnN7Y8kVLwF0EsGh8JYLLxziHdQAQguBswPZ6/GTrq5xiL
         pb7IqkT5+Uo3aEV4i8/QIeUrEWjAWoNISzPQPtBwEsmH5WHrFoFZZy0ZqoY08lulo93Y
         oca8Pkkz+TUsY2BoZvgvMfgQsMTKx7TtEF55qNfMULhYxS2ThR7SzGSYLfP5ly96Oq3x
         PRxR5Xb4WrMFe62Zo6l05uCqulcbFPIu07vc/QDmgO5ovFO0R2OQdwJPNJi3MgURRwwS
         u8kMQt/LyB4IzOzKc1zWmcjF5Kp2EpChtaN6P/V31YzCaTLyrUz5UTgXarKwEJoSOKoY
         w/Nw==
X-Gm-Message-State: ANoB5pl6ye2LYXzZUC3LbP35uc32eTSY9Atb/dHPn+KEDvIP6l4wFt/b
        xA9Mi/TwAhWPFDRaEGL4ielHeA==
X-Google-Smtp-Source: AA0mqf6bmDAkHFG20vnLLPsWE6BGuUChzkPAn4GcFmO719fkh9AATz5foTHq2aVxbcn4IGkfFeB/cQ==
X-Received: by 2002:a19:645e:0:b0:4a9:e27a:1cfa with SMTP id b30-20020a19645e000000b004a9e27a1cfamr5452473lfj.147.1668517982163;
        Tue, 15 Nov 2022 05:13:02 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id bd24-20020a05651c169800b0026e04cc88cfsm2501210ljb.124.2022.11.15.05.13.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Nov 2022 05:13:01 -0800 (PST)
Message-ID: <a5d53378-51dc-a024-bbda-5dd03bbf37b3@linaro.org>
Date:   Tue, 15 Nov 2022 14:13:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 4/7] dt-bindings: usb: add the Renesas RZ/N1 USBF
 controller binding
Content-Language: en-US
To:     Herve Codina <herve.codina@bootlin.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Gareth Williams <gareth.williams.jx@renesas.com>
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>
References: <20221114111513.1436165-1-herve.codina@bootlin.com>
 <20221114111513.1436165-5-herve.codina@bootlin.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221114111513.1436165-5-herve.codina@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 14/11/2022 12:15, Herve Codina wrote:
> The Renesas RZ/N1 USBF controller is an USB2.0 device controller
> (UDC) available in the Renesas r9a06g032 SoC (RZ/N1 family).

Subject: drop redundant, second "binding".

> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  .../bindings/usb/renesas,rzn1-usbf.yaml       | 68 +++++++++++++++++++
>  1 file changed, 68 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/renesas,rzn1-usbf.yaml
> 
> diff --git a/Documentation/devicetree/bindings/usb/renesas,rzn1-usbf.yaml b/Documentation/devicetree/bindings/usb/renesas,rzn1-usbf.yaml
> new file mode 100644
> index 000000000000..b67e9cea2522
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/renesas,rzn1-usbf.yaml
> @@ -0,0 +1,68 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/renesas,rzn1-usbf.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas RZ/N1 SoCs USBF (USB Function) controller binding

Drop "binding"

With two above:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

