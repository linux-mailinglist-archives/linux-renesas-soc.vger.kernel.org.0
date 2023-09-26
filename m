Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 696287AE66A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Sep 2023 09:08:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229598AbjIZHIv convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 26 Sep 2023 03:08:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229585AbjIZHIu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 Sep 2023 03:08:50 -0400
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 125B6DE
        for <linux-renesas-soc@vger.kernel.org>; Tue, 26 Sep 2023 00:08:43 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-59c215f2f4aso103017357b3.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 26 Sep 2023 00:08:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695712122; x=1696316922;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e9dJcLI1w4uLRXqQWkfXUwuKUEGdE8RSjh6k8AWdTlY=;
        b=T23QAlUngDVvko5+j0gm5WhENUMz223kBm5vA1WohPNOYVF1GP87gSESiHQVWyI1mA
         Q/M/pFl39Kw8KqK86Ld9rG7BHx37lfoHEKn6xlFw0QLELE2GB2lfuDvlBZB5TtANsOKm
         6GTmvIkC4TTMt3DrFsEXyJ/pAn2IHREK3wdnHqq3cMpNN7fMmkV5YhOBdq6URKbzMO2N
         DiPLmrt2WmJZ3vEHT2rWXVJgjoZVyDvjKy1bk3KVs87Nzs5rtT18K9nh2EdGAz4oIiRc
         7YlgcJJsjdXq7S4MvZCG/EzRWQ4WNRS9Z1tJC37DSi0IeU7Je7GqGRgWSVzsN+f61nO7
         DwAA==
X-Gm-Message-State: AOJu0Ywh7x2kZNfy6VSawL+1UPjUajfIyHLDKat4JKjGaFlOlh0EBlB+
        tywd55F38dcAxP+Fs/hBTUd+bi9tMTFr5w==
X-Google-Smtp-Source: AGHT+IHAlpdct07WBCAZHkVjTFusNbv/WVEyAG/cdPBoMce1QJsqg+sapmpReU6V23PN9blNT5iJJg==
X-Received: by 2002:a81:b301:0:b0:59f:761a:fe70 with SMTP id r1-20020a81b301000000b0059f761afe70mr5954572ywh.19.1695712121975;
        Tue, 26 Sep 2023 00:08:41 -0700 (PDT)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com. [209.85.128.182])
        by smtp.gmail.com with ESMTPSA id j128-20020a0dc786000000b005928ba6806dsm2852130ywd.97.2023.09.26.00.08.41
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Sep 2023 00:08:41 -0700 (PDT)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-59c215f2f4aso103017087b3.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 26 Sep 2023 00:08:41 -0700 (PDT)
X-Received: by 2002:a0d:ce85:0:b0:59b:9f06:1706 with SMTP id
 q127-20020a0dce85000000b0059b9f061706mr9051958ywd.26.1695712121227; Tue, 26
 Sep 2023 00:08:41 -0700 (PDT)
MIME-Version: 1.0
References: <87pm25im9q.wl-kuninori.morimoto.gx@renesas.com> <87o7hpim8k.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87o7hpim8k.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 26 Sep 2023 09:08:28 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWhPUyOXfMJ4dj8ZTBESVKSsMQeEV3F0GUgS=E=Xpi=AA@mail.gmail.com>
Message-ID: <CAMuHMdWhPUyOXfMJ4dj8ZTBESVKSsMQeEV3F0GUgS=E=Xpi=AA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: irqchip: renesas,irqc: Add r8a779f0 support
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Marc Zyngier <maz@kernel.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Michael Dege <michael.dege@renesas.com>,
        Yusuke Goda <yusuke.goda.sx@renesas.com>,
        Tam Nguyen <tam.nguyen.xa@renesas.com>,
        Hai Pham <hai.pham.ud@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Morimoto-san,

On Tue, Sep 26, 2023 at 6:37 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> Document support for the Interrupt Controller for External Devices
> (INT-EX) in the Renesas R-Car S4 (R8A779F0) SoC.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

I posted a similar patch before: "[PATCH v2] dt-bindings: irqchip:
renesas,irqc: Add r8a779f0 support"
https://lore.kernel.org/r/9467a1c67d5d240211f88336973fa968d39cc860.1690446928.git.geert+renesas@glider.be

Marc: please take one or the other ;-)
Thanks!

> --- a/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.yaml
> @@ -37,6 +37,7 @@ properties:
>            - renesas,intc-ex-r8a77990    # R-Car E3
>            - renesas,intc-ex-r8a77995    # R-Car D3
>            - renesas,intc-ex-r8a779a0    # R-Car V3U
> +          - renesas,intc-ex-r8a779f0    # R-Car S4
>            - renesas,intc-ex-r8a779g0    # R-Car V4H
>        - const: renesas,irqc

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
