Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B3A474D71C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Jul 2023 15:12:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231685AbjGJNMB convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 10 Jul 2023 09:12:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230358AbjGJNL4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Jul 2023 09:11:56 -0400
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2B13137;
        Mon, 10 Jul 2023 06:11:41 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-579efc32377so50609507b3.1;
        Mon, 10 Jul 2023 06:11:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688994700; x=1691586700;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UoHyZxxfb/ifCS70Pj34y4LsKa4Pr9H50/su8/hRRU4=;
        b=fX8h7JgepKPAkKg44LQgW3dMFZtXIGqCyflkm/WM+G7y5Jwkb7w6yWkHQ5izvgbl2k
         nNH5Jj1OJTOn9y2/D/WTyjs6s7lS087ArbUjHcZcw8hEI9Il4tcOKYg659og0TiANx1v
         0yOiekvzVW+lXxrVQbiuJhMmtrLGhDKQofjSjRJNf0zGQ9BI5ZYgcr1qwyUmMOVOKj8S
         +mXXjj0mUj4FTNs8idUuaZebdSDZOv5mttI1fM+CrizgWuzrs9AXLrOu11MRPOaEqo8O
         /HOVRIx/QbPjNZjLZ9czCRAscHzV4Ggx1mF8N9oLoHscnqu3CxquJrT3B8xrEp5aTlLN
         JXDw==
X-Gm-Message-State: ABy/qLY8baT3QZW5f9FrVkxtiOXTerGml/Z0UVAdfp4i0RIb9KhwRFM3
        ly3DCUOX94iI+YLuvjEXSs6aEbrKNjqmWw==
X-Google-Smtp-Source: APBJJlEnvVJXQllLyXyyGVtDubMHH+kLy8Oecga1vRIEf5aVTceDn7/yihfuvl7h7sVJxAzL+Ox9/A==
X-Received: by 2002:a25:abae:0:b0:c1b:4347:b3d4 with SMTP id v43-20020a25abae000000b00c1b4347b3d4mr10134840ybi.7.1688994700623;
        Mon, 10 Jul 2023 06:11:40 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id f8-20020a056902038800b00c3a96009bdfsm2537570ybs.35.2023.07.10.06.11.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jul 2023 06:11:40 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-bd0a359ca35so4037768276.3;
        Mon, 10 Jul 2023 06:11:40 -0700 (PDT)
X-Received: by 2002:a25:a063:0:b0:c83:27d4:c0d6 with SMTP id
 x90-20020a25a063000000b00c8327d4c0d6mr2583973ybh.37.1688994700213; Mon, 10
 Jul 2023 06:11:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230706153047.368993-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230706153047.368993-1-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 10 Jul 2023 15:11:27 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUUF905k5857Og9PbQSSL1bcaWt9V7J-wzkbzhBrnBW5Q@mail.gmail.com>
Message-ID: <CAMuHMdUUF905k5857Og9PbQSSL1bcaWt9V7J-wzkbzhBrnBW5Q@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: renesas: rzg2l-smarc: Add support for
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
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Jul 6, 2023 at 5:30 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add support for PMOD_MTU3 macro to enable MTU3 node on RZ/{G2,V2}L SMARC
> EVK.
>
> The MTU3a PWM pins are muxed with spi1 pins and counter external input
> phase clock pins are muxed with scif2 pins. Disable these IPs when
> PMOD_MTU3 macro is enabled.
>
> Apart from this, the counter Z phase clock signal is muxed with the
> SDHI1 cd signal. So disable SDHI1 IP, when the counter Z phase signal
> is enabled.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Renamed macro MTU3->PMOD_MTU3.
>  * Moved macro "PMOD1_SER0" from common dts to board-specific dts
>    and added an error check as it is mutually exclusive with PMOD_MTU3
>    macro.
>  * Moved mtu3-zphase-clk pin definition to rzg2l-smarc-pinfunction.dtsi.
>  * Moved mtu3 node to common dts.
>  * Moved macro definitions before dtsi includes, so that macros are
>    visible on these files.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.6.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
