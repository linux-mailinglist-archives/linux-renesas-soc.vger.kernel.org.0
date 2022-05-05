Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E77551BBE9
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 May 2022 11:22:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352746AbiEEJ0V (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 5 May 2022 05:26:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352609AbiEEJ0Q (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 5 May 2022 05:26:16 -0400
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09DED4D25A;
        Thu,  5 May 2022 02:22:38 -0700 (PDT)
Received: by mail-qv1-f46.google.com with SMTP id l1so199046qvh.1;
        Thu, 05 May 2022 02:22:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6aeBtjWxwV0FYmaz1d61r1GgyEeyLd4j9oGUOYgTCiA=;
        b=b7UHUP/hxBvPMOzRuMX/2kSi2LE2Czu8X08w68CZ7oz7y1D11FyvfPCdIzOiQChsZR
         +HXe0cT3L5Jn2Mz7kg4J7n/I6HWEWnm2QAz386qk882lX03Ajh3rJaqqLfJcrJP2vXXT
         8URVI6i0Kq0nxaGjXYVtyDzSB3cf475JaG0NdV6MWdBO9C7ar+aM1kBbbp0SStUJKplz
         sLQ8JpV9vY5D1Ff3BHpJDQrqXuzLV1LHCLp/LoPozUni21VMYGH4NDJR7Yk4CxAjO79w
         MS5QPlMIX4/fe0eVn2BtV0uCiCwV49ZYrn+yomPjFYVVjySEKwu0z4Gk/YGtchK5/pOX
         tO1g==
X-Gm-Message-State: AOAM5304ZLr8HBB9M3Y1CMCil2HgIbYpSHIVPSroth5SrfyHHrDF1S/u
        MpMl86UBq9zqJosUTuEqPIUtwHHaxcN0SQ==
X-Google-Smtp-Source: ABdhPJwJc0gaE1szT774g6ziUdZTgUjgaJJ9mUYsp4iTVgv0o05wDBPAv3RuD3/hT5Sg1qADYVn8ng==
X-Received: by 2002:ad4:5389:0:b0:42d:a3cf:1b67 with SMTP id i9-20020ad45389000000b0042da3cf1b67mr21244205qvv.129.1651742556865;
        Thu, 05 May 2022 02:22:36 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id y12-20020ac8524c000000b002f39b99f695sm549796qtn.47.2022.05.05.02.22.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 May 2022 02:22:36 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-2f83983782fso41831617b3.6;
        Thu, 05 May 2022 02:22:36 -0700 (PDT)
X-Received: by 2002:a0d:d953:0:b0:2f7:d5ce:f204 with SMTP id
 b80-20020a0dd953000000b002f7d5cef204mr22533446ywe.502.1651742556112; Thu, 05
 May 2022 02:22:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220501082508.25511-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdV07CHm3NE9YUTMqp-ZNkWoJyR6CFU9PA0heK+9G6NDxw@mail.gmail.com> <48a6fd28-b0cc-d17d-4e0c-170240d05455@linaro.org>
In-Reply-To: <48a6fd28-b0cc-d17d-4e0c-170240d05455@linaro.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 5 May 2022 11:22:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWutPYzG6nVmwBfuEPnTYb8BxSuW9xZXtjvTU0_t4UtrA@mail.gmail.com>
Message-ID: <CAMuHMdWutPYzG6nVmwBfuEPnTYb8BxSuW9xZXtjvTU0_t4UtrA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: memory: renesas,rpc-if: Document RZ/G2UL SoC
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Krzysztof,

On Thu, May 5, 2022 at 11:06 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> On 02/05/2022 17:03, Geert Uytterhoeven wrote:
> > On Sun, May 1, 2022 at 10:25 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> >> Document RZ/G2UL RPC-IF bindings. RZ/G2UL RPC-IF is identical to one found
> >> on the RZ/G2L SoC. No driver changes are required as generic compatible
> >> string "renesas,rzg2l-rpc-if" will be used as a fallback.
> >>
> >> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> I already sent a mem-ctrl pull request and I was not planning for a next
> one, so maybe this could go via renesas tree?

Sure, will queue in renesas-devel for v5.19.

> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
