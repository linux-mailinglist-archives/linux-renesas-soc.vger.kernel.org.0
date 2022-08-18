Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C5C8D59823E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Aug 2022 13:30:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244033AbiHRL2Z (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 18 Aug 2022 07:28:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236396AbiHRL2Z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 Aug 2022 07:28:25 -0400
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE2451182F;
        Thu, 18 Aug 2022 04:28:23 -0700 (PDT)
Received: by mail-qv1-f53.google.com with SMTP id l18so930060qvt.13;
        Thu, 18 Aug 2022 04:28:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=6kvD/PK9AAEksB95hW0WMEl3zwUZbuYTOgEL9ku4zZQ=;
        b=rgDvF9MuZ57iNpKyKucRhkTBEbg1Ncx/fLTedHqi2I7n+0r9IvnO+8eoxhxfNQ1Hic
         5rHw9gq+G5/EuToEjHGYUMIsLmxJOXeXYLZEdtdVDNx9HAvoFSJYm0Fr5Uc7bZJOUvJw
         mgSQ3UF6fgVAWTELeBAndohWUK09jF/c71btTq5hDe9sdLG3u1GzW05BQuiByCq+JSEn
         Nz/E8Z8UqalyjeUSXUWpP6bdc3fVRFXwW0+gA25rP/Atwyh/HrwoVXulGTCT6b4Uqnmm
         KJ6vbpcA8/SCz9GC+h1PzRLM5MQrGleZbryfbyV4vSY0w9BicdtJ9J2VUtUvcljegIyZ
         gqcg==
X-Gm-Message-State: ACgBeo3lmwDHQ2GKbcJ5Sq+UoeGdNvEIfBbbhuqLGDV7N8ApZlRpzOOr
        mWw0tvo9uc2bTW6L1xXs5DGUN2Lal98N3w==
X-Google-Smtp-Source: AA6agR6okX3QDeOc/nJWxXQkB6gYTcZNPHhXJj2BPdki6lN5HP7NgLmphCKASHT6D/0slDZYytor9A==
X-Received: by 2002:ad4:5ba5:0:b0:47b:4f54:cd1f with SMTP id 5-20020ad45ba5000000b0047b4f54cd1fmr2101176qvq.38.1660822102709;
        Thu, 18 Aug 2022 04:28:22 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id o4-20020a05620a22c400b006b5cc25535fsm1281072qki.99.2022.08.18.04.28.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Aug 2022 04:28:22 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-32a17d3bba2so32398567b3.9;
        Thu, 18 Aug 2022 04:28:21 -0700 (PDT)
X-Received: by 2002:a81:658:0:b0:334:a23e:6caa with SMTP id
 85-20020a810658000000b00334a23e6caamr2201512ywg.283.1660822101599; Thu, 18
 Aug 2022 04:28:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220728122312.189766-1-biju.das.jz@bp.renesas.com> <20220728122312.189766-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220728122312.189766-4-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 18 Aug 2022 13:28:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUyHhEdc0sof0s03LzOUyM4HO3PJwuo0_7wKH+jXiigGA@mail.gmail.com>
Message-ID: <CAMuHMdUyHhEdc0sof0s03LzOUyM4HO3PJwuo0_7wKH+jXiigGA@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: renesas: r9a07g054: Add DMA support to RSPI
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
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Jul 28, 2022 at 2:23 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add dmac phandles to RSPI nodes to support DMA operation.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.1.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
