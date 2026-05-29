Return-Path: <linux-renesas-soc+bounces-33348-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iHPkATSQGWpTxggAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33348-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 May 2026 15:10:12 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7A1602ADD
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 May 2026 15:10:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6DF89300F76D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 May 2026 13:10:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6DE11DDC1D;
	Fri, 29 May 2026 13:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E18AnxTo"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A501A6803
	for <linux-renesas-soc@vger.kernel.org>; Fri, 29 May 2026 13:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780060208; cv=none; b=sVe1rNWF+AG5Qn5YMPtVi6G6DLVDw9SVyJbJeV+7qOl3s9oNXC0+p65on7crS5YWMNSlLufve/Z/iKIOCUcg+Xu7qXIFYaCSfFKWB7En07ff4/dQ/Zevc67Lpy69hM6dEyTrExqJnGJaod1d7Fbc5KMcgod7AAE5Gvt4Ma76a8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780060208; c=relaxed/simple;
	bh=9rmaXi2trjF2ylO/sbuTiX+UrkTaJRdQanwWOdXfgKA=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=vFB6eeC99IEhoZ8cRU2SLik6zCtZo/3cOxaLFUwcuutZs+giAdp5ZAypzbcl+zZwbxJ/gejLr1nIQheqp8vIoCsyzAiMVUo5TriJZGKdyGp2N48VKjxKbX46CFs6WW2XUJ/NGSDn32dRl5csuZpIF+NnmNGc1XRdENZJeXzPsng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E18AnxTo; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 927811F00893
	for <linux-renesas-soc@vger.kernel.org>; Fri, 29 May 2026 13:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780060207;
	bh=mQvcpHPOiJSPVqnYNylSoo3vxdEx9ZZUCKSfLhNnF6s=;
	h=Subject:From:Date:To;
	b=E18AnxToTL8b78Ck2VsBcuQif7019cGVXMqRt4ZjHjN/GG7EbT8n3HoPG5mx2S7gX
	 iHRnQ5tIB5WTA+Sm+K/ZJbeWYgCCekdua01vOsk7TRhnJeaUT4ycTU1WBoShvTMTUu
	 Ij7bwezZ5Oa0LRnS/0WNYN4c+GbqVegmiH+bVMgYOzSM3dz5wOt7iSOsVbed1n4q/7
	 ZN9chQb9uBrhElfjlkoKxYw4K6bCtGjzWCo+A8EWVC5gVltKmKPYLwfB4hk1OVlIPX
	 3AfNL1wfpp2f/vMdVZDzg2pDEZGCVkt2t1hXxBb17QATljxcjB+63DgdGg9/DKS/JF
	 nFBOnrcKnmXpQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 9643D393003A
	for <linux-renesas-soc@vger.kernel.org>; Fri, 29 May 2026 13:10:12 +0000 (UTC)
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
 <178006021108.1794095.2650976941922339778.git-patchwork-summary@kernel.org>
Date: Fri, 29 May 2026 13:10:11 +0000
To: linux-renesas-soc@vger.kernel.org
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TAGGED_FROM(0.00)[bounces-33348-lists,linux-renesas-soc=lfdr.de,linux-renesas-soc];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	FROM_NO_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,renesas.com:email]
X-Rspamd-Queue-Id: 9E7A1602ADD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: soc: renesas: mfis: add R-Car V4H/V4M support
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1097134
  Lore link: https://lore.kernel.org/r/20260519075620.4128-1-wsa+renesas@sang-engineering.com
    Patches: [v2,1/2] dt-bindings: soc: renesas: mfis: add R-Car V4H/V4M support
             [v2,2/2] soc: renesas: mfis: add R-Car V4H/V4M support

Patch: [v2] arm64: dts: renesas: rzt2h-n2h-evk: Enable xSPI nodes
  Submitter: Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1101851
  Lore link: https://lore.kernel.org/r/20260527202430.606341-1-prabhakar.mahadev-lad.rj@bp.renesas.com

Series: Add support for DU and DSI on the Renesas RZ/G3E SoC
  Submitter: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1078608
  Lore link: https://lore.kernel.org/r/cover.1775636898.git.tommaso.merciai.xr@bp.renesas.com
    Patches: [v6,01/21] clk: renesas: rzv2h: Add PLLDSI clk mux support
             [v6,18/21] arm64: dts: renesas: r9a09g047: Add fcpvd{0,1} nodes
             [v6,19/21] arm64: dts: renesas: r9a09g047: Add vspd{0,1} nodes

Series: Add RZ/G3L SMARC EVK support for I2C and GPIO keys
  Submitter: Biju <biju.das.au@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1102015
  Lore link: https://lore.kernel.org/r/20260528070239.33352-1-biju.das.jz@bp.renesas.com
    Patches: [v2,1/2] arm64: dts: renesas: r9a08g046l48-smarc: Add gpio keys
             [v2,2/2] arm64: dts: renesas: r9a08g046l48-smarc: Enable I2C{2,3} devices

Patch: arm64: dts: renesas: Simplify AA1024XD12 display DTO
  Submitter: Marek Vasut <marek.vasut+renesas@mailbox.org>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1089322
  Lore link: https://lore.kernel.org/r/20260504143751.42753-1-marek.vasut+renesas@mailbox.org

Series: Add audio support for RZ/G3L SMARC EVK
  Submitter: Biju <biju.das.au@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1102044
  Lore link: https://lore.kernel.org/r/20260528074615.91110-1-biju.das.jz@bp.renesas.com
    Patches: [v2,1/2] arm64: dts: renesas: rzg3l-smarc-som: Enable versa clock generator
             [v2,2/2] arm64: dts: renesas: r9a08g046l48-smarc: Enable audio

Patch: arm64: dts: renesas: r9a07g044: Add DMA properties for serial nodes
  Submitter: Claudiu Beznea <claudiu.beznea@kernel.org>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1098031
  Lore link: https://lore.kernel.org/r/20260520132315.944117-1-claudiu.beznea@kernel.org

Series: Enable RSCI interfaces on RZ/G3L SMARC EVK
  Submitter: Biju <biju.das.au@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1097235
  Lore link: https://lore.kernel.org/r/20260519100022.116318-1-biju.das.jz@bp.renesas.com
    Patches: [1/2] arm64: dts: renesas: r9a08g046: Add rsci{0..3} device nodes


Total patches: 13

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



