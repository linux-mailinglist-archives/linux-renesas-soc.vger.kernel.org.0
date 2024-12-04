Return-Path: <linux-renesas-soc+bounces-10881-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2F69E30C3
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Dec 2024 02:30:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 552BD28133B
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Dec 2024 01:30:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F10B944F;
	Wed,  4 Dec 2024 01:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kpzq0TBh"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 667032114;
	Wed,  4 Dec 2024 01:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733275829; cv=none; b=TQia6b6vsU/kw6fzvikfzWIowUzeHC2uF7AaRk9AYoaTTzalkhmZErX1ukJzhNB9ZupQ3jhCjkrIBJSFfVdcELIC5kOx2FazxFi5y+k5m7w1CURGRfzjCSeVXCMsrud7OUhNfVT7F9QOwpx/FQ9sdqIR7etMEjsqHuJP1N4Wiqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733275829; c=relaxed/simple;
	bh=/83tPbbbPTghXUvynfbpBu9sxX/c501kshFOT2bS2vQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qhKtyyRE/qu2BWg9JqbBnsDs3pBFlllk7wHdD4fyL12qZusgb+fnly7wCvXYOa3tjfyP6rAJuz/Hp2naY0t2UsLtZ972M+OZawH/eVwoUQI5StMdUoKvh7h0Wr57fIQqvwfYZ3C9zGdIb1xbrP5kNPzrh7jdIYZuQ3D6CACrMFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kpzq0TBh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6396CC4CEDC;
	Wed,  4 Dec 2024 01:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733275827;
	bh=/83tPbbbPTghXUvynfbpBu9sxX/c501kshFOT2bS2vQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Kpzq0TBhFt5SlCHtpVWWbCWbDfBQxZEe8pG5u+Xvn1V08OzOoi57J3Ho0W1Wk2mEi
	 5WuWa2KYgvoHmWnay7uQbBJPfLEpo9w32pNwd9Wm6N+0pCJkZ0OjkPrRh3qqwdOIAb
	 J3fUMvmQg6jwmGUm4997o+0poM95Y+c2K7J2tiWCmKyAhyPHr92HVCp1Vgq1d+x7Vb
	 WoJun6yNPGOB5k7sVrTiJubpbcVIntu1YPd71hME/m6J+u4KrUsYpYjfCwHLKbYop7
	 SsfDtNEASZsCYzbrbgtCbDNCaj+ErbwLalja9PyOGZQ6TIK3bDaTHBj4wdWHptICt5
	 LvSJrV41NKPZw==
Date: Tue, 3 Dec 2024 17:30:26 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>, Rosen Penev
 <rosenp@gmail.com>, netdev@vger.kernel.org, Kurt Kanzenbach
 <kurt@linutronix.de>, Vladimir Oltean <olteanv@gmail.com>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo
 Abeni <pabeni@redhat.com>, Chris Snook <chris.snook@gmail.com>, Marcin
 Wojtas <marcin.s.wojtas@gmail.com>, Yoshihiro Shimoda
 <yoshihiro.shimoda.uh@renesas.com>, Niklas =?UTF-8?B?U8O2ZGVybHVuZA==?=
 <niklas.soderlund@ragnatech.se>, Richard Cochran
 <richardcochran@gmail.com>, open list <linux-kernel@vger.kernel.org>, "open
 list:RENESAS ETHERNET SWITCH DRIVER" <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCHv4 net-next] net: modernize ioremap in probe
Message-ID: <20241203173026.1f0a6b46@kernel.org>
In-Reply-To: <09215f37-883b-4627-8f37-04a2a5ef8ae2@lunn.ch>
References: <20241203222750.153272-1-rosenp@gmail.com>
	<Z0-LgWETqKZe2uyV@shell.armlinux.org.uk>
	<09215f37-883b-4627-8f37-04a2a5ef8ae2@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 4 Dec 2024 00:43:13 +0100 Andrew Lunn wrote:
> If you have the hardware, and wont to work on the driver to add new
> features, then yes, you can do this sort of conversion, because you
> should find your own bugs via testing. If you don't have the hardware,
> please just leave it alone.

Which I'm pretty sure I already told Rosen :/

One more complaint. The 15 patch limit is meant as a throttling
mechanism, please do not have more than 15 outstanding patches
at a time.

I hope all the replies you got on this patch give you a clear enough
idea on how valuable the maintainers find this sort of work.

