Return-Path: <linux-renesas-soc+bounces-19494-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 577CDB00449
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Jul 2025 15:53:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 037061892664
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Jul 2025 13:53:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CF11271448;
	Thu, 10 Jul 2025 13:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HWAC+YtQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E0327056F;
	Thu, 10 Jul 2025 13:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752155387; cv=none; b=C8Mjuk8HTTtCQi27yFRJsuDqpkjxZcD13P/hqRJpiUpLmHg2FBz+P2Gjm29wMvhuYtcgNYGkrP8te7ZuuC+HOniQBjsr0jW2T3WiZB8CKAlRDUEL0MBYTjr3VBvOr8CICL25TU6/oSDqHs9N0mV/+bSkNHz6jLCzVk3TRpWWA+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752155387; c=relaxed/simple;
	bh=Dj0K2w5wkrp5a9OP3A6qXqMgj/IeuqOymeo7G8MjZGU=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=pytcahlsjln6d5kkjTNS6T5FV9Of3db8H8hVjZx2SkeWi5xekC2KahQ4dQ1GBc+PwUFKY3cTzxACTxK938ILmaH7Vxi59f86zjgSjUQmNMb6OXwPf2l6UjyzmS5ByUBwGkBGQWb6zEPWEIeJjAYZWqRVGnc0rah9yz2LfTLHTno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HWAC+YtQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD63CC4CEED;
	Thu, 10 Jul 2025 13:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752155386;
	bh=Dj0K2w5wkrp5a9OP3A6qXqMgj/IeuqOymeo7G8MjZGU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=HWAC+YtQB7Y3rOFLs2P75CQ6lkhARnsQC5jkEytJsBq6hfLFFrhVSBe7cZ1gBYorF
	 1nadBjhbU8NRQLVVFmn+qRn84qxwC0MgbEfXvOJLADlqlF5M6c9/kknKk6n/7shLis
	 /QNfQPuu4K+nuqhfe07H9nQHpeQfe5hrDVkchjwHzQlobWsMC9C+9lAA3U4+2BiAzg
	 MODZJ0Iw0NtsmlKJ98ruHzUApBe5kAvTG3xksaO98UDtcW8Du9J0dRy0IUcBCfPQll
	 gyeQd2Vj0UXojIGVIZuiRaT1N4jrgYi0WM/X89psP0dpc8MysKFuyFRVIX7WliQsa0
	 WbEMLhz6WHP1g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 31B67383B261;
	Thu, 10 Jul 2025 13:50:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCHv2 0/2] net: dsa: rzn1_a5psw: add COMPILE_TEST
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <175215540905.1501423.2321993245947320760.git-patchwork-notify@kernel.org>
Date: Thu, 10 Jul 2025 13:50:09 +0000
References: <20250708014144.2514-1-rosenp@gmail.com>
In-Reply-To: <20250708014144.2514-1-rosenp@gmail.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: netdev@vger.kernel.org, andrew@lunn.ch, olteanv@gmail.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 clement.leger@bootlin.com, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org

Hello:

This series was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Mon,  7 Jul 2025 18:41:42 -0700 you wrote:
> Allows the various bots to test compilation. Also threw in a small devm
> conversion for enabling clocks.
> 
> v2: fix depends on line to match rzn1 pcs driver.
> 
> Rosen Penev (2):
>   net: dsa: rzn1_a5psw: add COMPILE_TEST
>   net: dsa: rzn1_a5psw: use devm to enable clocks
> 
> [...]

Here is the summary with links:
  - [PATCHv2,1/2] net: dsa: rzn1_a5psw: add COMPILE_TEST
    https://git.kernel.org/netdev/net-next/c/f38ae0c62ec8
  - [PATCHv2,2/2] net: dsa: rzn1_a5psw: use devm to enable clocks
    https://git.kernel.org/netdev/net-next/c/37bfeebc12a4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



