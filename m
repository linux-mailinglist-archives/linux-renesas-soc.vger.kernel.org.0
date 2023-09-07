Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DBF91797A0B
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Sep 2023 19:28:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243915AbjIGR2l convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 7 Sep 2023 13:28:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243845AbjIGR2k (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Sep 2023 13:28:40 -0400
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com [IPv6:2001:4860:4864:20::30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C72A31700;
        Thu,  7 Sep 2023 10:28:12 -0700 (PDT)
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-1a28de15c8aso958751fac.2;
        Thu, 07 Sep 2023 10:28:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694107338; x=1694712138;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0eAo0T4Q7ty5BOJJ1ZPPpf8WGcau2gMsvRbOa9Sut6k=;
        b=dJfuF8YxZ8nPjyXtmkkpAWgSzx7PNZ7aQl6y1zMUQ0bfeB4zsrh5SD2LhSfvj0zciI
         eL0qYNLdCdZA8tc9nYX7jcWaxXK0jtVJZGvRYIHiZQfXSMYVWPZR0udWDO1isl41+gik
         7ar8J60wPEAR9FNhJe5/texcrvT2hMN9a11FlL/ez9rmDpWVDS88Y0vtbagimIja05pB
         YHWd5WWfzhZCTdZ73zviCDZLXggRFOTqHZs6AoNE7PxHF68gCqmjjy52nqv7Jlrop3x1
         m/oo1TgEKbCdh6okdFS0EuWOU9pUA/VlPuAxKf0HTy/J/4gy5vgONPIBNfzNT4cuBoX1
         KLCA==
X-Gm-Message-State: AOJu0Yx8Rt74CAwww0CO6s2xF4sfpf//GawvEi+dwUk/77ZEQPEFDPSZ
        CmVBIiKv9zdsGI5TAFDWwB/F0fE55GaCFg==
X-Google-Smtp-Source: AGHT+IEc4Ap6beIZHT2MzekHqr8DHQwFnYECOD6BVi1xOIrzUCzH/nLhY3+HtKUHusDnSvBJCGSnnA==
X-Received: by 2002:a05:6870:b016:b0:1c0:a784:cf7e with SMTP id y22-20020a056870b01600b001c0a784cf7emr22067504oae.51.1694070854803;
        Thu, 07 Sep 2023 00:14:14 -0700 (PDT)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com. [209.85.210.49])
        by smtp.gmail.com with ESMTPSA id c7-20020a9d6c87000000b006bee5535b44sm7095067otr.75.2023.09.07.00.14.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Sep 2023 00:14:14 -0700 (PDT)
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-6c0a42a469dso434740a34.2;
        Thu, 07 Sep 2023 00:14:14 -0700 (PDT)
X-Received: by 2002:a05:6358:2789:b0:12b:c378:b090 with SMTP id
 l9-20020a056358278900b0012bc378b090mr4579788rwb.26.1694070853892; Thu, 07 Sep
 2023 00:14:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230824104812.147775-1-biju.das.jz@bp.renesas.com> <20230824104812.147775-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230824104812.147775-2-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 7 Sep 2023 09:14:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXFhORcYPKYPNYMhzUgpgfWohaPMH8bYSKdOgMN_0z5iA@mail.gmail.com>
Message-ID: <CAMuHMdXFhORcYPKYPNYMhzUgpgfWohaPMH8bYSKdOgMN_0z5iA@mail.gmail.com>
Subject: Re: [PATCH v5 1/4] dt-bindings: clock: versaclock3: Add description
 for #clock-cells property
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Aug 24, 2023 at 12:48 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add description for "#clock-cells" property to map indexes to the clock
> output in the Table 3. ("Output Source") in the 5P35023 datasheet
> (ie: {REF,SE1,SE2,SE3,DIFF1,DIFF2}. Also update the "assigned-clock-rates"
> in the example.
>
> While at it, replace clocks phandle in the example from x1_x2->x1 as
> X2 is a different 32768 kHz crystal.
>
> Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
> v4->v5:
>  * Added description for "#clock-cells" property to map indexes to the
>    clock output.
>  * Updated commit header and description to reflect this change.
>  * Dropped fixes tag.
>  * Retained Ack tag from Conor and Krzysztof as it is trivial change.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
