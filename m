Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C61F5B38A8
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Sep 2022 15:11:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230164AbiIINK4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 9 Sep 2022 09:10:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229601AbiIINKz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 9 Sep 2022 09:10:55 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2520483F24
        for <linux-renesas-soc@vger.kernel.org>; Fri,  9 Sep 2022 06:10:49 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id 29so2453097edv.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 09 Sep 2022 06:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=bsMm0nu+g7i1NmtcNEyPla/T7DHXogikmWezyYUdeVI=;
        b=FiGmnfg3S7AUDv0OIYfaTQy6w0Q7WCv9N8nh/rLbH5hgJbl7qBEJh5N6E/DVggPzAe
         ioqFKl6gBXxg3+E5ZHJVVhyA6HGAL9k9Ga/PbE8SUFBWDk7fj+PWXEHPF07dwVaTlsJZ
         RWM3PoSL+25CQO1duTdOXdi55dQeUrBuhBA+ed0gnz4frq/0A+iCtYgH8F9ohVggXWwe
         KwEkfB83U23h5m3unO71YqZfHKmXY4rlX3LVvhsJrXz6cV+KSqeTazniGqJDtkDfY2Xv
         mvxyonYHPbr4a/mw0bOTfv1ewbtl3EY4R/iGiM8yo4CjDtjVx3niAHCfsqQ8Ocrc1J1a
         3dKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=bsMm0nu+g7i1NmtcNEyPla/T7DHXogikmWezyYUdeVI=;
        b=rlbVK2YEdBkgQciC3wJc73SHrpsl7bfPDePN2QSknz1v3FAvij2oe07MYWNH4qinTJ
         vzBQSFjzlqlUchLk7oGgaLX2pIsLA8EeJDvmAJvriBe5MiumrsdJbU43Rmp7wthBql4O
         PFEnLnnnPHz5oK9Dr/KZ+ddlmZI9pYV7sVeHq/4yo3Fitp5sasSln1fEa2EVrMboQMyj
         UZj+/KGEc04ggqA2U0G7ntDCnzHrefazxub81OsymLxjhibhsFV+XjBHI1OS7FJNNn3q
         h+LyHb7GIxuJ7XfAQoMwC8ku2NIk+3ibAY6r978Qzag2NbuDVsQyESLnraLdNKb3qqVc
         vxyw==
X-Gm-Message-State: ACgBeo0gKe6rIXv4/d4aWhjU8AxgOczBfJ6KqrdWcFwiZGCkfdaURmb9
        /DHttKdMyw2MWsyW9e3IhmGIhUeJk6XI8TgK+F5WWw==
X-Google-Smtp-Source: AA6agR4rLLw+2Mto2FpA5ylVcQgfsw/VaaN2Qj6skwfPvRFieasT15e8jBuvji+aQt2J7BgeABU3RO/b1tEnhAymIVY=
X-Received: by 2002:a05:6402:1d8c:b0:44e:dec5:512b with SMTP id
 dk12-20020a0564021d8c00b0044edec5512bmr11273909edb.408.1662729047659; Fri, 09
 Sep 2022 06:10:47 -0700 (PDT)
MIME-Version: 1.0
References: <649e875962b486e0bf849aba8f386eb6290a433a.1662714555.git.geert+renesas@glider.be>
In-Reply-To: <649e875962b486e0bf849aba8f386eb6290a433a.1662714555.git.geert+renesas@glider.be>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 9 Sep 2022 15:10:36 +0200
Message-ID: <CAMRc=MdCLu3415xvr6vVmNCvD5_k49L3XS3K6ue-fPmiiW2n8w@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: gpio: renesas,rcar-gpio: Add r8a779g0 support
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Sep 9, 2022 at 11:09 AM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> Document support for the GPIO controller blocks in the Renesas R-Car
> V4H (R8A779G0) SoC.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  Documentation/devicetree/bindings/gpio/renesas,rcar-gpio.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/gpio/renesas,rcar-gpio.yaml b/Documentation/devicetree/bindings/gpio/renesas,rcar-gpio.yaml
> index 75e5da6a7cc04bbd..aa424e2b95f87a51 100644
> --- a/Documentation/devicetree/bindings/gpio/renesas,rcar-gpio.yaml
> +++ b/Documentation/devicetree/bindings/gpio/renesas,rcar-gpio.yaml
> @@ -52,6 +52,7 @@ properties:
>            - enum:
>                - renesas,gpio-r8a779a0     # R-Car V3U
>                - renesas,gpio-r8a779f0     # R-Car S4-8
> +              - renesas,gpio-r8a779g0     # R-Car V4H
>            - const: renesas,rcar-gen4-gpio # R-Car Gen4
>
>    reg:
> --
> 2.25.1
>

Applied, thanks!

Bart
