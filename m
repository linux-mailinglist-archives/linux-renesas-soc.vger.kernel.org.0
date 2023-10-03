Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64FAC7B61F9
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Oct 2023 09:03:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239184AbjJCHDA convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 3 Oct 2023 03:03:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239298AbjJCHC5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 Oct 2023 03:02:57 -0400
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E860D10F;
        Tue,  3 Oct 2023 00:02:37 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-d8afe543712so630671276.0;
        Tue, 03 Oct 2023 00:02:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696316556; x=1696921356;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wE7uI3n73ZWQqhSbUOjbyEp0pv/Z2+ka6PpKonBV6s0=;
        b=EwrFIzj1mepbNxBTmw+TevrFFTE6vH98I+iZg3etDdL2UdhlLMQujdkgyflhu3hqPa
         G590GXTt5vEa4Hgd2m2HeWNP+gPGWG+sPO/UmriAl93bO7drhO7Ghwfw57aEeVcRQb8F
         GuHENfzzd7c64am2Jy/de98dLlWgvs5ssI0R7K/NVpESIkqEJHJa7bWDusyfW8PNCybw
         xD8N8YB5W9FtNMGex4pi+hdVyVNvc3nAcC9aIQuiGcQq/S/unkd/0HN3QroOITXP1hjw
         MNB3qwHOyFXr+ZVcJj2XnH+T4WvPpSrsHuAyUjH1MuZNnRjQbZcr0O2bncmL/jFVXcL+
         T5Mw==
X-Gm-Message-State: AOJu0YyF75vVmT1KVOkDeldhyX0P6hP/uwcESekkQrFA64j0Z2qr7ZyY
        PXP619qdwM1SLFY5NUGpfV7P9zhNPhw3rg==
X-Google-Smtp-Source: AGHT+IHUXabFztm3ngOU3GcO1VZ89OVi1ZDi9F6iva5AO0CcR43zfbYskxgXJaiq+F4yhuV8pUFKvg==
X-Received: by 2002:a5b:a8a:0:b0:d78:179a:eb33 with SMTP id h10-20020a5b0a8a000000b00d78179aeb33mr11529117ybq.17.1696316556313;
        Tue, 03 Oct 2023 00:02:36 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id e198-20020a2537cf000000b00d728a2738f1sm225493yba.61.2023.10.03.00.02.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Oct 2023 00:02:36 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-59c215f2f4aso7462457b3.1;
        Tue, 03 Oct 2023 00:02:35 -0700 (PDT)
X-Received: by 2002:a81:834f:0:b0:59b:9f06:1706 with SMTP id
 t76-20020a81834f000000b0059b9f061706mr13076648ywf.26.1696316555248; Tue, 03
 Oct 2023 00:02:35 -0700 (PDT)
MIME-Version: 1.0
References: <87v8bofna8.wl-kuninori.morimoto.gx@renesas.com> <87ttr8fn9o.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87ttr8fn9o.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 3 Oct 2023 09:02:22 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW8Q5pjTR8U0Cz1C3Sssc7whHnL-P2-GbQgFNkhyh5biw@mail.gmail.com>
Message-ID: <CAMuHMdW8Q5pjTR8U0Cz1C3Sssc7whHnL-P2-GbQgFNkhyh5biw@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] dt-bindings: irqchip: renesas,irqc: Add r8a779f0 support
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Oct 3, 2023 at 4:33 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> Document support for the Interrupt Controller for External Devices
> (INTC-EX) in the Renesas R-Car S4 (R8A779F0) SoC.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

I posted a similar patch before: "[PATCH v2] dt-bindings: irqchip:
renesas,irqc: Add r8a779f0 support"
https://lore.kernel.org/r/9467a1c67d5d240211f88336973fa968d39cc860.1690446928.git.geert+renesas@glider.be

Marc: please take one or the other ;-)
Thanks!

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
