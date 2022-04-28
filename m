Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B5FF51356A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Apr 2022 15:40:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347507AbiD1Nnz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 28 Apr 2022 09:43:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347500AbiD1Nnx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 28 Apr 2022 09:43:53 -0400
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D805C4D61D;
        Thu, 28 Apr 2022 06:40:33 -0700 (PDT)
Received: by mail-qk1-f178.google.com with SMTP id y6so1424525qke.10;
        Thu, 28 Apr 2022 06:40:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WQVEW6hHabsKiVjgv0AyFA73xfhc/Jr7I3cTgYDmmq4=;
        b=rg2ucvmfVkmD054Ym5hWbdO4n+Lt7F2zgWeTBS9WGEhHISdA1htRXdcBJkynqhpnJ3
         kIVWFnuQF0Sz1SMwc+tikTC9XRl8jjoCtWrffAeNvx5W/26MLBGqjA+7pvmDgwL22Zog
         byte4kvmTGD+Z4mUAPRfxb4O1HCYhxmlVS2fN462hslN8KBBF9nqQw2txZkRMqATCLPG
         Y10EZilunAjT/WDxT9rl/twNyBU4YWRvAoduGLjQ0E+q6cRSVM+fxhNYpTLXZ8IXS3kL
         lyuxmAzGOVFSgkXNgPt4jSI7ClEZIcVZeVPFX83GcItvTuHw8T3vOHc36XMwMzlPBQhq
         FuSg==
X-Gm-Message-State: AOAM530gQzDFb+WLtHJJAJzb+98yZEAn+TJukGSwxVAWY2Mg/K7D5RoI
        mPj8eLQLpglob+g5VJVyVWK3+G+rn44oMw==
X-Google-Smtp-Source: ABdhPJy4ca5CHU5ITofgvQ10F7amB/AgH0bjVoSV5XJoqHdb3zPChZB84MjtPwmncdYZ1W09kE7ePw==
X-Received: by 2002:a37:ba06:0:b0:69c:114f:6f24 with SMTP id k6-20020a37ba06000000b0069c114f6f24mr19780484qkf.595.1651153231983;
        Thu, 28 Apr 2022 06:40:31 -0700 (PDT)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com. [209.85.219.176])
        by smtp.gmail.com with ESMTPSA id u18-20020a05622a011200b002f38843e32asm10048qtw.35.2022.04.28.06.40.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Apr 2022 06:40:31 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id y2so9069194ybi.7;
        Thu, 28 Apr 2022 06:40:31 -0700 (PDT)
X-Received: by 2002:a25:8087:0:b0:641:dd06:577d with SMTP id
 n7-20020a258087000000b00641dd06577dmr30516611ybk.207.1651153231323; Thu, 28
 Apr 2022 06:40:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220425170530.200921-1-biju.das.jz@bp.renesas.com> <20220425170530.200921-8-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220425170530.200921-8-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 28 Apr 2022 15:40:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX6yU9_BNugGb6Zumtv4r-9+S35Q6inFJKTYn6GA+t63Q@mail.gmail.com>
Message-ID: <CAMuHMdX6yU9_BNugGb6Zumtv4r-9+S35Q6inFJKTYn6GA+t63Q@mail.gmail.com>
Subject: Re: [PATCH 07/13] arm64: dts: renesas: rzg2ul-smarc: Enable i2c{0,1}
 and wm8978
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
> Enable i2c{0,1} on RZ/G2LC SMARC EVK by deleting respective
> entries from board dts and adding pincontrol entries to the
> soc-pinctrl dtsi. Also enable wm8978 audio codec.
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
