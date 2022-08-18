Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1396A59826C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Aug 2022 13:44:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233816AbiHRLn0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 18 Aug 2022 07:43:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244250AbiHRLnY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 Aug 2022 07:43:24 -0400
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BE2D32EFA;
        Thu, 18 Aug 2022 04:43:24 -0700 (PDT)
Received: by mail-qk1-f169.google.com with SMTP id f4so866348qkl.7;
        Thu, 18 Aug 2022 04:43:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=bcE9G0rpJRwBab3vXA/j8OLyQU1Ewpv88NG9kz1ar5U=;
        b=5+HGJebYZ8htBubBNm03HzqRxZy5HEwVLhYuH51Fm/RhTdiNEEc6iafCOH0/csWpte
         IX17vSVtkRN/R/x7hSCl2/HbTsWmcLVNFs/i03urNl6RxO97wdVV13Cg+673+2HTw9eZ
         qTlyI/i1l8yq/ZA/2giYUpfM7BffOemj0YculZNhD8Dq8v3X/KV5+NZAVrkUPG3j9B/x
         j+vhR2PFhpSpKaXGpJmdOz4RVrWlINZldiCX1mDcHtAvSMed5q1X8u2yo6TLcnvtIujZ
         rdyHK3tpbGysCRdjv/b1pwSspq7Q0/q4jcAP2vS/u+hDR1BDAW3lhSi76/XIJx/XGXeN
         6kiQ==
X-Gm-Message-State: ACgBeo1gM74Zj29fxDt4edbyddhDrag/zICDaex7unVxeut9zzGWnRVa
        2J0zzniWhw2IfiXpAD/t6sF9U65TncjD3A==
X-Google-Smtp-Source: AA6agR5sUAHcKFlWCeFClHMoncvHH6ypmA8t8ZniE7Yo+HHzZ1gRYK7Ef7fiaT/6UKm9UZfp/x4cVg==
X-Received: by 2002:ae9:dc45:0:b0:6bb:19f:c35a with SMTP id q66-20020ae9dc45000000b006bb019fc35amr1668326qkf.639.1660823002819;
        Thu, 18 Aug 2022 04:43:22 -0700 (PDT)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id b15-20020ac85bcf000000b0031d283f4c4dsm841299qtb.60.2022.08.18.04.43.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Aug 2022 04:43:22 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-33387bf0c4aso33119887b3.11;
        Thu, 18 Aug 2022 04:43:22 -0700 (PDT)
X-Received: by 2002:a81:658:0:b0:334:a23e:6caa with SMTP id
 85-20020a810658000000b00334a23e6caamr2253359ywg.283.1660823001912; Thu, 18
 Aug 2022 04:43:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220802101534.1401342-1-biju.das.jz@bp.renesas.com> <20220802101534.1401342-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220802101534.1401342-3-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 18 Aug 2022 13:43:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVYipdMJ8uT41E4ffrrqTkD=JogeOuLOB0KZ5gvaHYDnQ@mail.gmail.com>
Message-ID: <CAMuHMdVYipdMJ8uT41E4ffrrqTkD=JogeOuLOB0KZ5gvaHYDnQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: renesas: r9a07g043: Fix SCI{Rx,Tx}
 interrupt type
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
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

On Tue, Aug 2, 2022 at 12:15 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> As per the RZ/G2UL Hardware User's Manual (Rev.1.00 Apr, 2022),
> the interrupt type of SCI{Rx,TX} is edge triggered.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Fixes: cf40c9689e5109bf ("arm64: dts: renesas: Add initial DTSI for
RZ/G2UL SoC")
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.1.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
