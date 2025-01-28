Return-Path: <linux-renesas-soc+bounces-12649-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7CCA2092C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 12:00:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A0A4F7A10E6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 11:00:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 552FD290F;
	Tue, 28 Jan 2025 11:00:19 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6950EED6
	for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Jan 2025 11:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738062019; cv=none; b=ZMi0LlNAJpQQ8m/1w4X4Iq2nuZPDVSqFZ9YYd/IRHqHIvt74tg1PF55uWJzKF5tEEpcZZtx+JWv/m4mU+M9me1o5yZTu3Qqde+xxUDt5kqm6hphwFvlSTID6rxFaM9cybhwdPtn0TkTU7cGmP9yAee5QSeC4DkMsJrjAzSg55Cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738062019; c=relaxed/simple;
	bh=yy4wsiqIQD2f+3DBnbiA/ChjrdFqF449oe0R4OaMoyI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=O9llRd5qKApR+P+qjPSx4V/1Ksj1KYTCnbdBJNAJk2EzXB34ZlWY9SAO+C3VYBuEaUsLcIbiFt7whZHMZtYfvYvMHNvtkpjPh8mS7jE/KpK/KLLj3XCMfOnfmgEO/yyng3VNaRQxLgdnigxHi/skkp9GEhpCEgr7InaKzKkaICs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tcjK4-0000M5-8p; Tue, 28 Jan 2025 12:00:00 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tcjK2-002HRY-1e;
	Tue, 28 Jan 2025 11:59:58 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tcjK2-000451-1R;
	Tue, 28 Jan 2025 11:59:58 +0100
Message-ID: <ad3da312589438e47231c51fde9ccccb37dfcb22.camel@pengutronix.de>
Subject: Re: [PATCH v3 04/13] irqchip/renesas-rzv2h: Simplify
 rzv2h_icu_init()
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Biju Das <biju.das.jz@bp.renesas.com>, Thomas Gleixner
 <tglx@linutronix.de>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das
 <biju.das.au@gmail.com>,  linux-renesas-soc@vger.kernel.org
Date: Tue, 28 Jan 2025 11:59:58 +0100
In-Reply-To: <20250128104714.80807-5-biju.das.jz@bp.renesas.com>
References: <20250128104714.80807-1-biju.das.jz@bp.renesas.com>
	 <20250128104714.80807-5-biju.das.jz@bp.renesas.com>
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
> Use devm_add_action_or_reset() for calling put_device in error path
> of rzv2h_icu_init() to simplify the code by using recently added devm_*
> helpers.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

