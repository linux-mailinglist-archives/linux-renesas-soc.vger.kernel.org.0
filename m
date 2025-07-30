Return-Path: <linux-renesas-soc+bounces-19785-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F9BB16339
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Jul 2025 16:54:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A9D957A3EAD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Jul 2025 14:52:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C9672DBF45;
	Wed, 30 Jul 2025 14:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="k3/IZMwH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D939B2DC320
	for <linux-renesas-soc@vger.kernel.org>; Wed, 30 Jul 2025 14:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753887259; cv=none; b=cyqZT//yNyzTtLPfsPk77TFWXryFtZE6jhzPmNQNUcR4IW9TTNC+FQmouwo8LrON7YEu459t6UontOcst9jUthn17oQcL29HKpeswVZ7rF191MJHVMoXRF8AJntoqTP1dzMsXEUbrWgJs9mtEQXUSwlHIIF3PVRUTcBVJMYPBEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753887259; c=relaxed/simple;
	bh=ie+RIG1rJYm4GmXC8JjeZKFDJPovwpXR3vjbC4sifHU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XqhdmDJGc/FPLqwHDMgjoAJviBbRKzuRI+XhG1j0CshjzeL4YGWFoYhQ08ksH/d3e3/QPMAXUL7U/PDQtlMGQkEVHX/j7KQb+7y2ABHnBjFdcm2GaX7tZraQOqhbq8TQG3R3KdV2Cxa72J51SdoU3zhFnqF8ccewT2qizRKKe0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=k3/IZMwH; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=ie+R
	IG1rJYm4GmXC8JjeZKFDJPovwpXR3vjbC4sifHU=; b=k3/IZMwHuOeVahgnAUu3
	vKGJIsEkUiEf2hNu18PmR2tKdfNsrxv1TcfC/S69NHlxnqJvQo5If+rPkfAaloRJ
	8172ZavzDWHQ0k4uKjZ8xIAV8wCem4OvcEtcSwqaKL2oUpfwDmYUQKaXb6M7noGE
	lTiDjcE1xynJGkZ31TNCfeUnyCZjIgtaFrZ4T7bKch6YzoT+Q0yYXDj4O7uAdyzj
	+spw4hAnmtm+POL/tA0fc08wRD2rwb/Yio59fyX+WbzLI9NHEenPQBb0vVAYx7zd
	Jvc7FbKdKjFzgJbHG5yibH4TS8OZIXd0J/ZLIq49LWD+RBuXMT1xUoWvzD9Zb5Cp
	FA==
Received: (qmail 19156 invoked from network); 30 Jul 2025 16:54:09 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 30 Jul 2025 16:54:09 +0200
X-UD-Smtp-Session: l3s3148p1@M+RwsiY79lBtKPC7
Date: Wed, 30 Jul 2025 16:54:08 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Frank Li <Frank.Li@nxp.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Magnus Damm <magnus.damm@gmail.com>, linux-i3c@lists.infradead.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v5 4/4] i3c: master: Add basic driver for the Renesas I3C
 controller
Message-ID: <aIoyEKpB7twvKDGN@shikoro>
References: <20250724094146.6443-1-wsa+renesas@sang-engineering.com>
 <20250724094146.6443-5-wsa+renesas@sang-engineering.com>
 <CAMuHMdX5BfNm1GJ8UyqftcVc07p1aodXuVHxNaYWDYLHaxzXMw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdX5BfNm1GJ8UyqftcVc07p1aodXuVHxNaYWDYLHaxzXMw@mail.gmail.com>


> Why not use readl() and writel() directly?
> To make it easier to add debug prints during initial development?

Yes. And ultimately, there is a patch in the works converting the driver
to MMIO regmap to get rid of _all_ the helpers. I couldn't make this in
time for the 6.17 mergewindow, though, because of... gory details.


