Return-Path: <linux-renesas-soc+bounces-12742-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7196FA22BEC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Jan 2025 11:50:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3AFFF7A0639
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Jan 2025 10:49:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AA671BD01E;
	Thu, 30 Jan 2025 10:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fr5dKSYR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F891494CC;
	Thu, 30 Jan 2025 10:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738234207; cv=none; b=esh3AxvVPmQnePbIo1jzgcHkAdorBHzsXlTtSbVtYqf4SfOF9CPMYrIHiWMu62VaxtL9IDv2q5wMffJxY64PAfsXqZKedViY9PSRk3hZk/ek6Hf5gH0ynax/NfGSjYQ2SZ1/Z7XalkCByiCGLdo2vsETHEBuzgZh30Y5ncfa8Jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738234207; c=relaxed/simple;
	bh=/jTCSM1Q9klSusG46f2IQAhJNRjmn48ROwnnQe6r2pQ=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=jCM4LtxeAXp6XVKOa5xTnkFNEbEGf7RqOq+5b2PfsxsfqPigLe1TCSWNbPb8f1npM4W0d2ZdkgjVhq8Smc88HDzJuye0THJfHRazpu7je5KNquYPpZRSAu0pwOKKFmKnVtiAGw6L5RFRmRExHuFSUq27TIdBKDEJDZQBvjTohxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fr5dKSYR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2BCEC4CED2;
	Thu, 30 Jan 2025 10:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738234206;
	bh=/jTCSM1Q9klSusG46f2IQAhJNRjmn48ROwnnQe6r2pQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=fr5dKSYRj2gmHdEklgFlRC5ztKlg1RRL8IqF6ctBXAQlmoBo1VPt0/tCDewpbZeFa
	 DWvqu6+ngcE0HRT19MkS3Cy7PzrUAOo7yomQG8s1wn5ZwFGLu5ePuFCRL7n8PrP4y4
	 BnYNF1bq95zw++xvIoBC7GvUK1geaiLMHjF+xCWDOvjSsu1hKFpp7M7HAzbEtqCw4m
	 VmtQtowaBjZ/Jg8dxJVssl8b8pBvfK5bSBUvDT8ueIfNm3q5CtoEH01TN2YxtDgL2I
	 vMLr5gi1rjMLMKkoX9w/RgRz1Rt+WpFohxOKd91Me1QZ3fQB/XUfLljR2imdmliwpJ
	 uxni2SEaAFJQg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33F65380AA66;
	Thu, 30 Jan 2025 10:50:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v3 0/2] Fix missing rtnl lock in suspend path
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <173823423301.921316.7275460470502894424.git-patchwork-notify@kernel.org>
Date: Thu, 30 Jan 2025 10:50:33 +0000
References: <20250129-fix_missing_rtnl_lock_phy_disconnect-v3-0-24c4ba185a92@bootlin.com>
In-Reply-To: <20250129-fix_missing_rtnl_lock_phy_disconnect-v3-0-24c4ba185a92@bootlin.com>
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: paul.barker.ct@bp.renesas.com, niklas.soderlund@ragnatech.se,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, s.shtylyov@omp.ru,
 thomas.petazzoni@bootlin.com, niklas.soderlund+renesas@ragnatech.se,
 claudiu.beznea.uj@bp.renesas.com, netdev@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org

Hello:

This series was applied to netdev/net.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Wed, 29 Jan 2025 10:50:45 +0100 you wrote:
> Fix the suspend path by ensuring the rtnl lock is held where required.
> Calls to open, close and WOL operations must be performed under the
> rtnl lock to prevent conflicts with ongoing ndo operations.
> 
> Discussion about this issue can be found here:
> https://lore.kernel.org/netdev/20250120141926.1290763-1-kory.maincent@bootlin.com/
> 
> [...]

Here is the summary with links:
  - [net,v3,1/2] net: ravb: Fix missing rtnl lock in suspend/resume path
    https://git.kernel.org/netdev/net/c/2c2ebb2b4957
  - [net,v3,2/2] net: sh_eth: Fix missing rtnl lock in suspend/resume path
    https://git.kernel.org/netdev/net/c/b95102215a8d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



