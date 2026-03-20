Return-Path: <linux-renesas-soc+bounces-29993-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aL2bAlwkvWmr6wIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29993-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Mar 2026 11:41:32 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0528B2D8E27
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Mar 2026 11:41:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 244153023DA0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Mar 2026 10:40:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65C26394785;
	Fri, 20 Mar 2026 10:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bSAEjUlJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 428E7394496
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Mar 2026 10:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774003216; cv=none; b=DRCuySPKQAk/8D03SKESQ3MCPRo5h/K7hx4jjhL54qei8SXdZnB0rHu3vwdw4tUgVQYLot6k4zTTd4yYf8hqZOdEpxyl84iXReAXZEfqJDLEEun44NnzBloDFON8pZWbl3Ud0y2wLqyPIAh32VGEEtHhWsgWz6Tj+sKnG3oH2yI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774003216; c=relaxed/simple;
	bh=M/0dI1SEO2DRESipZItikG8x0aFW6XLHk8QhQJm9qH0=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=arN0YWK1chfYTqIplfYzPfHHMkHjbusanktHZeLTAhSRThcqmlnmarmE8dSkeSd375oUppqJ6S7qdlcS97kVIkqy9vQnBj5JYGjx2AyTlGK+cjs6OIuJaV6a0c+mWphNRlI1TZIz2EdvzclaW2FMSG1U5Wzk80yYPpWamzg7Cqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bSAEjUlJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0C98C2BCAF
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Mar 2026 10:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774003215;
	bh=M/0dI1SEO2DRESipZItikG8x0aFW6XLHk8QhQJm9qH0=;
	h=Subject:From:Date:To:From;
	b=bSAEjUlJimKFsdLDjunLMe4H422i5f0uc7+7IeyExh5ipmQ7tqkICjsXlJ+kZ/psZ
	 SXRxAhuA07lLWebau8vDTgH4d3MfsSVlk+/UhP0TbwfPAwisf/zIKfF4GxtMpc3G/x
	 9dJGPi/lmKNdzbZcELpQB3ZpLF60utrDcD/TunwNNKA+xyXz8RX8HXBEBHb8snc2Zv
	 iRtNSwT4SFeHX/cR+ER6EDYXrrIOxttjrS1ashYnX72XbIuRRFmrIEKouIjLy15ZTN
	 yz+zAY0IUzb5SCt7TwFGoP1ihmngKghLMj4tnLPFhKy+Tyd9d11F7bOM90wOWEsJkJ
	 hYdPBCddDL6Rw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7F7E7380820D
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Mar 2026 10:40:07 +0000 (UTC)
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
 <177400320609.2020118.11855834168408052986.git-patchwork-summary@kernel.org>
Date: Fri, 20 Mar 2026 10:40:06 +0000
To: linux-renesas-soc@vger.kernel.org
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TAGGED_FROM(0.00)[bounces-29993-lists,linux-renesas-soc=lfdr.de,linux-renesas-soc];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	FROM_NO_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0528B2D8E27
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: arm64: dts: renesas: rzn2h/rzt2h: Add PHY interrupt support
  Submitter: Lad, Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1065764
  Lore link: https://lore.kernel.org/r/20260312160407.3387840-1-prabhakar.mahadev-lad.rj@bp.renesas.com
    Patches: [1/2] arm64: dts: renesas: r9a09g087m44-rzn2h-evk: Add PHY interrupt support
             [2/2] arm64: dts: renesas: r9a09g077m44-rzt2h-evk: Add PHY interrupt support

Patch: arm64: dts: renesas: rzt2h-rzn2h-evk: Fix GMAC pins sort order
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1068664
  Lore link: https://lore.kernel.org/r/4ce75f75a0569a4cc6f74dfda8b75f6f1a2495c1.1773842409.git.geert+renesas@glider.be

Series: arm64: dts: renesas: Fix SD0 failures on RZ/{T2H, N2H} and RZ/V2H
  Submitter: Lad, Prabhakar <prabhakar.csengg@gmail.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1046489
  Lore link: https://lore.kernel.org/r/20260123225957.1007089-1-prabhakar.mahadev-lad.rj@bp.renesas.com
    Patches: [1/4] arm64: dts: renesas: rzt2h-n2h-evk: Add ramp delay for SD0 card regulator
             [2/4] arm64: dts: renesas: r9a09g077m44-rzt2h-evk: Clarify SD0 power jumpers
             [3/4] arm64: dts: renesas: r9a09g087m44-rzn2h-evk: Clarify SD0 power jumper setup


Total patches: 6

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



