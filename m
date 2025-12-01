Return-Path: <linux-renesas-soc+bounces-25416-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ACB5C963C1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 01 Dec 2025 09:47:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6F9DD3A1336
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Dec 2025 08:47:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71FB7233140;
	Mon,  1 Dec 2025 08:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="FojpAuJy"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C49E336D4E5;
	Mon,  1 Dec 2025 08:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764578818; cv=none; b=NxDX/+W/Tl55DXCvaUB7skBEoMo/AcIzm/kKr0YRHZS3BCtvm+bO1gUARhs+83hv60r/UifSC560tOQ6FYAux+Dguo9Xy8UXGuICU1KMc24yBt18zZut5NY6NB1a9jOiGvFLSlAniETtOYLXQpdErwnJGaIVu7oFltRfRkd+dsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764578818; c=relaxed/simple;
	bh=Qgh9FVkFz3hcG2olODtjEN6cp5GghgfgxJVzZpXAA+8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TQ/mWF4Nk9kYW1CGB5hK6griEr3pbLOEy27/r1D/7KWzv2MAUF5p7rBvQhx+tzW7j3Qw8rCIrSz+hYR7W+PRZjSnrdssGvFUCTkq46vNcFxpSXk9DnMEFxkDAUPsGEijJ7ZvEgLTVTVlLehSUvKi/th0ZBoAqcTH23OKX47nrIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=FojpAuJy; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4FA7A10C022;
	Mon,  1 Dec 2025 09:46:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1764578812;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=tECTI7iXIQopJsYopPaeTUcXcvcSRzLtBSEaKyPT7oc=;
	b=FojpAuJynpLYszlG4Pmkqq5h3G9Zqm4+4YzQx6E2shdjnOfgHySa5CqC02cpS6XQC+UHKz
	xjbJW4mTVDQ7iXCvtsqO/Xiottse2owQIXcUwBKDotz69VUNykyYaFB9nlkq76pf/xeCKR
	HdDk+RelQBi18T7akqUJRhQNFvrEYQx41vXaVtjDNgKI4ZBR7Qt0ft9CXGYeHtzrFtfjPN
	Ou7I0sen6/17RbkXjZAE0Y3NMPDNr1xup13v8pOVYX+WY9zXbHe2zClxgFjk5vnfOBrGeU
	9TvLzLo7JeQVGuN7NC8Z/zinoVEsQ1IJ/xc46rlKhXEZkwQzc4jUybIpv5sOdg==
Date: Mon, 1 Dec 2025 09:46:46 +0100
From: =?UTF-8?B?xYF1a2Fzeg==?= Majewski <lukma@nabladev.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, Alvin
 =?UTF-8?B?xaBpcHJhZ2E=?= <alsi@bang-olufsen.dk>, =?UTF-8?B?Q2zDqW1lbnQg?=
 =?UTF-8?B?TMOpZ2Vy?= <clement.leger@bootlin.com>, "Chester A. Unal"
 <chester.a.unal@arinc9.com>, Daniel Golle <daniel@makrotopia.org>, David
 Yang <mmyangfl@gmail.com>, DENG Qingfang <dqfext@gmail.com>, Florian
 Fainelli <florian.fainelli@broadcom.com>, George McCollister
 <george.mccollister@gmail.com>, Hauke Mehrtens <hauke@hauke-m.de>, Jonas
 Gorski <jonas.gorski@gmail.com>, Kurt Kanzenbach <kurt@linutronix.de>,
 Linus Walleij <linus.walleij@linaro.org>, Sean Wang
 <sean.wang@mediatek.com>, Sebastian Andrzej Siewior
 <bigeasy@linutronix.de>, Woojung Huh <woojung.huh@microchip.com>, Xiaoliang
 Yang <xiaoliang.yang_1@nxp.com>, linux-renesas-soc@vger.kernel.org,
 UNGLinuxDriver@microchip.com
Subject: Re: [PATCH net-next 00/15] DSA simple HSR offload
Message-ID: <20251201094610.63424e51@wsk>
In-Reply-To: <20251130131657.65080-1-vladimir.oltean@nxp.com>
References: <20251130131657.65080-1-vladimir.oltean@nxp.com>
Organization: Nabla
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hi Vladimir,

> Provide a "simple" form of HSR offload for 8 DSA drivers (just the
> NETIF_F_HW_HSR_DUP feature) based on the fact that their taggers use
> the dsa_xmit_port_mask() function. This is in patches 6-13/15.
>=20
> The helpers per se are introduced in patch 5/15, and documented in
> patch 15/15. Patch 14/15 is another small (and related) documentation
> update.
>=20
> For HSR interlink ports the offloading rules are not quite so clear,
> and for now we completely reject the offload. We can revise that once
> we see a full offload implementation and understand what is needed.
>=20
> To reject the offload, we need to know the port type, and patch 2/15
> helps with that.
>=20
> xrs700x is another driver which should have rejected offload based on
> port type (patch 4/15). This is a bug fix submitted through net-next
> due to the extra API required to fix it. If necessary, it could also
> be picked up separately for backporting.
>=20
> There is also patch 3/15, which makes the HSR offload like the others
> supported by DSA: if we fall back to the software implementation,
> don't call port_hsr_leave(), because by definition there won't be
> anything to do.
>=20
> A slightly unrelated change is patch 1/15, but I noticed this along
> the way, and if I were to submit it separately, it would conflict
> with this work (it would appear in patch 12/15's context).
>=20
> Most of the driver additions are trivial. By far the most complex was
> ocelot (which I could test). Microchip ksz (which I cannot test, and
> did not patch) would also have some complexity. Essentially,
> ksz_hsr_join() could fall back to a partial offload through the
> simple helpers, if the full offload is not possible. But keeping
> track of which offload kind was used is necessary later in
> ksz_hsr_leave(). This is left as homework for interested developers.
>=20

It is nice, that somebody thinks about homeworks for other
developers ... (:-D)

Mine (from netdev ML) includes, but is not limited to, MoreThanIP switch
driver (yes, for NXP's imx287) .... (v21 in preparation).

Nonetheless, are changes from this patch set applicable to HSR tests:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/too=
ls/testing/selftests/net/hsr

Especially, the hsr_ping.sh and hsr_redbox.sh?

> With this patch set, one can observe a 50% reduction in transmitted
> traffic over HSR interfaces.
>=20
> Cc: "Alvin =C5=A0ipraga" <alsi@bang-olufsen.dk>
> Cc: "Cl=C3=A9ment L=C3=A9ger" <clement.leger@bootlin.com>
> Cc: "Chester A. Unal" <chester.a.unal@arinc9.com>
> Cc: Daniel Golle <daniel@makrotopia.org>
> Cc: David Yang <mmyangfl@gmail.com>
> Cc: DENG Qingfang <dqfext@gmail.com>
> Cc: Florian Fainelli <florian.fainelli@broadcom.com>
> Cc: George McCollister <george.mccollister@gmail.com>
> Cc: Hauke Mehrtens <hauke@hauke-m.de>
> Cc: Jonas Gorski <jonas.gorski@gmail.com>
> Cc: Kurt Kanzenbach <kurt@linutronix.de>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Lukasz Majewski <lukma@denx.de>
> Cc: Sean Wang <sean.wang@mediatek.com>
> Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Cc: Woojung Huh <woojung.huh@microchip.com>
> Cc: Xiaoliang Yang <xiaoliang.yang_1@nxp.com>
> Cc: linux-renesas-soc@vger.kernel.org
> Cc: UNGLinuxDriver@microchip.com
>=20
> Vladimir Oltean (14):
>   net: dsa: mt7530: unexport mt7530_switch_ops
>   net: dsa: avoid calling ds->ops->port_hsr_leave() when unoffloaded
>   net: dsa: xrs700x: reject unsupported HSR configurations
>   net: dsa: add simple HSR offload helpers
>   net: dsa: yt921x: use simple HSR offloading helpers
>   net: dsa: ocelot: use simple HSR offload helpers
>   net: dsa: realtek: use simple HSR offload helpers
>   net: dsa: lantiq_gswip: use simple HSR offload helpers
>   net: dsa: mv88e6060: use simple HSR offload helpers
>   net: dsa: hellcreek: use simple HSR offload helpers
>   net: dsa: mt7530: use simple HSR offload helpers
>   net: dsa: a5psw: use simple HSR offload helpers
>   Documentation: net: dsa: mention availability of RedBox
>   Documentation: net: dsa: mention simple HSR offload helpers
>=20
> Xiaoliang Yang (1):
>   net: hsr: create an API to get hsr port type
>=20
>  Documentation/networking/dsa/dsa.rst         | 17 +++--
>  drivers/net/dsa/hirschmann/hellcreek.c       |  2 +
>  drivers/net/dsa/lantiq/lantiq_gswip_common.c |  2 +
>  drivers/net/dsa/mt7530.c                     |  5 +-
>  drivers/net/dsa/mt7530.h                     |  1 -
>  drivers/net/dsa/mv88e6060.c                  |  2 +
>  drivers/net/dsa/ocelot/felix.c               | 70
> +++++++++++++++++++- drivers/net/dsa/realtek/rtl8365mb.c          |
> 2 + drivers/net/dsa/realtek/rtl8366rb.c          |  2 +
>  drivers/net/dsa/rzn1_a5psw.c                 |  2 +
>  drivers/net/dsa/xrs700x/xrs700x.c            | 11 +++
>  drivers/net/dsa/yt921x.c                     |  3 +
>  include/linux/if_hsr.h                       |  9 +++
>  include/net/dsa.h                            |  9 +++
>  net/dsa/dsa.c                                | 65 ++++++++++++++++++
>  net/dsa/port.c                               |  3 +
>  net/hsr/hsr_device.c                         | 20 ++++++
>  net/hsr/hsr_slave.c                          |  7 +-
>  18 files changed, 220 insertions(+), 12 deletions(-)
>=20



--=20
Best regards,

Lukasz Majewski

--
Nabla Software Engineering GmbH
HRB 40522 Augsburg
Phone: +49 821 45592596
E-Mail: office@nabladev.com
Managing Director : Stefano Babic

