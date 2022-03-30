Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 32F684EC53E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Mar 2022 15:09:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241644AbiC3NLN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 30 Mar 2022 09:11:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241260AbiC3NLN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 Mar 2022 09:11:13 -0400
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 399291C137;
        Wed, 30 Mar 2022 06:09:23 -0700 (PDT)
Received: by mail-qt1-f182.google.com with SMTP id t2so17931163qtw.9;
        Wed, 30 Mar 2022 06:09:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eZU9oF+xz/bzZDI8feYTq1agAL7IlbEFm36bocb0y+c=;
        b=c/rWoVlpLdmJOsDv8vBJCHD5glusSRB1o0CsV7gPCdrdGlujLpCBWtfD/PADJe1GPm
         Qx9vUA4D8kXddnIOlW+pNM7fAv4YXHhsXzUy+Y7At0R/GXrHODTEj4PMrtss7ZNUajfQ
         mmaHA1zAP13u5pDFDCj7Za9jjzTId4M2buC+aJsRg6aNGnVKQfwR7yIsrf5TfO/fkXpI
         ttz65GuURbgvUg3VUiqbejBOiWJ35zR68KWBCyk199xHqtCsXDYjygEizd0Vo8OkQeI1
         A9ibOf0cxrR0pVNf66nXHflziLBhC/gxNqXxu4ISUgRGLCbAi+MLaaoXXhNaHrvtJqBF
         FTog==
X-Gm-Message-State: AOAM532bEs/tttfav3L8k1/CS8qgPCeLjwdJxQ5X1sQTJPBF32b1tuWV
        YfFic02ZHpeLwrme0iNxRHgWzKm88QwIxA==
X-Google-Smtp-Source: ABdhPJzD+P13fm4fOY0Hnk8zcAHSIchd8BTfejW0lP1Q/UvBFP8XxoOZ2QsVxKScbkHSYoKdnfPRyg==
X-Received: by 2002:ac8:5a83:0:b0:2e1:bbda:3b17 with SMTP id c3-20020ac85a83000000b002e1bbda3b17mr31901056qtc.236.1648645762133;
        Wed, 30 Mar 2022 06:09:22 -0700 (PDT)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com. [209.85.219.179])
        by smtp.gmail.com with ESMTPSA id p64-20020a37a643000000b0067d9afad07asm10866955qke.76.2022.03.30.06.09.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Mar 2022 06:09:21 -0700 (PDT)
Received: by mail-yb1-f179.google.com with SMTP id f23so6248418ybj.7;
        Wed, 30 Mar 2022 06:09:21 -0700 (PDT)
X-Received: by 2002:a25:aa0e:0:b0:633:7c3b:94a0 with SMTP id
 s14-20020a25aa0e000000b006337c3b94a0mr33650098ybi.546.1648645761446; Wed, 30
 Mar 2022 06:09:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220315142644.17660-1-biju.das.jz@bp.renesas.com> <20220315142644.17660-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220315142644.17660-2-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 30 Mar 2022 15:09:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU9_8_1PAcujWQgU3VrGsOAdj+72NWeotR6_h3uCix0Lw@mail.gmail.com>
Message-ID: <CAMuHMdU9_8_1PAcujWQgU3VrGsOAdj+72NWeotR6_h3uCix0Lw@mail.gmail.com>
Subject: Re: [PATCH v3 1/7] dt-bindings: power: renesas,rzg2l-sysc: Document
 RZ/G2UL SoC
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Tue, Mar 15, 2022 at 3:26 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add DT binding documentation for SYSC controller found on RZ/G2UL SoC's.
> SYSC controller found on the RZ/G2UL SoC is almost identical to one found
> on the RZ/G2L SoC's only difference being that the RZ/G2UL has only CA55
> core0 reset vector address configuration register.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
> v2->v3:
>  * Changed the compatible from r9a07g043u-sysc->r9a07g043-sysc
>  * Retained Rb tag from Rob as it is trivial change.

Thanks for the update!

> --- a/Documentation/devicetree/bindings/power/renesas,rzg2l-sysc.yaml
> +++ b/Documentation/devicetree/bindings/power/renesas,rzg2l-sysc.yaml

> @@ -20,8 +20,9 @@ description:
>  properties:
>    compatible:
>      enum:
> -      - renesas,r9a07g044-sysc # RZ/G2{L,LC}
> -      - renesas,r9a07g054-sysc # RZ/V2L
> +      - renesas,r9a07g043-sysc  # RZ/G2UL
> +      - renesas,r9a07g044-sysc  # RZ/G2{L,LC}
> +      - renesas,r9a07g054-sysc  # RZ/V2L

No need to add one more space before the #.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.19, with the above fixed.
No need to resend.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
