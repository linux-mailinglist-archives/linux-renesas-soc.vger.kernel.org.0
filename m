Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9764A712DF8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 May 2023 21:59:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229502AbjEZT7R (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 26 May 2023 15:59:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237083AbjEZT7Q (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 May 2023 15:59:16 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDE9819D
        for <linux-renesas-soc@vger.kernel.org>; Fri, 26 May 2023 12:59:14 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-25332b3915bso951833a91.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 26 May 2023 12:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685131154; x=1687723154;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8jod9ubhN/oluv5/f0RkzUi/+S4Oj2Npy8/g51/MYJ4=;
        b=Qu1LBAwWfHFIQK/oTNd3vtdHmwouhUCo4kpiQj0dliV+BOJR1i6YLxBIx3gHs7HbCY
         ShoBVSsaMOsz33N4aktobbZtB4hnhkiJ9WUVOXl6hXvzKpurI/g57q1Jkv++91ShrsSq
         q83em/fLvdOoT/2oFTgvL2kIBKzD0CqhGpJp7epq/x54ywPPp8iB7IJVInBKZp8Ly8HE
         Hq5TdP0GwJQz5/OUCMIWJeCYdIu0E2b1HhpHV95LthP+UAfajmfR58kSlounpv7eFZ6p
         g1BPlnZ3FC1JDoJXHcQqxCReR8rLmeVNgfBOGqx5NgXfgy57cS0RyNC6UMhMcVfMNGFZ
         f/Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685131154; x=1687723154;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8jod9ubhN/oluv5/f0RkzUi/+S4Oj2Npy8/g51/MYJ4=;
        b=AWxf1dI4DT12MZ0Ko+HPJgYEqZMPNw3nRFp0x6dOybTE+6WBCvXdIpoell9UM9ANsZ
         HEeSGHvVDahfIavOOQJubDczdKPlxEUswdpl5cxm88IqyfMEKT1LLj2zLQ2iDzmzpn92
         A9k/Tf1K3opcZUeCbp6HvV05HlOJ4e39ND8C0gtW3hGNeeSiLQPu5y/CHUWiese4orCg
         pdNb6uPWLuDPn3MUgUlj1L2eDVZd60bn9uxUHkXZI2GmNmNO0liUrTQKqLK4ueb3QiX6
         VsSZV2hKzS2h0OSjhEkI4au8qMOomkoNVZXbHHFTPT33z5KDi0O1EGgMSvpV6o55s5ry
         0ZNA==
X-Gm-Message-State: AC+VfDw8dNgq6/GOO21QR3h7wg0hyb6L5b+bz4xFtsZ/ZA22mvmZ9sfu
        34dfxDwSCb7dmqE6xnRqgnD21AqFiwogHfhZATk=
X-Google-Smtp-Source: ACHHUZ4HfBmTDB6nXkA8r87ZNsXMxnNkNoU97KSdIaNXxENEj3Ea605R9TT+RMrfurcgZsgCypcBljBQtSkEpPUakdc=
X-Received: by 2002:a17:902:da91:b0:1af:db10:333b with SMTP id
 j17-20020a170902da9100b001afdb10333bmr4921123plx.59.1685131154133; Fri, 26
 May 2023 12:59:14 -0700 (PDT)
MIME-Version: 1.0
References: <CAHCN7xKsejKgF5E+veu-G_1ygTF+gkV6uTJrU0AG3ohD2WiiuQ@mail.gmail.com>
 <CAMuHMdVKm6Cf16Rs54DMfD30NvRFcG9JCXTNT2yb-eLN_60eyw@mail.gmail.com>
 <CAHCN7xJ4LzsAXitcvouYf-Z6bDu3n6o5=L_KNwfBi5hoZG0pUg@mail.gmail.com> <CAMuHMdVQQ+M=iuo0uhRXRMUijjLskGRhbk0PD-jWdNaYT7dJ7w@mail.gmail.com>
In-Reply-To: <CAMuHMdVQQ+M=iuo0uhRXRMUijjLskGRhbk0PD-jWdNaYT7dJ7w@mail.gmail.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Fri, 26 May 2023 14:59:03 -0500
Message-ID: <CAHCN7xJiFzEm60PxWSG2_kr+2N-pFS8_JSMhs7Q5W+qnzCzvpw@mail.gmail.com>
Subject: Re: RZ/G2M Power Domain Errors with GPU
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        cstevens@beaconembedded.com,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Ulrich Hecht <uli@fpond.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, May 26, 2023 at 2:13=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Adam,
>
> On Fri, May 26, 2023 at 6:07=E2=80=AFAM Adam Ford <aford173@gmail.com> wr=
ote:
> > On Mon, May 22, 2023 at 3:06=E2=80=AFAM Geert Uytterhoeven <geert@linux=
-m68k.org> wrote:
> > > On Sat, May 20, 2023 at 5:13=E2=80=AFAM Adam Ford <aford173@gmail.com=
> wrote:
> > > > I am trying to see if the Open Source PowerVR driver [1]  for the 6=
250
> > > > can be made to work on the RZ/G2M, and I am having difficulty getti=
ng
> > > > the power domain to turn on.
> > > >
> > > > In the GPU node, I set:
> > > > power-domains =3D <&sysc R8A774A1_PD_3DG_B>;
> > >
> > > LGTM...
> > >
> > > > Unfortunately,  when it boots, I get the following error message:
> > > >
> > > > [    8.313305] powervr fd000000.gpu: error -ENOENT: failed to add t=
o
> > > > PM domain 3dg-b
> > >
> > > That means genpd_add_device() failed (but why?)...
> >
> > With a pointer from Marek V, I appear to have the necessary clock and
> > the power domain operational by borrowing from the down-stream RZ/G2
> > kernel.  Even if I cannot get the PVR driver working with this kernel,
> > would you accept the clock and power domain patch now, or do you want
> > me to wait until we have a user of these (aka PVR) working?
>
> I don't think it makes much sense to add the clock and power domain
> patches upstream now, as they impact system behavior, while we don't
> know if they are sufficient to make the PVR work.
> The clock patches are probably (more or less) OK, and they do not have
> much impact when the PVR is not enabled or not used.
> For the power domain patches, it's different: some of them are quite
> intrusive, and we still don't know the full rationale behind them.
> Out of curiosity, which power domain patch(es) did you have to apply?

I didn't really have to change the power domains per se, but I had to
add the clocks that the GPU power domains needed and I refereneced the
power-domain from the GPU node.

Do you want me to send the patch as an RFC?

adam
>
> Thanks!
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds
