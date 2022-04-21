Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0EECB509C63
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Apr 2022 11:39:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1387729AbiDUJko (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 21 Apr 2022 05:40:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1387733AbiDUJkn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Apr 2022 05:40:43 -0400
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C447920F74;
        Thu, 21 Apr 2022 02:37:54 -0700 (PDT)
Received: by mail-qk1-f174.google.com with SMTP id c1so3119137qkf.13;
        Thu, 21 Apr 2022 02:37:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=X9Lk3PBh+IwvSiLoSAF6P9XUjGj6evOjS5QMaEqo9MA=;
        b=3qXFjV8D6r/sD9+o5/ZISI89v/meX23wmgpCfOCMAQIzLXzxSvjt8SG5Za6IJ2xfF8
         JUMxQZ5j14rwSIrq1UQUpsN8oVr32KwaLzWVS/v050mHvG4mQiCluZOapPuZAZYRuA9n
         oC9KnHtLCZv5U7MetkoxLqp8d7CUSjgh46S8azVp0OFlS9+9QMLV9agLyRfP+j7/MfLG
         rjdYjVJugt/p4Yc1fdAX7s69kB8Mvmn9NA06SnoAbLoXuhwQstIJwaPQtT1F8/itZj5l
         IUfJlsWmnYpeXwMxGIg9k8TBH2UH9xKRD7mYSn8I2PWgvPqsbTzU4YWfeFIf6hjIbkQ8
         JYLA==
X-Gm-Message-State: AOAM531kopAJDMPczktEramk7K39IRp1w7NsxNSlyTQRzRBVsR98npDq
        UIgcz0TnNmed2DKCTY7jghD7nHEe0ZKDPzXj
X-Google-Smtp-Source: ABdhPJwuD5/ugz4KWC8619XN5oBe4e9mS157uUGXvu6q7rZizHNY8ikWT0/WPtntJ+FKLsv7xNU41A==
X-Received: by 2002:ae9:ed90:0:b0:69c:90ff:ff0 with SMTP id c138-20020ae9ed90000000b0069c90ff0ff0mr15003705qkg.406.1650533873797;
        Thu, 21 Apr 2022 02:37:53 -0700 (PDT)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com. [209.85.219.171])
        by smtp.gmail.com with ESMTPSA id f11-20020ac859cb000000b002f3438493a5sm1943183qtf.27.2022.04.21.02.37.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Apr 2022 02:37:53 -0700 (PDT)
Received: by mail-yb1-f171.google.com with SMTP id w133so5042095ybe.5;
        Thu, 21 Apr 2022 02:37:53 -0700 (PDT)
X-Received: by 2002:a25:8087:0:b0:641:dd06:577d with SMTP id
 n7-20020a258087000000b00641dd06577dmr23596955ybk.207.1650533873243; Thu, 21
 Apr 2022 02:37:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220420084255.375700-1-yoshihiro.shimoda.uh@renesas.com> <20220420084255.375700-7-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20220420084255.375700-7-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 21 Apr 2022 11:37:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW77GXWE=gu=mNfF8spjj26bbcbopMqBbgq1h7ZQmj1MA@mail.gmail.com>
Message-ID: <CAMuHMdW77GXWE=gu=mNfF8spjj26bbcbopMqBbgq1h7ZQmj1MA@mail.gmail.com>
Subject: Re: [PATCH 06/15] dt-bindings: clock: renesas,cpg-mssr: Document r8a779g0
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
> Add binding documentation for the R-Car V4H (R8A779G0) Clock Pulse
> Generator.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v5.19.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
