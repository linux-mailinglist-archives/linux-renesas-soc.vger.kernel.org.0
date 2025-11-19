Return-Path: <linux-renesas-soc+bounces-24861-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7001AC7131A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Nov 2025 22:52:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5CE134E17A1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Nov 2025 21:51:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCCD2306489;
	Wed, 19 Nov 2025 21:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y1j8K/Th"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F2A02F5A25;
	Wed, 19 Nov 2025 21:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763589116; cv=none; b=Qq/l93fwQwYRER7nboqlcJ5a8bX9uCej0EgTOK6GIq8/1ealf8FVG97CaOTYLQYUJmuxhOTabt9uJKMzj1OQfxXZmnz/cLcTyDzLZI8I5VR2P9eCFfhTJxZUWz0i5+9cptOk358g52jsZR4p1v7iivKxDWf+cV51BwoXhQRUxVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763589116; c=relaxed/simple;
	bh=nwi+ZvFeDSI2K72amAnDtVwqMnAIb0w5EqXwQ4IVpAI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ccOBSQN/0xOwAMekV4wC7vX1KLMD2Wilhs0b8EQSIvnVvwd8evfvr6lt3TL4T2WK/aMtxn5Q/cnWW0Pzq12LBFyb5p+gJqOZz8U/EMw5YkNi02wzPsJa4n9ZZA0cKuWF11mPB9IpD+HZ+Bo7JIoo89EgyqPBuUXVeGhLWyZT5NQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y1j8K/Th; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 122B7C4CEF5;
	Wed, 19 Nov 2025 21:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763589116;
	bh=nwi+ZvFeDSI2K72amAnDtVwqMnAIb0w5EqXwQ4IVpAI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y1j8K/Thkm7qVc4L5T1qzRf5mvjXoFl6aQpZ9ld0naktl7muueng0UxfJFtohyJXK
	 w+VJNlaLcXcW9yTHawr/YRztaqfB3MiodZA75XSj98MHZQf+b73RFRh+do7C+Va6zo
	 F0aAV9zZKD1Bbpi7OUMi+wlEj8UvIXXWCJmvudqfgd9DQtxh+tFbx+T5ZU4H3NpqkY
	 yFbp41+SswGWScOhhmHrVH09OLel9PuaBw7eRVoSZb/Avir8bFIfB1SjfMGr9nXPLf
	 A3mBTN4qgaZBn0exCLw0BmtcTjnXyUoK45PeiXilZ1LioSXL6OoSVaX0SsXwvfM+IF
	 eWLNS03ZGMdTw==
Date: Wed, 19 Nov 2025 15:51:54 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-samsung-soc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org, Mark Brown <broonie@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH] of/irq: Handle explicit interrupt parent
Message-ID: <176358911083.3363410.10556334198340567279.robh@kernel.org>
References: <e89669c9b3a4fbac4a972ffadcbe00fddb365472.1763557994.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e89669c9b3a4fbac4a972ffadcbe00fddb365472.1763557994.git.geert+renesas@glider.be>


On Wed, 19 Nov 2025 14:19:11 +0100, Geert Uytterhoeven wrote:
> If an interrupt controller is used as a proxy, it may have an
> "interrupt-parent" property, but lack "interrupts" and
> "interrupts-extended" properties.  In that case, the "interrupt-parent"
> property in the interrupt controller node is ignored, causing the
> interrupt controller to fail to probe, and leading to system boot
> failures or crashes.
> 
> Fix this by also considering an explicit "interrupt-parent" property in
> the interrupt controller node itself.
> 
> Fixes: 1b1f04d8271e7ba7 ("of/irq: Ignore interrupt parent for nodes without interrupts")
> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Closes: https://lore.kernel.org/20251118115037.1866871-1-m.szyprowski@samsung.com
> Reported-by: Mark Brown <broonie@kernel.org>
> Closes: https://lore.kernel.org/b037f67a-b241-4689-9914-57ff578c1454@sirena.org.uk
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/of/irq.c | 2 ++
>  1 file changed, 2 insertions(+)
> 

Applied, thanks!


