Return-Path: <linux-renesas-soc+bounces-29268-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aAmHNBmfsmkOOQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29268-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Mar 2026 12:10:17 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 35AC9270AB5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Mar 2026 12:10:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 44DEF3047BF4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Mar 2026 11:10:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87E1026D4CD;
	Thu, 12 Mar 2026 11:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KcHehvhV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64AD923B63E
	for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Mar 2026 11:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773313813; cv=none; b=EkGUFOx64KYrJFAqqlPEElzfaY2xYKTZBPZj/SfQYwV7G9v0au8ymIp4hc5xZCFP8WvBX8T2jqOwLgtCBO2L80jXaI2mvpLkZlKTqTD9fieKpZF+pBcf8UrQiFYX8A/5qTr3OzbOO4SCeIjLvFTHH32esba3BxdV3euaYZGYPPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773313813; c=relaxed/simple;
	bh=IozB3cT8PKB4qBPbTcQt5TiZJd3YWplPRPaB94vXVNQ=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=Uu46fr6bB2zN36zXm2RcP8qK+9yvOMrommd410IZQyZ4y/ENoNLUfGOypefGEySwFAiuMloZgK3H72UI+0HjjVq/qPydCeeHxoZMMSHMJWYa5uFNQ+NylbAaY7LuV/FRKtegwD9FTw7yaAQediFc21lKlc5bN+/GyvcWA42t5QM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KcHehvhV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09FE3C4CEF7
	for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Mar 2026 11:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773313813;
	bh=IozB3cT8PKB4qBPbTcQt5TiZJd3YWplPRPaB94vXVNQ=;
	h=Subject:From:Date:To:From;
	b=KcHehvhVefqpUbSmoNWwjO9EYPuI1Q/Mfq3A/vv6EMawplKK3cea+Qa46lCJZMTNO
	 CskZVNc3QBZprNZlwbwTdSOm7NpHxkIQ4V5AOXr4MFcSfiwIQIPcoTLWGdCuBrmbkp
	 8Qsq4vEOmKpNYdyVoMmoXUiOlLTSspdczxctwdoBw4NuyWANAntMSUFls9KGJ/+sZr
	 IHjJVmU7cj9xmLk39yMT0G/o15UHDLYMSCXbQHcfWIeMwFDKZ0paX/WoULxzXn5/4r
	 viTtHB0RHwslydVicid961zfs7WKMEAmEypY+rX+ysv9ir9NoKjGgP+umDlfLTTH8d
	 LuD9L03HiEm3w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BCBEE3808200
	for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Mar 2026 11:10:09 +0000 (UTC)
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
 <177331380831.4049514.13253447403826231615.git-patchwork-summary@kernel.org>
Date: Thu, 12 Mar 2026 11:10:08 +0000
To: linux-renesas-soc@vger.kernel.org
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TAGGED_FROM(0.00)[bounces-29268-lists,linux-renesas-soc=lfdr.de,linux-renesas-soc];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	FROM_NO_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bootlin.com:email,sang-engineering.com:email]
X-Rspamd-Queue-Id: 35AC9270AB5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: spi: cadence-qspi: Add Renesas RZ/N1 support
  Submitter: Miquel Raynal <miquel.raynal@bootlin.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1051276
  Lore link: https://lore.kernel.org/r/20260205-schneider-6-19-rc1-qspi-v5-0-843632b3c674@bootlin.com
    Patches: [v5,1/4] spi: dt-bindings: cdns,qspi-nor: Add Renesas RZ/N1D400 to the list
             [v5,4/4] ARM: dts: r9a06g032: Describe the QSPI controller

Patch: [v3] ARM: dts: renesas: r9a06g032-rzn1d400-db: use interrupt for Micrel PHYs
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1065252
  Lore link: https://lore.kernel.org/r/20260311200307.16034-2-wsa+renesas@sang-engineering.com

Patch: ARM: dts: renesas: r9a06g032-rzn1d400-db: Do not use underscores in node names
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1065091
  Lore link: https://lore.kernel.org/r/1c1fc11f1f183a8e72f168bf6eb35a40e01ecacb.1773240961.git.geert+renesas@glider.be

Series: Add DMA support for RSPI channels in RZ/V2H(P) and RZ/V2N SoCs
  Submitter: Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1060900
  Lore link: https://lore.kernel.org/r/20260303233314.2928711-1-prabhakar.mahadev-lad.rj@bp.renesas.com
    Patches: [v2,1/2] arm64: dts: renesas: r9a09g056: Add DMA support for RSPI channels
             [v2,2/2] arm64: dts: renesas: r9a09g057: Add DMA support for RSPI channels

Patch: [v2] ARM: dts: renesas: r9a06g032-rzn1d400-db: add QSPI node including NOR flash
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1062203
  Lore link: https://lore.kernel.org/r/20260305220023.28257-2-wsa+renesas@sang-engineering.com


Total patches: 7

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



