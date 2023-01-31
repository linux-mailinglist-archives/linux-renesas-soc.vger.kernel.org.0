Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 956F3682640
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Jan 2023 09:20:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229608AbjAaIUy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 31 Jan 2023 03:20:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229546AbjAaIUy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 31 Jan 2023 03:20:54 -0500
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38577EB64;
        Tue, 31 Jan 2023 00:20:53 -0800 (PST)
Received: by mail-qt1-f173.google.com with SMTP id w3so3991876qts.7;
        Tue, 31 Jan 2023 00:20:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bRHAGhQgk4pQ7LOPV0/iV6SDvyC1guNRZ8CaTTxtQfo=;
        b=yKm4cwI6RagSX2G8FskFC85erRlOSgxJT/9KtSW0zlg1JeoLQdLc+x7FaXVwCSV+9l
         U6lyLSJ7AXNVSNfNxjY7jGSLckD/81Vk9MdipPLRy8/HQnVjaFr8LQLTk3G1aPHCwgBd
         FNs97J1w83kPaeNnwZOJbDuMXse4QX5S24hAt9yPZ6VDejyoU6DjFdqWp2mL9pXOwouK
         yb08z3Sk5h5/oloOb+uC80XMt0e+H+SqCsIA+xcBqccpnZIFOCvtU3nacpjqMPz6lBJ9
         YoyYcG4kNgMuTLngQmr6LCGLPn0fChn499NyMMLsfrmojiU+h2Ue133OrYv2aRuZp438
         UyEQ==
X-Gm-Message-State: AFqh2kofYSo2PRt7E0hGk89TiWuVylAs7I9pB0xlXxO098pjgRLOaIDk
        UuISTGxUI3qlZSuhYDe4yr1/0XVUubdT0A==
X-Google-Smtp-Source: AMrXdXvR67LWGQc46il0tU2XwQ8ik40Z/9Kp+fxn6iYbTQdkrCSolidYqMkE/+3tQEh7U6ndbS1qnQ==
X-Received: by 2002:ac8:58c3:0:b0:3b6:2c85:6fe8 with SMTP id u3-20020ac858c3000000b003b62c856fe8mr89706236qta.53.1675153251937;
        Tue, 31 Jan 2023 00:20:51 -0800 (PST)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com. [209.85.219.180])
        by smtp.gmail.com with ESMTPSA id pj4-20020a05620a1d8400b0070648cf78bdsm9583854qkn.54.2023.01.31.00.20.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Jan 2023 00:20:51 -0800 (PST)
Received: by mail-yb1-f180.google.com with SMTP id 129so17193325ybb.0;
        Tue, 31 Jan 2023 00:20:51 -0800 (PST)
X-Received: by 2002:a25:4483:0:b0:839:c329:be37 with SMTP id
 r125-20020a254483000000b00839c329be37mr73386yba.89.1675153250731; Tue, 31 Jan
 2023 00:20:50 -0800 (PST)
MIME-Version: 1.0
References: <20230123012940.1250879-1-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdX92KMeON0xC9p17kiqWT7ksEBX_NyPiiQk0fLaucDZBA@mail.gmail.com>
 <TYBPR01MB5341B023178B4A10DE52B844D8CE9@TYBPR01MB5341.jpnprd01.prod.outlook.com>
 <CAMuHMdXXnu88Tn2ucuHZK=3G18v-nCfaTYpomchRXBu3bD7UuA@mail.gmail.com>
 <3c3e1dc2-1f66-565c-c677-2eae368e10be@arm.com> <20230130193604.GA3218335-robh@kernel.org>
In-Reply-To: <20230130193604.GA3218335-robh@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 31 Jan 2023 09:20:38 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU4j3drFt6jAZPHTJMrrL7GTWHxNqMGHR-1pScqg4H2xg@mail.gmail.com>
Message-ID: <CAMuHMdU4j3drFt6jAZPHTJMrrL7GTWHxNqMGHR-1pScqg4H2xg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: iommu: renesas,ipmmu-vmsa: Update
 descriptions for R-Car Gen4
To:     Rob Herring <robh@kernel.org>
Cc:     Robin Murphy <robin.murphy@arm.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        "joro@8bytes.org" <joro@8bytes.org>,
        "will@kernel.org" <will@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "iommu@lists.linux.dev" <iommu@lists.linux.dev>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
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

Hi Rob,

On Mon, Jan 30, 2023 at 8:36 PM Rob Herring <robh@kernel.org> wrote:
> On Wed, Jan 25, 2023 at 10:42:13AM +0000, Robin Murphy wrote:
> > On 2023-01-25 08:54, Geert Uytterhoeven wrote:
> > > On Wed, Jan 25, 2023 at 1:49 AM Yoshihiro Shimoda
> > > <yoshihiro.shimoda.uh@renesas.com> wrote:
> > > > > From: Geert Uytterhoeven, Sent: Tuesday, January 24, 2023 11:35 PM
> > > > > On Mon, Jan 23, 2023 at 2:35 AM Yoshihiro Shimoda
> > > > > <yoshihiro.shimoda.uh@renesas.com> wrote:
> > > > > > Since R-Car Gen4 doens't have the main IPMMU IMSSTR register, but
> > > > > > each cache IPMMU has own module id. So, update descriptions of
> > > > > > renesas,ipmmu-main property for R-Car Gen4.
> > > > > >
> > > > > > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > >
> > > > > > ---
> > > > > >   The old R-Car S4-8 datasheet had described IPMMU IMSSTR register, but
> > > > > >   the latest datasheet undocumented the register. So, update the propeties
> > > > > >   description. Note that the second argument is not used on the driver.
> > > > >
> > > > > DT describes hardware, not software policy.
> > > >
> > > > I think so.
> > > >
> > > > > >   So no behavior change.
> > > > >
> > > > > So where do we get the module id numbers to use, if they are no longer
> > > > > documented in the Hardware Manual?
> > > >
> > > > If so, we cannot get the module id numbers. So, should we use other
> > > > information which is completely fixed instead? I have some ideas:
> > > > 1) Just 0 (or other fixed value) if the IMSSTR register doesn't exist.
> > > > 2) Sequential numbers from register base offset.
> > > >     In R-Car S4: ipmmu_rt0 is the first node from register base offset,
> > > >     and ipmmu_rt1 is the second one.
> > > >     So, ipmmu_rt0 is 0, ipmmu_rt1 is 1, ipmmu_ds0 is 2 and ipmmu_hc is 3.
> > > > 3) Using base address upper 16-bits.
> > > >     In R-Car S4: ipmmu_rt0 is 0xee480000. So, the value is 0xee48.
> > > >
> > > > Perhaps, the option 1) is reasonable, I think. But, what do you think?
> > >
> > > I would not make up numbers, as that would cause confusion with SoCs
> > > where the numbers do match the hardware.
> > > As the driver doesn't use the module id number (it already loops
> > > over all domains, instead of checking IMSSTR, probably because of
> > > historical (R-Car Gen2) reasons?), what about dropping it from the
> > > property? I.e. add "minItems: 1", possibly only when compatible with
> > > renesas,rcar-gen4-ipmmu-vmsa?
> >
> > Right, if there really is no meaningful ID for this model then its binding
> > should not require one.
>
> I agree, however that makes parsing the property a pain (for both the
> schema and driver). This property is a matrix. The number of entries is
> already variable. If both dimensions are variable, we have to then look
> at the compatible to know how to parse it. I would go with option 1.

But it does not have to be two-dimensional.
The second dimension was added in commit 39bd2b6a3783b899 ("dt-bindings
 Improve phandle-array schemas"), but is not needed.
Can this be simplified again?

The driver doesn't care, it just checks for the presence of the
property, i.e. treats it as a boolean flag.

> A 4th option is a new property.

If all else fails, a new boolean flag would work...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
