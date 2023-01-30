Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 596DA681A9B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Jan 2023 20:36:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238137AbjA3TgL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 30 Jan 2023 14:36:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238095AbjA3TgK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 30 Jan 2023 14:36:10 -0500
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA6DA3EFC8;
        Mon, 30 Jan 2023 11:36:06 -0800 (PST)
Received: by mail-oi1-f181.google.com with SMTP id s17so45217ois.10;
        Mon, 30 Jan 2023 11:36:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MKVjqRKStPGtyEwxaCj0ohxNvc0dxIuOgOWql908gkw=;
        b=kZGXdnjecd6EW4E+tdLi/L5fWpMwYXuNuF2I3bzTXPwsK9RZvI3H9l2VM9t724du6x
         hsU7UgrqM9fLt5KG7smmbEjdXqJyCS3arTZjyqilNNN3hJO87fyP5VM5ad+hm9rQPmSL
         is7YAhb6sqX2EeOu33YOgJtJjo1DuOT8/7vjQyx7KAW+gIW/xAMC5WciG972LnvZnsEY
         meJMPI/zXo9FDviBZUY9HDVrpTKJrnjd9eg4BzoLxiXM3kCr17Cqw1NeYcZmNva/iHB0
         PVfdzsRD9/NW2uS32L5ZtGQF2qCvaaLxFh3mAKnQdp9Wxmcnjyr46i9Lfxcu0GvN28y+
         FQeA==
X-Gm-Message-State: AO0yUKUpbnTlqPDZVdQtO8cUXqvAy+RknKZwdkcpM79NyclnAHD6RkUc
        SQQ5BSjPjRkcr96Zpo1a3Q==
X-Google-Smtp-Source: AK7set8Xx+4mi4emwLZhw3UeJydWN4cYJGg8ng23OdVmGBjhpJJ1GllfU+NXxN5Ixqzu/eb7vn+eJw==
X-Received: by 2002:a05:6808:ab9:b0:378:69f4:7f6c with SMTP id r25-20020a0568080ab900b0037869f47f6cmr1129358oij.43.1675107366043;
        Mon, 30 Jan 2023 11:36:06 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id h18-20020a9d61d2000000b0068bd9a6d644sm735279otk.23.2023.01.30.11.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 11:36:05 -0800 (PST)
Received: (nullmailer pid 3233511 invoked by uid 1000);
        Mon, 30 Jan 2023 19:36:04 -0000
Date:   Mon, 30 Jan 2023 13:36:04 -0600
From:   Rob Herring <robh@kernel.org>
To:     Robin Murphy <robin.murphy@arm.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        "joro@8bytes.org" <joro@8bytes.org>,
        "will@kernel.org" <will@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "iommu@lists.linux.dev" <iommu@lists.linux.dev>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] dt-bindings: iommu: renesas,ipmmu-vmsa: Update
 descriptions for R-Car Gen4
Message-ID: <20230130193604.GA3218335-robh@kernel.org>
References: <20230123012940.1250879-1-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdX92KMeON0xC9p17kiqWT7ksEBX_NyPiiQk0fLaucDZBA@mail.gmail.com>
 <TYBPR01MB5341B023178B4A10DE52B844D8CE9@TYBPR01MB5341.jpnprd01.prod.outlook.com>
 <CAMuHMdXXnu88Tn2ucuHZK=3G18v-nCfaTYpomchRXBu3bD7UuA@mail.gmail.com>
 <3c3e1dc2-1f66-565c-c677-2eae368e10be@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3c3e1dc2-1f66-565c-c677-2eae368e10be@arm.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Jan 25, 2023 at 10:42:13AM +0000, Robin Murphy wrote:
> On 2023-01-25 08:54, Geert Uytterhoeven wrote:
> > Hi Shimoda-san,
> > 
> > On Wed, Jan 25, 2023 at 1:49 AM Yoshihiro Shimoda
> > <yoshihiro.shimoda.uh@renesas.com> wrote:
> > > > From: Geert Uytterhoeven, Sent: Tuesday, January 24, 2023 11:35 PM
> > > > On Mon, Jan 23, 2023 at 2:35 AM Yoshihiro Shimoda
> > > > <yoshihiro.shimoda.uh@renesas.com> wrote:
> > > > > Since R-Car Gen4 doens't have the main IPMMU IMSSTR register, but
> > > > > each cache IPMMU has own module id. So, update descriptions of
> > > > > renesas,ipmmu-main property for R-Car Gen4.
> > > > > 
> > > > > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > 
> > > > > ---
> > > > >   The old R-Car S4-8 datasheet had described IPMMU IMSSTR register, but
> > > > >   the latest datasheet undocumented the register. So, update the propeties
> > > > >   description. Note that the second argument is not used on the driver.
> > > > 
> > > > DT describes hardware, not software policy.
> > > 
> > > I think so.
> > > 
> > > > >   So no behavior change.
> > > > 
> > > > So where do we get the module id numbers to use, if they are no longer
> > > > documented in the Hardware Manual?
> > > 
> > > If so, we cannot get the module id numbers. So, should we use other
> > > information which is completely fixed instead? I have some ideas:
> > > 1) Just 0 (or other fixed value) if the IMSSTR register doesn't exist.
> > > 2) Sequential numbers from register base offset.
> > >     In R-Car S4: ipmmu_rt0 is the first node from register base offset,
> > >     and ipmmu_rt1 is the second one.
> > >     So, ipmmu_rt0 is 0, ipmmu_rt1 is 1, ipmmu_ds0 is 2 and ipmmu_hc is 3.
> > > 3) Using base address upper 16-bits.
> > >     In R-Car S4: ipmmu_rt0 is 0xee480000. So, the value is 0xee48.
> > > 
> > > Perhaps, the option 1) is reasonable, I think. But, what do you think?
> > 
> > I would not make up numbers, as that would cause confusion with SoCs
> > where the numbers do match the hardware.
> > As the driver doesn't use the module id number (it already loops
> > over all domains, instead of checking IMSSTR, probably because of
> > historical (R-Car Gen2) reasons?), what about dropping it from the
> > property? I.e. add "minItems: 1", possibly only when compatible with
> > renesas,rcar-gen4-ipmmu-vmsa?
> 
> Right, if there really is no meaningful ID for this model then its binding
> should not require one.

I agree, however that makes parsing the property a pain (for both the 
schema and driver). This property is a matrix. The number of entries is 
already variable. If both dimensions are variable, we have to then look 
at the compatible to know how to parse it. I would go with option 1.

A 4th option is a new property.

Rob
