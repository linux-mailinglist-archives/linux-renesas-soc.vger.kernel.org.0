Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A1BAA715CD7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 May 2023 13:16:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230034AbjE3LQw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 May 2023 07:16:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229825AbjE3LQv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 May 2023 07:16:51 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEE37A0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 May 2023 04:16:49 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-64d2b42a8f9so3354930b3a.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 May 2023 04:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685445409; x=1688037409;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5RqkMLB5GbN4wsd0u88geZgUt7w9wYWIrq5UAKfJ774=;
        b=UBAr0l9KWIwXAaYdwYwhwiv5eHjnujqfUWczZzkq9rmu2EPUwNZMkO6AXKcTFEc3Im
         TAjksA6WW7gIMqt4hmtiqXWG8FP1PwmxcM4dLqVlaqAh4ODsA+TCDGnMBL8hIDDXfPn3
         okSQZOz2yZ8VaQP1cnnlQRXZx3txuPjMDd9W4JkknIRNUQ1NEoKUJxIGulFw5LGml/pR
         kppLJoH4skV/g6Xpj+DWde82jTyhdMEM+VdppM+rf6zK0l41+6CEjGsegor6LWwl4ltH
         lBowMTvTCDwopCauTy7VKaoHCkgbxX7ZlosU+QDaOAkOeIbVFJ0OlA0NoL7akHdGoI6M
         OuqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685445409; x=1688037409;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5RqkMLB5GbN4wsd0u88geZgUt7w9wYWIrq5UAKfJ774=;
        b=ay6WKEPSigFlTl+ED31dccarnkhnr6EiYLOdoYANP3/wqZcMyZf6aae3hxTMr1oQYi
         yaxE8o7FaR9smxadajs4TFURlWVjvygdmZM2TIZQSv4pptOvJfsnsidqdIRyckM3WeXp
         tvo4iHx8csLIoHYehZsPY6b1VW/MrpVzxE1e9gp6563Sw7/WO83AMgPxrIRNpA42Ah2g
         I7zHpzdvgRirnzQIK1Pl7O2AbPh6miPGtfALRBcmEswrQOLqPFNez40NM8nlfT+Qdr+x
         gl6vSrsRJX1nP47xE4LTv8BCOMNAPz7n/fV4r3f40K4j4Mmi6pNdTADmOWnQux6cYUvF
         fyjg==
X-Gm-Message-State: AC+VfDzy63xVUmRtoeTxT+C2VhHfye8SRFqDTpFpEuWClsPmOs95cbgp
        mFKVPgPJfKK0zftglnQAIIhqQDURflW6jG2y7th3Ap3b
X-Google-Smtp-Source: ACHHUZ7AWjuSEU97d1iQYmuklH9E5GRubZB6SwQNIlEtyY0wxeqXQnmtR9lH1YK0YBqsn2jAqkJH8MMaRPzAGL14AzU=
X-Received: by 2002:a17:903:41c3:b0:1ae:6cf0:94eb with SMTP id
 u3-20020a17090341c300b001ae6cf094ebmr2043729ple.5.1685445408960; Tue, 30 May
 2023 04:16:48 -0700 (PDT)
MIME-Version: 1.0
References: <CAHCN7xKsejKgF5E+veu-G_1ygTF+gkV6uTJrU0AG3ohD2WiiuQ@mail.gmail.com>
 <CAMuHMdVKm6Cf16Rs54DMfD30NvRFcG9JCXTNT2yb-eLN_60eyw@mail.gmail.com>
 <CAHCN7xJ4LzsAXitcvouYf-Z6bDu3n6o5=L_KNwfBi5hoZG0pUg@mail.gmail.com>
 <CAMuHMdVQQ+M=iuo0uhRXRMUijjLskGRhbk0PD-jWdNaYT7dJ7w@mail.gmail.com>
 <CAHCN7xJiFzEm60PxWSG2_kr+2N-pFS8_JSMhs7Q5W+qnzCzvpw@mail.gmail.com> <CAMuHMdW2QyV_pkD3=xiHpDm3-xd2gFAneChqN+hntCLCvDEYsg@mail.gmail.com>
In-Reply-To: <CAMuHMdW2QyV_pkD3=xiHpDm3-xd2gFAneChqN+hntCLCvDEYsg@mail.gmail.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Tue, 30 May 2023 06:16:36 -0500
Message-ID: <CAHCN7x+kGYeUYD4CrzPz15Xa1=BTpjnGvVs58Yv1cKZjOxdLhg@mail.gmail.com>
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

On Tue, May 30, 2023 at 2:38=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Adam,
>
> On Fri, May 26, 2023 at 9:59=E2=80=AFPM Adam Ford <aford173@gmail.com> wr=
ote:
> > On Fri, May 26, 2023 at 2:13=E2=80=AFAM Geert Uytterhoeven <geert@linux=
-m68k.org> wrote:
> > > On Fri, May 26, 2023 at 6:07=E2=80=AFAM Adam Ford <aford173@gmail.com=
> wrote:
> > > > On Mon, May 22, 2023 at 3:06=E2=80=AFAM Geert Uytterhoeven <geert@l=
inux-m68k.org> wrote:
> > > > > On Sat, May 20, 2023 at 5:13=E2=80=AFAM Adam Ford <aford173@gmail=
.com> wrote:
> > > > > > I am trying to see if the Open Source PowerVR driver [1]  for t=
he 6250
> > > > > > can be made to work on the RZ/G2M, and I am having difficulty g=
etting
> > > > > > the power domain to turn on.
> > > > > >
> > > > > > In the GPU node, I set:
> > > > > > power-domains =3D <&sysc R8A774A1_PD_3DG_B>;
> > > > >
> > > > > LGTM...
> > > > >
> > > > > > Unfortunately,  when it boots, I get the following error messag=
e:
> > > > > >
> > > > > > [    8.313305] powervr fd000000.gpu: error -ENOENT: failed to a=
dd to
> > > > > > PM domain 3dg-b
> > > > >
> > > > > That means genpd_add_device() failed (but why?)...
> > > >
> > > > With a pointer from Marek V, I appear to have the necessary clock a=
nd
> > > > the power domain operational by borrowing from the down-stream RZ/G=
2
> > > > kernel.  Even if I cannot get the PVR driver working with this kern=
el,
> > > > would you accept the clock and power domain patch now, or do you wa=
nt
> > > > me to wait until we have a user of these (aka PVR) working?
> > >
> > > I don't think it makes much sense to add the clock and power domain
> > > patches upstream now, as they impact system behavior, while we don't
> > > know if they are sufficient to make the PVR work.
> > > The clock patches are probably (more or less) OK, and they do not hav=
e
> > > much impact when the PVR is not enabled or not used.
> > > For the power domain patches, it's different: some of them are quite
> > > intrusive, and we still don't know the full rationale behind them.
> > > Out of curiosity, which power domain patch(es) did you have to apply?
> >
> > I didn't really have to change the power domains per se, but I had to
> > add the clocks that the GPU power domains needed and I refereneced the
> > power-domain from the GPU node.
>
> OK.
>
> > Do you want me to send the patch as an RFC?
>
> I guess you mean patch series[1], submitted by Marek?
> That one is marked "Chances Requested" in patchwork[2].  Moving it
> forward means fixing the issues pointed out.

I edited different files based on the downstream kernel from Renesas.
It also modifies different files, but in a similar way.  I was doing
this on an r8a774a1 (RZ/G2M).  I tried to address the concerns you
sent to Marek.

I'll post the RFC momentarily.  It's a 3-part update to add a generic
Rcar-gen3 clock, add the 3dge clock, then the add GPU node.

adam
>
> Thanks!
>
> [1] https://lore.kernel.org/all/20220314220012.218731-1-marek.vasut@gmail=
.com/
> [2] https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=
=3D623329&state=3D*
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
