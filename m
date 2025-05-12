Return-Path: <linux-renesas-soc+bounces-16965-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BBB8AB31AA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 May 2025 10:30:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E14147A9348
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 May 2025 08:29:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 602A319F11B;
	Mon, 12 May 2025 08:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FskL75JK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD0E2AEE1
	for <linux-renesas-soc@vger.kernel.org>; Mon, 12 May 2025 08:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747038650; cv=none; b=GulZp/ovfe3SxRo2wd1S/7npVys6Y2dIel3nAQSbAkuUKCu1XxjllyR3GmkU4s95a913MoAyBA+ZylwfbZXyAX1DkgukLfmE/03UT5xxK55WoLcqbISnyxjpVfyOCzorLmnV5as0v9zkSTN5PVaOXjuXDyxDPvxX5s1WH3Ux7gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747038650; c=relaxed/simple;
	bh=+NITaPbpolrhyW71MENXPTlotvHWaq9PuDSYThgZEN4=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=m2Db7Enou11J5vLNBa5b4YwSExo8z0LCwTlKxi1PdK/e8kt4V68U4NwqZTESQuvqkYkFRNKBDNZu/h51nlQ3okThIW+0rqzdwMQ/JKsjpriwaSdCzSOglV669gNINe0NKBT+nE4TJqdNfXDunGWkKtOWpcs1Qo/IJqO8Q/B/iRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FskL75JK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75EFDC4CEEF
	for <linux-renesas-soc@vger.kernel.org>; Mon, 12 May 2025 08:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747038649;
	bh=+NITaPbpolrhyW71MENXPTlotvHWaq9PuDSYThgZEN4=;
	h=Subject:From:Date:To:From;
	b=FskL75JKdQJHTcj7DcK00oXlwhdSI+uKErqsLE4JQ5yDo0qRD6unSlL0+UDN5Hty4
	 3kkGkP+Cb7tspkat7DOHDUie1/3PJ8zyToBNTNWCOjKqVcM8xNEWq3B+qflZRJOVo/
	 /wtRwEOcueUMTGorEU1KwzP+B85PPCgZXSn62IVeIi9wc0yNnDPmk/AWK+CCj9RmiQ
	 0FuVsqfVpJgMCL8uokgXASDnMuFhB4xwRwe1cmdeq/d3cbtQVAnpqL2AVR+eyemKUz
	 imjtSmnAkwCbFTj8jXJXFA8FjsXj8GZohfWKAX2Hf9t7IM07hJbG2e1E04fbE6k7xV
	 HrUuTx4D/105g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7431439D6548
	for <linux-renesas-soc@vger.kernel.org>; Mon, 12 May 2025 08:31:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From: patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: 
 <174703868703.506001.16395245401308177497.git-patchwork-summary@kernel.org>
Date: Mon, 12 May 2025 08:31:27 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: Doc: devicetree: bindings: rename r8a779f0-ether-serdes.yaml
  Submitter: Michael Dege <michael.dege@renesas.com>
  Committer: Jakub Kicinski <kuba@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=961320
  Lore link: https://lore.kernel.org/r/TYRPR01MB1428415607B42877B763427F0828AA@TYRPR01MB14284.jpnprd01.prod.outlook.com
    Patches: Doc: devicetree: bindings: rename r8a779f0-ether-serdes.yaml
             [2/9] Doc: devicetree: bindings: rename r8a779f0-ether-serdes.yaml


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



