Return-Path: <linux-renesas-soc+bounces-6930-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B0A91DC48
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Jul 2024 12:22:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6C3181F21DEE
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Jul 2024 10:22:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 295E9145354;
	Mon,  1 Jul 2024 10:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rejc6uES"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F4C145334
	for <linux-renesas-soc@vger.kernel.org>; Mon,  1 Jul 2024 10:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719829257; cv=none; b=Y39EAAniSYzoKV5ItrnB9uVRqtWh5vqDabZ95zHOyOaQ7JxDfQaR+yEVS2N6IagQpDhtWJFZIa8kcBp451JijNU5UkTELDwOK6RGX8WnlrbBrKAFNv8Waljnw5XER/Zybb70RfaqsqAWdLECcC4t1SZrk8Cs/NZgeh6fqtR4GBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719829257; c=relaxed/simple;
	bh=Ur1YX/NGVM2+yesTG+sBbohwr7RuTUkEgmDlXCyTcwQ=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=VHfTQbkdOJz20rOcj+A+55ixVZtVt0I0aiVpeZVLXT3VSiN1OAAO7O4bTqymeYysObcQ5iVznIjtpVBzz9YFMPbckBTfHtFZEXEOw+oyc593wnwyqK/o4TmQENmIklzBxG3D+oBIXtPObFEJek6GGBSp7wBPswCh+Vq0UStZsDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rejc6uES; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 67D1CC32786
	for <linux-renesas-soc@vger.kernel.org>; Mon,  1 Jul 2024 10:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719829256;
	bh=Ur1YX/NGVM2+yesTG+sBbohwr7RuTUkEgmDlXCyTcwQ=;
	h=Subject:From:Date:To:From;
	b=rejc6uESikRCxb8FJ1u+Ol2JQhya2a7vltRyfOv8i1ndeoJyfn0Rz72MBcocz6KDf
	 7+a4px6huzcQIr62gDoY0Xdw0Vj6tykHUWRn/cdtOriNDvKEUlVNlP0aadBWjwhyLM
	 WcdMIpjNryrGxMipGLv21XntGOac7U4SwXXl6+b03ycf5+DfZr1mr/fvicdwnZAXQs
	 ALmlLwFaQ5Bp27Pf0semG3JMJu1z1nUH4nH3S5+PN9wo86vfJHEwf7gueo/LhwSCCX
	 CUifDP2E1K6AnnqWCNG2m1yIsP0XB9OHrTHyHfjtbV4umOIO/1Vq4iypIz186a27j6
	 cC7NOohH1jZuA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 4B41AC43331
	for <linux-renesas-soc@vger.kernel.org>; Mon,  1 Jul 2024 10:20:56 +0000 (UTC)
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
 <171982925624.8939.5872612562844517570.git-patchwork-summary@kernel.org>
Date: Mon, 01 Jul 2024 10:20:56 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: i2c: testunit: regression fixes
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=866108
  Lore link: https://lore.kernel.org/r/20240627111445.29751-4-wsa+renesas@sang-engineering.com
    Patches: [1/2] i2c: testunit: don't erase registers after STOP
             [2/2] i2c: testunit: discard write requests while old command is running


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



