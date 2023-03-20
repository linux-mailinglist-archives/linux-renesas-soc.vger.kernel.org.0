Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9B9F6C1683
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Mar 2023 16:06:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232160AbjCTPGr convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 20 Mar 2023 11:06:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232180AbjCTPGa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Mar 2023 11:06:30 -0400
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2EC92F07D;
        Mon, 20 Mar 2023 08:02:03 -0700 (PDT)
Received: by mail-ot1-f53.google.com with SMTP id k14-20020a056830150e00b0069f156d4ce9so2273645otp.6;
        Mon, 20 Mar 2023 08:02:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679324483;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gnfGX7Qm2m1ximJzaBiSodqBclPMC2gwUS6QauY2y6c=;
        b=WTHoSEsEOHwFn7a/NIu2YL785EXN91z+mSDjKdPZTagNF8iED69ZIRKt+ETQSqwJzF
         GQGxYJBOborwypp9gmEleScLCBNJTnRJhBV2oNOSE3N7YeQddjvt9918OUmjpqUHHWGK
         yLPRAmNZk7gXPfBnxNoIX5SPfNJBH7kCEPQTkD36DEdXuPUvSfkB9D0jSexQCep8lD1f
         7cjoqjRqOG2BonteLxV5poIC3MShnGAXx6PMumtZiSRQ8eaKCyyhVubC5kRDzKMamigK
         OXygfiEWOeAH4F1bestXRtZ0POUg+FxQdHIm1zc7xYuFo0u6gM8euI0bVeuetsLGLwOQ
         Gu/w==
X-Gm-Message-State: AO0yUKVMCST+afUqUyJjfObXF46zEL8QsU/0isNWUJgz0fehMrWFS8Bv
        JI1uAIlEeLsXS+FWr7gooSy1NFtpVSP0/g==
X-Google-Smtp-Source: AK7set9TEsz5eAzbYPU1BaLExsg77mIBTXtu4MQdSbyc8tK1Yz1U76J+og6gRiZXc5xr63eeUtj+wg==
X-Received: by 2002:a9d:6f8a:0:b0:69f:6663:6fb with SMTP id h10-20020a9d6f8a000000b0069f666306fbmr159222otq.13.1679324483425;
        Mon, 20 Mar 2023 08:01:23 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id z83-20020a376556000000b007468ed0160csm1119785qkb.128.2023.03.20.08.01.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Mar 2023 08:01:22 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id x198so3727987ybe.9;
        Mon, 20 Mar 2023 08:01:22 -0700 (PDT)
X-Received: by 2002:a25:f208:0:b0:b6b:841a:aae4 with SMTP id
 i8-20020a25f208000000b00b6b841aaae4mr2274045ybe.12.1679324482409; Mon, 20 Mar
 2023 08:01:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230313124026.954514-1-yoshihiro.shimoda.uh@renesas.com> <20230320144914.GA1609519-robh@kernel.org>
In-Reply-To: <20230320144914.GA1609519-robh@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 20 Mar 2023 16:01:11 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUOxNUL9Sm5n+SB01TaF1hgdFvZiAydKGw3OiLbbOCCPw@mail.gmail.com>
Message-ID: <CAMuHMdUOxNUL9Sm5n+SB01TaF1hgdFvZiAydKGw3OiLbbOCCPw@mail.gmail.com>
Subject: Re: [PATCH v4] dt-bindings: iommu: renesas, ipmmu-vmsa: Update for
 R-Car Gen4
To:     Rob Herring <robh@kernel.org>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        joro@8bytes.org, will@kernel.org, robin.murphy@arm.com,
        krzysztof.kozlowski+dt@linaro.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Rob,

On Mon, Mar 20, 2023 at 3:49 PM Rob Herring <robh@kernel.org> wrote:
> On Mon, Mar 13, 2023 at 09:40:26PM +0900, Yoshihiro Shimoda wrote:
> > Since R-Car Gen4 does not have the main IPMMU IMSSTR register, update
> > the bindings to drop the interrupt bit number from the
> > renesas,ipmmu-main property.
>
> Wouldn't it be easier to define a value meaning 'no interrupt bit' such
> as 0 or ~0 than having a variable sized property to parse?

(That would be ~0, as 0 is a valid bit number)

In theory: yes.
In practice: it doesn't matter much, as the driver doesn't use the value
anyway. Cfr. its parsing code being reworked in your patch
"[PATCH] iommu: Use of_property_present() for testing DT property presence"
https://lore.kernel.org/all/20230310144709.1542910-1-robh@kernel.org

So yes, using ~0 would simplify the bindings, but would complicate
the DTS files (and probably we should introduce a #define instead of
using ~0 or 0xffffffff or some other value).

> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > [geert: Re-add removed items level, add minItems/maxItems constraints]
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > Changes from v3:
> > https://lore.kernel.org/all/20230209133440.2643228-1-yoshihiro.shimoda.uh@renesas.com/
> >  - Revise the dt-bindings by Geert-san (Thanks a lot!).
> >
> >  .../bindings/iommu/renesas,ipmmu-vmsa.yaml    | 32 ++++++++++++++-----
> >  1 file changed, 24 insertions(+), 8 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.yaml b/Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.yaml
> > index 72308a4c14e7..be90f68c11d1 100644
> > --- a/Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.yaml
> > +++ b/Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.yaml
> > @@ -74,16 +74,16 @@ properties:
> >    renesas,ipmmu-main:
> >      $ref: /schemas/types.yaml#/definitions/phandle-array
> >      items:
> > -      - items:
> > +      - minItems: 1
> > +        items:
> >            - description: phandle to main IPMMU
> > -          - description: the interrupt bit number associated with the particular
> > -              cache IPMMU device. The interrupt bit number needs to match the main
> > -              IPMMU IMSSTR register. Only used by cache IPMMU instances.
> > +          - description:
> > +              The interrupt bit number associated with the particular cache
> > +              IPMMU device. If present, the interrupt bit number needs to match
> > +              the main IPMMU IMSSTR register. Only used by cache IPMMU
> > +              instances.
> >      description:
> > -      Reference to the main IPMMU phandle plus 1 cell. The cell is
> > -      the interrupt bit number associated with the particular cache IPMMU
> > -      device. The interrupt bit number needs to match the main IPMMU IMSSTR
> > -      register. Only used by cache IPMMU instances.
> > +      Reference to the main IPMMU.
> >
> >  required:
> >    - compatible
> > @@ -109,6 +109,22 @@ allOf:
> >        required:
> >          - power-domains
> >
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: renesas,rcar-gen4-ipmmu-vmsa
> > +    then:
> > +      properties:
> > +        renesas,ipmmu-main:
> > +          items:
> > +            - maxItems: 1
> > +    else:
> > +      properties:
> > +        renesas,ipmmu-main:
> > +          items:
> > +            - minItems: 2
> > +

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
