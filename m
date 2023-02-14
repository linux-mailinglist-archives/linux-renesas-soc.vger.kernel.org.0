Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F1C36967CC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Feb 2023 16:18:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233270AbjBNPSQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 14 Feb 2023 10:18:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229622AbjBNPSP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Feb 2023 10:18:15 -0500
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78FCE10AA0;
        Tue, 14 Feb 2023 07:18:14 -0800 (PST)
Received: by mail-qt1-f173.google.com with SMTP id cr22so17749697qtb.10;
        Tue, 14 Feb 2023 07:18:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aWC6Sy2p6wAUAcllYtYBbRCVNVFRqQgltjwaQNMyoqU=;
        b=okVX34AZULlUnNS/KOixTdHIqSQXm2ZXt81Ma9OEbBALtSSTFs5HRP0C47QKZbElxD
         qwEGhT28r0yXVE7StmFX/3U4j5IS4cdCT43Xlq5smjdGO7qd7nhyUDqC9upFY9xm+93/
         6dSWZW7qK8P9gfhzSLo6w/nWGZSnD6Rz7zDr0k+Cf4Qiv5n9/7PkVypWIylUChgVTH6V
         4uvsaNGgpr+Xo+UFN2TZ3teQzgTp/MCL7x5gU56G5wB6tn6/CSBj+3V2SO9+gSCEhNZR
         REjJrr6BTkn7r7mh6DkB7y7pCYSOaqCi1KQoogErXjxhJFyMTUqSJSd2faD7WyMMUDmU
         hzsw==
X-Gm-Message-State: AO0yUKVgDdqbB73gyNac0a1mPWQhxJ9YvdKZ7ny/Tra2aDPPqvmwxWLL
        mdVjfJyDvS0pDflQYk+JWy7L8gnWG0pH3uYi
X-Google-Smtp-Source: AK7set9t/VHTZlkLnCB5duo7nSN9SKbaJ4XNTohbhr1iCdX33x+UEqT6DazkzrQ6YoPbfOJaUwfBeQ==
X-Received: by 2002:a05:622a:513:b0:3bc:dd23:cbb2 with SMTP id l19-20020a05622a051300b003bcdd23cbb2mr4061922qtx.33.1676387893251;
        Tue, 14 Feb 2023 07:18:13 -0800 (PST)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id f30-20020ac8015e000000b003b9bd163403sm11440162qtg.4.2023.02.14.07.18.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Feb 2023 07:18:13 -0800 (PST)
Received: by mail-yb1-f169.google.com with SMTP id l201so17557154ybf.10;
        Tue, 14 Feb 2023 07:18:12 -0800 (PST)
X-Received: by 2002:a25:f30f:0:b0:8c2:240e:bd05 with SMTP id
 c15-20020a25f30f000000b008c2240ebd05mr349652ybs.359.1676387892494; Tue, 14
 Feb 2023 07:18:12 -0800 (PST)
MIME-Version: 1.0
References: <20230121145853.4792-1-biju.das.jz@bp.renesas.com> <20230121145853.4792-11-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230121145853.4792-11-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 14 Feb 2023 16:18:00 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVSe+3wq6H+3YFWsYX8sEy0mzaBH5-pfVeGYt4snta8Kw@mail.gmail.com>
Message-ID: <CAMuHMdVSe+3wq6H+3YFWsYX8sEy0mzaBH5-pfVeGYt4snta8Kw@mail.gmail.com>
Subject: Re: [PATCH v3 10/12] arm64: dts: renesas: r9a09g011: Add USB3 DRD,
 device and host nodes
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sat, Jan 21, 2023 at 4:01 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> This patch add usb3 host and peripheral device node as child of usb3 drd
> node to RZ/V2M SoC dtsi. The host/device needs to issue reset release on
> DRD module before accessing host/device registers.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2->v3:
>  * No change

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.4.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
