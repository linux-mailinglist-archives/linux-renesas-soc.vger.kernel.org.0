Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4D2E26B06B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Sep 2020 00:10:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727985AbgIOWKj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Sep 2020 18:10:39 -0400
Received: from mail-il1-f196.google.com ([209.85.166.196]:42300 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727631AbgIOUCq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Sep 2020 16:02:46 -0400
Received: by mail-il1-f196.google.com with SMTP id t13so4198661ile.9;
        Tue, 15 Sep 2020 12:59:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=w5YpoxfTyrzce47e7+bq2Lzj+yxd8SjgCIV6N4Js4ic=;
        b=Yu6XQacuR8FopmCoRCn4AOTX+plpAdY4iKLAtjlIYsIXOmh8pRL8Cluu+Ye3hPjVG1
         PHYk9bvW3/xu65l60VPE2QOC5mUAfJQ5cL72sRw3hR5tn6q9mpzpPd/jJQhtCi7dJthU
         eYRF/fUtl1w+cDdO+EPsPejZ41iFQYA9HFA+XH3I3HxJayoFH9bol+D6aBXx9Mpz9zGk
         MBS34z9zbO8M9wLsUvB2V3InRl5ncjvgTgSEDhgRMCekhHbRvSdAwxKtB4cpXchqoS9C
         ZOF9I2LEJZ/reY2hHB5upNJLn/KOObU27798HVm2xsnGoimkJ1Y5kkahTmxmFGYD9L3i
         5YwA==
X-Gm-Message-State: AOAM5302eJCmcqUF4oPEtfWRw2KvaHThVPnLzyHkXHJyCAiMYvIgHTa9
        r7v9v7OEhCCxOy1prhdEMQ==
X-Google-Smtp-Source: ABdhPJyysbHV/o3l7AFAopcgw0STvpK5TyfVIMhU4B3slSiPLWgiIgY4LBEjD+PF3te9Q+sWVDfzSA==
X-Received: by 2002:a05:6e02:d07:: with SMTP id g7mr12751974ilj.63.1600199989032;
        Tue, 15 Sep 2020 12:59:49 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id q23sm8155081iob.19.2020.09.15.12.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2020 12:59:48 -0700 (PDT)
Received: (nullmailer pid 2407937 invoked by uid 1000);
        Tue, 15 Sep 2020 19:59:45 -0000
Date:   Tue, 15 Sep 2020 13:59:45 -0600
From:   Rob Herring <robh@kernel.org>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Tony Lindgren <tony@atomide.com>, linux-kernel@vger.kernel.org,
        Nishanth Menon <nm@ti.com>, Joel Stanley <joel@jms.id.au>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-omap@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
        Jason Cooper <jason@lakedaemon.net>,
        Tero Kristo <t-kristo@ti.com>,
        linux-arm-kernel@lists.infradead.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-mediatek@lists.infradead.org,
        Guenter Roeck <linux@roeck-us.net>,
        Andrew Jeffery <andrew@aj.id.au>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andrew Lunn <andrew@lunn.ch>, linux-aspeed@lists.ozlabs.org,
        Gregory Clement <gregory.clement@bootlin.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Russell King <linux@armlinux.org.uk>
Subject: Re: [PATCH v2 01/15] dt-bindings: gpio: convert bindings for NXP
 PCA953x family to dtschema
Message-ID: <20200915195945.GA2407885@bogus>
References: <20200910175733.11046-1-krzk@kernel.org>
 <20200910175733.11046-2-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200910175733.11046-2-krzk@kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, 10 Sep 2020 19:57:19 +0200, Krzysztof Kozlowski wrote:
> Convert the NXP PCA953x family of GPIO expanders bindings to device tree
> schema.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> ---
> 
> Changes since v1:
> 1. Use additionalProperties.
> 2. Add wakeup-source.
> 3. Add hogs.
> 4. Extend example with hogs.
> ---
>  .../devicetree/bindings/gpio/gpio-pca953x.txt |  90 ----------
>  .../bindings/gpio/gpio-pca95xx.yaml           | 166 ++++++++++++++++++
>  .../devicetree/bindings/trivial-devices.yaml  |   4 -
>  3 files changed, 166 insertions(+), 94 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
