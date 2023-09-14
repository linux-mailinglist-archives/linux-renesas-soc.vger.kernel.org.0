Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B1C9F7A07C8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Sep 2023 16:48:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240735AbjINOsp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 14 Sep 2023 10:48:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240565AbjINOs2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Sep 2023 10:48:28 -0400
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E60D2117
        for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Sep 2023 07:48:24 -0700 (PDT)
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-d7ba4c5f581so1096115276.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Sep 2023 07:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694702904; x=1695307704; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HuHnnCCpKec3KupkEaXCUwSfceD3r5v9lcKHYT+1ctU=;
        b=uwOzEaRMlvkrX6eBWpjTmYYq/BIp35aWULXxX2pVTtglET3jtjxkAVOfYdwt22wd7J
         pSGO7CeMaYRPidkO4KLxPl2tkhCI+pAFOs3tq+i4l4eSCJUnXbwD/zJNwoAxdBcVNsT1
         yLPx5eGtt5WLnq4uOXEZiF5JAyCWPgrH3ns8qg4llIB6S4qSBK4HfSVVSn0k0614reaS
         7XFG6H7hlO/rwk1Itq+cm7NhauRK5bfd1r0Ed03QLTNs9b9CYic0vQ4ZxHutkLnFF7YR
         JX55qt8AGcP1IZLlKKbAK22Nq2SI9U8J1Cz7yOyD61xKh3qDgJyhueuNzA9SC44kuQcf
         T4eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694702904; x=1695307704;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HuHnnCCpKec3KupkEaXCUwSfceD3r5v9lcKHYT+1ctU=;
        b=gmDXK5rAgRKl01vaVBhIfnZ37YEMPldguj52V32qEElUr52NIJv2f67DBXovsCDfIJ
         1MaExkQHF1nnUeAgBaiIp0Jvv1H8WWYs5I6IOZVXd1AfVeaGt5JlHDtBu8cImAmxpOHm
         /IlNU3HCXX3Ro+kgVfjrLlbONcdHPZNxRI6xlXqZZZ/lDQQN+P29jDRbACDv4NVTcTBk
         m2sH7heiyCMLy5qobsbbBeW14iBf9gB8qRHMLPP21ZqEP2G1mr3QlA7+fjByctTVUlFi
         3NLcqqPsL7L0lPfTMt0dv0Ub1VmU0hYcaYL5HYdPWhzmWWiWNigja6J4tIZPn1Ns2ObZ
         XEww==
X-Gm-Message-State: AOJu0YwL9A454/fEfXwx6rnFOhR302MoHLzvb4JcZ+1r4jEsqnl1fVY6
        Gh0i/jFuCDL9UaKM8r7Kb2Zyyeeb0K7eG7rHrC5CrA==
X-Google-Smtp-Source: AGHT+IGBWbsPXdVUyVGh6IoeKWogXMpeV+NV1QYCzoeda8qrpQjFBedRitaOXAtVUrf1hzUWZSmx3vAdawl5AXo2Qt4=
X-Received: by 2002:a25:858b:0:b0:d4c:cbd2:f6f3 with SMTP id
 x11-20020a25858b000000b00d4ccbd2f6f3mr5416147ybk.53.1694702903830; Thu, 14
 Sep 2023 07:48:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230912045157.177966-1-claudiu.beznea.uj@bp.renesas.com> <20230912045157.177966-32-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20230912045157.177966-32-claudiu.beznea.uj@bp.renesas.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Thu, 14 Sep 2023 16:47:48 +0200
Message-ID: <CAPDyKFq1n=QOt9WSnzH4juPZ-B7xWdwGnDcAYUo7_D=2PRj-WQ@mail.gmail.com>
Subject: Re: [PATCH 31/37] dt-bindings: mmc: renesas,sdhi: Document RZ/G3S support
To:     Claudiu <claudiu.beznea@tuxon.dev>
Cc:     geert+renesas@glider.be, mturquette@baylibre.com, sboyd@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, linus.walleij@linaro.org,
        gregkh@linuxfoundation.org, jirislaby@kernel.org,
        magnus.damm@gmail.com, catalin.marinas@arm.com, will@kernel.org,
        prabhakar.mahadev-lad.rj@bp.renesas.com,
        biju.das.jz@bp.renesas.com, quic_bjorande@quicinc.com,
        arnd@arndb.de, konrad.dybcio@linaro.org, neil.armstrong@linaro.org,
        nfraprado@collabora.com, rafal@milecki.pl,
        wsa+renesas@sang-engineering.com,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, 12 Sept 2023 at 06:53, Claudiu <claudiu.beznea@tuxon.dev> wrote:
>
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Document support for the SD Card/MMC interface on the Renesas
> RZ/G3S (R9A08G045) SoC.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> index 7756a8687eaf..94e228787630 100644
> --- a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> +++ b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> @@ -59,6 +59,7 @@ properties:
>                - renesas,sdhi-r9a07g043 # RZ/G2UL
>                - renesas,sdhi-r9a07g044 # RZ/G2{L,LC}
>                - renesas,sdhi-r9a07g054 # RZ/V2L
> +              - renesas,sdhi-r9a08g045 # RZ/G3S
>                - renesas,sdhi-r9a09g011 # RZ/V2M
>            - const: renesas,rcar-gen3-sdhi # R-Car Gen3 or RZ/G2
>        - items:
> @@ -122,6 +123,7 @@ allOf:
>                - renesas,sdhi-r9a07g043
>                - renesas,sdhi-r9a07g044
>                - renesas,sdhi-r9a07g054
> +              - renesas,sdhi-r9a08g045
>                - renesas,sdhi-r9a09g011
>      then:
>        properties:
> --
> 2.39.2
>
