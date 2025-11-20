Return-Path: <linux-renesas-soc+bounces-24895-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC9FC7593B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Nov 2025 18:13:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id D07C82BF74
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Nov 2025 17:13:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A91013A1D04;
	Thu, 20 Nov 2025 17:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LwJHItmx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 828763A1CFA
	for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Nov 2025 17:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763658704; cv=none; b=M4Q6PpjHkJEfDZ4rrq6USaVPrPS3mQ4g7CaOEZwNWZXWJxqqoNYd8HQg7quIb5l36Mvyv+OM5cLmUuBBswBAlmzgvNZwo6tTB2a05wF0BBX9evYFLmwKdck6S0HL7qs2GuIXP79OfM2hrm6p9w4oJ/EMzN9xOlvkkLjt1nvbGFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763658704; c=relaxed/simple;
	bh=81mEL0swadpIT7Hv/NcLwxVrDCioPcum/sVlYlnkrCk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=cyxAdTImrItQF2ByfpueBgdB/aOHVOS/A1CeUApe3KTqc4Exn4ksgQ+iCrrRBs6YpJ5ibKYdzoZiZteDsrl8YQHd5IM4pUZZwPuYHz7x7URg6Yw60E4a06qqUwlTLhoYNX1XVOlQol8QjpKRYYJ3wiWO3FMyAO1KKB6+zfCoiZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LwJHItmx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77512C116D0;
	Thu, 20 Nov 2025 17:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763658704;
	bh=81mEL0swadpIT7Hv/NcLwxVrDCioPcum/sVlYlnkrCk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=LwJHItmxjWZpJBn3ssR4oEXN6hk2AnphFn+Ksjb12U3qL/mhLRWSJHhR3cEjMGhv6
	 +WhZJ9HsEKgnqurWhmhxo6h5ubBPz9d2JZZr9qxnnL1IsPq3vypy7W2+oqKfMwL3+l
	 uWHS0EoykpzXEY1jopsN77IGF/loEqpJ4pWkdFvOCF3nNLEhkkuCFhwJqHzzknQG+o
	 1Fvo0R0mkyMyvVnAIndsIh+deaJDmF8i6ZIqi/Su/0semTbxiC0ikEPlOgWFQWWLkx
	 FGmyr/ta7Zk3EqOYQekWznJuW4icWkMEhmqc0M/U2xYUQve6me72oUSmuv+3fOuhwy
	 1LaIBLbWwOuqQ==
From: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-phy@lists.infradead.org, linux-renesas-soc@vger.kernel.org
In-Reply-To: <a8807dafa87fcc3abcafd34a1895e4c722c39793.1758719985.git.geert+renesas@glider.be>
References: <a8807dafa87fcc3abcafd34a1895e4c722c39793.1758719985.git.geert+renesas@glider.be>
Subject: Re: [PATCH] phy: renesas: Remove unneeded semicolons
Message-Id: <176365870211.207696.162192602584477873.b4-ty@kernel.org>
Date: Thu, 20 Nov 2025 22:41:42 +0530
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Wed, 24 Sep 2025 15:20:31 +0200, Geert Uytterhoeven wrote:
> Semicolons after end of function braces are not needed, remove them.
> 
> 

Applied, thanks!

[1/1] phy: renesas: Remove unneeded semicolons
      commit: ec5814578e3c36289c4992c466ae297e0b799c18

Best regards,
-- 
~Vinod



