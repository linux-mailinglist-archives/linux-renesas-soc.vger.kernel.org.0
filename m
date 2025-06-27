Return-Path: <linux-renesas-soc+bounces-18853-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED6CAEBCF5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Jun 2025 18:17:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D245F3B0CBF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Jun 2025 16:17:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 299551A2398;
	Fri, 27 Jun 2025 16:17:48 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B412904
	for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Jun 2025 16:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751041068; cv=none; b=PaBpcblbDLyNw1dBVQ5YZ5f4Zxfi8hyGN0kvDGLD+Eui9azOzhIjos+1jvCq0oneFs/np8qLcyxHPB1GBxO37iPzW/4yKXj6qYacU7kWJ1OETeKK069vQTNzeTBn3YJmmTSge3ERGfVI74NdzQNDS/QPazZ73ybK5u6Vp2sQ2x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751041068; c=relaxed/simple;
	bh=EpS50sVTieLd5hWIVkfDWKZoZmCkWzzgRnyPvqG2f74=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ezE2szOYnaagz7/eq9725wHTciQD5DJ73AB+WOrKOwM1gjOGpkSarRIXn73sEo2/vhWvx2Z72ZQvq6+xjrm/x9y+FaJlqZTFik5GbuHg/o2f1OUfqAeijl5VGFV6TU/j5/qa/2OAgtwirsxP7RFytRft2DypvONFgAdo0s7HAcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uVBlj-00013q-0m; Fri, 27 Jun 2025 18:17:39 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uVBlh-005e4h-0c;
	Fri, 27 Jun 2025 18:17:37 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uVBlh-000QK1-0G;
	Fri, 27 Jun 2025 18:17:37 +0200
Message-ID: <0802d06dafc270799f05d3ccd9fb8a46eb0836e0.camel@pengutronix.de>
Subject: Re: [PATCH] dt-bindings: reset: renesas,rzv2h-usb2phy: Document
 RZ/V2N SoC support
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Prabhakar <prabhakar.csengg@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Magnus
 Damm <magnus.damm@gmail.com>, Fabrizio Castro
 <fabrizio.castro.jz@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, Lad
	Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Date: Fri, 27 Jun 2025 18:17:36 +0200
In-Reply-To: <20250528133031.167647-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: 
	<20250528133031.167647-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
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

On Mi, 2025-05-28 at 14:30 +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Document support for the USB2PHY reset controller found on the Renesas
> RZ/V2N (R9A09G056) SoC. The reset controller IP is functionally identical
> to that on the RZ/V2H(P) SoC, so no driver changes are needed. The existi=
ng
> `renesas,r9a09g057-usb2phy-reset` compatible will be used as a fallback
> for the RZ/V2N SoC.

Applied to reset/next, thanks!

[1/1] dt-bindings: reset: renesas,rzv2h-usb2phy: Document RZ/V2N SoC
support
      https://git.pengutronix.de/cgit/pza/linux/commit/?id=3Dfd4a06a2e166

regards
Philipp


