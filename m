Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27ACB74842C
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Jul 2023 14:30:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231407AbjGEMaH convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 5 Jul 2023 08:30:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229903AbjGEMaG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Jul 2023 08:30:06 -0400
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC782B0
        for <linux-renesas-soc@vger.kernel.org>; Wed,  5 Jul 2023 05:30:05 -0700 (PDT)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-579d5d89b41so55495077b3.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 05 Jul 2023 05:30:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688560205; x=1691152205;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cqNEbwswwzkjR9Ilv7jVxpET/m8I16dsmmWGNBto03I=;
        b=giLTHRLKzCyCxQBsusZGK50w1x3UddKkvUM1esvhq6DV8SYrFL+OgynwdKxPddF4xm
         RzBZT9RnBwNZ8XyFB4QyKl8vSm+QI4blXl526B+Qd6Hc/NqA1Yfs0rlEwZMIR3xhdZCN
         hBebuIjlO88LRz9UoUMGxwf0E62A/jQFMT6AUszVe06kJyPQkY3eHxHBd6CTgqKshXgW
         Wtm73cS/7E97h+bowiEcKBVr45IOp9CEaM/CYtNwCXZisSfapQXm4S2H+D2dE/74+CUV
         Ue0IalBNc6kGdls4XepiXOOb2WRxu/BuQWNqCetArLH4HEQcO/cAF/HmtGkw7ZIeKK5g
         gHew==
X-Gm-Message-State: ABy/qLbquFlrMtLijuvSnhN493P4ceYvW/BWPpqXNuzzHLwyHWY+kjTo
        V6g0F3hLKMv4p+ARVdhJnZULBnKtMlx63w==
X-Google-Smtp-Source: APBJJlFA3z+tZlE1zfbLIuf0R2vSbg3tYLambAVs5gdZ28cmXz5gvcYK3Xov4HGkBmtkbDVXGJXByg==
X-Received: by 2002:a0d:f003:0:b0:577:18a8:b7f9 with SMTP id z3-20020a0df003000000b0057718a8b7f9mr15788529ywe.40.1688560204910;
        Wed, 05 Jul 2023 05:30:04 -0700 (PDT)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com. [209.85.219.173])
        by smtp.gmail.com with ESMTPSA id a2-20020a0dd802000000b0054f9e7fed7asm6182649ywe.137.2023.07.05.05.30.03
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jul 2023 05:30:04 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-c5ffb6cda23so1297710276.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 05 Jul 2023 05:30:03 -0700 (PDT)
X-Received: by 2002:a25:ba51:0:b0:c5c:e905:cb6 with SMTP id
 z17-20020a25ba51000000b00c5ce9050cb6mr4160588ybj.41.1688560203691; Wed, 05
 Jul 2023 05:30:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230703132706.355237-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230703132706.355237-1-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 5 Jul 2023 14:29:52 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUsNpCqwv95kBmrHh-GueBRr-qMJJb5vCePkULNhRq46w@mail.gmail.com>
Message-ID: <CAMuHMdUsNpCqwv95kBmrHh-GueBRr-qMJJb5vCePkULNhRq46w@mail.gmail.com>
Subject: Re: [PATCH] arm64: defconfig: Enable Renesas MTU3a PWM config
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= 
        <nfraprado@collabora.com>, Mark Brown <broonie@kernel.org>,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
        linux-arm-kernel@lists.infradead.org,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Jul 3, 2023 at 3:27 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Enable PWM config for Renesas MTU3a PWM as it is populated on
> RZ/{G2L, LC, UL} and RZ/V2L SMARC EVKs.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.6.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
