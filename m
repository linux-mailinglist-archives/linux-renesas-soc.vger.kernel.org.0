Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE5D9445011
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Nov 2021 09:20:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230404AbhKDIXN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 4 Nov 2021 04:23:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230084AbhKDIXM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 4 Nov 2021 04:23:12 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53AF7C061714
        for <linux-renesas-soc@vger.kernel.org>; Thu,  4 Nov 2021 01:20:35 -0700 (PDT)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1FF65D8B;
        Thu,  4 Nov 2021 09:20:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1636014032;
        bh=F1FUF16dlO2rwt3yZWltdj4iFJx5RIlQbf3XtOqWWaE=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=lJja5Z96uroqkA8K3/Lgbt0mYwGt15i8DDb5ycB20Bsq1cRRPvVutztUdB+jmE8fB
         toi+bNBEOPVBgEOWp4kXdXTOI/uljNX/SS3Dm8Y4J7tfZNG3waffVA2Vx1mlfu9cci
         GbDPPdziV2lo+6iT0BYOv3W1vtGmijj3ZDSKaOiY=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <87bl302598.wl-kuninori.morimoto.gx@renesas.com>
References: <87ilya4zv8.wl-kuninori.morimoto.gx@renesas.com> <YV5vB4c8J0xu2mOd@pendragon.ideasonboard.com> <87v929moad.wl-kuninori.morimoto.gx@renesas.com> <CAMuHMdUxXP86Z-2Tb8t4bK6aBfRT1Toj0jpruEEd8YbeDL+h=A@mail.gmail.com> <163585809096.275423.10804585086979279969@Monstersaurus> <87bl302598.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: HDMI isn't probed on v5.15-rc1 on ULCB+KF
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date:   Thu, 04 Nov 2021 08:20:29 +0000
Message-ID: <163601402996.275423.3014590029199578920@Monstersaurus>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Kuninori Morimoto (2021-11-03 23:23:15)
>=20
> Hi Kieran
>=20
> > > > =3D>      [    1.485684] rcar-dw-hdmi fead0000.hdmi: Detected HDMI =
TX controller v2.01a with HDCP (DWC HDMI 2.0 TX PHY)
> > > > =3D>      [    1.496248] rcar-dw-hdmi fead0000.hdmi: registered Des=
ignWare HDMI I2C bus driver
> > > >         [    1.535173] loop: module loaded
> > > >         ...
> > > >
> > > > This is NG case.
> > > > DAM failed. rcar-dw-hdmi is not probed.
> >=20
> > Was something changed to make this happen between this and the above
> > test?
>=20
> Only reverting the issue patch.

Aha, ok - that was clearer when I re-read that you bisected to identify
the patch. Thanks for identifying the root cause.

> > > Note that in both cases feb00000.display failed to probe first
> > > Is this an fw_devlink issue, due to HDMI linking to DU in DT?
> > > Does it work with fw_devlink=3Dpermissive of fw_devlink=3Doff?
> >=20
> > The DT is all connected up with the ports as I would expect them on
> > ulcb+kf, but I saw the unanswered question from Geert above. Could you
> > check that please?
>=20
> In my understanding, Laurent answered it at private meeting.
> He said it is not related, if my memory was correct.

Ah, sorry - I missed that.

>=20
> > Is there anything else specific to replicating this issue? Is it only on
> > the ULCB+KF? Or does it occur on Salvator-XS too? (And does it need a
> > specific kernel config to reproduce?)
>=20
> I could reproduce the same issue on Salvator-XS.
> I attached my .config on this mail.

Great, that's something I can try to reproduce then. Thanks, I'll boot
that up next.

> Thank you for your help !!
>=20
> Best regards
> ---
> Kuninori Morimoto
>
