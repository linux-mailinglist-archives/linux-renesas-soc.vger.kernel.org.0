Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6EAD9509C7A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Apr 2022 11:39:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1387724AbiDUJkV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 21 Apr 2022 05:40:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1384833AbiDUJkR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Apr 2022 05:40:17 -0400
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91CD911A1A;
        Thu, 21 Apr 2022 02:37:28 -0700 (PDT)
Received: by mail-qv1-f46.google.com with SMTP id e17so3260680qvj.11;
        Thu, 21 Apr 2022 02:37:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hqlZ/pJgCOhcNVgQm2ynTryJ/fjMrQAfeun5rCY8y0s=;
        b=OPArj0vsJlsvlPR+Wnf6V7VSq9RUGsRIvFfXbbEwVfGYQjWBQfuDCmAocAXsgMG7dX
         5pZgvY/tPd5Cuslse2kva8QxestBlGHPhQzzGfcW5sArr2JWRHbphY+nIAu/UdOcwWij
         JJhZPgvP9Bnpbf3j8PbqkP5x84dFvvqC88DGUHh0hV9e1ZKjN4WaxJNUuh0BQ2flWWbE
         dPtPV1zhungpUF+q2sTKF2Pvv3ZrdLrUGS+8A0SOBQPSPILqps1eaitq2L/+KBVUY+c7
         KGFVCOyFruj5Fto1MpPd2CzHUGmqXSJzL0LlPCp0cL5DtlnVfvG8KJ4EWw2P2V1aYyAR
         oe5g==
X-Gm-Message-State: AOAM5318LHI6PTtdJKdjqFGC/oq3ddAxFSTOKi762suBdpT7HnJtVOZa
        LfbAeq/By7WoI6iYM7rV4ijDyYB8THsxpDR4
X-Google-Smtp-Source: ABdhPJxo8i1mhGd8UT2Vv5zoCJ+pqVyNSUaejzb8NmuOUVP/F9nGKwtiM03ame2IfCuzIvhUsCY7WQ==
X-Received: by 2002:a05:6214:258e:b0:44b:76d7:b10c with SMTP id fq14-20020a056214258e00b0044b76d7b10cmr4260495qvb.8.1650533847614;
        Thu, 21 Apr 2022 02:37:27 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id a28-20020a05620a02fc00b0069e8e766a0csm2657984qko.94.2022.04.21.02.37.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Apr 2022 02:37:27 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id b95so7742700ybi.1;
        Thu, 21 Apr 2022 02:37:27 -0700 (PDT)
X-Received: by 2002:a05:6902:724:b0:644:c37b:4e21 with SMTP id
 l4-20020a056902072400b00644c37b4e21mr24023379ybt.6.1650533846942; Thu, 21 Apr
 2022 02:37:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220420084255.375700-1-yoshihiro.shimoda.uh@renesas.com> <20220420084255.375700-3-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20220420084255.375700-3-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 21 Apr 2022 11:37:15 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXnonZqbc3quSY7Npz374frO2K1JOkfAQ8G+nKHoeaQVg@mail.gmail.com>
Message-ID: <CAMuHMdXnonZqbc3quSY7Npz374frO2K1JOkfAQ8G+nKHoeaQVg@mail.gmail.com>
Subject: Re: [PATCH 02/15] dt-bindings: arm: renesas: Document Renesas White
 Hawk boards
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
> Add device tree bindings documentation for Renesas R-Car V4H
> White Hawk CPU and BreakOut boards.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.19, squashed with PATCH 01/15,
as requested by Krzysztof.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
