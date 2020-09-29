Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE70F27C8A9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Sep 2020 14:03:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731532AbgI2MDo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 29 Sep 2020 08:03:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731812AbgI2MDf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 29 Sep 2020 08:03:35 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 171AEC0613D1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 29 Sep 2020 05:03:34 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id e22so6043015edq.6
        for <linux-renesas-soc@vger.kernel.org>; Tue, 29 Sep 2020 05:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=60xpqL1mFMP5mTEXMd+Hf/JbwDeJfK2G/uC8t1br+6k=;
        b=U2ylC5Xqp6u8ik+qLLVYLPja9a6CNN7H2bkCEa//UctRW98qRrcJt5iSmfa7HlRGDa
         EDm/19NA602YOLiGzy8pur/PiSigZOnjiDFPDfp0wDQytj0AVKE9l1GJEsQDPHSaTpWN
         VKjV4VqmYPDpuUP8xoVz5EngrDU4Ndza9QesC6eHUD3jbdE7/xUMMFZhYMSOldDRFI3t
         ZdZxo51YFr3ToZQL3S3K4YVDbUkKbPpvyhMDBjwurhhpkVJ0dBbq+psxbbaZoqMRtKT+
         C5157f+z9w4veodAaTjN6EGUBR216cMGPBpMSLAghcRBokc8uH+foNEF+FhICHvyRD9T
         7rng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=60xpqL1mFMP5mTEXMd+Hf/JbwDeJfK2G/uC8t1br+6k=;
        b=F7xZ1m2S2jXpJ/d1Dwp1sfXrx5lQ/zCq3MtAeSBh/G5oEnKESFYWAotHkHClHtnezv
         6Pw51CI0fu1ovU78r0XwZh4pyTRfcxg4Y4nMkhpDUP1sOogMeAu+TgRl0fCYAQW5pi6o
         O7vc+lAfSskd/LVpQMQiO1cl/rC9zy288UFBIyvO6uz+QdOu/cihrwkP0MoodfwMx4YN
         ZfFg0vFoprE4p+GD/5+pdecvkYdlFJ4UiSGfodkzlc+X2S0g9yUcpq7GwO+e68/eTh2m
         nPJbPR0fxKDBPg4B86MEUkaK1lP2Yd3MYTgSSLDm05d3Sa4EPOqTMQUn9XZ8cnjpYhkq
         Jmvg==
X-Gm-Message-State: AOAM533Ejf0v7+0v1BpyzTUVP32CC8+eey0SaPbivXDx33G7teQ+9A9F
        GgqwAhDpsOyMe3KXWhwU0a2PQzWqpXxjX3o6kj9EjA==
X-Google-Smtp-Source: ABdhPJx9YWw+klvNRqJR45fFUSS6cO52gWk7vHm028tT+rGobO97VJryE+a83/bztKgnEOk/N/ouPUUF0IEqke5ZwL8=
X-Received: by 2002:a50:8e17:: with SMTP id 23mr2797118edw.42.1601381012666;
 Tue, 29 Sep 2020 05:03:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200916155715.21009-1-krzk@kernel.org> <20200916155715.21009-2-krzk@kernel.org>
 <20200925154804.GB16392@kozik-lap>
In-Reply-To: <20200925154804.GB16392@kozik-lap>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 29 Sep 2020 14:03:21 +0200
Message-ID: <CACRpkdZ8Db+6yf6QG8kNgLBWFUzfogxu-CGjy-jYgXSR_sKoFA@mail.gmail.com>
Subject: Re: [PATCH v3 01/15] dt-bindings: gpio: convert bindings for NXP
 PCA953x family to dtschema
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Jason Cooper <jason@lakedaemon.net>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Tero Kristo <t-kristo@ti.com>, Nishanth Menon <nm@ti.com>,
        Michal Simek <michal.simek@xilinx.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Sep 25, 2020 at 5:48 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:

> The first two patches (bindings) have Rob's ack/review. Could you pick
> them via GPIO tree?

Yup! Patches 1 & 2 applied to the GPIO tree.

Thanks for doing this schema work, much appreciated.

Yours,
Linus Walleij
