Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6445850DAEC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 Apr 2022 10:14:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231984AbiDYIRF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 25 Apr 2022 04:17:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232839AbiDYIRE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Apr 2022 04:17:04 -0400
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66E6E5A16C;
        Mon, 25 Apr 2022 01:14:01 -0700 (PDT)
Received: by mail-qt1-f182.google.com with SMTP id f14so9808932qtq.1;
        Mon, 25 Apr 2022 01:14:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=F7U/KEQ9B6U32KdVgSOLiGLtNTsluNDbAsczMwIvu3o=;
        b=g0vac/KnQCpcvrU2WmNy6ArC2VkZOYQiZxbd92PbB0owvoSAH74G7I8q3bxjyAOjG5
         tqDvI/Ecqv7aAecmzpIm8ZkR/aXyjqSTL96dL7gj8OXCsebOme2Y3RgLsNCOMGE+6Sdj
         PxB2bla7K22/Im45pRA5KsulG0Oiq0KDeZlsqvde0FDlrHqra7wbVmdn8S3c7DBenFcD
         C+QJoF0gWwrXNZ0M2pqww+wBXToAPhLsuuYuPyc1y24YTl8fXqALJJyEv/4YZige9mlc
         OjOiFLlLAX+AyCIBGQE7O0dUW0gSkbJ1Su02Fzo7dK+gYWSheWfKED87dPpZ6qAkro6y
         d+Ng==
X-Gm-Message-State: AOAM532WKEpNnBJvw444iMTpYX7dkem8Xtl96+HjIcka0JmGDYv36/03
        nu0ejM/r0xjrvFdohldxeUljg75UwvnS7Q==
X-Google-Smtp-Source: ABdhPJy599p54WfugtNAdf4u7UdBwDofzMOyTJRRNlDWs/kluYBu1a46432dnh1XJnRgLZUGRuYMDg==
X-Received: by 2002:a05:622a:205:b0:2f3:54b8:5f44 with SMTP id b5-20020a05622a020500b002f354b85f44mr10854735qtx.336.1650874440297;
        Mon, 25 Apr 2022 01:14:00 -0700 (PDT)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com. [209.85.219.175])
        by smtp.gmail.com with ESMTPSA id 2-20020a05620a06c200b0069ea498aec7sm4667216qky.16.2022.04.25.01.13.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Apr 2022 01:14:00 -0700 (PDT)
Received: by mail-yb1-f175.google.com with SMTP id m128so7685181ybm.5;
        Mon, 25 Apr 2022 01:13:59 -0700 (PDT)
X-Received: by 2002:a25:3492:0:b0:645:6f78:b3b4 with SMTP id
 b140-20020a253492000000b006456f78b3b4mr15310394yba.546.1650874439642; Mon, 25
 Apr 2022 01:13:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220425064201.459633-1-yoshihiro.shimoda.uh@renesas.com> <20220425064201.459633-4-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20220425064201.459633-4-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 25 Apr 2022 10:13:46 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV+od9MHQt=4pDOdXHNJ6+DtQPxQ8F3UmLuFz+O=+vLuQ@mail.gmail.com>
Message-ID: <CAMuHMdV+od9MHQt=4pDOdXHNJ6+DtQPxQ8F3UmLuFz+O=+vLuQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] dt-bindings: serial: renesas,hscif: Document
 r8a779g0 bindings
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
> R-Car V4H (R8A779G0) SoC has the R-Car Gen4 compatible HSCIF ports,
> so document the SoC specific bindings.
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
