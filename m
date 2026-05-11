Return-Path: <linux-renesas-soc+bounces-32364-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GFq4OVOnAWpDhQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32364-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 11:54:27 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5445F50B64A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 11:54:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1276D304BF39
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 09:42:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84C13322C67;
	Mon, 11 May 2026 09:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s/liYz4k"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D0A3112BD
	for <linux-renesas-soc@vger.kernel.org>; Mon, 11 May 2026 09:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778492564; cv=none; b=VKeTmUOcfFuO5zhGjWWNZKT4GnzJDhAWFSFK0XwCzecxzizEtS9pjeA+p6hyK4VOzbXF6/d+iJb2Lz8Dx/TPUb3tYB4asWEajvDneOCVZVnzDeTbKLwktpnS8zuqCbpmQkgxD4ivlburLxVTh5R80a6iI95REq3HNUqz2kxMaoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778492564; c=relaxed/simple;
	bh=am4ssGfc/zP8NqFSfCU+R4R9BeG9SKCc8UfAR5bwL00=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=gJcUa1rkjQ4DcEV435OoT683kHnU5cJsxjkQHn0J/LiTOD/keDnZOmooEujzrnq2SO4L7j+zb0iWYWI09GIrm1j8JIK3Y0sraaQJr3zvuYSYhaiYzTqnEJRX5hyJ9GQvp2oamugWVRiI+AhBcdHHPUp/Ushiqiu+8VFaSR+5aeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s/liYz4k; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02C06C2BCFC
	for <linux-renesas-soc@vger.kernel.org>; Mon, 11 May 2026 09:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778492564;
	bh=am4ssGfc/zP8NqFSfCU+R4R9BeG9SKCc8UfAR5bwL00=;
	h=Subject:From:Date:To:From;
	b=s/liYz4kYydyhl5HsqJpk3aDsyxpCvDiWLbm+ie712RZNpCgB1iP6rqOP45m7KnPQ
	 bfw+w6MsEeTTe/a9hlBdkgMNahIjaciZRlqFd/HEVSPaC1Twf0mPLM5tYmI8IfWNB8
	 mt1oX9HO+/eiLLjobMC3mdZaoF2s/X1GPxhOae5ptXTyWq/RXaN0FAoqPIO8NrvjLq
	 reET4p55QgWExGmfqmM6QnX1MwcLQoJtVjOwMOpzkk1sDoz1ugFPDLF/6U5jcS52k6
	 /Uz9rV/Pvy0VLTiH/V54klfNFRegwrG5tuC5D/lZgeNIsUBQcR3XOGjlvgLTOdgoVr
	 +XC6sG5wdcHXA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 0589B3930212
	for <linux-renesas-soc@vger.kernel.org>; Mon, 11 May 2026 09:41:52 +0000 (UTC)
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
 <177849251054.2129965.1313095558573106518.git-patchwork-summary@kernel.org>
Date: Mon, 11 May 2026 09:41:50 +0000
To: linux-renesas-soc@vger.kernel.org
X-Rspamd-Queue-Id: 5445F50B64A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TAGGED_FROM(0.00)[bounces-32364-lists,linux-renesas-soc=lfdr.de,linux-renesas-soc];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	FROM_NO_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mailbox.org:email,glider.be:email]
X-Rspamd-Action: no action

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: Enable watchdog on RZ/G3L SMARC EVK
  Submitter: Biju <biju.das.au@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1089902
  Lore link: https://lore.kernel.org/r/20260505125921.149682-1-biju.das.jz@bp.renesas.com
    Patches: [1/2] arm64: dts: renesas: r9a08g046: Add wdt device node
             [2/2] arm64: dts: renesas: rzg3l-smarc-som: Enable watchdog

Series: Add more support to Renesas RZ/G3L SMARC EVK
  Submitter: Biju <biju.das.au@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1088135
  Lore link: https://lore.kernel.org/r/20260430125342.439755-1-biju.das.jz@bp.renesas.com
    Patches: [v3,1/6] arm64: dts: renesas: r9a08g046: Add OPP table
             [v3,2/6] arm64: dts: renesas: r9a08g046: Add ICU node
             [v3,3/6] arm64: dts: renesas: r9a08g046: Add pincontrol node
             [v3,4/6] arm64: dts: renesas: r9a08g046l48-smarc: Add SCIF0 pincontrol
             [v3,5/6] arm64: dts: renesas: rzg3l-smarc-som: Add pinctrl configuration for ETH0
             [v3,6/6] arm64: dts: renesas: rzg3l-smarc-som: Enable eth1 (GBETH1) interface

Series: Enable Renesas RZ/G3L GBETH0
  Submitter: Biju <biju.das.au@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1072893
  Lore link: https://lore.kernel.org/r/20260326111953.31024-1-biju.das.jz@bp.renesas.com
    Patches: [v3,1/2] arm64: dts: renesas: r9a08g046: Add GBETH nodes
             [v3,2/2] arm64: dts: renesas: rzg3l-smarc-som: Enable eth0 (GBETH0) interface

Patch: [net,v2] net: rtsn: fix mdio_node leak in rtsn_mdio_alloc()
  Submitter: Shitalkumar Gandhi <shital.gandhi45@gmail.com>
  Committer: Jakub Kicinski <kuba@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1089886
  Lore link: https://lore.kernel.org/r/20260505123236.406000-1-shitalkumar.gandhi@cambiumnetworks.com

Series: [1/2] arm64: dts: renesas: ebisu: Sort sound node
  Submitter: Marek Vasut <marek.vasut+renesas@mailbox.org>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1089527
  Lore link: https://lore.kernel.org/r/20260504225515.114986-1-marek.vasut+renesas@mailbox.org
    Patches: [1/2] arm64: dts: renesas: ebisu: Sort sound node
             [2/2] arm64: dts: renesas: salvator-common: Sort sound node

Patch: arm64: dts: renesas: gray-hawk: Fix AVB0 PHY node alignment
  Submitter: Marek Vasut <marek.vasut+renesas@mailbox.org>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1089526
  Lore link: https://lore.kernel.org/r/20260504225428.114959-1-marek.vasut+renesas@mailbox.org


Total patches: 14

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



