Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6373A57CA59
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Jul 2022 14:12:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233422AbiGUMMP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 21 Jul 2022 08:12:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233540AbiGUMMO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Jul 2022 08:12:14 -0400
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EF70863D2;
        Thu, 21 Jul 2022 05:12:13 -0700 (PDT)
Received: by mail-qv1-f46.google.com with SMTP id j11so984812qvt.10;
        Thu, 21 Jul 2022 05:12:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=URlJv1s4yjFiV7EM9gzBbiZCkpearXArXAbrkkfNpWM=;
        b=lsC8+oPJ9pFHbSgKlTPLaEEYT/M4v6MxiYGw0FdlYiwgeqmRjed0VtOuP0YL0YpBoj
         tRbD+EY7Ul6Q20bRuW2rxhCcPLCfE4v9y5HieQuEtjfPsLXlpng5Yu3EgBEDAMihFtYZ
         BCH123I45aQGBFDqiBTuB8XIhOXDL5qlFvSeQhIn4ev9nvgU/aY77fdtr2M9AbYYzqY2
         v9qApbFkbOdqojfk7CSftYxttss4ZCTHfY9UPKVcEK+kd6rPH4k5Jlzpth99HjS0HfA8
         sss8GNSjo2GW4f2w9WbP627NpkUwF4I/2n8cd4AxjKT2WNDF/SoNZO7CaLPEAoVh/kxh
         qPqA==
X-Gm-Message-State: AJIora9n3nx+ULzRWp56pBaieWJCGOAjOsaEdFiG3sCJWe1eqJqXyrAB
        0A3HhWKpVBdsywDJY3sPJS903nrcluzwpg==
X-Google-Smtp-Source: AGRyM1vU0eGAnpKWBXpP99zjG5kE60IGEIrv/7YU9iWWRDRV1r8NXUWOts3HKBPslOlYmueRb8I7Vw==
X-Received: by 2002:a05:6214:3002:b0:470:7273:bee5 with SMTP id ke2-20020a056214300200b004707273bee5mr33001748qvb.98.1658405532215;
        Thu, 21 Jul 2022 05:12:12 -0700 (PDT)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com. [209.85.219.170])
        by smtp.gmail.com with ESMTPSA id t10-20020a05620a450a00b006b4880b08a9sm1402234qkp.88.2022.07.21.05.12.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Jul 2022 05:12:11 -0700 (PDT)
Received: by mail-yb1-f170.google.com with SMTP id l11so2380612ybu.13;
        Thu, 21 Jul 2022 05:12:11 -0700 (PDT)
X-Received: by 2002:a5b:6c1:0:b0:669:a7c3:4c33 with SMTP id
 r1-20020a5b06c1000000b00669a7c34c33mr39077260ybq.543.1658405531439; Thu, 21
 Jul 2022 05:12:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220718134458.19137-1-phil.edworthy@renesas.com> <20220718134458.19137-2-phil.edworthy@renesas.com>
In-Reply-To: <20220718134458.19137-2-phil.edworthy@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 21 Jul 2022 14:12:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUDOt33US6t50hPgjKRMESiwPGOw5W7u54xBqd+Xz2xCw@mail.gmail.com>
Message-ID: <CAMuHMdUDOt33US6t50hPgjKRMESiwPGOw5W7u54xBqd+Xz2xCw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: usb: renesas, usb3-peri: Document RZ/V2M
 r9a09g011 support
To:     Phil Edworthy <phil.edworthy@renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        USB list <linux-usb@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
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

Hi Phil,

On Mon, Jul 18, 2022 at 3:45 PM Phil Edworthy <phil.edworthy@renesas.com> wrote:
> Document the RZ/V2M SoC bindings.
> The RZ/V2M SoC is a little different to the R-Car implementations.
> A few DRD related registers and bits have moved, there is a separate
> interrupt for DRD, an additional clock for register access and reset
> lines for DRD and USBP.
>
> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

The grant scheme looks good to me, so I'm awaiting your v2, incorporating
the review comments, and the additional interrupts.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
