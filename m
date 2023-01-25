Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 826F467ACDF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Jan 2023 09:55:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234171AbjAYIzE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 25 Jan 2023 03:55:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234648AbjAYIyu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Jan 2023 03:54:50 -0500
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE21C2DE62;
        Wed, 25 Jan 2023 00:54:49 -0800 (PST)
Received: by mail-qv1-f44.google.com with SMTP id r14so622623qvx.4;
        Wed, 25 Jan 2023 00:54:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4i0NQxBxCgG41kmz90B1V7AlGxxGPtE8fvvNdHh0fI4=;
        b=XpwD+3k0OvnxkUpgJ4nDMB3UeSnemfQpmP337Jwwt4WFtqlWhJc8Z0ixtDJw1hYB+x
         IWo+M6hw7MLcPPO5AzOBI0DoRKlOvX8Cr8eN5ZJfHDjnYAYSXnU2QBP8bZfgh9Qj0PrF
         jlxhxEmk8eWCTsRtjoJi4+FVav4Hhj6aEkogNKET1WZHyIAwU4vCY+QyNUHTpZdO+Wfw
         TlpXfZ6QAU6YPlYG1Hilgei5JmCtnwBKuxZZUMZnUhD/gdgffyKKBg3brKP/wR8aJ7d4
         dAoeb07Iqm5Cc1fO9Rj35NhRVRX5sWY6PT5sbB/RUzuAfLA8v7DEkc+q1J12VMZ3sOJi
         pk8A==
X-Gm-Message-State: AFqh2kreGyiIDOPVW+zOgJnnbfq/c6d7o0MOpSVHivs35RFygGe6WnMu
        gmtjKJRwO58qh0viSCalNEoswu7BiaghEQ==
X-Google-Smtp-Source: AMrXdXvgWuka9FN73ULFUk3Dvr663m1L5m5tYLAINNps3WeVX8tkAsQXOp/+H3guMLxAGhqxHf4GWg==
X-Received: by 2002:a05:6214:3206:b0:537:4ac0:71d5 with SMTP id ms6-20020a056214320600b005374ac071d5mr23486440qvb.2.1674636888609;
        Wed, 25 Jan 2023 00:54:48 -0800 (PST)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com. [209.85.219.175])
        by smtp.gmail.com with ESMTPSA id cx15-20020a05620a51cf00b006e16dcf99c8sm3073961qkb.71.2023.01.25.00.54.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jan 2023 00:54:48 -0800 (PST)
Received: by mail-yb1-f175.google.com with SMTP id c124so22058968ybb.13;
        Wed, 25 Jan 2023 00:54:47 -0800 (PST)
X-Received: by 2002:a25:dd8:0:b0:80a:6a1c:7c3b with SMTP id
 207-20020a250dd8000000b0080a6a1c7c3bmr1186104ybn.89.1674636887719; Wed, 25
 Jan 2023 00:54:47 -0800 (PST)
MIME-Version: 1.0
References: <20230123012940.1250879-1-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdX92KMeON0xC9p17kiqWT7ksEBX_NyPiiQk0fLaucDZBA@mail.gmail.com> <TYBPR01MB5341B023178B4A10DE52B844D8CE9@TYBPR01MB5341.jpnprd01.prod.outlook.com>
In-Reply-To: <TYBPR01MB5341B023178B4A10DE52B844D8CE9@TYBPR01MB5341.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 25 Jan 2023 09:54:36 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXXnu88Tn2ucuHZK=3G18v-nCfaTYpomchRXBu3bD7UuA@mail.gmail.com>
Message-ID: <CAMuHMdXXnu88Tn2ucuHZK=3G18v-nCfaTYpomchRXBu3bD7UuA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: iommu: renesas,ipmmu-vmsa: Update
 descriptions for R-Car Gen4
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     "joro@8bytes.org" <joro@8bytes.org>,
        "will@kernel.org" <will@kernel.org>,
        "robin.murphy@arm.com" <robin.murphy@arm.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "iommu@lists.linux.dev" <iommu@lists.linux.dev>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

On Wed, Jan 25, 2023 at 1:49 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> > From: Geert Uytterhoeven, Sent: Tuesday, January 24, 2023 11:35 PM
> > On Mon, Jan 23, 2023 at 2:35 AM Yoshihiro Shimoda
> > <yoshihiro.shimoda.uh@renesas.com> wrote:
> > > Since R-Car Gen4 doens't have the main IPMMU IMSSTR register, but
> > > each cache IPMMU has own module id. So, update descriptions of
> > > renesas,ipmmu-main property for R-Car Gen4.
> > >
> > > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

> > > ---
> > >  The old R-Car S4-8 datasheet had described IPMMU IMSSTR register, but
> > >  the latest datasheet undocumented the register. So, update the propeties
> > >  description. Note that the second argument is not used on the driver.
> >
> > DT describes hardware, not software policy.
>
> I think so.
>
> > >  So no behavior change.
> >
> > So where do we get the module id numbers to use, if they are no longer
> > documented in the Hardware Manual?
>
> If so, we cannot get the module id numbers. So, should we use other
> information which is completely fixed instead? I have some ideas:
> 1) Just 0 (or other fixed value) if the IMSSTR register doesn't exist.
> 2) Sequential numbers from register base offset.
>    In R-Car S4: ipmmu_rt0 is the first node from register base offset,
>    and ipmmu_rt1 is the second one.
>    So, ipmmu_rt0 is 0, ipmmu_rt1 is 1, ipmmu_ds0 is 2 and ipmmu_hc is 3.
> 3) Using base address upper 16-bits.
>    In R-Car S4: ipmmu_rt0 is 0xee480000. So, the value is 0xee48.
>
> Perhaps, the option 1) is reasonable, I think. But, what do you think?

I would not make up numbers, as that would cause confusion with SoCs
where the numbers do match the hardware.
As the driver doesn't use the module id number (it already loops
over all domains, instead of checking IMSSTR, probably because of
historical (R-Car Gen2) reasons?), what about dropping it from the
property? I.e. add "minItems: 1", possibly only when compatible with
renesas,rcar-gen4-ipmmu-vmsa?

BTW, the related IMCTR register is still documented, and the driver
does enable the interrupt bit (IMCTR_INTEN), so I'm wondering how the
hardware (documentation) people intend this to be used...
Perhaps IMCTR_INTEN will be removed/undocumented, too?
Or perhaps the removal/undocumentation of IMSSTR was a mistake?

> > > --- a/Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.yaml
> > > +++ b/Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.yaml
> > > @@ -76,14 +76,15 @@ properties:
> > >      items:
> > >        - items:
> > >            - description: phandle to main IPMMU
> > > -          - description: the interrupt bit number associated with the particular
> > > -              cache IPMMU device. The interrupt bit number needs to match the main
> > > -              IPMMU IMSSTR register. Only used by cache IPMMU instances.
> > > +          - description: The interrupt bit number or module id associated with
> > > +              the particular cache IPMMU device. The interrupt bit number needs
> > > +              to match the main IPMMU IMSSTR register. Only used by cache IPMMU
> > > +              instances.
> > >      description:
> > >        Reference to the main IPMMU phandle plus 1 cell. The cell is
> > > -      the interrupt bit number associated with the particular cache IPMMU
> > > -      device. The interrupt bit number needs to match the main IPMMU IMSSTR
> > > -      register. Only used by cache IPMMU instances.
> > > +      the interrupt bit number or module id associated with the particular
> > > +      cache IPMMU device. The interrupt bit number needs to match the main
> > > +      IPMMU IMSSTR register. Only used by cache IPMMU instances.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
