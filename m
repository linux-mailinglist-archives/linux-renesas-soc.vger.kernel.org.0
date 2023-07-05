Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E31B7481A9
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Jul 2023 12:03:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229850AbjGEKD5 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 5 Jul 2023 06:03:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231211AbjGEKD4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Jul 2023 06:03:56 -0400
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F888171B
        for <linux-renesas-soc@vger.kernel.org>; Wed,  5 Jul 2023 03:03:55 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-c49777d6e7aso5309359276.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 05 Jul 2023 03:03:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688551434; x=1691143434;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Ogg5zI59E6yZudQGeFFtFrr7l8n3GPb1o1lP3daISQ=;
        b=NwRYcT1VmlMvjSJaC9QaIbeALmX+eP6esL7RYVqhGaFLSlmRekPCJV59MGFHdw0W++
         zH/kUEj8AeMvxU5wbf1a+gCb7C9A7bXnFRwy/c22BHjhGjsugEeqnHhmNXLEqxwPrP1x
         b2DvuyLfoYpZcpirV0hKOZXyRaNwHjBtNgBWYl5WrHold0rRmjwfwAA8lQA9bISlzEh8
         FlCAvOOcXaq8Pw2YpL4meDzU4Npwz3NcTqoxpakL70vm+aCI+CbgLLQiLhQt3SxorZqr
         p554saQCHxVTJ4/dpSUoIGUMbBgzVSvIPMnRA70TZYvkg37mQzovkieawgZYy6aeltU6
         d7SQ==
X-Gm-Message-State: ABy/qLayXaZFXaDi1xtvCAc8Hs1CZvWM+e5tf0WC049MtcX/vS/DaILf
        vkId2CD1s4K0Z4YRy1/M6ZT0tJtSpIhOGg==
X-Google-Smtp-Source: APBJJlGUR0zukEvQ5LZkvuug9r4BSXq6ToNXlTRJUDEJaSs6EVls8A+9461Sq2e37awCy8MvzzhsjQ==
X-Received: by 2002:a25:4295:0:b0:c41:4eee:b550 with SMTP id p143-20020a254295000000b00c414eeeb550mr16446197yba.47.1688551434613;
        Wed, 05 Jul 2023 03:03:54 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id cf20-20020a056902181400b00ba773472647sm5017012ybb.19.2023.07.05.03.03.53
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jul 2023 03:03:53 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-c49777d6e7aso5309343276.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 05 Jul 2023 03:03:53 -0700 (PDT)
X-Received: by 2002:a25:4295:0:b0:c41:4eee:b550 with SMTP id
 p143-20020a254295000000b00c414eeeb550mr16446147yba.47.1688551433397; Wed, 05
 Jul 2023 03:03:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230703144108.413938-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230703144108.413938-1-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 5 Jul 2023 12:03:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWsq2gTnXs-ON3V4qHyCMAo5YQv7LxzebrBwH085m7w=A@mail.gmail.com>
Message-ID: <CAMuHMdWsq2gTnXs-ON3V4qHyCMAo5YQv7LxzebrBwH085m7w=A@mail.gmail.com>
Subject: Re: [PATCH] arm64: defconfig: Enable PMIC RAA215300 and RTC ISL 1208 configs
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
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Jul 3, 2023 at 4:41 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Enable PMIC RAA215300 and ISL 1208 configs, as it is populated
> on Renesas RZ/{G2L,V2L} SMARC EVKs.
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
