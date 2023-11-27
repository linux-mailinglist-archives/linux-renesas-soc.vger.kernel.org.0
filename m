Return-Path: <linux-renesas-soc+bounces-299-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 334267FAC95
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Nov 2023 22:32:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 634BA1C20DD0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Nov 2023 21:32:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5713646454;
	Mon, 27 Nov 2023 21:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LgGa0Jrc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3342A31580;
	Mon, 27 Nov 2023 21:32:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C7FBC433C8;
	Mon, 27 Nov 2023 21:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701120748;
	bh=oKVuzSwUsB23sGbqCUdMKzeZOFoBgjY8WDwms9OBRnc=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=LgGa0JrcD0Mjn91d/RumF0tZD9/oib+k4L290CqFgpd4gZ/96SKvsPaMyLK6OZcug
	 xNz664QoqgXdNYqM0DHe929wTJPfBM5hsa3Xc/1ragtuWoLImhBNNX8iugp4iAOJyS
	 4h/k+A2p++OxoxLV2tmRzMoDvWhxDEMZXLoUuu063Ae7tesDJuM33sS5ETOmzzq3q0
	 J8E9ONxnyws2yXI/HwKuK3iB+1ZUnBMOMq3rquVc/jNLgkfUjuFn+g6P6upN2xow7i
	 b/P+TdfnjF9TJd+FPvwM2SzGCqJxGQ5zz0KAjxiNbh99zGgi97NofVtKH7P4xipToR
	 p5n2lUED4T+Iw==
Message-ID: <31afd614c5eb5e82a860fecfc1c21c39.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAMuHMdU0Hqem8Ooehoo64rrGn8q8+5A8_DjGZd9Tvh=Xej6mdA@mail.gmail.com>
References: <8734x9tda9.wl-kuninori.morimoto.gx@renesas.com> <87wmulrynq.wl-kuninori.morimoto.gx@renesas.com> <20231116192324.GB2821275-robh@kernel.org> <CAMuHMdU0Hqem8Ooehoo64rrGn8q8+5A8_DjGZd9Tvh=Xej6mdA@mail.gmail.com>
Subject: Re: [PATCH 4/4] drivers: clk: renesas: enable all clocks which is assinged to non Linux system
From: Stephen Boyd <sboyd@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Frank Rowand <frowand.list@gmail.com>, Michael Turquette <mturquette@baylibre.com>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Aymeric Aillet <aymeric.aillet@iot.bzh>, Yusuke Goda <yusuke.goda.sx@renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>, Rob Herring <robh@kernel.org>
Date: Mon, 27 Nov 2023 13:32:26 -0800
User-Agent: alot/0.10

Quoting Geert Uytterhoeven (2023-11-16 13:08:46)
> On Thu, Nov 16, 2023 at 8:23=E2=80=AFPM Rob Herring <robh@kernel.org> wro=
te:
> > On Tue, Nov 14, 2023 at 12:01:14AM +0000, Kuninori Morimoto wrote:
> > > Some board might use Linux and another OS in the same time. In such
> > > case, current Linux will stop necessary module clock when booting
> > > which is not used on Linux side, but is used on another OS side.
> > >
> > > To avoid such situation, renesas-cpg-mssr try to find
> > > status =3D "reserved" devices (A), and add CLK_IGNORE_UNUSED flag to =
its
> > > <&cgp CPG_MOD xxx> clock (B).
> >
> > See Stephen's presentation from Plumbers this week. The default behavior
> > for unused clocks may be changing soon.
>=20
> Thank you!
>=20
> ou mean "Make sync_state()/handoff work for the common clk
> framework"[1]? IIUIC, that presentation didn't cover the problem we are
> facing, except for the big "Kconfig for clk_ignore_unused=3Dtrue" hammer.

:)

>=20
> > > Table 2.4: Values for status property
> > > https://github.com/devicetree-org/devicetree-specification/releases/d=
ownload/v0.4/devicetree-specification-v0.4.pdf
> > >
> > > "reserved"
> > >       Indicates that the device is operational, but should not be
> > >       used. Typically this is used for devices that are controlled
> > >       by another software component, such as platform firmware.
> > >
> > > ex)
> > >       scif5: serial@e6f30000 {
> > >               ...
> > > (B)           clocks =3D <&cpg CPG_MOD 202>,
> > >                        <&cpg CPG_CORE R8A7795_CLK_S3D1>,
> > >                        <&scif_clk>;
> > >               ...
> > > (A)           status =3D "reserved";
> > >       };
> >
> > I have some reservations about whether a reserved node should be touched
> > at all by Linux. I suppose since it is platform specific, it's okay. I
> > don't think we could apply such behavior globally.
>=20
> That's an interesting comment, as the issue is that currently Linux
> does touch (resources belonging to) reserved nodes, and this patch
> would prevent doing that for module clock resources;-)

I think I get it.

>=20
> The core issue is that Linux distinguishes only between two cases:
>   1. "device is used by Linux" (if a driver is available),
>      as indicated by 'status =3D "okay"' in DT, or
>   2. "device is unused by Linux".
> On a heterogenous system, the latter actually comprises two cases:
>   2a. "device is unused", or
>   2b. "device is used by another OS running on another CPU core".
>=20
> Looking for 'status =3D "reserved"' allows us to distinguish between 2a
> and 2b, and can prevent disabling clocks that are used by another OS.
> Probably we need a similar solution for power domains.
>=20
> Do you have a better or alternative suggestion?

Does the protected-clocks property work? That basically says "don't use
these clks in the OS". The driver implementation would not register
those clks and then the framework would be unaware of their existence,
leading to them never being disabled during late init.

This approach also looks OK to me, basically programmatically creating
the protected-clocks list by parsing DT for reserved consumer nodes and
then figuring out that no consumer exists so we can skip registering the
clk entirely, or add the flag. I'm not sure we want to implement that
policy globally, because maybe someone really wants to disable the clk
still to clean up bootloader state and then let a remoteproc use the clk
later.

Do you want to keep those clks registered with the framework? Is there
any benefit to keeping clks around if linux can't do anything with them?

