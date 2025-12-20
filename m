Return-Path: <linux-renesas-soc+bounces-25964-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE9ECD3613
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 20 Dec 2025 20:25:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EDD00300A374
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 20 Dec 2025 19:25:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EB6430C603;
	Sat, 20 Dec 2025 19:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Jj64k9pz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 221D22EFDBA
	for <linux-renesas-soc@vger.kernel.org>; Sat, 20 Dec 2025 19:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766258701; cv=none; b=JYxinYgcDaOL0rA0XOcqKF7ckaTPOXJqgCI+w7mUxMpxVJNgfhnssUC+V2zT+T3vz0inYsq60Mpto0HsdcAniURIBVedel7SrRmroW/cRAMrt8uuBfCzfZ46TAMWA1nP02fVBs9flijEXIZ8EYw3ZS9irHoLF5NCXWL92RkKyvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766258701; c=relaxed/simple;
	bh=qVp2+mWBxzuU/FDV5kWYnu9qcia2eqzsX5hrcUNMGzo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W81Q60TpEVE8YpZzfEzr1g4thQrffslHFVMB0jb9/G+KA5pOjrRZn6Gg2cQTOCtBfC43pWen1fOFg5waB7S624tK1vwj920cVikyTVM+bC7OOnwKe4kc9Apehgf6qZZBj0fIFTi6BRaB5dEzBXXjna8lh8zTxUykjMLnIkoXmcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Jj64k9pz; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=dnT1
	LhAyVtqrUEmWipFHKfL/LLTql2Rg7FUq04Nl+Rs=; b=Jj64k9pziHjykH4xvBNB
	z3kQ3k4aMzQkzva6eEP7948vTFSOXvU5ILvMIj/XCTgpo3kbaaySFhs74K80kVAO
	HGX6G+RSKEk27ljAoyaNNlQTIJQJRKLrf2k6ZJFFwe6FjCevO4lErWOOFLnhuyHv
	9X0qrkrWAGDK+nocBH9cAX3g+Io5siX2JQJYDj2JcnOgM8rT/YrrxZhEUeubljIs
	Q9X0U+l0nisWHZxnMQbG0ki/2i1kVIoY7L3MD1H+M2MuJyImiWPwTa0GtngUK/l5
	pj4cdK64hMFHMPU6kUH64AMD9yqNrTqWijXu31FfLgmAcJNWs+MpwFFVOxISG2P2
	iQ==
Received: (qmail 3183234 invoked from network); 20 Dec 2025 20:24:50 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Dec 2025 20:24:50 +0100
X-UD-Smtp-Session: l3s3148p1@v8zIJWdGaL8ujnvT
Date: Sat, 20 Dec 2025 20:24:49 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Nicolas Ferre <nicolas.ferre@microchip.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: dts: microchip: Drop usb_a9g20-dab-mmx.dtsi
Message-ID: <aUb4AfDf8Ouh6vtD@shikoro>
References: <20251212203226.458694-8-robh@kernel.org>
 <aTytWyyZiYFnyauo@shikoro>
 <20251213010934353f1efe@mail.local>
 <0ec01064-2755-401a-b2c8-76ad6ce686af@microchip.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0ec01064-2755-401a-b2c8-76ad6ce686af@microchip.com>


> > I don't think this will be missed by anyone. Unless you actually have
> > one of the boards, I would simply drop this.
> 
> +1

Okay, then


