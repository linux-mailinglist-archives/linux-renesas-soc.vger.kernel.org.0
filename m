Return-Path: <linux-renesas-soc+bounces-2603-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69165850FDC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Feb 2024 10:40:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C977EB20DFD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Feb 2024 09:40:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D92B5179B7;
	Mon, 12 Feb 2024 09:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PCLddKSd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB8B179B5
	for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Feb 2024 09:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707730848; cv=none; b=e3gqHi980oZGIdkYQaGIgR9BTRit+aAGMrvEpQfq8BC7wWn+BPEiCz7fDmMPXcqPRr3ryApZzRtfJ61ZvOuKLb2pbNOEuourTfbqu7ZzhJFUExZLCOpPeDuAzrRUx1Rb6ZIveD0oqKTYk0bqWkUlrF+j3dDkH6lZUEDwxw0f5S4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707730848; c=relaxed/simple;
	bh=kYwQCU8IK1/HhmiiTKalDMZ5ghP/MrLRXBCpPKSdWak=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=Usoh46mOkcasYIqHgBVjdIlSw1XsRE9CHnL8ACyH/rMoPlVa2Pw9elX0Bw1QPd5iGYRwy2oRqbPPX5MuHb93u4dNkTcQioDbBULRpMvUO0vX6UX/ycs38Aajzhy6AvdjDm8PS2IosWuaIBSQZqiar9lae+q0XQY7ylVlYWQJdEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PCLddKSd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 34BB3C433C7
	for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Feb 2024 09:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707730848;
	bh=kYwQCU8IK1/HhmiiTKalDMZ5ghP/MrLRXBCpPKSdWak=;
	h=Subject:From:Date:To:From;
	b=PCLddKSdULVrtQvYQbAasZzVHw/Zg2XhgPJ2pIiiKiaL4jaS/1ibK+oDGASKMO5pq
	 9i2obEFAXciri/RUF9qN/+5I73h+Le9Wct3ZhtCJewqTGdc8YTws+y9MB722o/Gu0Z
	 bPFrXSAtHkP77o45X8WMua+ftDtwbOQxNulYwimSyr7iIIRltmipaRWkfHLW46Dcck
	 4/xQ6prPrwMK6cFcDmRy7C5YP1oqubeuSzBu6ql7fmFZbm9Fjgsp57Ooc788urhVr8
	 +Z+C2R9r0ws7KV9pU6k6z7SBBWdlRONU6Slk98Ymw5KHLLR5tA9XxbLy9S9PnaH42j
	 mDQvSLHDyFwMg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 19794D84BC3
	for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Feb 2024 09:40:48 +0000 (UTC)
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
 <170773084804.19628.5855801763697152752.git-patchwork-summary@kernel.org>
Date: Mon, 12 Feb 2024 09:40:48 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: pmdomain: renesas: r8a77980-sysc: CR7 must be always on
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Ulf Hansson <ulf.hansson@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=816555
  Lore link: https://lore.kernel.org/r/fdad9a86132d53ecddf72b734dac406915c4edc0.1705076735.git.geert+renesas@glider.be


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



