Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 128F663F53D
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Dec 2022 17:26:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232217AbiLAQZ6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 1 Dec 2022 11:25:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232231AbiLAQZ5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Dec 2022 11:25:57 -0500
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3385A47F3;
        Thu,  1 Dec 2022 08:25:56 -0800 (PST)
Received: by mail-qt1-f176.google.com with SMTP id e15so1380713qts.1;
        Thu, 01 Dec 2022 08:25:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qOsNY8fh6G3H3tSPTgp6BmKvqDK69mSaclFXuxvQlFI=;
        b=ThyBYAx9QVrmC9jtP/65jO2tLVTN/uX1GfycIs5lK3awX/6jG853ZjyH5LeHZDNzX5
         5sD7g9GKnqWr74wc+wMYV3dUHmHd8VnIQ8asepuunc3XuYbZZEU58/xI/bVvu/iWOBxR
         zdwEEreld7zzoWzpAFw59EvYGD1gbe8psGplg9nNApy2H+j+xqy9ap9bQtOFDNIZL3Wf
         TmV1PFB6JzG6Ny2b3HtzsFVU3WsVATN5GAOXTheJ0Lcp5eWopkIaG56BY+9XhYB+CLbl
         dY0IG/4dZrEkoF2mFZt0FEjAV/wFYLKFJ/ZY6twrBb07kwK8xrwjozzM4qum3gieqdmR
         7E9A==
X-Gm-Message-State: ANoB5pnSZbJ2cSx7Y25Wa0RslTQiYWJh3IUeP5cZSwm0iW8hoGjLtXqK
        EayyZ+Qx4GCFGffVhvCqX4jl7ap0lvOj2g==
X-Google-Smtp-Source: AA0mqf5h6ME2CbBAtoB/ozSF/A28olkOUn48So0ILVVwFiQyTMdQ514oTwjGYCfueqR2HUdo0KcWqg==
X-Received: by 2002:ac8:5416:0:b0:3a5:4942:a7d5 with SMTP id b22-20020ac85416000000b003a54942a7d5mr43736158qtq.33.1669911955668;
        Thu, 01 Dec 2022 08:25:55 -0800 (PST)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id r12-20020a05620a298c00b006e16dcf99c8sm3722584qkp.71.2022.12.01.08.25.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Dec 2022 08:25:54 -0800 (PST)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-3bfd998fa53so22474707b3.5;
        Thu, 01 Dec 2022 08:25:54 -0800 (PST)
X-Received: by 2002:a0d:e6d4:0:b0:3c0:5701:ceaf with SMTP id
 p203-20020a0de6d4000000b003c05701ceafmr25003888ywe.358.1669911954212; Thu, 01
 Dec 2022 08:25:54 -0800 (PST)
MIME-Version: 1.0
References: <20221124191643.3193423-1-biju.das.jz@bp.renesas.com> <20221124191643.3193423-5-biju.das.jz@bp.renesas.com>
In-Reply-To: <20221124191643.3193423-5-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 1 Dec 2022 17:25:43 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWZkpvpea-3PpPNJUCXbjocdss1ny9PLtUgydyYf0HtBQ@mail.gmail.com>
Message-ID: <CAMuHMdWZkpvpea-3PpPNJUCXbjocdss1ny9PLtUgydyYf0HtBQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] arm64: dts: renesas: r9a09g011: Add pwm nodes
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Nov 24, 2022 at 8:17 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add device nodes for the pwm timer channels that are not assigned
> to the ISP.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Added resets property

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
