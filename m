Return-Path: <linux-renesas-soc+bounces-23907-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 136CAC201FA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Oct 2025 13:59:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ACB50467CF8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Oct 2025 12:56:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 556513559DA;
	Thu, 30 Oct 2025 12:55:33 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C192A3559C4
	for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Oct 2025 12:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761828933; cv=none; b=dtBVgHp6xqQsZU+IkjC+8ruEPbcHqRDjTb/0s/u2hdeUt6VX7bROE+L3wDKFyU61IiwgB85ebCRLw6NBr5O2bZ8ujP/RGj5pBYoVXeHCEMDwH6sI2qMbBATsqE420a5eFB0/HywBIYlXzDVt9ALJ1siKLdPDNOBcn0Uowj7+iv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761828933; c=relaxed/simple;
	bh=BPMkOSJzoxkfw6PUJolM0zDRGAMNQrtlbfSFl3O3j00=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RY1Zd7Dcttc2UPsRFhndiPlWckxks+fla2xtzbpGOqWGOFZE27HSJhiqPpBOubBM8RQQ9zi3NweX3e9cU/zNwklG8UmjH6Y9Bt8qky9uMOc3PB2UsEhS6T89GAdDxKzcOqX1cGDecXrtfYq3p9oanGi9pOl0xkmhtYunVgnhJjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vESBP-0004jc-Tq; Thu, 30 Oct 2025 13:55:15 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vESBO-006DFZ-3C;
	Thu, 30 Oct 2025 13:55:15 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vESBO-000000009F0-3mw3;
	Thu, 30 Oct 2025 13:55:14 +0100
Message-ID: <0ba1350722a0f245257e462271d7edfc091a3097.camel@pengutronix.de>
Subject: Re: [PATCH v8 0/7] Add initial USB support for the Renesas RZ/G3S
 SoC
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Claudiu <claudiu.beznea@tuxon.dev>, vkoul@kernel.org, kishon@kernel.org,
 	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 geert+renesas@glider.be, 	magnus.damm@gmail.com,
 yoshihiro.shimoda.uh@renesas.com, 	biju.das.jz@bp.renesas.com
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Claudiu
 Beznea	 <claudiu.beznea.uj@bp.renesas.com>
Date: Thu, 30 Oct 2025 13:55:14 +0100
In-Reply-To: <20251023135810.1688415-1-claudiu.beznea.uj@bp.renesas.com>
References: <20251023135810.1688415-1-claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1+deb13u1 
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

On Do, 2025-10-23 at 16:58 +0300, Claudiu wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>=20
> Hi,
>=20
> Series adds initial USB support for the Renesas RZ/G3S SoC.
>=20
> Series is split as follows:
> - patches 1-2/7		- fixes on bindings and driver for USB PHY
> - patches 3-5/7		- updates the rzg2l-usbphy-ctrl driver and documentation
> 			  with support for setting PWRRDY though SYSC
> - patches 6-7/7		- add device tree support
>=20
> Merge strategy, if any:
> - patches 1-2/7 can go through the PHY tree
> - patches 3-5/7 can go through the reset tree

Patches 3-5 applied to reset/next, thanks!

[3/7] dt-bindings: reset: renesas,rzg2l-usbphy-ctrl: Document RZ/G3S
support
      https://git.pengutronix.de/cgit/pza/linux/commit/?id=3D7b129b5de3eb
[4/7] reset: rzg2l-usbphy-ctrl: Add support for USB PWRRDY
      https://git.pengutronix.de/cgit/pza/linux/commit/?id=3D58128aa88867
[5/7] reset: rzg2l-usbphy-ctrl: Add support for RZ/G3S SoC
      https://git.pengutronix.de/cgit/pza/linux/commit/?id=3Da729c4be5ce9

regards
Philipp

