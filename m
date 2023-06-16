Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F0F2733407
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Jun 2023 16:58:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345754AbjFPO6A (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 16 Jun 2023 10:58:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231265AbjFPO57 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Jun 2023 10:57:59 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C085330C7;
        Fri, 16 Jun 2023 07:57:58 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-666e916b880so163492b3a.2;
        Fri, 16 Jun 2023 07:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686927478; x=1689519478;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fTZ7esj0quOcI/RkGvFMgSJ1PhuA/Z0zduLKH5w94HI=;
        b=c+Wbra0FFZPz4iDzr3CVPszMrGJUmkmJ5Zq4H+FY9wk8Fzrxm4J5LP2haSr7WWQIU+
         jMIMVpfjC+UliNsRCSCztuI5mNZ+nO7wGhT9av+kVo81xhuHDPmrJ2TUVTaZGaM9/ZZQ
         +9wEqHcGEd88LsZZaJR8JDQr3C8N31ntwV9gNQvKq0bo2nv6n/b6I1wcLahBfZK+oXnM
         o+FFY3LRpHWj1n0Bi2XOMODFcLMilsP5Rr8CFBNo5n3mbaElURP6O4UjsLKreXJdZGLn
         Mqf2ReHVTG0l8+XyIsZH2O7/Tw8BQBilYEcSyNOyLrNufpzrPyPD9P8TaInCRwXKxZgA
         WGUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686927478; x=1689519478;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fTZ7esj0quOcI/RkGvFMgSJ1PhuA/Z0zduLKH5w94HI=;
        b=Mugh3Oa9lJt0fpQfy7hApFKKNtRQM4y05VE8HUgzFFxaJD5qSpFQ6Pd7KEtUMjSRE4
         raw8dIFtj44PzYc/V/2wIAzIl/j5AEPYoUR5/QAJEPa9JlYhUbnZsATqK2NVFFWbW+Ys
         8wCpcfKhM98i83Yw+EFz/Bc5ylgwzXFsoaBstr9oWk8QNJL+BwbLJrDdxjGeQSDiyBLm
         IVlXbihncXyx4U9GWlg7btjq4tK1ECGtQTbfcbHk5mfknilmu6522+6FeFN8RoOdPOC3
         VC2K1/h6qz2H1bd31iAHV0aoVvTswgedT6hLCWigtUEG7YzvqfhhCrZd2DqwCU6hBRto
         1taQ==
X-Gm-Message-State: AC+VfDzh3GwSJXR7ezyLjEmOkxsV2+07bPqWrd5Mggvm9tTyaySdddhL
        kXatLT+5tZJ0+86Qn2Y2ETjo3W1iGFciKxJ0cSA=
X-Google-Smtp-Source: ACHHUZ4WJMej/QDPeO2J0h3IBJ/Zxu3jN2pk40J0mcJWKMd73mmyAhw9KYDdtJf6vOqs/O/3fB4s18/aJngpJTDczII=
X-Received: by 2002:a17:902:ea01:b0:1ad:f407:37d1 with SMTP id
 s1-20020a170902ea0100b001adf40737d1mr1910027plg.52.1686927477979; Fri, 16 Jun
 2023 07:57:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230531070049.11806-1-wsa+renesas@sang-engineering.com>
 <CAHCN7xJxROk6RU66PjbGH4M-R7PbUG-4y_2BHyCeGx_hTeUprw@mail.gmail.com>
 <ZHeHx/rUE7ORf3V2@shikoro> <CAHCN7x+hVSC=uCtaQx0tLZ6UdkYvf8B0DGQJ52Xr8WjWU=jGpA@mail.gmail.com>
 <OS0PR01MB5922D0CDBE265AE59695B8428658A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB5922D0CDBE265AE59695B8428658A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Fri, 16 Jun 2023 09:57:46 -0500
Message-ID: <CAHCN7xJ=wtH5Een9_M3fynweH7Mkre0nHWH3gtmW=dps30zgMQ@mail.gmail.com>
Subject: Re: [RFC/RFT PATCH] mmc: renesas_sdhi: add delay between tuning cmds
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Jun 16, 2023 at 9:39=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
>
> Hi Adam,
>
> > -----Original Message-----
> > From: Adam Ford <aford173@gmail.com>
> > Sent: Friday, June 16, 2023 3:35 PM
> > To: Wolfram Sang <wsa+renesas@sang-engineering.com>; Adam Ford
> > <aford173@gmail.com>; linux-mmc@vger.kernel.org; linux-renesas-
> > soc@vger.kernel.org; Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.co=
m>
> > Subject: Re: [RFC/RFT PATCH] mmc: renesas_sdhi: add delay between tunin=
g
> > cmds
> >
> > On Wed, May 31, 2023 at 12:45=E2=80=AFPM Wolfram Sang <wsa+renesas@sang=
-
> > engineering.com> wrote:
> > >
> > >
> > > > I am testing this on a 5.10 kernel based on the Renesas RZ linux
> > > > kernel branch.  The good news is that the card doesn't hang like it
> > > > used to on the older 4.19 kernel, but it still does not enumerate t=
o
> > > > SDR104 speeds.
> > >
> > > U-Boot has a 1ms delay. Could you increase the delay to 1ms, please?
> >
> > Sorry for the delay, but I increased this to  usleep_range(1000, 2500) =
and
> > it still hangs.
> >
> > I don't know if the issue is dependent on the variant.  For what it's
> > worth, I am testing an RZ/G2M, but I can do the same thing on an RZ/G2N=
 or
> > RZ/G2H if you want.
>
> I am doing 6.1.y testing[1] with all RZ board variants,
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git/log=
/?h=3Dlinux-6.1.y-cip
>
> I have done SDHI testing with RZ/G2M 1.3 HiHope board and I didn't face t=
his issue.
>
> Can you please let me know how to reproduce this issue?

It's not easy to reproduce, and it only happens on a small subset of
cards.  I sent one to Wolfram sometime last year.  I can also  take
these same cards that hang when booting Linux, and they enumerate just
fine in U-Boot at SRD104 speeds.  I can use the same RZ/G2 board with
other cards, and other cards work fine.  I then tested these same
'failing' cards on other platforms and they work fine, so it seems
like there is a tuning combination in Linux that is different from
U-Boot that is unique to these certain cards which prevents them from
working.

adam


>
> Cheers,
> Biju
