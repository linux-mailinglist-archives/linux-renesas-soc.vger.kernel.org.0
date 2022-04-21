Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94C4B509C95
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Apr 2022 11:46:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1387813AbiDUJsW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 21 Apr 2022 05:48:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1387850AbiDUJsV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Apr 2022 05:48:21 -0400
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 537451FA48;
        Thu, 21 Apr 2022 02:45:32 -0700 (PDT)
Received: by mail-qk1-f180.google.com with SMTP id a186so3145120qkc.10;
        Thu, 21 Apr 2022 02:45:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZjJi9543XMKbwc8gK/qWwDNVyq7vtDMnwSeDFhUqSBc=;
        b=NeP/EfBwi6tzTkEt0aFqu6JOJTmAQcXwxsS8C61BZ88JLLby1EdrQJJtxnywjFhcA6
         kDv6Wa9R+9Tas2SFwqcmgOVucICuo3P6qXHI3BT7AcK2zpaBk8bjKLpuG7/f13zi6OsH
         tygd4VdMafKwNHNyvWk7wxrYPrWGcoaTn4J5HhmFYV7xkaVHwOlFmfT/4FrN5vICClzs
         tLQ3GfR1BKM8UoYHBgdb1eb9pGaquQ6fUm62++GmnEEuUd/vLWx5cXH5XRLJJIgXsbDD
         rCOopySL0RSaU+OGGU6Mq/XblQyg+3LpRjEvXtcjP0KYQmwJHMbRpXrGzhDRoSkbkvOI
         F6dg==
X-Gm-Message-State: AOAM532WpvGCL71ldeHpujflAxhORH+xdiUnmW/LOFKQI46OAe/wqDf9
        O/Oxy47LvYdiAKkBr1uPrxy44Id4cHfXiugQ
X-Google-Smtp-Source: ABdhPJzizmHKHbrw/m2S4aYvxqcHb80SB6ef7M2hTy438UlekoX5Fz1paR64V4nleONn42rySNYe1A==
X-Received: by 2002:a05:620a:4549:b0:69f:458:24e3 with SMTP id u9-20020a05620a454900b0069f045824e3mr639568qkp.646.1650534331214;
        Thu, 21 Apr 2022 02:45:31 -0700 (PDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id c17-20020a05622a025100b002f34db6a3a2sm580680qtx.4.2022.04.21.02.45.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Apr 2022 02:45:30 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id p65so7725723ybp.9;
        Thu, 21 Apr 2022 02:45:30 -0700 (PDT)
X-Received: by 2002:a5b:984:0:b0:63f:8c38:676c with SMTP id
 c4-20020a5b0984000000b0063f8c38676cmr24425442ybq.393.1650534330547; Thu, 21
 Apr 2022 02:45:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220420084255.375700-1-yoshihiro.shimoda.uh@renesas.com> <20220420084255.375700-9-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20220420084255.375700-9-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 21 Apr 2022 11:45:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUjhdvsNFqJU+9p=BEq_Jnek=MT5RKu0Dg89nMB2gpMgw@mail.gmail.com>
Message-ID: <CAMuHMdUjhdvsNFqJU+9p=BEq_Jnek=MT5RKu0Dg89nMB2gpMgw@mail.gmail.com>
Subject: Re: [PATCH 08/15] dt-bindings: serial: renesas,hscif: Document
 r8a779g0 bindings
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
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Apr 20, 2022 at 10:43 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> R-Car V4H (R8A779G0) SoC has the R-Car Gen4 compatible HSCIF ports,
> so document the SoC specific bindings.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
