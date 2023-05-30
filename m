Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF3A67156FF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 May 2023 09:38:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231240AbjE3Hih convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 May 2023 03:38:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230500AbjE3Hib (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 May 2023 03:38:31 -0400
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E6A8100
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 May 2023 00:38:22 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-568bb833462so9272307b3.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 May 2023 00:38:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685432301; x=1688024301;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=opmKHuYD+8yAmyiJnqgJMNtQDmzEUCfLzLGznqoKu04=;
        b=UTBlJmb3dfxXLzaxzXMbEn8B4IhrBjzFvWXhifSW/4nY2YMxoNplw8DJiqDOeft2RW
         iHxCiz2ZEBKjk8JJNDstwssYV4Dz662kZce1FYuBV9BkRHmu6Q6HM0K6VMlcd5YRcItP
         eXjn7HUjxNscts5rrjTzzksjNhdDKqKQd57RMqhZhqANR2lczLsrQYn5A3oyKwx2HsXy
         kiLP0QZKIpd3IH0R3RitfvzAktQ2DFm2UVJmReOf6FqNpbuiVVoSLICl/iq/NzG6eqvY
         J2jbFzD+r/yn33LpR1pPRzuZf3zUmxoQsTn6bwD7T98157VEq+u3EsKO/gn3RSeNuwQI
         8/HQ==
X-Gm-Message-State: AC+VfDye1x5MNehtTJORTEcQ7oiWbtJ07MyV2Xo+QTEVZFKdsrSVwxaG
        eDQWUP5hoO/TWp7AEfyxcGOVIc+EujJvrw==
X-Google-Smtp-Source: ACHHUZ7bZIVDLLhtnrOV/ehioR8czo1eVpq8c6OXtzO2TOGo/OiALVNjKhusjzdqdGykaQycVdnRpw==
X-Received: by 2002:a0d:d706:0:b0:565:b751:8f46 with SMTP id z6-20020a0dd706000000b00565b7518f46mr1465641ywd.2.1685432301119;
        Tue, 30 May 2023 00:38:21 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id w7-20020a81a207000000b0055aad7d3f34sm4177206ywg.142.2023.05.30.00.38.20
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 May 2023 00:38:21 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-565d354b59fso36700897b3.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 May 2023 00:38:20 -0700 (PDT)
X-Received: by 2002:a0d:cc13:0:b0:55a:5870:3d47 with SMTP id
 o19-20020a0dcc13000000b0055a58703d47mr1321911ywd.26.1685432300746; Tue, 30
 May 2023 00:38:20 -0700 (PDT)
MIME-Version: 1.0
References: <CAHCN7xKsejKgF5E+veu-G_1ygTF+gkV6uTJrU0AG3ohD2WiiuQ@mail.gmail.com>
 <CAMuHMdVKm6Cf16Rs54DMfD30NvRFcG9JCXTNT2yb-eLN_60eyw@mail.gmail.com>
 <CAHCN7xJ4LzsAXitcvouYf-Z6bDu3n6o5=L_KNwfBi5hoZG0pUg@mail.gmail.com>
 <CAMuHMdVQQ+M=iuo0uhRXRMUijjLskGRhbk0PD-jWdNaYT7dJ7w@mail.gmail.com> <CAHCN7xJiFzEm60PxWSG2_kr+2N-pFS8_JSMhs7Q5W+qnzCzvpw@mail.gmail.com>
In-Reply-To: <CAHCN7xJiFzEm60PxWSG2_kr+2N-pFS8_JSMhs7Q5W+qnzCzvpw@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 30 May 2023 09:38:08 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW2QyV_pkD3=xiHpDm3-xd2gFAneChqN+hntCLCvDEYsg@mail.gmail.com>
Message-ID: <CAMuHMdW2QyV_pkD3=xiHpDm3-xd2gFAneChqN+hntCLCvDEYsg@mail.gmail.com>
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
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Adam,

On Fri, May 26, 2023 at 9:59 PM Adam Ford <aford173@gmail.com> wrote:
> On Fri, May 26, 2023 at 2:13 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Fri, May 26, 2023 at 6:07 AM Adam Ford <aford173@gmail.com> wrote:
> > > On Mon, May 22, 2023 at 3:06 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > On Sat, May 20, 2023 at 5:13 AM Adam Ford <aford173@gmail.com> wrote:
> > > > > I am trying to see if the Open Source PowerVR driver [1]  for the 6250
> > > > > can be made to work on the RZ/G2M, and I am having difficulty getting
> > > > > the power domain to turn on.
> > > > >
> > > > > In the GPU node, I set:
> > > > > power-domains = <&sysc R8A774A1_PD_3DG_B>;
> > > >
> > > > LGTM...
> > > >
> > > > > Unfortunately,  when it boots, I get the following error message:
> > > > >
> > > > > [    8.313305] powervr fd000000.gpu: error -ENOENT: failed to add to
> > > > > PM domain 3dg-b
> > > >
> > > > That means genpd_add_device() failed (but why?)...
> > >
> > > With a pointer from Marek V, I appear to have the necessary clock and
> > > the power domain operational by borrowing from the down-stream RZ/G2
> > > kernel.  Even if I cannot get the PVR driver working with this kernel,
> > > would you accept the clock and power domain patch now, or do you want
> > > me to wait until we have a user of these (aka PVR) working?
> >
> > I don't think it makes much sense to add the clock and power domain
> > patches upstream now, as they impact system behavior, while we don't
> > know if they are sufficient to make the PVR work.
> > The clock patches are probably (more or less) OK, and they do not have
> > much impact when the PVR is not enabled or not used.
> > For the power domain patches, it's different: some of them are quite
> > intrusive, and we still don't know the full rationale behind them.
> > Out of curiosity, which power domain patch(es) did you have to apply?
>
> I didn't really have to change the power domains per se, but I had to
> add the clocks that the GPU power domains needed and I refereneced the
> power-domain from the GPU node.

OK.

> Do you want me to send the patch as an RFC?

I guess you mean patch series[1], submitted by Marek?
That one is marked "Chances Requested" in patchwork[2].  Moving it
forward means fixing the issues pointed out.

Thanks!

[1] https://lore.kernel.org/all/20220314220012.218731-1-marek.vasut@gmail.com/
[2] https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=623329&state=*

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
