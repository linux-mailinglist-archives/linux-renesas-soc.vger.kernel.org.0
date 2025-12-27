Return-Path: <linux-renesas-soc+bounces-26131-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8838CCDFC57
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 27 Dec 2025 13:56:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9A056300059F
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 27 Dec 2025 12:56:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4739A2D131D;
	Sat, 27 Dec 2025 12:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jGQk+zaN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1827C1DF970;
	Sat, 27 Dec 2025 12:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766840184; cv=none; b=RkUreMvwMX1nYVbtbjv1S4ykt2BO/FbbPvMxCWdmC66ORXHnoQfYlMMUmIisL9LxEJfFHoD7mbcguiPMr8puYOnkXkKiXZxyO8buddtEMLB4J4b9X23WN6TAACWmcZ5GVJM2bVgGh5J0EK1vsvLzcCPiuJAllPXu7yu+TFLrorQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766840184; c=relaxed/simple;
	bh=yoryvVFcSaKexiO8jB8y7NvnyLqka1Dt5kyz1yP69as=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PLVUhlg/jD0f0zi3Prg8H7i2YUX/k1aOeR9nrddA257ZwPxc6BLaJj23hgrlwVBqktQTW7uukttT0myIBQFErVXmMGViu7ypmGxbT3Kh4esL98IYYzshdbJ3v9OmKbuzw3BkLUP2M+u+nUw/4blhcLHJBnlHg4KPmwcaZPqo0mE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jGQk+zaN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16EFAC4CEF1;
	Sat, 27 Dec 2025 12:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766840183;
	bh=yoryvVFcSaKexiO8jB8y7NvnyLqka1Dt5kyz1yP69as=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jGQk+zaNq9pB8MioDbSeO7Qbk76gyiUpv9hHPQHl/OQt4Cv4z6HGvJsEafbbS2hE/
	 eLzpKfLNCieNDAI2w+DPwAL+F9S5pU5jYRfAIXCVSu95eHDSjjr98ViqXAoLRZZH83
	 GJlj9rDTwU0nzFemzY+i+VQ5EAgAF5L9tPyPMaLuody6rSZ9rAY8yDfIc5XgRP6UEs
	 eW+TBZXFyxsVEB7dAq6gsdE0RsAzhTuJbi+roqEb2Pz9ijMC00Qjx69oEfw76Wlwoc
	 Rz6cVNXaIniZCFGWisZ/212w603/JUuArVhUg8QvUMyTgpgO/syyTbrPQZDq6iF/DA
	 5aCT0rUOFx6Uw==
Date: Sat, 27 Dec 2025 13:56:21 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>, Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: interrupt-controller:
 renesas,r9a09g077-icu: Fix reg size in example
Message-ID: <20251227-bold-herring-of-serendipity-ddbcc4@quoll>
References: <04fde8ed8301126e1781cf21bf10302b274dd582.1766409087.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <04fde8ed8301126e1781cf21bf10302b274dd582.1766409087.git.geert+renesas@glider.be>

On Mon, Dec 22, 2025 at 02:12:54PM +0100, Geert Uytterhoeven wrote:
> According to Figure 5.1 ("Unified memory map"), the safety register
> block is 64 KiB large, just like the non-safety register block.
> 
> Fixes: a6568d82091d279c ("dt-bindings: interrupt-controller: Document RZ/{T2H,N2H} ICU")

That's just example, so nothing really to fix. It can contain incorrect
values.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


