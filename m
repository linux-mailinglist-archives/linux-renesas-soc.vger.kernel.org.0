Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A8EF651004E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Apr 2022 16:21:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351560AbiDZOYm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 26 Apr 2022 10:24:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346521AbiDZOYj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 Apr 2022 10:24:39 -0400
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8467015817;
        Tue, 26 Apr 2022 07:21:31 -0700 (PDT)
Received: by mail-qt1-f180.google.com with SMTP id f22so12708415qtp.13;
        Tue, 26 Apr 2022 07:21:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=U4A617tk0nNBBFScQn0uljcqEi3aKbLGbWvmjOlIlM0=;
        b=cQi2P4t4f5t2ae2xzGeo2VJdceQL6834VW89UKpoyMV/n3do4+kdfHQbNdbDMbtVds
         4LREVEAnvGASD6WF1+Vb3iyt8wXzIpsHUnpFVw+wiEJjF3my7pqEzf5vMPelndm9KTxo
         wCKWvsq2WDsUbMFal+T1DbL19LmKAy0+CPxCsH54IkI06kCA1qqt+afD0Cm8p/WPOsm1
         iGmJhq23b7xIQ+OFEENarMkXII7/EGguPRyK8qF8grbVtGHW/WMGg9i4FAQhJeeIt6mi
         CRiXj4llPDaj3cqQ2Iq7j81taxSMEocSaZ2GDl2PbTVUXMI0z3lNLM0JQTJg24VFdlTK
         +Rrw==
X-Gm-Message-State: AOAM530s7qQDj4hfa0DRV+36+piazwu5oVFHwQDSHwK67t/tSNLfN5Cz
        YgG2j43AFhV3tvLqQKApsxjNe7bufaTJFw==
X-Google-Smtp-Source: ABdhPJxoTGOwfiIpO87FcoNvbMnBrDfjmPvjSc+OcSQ9iWbH6UYyXJ7h+e/hFzISq/sF+QDsTH/LAw==
X-Received: by 2002:a05:622a:14c:b0:2f3:7232:f5d8 with SMTP id v12-20020a05622a014c00b002f37232f5d8mr4211812qtw.390.1650982890421;
        Tue, 26 Apr 2022 07:21:30 -0700 (PDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id x24-20020ac87318000000b002f1fc5fcaedsm7474982qto.68.2022.04.26.07.21.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Apr 2022 07:21:29 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id m128so15290981ybm.5;
        Tue, 26 Apr 2022 07:21:29 -0700 (PDT)
X-Received: by 2002:a25:9e89:0:b0:63c:ad37:a5de with SMTP id
 p9-20020a259e89000000b0063cad37a5demr21057779ybq.342.1650982889534; Tue, 26
 Apr 2022 07:21:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220330154024.112270-1-phil.edworthy@renesas.com> <20220330154024.112270-5-phil.edworthy@renesas.com>
In-Reply-To: <20220330154024.112270-5-phil.edworthy@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 26 Apr 2022 16:21:18 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWErGQuE+ESi3ZGVgyW5ouUthr5XsmnwLJD0VX6D3QVPA@mail.gmail.com>
Message-ID: <CAMuHMdWErGQuE+ESi3ZGVgyW5ouUthr5XsmnwLJD0VX6D3QVPA@mail.gmail.com>
Subject: Re: [PATCH v2 04/13] dt-bindings: clock: renesas,rzg2l: Document
 RZ/V2M SoC
To:     Phil Edworthy <phil.edworthy@renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
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

Hi Phil,

On Wed, Mar 30, 2022 at 5:41 PM Phil Edworthy <phil.edworthy@renesas.com> wrote:
> Document the device tree binding for the Renesas RZ/V2M (r9a09g011) SoC.
>
> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.yaml
> +++ b/Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.yaml
> @@ -42,9 +44,10 @@ properties:
>      description: |
>        - For CPG core clocks, the two clock specifier cells must be "CPG_CORE"
>          and a core clock reference, as defined in
> -        <dt-bindings/clock/r9a07g*-cpg.h>
> +        <dt-bindings/clock/r9a07g*-cpg.h> or <dt-bindings/clock/r9a09g011-cpg.h>

I guess we can simplify to dt-bindings/clock/r9a0*-cpg.h?

The rest LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
