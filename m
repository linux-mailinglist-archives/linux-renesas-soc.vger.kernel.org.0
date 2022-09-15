Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B59E85B995F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Sep 2022 13:13:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229804AbiIOLNE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 15 Sep 2022 07:13:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229627AbiIOLND (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Sep 2022 07:13:03 -0400
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 827919A9A2;
        Thu, 15 Sep 2022 04:13:02 -0700 (PDT)
Received: by mail-qv1-f42.google.com with SMTP id o13so13878260qvw.12;
        Thu, 15 Sep 2022 04:13:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=b1H9IitsHRzZLObixFefzQTMDKGYldbXn5dO1sCoUQg=;
        b=EFX1zl6ayFyYyCm9dCNU6g7j/dKFdJJRAkwRThhleJlRrzPBJ+eIZhm8YM8z5shm2g
         PObINYkN2XN8jx+rNgt6uGzt3jS+DNxjo1wJaRMMS6UgKdLL91zM8NunMVRp7UEjOtCP
         APrCotMQNznwgyjz+cv6PpC7eK8nA7ANP2XOB0D1SbX4SJny4epa6sLO5xbV7rXG5AT7
         KtKxLwhU/cfieUsUBt2SncoFslX36+s/qxBwcr3bL4I8+ayx4XsnbrM+ReCJEqEJ7dHb
         nfHn5EIzK5mcVK26iiw8BnZmMgypvCq0e5qczYPHQNSFbus6y9jxXULFMko9ycxy5JYM
         2slA==
X-Gm-Message-State: ACgBeo278B6pgPF87mM6PmIlcnUHbIgmP57oeQISci/a7fY4sI2l6C4c
        b1ZFRYj7sZncCqrQU8i0k+UOAUrbOneobiLR
X-Google-Smtp-Source: AA6agR438DWmW83x7uSm1eQbx2pntKwimQQ/m5QX7uTOqvuejoXea+aSPC30aoI1F6BmG03QtzFESA==
X-Received: by 2002:a0c:ab57:0:b0:49f:185c:195 with SMTP id i23-20020a0cab57000000b0049f185c0195mr35827433qvb.108.1663240381293;
        Thu, 15 Sep 2022 04:13:01 -0700 (PDT)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id d8-20020a05620a166800b006ce0733caebsm3776696qko.14.2022.09.15.04.13.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Sep 2022 04:13:00 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-3454b0b1b6dso215542717b3.4;
        Thu, 15 Sep 2022 04:13:00 -0700 (PDT)
X-Received: by 2002:a81:6756:0:b0:345:525e:38 with SMTP id b83-20020a816756000000b00345525e0038mr34243429ywc.47.1663240379843;
 Thu, 15 Sep 2022 04:12:59 -0700 (PDT)
MIME-Version: 1.0
References: <dbdcffd009302734fe2fb895ce04b72fa1ea4355.1663165000.git.geert+renesas@glider.be>
 <20220915093537.qqddtqx2lr5ttuck@krzk-bin>
In-Reply-To: <20220915093537.qqddtqx2lr5ttuck@krzk-bin>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 15 Sep 2022 12:12:48 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV9dv8j34bXBiussjM3f6+nW2aJ-S2drU-MF4q_aB8trg@mail.gmail.com>
Message-ID: <CAMuHMdV9dv8j34bXBiussjM3f6+nW2aJ-S2drU-MF4q_aB8trg@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: phy: renesas,rcar-gen2-usb-phy: Convert
 to json-schema
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-phy@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
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

On Thu, Sep 15, 2022 at 10:35 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:>
> On Wed, 14 Sep 2022 16:17:37 +0200, Geert Uytterhoeven wrote:
> > Convert the Renesas R-Car Gen2 USB PHY Device Tree binding documentation
> > to json-schema.
> >
> > Add missing properties.
> > Rename the device node from "usb-phy" to "usb-phy-controller", as it
> > does not represent a USB PHY itself, and thus does not have a
> > "#phy-cells" property.
> > Rename the child nodes from "usb-channel" to "usb-phy", as these do
> > represent USB PHYs.
> > Drop the second example, as it doesn't add any value.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > v2:
> >   - Rename nodes to fix "'#phy-cells' is a required property".
> >
> > This is the final conversion to json-schema of DT bindings for Renesas
> > ARM SoCs, hurray!
> >
> > Note that there are still a few plain text bindings left for Renesas IP
> > cores that are present on non-Renesas SoCs (nbpfaxi and usdhi6rol0).
> > ---
> >  .../devicetree/bindings/phy/rcar-gen2-phy.txt | 112 ----------------
> >  .../phy/renesas,rcar-gen2-usb-phy.yaml        | 123 ++++++++++++++++++
> >  2 files changed, 123 insertions(+), 112 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/phy/rcar-gen2-phy.txt
> >  create mode 100644 Documentation/devicetree/bindings/phy/renesas,rcar-gen2-usb-phy.yaml
> >
>
> Running 'make dtbs_check' with the schema in this patch gives the
> following warnings. Consider if they are expected or the schema is
> incorrect. These may not be new warnings.

These should be fixed by the DTS counterpart
"[PATCH] ARM: dts: renesas: Fix USB PHY device and child node names"
https://lore.kernel.org/all/6442b4042e26537abc8632c4772f8201685f1f1f.1663165098.git.geert+renesas@glider.be/>

In hindsight, I should have cross-linked the patches in both
directions, not just in one direction. Sorry for that.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
