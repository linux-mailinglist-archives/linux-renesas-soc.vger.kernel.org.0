Return-Path: <linux-renesas-soc+bounces-23906-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EABDC2022B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Oct 2025 14:01:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 83308466F9D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Oct 2025 12:55:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3573C2C0F8E;
	Thu, 30 Oct 2025 12:55:12 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B377B3E1
	for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Oct 2025 12:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761828912; cv=none; b=kcKZhRKO7Si9nHuCyKCncHpvtM7NzOmUy//AUdioMhYYS/CnsjikQR5s284TQIchG6w2ZBRC8T0SO6HmKqhrZFScivQxOLhEEUMs7Yds8fngofXvMmgn0biIj4eAamo6gK7TLNsA6ykPHRtu4EM88VyFW/qdhnrg2Ar8l7BVNSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761828912; c=relaxed/simple;
	bh=9iSAiY/NnBbYBJLM+p73opi3Hl9pdaqSwMVuL4F62Jg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=P/9HW2EgdLJ5dHxehXgDwEOuzU0e8bg05FiMlErwwpd2QhtftvvtuIhdkraUVeE8ue1iLrAi98G4h+upP6NKB73Jw2oeZ19iRD0Qp+/XuNdxQOaATaDHZPg11ni6MKRpou2n/n/sOnApkuQNI7DoLtK2B47Yk3kZkW749gGqMkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vESBA-0004h1-BJ; Thu, 30 Oct 2025 13:55:00 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vESB9-006DFT-2D;
	Thu, 30 Oct 2025 13:54:59 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vESB9-000000009CO-2aEz;
	Thu, 30 Oct 2025 13:54:59 +0100
Message-ID: <35f619a73a83207b83de095967014b03b7d3e8f0.camel@pengutronix.de>
Subject: Re: [PATCH v2 1/2] reset: always bail out on missing RESET_GPIO
 driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-renesas-soc@vger.kernel.org
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Krzysztof
 Kozlowski	 <krzysztof.kozlowski@linaro.org>, linux-kernel@vger.kernel.org
Date: Thu, 30 Oct 2025 13:54:59 +0100
In-Reply-To: <20251015205919.12678-5-wsa+renesas@sang-engineering.com>
References: <20251015205919.12678-4-wsa+renesas@sang-engineering.com>
	 <20251015205919.12678-5-wsa+renesas@sang-engineering.com>
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

On Mi, 2025-10-15 at 22:59 +0200, Wolfram Sang wrote:
> Optional GPIOs mean they can be omitted. If they are described, a
> failure in acquiring them still needs to be reported. When the
> RESET_GPIO is not enabled (so the reset core cannot provide its assumed
> fallback), the user should be informed about it. So, not only bail out
> but also give a hint how to fix the situation. This means the check has
> to be moved after ensuring the GPIO is really described.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Patch 1 applied to reset/next, thanks!

[1/2] reset: always bail out on missing RESET_GPIO driver
      https://git.pengutronix.de/cgit/pza/linux/commit/?id=3D25d4d4604d01

regards
Philipp

