Return-Path: <linux-renesas-soc+bounces-542-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2384D801698
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Dec 2023 23:39:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CCD3A1F21061
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Dec 2023 22:39:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84EBC3D75;
	Fri,  1 Dec 2023 22:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WQ5xW0PG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52734210A;
	Fri,  1 Dec 2023 22:39:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACC1BC433C9;
	Fri,  1 Dec 2023 22:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701470391;
	bh=u6GaIbIyC8a69wwdRUdazP2geJ52q1bBtcXs0O51XL4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=WQ5xW0PGeDnLuodMDPI8infn9jmtMouUNJra1NyhlZEI1ghM6i6cm6YZHHIifoWXj
	 bj5ruP+LSLyBZQvhDHI5JKSY8gUrp7jkbmQ0XptFrTBHsaAEtIII/nHpXVXXSdCUnD
	 ndYzlcxVKAWg2AM+6WrapF65cuA3ftDRUEYE5mywkrvBmp2eXpg/PHv3J9YDPqGEFv
	 D2soCHorvdbDPTWdCoTTLzvt1GX0P0bPZilucDJve3tT7JpYczTkuDZtVP7C3djJSD
	 p4HhJ8t5T57tz5um8uLZXf+1ykb5QGR9eYxHOeqMrK6ehamZHyCZ2XbfK4Aebn9Mo7
	 kd+XRScnwMmrA==
Message-ID: <d7cd97fb5dd2f320fbf52bf96b8fe79d.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <871qca92s2.wl-kuninori.morimoto.gx@renesas.com>
References: <8734x9tda9.wl-kuninori.morimoto.gx@renesas.com> <87wmulrynq.wl-kuninori.morimoto.gx@renesas.com> <20231116192324.GB2821275-robh@kernel.org> <CAMuHMdU0Hqem8Ooehoo64rrGn8q8+5A8_DjGZd9Tvh=Xej6mdA@mail.gmail.com> <31afd614c5eb5e82a860fecfc1c21c39.sboyd@kernel.org> <871qca92s2.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 4/4] drivers: clk: renesas: enable all clocks which is assinged to non Linux system
From: Stephen Boyd <sboyd@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Rob Herring <robh@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Michael Turquette <mturquette@baylibre.com>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Aymeric Aillet <aymeric.aillet@iot.bzh>, Yusuke Goda <yusuke.goda.sx@renesas.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Fri, 01 Dec 2023 22:39:49 +0000
User-Agent: alot/0.10

Quoting Kuninori Morimoto (2023-11-27 23:48:04)
>=20
> Hi Stephen
>=20
> Thank you for your feedback
>=20
> > Does the protected-clocks property work? That basically says "don't use
> > these clks in the OS". The driver implementation would not register
> > those clks and then the framework would be unaware of their existence,
> > leading to them never being disabled during late init.
> >=20
> > This approach also looks OK to me, basically programmatically creating
> > the protected-clocks list by parsing DT for reserved consumer nodes and
> > then figuring out that no consumer exists so we can skip registering the
> > clk entirely, or add the flag. I'm not sure we want to implement that
> > policy globally, because maybe someone really wants to disable the clk
> > still to clean up bootloader state and then let a remoteproc use the clk
> > later.
> >=20
> > Do you want to keep those clks registered with the framework? Is there
> > any benefit to keeping clks around if linux can't do anything with them?
>=20
> Actually, this idea (=3D using "protected-clocks" property style) was our=
 1st
> idea, but I noticed that it is not enough. Because clock driver is possib=
le
> to know which module was not used on Linux, but other driver can't, in th=
is
> idea. For example, power-domain control driver might want to know about i=
t.
>=20
> In case of using "protected-clocks" property, we need to have same/similar
> settings on each driver, but in case of using "status =3D reserved", all
> driver is possible to know it. It has consistent, and no contradict like
> some module was listed as "protected-clocks" on clock / power driver,
> but has "status =3D ok" on its driver, etc.
>=20
> It seems we have different opinions around here ?

I don't really have any opinion here.

>=20
> Our other idea was having "unassigned" node instead of
> "status =3D reserved", like below.
> clock driver checks "unassigned" node's "devices" property, and
> ignore/disable listed device's "clocks".
>=20
>         unassigned {
>                 devices =3D <&scif1>, <&hsusb>;
>         };

This approach looks like the chosen node. I'd say what you have done in
this patch series is better. The protected-clocks property is really
about clks that shouldn't be used by the OS on some board. In your case
it sounds like you want to still be able to read the clk hardware? Does
anything go wrong if you let some consumer get the clk and change
settings? Do you want to prevent that from happening? I'm mostly
thinking it may be useful to have this logic be common in the clk
framework by having the framework search through DT and figure out that
the only consumers are reserved and thus we should treat those clks as
read-only in the framework.

