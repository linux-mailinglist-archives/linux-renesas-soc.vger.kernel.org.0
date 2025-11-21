Return-Path: <linux-renesas-soc+bounces-24941-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 193A5C78E4F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 12:47:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 09AE14EADAA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 11:43:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C0E738DEC;
	Fri, 21 Nov 2025 11:43:32 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F972F8BD0
	for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 11:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763725412; cv=none; b=qQFHXUHmJoCsGZ7NjDaJqoY6fQfvPAZz5nT1tP6wiqR8ZI+F2QMQ43NFOm3PSIjBQys6im7yCGzLke4RX7aJwwxale8qbvGp2Ho8NKAEmoJX9L0cUYQpf4nzKqh5dorpeE1fj6apmZPx5fgXsPrCxlqw3m6JGfJ0JP1MUUJf7Hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763725412; c=relaxed/simple;
	bh=+WXBgeboy6rtNVSH8ml+pXMUn813R/MlG2esAsn5p9E=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=s4oeYNXRwVPihQIdZcqMB24E0oSIGaHSoSNQDO7hV6l7MlLQvAsm6rxkRKEREz4u36cjyKGcEVUZ2WyUX3MF6QYQvdSRNLheLeI32q0j2OADVEQts4uTfL/XczrQlrgv+OYHfcywbWJKf/UXlZM8zNxbtu3+7PtJn8hRSSg2jaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vMPXg-0003GG-RC; Fri, 21 Nov 2025 12:43:08 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vMPXe-001ZuI-0I;
	Fri, 21 Nov 2025 12:43:06 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vMPXd-000000005XB-4AQe;
	Fri, 21 Nov 2025 12:43:05 +0100
Message-ID: <951c27938acfb23e7af29603043143744f702808.camel@pengutronix.de>
Subject: Re: [PATCH net-next 05/11] net: dsa: rzn1-a5psw: Add support for
 optional reset control
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Prabhakar <prabhakar.csengg@gmail.com>, 
 =?ISO-8859-1?Q?Cl=E9ment_L=E9ger?=	 <clement.leger@bootlin.com>, Andrew
 Lunn <andrew@lunn.ch>, Vladimir Oltean	 <olteanv@gmail.com>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet	 <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni	 <pabeni@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Simon Horman	 <horms@kernel.org>, Russell King
 <linux@armlinux.org.uk>, Geert Uytterhoeven	 <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Biju Das	
 <biju.das.jz@bp.renesas.com>, Fabrizio Castro
 <fabrizio.castro.jz@renesas.com>,  Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>
Date: Fri, 21 Nov 2025 12:43:05 +0100
In-Reply-To: <20251121113553.2955854-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: 
	<20251121113553.2955854-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
	 <20251121113553.2955854-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-renesas-soc@vger.kernel.org

On Fr, 2025-11-21 at 11:35 +0000, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Add support for an optional reset control to the RZN1 A5PSW driver.
> Obtain the reset line using
> devm_reset_control_get_optional_exclusive_deasserted() during probe
> to ensure that the Ethernet switch (ETHSW) block is properly released
> from reset before initialization.
>=20
> This change prepares the driver for use on Renesas RZ/T2H and RZ/N2H
> SoCs, where the ETHSW IP block is connected to a dedicated reset line
> that must be controlled by software.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

