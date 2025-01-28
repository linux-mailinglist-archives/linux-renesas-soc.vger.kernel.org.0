Return-Path: <linux-renesas-soc+bounces-12650-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23390A20930
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 12:01:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 822DC1646DF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 11:01:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DEF8EED6;
	Tue, 28 Jan 2025 11:01:00 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47D7290F
	for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Jan 2025 11:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738062060; cv=none; b=n8DXgGHYOAQhaXRXg6aR3LAIRvJ/r0Wpx55nV0YbE+vF+fOY2XyvQR9Cs6e7tAK9+XVn1aVLVDg4stYSmcqTdeBkL4pnVYe0kHa7JVn2gBA3aQA/sojtGtnYxd/eIOdTGMgj9L6N3IAXoFlXaVrfZ2E1J0mvwZ0ZfK8NQlUZVQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738062060; c=relaxed/simple;
	bh=pOyrajjz2aceY6ZhkOMg3F5YRI7t9acBPssFuDErsP4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fY0LSitro+nPDHkXHO4TVdtmu+tMlCGxIBE98hqO9gT0VXyfgPpsdlmBPJeqr2AtUrK+QwvvC2C1LHHPJCBzGmYMShkqq8qhwhzfuKF2zqip9f+j/anwpcusp+dTRh4eaXwUscZz5YWEqngv1sJnnYlgG85AJep8ESV5x0ItFhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tcjKt-0000a7-Un; Tue, 28 Jan 2025 12:00:51 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tcjKt-002HRi-2I;
	Tue, 28 Jan 2025 12:00:51 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tcjKt-00048t-26;
	Tue, 28 Jan 2025 12:00:51 +0100
Message-ID: <ef7cf7611072f26c211f2560d190290256b70710.camel@pengutronix.de>
Subject: Re: [PATCH v3 06/13] irqchip/renesas-rzv2h: Use
 devm_pm_runtime_enable()
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Biju Das <biju.das.jz@bp.renesas.com>, Thomas Gleixner
 <tglx@linutronix.de>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das
 <biju.das.au@gmail.com>,  linux-renesas-soc@vger.kernel.org
Date: Tue, 28 Jan 2025 12:00:51 +0100
In-Reply-To: <20250128104714.80807-7-biju.das.jz@bp.renesas.com>
References: <20250128104714.80807-1-biju.das.jz@bp.renesas.com>
	 <20250128104714.80807-7-biju.das.jz@bp.renesas.com>
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

On Di, 2025-01-28 at 10:46 +0000, Biju Das wrote:
> Simplify rzv2h_icu_init() by using devm_pm_runtime_enable().
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

