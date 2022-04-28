Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72FE3513678
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Apr 2022 16:11:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234027AbiD1OOV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 28 Apr 2022 10:14:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348199AbiD1ON5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 28 Apr 2022 10:13:57 -0400
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACA846C957;
        Thu, 28 Apr 2022 07:10:42 -0700 (PDT)
Received: by mail-qk1-f171.google.com with SMTP id j9so3685740qkg.1;
        Thu, 28 Apr 2022 07:10:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=y2D+xViK1Npycv88ohwNKXbUVu6v2NurwbWBSVFgrCg=;
        b=vlbCEUu4bH2edEq41dLgbdoeTbxsNJH7gZFYwB+esBghl4KYnqAwFOqFCBhInFK2Uz
         yjJ8pXdvq3j+PRrkyR6U6DbXSmI0puHJ898gXPqkVVECcLhfD+X7w25UqCEoDiUBCiF1
         uTnD4NKD1Cas/sMfOLdnR4mU6ethZWwVkY4VxjI7PPgz+rzjGPBpIftvgezk5H6bvThm
         XP+vWw1S1xIeKfMs97BWcSUFKdVYxpfZjPJ7hfWy9Dg8cqSJUN1TujaWUmkjX3ipRSCY
         d0vAZeiCAlsZ2UJHtWUadjR90hMFgcqeMOzq/3aTmmA8iKG2v+QNHVJxg1t2NKht6BUP
         XEqA==
X-Gm-Message-State: AOAM533GV31HhzT25iMoAem2V+eAXA/5kI8w2ByKMELI35A/26hLtUJ+
        3eFad05uDSrRg5hvPDERVK9iR+NyXlQ7uFTB
X-Google-Smtp-Source: ABdhPJxCYqpYzW9+5QjT3l9DNHfHovajy8ntynomSTmIxnTokz61y0AfeXmT20clTE+kCHULC3pOOQ==
X-Received: by 2002:a37:750:0:b0:69f:a05d:6d21 with SMTP id 77-20020a370750000000b0069fa05d6d21mr1873007qkh.676.1651155041596;
        Thu, 28 Apr 2022 07:10:41 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id q17-20020a05622a031100b002f1d478c218sm50221qtw.62.2022.04.28.07.10.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Apr 2022 07:10:41 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-2f83983782fso54336637b3.6;
        Thu, 28 Apr 2022 07:10:41 -0700 (PDT)
X-Received: by 2002:a81:e10d:0:b0:2f7:bb2a:6529 with SMTP id
 w13-20020a81e10d000000b002f7bb2a6529mr29702500ywh.62.1651155040978; Thu, 28
 Apr 2022 07:10:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220425170530.200921-1-biju.das.jz@bp.renesas.com> <20220425170530.200921-14-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220425170530.200921-14-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 28 Apr 2022 16:10:29 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVQd5SMTD=MLvVyZRk3vDsh481KCF5vK-X3v+16BUan+g@mail.gmail.com>
Message-ID: <CAMuHMdVQd5SMTD=MLvVyZRk3vDsh481KCF5vK-X3v+16BUan+g@mail.gmail.com>
Subject: Re: [PATCH 13/13] arm64: dts: renesas: rzg2ul-smarc-som: Enable watchdog
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
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

On Mon, Apr 25, 2022 at 7:06 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Enable watchdog{0,2} interfaces on RZ/G2L SMARC EVK.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.19.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
