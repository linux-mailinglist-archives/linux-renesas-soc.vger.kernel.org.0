Return-Path: <linux-renesas-soc+bounces-33608-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LMzuA8yqImpIbwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33608-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 05 Jun 2026 12:54:04 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7707E647895
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 05 Jun 2026 12:54:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Mft0ru1P;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33608-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33608-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CF71C315DE1F
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Jun 2026 10:42:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E7B82EEE82;
	Fri,  5 Jun 2026 10:40:10 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E47241363D
	for <linux-renesas-soc@vger.kernel.org>; Fri,  5 Jun 2026 10:40:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780656010; cv=none; b=rn+2XWPdwbZYlsQryOEZ84n28dGUUXJC2gcKooMLac5aS7S6rql5E5gS5I7PHAp9W0H881mzh+XpTG0nTQh5AB3tjsRx4PLm6NqxIvCNSw3zNtihZ4KFCrAbcwJMTJ0vX+Y6bVGmuTt4scMoZjYM9pEIkpbu8JnKqjUysBk2Rbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780656010; c=relaxed/simple;
	bh=+1+baLx91sftcsT7HxfN7sIOUh8SYNZdzp7WyUhgFi0=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=dqSs/Dfo4rKRFbP6XZ7MYiV1S6hFfvtKctxSx38eq99l/3wiYxB1QtydM+RP87FCtr69e1BFiQ238iBLa4u6JL/uxQ+qJw1xga5IeKHvLV32J7BWB4zn+Q35kiM7hgOVSgJqqLAF5TyG5wxnjcB+7XBWLoLOdt8Q5vmxxuZCamg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mft0ru1P; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B65A01F00893
	for <linux-renesas-soc@vger.kernel.org>; Fri,  5 Jun 2026 10:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780656008;
	bh=ukvo/AcojniusGgvuq8PmcIwVuniZD197bEdFhlqmrw=;
	h=Subject:From:Date:To;
	b=Mft0ru1PfZBqLPYWIoBLm08ne+u1RCxQDY3FnULo6Tf3Wvehl0vM4KNKVuxv1Vqmp
	 56I9ZvirrUpna9WkOwk6wxi7gL9dcXEGiGTUaP7UWhbq2TFNvEjbhNypXgXK8SHHNo
	 Jn6dhJH4vY4kQMht/JVcqnjihFN4RGkTxupxColXSXNduozx4GLxnGrWz/MHfgwbdc
	 txnoXRUhxekwbg7dak5tThqLhmmmM+1njrflls/1S5ZYCWGefH1K2/KakcATXUWB0y
	 knTwuPeuLEFIyHzC2KXvJf2osLfzqnE4Xi8yEZGDNKoX5PtNPB6ki49EnbIQXsUqja
	 dXv/57xOtAMUQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 5939C3930B04
	for <linux-renesas-soc@vger.kernel.org>; Fri,  5 Jun 2026 10:40:10 +0000 (UTC)
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
 <178065600885.3265447.8438651398728805722.git-patchwork-summary@kernel.org>
Date: Fri, 05 Jun 2026 10:40:08 +0000
To: linux-renesas-soc@vger.kernel.org
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-33608-lists,linux-renesas-soc=lfdr.de,linux-renesas-soc];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:linux-renesas-soc@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[patchwork-bot@kernel.org,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_ONE(0.00)[1];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NO_DN(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7707E647895

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: Enable RSPI support on RZ/G3L SMARC EVK
  Submitter: Biju <biju.das.au@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1102896
  Lore link: https://lore.kernel.org/r/20260529130704.327505-1-biju.das.jz@bp.renesas.com
    Patches: [v2,1/2] arm64: dts: renesas: r9a08g046: Add RSPI{0..2} nodes
             [v2,2/2] arm64: dts: renesas: r9a08g046l48-smarc: Enable RSPI2

Series: arm64: dts: renesas: rzt2h-n2h-evk: Configure ETH/SCI pins
  Submitter: Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1102274
  Lore link: https://lore.kernel.org/r/20260528134752.79813-1-prabhakar.mahadev-lad.rj@bp.renesas.com
    Patches: [1/3] arm64: dts: renesas: rzt2h-n2h-evk: Remove unused MII/GMII pins
             [2/3] arm64: dts: renesas: rzt2h-n2h-evk: Configure ETH pins
             [3/3] arm64: dts: renesas: rzt2h-n2h-evk: Configure SCI0 pins

Series: Subject: [PATCH 0/2] arm64: dts: renesas: RZ/G3E DTS fixes and updates
  Submitter: Biju <biju.das.au@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1105361
  Lore link: https://lore.kernel.org/r/20260603143340.162457-1-biju.das.jz@bp.renesas.com
    Patches: [1/2] arm64: dts: renesas: r9a09g047e57-smarc: Drop SW_SER0_PMOD condition for rsci4
             [2/2] arm64: dts: renesas: r9a09g047: Add max-frequency for SDHI controllers

Patch: [v2] arm64: dts: renesas: r9a08g046l48-smarc: Enable rsci{1,2,3} nodes
  Submitter: Biju <biju.das.au@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1102891
  Lore link: https://lore.kernel.org/r/20260529125442.327290-1-biju.das.jz@bp.renesas.com

Series: arm64: dts: renesas: Add RZ/G3E audio enablement
  Submitter: John Madieu <john.madieu.xa@bp.renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1100417
  Lore link: https://lore.kernel.org/r/20260525110603.4018170-1-john.madieu.xa@bp.renesas.com
    Patches: [v4,1/8] dt-bindings: clock: renesas: Add audio clock inputs for RZ/V2H family
             [v4,3/8] arm64: dts: renesas: rzv2h: Add audio clock inputs
             [v4,6/8] arm64: dts: renesas: rzg3e-smarc-som: Add I2C1 support

Series: ASoC: rsnd: Add audio support for the Renesas RZ/G3E SoC
  Submitter: John Madieu <john.madieu.xa@bp.renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1076306
  Lore link: https://lore.kernel.org/r/20260402090524.9137-1-john.madieu.xa@bp.renesas.com
    Patches: [v2,01/24] dt-bindings: clock: renesas: Add audio clock inputs for RZ/V2H family
             [v2,22/24] arm64: dts: renesas: rzg3e-smarc-som: Add I2C1 support

Patch: arm64: dts: renesas: r8a78000: Enable application CPU cores via PSCI
  Submitter: Marek Vasut <marek.vasut+renesas@mailbox.org>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1103980
  Lore link: https://lore.kernel.org/r/20260601113919.8327-1-marek.vasut+renesas@mailbox.org

Patch: [v4] arm64: renesas: r8a779g0: add MFIS node
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1104796
  Lore link: https://lore.kernel.org/r/20260602182157.304964-2-wsa+renesas@sang-engineering.com


Total patches: 15

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



