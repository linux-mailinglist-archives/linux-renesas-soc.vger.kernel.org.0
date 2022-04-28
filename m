Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C122513456
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Apr 2022 15:02:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346703AbiD1NFX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 28 Apr 2022 09:05:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233218AbiD1NFW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 28 Apr 2022 09:05:22 -0400
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59C567F221;
        Thu, 28 Apr 2022 06:02:08 -0700 (PDT)
Received: by mail-qv1-f49.google.com with SMTP id a5so3151414qvx.1;
        Thu, 28 Apr 2022 06:02:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JhCPEtQTjxn7diVXLoJsHfmTTzYbpRWQnDx17XJjhgw=;
        b=D3g4Y39TMKmpM/NgH15LU+SMO/nd2oubuMLec8bO5c4rh0njy5bk4XA5maVxYFglAc
         uro84Mp36uI2smb02O/8T1sas8ariNygpomdp8dGvYUoyBcdBjPuwH7UcWCFhzixGLT4
         oq87c3Pgj3vd7EpBrPeFbH44yLnUZcRa602ofm4Co4hLG6e+fJWkCdC5hFdKX7hOMsuS
         gXasAOV9yw6TUPSNhw3fk90GHyPUf+m7TYD7u65WhmyBHEoFd56odMXVlKBstMhCNVsP
         P7y703Sx1zJAPmoklfxvN85FpWwY3daQgr+HUPL+w/dX+f5VsU0Rk6dIV7YVVkjXPmlC
         hWag==
X-Gm-Message-State: AOAM533J/ZZQIITRRt44SL7yonTfVIUd5xxQH/rocSoGlZjfkRqQbhEL
        PgkJHiSceKWvfRP8ns3ynelassOwT707uQ==
X-Google-Smtp-Source: ABdhPJxLHC+tsBTakdRCUepxHHCoycLmm3JBOkiaCsn27v5c4IYMOYhKLLXLXFT1liRgdu6rHxdCSA==
X-Received: by 2002:a05:6214:1d2a:b0:456:40a4:4685 with SMTP id f10-20020a0562141d2a00b0045640a44685mr12193738qvd.127.1651150927140;
        Thu, 28 Apr 2022 06:02:07 -0700 (PDT)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id s13-20020a05620a0bcd00b0067afe7dd3ffsm9969384qki.49.2022.04.28.06.02.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Apr 2022 06:02:06 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-2f7b815ac06so52210487b3.3;
        Thu, 28 Apr 2022 06:02:06 -0700 (PDT)
X-Received: by 2002:a81:8489:0:b0:2f7:edff:239f with SMTP id
 u131-20020a818489000000b002f7edff239fmr20262845ywf.256.1651150926200; Thu, 28
 Apr 2022 06:02:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220425170530.200921-1-biju.das.jz@bp.renesas.com> <20220425170530.200921-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220425170530.200921-4-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 28 Apr 2022 15:01:53 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVOBfH=bOnJb0KBfBr2sptS9Zm4h1gMCZ4_VvcofrWeow@mail.gmail.com>
Message-ID: <CAMuHMdVOBfH=bOnJb0KBfBr2sptS9Zm4h1gMCZ4_VvcofrWeow@mail.gmail.com>
Subject: Re: [PATCH 03/13] arm64: dts: renesas: r9a07g043: Add USB2.0 support
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

On Mon, Apr 25, 2022 at 7:05 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add USB2.0 host and device support by filling usb phy control,
> phy, device and host stub nodes in RZ/G2UL SoC dtsi.
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
