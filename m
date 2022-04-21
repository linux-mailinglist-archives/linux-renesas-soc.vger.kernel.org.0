Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 443B9509A75
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Apr 2022 10:17:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1386423AbiDUIK0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 21 Apr 2022 04:10:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1386425AbiDUIKY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Apr 2022 04:10:24 -0400
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF91C1E3C1;
        Thu, 21 Apr 2022 01:07:35 -0700 (PDT)
Received: by mail-qv1-f50.google.com with SMTP id b17so3147571qvp.6;
        Thu, 21 Apr 2022 01:07:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rIqPtJKYadrD/68SmjJjKl1KCebz61C6iCdUvTui6M8=;
        b=LSq9uEsIA/ZAti0vRveXooMN/ryZfW1qyxHg6NVFcFMM6CyCEMeo8SS01yjTbNOHRc
         QnzsrAItQY61iBKcmAE4EcB8nJfQqSbnDr6nU2RYwyyuHDG6pq5GTQAqKHuOGaS+MRWQ
         wZsfX8J0Da3Ish9Tbze8JVtYVSH3AwHLqk580FyL+abvrxyPF3xUj0pSHHwDPHcd1pmi
         evmnw5dS/mhX170TuAk9wQsovx1Aw540Y8Rj/v5GxFf2NQxuUK3w1qbD4q8bIX6hncfl
         ZCViY3hvF2R0Dpiv18SJJzlg9Oh94JG0ga07uMOHbbpGIRQF09LWngL+8hXJ4Ago+CB4
         66xg==
X-Gm-Message-State: AOAM533ROCCJdJ+dzPc1A4ixs9pvNaoKpCYXtPEcGGMezIdxN4PYleeB
        3rN2LHGsZk3iouWiawu6oHwAneaLRhCRTHEU
X-Google-Smtp-Source: ABdhPJwVcP41T8K9jfHGG5dDIIpiY75bphiYvqIfAYucnGwUVEOBNwogfgibenMmVJ3AtKhtJyZvLA==
X-Received: by 2002:a05:6214:c64:b0:449:7011:569d with SMTP id t4-20020a0562140c6400b004497011569dmr6832606qvj.90.1650528454553;
        Thu, 21 Apr 2022 01:07:34 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id v7-20020a379307000000b0069c0a2afc55sm2659387qkd.123.2022.04.21.01.07.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Apr 2022 01:07:34 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-2f19fdba41fso43757517b3.3;
        Thu, 21 Apr 2022 01:07:33 -0700 (PDT)
X-Received: by 2002:a81:618b:0:b0:2db:d952:8a39 with SMTP id
 v133-20020a81618b000000b002dbd9528a39mr24653797ywb.132.1650528453348; Thu, 21
 Apr 2022 01:07:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220420084255.375700-1-yoshihiro.shimoda.uh@renesas.com>
 <20220420084255.375700-6-yoshihiro.shimoda.uh@renesas.com> <ff0711f5-0e41-9aae-0b2f-381f272481bb@linaro.org>
In-Reply-To: <ff0711f5-0e41-9aae-0b2f-381f272481bb@linaro.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 21 Apr 2022 10:07:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVKpVqxZkisyPU4G6w3pBD_4tEJk3zf3axvfTpvZOjnwA@mail.gmail.com>
Message-ID: <CAMuHMdVKpVqxZkisyPU4G6w3pBD_4tEJk3zf3axvfTpvZOjnwA@mail.gmail.com>
Subject: Re: [PATCH 05/15] dt-bindings: power: Add r8a779g0 SYSC power domain definitions
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>
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

Hi Krzysztof,

On Thu, Apr 21, 2022 at 9:44 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> On 20/04/2022 10:42, Yoshihiro Shimoda wrote:
> > Add power domain indices for R-Car V4H (r8a779g0).
>
> Are these values used by renesas,rcar-sysc (r8a779g0) - patch 4? If yes,
> maybe just squash it?

They are used by driver and DT sources, so we typically keep this as
a separate patch, to be queued on a branch shared by driver and DT.

> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
