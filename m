Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E25E2509C6F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Apr 2022 11:39:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1387716AbiDUJkY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 21 Apr 2022 05:40:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1387720AbiDUJkY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Apr 2022 05:40:24 -0400
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A9941F609;
        Thu, 21 Apr 2022 02:37:35 -0700 (PDT)
Received: by mail-qk1-f178.google.com with SMTP id j9so3159432qkg.1;
        Thu, 21 Apr 2022 02:37:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JY2Bnnac6iaaoIAOqrXWy5G+ym45LLnBmxDJD5eYeKc=;
        b=rtxGWhCC4TALjWkAk+w+u/D+tpWD2o7sxO1vc/BMBfpIMG6KU9B9Ocs01Qo2cHJpyY
         3I9bPnJ7JyCRr0WNlPi+I1CTO/5JH+5utyEn+9HmZuKQYciN1quf6CCBYX/VBHkUtI4J
         s2Kywjyhi+rb3H+iETVUJ2LfBIf3t24CAdrHwZoFv9Ms234QpJgqBEBw06TWSCQVrtBX
         Sx3U1LKDZSbviA6VE0qZ4PncO+rQK43+JsAqrR7rTYinUE5mI2wGyYl6PHfU+MM4SGm5
         IQmifj27AJrD0BAEQ4txJh62CjY79urqso4SspkaPE2dX/JmqJ4ME45+OLjima3zIGhw
         sY9w==
X-Gm-Message-State: AOAM532RSZIzB38LUnRgEgym6/VZEAGY8Z1uJ1DpkCc9U2FWve787bDZ
        xyLyY23S/HS9dq1+kD4Kvu139BceqKX45KZi
X-Google-Smtp-Source: ABdhPJzGUs8TSp/bDJKU5WbzYvyWvle04CW2M/Eiahrbj3D0R92SJzvx6b1PxajujzzplYNobM9LKA==
X-Received: by 2002:a05:620a:29d5:b0:69e:c213:951e with SMTP id s21-20020a05620a29d500b0069ec213951emr7375529qkp.2.1650533854143;
        Thu, 21 Apr 2022 02:37:34 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id q27-20020a05620a039b00b0069c8307d9c4sm2667408qkm.18.2022.04.21.02.37.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Apr 2022 02:37:34 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id w133so5040693ybe.5;
        Thu, 21 Apr 2022 02:37:33 -0700 (PDT)
X-Received: by 2002:a25:3492:0:b0:645:6f78:b3b4 with SMTP id
 b140-20020a253492000000b006456f78b3b4mr3715481yba.546.1650533853630; Thu, 21
 Apr 2022 02:37:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220420084255.375700-1-yoshihiro.shimoda.uh@renesas.com> <20220420084255.375700-4-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20220420084255.375700-4-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 21 Apr 2022 11:37:22 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVi0b8mSQuU0Uw84G1_Lcs62RUQeJ69ASJ+8vkeJsueuA@mail.gmail.com>
Message-ID: <CAMuHMdVi0b8mSQuU0Uw84G1_Lcs62RUQeJ69ASJ+8vkeJsueuA@mail.gmail.com>
Subject: Re: [PATCH 03/15] dt-bindings: reset: renesas,rst: Document r8a779g0
 reset module
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Apr 20, 2022 at 10:43 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Document bindings for the R-Car V4H (R8A779G0) reset module.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.19.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
