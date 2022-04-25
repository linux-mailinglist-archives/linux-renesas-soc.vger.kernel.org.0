Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 118D650E14E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 Apr 2022 15:13:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239016AbiDYNQg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 25 Apr 2022 09:16:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238398AbiDYNQc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Apr 2022 09:16:32 -0400
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C446236335;
        Mon, 25 Apr 2022 06:13:26 -0700 (PDT)
Received: by mail-qk1-f171.google.com with SMTP id s70so10677042qke.8;
        Mon, 25 Apr 2022 06:13:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cPhFN097SNSAA6DApz7uxkKT4+Ug0TC0TFUbciBcqio=;
        b=RcVFzM+PgY35TvuPWyU9md2nKiDYZ6Yeqg0IZNBdDlY7oileZ+yTVX1ki3/ky/Emsa
         GrbI9EzJSR0KbQ30mdUaDxXqBYSu8fZLEQJy0bZsDT1Ph5NihchvvCQqOjWNwCmeEoMj
         eiUWaA7haJ4nKoJ+7IO0jCW7ajIomznzaVMOmJL0Tsh4KB7qD5myw4iM3ugF0SvQcivo
         s/s0IJpcX59WTVg4bCJawzIk/Fymn6gh8pYJ9XXEPgbYRSEKnIrZBaBRK1p+N7RmhCTZ
         NHkmHwjm4N3T0kfGei5BxzqCynddikQyPYdqSsqe9VVmaKKho40TlkfK2jfHn8RCe0Fc
         im/A==
X-Gm-Message-State: AOAM5326fgMrIRY5Kt0s0DbbcBwALwm1bi2yq2oY//4ibcgHbYUOT5bw
        aURahL8/9ncDsn1XTWufh2LKEWkQWOpb3g==
X-Google-Smtp-Source: ABdhPJxjm8HwrsN+ej9xtD7iiCVgTgJXNxElR0/KNCJRoIE6R0g+ud1P+cpIwAlHL+zjg7A8m5Ff8g==
X-Received: by 2002:a05:620a:2886:b0:699:bab7:ae78 with SMTP id j6-20020a05620a288600b00699bab7ae78mr9784372qkp.618.1650892405698;
        Mon, 25 Apr 2022 06:13:25 -0700 (PDT)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id w15-20020ac857cf000000b002f36e26504asm671483qta.26.2022.04.25.06.13.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Apr 2022 06:13:25 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-2f7c57ee6feso52765917b3.2;
        Mon, 25 Apr 2022 06:13:25 -0700 (PDT)
X-Received: by 2002:a81:8489:0:b0:2f7:edff:239f with SMTP id
 u131-20020a818489000000b002f7edff239fmr4050001ywf.256.1650892404998; Mon, 25
 Apr 2022 06:13:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220423134752.143090-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220423134752.143090-1-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 25 Apr 2022 15:13:12 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW9tG7oV9bf_zrsQ5Y8_UWNJ9w4SKf+YANxGL2ytBRZ5A@mail.gmail.com>
Message-ID: <CAMuHMdW9tG7oV9bf_zrsQ5Y8_UWNJ9w4SKf+YANxGL2ytBRZ5A@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: phy: renesas,usb2-phy: Document RZ/G2UL phy bindings
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-phy@lists.infradead.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
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

On Sat, Apr 23, 2022 at 3:48 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Document USB phy bindings for RZ/G2UL SoC. RZ/G2UL USB phy is identical to
> one found on the RZ/G2L SoC. No driver changes are required as generic
> compatible string "renesas,rzg2l-usb2-phy" will be used as a fallback.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
