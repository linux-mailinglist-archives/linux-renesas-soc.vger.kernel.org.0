Return-Path: <linux-renesas-soc+bounces-22742-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E3DBC1029
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Oct 2025 12:27:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 847FF3A570D
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Oct 2025 10:27:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61F8C258CF2;
	Tue,  7 Oct 2025 10:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="JnRMLyg7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB8E199FB0
	for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Oct 2025 10:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759832841; cv=none; b=GlEVgDrhOn/bEDruxb9VFNFVmSXJFCaftUvpnOX4fbR3k3kytm/e7ep0GDjVgJj6CQiTgOuiq3JYGqD62bXwdKLuMsdkAgx1h/pr3ouZNeSce4vwNXBJgn+yv+D6Miisd1wnZTpEAjDT/6rZPcA3AwTG/FFEjMQOfXR9wKepXEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759832841; c=relaxed/simple;
	bh=bybOwq1QPP6LQMTMiq5fBi6MKDntDEGoCa+9MTz8ar4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K8upS+ZrOfSs9UIGSx2oXk69HA7JMd37rMXg9JWSX1NSYd1yUT9oe7SlWtHCcdhPPN9IdB36m+L7c3i8KxEVaxpd1b2ytGyy3iwUVbJ6V546AEIyypGnbNjJCobZ8rINB9Sjhb2N0Hve+k5o7D5TTTgwhdrBx6FVKozUE0Bkcl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=JnRMLyg7; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Ma7X
	xmUzkfa2Jk15P47t5PgvIpukZD4s2/DyIVuA0k8=; b=JnRMLyg7ryRV4b8MAvMh
	SRCrNvF80NdZaABB50HAeXwZ4kqrfgQVqK/NFekXlem2D/e64D5gk1W2MBFHuHER
	eTRd7NggpUjmdY5q5I59Cekmpuu4g7rBM4rBBUEOsvm8uOP2c6+oMV+zH6SS426X
	LNHYuRV7DI6czLcN5Lp55Hhf5mltmpmIKaEQ5IGz09ln9Nk8mGAAil9+BGhP21C6
	yLpdCpzO1aLwqLx3Fq4u83nj+STSrQwjJOC5h0q4HKn6bFA+3GKlPa95sTVGY+v9
	4HhEzFYbWQFE7+xVdhGS8c4Ar0R18FmquQAV0Z20q/M6/OWc+q66yM3oQEcJp7ST
	oA==
Received: (qmail 223477 invoked from network); 7 Oct 2025 12:27:07 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 7 Oct 2025 12:27:07 +0200
X-UD-Smtp-Session: l3s3148p1@vgCEAo9AIK8ujntU
Date: Tue, 7 Oct 2025 12:27:05 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: renesas: v3msk: Enable watchdog timer
Message-ID: <aOTq-bD_9ofjo3_t@shikoro>
References: <e30fb396d73307f2538a638cdda06ca58a1a4e60.1759830182.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e30fb396d73307f2538a638cdda06ca58a1a4e60.1759830182.git.geert+renesas@glider.be>

On Tue, Oct 07, 2025 at 11:45:16AM +0200, Geert Uytterhoeven wrote:
> Enable the watchdog timer on the R-Car V3M Starter Kit board.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


