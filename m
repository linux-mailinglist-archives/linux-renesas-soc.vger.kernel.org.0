Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5891F4EDA57
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 31 Mar 2022 15:17:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233274AbiCaNTE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 31 Mar 2022 09:19:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233027AbiCaNTE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 31 Mar 2022 09:19:04 -0400
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2178320E975;
        Thu, 31 Mar 2022 06:17:17 -0700 (PDT)
Received: by mail-qk1-f174.google.com with SMTP id v15so19651372qkg.8;
        Thu, 31 Mar 2022 06:17:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1kqJIdbzCzFXveL5saW8SXO4YRgdYy2o2NLkfN1Vvfg=;
        b=6o/IaeNwmt2GYtzzp7wIyT9QR2v+4FC1Wx+LRZcZn0I6+iCya15ymAWen4nt+1DINe
         VpqtLIptyU8CUQSDgAXeH1ANkEUodkvpydO8jTHghSZMd1VN91waUSQeiIaZ4HEja5+g
         yl9+8SPpltibIxPKs/IUS7tG02l2n9ppJm5grok07Ej2U6X7AUR/9MoXBSZc80RNbjkw
         nYF2FMKigiw7mvM6Kc97oK0yqUmqJdmRyVDuk1xk2Maj6IC7UjLT76shTXShbbd3rF0j
         NfXz4hFz8FZslOJICeC8XN3Np0SCDwafCD8AxeXo+E06C1noVb9ARBWdzUUITftqUV3x
         QbdQ==
X-Gm-Message-State: AOAM531iz1/NybwjjvhqJtKVKxyibSH5r/pjeCC93D/88jjeYrmp7G70
        tw98fBJUTQNsuiqt+4iLWNRjf5qBSLcKZQ==
X-Google-Smtp-Source: ABdhPJyewe2UvxAr7Gpj8kF3dPI2XsLz1WOevQQ9EWcVU4TADNHP0mqJnpkFful3MMZEQumKredGlw==
X-Received: by 2002:a05:620a:22cf:b0:67e:e43:239d with SMTP id o15-20020a05620a22cf00b0067e0e43239dmr3278957qki.299.1648732635815;
        Thu, 31 Mar 2022 06:17:15 -0700 (PDT)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com. [209.85.219.176])
        by smtp.gmail.com with ESMTPSA id o27-20020a05620a111b00b0067d5f359007sm11892328qkk.23.2022.03.31.06.17.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Mar 2022 06:17:15 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id u103so42219798ybi.9;
        Thu, 31 Mar 2022 06:17:15 -0700 (PDT)
X-Received: by 2002:a25:aa0e:0:b0:633:7c3b:94a0 with SMTP id
 s14-20020a25aa0e000000b006337c3b94a0mr4290739ybi.546.1648732635065; Thu, 31
 Mar 2022 06:17:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220315155919.23451-1-biju.das.jz@bp.renesas.com> <20220315155919.23451-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220315155919.23451-4-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 31 Mar 2022 15:17:03 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXnxMDfCh+Q8gPbrVgZbHgxgHQngC46B3azORxhen=pOw@mail.gmail.com>
Message-ID: <CAMuHMdXnxMDfCh+Q8gPbrVgZbHgxgHQngC46B3azORxhen=pOw@mail.gmail.com>
Subject: Re: [PATCH 3/7] arm64: dts: renesas: r9a07g043: Add SDHI nodes
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
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
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Mar 15, 2022 at 4:59 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add SDHI{0, 1} nodes to RZ/G2UL SoC DTSI.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
