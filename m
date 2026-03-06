Return-Path: <linux-renesas-soc+bounces-28952-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sLi6DkPSqmn3XQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28952-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Mar 2026 14:10:27 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CAFCC22168D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Mar 2026 14:10:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5E9103003375
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Mar 2026 13:10:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FA73393DEB;
	Fri,  6 Mar 2026 13:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O49M2pTh"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C34F393DEA
	for <linux-renesas-soc@vger.kernel.org>; Fri,  6 Mar 2026 13:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772802618; cv=none; b=hsmTlQfCgSpE1MBAa+ZubYSvT9dzkvODVAuZnRpiOj9GG4X/h2gIZMMWd5uZ/K3L13pR7f1+PjNv+60KtauIoWbpV1uoNtReZEkXDhfZIeScTR/IyZfgwcqngKyBbEdHdx3jlMCNFEV1/qj3PCPaUbrbPtQD16LzEs/NwBTLU5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772802618; c=relaxed/simple;
	bh=fQ7P5FXseYRjcyZ19Y+gz4Ym0vCLsZuixocWkZA93oY=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=TuvZE77okBpXBwQ/tQ8EQLmZfeco2R1pLNF7orq1QEQjgR9Q2tyOdFdc0tdY9Y2H34pbsTmG4TLjWv4ogm7SzxTCpjJ01MoPh3aoNVUrifezwqKWk4nH3TfbEW/WjKTP3Si2cSDxpezdDFvGGuOfjgjSVJO+7BReDmQQrtt/LMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O49M2pTh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B080AC4CEF7
	for <linux-renesas-soc@vger.kernel.org>; Fri,  6 Mar 2026 13:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772802617;
	bh=fQ7P5FXseYRjcyZ19Y+gz4Ym0vCLsZuixocWkZA93oY=;
	h=Subject:From:Date:To:From;
	b=O49M2pThazyuJ7D15dn2Qx9SlML/P8KMr+FTdzN2vgCSPZ1dPPPNyl1mESHJrzcS6
	 qv0EvskZJJgOvd4nIsMife9VNzxZ/D/y1YDItcaMQo4nXbP8daf9crwM27qMAov2dc
	 U2NVwCBJBMUiGu4YC9pqyGUGnmc3puApfKsd3jaPHRSVyQSwLAQcpzQdd6U9TCT1Kq
	 X1FuLWgd3yzMARttN0DL9agZ0dYOOIPNbM9AMnEZ/ixtXui1ykb+yf+VR4o/8KWJSl
	 5Gt4t6dESTXNsoVX5oryTN/l87sU7SH85N/4jksRB7sSQXbhOyI5/OxnjKQsZl+tcD
	 55Mpg5x/4odSw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 4291A3808200
	for <linux-renesas-soc@vger.kernel.org>; Fri,  6 Mar 2026 13:10:18 +0000 (UTC)
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
 <177280261671.3656493.3158475436190209453.git-patchwork-summary@kernel.org>
Date: Fri, 06 Mar 2026 13:10:16 +0000
To: linux-renesas-soc@vger.kernel.org
X-Rspamd-Queue-Id: CAFCC22168D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TAGGED_FROM(0.00)[bounces-28952-lists,linux-renesas-soc=lfdr.de,linux-renesas-soc];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	FROM_NO_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.990];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: arm64: dts: renesas: rzg3s-smarc-som: Set bypass for Versa3 PLL2
  Submitter: Claudiu <claudiu.beznea@tuxon.dev>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1060043
  Lore link: https://lore.kernel.org/r/20260302135703.162601-1-claudiu.beznea.uj@bp.renesas.com

Series: Add support for Renesas RZ/G3L SoC and SMARC-EVK platform
  Submitter: Biju <biju.das.au@gmail.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1050231
  Lore link: https://lore.kernel.org/r/20260203103031.247435-1-biju.das.jz@bp.renesas.com
    Patches: [v3,01/10] dt-bindings: dma: rz-dmac: Document RZ/G3L SoC
             [v3,02/10] dt-bindings: soc: renesas: Document RZ/G3L SoC variants, SMARC SoM and Carrier-II EVK
             [v3,03/10] dt-bindings: soc: renesas: renesas,rzg2l-sysc: Document RZ/G3L SoC
             [v3,04/10] soc: renesas: rz-sysc: Add SoC identification for RZ/G3L SoC

Patch: riscv: rzfive: defconfig: Refresh for v7.0-rc1
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1059925
  Lore link: https://lore.kernel.org/r/a7fdd607fafd2215c862e0750e7cafedd672e78d.1772449522.git.geert+renesas@glider.be

Series: arm64: dts: renesas: r9a09g0[77/87]: Fix CPG register region sizes
  Submitter: Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1053924
  Lore link: https://lore.kernel.org/r/20260213131742.3606334-1-prabhakar.mahadev-lad.rj@bp.renesas.com
    Patches: [1/2] arm64: dts: renesas: r9a09g077: Fix CPG register region sizes
             [2/2] arm64: dts: renesas: r9a09g087: Fix CPG register region sizes

Series: arm64: dts: renesas: Fix SD0 failures on RZ/{T2H, N2H} and RZ/V2H
  Submitter: Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1046489
  Lore link: https://lore.kernel.org/r/20260123225957.1007089-1-prabhakar.mahadev-lad.rj@bp.renesas.com
    Patches: [1/4] arm64: dts: renesas: rzt2h-n2h-evk: Add ramp delay for SD0 card regulator
             [4/4] arm64: dts: renesas: rzv2-evk-cn15-sd: Add ramp delay for SD0 regulator

Patch: arm64: renesas: defconfig: Refresh for v7.0-rc1
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1059924
  Lore link: https://lore.kernel.org/r/39e32613f8b894530a517669e16a290cb463f224.1772449482.git.geert+renesas@glider.be

Patch: [v2] ARM: dts: renesas: r9a06g032: Add support for CPU frequency scaling
  Submitter: Herve Codina <herve.codina@bootlin.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1042920
  Lore link: https://lore.kernel.org/r/20260115164905.1203453-1-herve.codina@bootlin.com

Patch: arm64: dts: renesas: r8a78000: Fix out-of-range SPI interrupt numbers
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1061416
  Lore link: https://lore.kernel.org/r/1f9dd274720ea1b66617a5dd84f76c3efc829dc8.1772641415.git.geert+renesas@glider.be

Patch: ARM: shmobile: defconfig: Refresh for v7.0-rc1
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1059923
  Lore link: https://lore.kernel.org/r/d5faca8fe1db69d584f3097c269be7813ceffd33.1772449420.git.geert+renesas@glider.be

Series: Remove WDT{0,2,3} support from RZ/V2H(P)
  Submitter: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1050277
  Lore link: https://lore.kernel.org/r/20260203124247.7320-1-fabrizio.castro.jz@renesas.com
    Patches: [v2,1/3] dt-bindings: watchdog: renesas,r9a09g057-wdt: Rework example
             [v2,2/3] arm64: dts: renesas: r9a09g057: Remove wdt{0,2,3} nodes


Total patches: 16

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



