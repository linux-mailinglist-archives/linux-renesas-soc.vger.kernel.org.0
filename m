Return-Path: <linux-renesas-soc+bounces-11365-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C61779F2D9F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Dec 2024 11:00:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 105B4160FB4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Dec 2024 10:00:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C7431C243D;
	Mon, 16 Dec 2024 10:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k1GSjcUD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C7071B4F3A
	for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Dec 2024 10:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734343244; cv=none; b=LHrECyrUdGp3Y8fWqM5ZIOsGEaz7IQzj0NdLOOLkPX+0KAWfXPSVX1NVetQJwMekS0AHlmCigPc375kmmB4oyARB2Ir98j7ehaHWFBkz9VXlVKJ6w7I5/q+t8IRZwldRjEPglrzfa1ujg52BzSpY9qTrtvwaH7HiInvlaast+sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734343244; c=relaxed/simple;
	bh=uEhQvMLBzKAI8GTEC+IM+MgvSgeD1HUf1hv0MoPzyB8=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=OSKpL5Cas4pBzr6xcFOsnjhUDqc0CNZ0YvWriNLQxuRuFeth16O94gYsgkg7NdF/f/dYorJOBlVsRGNvv0yxMbsbm7cCjjPcuMU0gh+nlK5UZoMpzclmydcjN0VLlEAcBVQvcQ9FmQk/7mr3XTTf5LWBvPvYFzD/we4bYlD57/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k1GSjcUD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEA70C4CED0
	for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Dec 2024 10:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734343243;
	bh=uEhQvMLBzKAI8GTEC+IM+MgvSgeD1HUf1hv0MoPzyB8=;
	h=Subject:From:Date:To:From;
	b=k1GSjcUDaLPC/opxXIf3pmWLLCeAeUco4hF5kAmxUgTajVPUHNHvaAYTg7+YQlH1k
	 gs1KKV06TSYNAYSFWOYHoZhJh17Oax6rEG34n/S5L1VXLlu/B7wwiPuI0qmNcmqtzV
	 lAK+MQwMf0wQYLw0yZS72ylgjSVe+kb63KZl47vGail4JQWM/IhRo0/PKAg1wSU0Sx
	 1neVvGie+6IDbLGTukOdyIrbw0NHvUl1uw6eI9jFQjJbU9TDvum71pgEV3nwpEvpsL
	 /5EZ7M1C7ctOsdH8az+r/D1UMGOEHdMDOzt7J8LgbDh98uH1yu3DQKKR8m7uzwjpxD
	 aDsJ5WA/eOdqA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EE9DF3806656
	for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Dec 2024 10:01:01 +0000 (UTC)
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
 <173434326038.151246.6466297983786765154.git-patchwork-summary@kernel.org>
Date: Mon, 16 Dec 2024 10:01:00 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: [net] net: renesas: rswitch: handle stop vs interrupt race
  Submitter: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
  Committer: Jakub Kicinski <kuba@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=915906
  Lore link: https://lore.kernel.org/r/20241209113204.175015-1-nikita.yoush@cogentembedded.com

Series: net: renesas: rswitch: several fixes
  Submitter: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
  Committer: Jakub Kicinski <kuba@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=915667
  Lore link: https://lore.kernel.org/r/20241208095004.69468-1-nikita.yoush@cogentembedded.com
    Patches: [net,v2,resend,1/4] net: renesas: rswitch: fix possible early skb release
             [net,v2,resend,2/4] net: renesas: rswitch: fix race window between tx start and complete
             [net,v2,resend,3/4] net: renesas: rswitch: fix leaked pointer on error path
             [net,v2,resend,4/4] net: renesas: rswitch: avoid use-after-put for a device tree node

Series: serial: sh-sci: Fixes for earlycon and keep_bootcon
  Submitter: Claudiu Beznea <claudiu.beznea@tuxon.dev>
  Committer: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=914624
  Lore link: https://lore.kernel.org/r/20241204155806.3781200-1-claudiu.beznea.uj@bp.renesas.com
    Patches: [RFT,1/6] serial: sh-sci: Check if TX data was written to device in .tx_empty()

Patch: [net,v2] net: renesas: rswitch: fix initial MPIC register setting
  Submitter: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
  Committer: Paolo Abeni <pabeni@redhat.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=916657
  Lore link: https://lore.kernel.org/r/20241211053012.368914-1-nikita.yoush@cogentembedded.com

Patch: None
  Submitter: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
  Committer: Jakub Kicinski <kuba@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=915458
  Lore link: https://lore.kernel.org/r/20241206191640.1416-1-nikita.yoush@cogentembedded.com


Total patches: 8

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



