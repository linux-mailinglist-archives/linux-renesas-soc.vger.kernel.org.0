Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 17C3274D722
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Jul 2023 15:12:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229751AbjGJNMY convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 10 Jul 2023 09:12:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230291AbjGJNMQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Jul 2023 09:12:16 -0400
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C7E01A2;
        Mon, 10 Jul 2023 06:12:12 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-57026f4bccaso55369867b3.2;
        Mon, 10 Jul 2023 06:12:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688994731; x=1691586731;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cPaTvpT98YYGlQ4RoSZ21iH7hvYN7meJXvq//pVY5kM=;
        b=J/62Dy1oNy8C3Znk4mOjDQfHeBw4kgahxDRjlgXsbXn/Rkv5f0HFONvg+V2QVLMg9m
         52U8s4lnlbK9StvEdaEbNPmcayfh+MmC9LVT6IhF75LD6/H1D6EnIGFh4vyiUfpk5TWu
         zgqIdPoY2MamJzDHQZvAPGN/xeO3dbDqwWIEc1Cw8HGblCQx6CmfvIHys7ppMQB9k3DJ
         tGI4N+0B6Ph4gQOOxD2t7FgYaJNAKyUztXsYzG3nkftfR4NjKjWyxV+7favMKsgtl6pY
         fPNr7B7Yv8CcxyrorfIf6mgCm5Ddm7TzVFYPOxSWAB0SHUeutpsaI0xTzEBsEJOGE9OV
         ZjRw==
X-Gm-Message-State: ABy/qLb+0BLpPWu5gloYwc+xtVI2Ru9cOpuJPm5eSq83GMEkq6uRI6KE
        oGQ18Ao0ubsN149TN3x1ncHwzVquehD8iA==
X-Google-Smtp-Source: APBJJlEpzHFxhiXwRwUckJeoNTAYG40jST1h0vbJiHFX66Ad8769heCVljft6nS/SNgvrDCyOp+jVQ==
X-Received: by 2002:a81:7789:0:b0:56f:f15a:2753 with SMTP id s131-20020a817789000000b0056ff15a2753mr12792170ywc.20.1688994731027;
        Mon, 10 Jul 2023 06:12:11 -0700 (PDT)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id b2-20020a0dc002000000b0057a93844c15sm127792ywd.127.2023.07.10.06.12.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jul 2023 06:12:10 -0700 (PDT)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-579e5d54e68so55405437b3.1;
        Mon, 10 Jul 2023 06:12:10 -0700 (PDT)
X-Received: by 2002:a25:69c6:0:b0:c15:cfc4:45a8 with SMTP id
 e189-20020a2569c6000000b00c15cfc445a8mr12904993ybc.34.1688994729646; Mon, 10
 Jul 2023 06:12:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230707155849.86649-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230707155849.86649-1-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 10 Jul 2023 15:11:57 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWOKk9WLV-71nrJK=9TUx=gmu9H0=xMJ30M-euoPuDPbQ@mail.gmail.com>
Message-ID: <CAMuHMdWOKk9WLV-71nrJK=9TUx=gmu9H0=xMJ30M-euoPuDPbQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: rzg2lc-smarc: Add support for
 enabling MTU3
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
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

On Fri, Jul 7, 2023 at 5:59 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add support for PMOD_MTU3 macro to enable MTU3 node on RZ/G2LC SMARC
> EVK.
>
> The MTU3a PWM pins on PMOD0 are muxed with SPI1. Disable SPI1, when
> PMOD_MTU3 macro is enabled.
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
