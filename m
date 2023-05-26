Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DEE547120B5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 May 2023 09:13:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241569AbjEZHNt convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 26 May 2023 03:13:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236912AbjEZHNs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 May 2023 03:13:48 -0400
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B85609E
        for <linux-renesas-soc@vger.kernel.org>; Fri, 26 May 2023 00:13:46 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-565014fc2faso7845947b3.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 26 May 2023 00:13:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685085226; x=1687677226;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eYIc1QxkWc2ItXIHXi86eYEFsaUNyPFcKAJXFo1srck=;
        b=lWnFk+oDxnpvjDNeWTCC40yCxd3/g+GGh//gBKUP9a+IACOFgUvjKrcpsPVRiGkJya
         6m+roI5d++7v6NOlJosvuR1vdUz1LrV1Hmh0GnNAdOmnolEAnlqpD9QnlwsVo18iyypm
         PpwfzCJEpnNB9wKSaEKxtCLxFoHWvUC91qR/iAUG/p9VnSf5y9+owLseV5yxtJyBeCjp
         d4qSY04PU8NgD5TjaSyg56cF3cX3eMuNQk5EcKGB6UfYSCLKwr/Wq+m5ztIbq1Z+9FIs
         6ITDrW/D0y6f1gFEarqZAQeYYbrLQogTVgPeGCUJssMivUiW/pJ7TfBxzx8FBej7t4Cw
         vSDw==
X-Gm-Message-State: AC+VfDxmMFJ+CvCZGFNNByISgir1sb+WNno+gSrJ+/TwpniPTnpcB1bS
        X5jNZenFRvlEMYe+LEfQtCj5jr6xrtSJLQ==
X-Google-Smtp-Source: ACHHUZ6QKuvKsAztm7pq+NL2e55t9oLXlESQEaCrb//DTiYNANdOBzWCDEKZ+yycpnrohFRahm3Flg==
X-Received: by 2002:a81:4a87:0:b0:559:d1ea:8c7a with SMTP id x129-20020a814a87000000b00559d1ea8c7amr1171526ywa.1.1685085225826;
        Fri, 26 May 2023 00:13:45 -0700 (PDT)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id e187-20020a0df5c4000000b00559fb950d9fsm988844ywf.45.2023.05.26.00.13.43
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 May 2023 00:13:44 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-565ba53f434so1439117b3.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 26 May 2023 00:13:43 -0700 (PDT)
X-Received: by 2002:a0d:ea89:0:b0:55d:c674:c7e2 with SMTP id
 t131-20020a0dea89000000b0055dc674c7e2mr1251342ywe.41.1685085223613; Fri, 26
 May 2023 00:13:43 -0700 (PDT)
MIME-Version: 1.0
References: <CAHCN7xKsejKgF5E+veu-G_1ygTF+gkV6uTJrU0AG3ohD2WiiuQ@mail.gmail.com>
 <CAMuHMdVKm6Cf16Rs54DMfD30NvRFcG9JCXTNT2yb-eLN_60eyw@mail.gmail.com> <CAHCN7xJ4LzsAXitcvouYf-Z6bDu3n6o5=L_KNwfBi5hoZG0pUg@mail.gmail.com>
In-Reply-To: <CAHCN7xJ4LzsAXitcvouYf-Z6bDu3n6o5=L_KNwfBi5hoZG0pUg@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 26 May 2023 09:13:31 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVQQ+M=iuo0uhRXRMUijjLskGRhbk0PD-jWdNaYT7dJ7w@mail.gmail.com>
Message-ID: <CAMuHMdVQQ+M=iuo0uhRXRMUijjLskGRhbk0PD-jWdNaYT7dJ7w@mail.gmail.com>
Subject: Re: RZ/G2M Power Domain Errors with GPU
To:     Adam Ford <aford173@gmail.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        cstevens@beaconembedded.com,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Ulrich Hecht <uli@fpond.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Adam,

On Fri, May 26, 2023 at 6:07 AM Adam Ford <aford173@gmail.com> wrote:
> On Mon, May 22, 2023 at 3:06 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Sat, May 20, 2023 at 5:13 AM Adam Ford <aford173@gmail.com> wrote:
> > > I am trying to see if the Open Source PowerVR driver [1]  for the 6250
> > > can be made to work on the RZ/G2M, and I am having difficulty getting
> > > the power domain to turn on.
> > >
> > > In the GPU node, I set:
> > > power-domains = <&sysc R8A774A1_PD_3DG_B>;
> >
> > LGTM...
> >
> > > Unfortunately,  when it boots, I get the following error message:
> > >
> > > [    8.313305] powervr fd000000.gpu: error -ENOENT: failed to add to
> > > PM domain 3dg-b
> >
> > That means genpd_add_device() failed (but why?)...
>
> With a pointer from Marek V, I appear to have the necessary clock and
> the power domain operational by borrowing from the down-stream RZ/G2
> kernel.  Even if I cannot get the PVR driver working with this kernel,
> would you accept the clock and power domain patch now, or do you want
> me to wait until we have a user of these (aka PVR) working?

I don't think it makes much sense to add the clock and power domain
patches upstream now, as they impact system behavior, while we don't
know if they are sufficient to make the PVR work.
The clock patches are probably (more or less) OK, and they do not have
much impact when the PVR is not enabled or not used.
For the power domain patches, it's different: some of them are quite
intrusive, and we still don't know the full rationale behind them.
Out of curiosity, which power domain patch(es) did you have to apply?

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
