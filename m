Return-Path: <linux-renesas-soc+bounces-13114-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A5412A33CEE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Feb 2025 11:47:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3A4A2188AB8F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Feb 2025 10:47:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BD7C212FB4;
	Thu, 13 Feb 2025 10:47:39 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2974207E15
	for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Feb 2025 10:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739443659; cv=none; b=nWfZNK2SZO5dP+5TwRsnoJASskQNb+aRbow65BGbBx9SMRIU9w8mrEaE2jrP/MoLTEWHdLLsNlPRi1RTPC135QSFdby5d8IRRwhFAvUs4O662VdED81hEsRSIlbFg7oATq2KlI5JayKrzuDUe9Xd4X6Srh6BzsAG3kA5uNnSfLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739443659; c=relaxed/simple;
	bh=gb2lywRTuISE8Acijb3xotjXVJzZlSaXWQBshazghYs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iTv4WwBfbP9wHPHDU7BRd0qWi4nOSzEd4oM9pWfQ0Dd3g1Luy7GixLWiX1kk1GqJmq8dMmwjdtWUxwLgwMIaPFrzRhltKnQG+VPBLS2Og0EncuUGpTQGgb2LCdKECLHlvv3ioSTGGaK7HgcwqPHA/xiNlb49mSbcGuvDjCOrfOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tiWki-0003sp-2b; Thu, 13 Feb 2025 11:47:28 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tiWkg-000jie-0j;
	Thu, 13 Feb 2025 11:47:26 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tiWkg-0003g4-0Z;
	Thu, 13 Feb 2025 11:47:26 +0100
Message-ID: <3516a8364bfe64bd24f5330b006b17581150e717.camel@pengutronix.de>
Subject: Re: [PATCH 2/6] irqchip/renesas-rzg2l: Use
 devm_reset_control_get_exclusive_deasserted()
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Thomas Gleixner
	 <tglx@linutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, Lad
 Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org
Date: Thu, 13 Feb 2025 11:47:26 +0100
In-Reply-To: <20250212182034.366167-3-fabrizio.castro.jz@renesas.com>
References: <20250212182034.366167-1-fabrizio.castro.jz@renesas.com>
	 <20250212182034.366167-3-fabrizio.castro.jz@renesas.com>
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

On Mi, 2025-02-12 at 18:20 +0000, Fabrizio Castro wrote:
> Use devm_reset_control_get_exclusive_deasserted() to simplify
> rzg2l_irqc_common_init().
>=20
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

