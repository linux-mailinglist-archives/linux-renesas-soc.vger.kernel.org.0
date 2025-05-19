Return-Path: <linux-renesas-soc+bounces-17188-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 26197ABB810
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 May 2025 11:00:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 41D53188EDC5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 May 2025 09:01:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E4451DEFF3;
	Mon, 19 May 2025 09:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="becRWc5g"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29B102AC17
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 May 2025 09:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747645247; cv=none; b=e0W2uTN5XaL/mQNDymTriVPK6WyeA8AYVEFZKJwXJiLBxKaNiEt+SvA3xq3/eMD666yNeEXSJf2C7wiWosOGQ6GvG5bSSBqkmxbRyKLCjGh8W7PxdYTNt3ZwPc7jLmmppu0MecMEPObXD8NjranaiIll7M9cuQdNC2xN51OOv/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747645247; c=relaxed/simple;
	bh=KhKqv/nBm6dR5VkJ3HWeyjB87up3AI1vh3HK4fiWfNw=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=kznTukJdRgEAWxnMm6hA3uIqadphnGSqQ3zx3Eri/KU1By+hFrXeydgJURfSJrJUetL6BiNghyoYXWJm9QesbWclrH13VHxsE4/q6MU5VqIekxmSlzEMzsiZMys/Z5lI1xXAm9pi8bR2v4xm3rzY9SrJbvvgL7qR5764+zBNrnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=becRWc5g; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96EA9C4CEE4
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 May 2025 09:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747645246;
	bh=KhKqv/nBm6dR5VkJ3HWeyjB87up3AI1vh3HK4fiWfNw=;
	h=Subject:From:Date:To:From;
	b=becRWc5g18FyQ7W0X/s/tfdxI2WZ1BimJC9O4861BpJbNs1joXp+Hfmfb2TSEMr/S
	 IcJZxeejiQc4D++DVR5GeLQjsGMneFgbNmIK/abn8A7VrK/t35ExMYUv+XOLmIIm4G
	 cP3oVvr3it9wqivYzSLCNJgrUdJls8Gite7tCmlaZG0TW+qv/m+qedAWwCpSlJEaFS
	 vsodedZmofL0ZNYKs+Oq08/Vpek5RJboso28+TkMsbsW4v60udJktuCeaA8RYZ4wSy
	 P8XgOxE7PNcSUtzZaRyLK2Q+2Jepgx+01+yNEb6BUGO4C6fEhVOoyY0X+kF4pTy/Ie
	 R3h/OdeH4kZ5Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EE8EA380AAF5
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 May 2025 09:01:23 +0000 (UTC)
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
 <174764528254.837364.4304891828362729368.git-patchwork-summary@kernel.org>
Date: Mon, 19 May 2025 09:01:22 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: [v2] dt-bindings: soc: renesas: Document RZ/V2H EVK board part number
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=962804
  Lore link: https://lore.kernel.org/r/0a264c102c615e0a1bec2e45cba180298643520c.1747222771.git.geert+renesas@glider.be

Patch: [v2] phy: can-transceiver: Re-instate "mux-states" property presence check
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Vinod Koul <vkoul@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=945960
  Lore link: https://lore.kernel.org/r/3d7e0d723908284e8cf06ad1f7950c03173178f3.1742483710.git.geert+renesas@glider.be

Patch: MAINTAINERS: add me as maintainer for the gpio sloppy logic analyzer
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=956773
  Lore link: https://lore.kernel.org/r/20250424212234.5313-2-wsa+renesas@sang-engineering.com


Total patches: 3

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



