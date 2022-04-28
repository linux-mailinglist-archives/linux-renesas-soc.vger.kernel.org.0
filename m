Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB1CD513671
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Apr 2022 16:10:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345156AbiD1ONV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 28 Apr 2022 10:13:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347933AbiD1ONU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 28 Apr 2022 10:13:20 -0400
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECB552C7;
        Thu, 28 Apr 2022 07:10:04 -0700 (PDT)
Received: by mail-qv1-f45.google.com with SMTP id 1so3268455qvs.8;
        Thu, 28 Apr 2022 07:10:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CKxalUl1M1SvVn0A60ScAFI8JZGp77vq7mTiqeVpHVw=;
        b=AV2yni1yjcBR1J63uL7vjfAToVhxwArfhUy41pCxAlYZzzhGHOkq1b1aa+GnrGLLoN
         vTUBkdOJ9fyTXDqwgArRMPuRTzki3Ah/ihp38cldEEJZ2cnD2LczfPafU0yQhikRnkrV
         1KVn0ZCVaY5DJGt+CF8ovynvl9RMoHGR6rCFg/T7aOV6izzYo43UidmkDjJtUk+SrS8K
         O4RTOyBVBzhY9h2Kt56Jc/61R0kX0Io5RQw9DCP10pQ5JEuwOn2HSfmJ2fUDkbxI9rhM
         K+RcfAet8N01XVVshnFgrM83EFZ/di8Qao+Vi3jeJ8KVfJwGj+b01vPsYxm0+utjqIu5
         9+MA==
X-Gm-Message-State: AOAM531rCrXjsJZmR3N9zN/lTp1C3O0R7sAxfgEjlUiCpjdZBvxVyC5W
        8uU5IrjgtUVWvO+abzhpDQgSaBY7HLcKnnxb
X-Google-Smtp-Source: ABdhPJwPmdw8wl1SUtfVJGnJeoqNsJrX7Islw79vhvT2tVJjdtvoweZM0kjjYVB8VBDSOmGnuRNZ1A==
X-Received: by 2002:ad4:4eec:0:b0:456:53ed:1b11 with SMTP id dv12-20020ad44eec000000b0045653ed1b11mr5066403qvb.1.1651155003837;
        Thu, 28 Apr 2022 07:10:03 -0700 (PDT)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com. [209.85.219.179])
        by smtp.gmail.com with ESMTPSA id f11-20020a05620a12eb00b0069c88d15b6asm15606qkl.68.2022.04.28.07.10.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Apr 2022 07:10:03 -0700 (PDT)
Received: by mail-yb1-f179.google.com with SMTP id i38so9176815ybj.13;
        Thu, 28 Apr 2022 07:10:03 -0700 (PDT)
X-Received: by 2002:a25:9e89:0:b0:63c:ad37:a5de with SMTP id
 p9-20020a259e89000000b0063cad37a5demr30900185ybq.342.1651155002765; Thu, 28
 Apr 2022 07:10:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220425170530.200921-1-biju.das.jz@bp.renesas.com> <20220425170530.200921-13-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220425170530.200921-13-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 28 Apr 2022 16:09:50 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXmbweC09xEmfZK4HEcju1CFhKYnuG05hAMa687gdNcKw@mail.gmail.com>
Message-ID: <CAMuHMdXmbweC09xEmfZK4HEcju1CFhKYnuG05hAMa687gdNcKw@mail.gmail.com>
Subject: Re: [PATCH 12/13] arm64: dts: renesas: rzg2ul-smarc-som: Enable OSTM
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
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Apr 25, 2022 at 7:06 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Enable OSTM{1, 2} interfaces on RZ/G2UL SMARC EVK.
> OSTM0 is reserved for TF-A.
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
