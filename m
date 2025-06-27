Return-Path: <linux-renesas-soc+bounces-18814-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D1205AEABAA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Jun 2025 02:19:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4E2CF4A7B93
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Jun 2025 00:19:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BC72C2EF;
	Fri, 27 Jun 2025 00:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qYDlFCfP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFDB74C9D;
	Fri, 27 Jun 2025 00:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750983589; cv=none; b=V7pGPqnWZRqNKKgT3V2DSUx9w7cY8FS8NVY5oeHbyWB0zYKp/kLD79pLKIxZusxkl9FxzF9dpKJQtVay35dMxr73zEhF24TinD2DC0eP4o5Ne1mY55tOy6zIOydTcUb9pwg8hiGMaprD97SSeZK11AlZBEdd5PCAHtIqX9umq14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750983589; c=relaxed/simple;
	bh=FJpB5qNQ113rhKh1l7zPqYvI91psLHFFSVZ0HmfScTw=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=iKCHBDC1A4fFb0n4ZG+QQK24B9tSwShRkMXBESk9bxp3GS5lc797Vz5TBCHKACYSWIhQswt4tw8cHdbpNHroBELdkZSzzKQVkF3Ul5jlboQRmqRTDNEEdgnZHGqeLIJ+Sp3qRbCI0Hx8G7YOZ5Yz4nZCpfljGiCk2oPgxGnM/bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qYDlFCfP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48407C4CEEB;
	Fri, 27 Jun 2025 00:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750983588;
	bh=FJpB5qNQ113rhKh1l7zPqYvI91psLHFFSVZ0HmfScTw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=qYDlFCfP72vaArFCh3T8JExY/1R/NMaemV6TR5b+hZBZ1HczPRpVQUh8lq5yhhRZR
	 rJr6zWOo3xIslGX1yoBie6Y5T4fvNIdfwo/uIJGBpYtaXhPsObxpEN0foMiuQAP9F6
	 C6FRoFEw/LrYNqPPt4qTivDLBELuuHBfCf33M6artbZyvN3ZESxDyYsgJqoH3LuO4f
	 bFkM0W1W4ASOXV1VQTF4OY7TwX5XLbnLsIJOUbcJA4gDK2qMS0yIcyrwenPhoAAH8f
	 mwkeEOVTrs4wAifUR9uy9QNHQnLsCXyvEQmc1RTqhS8E3kFjflGdmoIq/Yxzz0VMmc
	 dm2ntYtcQ33ww==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE07B3A40FCB;
	Fri, 27 Jun 2025 00:20:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] dt-bindings: net: Rename renesas,r9a09g057-gbeth.yaml
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <175098361450.1380299.7022634624149340809.git-patchwork-notify@kernel.org>
Date: Fri, 27 Jun 2025 00:20:14 +0000
References: 
 <721f6e0e09777e0842ecaca4578bc50c953d2428.1750838954.git.geert+renesas@glider.be>
In-Reply-To: 
 <721f6e0e09777e0842ecaca4578bc50c953d2428.1750838954.git.geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: prabhakar.mahadev-lad.rj@bp.renesas.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 25 Jun 2025 10:10:48 +0200 you wrote:
> The DT bindings file "renesas,r9a09g057-gbeth.yaml" applies to a whole
> family of SoCs, and uses "renesas,rzv2h-gbeth" as a fallback compatible
> value.  Hence rename it to the more generic "renesas,rzv2h-gbeth.yaml".
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  .../{renesas,r9a09g057-gbeth.yaml => renesas,rzv2h-gbeth.yaml}  | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename Documentation/devicetree/bindings/net/{renesas,r9a09g057-gbeth.yaml => renesas,rzv2h-gbeth.yaml} (98%)

Here is the summary with links:
  - dt-bindings: net: Rename renesas,r9a09g057-gbeth.yaml
    https://git.kernel.org/netdev/net-next/c/d53320aeef18

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



