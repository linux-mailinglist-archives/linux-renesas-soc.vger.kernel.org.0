Return-Path: <linux-renesas-soc+bounces-6642-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CB75791284D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Jun 2024 16:46:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0A2FD1C20AED
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Jun 2024 14:46:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E437531A83;
	Fri, 21 Jun 2024 14:45:56 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A51C2940F
	for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Jun 2024 14:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718981156; cv=none; b=mm+hU/DWumSahXDUZEIK84z4WLU3MHeakivTjeN0qtdmJRaDCX1jJj6FV3jRdMBq4D6DjAcOw3hoedawy4uR3Iy0uPxkXqF2N7qZgL4XTUZ91rCXfVgIGjXpXHIfVWNgtNNf7OCLR5ZinSdcZPC9ql44zYvrvEhOcqR9IizPIP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718981156; c=relaxed/simple;
	bh=GpcbuXG4mnciWLS2XVUvuRQmXJMUvJfZpqVFGsVxA0E=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XmBlztMxYIt38O3QmJSC7ghfyKq7xTvQXx+PyfkNDsQWrOZ80EZMz0fXB5EQEmzmykoWPVKiZ/8TIhCMmRSP+tWxv40giIVIV5shTzeRRB4q8VVSg8uJhoSaCwlq1ZtC6CCnD+c0e2/eGZOQREjs0tx4GE49WI/iKGxw2gRxGGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1sKfWT-0004bq-0a; Fri, 21 Jun 2024 16:45:53 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1sKfWS-003xr4-8d; Fri, 21 Jun 2024 16:45:52 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1sKfWS-000EHY-0f;
	Fri, 21 Jun 2024 16:45:52 +0200
Message-ID: <75b1798fbef0f941a7c58b91583d62dff6384671.camel@pengutronix.de>
Subject: Re: [RFC PATCH] reset: Add devm_reset_control_deassert helper
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Prabhakar <prabhakar.csengg@gmail.com>, Geert Uytterhoeven
	 <geert+renesas@glider.be>
Cc: linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>
Date: Fri, 21 Jun 2024 16:45:52 +0200
In-Reply-To: <20240418132602.509313-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: 
	<20240418132602.509313-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Hi,

On Do, 2024-04-18 at 14:26 +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> A typical code pattern for reset_control_deassert() call is to call it in
> the _probe function and to call reset_control_assert() both from _probe
> error path and from _remove function.
>=20
> Add helper function to replace this bolierplate piece of code. Calling
> devm_reset_control_deassert() removes the need for calling
> reset_control_assert() both in the probe()'s error path and in the
> remove() function.
>=20
> Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

I'm not sure this aligns well with the intended use of devres for
resource acquisition and release.

Note how there is no devm_clk_prepare_enable, devm_regulator_enable,
devm_gpiod_set_value_cansleep, or devm_pwm_enable either.

I've sent an alternative suggestion that adds
devm_reset_control_get..._deasserted calls, similarly to the existing
devm_clk_get..._enabled calls. Please let me know what you think.

regards
Philipp

