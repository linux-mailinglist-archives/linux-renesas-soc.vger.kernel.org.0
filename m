Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE09A751A31
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Jul 2023 09:45:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232359AbjGMHpZ convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 13 Jul 2023 03:45:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231238AbjGMHpY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Jul 2023 03:45:24 -0400
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E91BD26BB;
        Thu, 13 Jul 2023 00:45:06 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-cb37a0ea5b3so234950276.0;
        Thu, 13 Jul 2023 00:45:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689234305; x=1691826305;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SG3PKVPC3LXczbcdw4qaLpSGd2SI5ZbZgcR7us1BJMA=;
        b=BpoQ3LjelVmCSi4TOb3wwISUoEiFraYRi//En+4xOkAj+dN9KdCfsfS30wnGwcBUSe
         E7RV3BI4SUi/dwBYaRrOk2XU5Y4PyJfxOfanyRE8Dvp8Fd3ea+K/S/eXjrCquaDsSfve
         OXZJvGMRGMQLCYND6SVikO71qRLl8jZf+1ooa8kTmbo6OqeCcLFWBfLt5/WAYKQlM4+3
         XfZe6gAAkcNPzBCozTNQQyULesbeaTUq+AxDGERhnG+P4WUYzMXdDMdtOTWkAyaeJjZz
         REU1jqAr6M4jHgaw6yH8gpH/N3o2fLWeKx3XGg8Ow/z/IPC2muHq3Wucj00VZ5oCr9hJ
         +fXQ==
X-Gm-Message-State: ABy/qLaD4J3460IMYTtekq9po4By32ANp2sWRSfiVUsQeolXwJNHpLid
        aIMvdA+W5oybwCD7EFGg+WbOkdUCvB37ljS4
X-Google-Smtp-Source: APBJJlGSOB2bMl83Dxb6f55d30Buz98iO4A2DfjDriBdJo0lybGGipCExURmkr/irWYNjjdangCe2A==
X-Received: by 2002:a25:738b:0:b0:ca3:d53c:fff with SMTP id o133-20020a25738b000000b00ca3d53c0fffmr1097843ybc.1.1689234305535;
        Thu, 13 Jul 2023 00:45:05 -0700 (PDT)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com. [209.85.219.173])
        by smtp.gmail.com with ESMTPSA id x7-20020a5b0947000000b00c5ec980da48sm1271130ybq.9.2023.07.13.00.45.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jul 2023 00:45:05 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-cb37a0ea5b3so234922276.0;
        Thu, 13 Jul 2023 00:45:05 -0700 (PDT)
X-Received: by 2002:a0d:ea44:0:b0:580:83fe:25cc with SMTP id
 t65-20020a0dea44000000b0058083fe25ccmr2732248ywe.5.1689234304838; Thu, 13 Jul
 2023 00:45:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230712151342.82690-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230712151342.82690-1-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 13 Jul 2023 09:44:51 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUJP2MMp25k4t4=cE6My6hnH1=H_FrSn2ekmbcUYSc3Jg@mail.gmail.com>
Message-ID: <CAMuHMdUJP2MMp25k4t4=cE6My6hnH1=H_FrSn2ekmbcUYSc3Jg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: rzg2lc-smarc-som: Enable PMIC and
 built-in RTC
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

On Wed, Jul 12, 2023 at 5:13 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Enable PMIC RAA215300 and the built-in RTC on the RZ/G2LC SMARC
> EVK.
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
