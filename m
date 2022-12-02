Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA9F864026E
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Dec 2022 09:44:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232543AbiLBIol (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 2 Dec 2022 03:44:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232277AbiLBIok (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Dec 2022 03:44:40 -0500
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AA86BF8;
        Fri,  2 Dec 2022 00:44:39 -0800 (PST)
Received: by mail-qt1-f177.google.com with SMTP id h24so4217458qta.9;
        Fri, 02 Dec 2022 00:44:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o05Bn7pVRB0sZ2xCih8AljBhWuhHWjqGLhT4k6xSr28=;
        b=s1xCJ94PNjtZwLUFVX7SC65oOi6OboaLPdM1ZSlk9EI8o1Xnp/6ohiJVBkCflE1GVm
         Wr+m8sRuVKckA+PDeNH8BPFVdn+7SBwgwL914WzLYECIk4vP6I7QpKSwG88CAwazpGzF
         92Siw6N6ND9wDXduZmWmWl1UEO9sBPHP6UD9fO23bN311RFCr4MraXRW5fTaCVE6J9M9
         m+pyzF8iT5I/2cmXnpa1FKfKwsmkKejx33l/I0jYFCnZm23I0s7jF9FvsUkOjW0CBi9O
         7JdeYQHp41zOMoqQ/A334zNCfBE9ZkUkdyUaDK7GUTzM67yboUEvEDHCjciOyaZIiMzZ
         FZfg==
X-Gm-Message-State: ANoB5pmZANCg70sG2PHit8l4+gCqmBC/Mwv/hdo4xR8yiA21Hc2gF3Ve
        rarlAHGGuvILxg1RHJQEyhQquIClBwRbqQ==
X-Google-Smtp-Source: AA0mqf5gMCphBq5WVJ/NIy2cIGh9B5KkWebleQmjtGmeO8Qhbd35k64qMvx4Ln7xLPy6oXEodwKS8Q==
X-Received: by 2002:a05:620a:2214:b0:6fa:e58e:64e3 with SMTP id m20-20020a05620a221400b006fae58e64e3mr63282770qkh.430.1669970678346;
        Fri, 02 Dec 2022 00:44:38 -0800 (PST)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id u17-20020a05620a455100b006fa22f0494bsm5121539qkp.117.2022.12.02.00.44.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Dec 2022 00:44:38 -0800 (PST)
Received: by mail-yb1-f181.google.com with SMTP id i131so5198193ybc.9;
        Fri, 02 Dec 2022 00:44:37 -0800 (PST)
X-Received: by 2002:a25:9e84:0:b0:6de:6183:c5c3 with SMTP id
 p4-20020a259e84000000b006de6183c5c3mr49643745ybq.89.1669970677601; Fri, 02
 Dec 2022 00:44:37 -0800 (PST)
MIME-Version: 1.0
References: <20221122213529.2103849-1-biju.das.jz@bp.renesas.com> <20221122213529.2103849-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20221122213529.2103849-3-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 2 Dec 2022 09:44:26 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVuZ_Q6kyYihua+gX5tYn+dJ_M0pA1xA8J=KNM59gQ7kQ@mail.gmail.com>
Message-ID: <CAMuHMdVuZ_Q6kyYihua+gX5tYn+dJ_M0pA1xA8J=KNM59gQ7kQ@mail.gmail.com>
Subject: Re: [PATCH 2/7] arm64: dts: renesas: r9a07g044: Add vspd node
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Nov 22, 2022 at 10:35 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add vspd node to RZ/G2L SoC DTSI.
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
