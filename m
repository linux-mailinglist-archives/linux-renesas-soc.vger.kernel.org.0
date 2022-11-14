Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9BE676288F0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Nov 2022 20:12:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235639AbiKNTMd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Nov 2022 14:12:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236756AbiKNTMa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Nov 2022 14:12:30 -0500
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0404224BD5;
        Mon, 14 Nov 2022 11:12:30 -0800 (PST)
Received: by mail-qt1-f178.google.com with SMTP id w4so7427167qts.0;
        Mon, 14 Nov 2022 11:12:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WcVSdZ7Lfrcnct3cb4Pg838gS66XuFtHTqsiQTaWWZc=;
        b=YXARu3nVr6gDybBphGMsu31wvVBBshe4I34vSXmG2XcTJayiAZCKAsstkC51/cxn3F
         rTDxIlH368NNNlx+/4kpJqnGZA33s3rgHTdTH1I18Gqh8dBJFBus8Xi9QF/qyou6yn8g
         AYEIRh51+RNbniA5n5nRxVGFNLk55nYKIQdPjoo8LhO4QU5r0CudKU6ILptw3Lcd8Q3q
         7rC0oEK/Yv2xzphQCZw2qWu4W4DFWoKJTbAoriJyjKNXkkH02GH9cCn49j9JMiUr5/0s
         6i4LKj1QC9PFdJ/dnYoP3QO46aURiSrGXLyA/mqVWZbosMg52hskPzubi4FSeSU14ywA
         fmig==
X-Gm-Message-State: ANoB5pkpnZeG/UQzoK4ZpdxWD1QSw6g0e9Vjru+b+0QJ2kqai+ztsOEH
        MIu/awU+L3+IWqDScMCz8sZnz7feM/zd/g==
X-Google-Smtp-Source: AA0mqf6zTcEkrAzoaXAOzNbVtmmy2LH63taSBGaHLgf79e1IQPxB7GrVo4G5wKgJKzpf6oAqK/cXPw==
X-Received: by 2002:a05:622a:514e:b0:3a4:ea21:5c58 with SMTP id ew14-20020a05622a514e00b003a4ea215c58mr13464418qtb.145.1668453148842;
        Mon, 14 Nov 2022 11:12:28 -0800 (PST)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id p4-20020a05622a00c400b0039cb59f00fcsm6169452qtw.30.2022.11.14.11.12.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Nov 2022 11:12:27 -0800 (PST)
Received: by mail-yb1-f181.google.com with SMTP id e68so11803294ybh.2;
        Mon, 14 Nov 2022 11:12:27 -0800 (PST)
X-Received: by 2002:a25:258d:0:b0:6ca:3b11:8d76 with SMTP id
 l135-20020a25258d000000b006ca3b118d76mr13733133ybl.202.1668453146748; Mon, 14
 Nov 2022 11:12:26 -0800 (PST)
MIME-Version: 1.0
References: <20221110162126.103437-1-biju.das.jz@bp.renesas.com>
 <20221110162126.103437-2-biju.das.jz@bp.renesas.com> <ae35fd75-64d3-3ab9-8cc0-3cbcc9c34b78@linaro.org>
 <OS0PR01MB59229179DE3D3D00C4963F3186009@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <a7bbfdd1-1abd-2ee5-1d32-47d0bcb7e1f2@linaro.org> <OS0PR01MB5922863B8EC8DF54D8E881FE86009@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB5922C8A590502C8820B05A7186059@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <839d9740-e814-897e-d484-ded3d531a97a@linaro.org> <OS0PR01MB59226FC7CA88208AB5C0AED586059@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <a3e5d695-535e-8587-6ccc-4c65fbeba278@linaro.org> <OS0PR01MB5922FB7D32AEC159234037D886059@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB5922FB7D32AEC159234037D886059@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 14 Nov 2022 20:12:15 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU=h_0Ay4U+PkzNQLE6nHP0UQ19fCdN4WPeh6e1H5TBZw@mail.gmail.com>
Message-ID: <CAMuHMdU=h_0Ay4U+PkzNQLE6nHP0UQ19fCdN4WPeh6e1H5TBZw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: arm: renesas: Document Renesas RZ/V2M
 System Configuration
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Mon, Nov 14, 2022 at 6:05 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > On 14/11/2022 17:44, Biju Das wrote:
> > >>>>> If the hardware manual said this is called "foo-whatever-name" or
> > >>>>> "rz85736dfnx2", you would use it as well?
> > >>>>>
> > >>>>> Node names should be generic.
> > >>>
> > >>> I got the following feedback from LSI team.
> > >>>
> > >>> *The reason why we use "configuration" and not "controller" is the
> > >>> possibility that users might take it to mean "control" of system
> > >>> operation (product operation). This unit determines how the whole
> > >>> LSI
> > >> configure to operate LSI, so we use "configuration" for this IP name.
> > >>>
> > >>> As per this it is not a controller. It is a Configuration IP.
> > >>>
> > >>> What should be generic node name for system configuration IP?
> > >>
> > >> Then it's closer to chipid and should be in hwinfo?
> > >
> > > You mean, sys: hwinfo@a3f03000 instead of sys: system-
> > configuration@a3f03000 ??
> >
> > Rather be put in hwinfo directory. Typical name is "chipid", but I don't know
> > if your device is a chipid.
>
> This IP is for sure not a chipid. We can detect SoC version. That is one of the functions provided
> by this IP.
>
> > > Also the same IP block is present on rz/v2ma as well?
> > >
> > > Shall I use the same file renesas,rzv2m-sys.yaml for both r9a09g011-sys and
> > r9a09g055-sys?

Are they sufficiently similar? E.g. we have renesas,rst.yaml for
the various R-Car reset controllers, which have different register
layouts.

If the SoC version register is located at the same offset, it might be
worthwhile to add a family-specific compatible value, too, so the
soc_device driver doesn't have to contain a big list to match against.

> > >> Anyway, you wrote in bindings description: "performs system control",
> > >> so what can I say?
> > >
> > > SYS functional description is as follows.
> > >
> > > The SYS controls the overall configuration of the chip, such as
> >
> > Exactly, it controls, so it is a controller... Anyway, do not introduce your
> > own names, but use something generic. There is no single reference of
> > "system-configuration".
>
> The main functionality of the chip is Bank address configuration,
>
> Bank Address Switching
>
> The SYS has a bank switching register to extend the two higher-order bits of the addresses of the following IP modules
> which have only 32-bit (4-GB) address spaces. It makes 4 or more Gbytes of the address space accessible by switching
> the bank address.
>
> Target unit 1: DRP-AI, eMMC, SDI0/1, ETHER, PCIe, USB, GRP, VCD
> Target unit 2: DMAC
>
> The other control functionalities mentioned in the IP are simple one.
>
> As you said, It is unique IP. Probably in future some other SoC manufactures may come with similar IP for system configuration
> like Bank switching. With Bank switching we can switch from 32 bit ->34 bit addresses.

Sounds like a system-controller to me ;-)
So that looks like the most appropriate generic name.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
