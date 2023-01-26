Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8AF5C67C603
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Jan 2023 09:39:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236493AbjAZIjR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 26 Jan 2023 03:39:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236498AbjAZIiy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Jan 2023 03:38:54 -0500
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB9F6166FE;
        Thu, 26 Jan 2023 00:38:40 -0800 (PST)
Received: by mail-qt1-f175.google.com with SMTP id z9so750473qtv.5;
        Thu, 26 Jan 2023 00:38:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=imMQkcCxuclW/Kw/E739M72VzNhM+ffNSWSlrWspFBw=;
        b=cfdke1sD9WLptp2waYMRt6SXS2qkWpcvatuB62MEuefsDzmWH58w5g/0M/LjC53/Kj
         vJWk7Reyt+CY/76JvYtcYAv1UbZP/j1gUZtisEeZSb1eFbDeLZ51+IaQ69PZxgQtjcIy
         VC6Yn/yVOfeyqKMeEOnSvb42CPfc0CxrSmDP3bugXKTscNv0/UZc6XejPIHgxZTOv1fJ
         PVyl1kwzGMk/hLVMchmLSsujXUD24IUos9SxTboOXv9gzXRrBaFlYmioz1s6qZ1Dg5uc
         4nmyFqYMRqvdOy76cjI6jVMJdgCU4C44T9HdS9bb2XyNnGfSWtfwViJgugseoHixiQVU
         BIog==
X-Gm-Message-State: AFqh2kpxTodYF5vo3TlM7cPJFrIojt7CxzoV48nje8hXtNiOzLYIiUea
        5pYcRHbBXlj/39zvwc+UhB6risIdjFZ+ug==
X-Google-Smtp-Source: AMrXdXua1aGTFJNWztyuDnvKSWUhcnsfymPW4GXTaI/MQQEvp/kaXBLrfCOmPhdjU2DT46x+K3LVrA==
X-Received: by 2002:ac8:6708:0:b0:3a9:818f:db3d with SMTP id e8-20020ac86708000000b003a9818fdb3dmr51434505qtp.53.1674722319059;
        Thu, 26 Jan 2023 00:38:39 -0800 (PST)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id 202-20020a3707d3000000b007091068cff1sm574073qkh.28.2023.01.26.00.38.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jan 2023 00:38:38 -0800 (PST)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-4ff1fa82bbbso13703867b3.10;
        Thu, 26 Jan 2023 00:38:38 -0800 (PST)
X-Received: by 2002:a81:bd6:0:b0:48d:1334:6e38 with SMTP id
 205-20020a810bd6000000b0048d13346e38mr4112101ywl.316.1674722318451; Thu, 26
 Jan 2023 00:38:38 -0800 (PST)
MIME-Version: 1.0
References: <20230123012940.1250879-1-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdX92KMeON0xC9p17kiqWT7ksEBX_NyPiiQk0fLaucDZBA@mail.gmail.com>
 <TYBPR01MB5341B023178B4A10DE52B844D8CE9@TYBPR01MB5341.jpnprd01.prod.outlook.com>
 <CAMuHMdXXnu88Tn2ucuHZK=3G18v-nCfaTYpomchRXBu3bD7UuA@mail.gmail.com> <TYBPR01MB5341F8DC36EAD659209A2BDDD8CF9@TYBPR01MB5341.jpnprd01.prod.outlook.com>
In-Reply-To: <TYBPR01MB5341F8DC36EAD659209A2BDDD8CF9@TYBPR01MB5341.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 26 Jan 2023 09:38:27 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU6fWeQU=kPni5hfP5BC=MzpxSzNNf5ADe37qt1k6mnFw@mail.gmail.com>
Message-ID: <CAMuHMdU6fWeQU=kPni5hfP5BC=MzpxSzNNf5ADe37qt1k6mnFw@mail.gmail.com>
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
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

On Thu, Jan 26, 2023 at 1:55 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> > From: Geert Uytterhoeven, Sent: Wednesday, January 25, 2023 5:55 PM
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
> > > > >  The old R-Car S4-8 datasheet had described IPMMU IMSSTR register, but
> > > > >  the latest datasheet undocumented the register. So, update the propeties
> > > > >  description. Note that the second argument is not used on the driver.
> > > >
> > > > DT describes hardware, not software policy.
> > >
> > > I think so.
> > >
> > > > >  So no behavior change.
> > > >
> > > > So where do we get the module id numbers to use, if they are no longer
> > > > documented in the Hardware Manual?
> > >
> > > If so, we cannot get the module id numbers. So, should we use other
> > > information which is completely fixed instead? I have some ideas:
> > > 1) Just 0 (or other fixed value) if the IMSSTR register doesn't exist.
> > > 2) Sequential numbers from register base offset.
> > >    In R-Car S4: ipmmu_rt0 is the first node from register base offset,
> > >    and ipmmu_rt1 is the second one.
> > >    So, ipmmu_rt0 is 0, ipmmu_rt1 is 1, ipmmu_ds0 is 2 and ipmmu_hc is 3.
> > > 3) Using base address upper 16-bits.
> > >    In R-Car S4: ipmmu_rt0 is 0xee480000. So, the value is 0xee48.
> > >
> > > Perhaps, the option 1) is reasonable, I think. But, what do you think?
> >
> > I would not make up numbers, as that would cause confusion with SoCs
> > where the numbers do match the hardware.
>
> I see.
>
> > As the driver doesn't use the module id number (it already loops
> > over all domains, instead of checking IMSSTR, probably because of
> > historical (R-Car Gen2) reasons?), what about dropping it from the
> > property? I.e. add "minItems: 1", possibly only when compatible with
> > renesas,rcar-gen4-ipmmu-vmsa?
>
> It looks a good idea to me.
>
> > BTW, the related IMCTR register is still documented, and the driver
> > does enable the interrupt bit (IMCTR_INTEN), so I'm wondering how the
> > hardware (documentation) people intend this to be used...
> > Perhaps IMCTR_INTEN will be removed/undocumented, too?
> > Or perhaps the removal/undocumentation of IMSSTR was a mistake?
>
> I don't think that IMCTR_INTEN will be removed/undocumented too because
> the IMCTR register is related to IMSTR register, not IMSSTR register ;)
>                                  ~~~~~               ~~~~~~
> About undocumentation of IMSSTR, I found that accessing the register is
> possible to cause a potential issue on both R-Car Gen3/4. That's why
> the IMSSTR register is undocumented on R-Car Gen4. I'm not sure whether
> R-Car Gen3 will be undocumented too in the future though, but at least,
> we should not access the IMSSTR register on both R-Car Gen3/Gen4.
> # I'm not sure, but that's why the driver doesn't check IMSSTR to avoid
> # the potential issue??

IC

> So, to simplify the dt-bindings, just removing the second property without
> any condition is better, I think. But, what do you think?

So just add "minItems: 1", and leave out the second value of the
"renesas,ipmmu-main" property when adding support for new SoCs.
I don't think there is an immediate need to remove the existing second
value on already supported SoCs, as these values are not incorrect
hardware description.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
