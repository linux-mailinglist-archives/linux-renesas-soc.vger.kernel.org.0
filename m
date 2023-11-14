Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27D2E7EB4C0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Nov 2023 17:30:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232417AbjKNQaK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 14 Nov 2023 11:30:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229570AbjKNQaJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Nov 2023 11:30:09 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33AFD116;
        Tue, 14 Nov 2023 08:30:03 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-280cc5f3fdcso4806032a91.1;
        Tue, 14 Nov 2023 08:30:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699979402; x=1700584202; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2mA7XwlcatU7gUDkrGIiKAdIf+3aKT9w1vU3A08xUmM=;
        b=ci6cLukobyobjdG3Z/oqxfKZ0osDbb7kIvrMnJx/no5GY/xtKVkBKttGWuNQrc3fzb
         vVOqMP4Wvd4SpSLCkFxHT0oBbPgtf1wbGPJH1/YXZ48HbBpMdc/eHM9bJ/k6JrQzymKe
         BUK0udhGSO18kqnF35UyXoN5NjvAcHnCkbxpNLI4++wUHrA4GeT/Mr+pJKgvjYEkp+lk
         d+EHiEGk1f6ItOV0c4z5Vo0g/n0vn6B7bkB98CEPL0w/rcSypT1YwGalKoMs0uDuCOn0
         54wewd94C1EF7IGVRU8m4kn+lqXp2g1Lwah/ZNpPTEsWekSWzGS0cOOaVlLNC7CbdKQS
         Ci7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699979402; x=1700584202;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2mA7XwlcatU7gUDkrGIiKAdIf+3aKT9w1vU3A08xUmM=;
        b=MaxAvXL8CMjas9FiC9FdJAjcVr6/Jgq6OxBeW3Q9wGbkXcjDzKuOgKY3hUEVTED6Q0
         kVl15USfzyuagv4boheGkWfd2xwYUPqQziReAuNavLs8v5wSychRMtf/4+vZPee5czLg
         XuRWLw48EQQura78rk/wAZm1+qCAKBlvOHtREHat3bF0zQwgrhmH5vBitqeG5gnkWqp/
         9m0qbPjvyBkrnMkcU198ZQVJmK5ATolPbVPpVVnbwELjTB9mTyLzzltyIHMwNB4HNZjS
         FjqH7ZPpPmz+fTULodWmpxCtOQcUhRYSoZRUUm9mRJgI5Ll/Hv2jqBSSg5I9AMExK/IS
         RcSw==
X-Gm-Message-State: AOJu0YzJ9+Gq38o8/tVz93bGoT8vji2z9h+3lr2VVAdf39Oq9WFO5Aiw
        K4hGp+4LrtTGYb13jQgZDg0OuhKSiGTKTspUFNTkd3IkFPg=
X-Google-Smtp-Source: AGHT+IHPMfOIB3pt2yppEFnXV+Am5KDg/wVpvER69Fp1doqI1K935tMxBLXp1i4pNpjeG6bCOf6pOgVFENO4x34bYlE=
X-Received: by 2002:a17:90a:1951:b0:27d:669e:5a10 with SMTP id
 17-20020a17090a195100b0027d669e5a10mr8754862pjh.13.1699979402348; Tue, 14 Nov
 2023 08:30:02 -0800 (PST)
MIME-Version: 1.0
References: <20230531070049.11806-1-wsa+renesas@sang-engineering.com>
 <CAHCN7xJxROk6RU66PjbGH4M-R7PbUG-4y_2BHyCeGx_hTeUprw@mail.gmail.com>
 <ZHeHx/rUE7ORf3V2@shikoro> <CAHCN7x+hVSC=uCtaQx0tLZ6UdkYvf8B0DGQJ52Xr8WjWU=jGpA@mail.gmail.com>
 <ZI/viJ52TttqFveH@ninjato> <CAHCN7xL6Xskd_5qcgtWbVw42reP2Z4o7+KyTPD64=8AO_fCxvw@mail.gmail.com>
In-Reply-To: <CAHCN7xL6Xskd_5qcgtWbVw42reP2Z4o7+KyTPD64=8AO_fCxvw@mail.gmail.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Tue, 14 Nov 2023 10:29:51 -0600
Message-ID: <CAHCN7xKsPMcBYeF1NWi4nkFPTtQO123VeAhigpzMYf19BeXNNw@mail.gmail.com>
Subject: Re: [RFC/RFT PATCH] mmc: renesas_sdhi: add delay between tuning cmds
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Adam Ford <aford173@gmail.com>, linux-mmc@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Jun 19, 2023 at 5:39=E2=80=AFAM Adam Ford <aford173@gmail.com> wrot=
e:
>
> On Mon, Jun 19, 2023 at 1:02=E2=80=AFAM Wolfram Sang
> <wsa+renesas@sang-engineering.com> wrote:
> >
> > Hi Adam,
> >
> > > > U-Boot has a 1ms delay. Could you increase the delay to 1ms, please=
?
> > >
> > > Sorry for the delay, but I increased this to  usleep_range(1000, 2500=
)
> > > and it still hangs.
> >
> > Sigh, back to the drawing board... But still thanks for trying! I'll tr=
y
> > to come up with something better after EOSS in Prague (will you be ther=
e
> > by any chance?)

Wolfram,

I wanted to test the 6.7-rc1 on the microSD cards to see if there has
been any improvement.  In the process, I found yet another card which
appears to have a similar issue where U-Boot can initialize a microSD
card in SDR104 mode, but Linux fails.  I think this brings the total
to 3 cards.  These same cards work on other platforms, so I don't
think there is anything wrong with the cards, especially since they
work on this platform in U-Boot.

 I added some debug code to indicate when when the priv->taps and
priv->smpcmp bits are set when executing the timing command.  FWICT,
the priv-taps never get set, and smpcmp appears to always be
successful.

[    3.741462] priv->smpcmp set bit 0
[    3.747404] mmc_send_tuning opcode 19
[    3.751173] priv->smpcmp set bit 1
[    3.757129] mmc_send_tuning opcode 19
[    3.760860] priv->smpcmp set bit 2
[    3.766815] mmc_send_tuning opcode 19
[    3.770564] priv->smpcmp set bit 3
[    3.776514] mmc_send_tuning opcode 19
[    3.780262] priv->smpcmp set bit 4
[    3.786213] mmc_send_tuning opcode 19
[    3.789966] priv->smpcmp set bit 5
[    3.795915] mmc_send_tuning opcode 19
[    3.799662] priv->smpcmp set bit 6
[    3.805611] mmc_send_tuning opcode 19
[    3.809364] priv->smpcmp set bit 7
[    3.815294] mmc_send_tuning opcode 19
[    3.819040] priv->smpcmp set bit 8
[    3.824988] mmc_send_tuning opcode 19
[    3.828735] priv->smpcmp set bit 9
[    3.834685] mmc_send_tuning opcode 19
[    3.838432] priv->smpcmp set bit 10
[    3.844466] mmc_send_tuning opcode 19
[    3.848214] priv->smpcmp set bit 11
[    3.854251] mmc_send_tuning opcode 19
[    3.857997] priv->smpcmp set bit 12
[    3.864032] mmc_send_tuning opcode 19
[    3.867778] priv->smpcmp set bit 13
[    3.873820] mmc_send_tuning opcode 19
[    3.877566] priv->smpcmp set bit 14
[    3.883582] mmc_send_tuning opcode 19
[    3.887328] priv->smpcmp set bit 15
[    3.893361] priv->tap_num =3D 8
[    3.896332] taps_size =3D 16
[    3.899059] tap_cnt =3D 0
[    3.901518] min_tap_row =3D 3
[    3.904312] renesas_sdhi_select_tuning failed
[    3.908732] mmc1: tuning execution failed: -5

When I compare the values of taps and smpcmp in U-Boot vs linux, I get
U-Boot Shows:
taps =3D dfdf
priv->smpcmp =3D dfdf
Sometimes,  priv->smpcmp =3D df9f

Linux shows:
priv->taps =3D 0
priv->smpcmp =3D ffff

And the Linux values are consistent.

Another thing that is interesting to me is that U-Boot explicitly
forces PIO when tuning and it only happens when executing "ret =3D
mmc_send_tuning(mmc, opcode, NULL);"  Is there a proper way to
temporarily switch to PIO in the Linux driver to see if I can
accomplish the same thing?

If I eject the card before it's mounted, it waits for the card to be
inserted.  If I insert the card, it enumerates:

[    3.701926] renesas_sdhi_start_signal_voltage_switch: 0
[    3.869834] renesas_sdhi_start_signal_voltage_switch: 1
[    3.898030] mmc_send_tuning opcode 19
[    3.907006] priv->taps set bit 0
[    3.910232] priv->smpcmp set bit 0
[    3.916160] mmc_send_tuning opcode 19
[    3.919901] priv->taps set bit 1
[    3.923142] priv->smpcmp set bit 1
[    3.929054] mmc_send_tuning opcode 19
[    3.932793] priv->taps set bit 2
[    3.936034] priv->smpcmp set bit 2
[    3.941953] mmc_send_tuning opcode 19
[    3.945697] priv->taps set bit 3
[    3.948938] priv->smpcmp set bit 3
[    3.954857] mmc_send_tuning opcode 19
[    3.958596] priv->taps set bit 4
[    3.961836] priv->smpcmp set bit 4
[    3.967756] mmc_send_tuning opcode 19
[    3.974009] mmc_send_tuning opcode 19
[    3.977749] priv->taps set bit 6
[    3.980987] priv->smpcmp set bit 6
[    3.986910] mmc_send_tuning opcode 19
[    3.990636] priv->taps set bit 7
[    3.993876] priv->smpcmp set bit 7
[    3.999797] mmc_send_tuning opcode 19
[    4.003535] priv->taps set bit 8
[    4.006760] priv->smpcmp set bit 8
[    4.012688] mmc_send_tuning opcode 19
[    4.016427] priv->taps set bit 9
[    4.019668] priv->smpcmp set bit 9
[    4.025587] mmc_send_tuning opcode 19
[    4.029326] priv->taps set bit 10
[    4.032654] priv->smpcmp set bit 10
[    4.038689] mmc_send_tuning opcode 19
[    4.042422] priv->taps set bit 11
[    4.045745] priv->smpcmp set bit 11
[    4.051748] mmc_send_tuning opcode 19
[    4.055484] priv->taps set bit 12
[    4.058795] priv->smpcmp set bit 12
[    4.064803] mmc_send_tuning opcode 19
[    4.071044] mmc_send_tuning opcode 19
[    4.074752] priv->taps set bit 14
[    4.078075] priv->smpcmp set bit 14
[    4.084077] mmc_send_tuning opcode 19
[    4.087832] priv->taps set bit 15
[    4.091157] priv->smpcmp set bit 15
[    4.097152] priv->tap_num =3D 8
[    4.100127] taps_size =3D 16
[    4.102828] priv->taps =3D dfdf
[    4.105800] priv->smpcmp =3D dfdf
[    4.108947] tap_cnt =3D 7
[    4.111395] min_tap_row =3D 3
[    4.116003] mmc1: new ultra high speed SDR104 SDHC card at address 59b4
[    4.123361] mmcblk1: mmc1:59b4 USD00 29.5 GiB
[    4.129577]  mmcblk1: p1 p2


Is there  some sort of reset or power-cycle that needs to be better configu=
red?

thanks,

adam
>
> I really tried to go, but my employer declined this time.  I was going
> to go on my own, butI didn't have enough personal time off available
> to fly out there.
>
> adam
> >
> > Happy hacking,
> >
> >    Wolfram
> >
