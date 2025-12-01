Return-Path: <linux-renesas-soc+bounces-25479-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55435C98342
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 01 Dec 2025 17:16:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 140FC3A2747
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Dec 2025 16:16:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0CA91E5B60;
	Mon,  1 Dec 2025 16:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eQvC5z7u"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C81787E110
	for <linux-renesas-soc@vger.kernel.org>; Mon,  1 Dec 2025 16:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764605774; cv=none; b=h7hVDfgoZ5A+pt5zOgJC0Au27BQB1PUZFakD0YFxZx0b/FZCc2sNGK8w9Iwwhn1pmkSTyeJORcc4Lb01vYGLYqQ2XyOkvnWkiNDdL3ZDVGIDK63zG93f81noHLkBOubFhnVhLjZNvZ6mc/jrrpO1V2xCuZA5J4/022fCWX/zNGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764605774; c=relaxed/simple;
	bh=nAo7+l8wCFAaFzIzx43qISSVJ7YSWKcFCq7hsq/mSac=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=T49+2SuuE2Q0GOGUsIRs022HLbbHL9Ne2J+ZDWJ5waZTECC41EOLuSc6hOE6zqmyTX5rVFSz86ExQWfGAbJk6ogiAGZT99cqya+K1goJi0G4PwZ9gwjllJ5c3fiEnvfRGagU067aooEKg3U3TF51CfAL9EjYuVAdGnYwEdKhMso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eQvC5z7u; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19D03C116C6;
	Mon,  1 Dec 2025 16:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764605774;
	bh=nAo7+l8wCFAaFzIzx43qISSVJ7YSWKcFCq7hsq/mSac=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=eQvC5z7uHyvBUckhMRZfaV95EZYUhZi8E80nSbWVtaoZUa2ORBctCzJcOlDkNHT6Q
	 VX77oY4COiz9QqAsDlsq9nB2kucu+bJ5Px/CrhJgDs+2kH/0v8shPCej9K/ffQTGV+
	 ZyZaqbazpYsMNLISh/d3QYOOiuQFT11KBvMyC9y6JgmcGxD53oY1H/6WFO+FyG37jm
	 2d6/BOdrFCz0BL3a+4O1GvtdpMUvzAy2H84J2stDHwBIgevbbpP6Z6VyPCD8DDhtY0
	 JKL04ZpoaK+AZZ4j9OVsXcMKw4tWNyOc4A6nrS3DqxlSoH21kETxoJ7lb3GYOiB8OT
	 6Bg0+y0ptXAvg==
Message-ID: <3073f5ced0bb51db0b9fc52b048b26d4@kernel.org>
Date: Mon, 01 Dec 2025 16:16:11 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Linus Walleij" <linusw@kernel.org>
Subject: Re: [PATCH v5 2/3] drm/mcde: Create custom commit tail
In-Reply-To: <20251130-mcde-drm-regression-thirdfix-v5-2-aed71a32981d@kernel.org>
References: <20251130-mcde-drm-regression-thirdfix-v5-2-aed71a32981d@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, "Aradhya
 Bhatia" <a-bhatia1@ti.com>, "David Airlie" <airlied@gmail.com>, "Dmitry
 Baryshkov" <lumag@kernel.org>, "Geert Uytterhoeven" <geert+renesas@glider.be>, "Kieran
 Bingham" <kieran.bingham+renesas@ideasonboard.com>, "Laurent Pinchart" <laurent.pinchart+renesas@ideasonboard.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Magnus Damm" <magnus.damm@gmail.com>, "Marek
 Vasut" <marek.vasut+renesas@mailbox.org>, "Maxime Ripard" <mripard@kernel.org>, "Simona
 Vetter" <simona@ffwll.ch>, "Thomas Zimmermann" <tzimmermann@suse.de>, "Tomi
 Valkeinen" <tomi.valkeinen+renesas@ideasonboard.com>, "Tomi Valkeinen" <tomi.valkeinen@ideasonboard.com>
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

On Sun, 30 Nov 2025 13:11:18 +0100, Linus Walleij wrote:
> commit c9b1150a68d9362a0827609fc0dc1664c0d8bfe1
> "drm/atomic-helper: Re-order bridge chain pre-enable and post-disable"
> caused a series of regressions in all panels that send
> DSI commands in their .prepare() and .unprepare()
> callbacks when used with MCDE.
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

