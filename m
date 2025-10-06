Return-Path: <linux-renesas-soc+bounces-22722-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E52BBEA88
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 06 Oct 2025 18:32:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 027CE4F02C7
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Oct 2025 16:32:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CC7F2D97AB;
	Mon,  6 Oct 2025 16:31:59 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A492DAFDB
	for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Oct 2025 16:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759768319; cv=none; b=s6ehiJPMZ0YWYHEvFCz/uVz20KmO2k3i0fC3o10uz+8YEgzeTy+GIU1/uunfZiuow0ev57x0zznSa7YgRNb95k0NJuShBtGHNzYSjr5gacO+YtM8RSe4MCwehGUdlCB00mG8+IkJuUzSl+6gn+LIJUnSkO+orEUwF/6simmHXlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759768319; c=relaxed/simple;
	bh=/DcP/cci+VbEvU6AGiEvR5mqlVGbVA9PCPVwr9My8bA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jO9B3wKBfkn/XXVJFzMp7Yn30eCt04KFbsKBvL8UW/h5ItpqHMgQF+PmBDMFZXj2/7Bij0/Ifn/d0dVB3oflUI6hdYhBXFdnhVjg/PGtzr9R9ewoB6t64699xSGzgwR0db8jpxgfWaAkXTBF3GfmzQfBCRCC3y7UM2YvYEfG0Xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1v5o7h-0002Fu-8i; Mon, 06 Oct 2025 18:31:41 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1v5o7g-002GHH-0j;
	Mon, 06 Oct 2025 18:31:40 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1v5o7g-00000000DSK-0bId;
	Mon, 06 Oct 2025 18:31:40 +0200
Message-ID: <593eb851ae6ce0ec03ddeacf436180b6538fdd1e.camel@pengutronix.de>
Subject: Re: [PATCH 04/18] reset: rzv2h-usb2phy: Set VBENCTL register for
 OTG mode
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
	tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com, Yoshihiro
 Shimoda <yoshihiro.shimoda.uh@renesas.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I	 <kishon@kernel.org>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Magnus Damm	 <magnus.damm@gmail.com>, Fabrizio
 Castro <fabrizio.castro.jz@renesas.com>,  Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-phy@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Mon, 06 Oct 2025 18:31:39 +0200
In-Reply-To: <20251001212709.579080-5-tommaso.merciai.xr@bp.renesas.com>
References: <20251001212709.579080-1-tommaso.merciai.xr@bp.renesas.com>
	 <20251001212709.579080-5-tommaso.merciai.xr@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
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

On Mi, 2025-10-01 at 23:26 +0200, Tommaso Merciai wrote:
> Add logic to set the VBENCTL register when the USB controller operates in
> OTG mode. This is required to ensure proper USB transceiver behavior when
> the device is configured as OTG.
>=20
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

I had reservations about this driver before, because of the opaque
register initialization sequence, and I was told that no, this is a
reset driver alright [1].

Can you please try to find a proper abstraction for this, because
drivers/reset is not the correct place for USB OTG mode handling.

[1] https://lore.kernel.org/all/TYCPR01MB12093DB963348A8FD58409E5AC2DE2@TYC=
PR01MB12093.jpnprd01.prod.outlook.com/


regards
Philipp

