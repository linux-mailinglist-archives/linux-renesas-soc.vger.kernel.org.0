Return-Path: <linux-renesas-soc+bounces-17020-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C86AB48C3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 May 2025 03:20:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 48CF94A0FDE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 May 2025 01:20:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1AB619ABC3;
	Tue, 13 May 2025 01:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D5O1D5fx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF1C317A2E1;
	Tue, 13 May 2025 01:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747099207; cv=none; b=BdAlylGtHm/9juoCUQ9Z2wnyHPEj7TClWaCnkEk2HkHieRh1zOk58MCRd68E6/DoEjQanWj0wN5fFSol82qiRkehsErgj3MNFCK+pbolYCzsKn4xXVrMZ9u954cFCjuRd8mxRoChVfZjczBRLyLIbuJlzotqJavcsXw7nN6wllA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747099207; c=relaxed/simple;
	bh=wbVTTxxBwLmuewk8BKQPc7eO8FMRyCKLF3h3mGYdRC0=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=OdxAy/6yHZg3AXrZnQp+iZEcSNU9rugtnHm+73J8Bn9SqNsOWuekpTXlmvrIlgY78LAonCE/X0RBXfQZnyIog2J1lGCj71IfZw7JpQkOYHIjs3qWPQUQ4gLpjXg5gcWFUlnA/kufpY7k2pMgvHiTicKNSiidF9AnmXJ8JbTmh8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D5O1D5fx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1581CC4CEEF;
	Tue, 13 May 2025 01:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747099207;
	bh=wbVTTxxBwLmuewk8BKQPc7eO8FMRyCKLF3h3mGYdRC0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=D5O1D5fxixblN+NTtrU1yWGg6zQSf7AEn8BwSlDExwdLrl9MYIdUxijuYdSFSmw9/
	 Lo4RcAlCXjqHRhG0roLrXPe9reGfnPqG7PsYl07CAN1XYD7D7rmTQEdPX/POll/RVX
	 dY7sxZhws8ZiCa65UJWQnlrjZ7FZVceMkY0IDwcmBYqLAwP7veDoY+GWpXmWlnRYG/
	 XWReEr2YQz0zJRKvSIomPHErVAhXGzddNehWjXN+Kfa1T+dZsiOboiPOXro4g/3GN1
	 3FPQsr60KJhCmNKwXmWN91W5PQjQ7HLcpyuBUcxWVs/gCiE0OPfWWz7YGpYCsCbOrj
	 JxBUixZsgZcSQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAE0339D60BA;
	Tue, 13 May 2025 01:20:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] dt-bindings: net: renesas-gbeth: Add support for
 RZ/V2N (R9A09G056) SoC
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <174709924449.1134434.17040861965722709401.git-patchwork-notify@kernel.org>
Date: Tue, 13 May 2025 01:20:44 +0000
References: <20250507173551.100280-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250507173551.100280-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Lad@codeaurora.org, Prabhakar <prabhakar.csengg@gmail.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, geert+renesas@glider.be, magnus.damm@gmail.com,
 netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 biju.das.jz@bp.renesas.com, fabrizio.castro.jz@renesas.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed,  7 May 2025 18:35:50 +0100 you wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Document support for the GBETH IP found on the Renesas RZ/V2N (R9A09G056)
> SoC. The GBETH controller on the RZ/V2N SoC is functionally identical to
> the one found on the RZ/V2H(P) (R9A09G057) SoC, so `renesas,rzv2h-gbeth`
> will be used as a fallback compatible.
> 
> [...]

Here is the summary with links:
  - [net-next] dt-bindings: net: renesas-gbeth: Add support for RZ/V2N (R9A09G056) SoC
    https://git.kernel.org/netdev/net-next/c/6b466efc6365

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



