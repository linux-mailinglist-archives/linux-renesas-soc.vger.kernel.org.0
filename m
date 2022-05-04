Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB9C4519A36
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 May 2022 10:44:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229830AbiEDIrf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 4 May 2022 04:47:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234984AbiEDIre (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 May 2022 04:47:34 -0400
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70E1524960;
        Wed,  4 May 2022 01:43:59 -0700 (PDT)
Received: by mail-qk1-f179.google.com with SMTP id f186so478048qke.8;
        Wed, 04 May 2022 01:43:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=etCmmGbdqfSovDMPSIMDpVA9G5HhkSK5VFX/3c/tSXI=;
        b=j5oL5MVA07D4Ufv+7QmtWu2i9HMd59cVuaI5AgGFNvXdXAcwq/6t6pLx+Lx9R5Yr02
         gUBg0qV1yWDay95/EqWn4nVGkzbofUmppEbYJzYQR+Ft8H+s0bj1/9YFIewuXNXijATW
         jVr77hAfGeKc9HwG4YqysJXjRfhF1aUYozfVRZbIadHfUwWqiCSFF4IaPhzMK1A0zdDI
         DQ4RshFfGqMh2ClCyHT06yivjWmc639c+7Vx9/laXgx9l3vZl2uB2zWOxRBkoiemOi2y
         My/FCjZAV4WYZ6gcnHytVDD2rF5rtIUJsw5IKpvQruZaXiLiFpbBxqy8AFeYmPAyBDCj
         s4hg==
X-Gm-Message-State: AOAM5326Am3Kj+/RUI43tPPBqCTV/Ha86JQMs+Cml0LuxoK1Il0L44cu
        SecGE8CNRrAD22woKVcQiwlNFWu2aU2EcQ==
X-Google-Smtp-Source: ABdhPJwkHx6B7FN9D0JhCh0x7NghmxZp9xl8d1n9k5p1phJI/vDMUmp/GAQtyWylTcqw7WBY752pJQ==
X-Received: by 2002:a05:620a:1087:b0:6a0:151:658 with SMTP id g7-20020a05620a108700b006a001510658mr5155900qkk.108.1651653838318;
        Wed, 04 May 2022 01:43:58 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id f24-20020a37ad18000000b0069fc13ce240sm7007032qkm.113.2022.05.04.01.43.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 May 2022 01:43:58 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-2f83983782fso7854557b3.6;
        Wed, 04 May 2022 01:43:57 -0700 (PDT)
X-Received: by 2002:a81:913:0:b0:2f7:c833:f304 with SMTP id
 19-20020a810913000000b002f7c833f304mr18796292ywj.283.1651653837529; Wed, 04
 May 2022 01:43:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220503115557.53370-1-phil.edworthy@renesas.com> <20220503115557.53370-3-phil.edworthy@renesas.com>
In-Reply-To: <20220503115557.53370-3-phil.edworthy@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 4 May 2022 10:43:46 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX5Uc74p3DfGDzcERmVuYTjam2xWgo+=1ew6hRBzZ-16g@mail.gmail.com>
Message-ID: <CAMuHMdX5Uc74p3DfGDzcERmVuYTjam2xWgo+=1ew6hRBzZ-16g@mail.gmail.com>
Subject: Re: [PATCH v3 02/12] dt-bindings: clock: Add r9a09g011 CPG Clock Definitions
To:     Phil Edworthy <phil.edworthy@renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>
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

On Tue, May 3, 2022 at 2:01 PM Phil Edworthy <phil.edworthy@renesas.com> wrote:
> Define RZ/V2M (R9A09G011) Clock Pulse Generator module clock outputs
> (CPG_CLK_ON* registers), and reset definitions (CPG_RST_* registers)
> in Section 48.5 ("Register Description") of the RZ/V2M Hardware User's
> Manual (Rev. 1.10, Sep. 2021).
>
> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v3:
>  - Add missing clocks and resets.
>  - Change names of ETH clocks to ETH0, even though there is just one ETH,
>    to match the HW manual.
>  - Change names of IIC PCLKs to better match the HW manual

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in a branch shared by driver and DT source files.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
