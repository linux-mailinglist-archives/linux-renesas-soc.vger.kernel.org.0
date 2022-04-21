Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E3AD509C7D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Apr 2022 11:40:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1387654AbiDUJki (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 21 Apr 2022 05:40:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1387732AbiDUJkh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Apr 2022 05:40:37 -0400
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 965B423BE4;
        Thu, 21 Apr 2022 02:37:46 -0700 (PDT)
Received: by mail-qt1-f180.google.com with SMTP id fu34so2828980qtb.8;
        Thu, 21 Apr 2022 02:37:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=syuxrjZB7ESgDqFFjXMmUeouBDx5Tp+5UrSOukfsazU=;
        b=O6/XkX+k5mjtim8qMCmzYhVJ8pnSRmelVcwtdgjw9rrgfCqnIbsWbNDkQQX5lOH5Ob
         VsWHs4V8Dm4ef8fTbzMw7j4vndzS3sC0H6KeEZ4PScBfpLyWF3C2uEO2+pCzI/dQl333
         7C68xOOYeEBqrrSf8XvhqfVWqs4rzCCFjF6kk7mzo6j07mMPBYw3tWnKgeQwmuh/j1jU
         Cj4WbGd2f+3zwWB7IzW3K3Hsvw5GGiemuiKCKo0eOCfxTpxOE2wzhG2CMEIsl8xmm5qR
         u9FbfJo65uNPAWhYBNlXa6ppPUJmunby0kSFbTc0ONVo97mMmfuFZzEt7B3AlXjqwGNf
         zdkw==
X-Gm-Message-State: AOAM532Bt3TFZqHpQcJdJD8IhaLMEqSDWuOs3I+0SkO1poRtrz5OiRNJ
        cs/jj4Mcrh46wXDPgC9HEs+TgpKkGFEsGXHm
X-Google-Smtp-Source: ABdhPJxJNgphtLFMtQ55bSMLcZdDnFr1TxCZzpermSdgo4UZQchJwY3X7n3VaWp3qCM1/wQz+btV1A==
X-Received: by 2002:ac8:5cc1:0:b0:2e1:bd05:1371 with SMTP id s1-20020ac85cc1000000b002e1bd051371mr16315941qta.573.1650533865662;
        Thu, 21 Apr 2022 02:37:45 -0700 (PDT)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com. [209.85.219.178])
        by smtp.gmail.com with ESMTPSA id k14-20020ac85fce000000b002f344fc0e0bsm1934170qta.38.2022.04.21.02.37.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Apr 2022 02:37:45 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id m132so7735576ybm.4;
        Thu, 21 Apr 2022 02:37:45 -0700 (PDT)
X-Received: by 2002:a5b:24e:0:b0:63d:cba0:3d55 with SMTP id
 g14-20020a5b024e000000b0063dcba03d55mr23425660ybp.613.1650533865187; Thu, 21
 Apr 2022 02:37:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220420084255.375700-1-yoshihiro.shimoda.uh@renesas.com> <20220420084255.375700-6-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20220420084255.375700-6-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 21 Apr 2022 11:37:33 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUZthh9z5wzLkEqYR5x=-ZkJaxyuvEUM8fJWnyo6_AY2w@mail.gmail.com>
Message-ID: <CAMuHMdUZthh9z5wzLkEqYR5x=-ZkJaxyuvEUM8fJWnyo6_AY2w@mail.gmail.com>
Subject: Re: [PATCH 05/15] dt-bindings: power: Add r8a779g0 SYSC power domain definitions
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
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
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Apr 20, 2022 at 10:43 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Add power domain indices for R-Car V4H (r8a779g0).
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue for v5.19 a branch shared by driver and DT.


Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
