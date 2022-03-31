Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 33EEE4ED771
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 31 Mar 2022 12:00:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234424AbiCaKB7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 31 Mar 2022 06:01:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234417AbiCaKBy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 31 Mar 2022 06:01:54 -0400
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33A5F3BBCF;
        Thu, 31 Mar 2022 03:00:04 -0700 (PDT)
Received: by mail-qv1-f49.google.com with SMTP id f3so19299480qvz.10;
        Thu, 31 Mar 2022 03:00:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qK54c3q2I2ReV8M9JIlTX8IFmN4MIvAI/UOlL3xuQW0=;
        b=zGmoRXOKTLuUMGyboNFFbbTF1CINVlAb2KCa/umeyU9l8MFi3s8kSf9LZKU0WSAtJP
         1TKS/fPwT36J+yCoOeCyd81rGrtX9QoCOX9lRw5+qBVAolnhQpOURQpCOwwzAh+pRAh7
         z60FTEYrtFOlviXAzcd6CyghIEQOWt9ySoQd29Mi4Zvrwh8eZxpqqTWoGUfR3LHx2foA
         rQVk6xDshnujeTMuueI8DcW8SmGXNzzHHDCa9HXQbfJwalzP/O9QAUXl+P0Co2OWmhxB
         1azNL+8PdYkxm9vLeN2p0OH3Y48/rM9ivs6bIt3Ufyb48KyqqdnvIatiMlw577YiL9xn
         rR5Q==
X-Gm-Message-State: AOAM532NF7fHXOIweT62DteVxEBF7Z6JaCum97PEkCgUE+obLEG2ojZZ
        JPxxIpB24lcX/v3DoRP4/ybKuGSKXyCQAw==
X-Google-Smtp-Source: ABdhPJyQExNPZgzd82QIcXy3aAU+xHtJ9IMmXZjhdf0KO9GJHGRtspt3ZzxYGEfkbEM9ZTTpI7sjmg==
X-Received: by 2002:a05:6214:21a5:b0:440:f3b8:d0aa with SMTP id t5-20020a05621421a500b00440f3b8d0aamr2919061qvc.61.1648720802803;
        Thu, 31 Mar 2022 03:00:02 -0700 (PDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id 21-20020ac85715000000b002e1ce9605ffsm19717651qtw.65.2022.03.31.03.00.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Mar 2022 03:00:02 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-2e5e176e1b6so248024317b3.13;
        Thu, 31 Mar 2022 03:00:02 -0700 (PDT)
X-Received: by 2002:a81:c703:0:b0:2d0:cc6b:3092 with SMTP id
 m3-20020a81c703000000b002d0cc6b3092mr3967223ywi.449.1648720801719; Thu, 31
 Mar 2022 03:00:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220315142644.17660-1-biju.das.jz@bp.renesas.com> <20220315142644.17660-7-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220315142644.17660-7-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 31 Mar 2022 11:59:50 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWa2tU2Jf7tGGyz5U-i9C4fS-iXeqBCnnNAKoc6kTSPHQ@mail.gmail.com>
Message-ID: <CAMuHMdWa2tU2Jf7tGGyz5U-i9C4fS-iXeqBCnnNAKoc6kTSPHQ@mail.gmail.com>
Subject: Re: [PATCH v3 6/7] arm64: dts: renesas: Add initial DTSI for RZ/G2UL SoC
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

On Tue, Mar 15, 2022 at 3:27 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add initial DTSI for RZ/G2UL SoC.
>
> Both RZ/G2L and RZ/G2UL uses the same SMARC EVK. Therefore they share
> the common dtsi (rz-smarc.dtsi) file. Place holders are added in
> device nodes to avoid compilation errors for the devices which have
> not been enabled yet on RZ/G2UL SoC.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v2->v3:
>  * Replaced clocks from R9A07G043U->R9A07G043
>  * Replaced compatible from r9a07g043u->r9a07g043

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
