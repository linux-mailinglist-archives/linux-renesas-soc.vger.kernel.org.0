Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D1D01511B33
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Apr 2022 16:57:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238725AbiD0O4A (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 27 Apr 2022 10:56:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238641AbiD0Oz7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 27 Apr 2022 10:55:59 -0400
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89B5D41F8A;
        Wed, 27 Apr 2022 07:52:48 -0700 (PDT)
Received: by mail-qt1-f169.google.com with SMTP id e15so1291954qtp.3;
        Wed, 27 Apr 2022 07:52:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=H90oGEfoz8l6kJ1E0LHARHNPa/nAVse3+GW5j3Vf2lI=;
        b=4+lKiQZQDUkr7qy6zuF/sdSzpX0DtsREoYiK0y/dBnTHOWkA2tl22Ojh2as0izICJw
         NjAcrb+F/bc3MmkRWI8YNcON0adxb3uxlxgF8zLyXYAZIui7kBMFhzgj/CGL7IzipXKA
         7w6nx4RSIjhkkGQcNodM+inzutBki6cvUKYlYPIp0QPYDsabazw+/h69yEH6LnyK+QWG
         HR6C3uV8FyIpjzXneTMuvncjuyNGBSyWcUcqPHf/kFb0oH4YUfgOCWXoAYpIJ/bAfxop
         pRFjUUtz+mzvvtQPdsDKzOKtyACvGqgDvUSRzhBMVKzke7FpU3NORf6Ggk4CkZbZ1h6a
         YTkA==
X-Gm-Message-State: AOAM530oYw+dGno4hOKFEyP5lwOAgLFUR/M2pO7aR4esLtihqd/N9L2G
        AISyvc2CrqjwQjMHRrLgB3aa//52GRBlCA==
X-Google-Smtp-Source: ABdhPJyPI4S4ttg53jN2A4YML+nKmXnpxbT1C99X4M6FzEKJN4JISkp+D5QyFIWemVd8pODB0t/Nlw==
X-Received: by 2002:ac8:5e07:0:b0:2f3:6db4:5c8a with SMTP id h7-20020ac85e07000000b002f36db45c8amr8714543qtx.31.1651071167472;
        Wed, 27 Apr 2022 07:52:47 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id c4-20020a37b304000000b0069ec13803adsm8057005qkf.7.2022.04.27.07.52.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Apr 2022 07:52:47 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-2ef5380669cso21505797b3.9;
        Wed, 27 Apr 2022 07:52:46 -0700 (PDT)
X-Received: by 2002:a81:5210:0:b0:2ef:21e3:54dd with SMTP id
 g16-20020a815210000000b002ef21e354ddmr27670349ywb.438.1651071166740; Wed, 27
 Apr 2022 07:52:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220425064201.459633-1-yoshihiro.shimoda.uh@renesas.com> <20220425064201.459633-8-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20220425064201.459633-8-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 27 Apr 2022 16:52:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUBhm7ANxDYT21_3vW40u0QbLRQcQz0eKROTcnwoKY4dA@mail.gmail.com>
Message-ID: <CAMuHMdUBhm7ANxDYT21_3vW40u0QbLRQcQz0eKROTcnwoKY4dA@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] arm64: dts: renesas: Add Renesas White Hawk boards support
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Apr 25, 2022 at 8:42 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Initial support for the Renesas White Hawk CPU and BreakOut boards.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
