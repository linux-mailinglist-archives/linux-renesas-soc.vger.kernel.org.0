Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3EF9454562B
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Jun 2022 23:08:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345369AbiFIVI0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 Jun 2022 17:08:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345347AbiFIVIW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Jun 2022 17:08:22 -0400
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD7F1265618;
        Thu,  9 Jun 2022 14:08:21 -0700 (PDT)
Received: by mail-io1-f42.google.com with SMTP id 19so4115769iou.12;
        Thu, 09 Jun 2022 14:08:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HBb+5G3MZcLZ9Eu0p/SYuyebihah9e/OkQYxjtH+MYA=;
        b=C2B8CCrtqvp0jFfuMlRAc6noDs/71WXlPGLKKT54tUjHK6UuDbPUz+5HudD1CfmIJz
         xpeJ7S/VcaW9WjR1g5Vu+cyNJzDCkwcwOdF+/nF7kvy67ZY5ew8Fe4t7+D24Qn2SZipY
         k7HA8TPx1zJZvUtaFXpvIJdi2bNUfP6UxSVaufF0j1agUpoVeEdHcWe9onjDia84XwnD
         6txRmaXmONGsOzGsredcZ4P0XYpdGP/h3/wObM0M1jGICd3CjRnSx3V6hqwmYInpQQhz
         yM2962lKDF2PNlLLALtXDDUlR0kzmwBFdunSvevzTmkpDYxu6zv+uKJ8d8zQByGi9Zy2
         inJQ==
X-Gm-Message-State: AOAM532L5RFVdOt0ueMQkMs8apJXhiaCkurhgeUxE2cdYtnV9azKB7eM
        qJfYRZAIYHdA++06at70vg==
X-Google-Smtp-Source: ABdhPJw5RWS3nIPBqHy85e1pnWSGRZzHEln3TTeQSjEEJPSUY3KcNrvPxHu3/qMKOhZU0fixvwD9Xg==
X-Received: by 2002:a05:6602:1508:b0:669:5f3b:fcbe with SMTP id g8-20020a056602150800b006695f3bfcbemr9458341iow.29.1654808900893;
        Thu, 09 Jun 2022 14:08:20 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id w4-20020a029004000000b00331fbd37178sm1806036jaf.96.2022.06.09.14.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 14:08:20 -0700 (PDT)
Received: (nullmailer pid 101857 invoked by uid 1000);
        Thu, 09 Jun 2022 21:08:18 -0000
Date:   Thu, 9 Jun 2022 15:08:18 -0600
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: clock: renesas,rzg2l: Simplify header file
 references
Message-ID: <20220609210818.GA101806-robh@kernel.org>
References: <f274ad16010798dd4a45d2dca5f870da8acbb470.1654696009.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f274ad16010798dd4a45d2dca5f870da8acbb470.1654696009.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, 08 Jun 2022 15:49:33 +0200, Geert Uytterhoeven wrote:
> The bindings already uses <dt-bindings/clock/r9a0*-cpg.h> to refer to
> the header files with DT binding definitions for core clocks.
> Use more wildcards to simplify more references to these files.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> To be queued in renesas-clk-for-v5.20.
> 
>  .../devicetree/bindings/clock/renesas,rzg2l-cpg.yaml       | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
