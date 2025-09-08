Return-Path: <linux-renesas-soc+bounces-21546-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 340F3B48433
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Sep 2025 08:29:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E4938161E87
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Sep 2025 06:29:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C260422652D;
	Mon,  8 Sep 2025 06:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="fb2cqCtr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8784022B5AC
	for <linux-renesas-soc@vger.kernel.org>; Mon,  8 Sep 2025 06:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757312939; cv=none; b=ERF4pDM9MCA1myz8MWlhK3nF2FiBqlSyh47z232iDO2yRi6BmbjABLnovPnFbm8RDHVBmd6giE74yXH30FxEP3awceFga0dEiaMXzwOlAQAsg3dTLpSKMEVLzVDERoRsQLTTwDMoA4nGuA/Fh1GfQ+AVRNSH0HO1r9FAnw/+pFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757312939; c=relaxed/simple;
	bh=pWahPQe3ncDrkbGfM/ciNAME5GrYFfGIlstsm3EOKiA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gd25GiYRBegqWaRjaDl+DPIrOvjBsWwy79q0olXozvCvtF4JuZJk1/MRQ1uD2VgECYCpgR8O5/2NFChmrqaAhNZtcXhHQgdycqCEUbfRR6cswAsqHhNxIe8dxPWGaFAoGm2YG0RlsvUoel7IrFcyWr3tFkCJ349v8r1gLad0+8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=fb2cqCtr; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=KdBJ
	kXBM2f2lxuXdlvTwfecGcxvNtiYK4WzV8kBx/FM=; b=fb2cqCtrCl9j2zohzs14
	5E4+mqsQdMOSJs4yjC1zDQVQ0DZhRH83RvWGrat+wgmXbFMmRzoiq8r/wfsR0QcZ
	pf4xVf70wNtjewYgcKVR6TUaWCxxAzhlcFP6ayr55Vdu+YbrwkGlB/9UdX8PjjRe
	64LuGi2/7zXuDLSd6s17sGupqOAO4feXMjqO3vOMgzJFfFyB3T0NU5mb3oJ9bkT2
	DJIMA2SY1VHQZSHfccuSolfcpxc9khfJFjcnRSIsMsIjLRILh8AhQln8mn8U8WL+
	uQiCPId5FyO7lM1Oc6vyo5FpXuGgSeINUFn9Cm+IDoVnBaMtUtLgOgsaFTgppWss
	dw==
Received: (qmail 716679 invoked from network); 8 Sep 2025 08:28:52 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 8 Sep 2025 08:28:52 +0200
X-UD-Smtp-Session: l3s3148p1@KvEYTUQ+moMgAwDPXyerAKQ7QDbxBzog
Date: Mon, 8 Sep 2025 08:28:52 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: renesas: r8a779g3: Rework fan hwmon comment
 on Retronix R-Car V4H Sparrow Hawk fan DTO
Message-ID: <aL53pOVpdaR2YcVX@shikoro>
References: <20250907225338.426253-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250907225338.426253-1-marek.vasut+renesas@mailbox.org>

On Mon, Sep 08, 2025 at 12:53:05AM +0200, Marek Vasut wrote:
> Reword fan DT overlay hwmon comment to accurately locate the
> fan control sysfs hwmon node on Retronix R-Car V4H Sparrow Hawk.
> No functional change.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

I also double-checked that the paths work with both overlays (which they
do). Dunno if that is worth a tag. But in case it is:

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


