Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B0D9B510333
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Apr 2022 18:21:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348946AbiDZQYM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 26 Apr 2022 12:24:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352970AbiDZQYE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 Apr 2022 12:24:04 -0400
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B65E0E0AD0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 26 Apr 2022 09:20:56 -0700 (PDT)
Received: by mail-qk1-f174.google.com with SMTP id c1so13580097qkf.13
        for <linux-renesas-soc@vger.kernel.org>; Tue, 26 Apr 2022 09:20:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ATEod7wucBCWHKaYO56mXH8nPXUUg87J10WUwXQNXvU=;
        b=N0BOB3rfUaicPClujRtqxbQkSBse/asFNz3VVGPhYHlx60BU6hHXmNHbtRwHVaaK7i
         7uR6LwyWca0PKYGqtQ0ntDoLuYbc/ji4+7vsSCdGG+XO6UWgL0Hk3OgmJ3HjH33ayVv8
         hOTuJqF8Fc3bfzl/l5dxccnlKSiFcpPE90jkhCHsHvBA/18Iz3wqKp+njRMV8GwcF36X
         xwz1DV8O8SXQdpjMEkAp5+wbt8FswNmOgGwHf/C5IhI8FNSU37IX+WrabbgQhZsjIKKD
         Q/Oo87omzLYrSRAWzEDMPt2D5F6Jc4V0/80sGobbA39zqRQNQijPfRB8f43mg89+Z0X+
         GoZA==
X-Gm-Message-State: AOAM532586sQjHlrwJ0GLvS6XospQ0vljSGdCNs76qnKpyD9JMTAK445
        1XNkplimE5By3rJSbRRQC7Oh0j/fglQEXA==
X-Google-Smtp-Source: ABdhPJyWi7xDS5LLNImXBubkowuyrzzDRKxFsQHeWh/VE0QbbS14W9feWKHWuRY9qAn6VAIHQ+KfgA==
X-Received: by 2002:a05:620a:708:b0:69e:5de8:d82e with SMTP id 8-20020a05620a070800b0069e5de8d82emr13434708qkc.732.1650990055520;
        Tue, 26 Apr 2022 09:20:55 -0700 (PDT)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com. [209.85.219.178])
        by smtp.gmail.com with ESMTPSA id v17-20020a05620a123100b0069e871f949fsm6638543qkj.81.2022.04.26.09.20.54
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Apr 2022 09:20:55 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id w187so24495139ybe.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 26 Apr 2022 09:20:54 -0700 (PDT)
X-Received: by 2002:a25:8087:0:b0:641:dd06:577d with SMTP id
 n7-20020a258087000000b00641dd06577dmr21514480ybk.207.1650990054669; Tue, 26
 Apr 2022 09:20:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220330154024.112270-1-phil.edworthy@renesas.com> <20220330154024.112270-12-phil.edworthy@renesas.com>
In-Reply-To: <20220330154024.112270-12-phil.edworthy@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 26 Apr 2022 18:20:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX1uy==N+bS4-wrO1rKMuA5Yo_KCgcNHZFQpvFQQCyjWQ@mail.gmail.com>
Message-ID: <CAMuHMdX1uy==N+bS4-wrO1rKMuA5Yo_KCgcNHZFQpvFQQCyjWQ@mail.gmail.com>
Subject: Re: [PATCH v2 11/13] arm64: defconfig: Enable Renesas RZ/V2M SoC
To:     Phil Edworthy <phil.edworthy@renesas.com>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Marcel Ziswiler <marcel.ziswiler@toradex.com>,
        Vinod Koul <vkoul@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
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

On Wed, Mar 30, 2022 at 5:42 PM Phil Edworthy <phil.edworthy@renesas.com> wrote:
> Enable the Renesas RZ/V2M SoC and the uart it uses.
>
> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.19.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
