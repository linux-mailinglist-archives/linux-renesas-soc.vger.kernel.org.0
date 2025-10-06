Return-Path: <linux-renesas-soc+bounces-22721-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0EABBEA01
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 06 Oct 2025 18:22:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 9860234A1A8
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Oct 2025 16:22:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00E9B2DC328;
	Mon,  6 Oct 2025 16:21:46 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E265A2DA759
	for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Oct 2025 16:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759767705; cv=none; b=SV9OeK9zLZvw8vL/238UZ5GVC+lEzB9QVVUXu8T0nxOM0ACSDcuWSEmEBo3jMtiL9CkqS1YbXro3YqsiZ/R8Uu8r8zpsXJYN74f7AAoZwhjFMS+bnm+hlnQf+lCJJzNwmMECWoHIVa+kEW8hmFFNi8WWl4NPbPDUnb1bV1o3v9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759767705; c=relaxed/simple;
	bh=M6/Yngir4VMXHpYqGxzz/Lji5KGMdeW0/+E+BMjMFyE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DEdSJC99H9MvlAwXixz6xZ643JLp7Y6UWyY7UoLVqbRwoR/KVsQG20WA8/vaJlWyP5E0cku6cS6Wa1/DvtNId8h45wNxHYqKfqRTiiBQ8NrYbn/RAm4xYKOl4yZzvS9F2UKjva5lBpMkiwceHW0psfry+wkDRdeqXjCQfeOFdIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1v5nxm-0000oi-Ef; Mon, 06 Oct 2025 18:21:26 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1v5nxl-002GFW-1G;
	Mon, 06 Oct 2025 18:21:25 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1v5nxl-00000000DI2-1Hhd;
	Mon, 06 Oct 2025 18:21:25 +0200
Message-ID: <c3e1e3da577de1370e7604560f0b42c0fcb7db44.camel@pengutronix.de>
Subject: Re: [PATCH 03/18] reset: rzv2h-usb2phy: Simplify pm_runtime driver
 handling
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
Date: Mon, 06 Oct 2025 18:21:25 +0200
In-Reply-To: <20251001212709.579080-4-tommaso.merciai.xr@bp.renesas.com>
References: <20251001212709.579080-1-tommaso.merciai.xr@bp.renesas.com>
	 <20251001212709.579080-4-tommaso.merciai.xr@bp.renesas.com>
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

Hi Tommaso,

On Mi, 2025-10-01 at 23:26 +0200, Tommaso Merciai wrote:
> Remove redundant pm_runtime_resume_and_get() and pm_runtime_put() calls
> from the reset assert, deassert, and status paths.

These calls are only made redundant by this patch.

> These paths do not require runtime PM handling, as power management is
> already taken care of during probe and remove.

Only since you removed the pm_runtime_put() in
rzv2h_usb2phy_reset_probe(). It feels like the important part of this
patch is actually the side note:

> Additionally, the IP is active only when its clock is enabled.
> Previously, the clock was being turned off immediately after register
> configuration, which is incorrect. The code may have appeared to work
> if another module had incremented the clock usage count, but this
> behavior is unreliable.

So this is a reliability fix first and foremost?
The IP must be active to reliably keep reset lines at the configured
level?

If so, please make this clear in the commit subject and description.

regards
Philipp

