Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E71C711EA1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 May 2023 06:07:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232792AbjEZEHb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 26 May 2023 00:07:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231691AbjEZEH3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 May 2023 00:07:29 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F089187
        for <linux-renesas-soc@vger.kernel.org>; Thu, 25 May 2023 21:07:28 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1ae4be0b1f3so2105065ad.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 25 May 2023 21:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685074048; x=1687666048;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XtT54NzABpl3dWP4rZxWFiwVLZpQQc3PL7NcKwTY/30=;
        b=FxXQonj5/wTuvNOundZEhhOveR4JZB2GvudURCDzoIBynjccsZN5Tr/+jJ77dnLoJu
         8GIS25Gnwo+MnSV0Ho44rtAqAC9St5LdcV+0DEqiYvT24p6hD0PTix10aQQhf4f/19x2
         +TklRCrImV5jKFrBMuU10sAKh/ocwFrNYdF5OB5Ne6ao8BFsnkQNvjovnTFolWBCXAOv
         tR9ojuRCSttf8Ft86W+mGRcZ5Eie7lGbEW2MlkgmlTGrV5NhfSJCCii81JiSwcFF38C0
         ZE/kAr8FBIU0pkyOeYrFOXGFZNOC+oZOWMHN+lF7AE8Ij+iLV9S5/24M0a90FxuLtW0g
         y7kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685074048; x=1687666048;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XtT54NzABpl3dWP4rZxWFiwVLZpQQc3PL7NcKwTY/30=;
        b=O2vGiYkQbFniLMy7bhQFnZEKqROGXEl7ZgVPJrGrdJWANOXESRP5LE4SotdeWelZLm
         D+s6mK/MYSGoObMca5SG8z+xhvGrCPTqstRucCa3eIieGoLTIKhGb1DERRv2m+pbH20U
         AKpDe7Iaqpfs8tNarsVQ39cved16g95neGMsIM7KUnY7wLY4V59aI5b5y+aQpkEqQRby
         DBrOLM52GZ4QoJpTAs4x4OPWGY4PajdVaOttJp9+wlt1oNZCCqHgU8g/MKVpVhdCJlyS
         wlw5+8bimc/Fn+Qe8QBUJpaY8/T2RTwCFhE9TJ22zFgD2FdUORkd/P/aa9noxg3PcZ7e
         9joQ==
X-Gm-Message-State: AC+VfDzgGBoLwH9hfJyyJGCmeNd0JB/UA5KloTPQdGWQ9/cNUJ593IG0
        0xq+dZ8Tk9QeTgfztoGA3ozhysyJAj3FyF3YQkY=
X-Google-Smtp-Source: ACHHUZ6n5S6R1ao+qVGDISlNnvvMFck9ChOLJzDD/XLPYvLQSUn8BwypZ9z4Byc2qP/RPQKQg4GTG3zNwwkGW0idX+s=
X-Received: by 2002:a17:902:7408:b0:1ac:b2c4:46cc with SMTP id
 g8-20020a170902740800b001acb2c446ccmr991162pll.20.1685074047624; Thu, 25 May
 2023 21:07:27 -0700 (PDT)
MIME-Version: 1.0
References: <CAHCN7xKsejKgF5E+veu-G_1ygTF+gkV6uTJrU0AG3ohD2WiiuQ@mail.gmail.com>
 <CAMuHMdVKm6Cf16Rs54DMfD30NvRFcG9JCXTNT2yb-eLN_60eyw@mail.gmail.com>
In-Reply-To: <CAMuHMdVKm6Cf16Rs54DMfD30NvRFcG9JCXTNT2yb-eLN_60eyw@mail.gmail.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Thu, 25 May 2023 23:07:16 -0500
Message-ID: <CAHCN7xJ4LzsAXitcvouYf-Z6bDu3n6o5=L_KNwfBi5hoZG0pUg@mail.gmail.com>
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

On Mon, May 22, 2023 at 3:06=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Adam,
>
> On Sat, May 20, 2023 at 5:13=E2=80=AFAM Adam Ford <aford173@gmail.com> wr=
ote:
> > I am trying to see if the Open Source PowerVR driver [1]  for the 6250
> > can be made to work on the RZ/G2M, and I am having difficulty getting
> > the power domain to turn on.
> >
> > In the GPU node, I set:
> > power-domains =3D <&sysc R8A774A1_PD_3DG_B>;
>
> LGTM...
>
> > Unfortunately,  when it boots, I get the following error message:
> >
> > [    8.313305] powervr fd000000.gpu: error -ENOENT: failed to add to
> > PM domain 3dg-b
>
> That means genpd_add_device() failed (but why?)...

With a pointer from Marek V, I appear to have the necessary clock and
the power domain operational by borrowing from the down-stream RZ/G2
kernel.  Even if I cannot get the PVR driver working with this kernel,
would you accept the clock and power domain patch now, or do you want
me to wait until we have a user of these (aka PVR) working?

adam
>
> > [    8.320822] powervr: probe of fd000000.gpu failed with error -2
> >
> > Is there something I need to do in order to use this?  it appears the
> > 3DG_B starts 3DG_A if I understand this correctly.
> >
> > Unfortunately, I don't see the parent child relationship between the
> > 3DG_B and the GPU
> >
> > root@beacon-rzg2m:~# cat /sys/kernel/debug/pm_genpd/pm_genpd_summary
> > domain                          status          children
> >             performance
> >     /device                                             runtime status
> > -----------------------------------------------------------------------=
-----------------------
> > clock-controller                on
> >             0
> > 3dg-b                           off-0
> >             0
> > 3dg-a                           off-0
> >             0
> >                                                 3dg-b
>
> ... hence the relationship does not show up.
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
