Return-Path: <linux-renesas-soc+bounces-12648-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3510A2092B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 12:00:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 059261646DF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 11:00:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D23C199935;
	Tue, 28 Jan 2025 11:00:15 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58833189919
	for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Jan 2025 11:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738062015; cv=none; b=S89UJljFue2RKrS6MvbEMH+vxTPHrk9QWdjJd9LMGgOnU2MesIbpmxUpK3lT0J7zVmRUNmcX4JwdKjLh71Y/1GKpHDmDFQApXH+HMXhzmDTSMaPtsjPXAB9/Kx7rNhZkZ3J+qa0ryJ+YUznR6WW4XEvtbW6YwImZDpW2PbQNEVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738062015; c=relaxed/simple;
	bh=yMJF5025C7DGIvTthmaWR4oNhnEgmK/flmnxSQ94uFA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=b0OqpgPujwj2kI7Fl4MSk5WOHeYy0NQ44BPBYvOhBak+nb9KcG29Il5e3ZzmBxW0VdNu9aCa3erbLrv09QoNrFGJYz9MNTu+kjoUkF2qL8tTp5Ipq+5iEFhzf6XU75D1K3rpF9XW/SAyVjzA7Uw/GSOLvxwwP6rKizHUuZyUgA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tcjKD-0000OX-Sl; Tue, 28 Jan 2025 12:00:09 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tcjKD-002HRc-2C;
	Tue, 28 Jan 2025 12:00:09 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tcjKD-00046q-1x;
	Tue, 28 Jan 2025 12:00:09 +0100
Message-ID: <9129cb4314783afbda6d52a3ced90ff7729c9024.camel@pengutronix.de>
Subject: Re: [PATCH v3 05/13] irqchip/renesas-rzv2h: Use
 devm_reset_control_get_exclusive_deasserted()
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Biju Das <biju.das.jz@bp.renesas.com>, Thomas Gleixner
 <tglx@linutronix.de>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das
 <biju.das.au@gmail.com>,  linux-renesas-soc@vger.kernel.org, Tommaso
 Merciai <tommaso.merciai.xr@bp.renesas.com>
Date: Tue, 28 Jan 2025 12:00:09 +0100
In-Reply-To: <20250128104714.80807-6-biju.das.jz@bp.renesas.com>
References: <20250128104714.80807-1-biju.das.jz@bp.renesas.com>
	 <20250128104714.80807-6-biju.das.jz@bp.renesas.com>
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
> Use devm_reset_control_get_exclusive_deasserted() to simplify
> rzv2h_icu_init().
>=20
> Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

