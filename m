Return-Path: <linux-renesas-soc+bounces-30392-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ePNfFrOKxWlc+wQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30392-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 20:36:19 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2AD33AFE7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 20:36:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DEE61305329E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 19:30:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49DDC346E47;
	Thu, 26 Mar 2026 19:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tKuJMLZg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 269E6334695
	for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 19:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774553421; cv=none; b=geIsNhZ8PLpMNo/jyeILFsHxAQRxqGKzJORtpb7MUzji37YdW+GTohEEHQaZv+PxpZ6fueW3LSesyLZQFh6XZizKcw9agkND7ITmTb19DvOz5UiIE2AVF1q1AdmqyuJUJOmqnHNZZ8j1jROMziHo1rCMTOtHMlk/NAzGAGFSizo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774553421; c=relaxed/simple;
	bh=Kni4jxCumsBGiDOwcB447zCVJA09V+2hjKxe9ps7HeU=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=Wid4wMp+hijaIK2pWhC++YPz/0aBVDNiN9hdwibJtN07vxcWax9anwVE3WQ26qXScf+PNo9ggkX8YgnzJmX5Pnzq9XME1YjuWTRE7bKQAzsGlBkQpeDRqn1MIxPtE8wHJO8upcMroYbppVBkkAkVHL1Rks2O3+c6jhpseO9PMac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tKuJMLZg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D570AC116C6
	for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 19:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774553420;
	bh=Kni4jxCumsBGiDOwcB447zCVJA09V+2hjKxe9ps7HeU=;
	h=Subject:From:Date:To:From;
	b=tKuJMLZgp2bn4MNAr7sZqAC+VPaAPG2zPNxAlcVbK6pg3kXs9weCxU+faqTbHVkV3
	 pFjeJQHpHVsAZbARggoqzphmeGX08mnCdydRIMtPxR7djW2l+mltG0DvXiokyPu4Mb
	 EnUiBzle1cwaJTSwnGQo3AjcES18aYtVOYNVXev9HDu7dNAajRBi8h7d+0h7MbrvZf
	 EKDmGyMTAIPUzBiAkO/XLQ5rspz6mjOeHYR3HFP2QUEBN77VGxcbV878jnb2iRgVWe
	 FhQ6SKjNH7lUC7sPLM5UTXeo1SwHOSh2ZmSSJeM+FK69fGrcZBodi3e8Dywe1efGlN
	 XS+JdMCK5AHAw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7F8A939F2038
	for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 19:30:08 +0000 (UTC)
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
 <177455340710.3145559.14856361997050498305.git-patchwork-summary@kernel.org>
Date: Thu, 26 Mar 2026 19:30:07 +0000
To: linux-renesas-soc@vger.kernel.org
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
	TAGGED_FROM(0.00)[bounces-30392-lists,linux-renesas-soc=lfdr.de,linux-renesas-soc];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mailbox.org:email,renesas.com:email,denx.de:email]
X-Rspamd-Queue-Id: 9D2AD33AFE7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: Add support for Renesas RZ/G3L SoC and SMARC-EVK platform
  Submitter: Biju <biju.das.au@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1071601
  Lore link: https://lore.kernel.org/r/20260324114329.268249-1-biju.das.jz@bp.renesas.com
    Patches: [v8,01/11] dt-bindings: clock: Document RZ/G3L SoC
             [v8,08/11] arm64: dts: renesas: Add initial DTSI for RZ/G3L SoC
             [v8,09/11] arm64: dts: renesas: Add initial support for RZ/G3L SMARC SoM
             [v8,10/11] arm64: dts: renesas: renesas-smarc2: Move usb3 nodes to board DTS
             [v8,11/11] arm64: dts: renesas: Add initial device tree for RZ/G3L SMARC EVK board

Series: [1/2] ARM: dts: renesas: Drop ethernet-phy-ieee802.3-c22 from PHY compatible string on all RZ boards
  Submitter: Marek Vasut <marex@denx.de>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=866875
  Lore link: https://lore.kernel.org/r/20240630034649.173229-1-marex@denx.de
    Patches: [1/2] ARM: dts: renesas: Drop ethernet-phy-ieee802.3-c22 from PHY compatible string on all RZ boards

Patch: ARM: dts: renesas: rza2mevb: Drop RTL8211F PHY C22 compatible string
  Submitter: Marek Vasut <marek.vasut+renesas@mailbox.org>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1072696
  Lore link: https://lore.kernel.org/r/20260326045416.223556-1-marek.vasut+renesas@mailbox.org

Series: Add versaclock3 support for RZ/V2H
  Submitter: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1060166
  Lore link: https://lore.kernel.org/r/20260302165441.4457-1-ovidiu.panait.rb@renesas.com
    Patches: [v4,1/7] clk: versaclock3: Fix NULL pointer dereference in error path
             [v4,7/7] arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Add versa3 clock generator node

Patch: ARM: dts: renesas: Drop KSZ8041 PHY C22 compatible string
  Submitter: Marek Vasut <marek.vasut+renesas@mailbox.org>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1072697
  Lore link: https://lore.kernel.org/r/20260326045523.223620-1-marek.vasut+renesas@mailbox.org

Patch: ARM: dts: renesas: r8a7742-iwg21d-q7-dbcm-ca: Drop KSZ8081 PHY C22 compatible string
  Submitter: Marek Vasut <marek.vasut+renesas@mailbox.org>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1072695
  Lore link: https://lore.kernel.org/r/20260326045355.223529-1-marek.vasut+renesas@mailbox.org


Total patches: 11

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



