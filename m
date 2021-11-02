Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3CEC442EB6
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Nov 2021 14:01:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231176AbhKBNEJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 2 Nov 2021 09:04:09 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:57486 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230128AbhKBNEJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 2 Nov 2021 09:04:09 -0400
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 558DF3E5;
        Tue,  2 Nov 2021 14:01:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1635858093;
        bh=g++Q9Urh2rXWvBvkxb054sq/RKFC73dby5AMPhM5B3g=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=U9NHhMahdHjLimWnhGA/cj/ZNPIgB/c4RVIGFNc9KxF9oV0KpW4w5ydbWm1iumquu
         Fk9Ow+ogZzcFTH9vc4jspaWHUHHeAPfH/+fjFZzXT6CahMRXyhpdT5hLpJdbrNYPi0
         4OpWGPtGCaEvsOjX0U+u7qURCv+3nIcfQm8dsKsk=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAMuHMdUxXP86Z-2Tb8t4bK6aBfRT1Toj0jpruEEd8YbeDL+h=A@mail.gmail.com>
References: <87ilya4zv8.wl-kuninori.morimoto.gx@renesas.com> <YV5vB4c8J0xu2mOd@pendragon.ideasonboard.com> <87v929moad.wl-kuninori.morimoto.gx@renesas.com> <CAMuHMdUxXP86Z-2Tb8t4bK6aBfRT1Toj0jpruEEd8YbeDL+h=A@mail.gmail.com>
Subject: Re: HDMI isn't probed on v5.15-rc1 on ULCB+KF
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date:   Tue, 02 Nov 2021 13:01:30 +0000
Message-ID: <163585809096.275423.10804585086979279969@Monstersaurus>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Morimoto-san,

Laurent is away this week, so I've just tried to have a quick look
through this issue in his absence. I'm afraid I don't have a ULCB-H3 to
test locally, so I'm following the code standalone at the moment.

Quoting Geert Uytterhoeven (2021-10-07 08:24:37)
> Hi Morimoto-san,
>=20
> On Thu, Oct 7, 2021 at 6:55 AM Kuninori Morimoto
> <kuninori.morimoto.gx@renesas.com> wrote:
> > I'm not sure what is related, but I noticed something.
> >
> > This is OK case.
> > DRM failed ? rcar-dw-hdmi was probed
> >         ...
> >         [    0.499485] gpio_rcar e6055800.gpio: driving 4 GPIOs
> >         [    0.511240] SuperH (H)SCI(F) driver initialized
> >         [    0.512316] e6e88000.serial: ttySC0 at MMIO 0xe6e88000 (irq =
=3D 123, base_baud =3D 0) is a scif
> >         [    1.465894] printk: console [ttySC0] enabled
> > =3D>      [    1.476935] rcar-du feb00000.display: failed to initialize=
 DRM/KMS (-6)

This comes from calling rcar_du_modeset_init() ... I'll dig down to see
if there's a clear (single) path leading to -6 / -ENXIO.


> > =3D>      [    1.485684] rcar-dw-hdmi fead0000.hdmi: Detected HDMI TX c=
ontroller v2.01a with HDCP (DWC HDMI 2.0 TX PHY)
> > =3D>      [    1.496248] rcar-dw-hdmi fead0000.hdmi: registered DesignW=
are HDMI I2C bus driver
> >         [    1.535173] loop: module loaded
> >         ...
> >
> > This is NG case.
> > DAM failed. rcar-dw-hdmi is not probed.

Was something changed to make this happen between this and the above
test?

> >
> >         ...
> >         [    0.490286] gpio_rcar e6055800.gpio: driving 4 GPIOs
> >         [    0.501956] SuperH (H)SCI(F) driver initialized
> >         [    0.503027] e6e88000.serial: ttySC0 at MMIO 0xe6e88000 (irq =
=3D 123, base_baud =3D 0) is a scif
> >         [    1.432046] printk: console [ttySC0] enabled
> > =3D>      [    1.443177] rcar-du feb00000.display: failed to initialize=
 DRM/KMS (-6)
> >         [    1.481426] loop: module loaded
> >         ...
>=20
> Note that in both cases feb00000.display failed to probe first
> Is this an fw_devlink issue, due to HDMI linking to DU in DT?
> Does it work with fw_devlink=3Dpermissive of fw_devlink=3Doff?

The DT is all connected up with the ports as I would expect them on
ulcb+kf, but I saw the unanswered question from Geert above. Could you
check that please?

Is there anything else specific to replicating this issue? Is it only on
the ULCB+KF? Or does it occur on Salvator-XS too? (And does it need a
specific kernel config to reproduce?)

--
Kieran


> Gr{oetje,eeting}s,
>=20
>                         Geert
>=20
>=20
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>=20
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds
