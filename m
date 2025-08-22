Return-Path: <linux-renesas-soc+bounces-20884-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C90B30A40
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 Aug 2025 02:22:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 05A07B61040
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 Aug 2025 00:20:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CDC54A3E;
	Fri, 22 Aug 2025 00:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e5t1iCEU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB931BC58;
	Fri, 22 Aug 2025 00:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755822138; cv=none; b=H7su1vJcJy5MJiwmKmgl/j2bkhCNTGksPPYAhAVDHz3COa7JpjfOzUnen1GwKmUOKeSSn4Yi9q4rZqhUiqdbyZh3kOyWj8UyQIANbR8JJaUo1Xu9OC1rNM+uzD91tDx74AfQdSgpINCDZvWDZwwHVPCBnwAtOJ0WDiYR6Dp0xPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755822138; c=relaxed/simple;
	bh=UBh6eNBEIOcH2bnJnd8z8Mv/gUsHh6WuQjYoQhi75GU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DXOJ8m08q/gCKG8bCD8d8qUJEnFP68s6B4bgo+Eav5ZQbar0LPxpnejorvsNtYqT8w48mVDMOLMXWKh6PtfheGKAuU1oLipSGDxqgp9N24zSrtEDbRQeYeDCkCc0cDgdfSXW7PZ2OLT1EacRDkEBOUb0Bn6Ns1LgE/yEF9LQisM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e5t1iCEU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D825C4CEEB;
	Fri, 22 Aug 2025 00:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755822136;
	bh=UBh6eNBEIOcH2bnJnd8z8Mv/gUsHh6WuQjYoQhi75GU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=e5t1iCEUcIWft/gdheh6g+KVeqbXPEEdfrtTOx/WY+7j7LhJrsY2uUG2xOsOMGJvD
	 aYAEpmAhwi9loI+sTwWz0lPR8/s1Wnf/9VwBo1ZV9UaTomE9sEHsVMF3EzkKFTHsPF
	 mmwqTGi8k3SC/L5nS3RkUo10YhEjv0Pz1XjVTWIRzCj31zBudgoICoVZ4cVg64b21q
	 d0jxUk9MQmCvMrTccuY3DIhGGKiWiN+nIHeP0uiczNePsj+fAU9OhT9eEH2lWFT9DH
	 tYpi/DCkpn/qmYNoFUjFBOEVdLPUMsU+qh54JSPPbSDwJc1IE7UhhzJ3Tf0arDENb7
	 fa70HPqceu22A==
Date: Thu, 21 Aug 2025 17:22:15 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, Andrew
 Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>, linux-renesas-soc@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Biju Das
 <biju.das.jz@bp.renesas.com>, Fabrizio Castro
 <fabrizio.castro.jz@renesas.com>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, stable@kernel.org
Subject: Re: [PATCH net-next v2] net: pcs: rzn1-miic: Correct MODCTRL
 register offset
Message-ID: <20250821172215.7fb18f5f@kernel.org>
In-Reply-To: <20250820170913.2037049-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250820170913.2037049-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 20 Aug 2025 18:09:13 +0100 Prabhakar wrote:
> Subject: [PATCH net-next v2] net: pcs: rzn1-miic: Correct MODCTRL register offset

Hi Prabhakar!

AFAIU we're waiting for Wolfram to test (hopefully early) next week.
Could you repost in the meantime with [PATCH net v3] as the subject
prefix? If it's a fix it's not -next material.
-- 
pw-bot: cr

