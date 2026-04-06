Return-Path: <linux-renesas-soc+bounces-30899-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QB9LMsp/02l/igcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30899-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 06 Apr 2026 11:41:30 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A453A2AD4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 06 Apr 2026 11:41:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9C9DA30107EF
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Apr 2026 09:41:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2196831E828;
	Mon,  6 Apr 2026 09:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M94MB5aD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3957313532
	for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Apr 2026 09:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775468488; cv=none; b=PXbKXNptAMITQhJMna3gTPr48XTsRa74JQ21eGv1aKbkAlZh60OuxLgMfRCyqeHMYlxlBD0kxjZX8OOzSniAFDVe2l1UTLxANL6tu+/EiHhNFqCNaUzsgrf4IJRtuW5B4ssskmDj4Z9RWcbSYbjv9yea0UaeJL9PMVMwFT6GWbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775468488; c=relaxed/simple;
	bh=QW0Z34FlzkocHdkzYJWLHgBMVE+fg1ukuJ3iZP6uAyU=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=g48x8YFYkJiTtBbze27AL7N5smccln+p8bCcTQQcQCblvO9lapOZUXf2Ps+sSH6HHnOzYSTVqHS9rnm7tqus9dhJ71HsxQdq6izF8xLxQPG2XGv7R2HveNITJXkPXFZ0yw8+ZusrVaygl7Ss1OlBjMwWhbWUHcikSGJ6W0lofso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M94MB5aD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C3E0C4CEF7
	for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Apr 2026 09:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775468487;
	bh=QW0Z34FlzkocHdkzYJWLHgBMVE+fg1ukuJ3iZP6uAyU=;
	h=Subject:From:Date:To:From;
	b=M94MB5aDinYMD1j/jN/hI2XgQ83GPymmps6ZS9dsFPZu0+/u5PaptE22irLVej2zl
	 MdOw77fdg5hpBMRC6OHiQN+iE+vLC/KoUjH26ETxufAMGINdQTISr6Sg9B5KDRB7Lz
	 H1rEIOrbjvmfPlTV0uSzfzSNPPp2sfJuWYvMcsM6VvhuXyHMpJllJOnvggg63oQoKp
	 aZRG3RlwQzBHiEhENu3tubjXE1g/C/fU0z4+sUwuAEDZV4rKrchKbKpTuX22SmKzZ7
	 2Pw83kPqdKIyuDU6f02jCtDEKoFy6Xf050tQk418rbb40dDyzVUT1W0HfLCxrB4eKR
	 cscGZ7+/o/vLA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BCB723809A0A
	for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Apr 2026 09:41:07 +0000 (UTC)
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
 <177546846631.2632982.8317820798727115907.git-patchwork-summary@kernel.org>
Date: Mon, 06 Apr 2026 09:41:06 +0000
To: linux-renesas-soc@vger.kernel.org
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TAGGED_FROM(0.00)[bounces-30899-lists,linux-renesas-soc=lfdr.de,linux-renesas-soc];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	FROM_NO_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,glider.be:email,mailbox.org:email]
X-Rspamd-Queue-Id: 24A453A2AD4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: ARM: dts: renesas: Trivial DT fixes
  Submitter: Marek Vasut <marek.vasut+renesas@mailbox.org>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1073850
  Lore link: https://lore.kernel.org/r/20260327234244.91707-1-marek.vasut+renesas@mailbox.org
    Patches: [1/6] ARM: dts: renesas: r8a7778: Add missing unit to bus node
             [2/6] ARM: dts: renesas: r8a7779: Add missing unit to bus node
             [3/6] ARM: dts: renesas: r8a7792: Add missing unit to bus node
             [4/6] ARM: dts: renesas: r7s72100: Add missing unit to bus node
             [5/6] ARM: dts: renesas: genmai: Drop superfluous cells
             [6/6] ARM: dts: renesas: rskrza1: Drop superfluous cells

Series: arm64: dts: renesas: Fix missing cells and reg
  Submitter: Marek Vasut <marek.vasut+renesas@mailbox.org>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1072678
  Lore link: https://lore.kernel.org/r/20260326042411.215241-1-marek.vasut+renesas@mailbox.org
    Patches: [1/4] arm64: dts: renesas: Fix missing cells and reg in Draak/Ebisu panel DTO
             [2/4] arm64: dts: renesas: Fix missing cells and reg in Salvator-X panel DTO
             [3/4] arm64: dts: renesas: rzg2l-smarc: Fix missing cells and reg into CSI2 subnode
             [4/4] arm64: dts: renesas: rzg2l-smarc: Fix missing cells and reg into DU subnode


Total patches: 10

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



