Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 772807653A4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Jul 2023 14:23:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234011AbjG0MXa convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 27 Jul 2023 08:23:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234012AbjG0MXF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 27 Jul 2023 08:23:05 -0400
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2A193C05;
        Thu, 27 Jul 2023 05:22:50 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-583a8596e2aso9601987b3.1;
        Thu, 27 Jul 2023 05:22:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690460569; x=1691065369;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c52QFIiy7yiNPNLxeWu9puYqv4sMu22lnONbIBQC0PI=;
        b=VI918M0im0GoNUmxBBPmSWkoAz19o8pN3ZHcNJGLw3QOgCzchNWYpWZe25R/urQkPu
         cJ4i7aNnUYFZv9HFGQ3uBs4KQ5dDYP8lsbU9EdZ3cskNUSqwPnux39M+61wSyCdOzWXc
         CkIqMoo7yZC3VcI3LwWLyJpJMCqYC0f2tC0fyD2cKnnJASU1cAaJh9kFrIvRrtXeoEHa
         1lMIn/BXrgniNl1yEfdg3Bg+5YB5C5wiiCdVPA24t5tboShDaW8+FjOTJvyyMwe5MsKe
         nd+UcZGEzg8E7SAruGfHkBk1r/Z9UxL7wDZYoV/l8TptM+1zLubf04goRdRTspb2PBwy
         zJSw==
X-Gm-Message-State: ABy/qLZAE+tfIGMjRbkpoOXSvy031OsjGKc508jGyHrhixq05cJA6aOY
        89g7CyK1YgBzuY7bncJ0/IHeMz6VC0BMmg==
X-Google-Smtp-Source: APBJJlHXUTQPl4oR6/0QKxqm5FqVu6IOM5h4xX6UoCNXjPcfZucDCptDt0sY/TjyM/yAerpGGCyIsg==
X-Received: by 2002:a0d:caca:0:b0:583:78b7:53f1 with SMTP id m193-20020a0dcaca000000b0058378b753f1mr4915867ywd.7.1690460569400;
        Thu, 27 Jul 2023 05:22:49 -0700 (PDT)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com. [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id y80-20020a81a153000000b00583cf4ed41esm382172ywg.2.2023.07.27.05.22.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jul 2023 05:22:49 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-d16639e16e6so763715276.3;
        Thu, 27 Jul 2023 05:22:49 -0700 (PDT)
X-Received: by 2002:a25:9087:0:b0:ce0:2654:4bd9 with SMTP id
 t7-20020a259087000000b00ce026544bd9mr4265338ybl.55.1690460568823; Thu, 27 Jul
 2023 05:22:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230727081848.100834-1-biju.das.jz@bp.renesas.com> <20230727081848.100834-6-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230727081848.100834-6-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 27 Jul 2023 14:22:37 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWeAwVADo2HhURJAbjFMeyUVKncKoo3LuoctFY215-SXw@mail.gmail.com>
Message-ID: <CAMuHMdWeAwVADo2HhURJAbjFMeyUVKncKoo3LuoctFY215-SXw@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] arm64: dts: renesas: rzg2ul-smarc: Add support for
 enabling MTU3
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
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

On Thu, Jul 27, 2023 at 10:19 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add support for PMOD_MTU3 macro to enable MTU3 node on RZ/G2UL SMARC
> EVK.
>
> The MTU3a PWM pins on PMOD0 are muxed with SPI1. Disable SPI1, when
> PMOD_MTU3 macro is enabled.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2->v3:
>  * No change

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.6.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
