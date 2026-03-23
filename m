Return-Path: <linux-renesas-soc+bounces-30096-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8Ay7EGAUwWnkQQQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30096-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Mar 2026 11:22:24 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id EECC82EFEFC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Mar 2026 11:22:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 788953001FC2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Mar 2026 10:21:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90C5038B145;
	Mon, 23 Mar 2026 10:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d8pM5RzD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D08E32D0D4
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Mar 2026 10:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774261278; cv=none; b=bpSMxLZBcwv2/kEdXXJ1c9DqchDqw0dpWsnW2WMSnv5vUWkVPC/tp9TB4jt4LYA+lsgjOBgGM/vIdmOzg/A8iFcCPxxVpd69EpGfiwEzpTUYVAWlfTkjLUz0pic9xWVYN34MPfVt2lVYvz7tEGBNesJwuu3MJfou2ZTxsT/JTy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774261278; c=relaxed/simple;
	bh=dDlHE0Gyp0bDPpnnac0QL/igAVCZ5SilP6M4SDetADU=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=f+1ld7/hhZGSnGlq9X0EL0K8XCxhO27598WhQejTpf+AZ6XnBovJ6WqqEVU3fQOFOIdyQg+H7HHYiRnYXyH++T+tJTM+kZsB9XdIEIc6m8waV3CJCnqtdOM635KALuuU+kdy6vGOIDtXNuLrrTAlo2QO3G4h+kdG/hAhDP22mns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d8pM5RzD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0026EC2BC87
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Mar 2026 10:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774261278;
	bh=dDlHE0Gyp0bDPpnnac0QL/igAVCZ5SilP6M4SDetADU=;
	h=Subject:From:Date:To:From;
	b=d8pM5RzDhpKmRSRIjGDN9C4RuwRndHQ1XRyXdXIUZBvem07hIr8ZFK2J6k9x1wsUE
	 JGiAyxXFJFJ0+vlQdz3DvUp1S9hKSUEeoaU6apaUEtc2/CEOiqfhHVB238coBRRGpF
	 CnMfCbh16D8nX18/aNMmEjjSQ7/lQDZySlXRHg6uQH/zp4xA87qBbahuhGaUS6kliI
	 +VcIHy0sVleqrhSeTdgG0KpYAHFDmThi4ss5W0txj8Uk+8S7inuzjglQTx1MWEmqzY
	 rMMjqhKbIZYNTyDqWIlJRNty0tugFpjnhT7IlTVtIZYQxLSQazfF6OnAfYzTNn5sxa
	 D4UJXM3yhVgfw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BCED23808200
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Mar 2026 10:21:07 +0000 (UTC)
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
 <177426126636.3797901.3864166561622412532.git-patchwork-summary@kernel.org>
Date: Mon, 23 Mar 2026 10:21:06 +0000
To: linux-renesas-soc@vger.kernel.org
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TAGGED_FROM(0.00)[bounces-30096-lists,linux-renesas-soc=lfdr.de,linux-renesas-soc];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EECC82EFEFC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: Add RSPIs support for RZ/G3E SoC
  Submitter: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1054929
  Lore link: https://lore.kernel.org/r/cover.1771344527.git.tommaso.merciai.xr@bp.renesas.com
    Patches: [1/5] clk: renesas: r9a09g047: Add entries for the RSPIs
             [4/5] arm64: dts: renesas: r9a09g047: Add RSPI nodes
             [5/5] arm64: dts: renesas: r9a09g047e57-smarc: Enable RSPI0


Total patches: 3

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



