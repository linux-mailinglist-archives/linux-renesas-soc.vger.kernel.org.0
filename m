Return-Path: <linux-renesas-soc+bounces-27474-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UB0rNaOWeGnmrAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27474-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Jan 2026 11:42:43 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D1F92FC6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Jan 2026 11:42:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 368B03051879
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Jan 2026 10:40:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DECB4342C8B;
	Tue, 27 Jan 2026 10:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xh5cpdJH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC13B342534
	for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Jan 2026 10:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769510412; cv=none; b=lzE9UUlYplyJZwZ097Alon9GivIcNFVbKfm2eoN23OTrQpOn5F38QtA/TJcjPOGvySla/cLO0jAY0mEOdxlgY6PW1II1vDDGn5s6XwfMer1ylqir73kue3/PDgT8rfL7Puqr9lDSBKYmPNktt9CRGYptpr/MILyw0j3wxxjQ5iI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769510412; c=relaxed/simple;
	bh=egQHk+5Xx7Q/RSVH5dNyKFqdpC17P2pp5Er5wcWYMIA=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=NULB93SUaU0aoBWg8riX0cJUVDMEEzy7pZDWp6qVHZE4a0rQd5+INluCbK65WBg9CbfY+IBUreaFUikxW9dxzCU6yvzhn/4FAB0XiziUqr0GR6ZAbLzwvnxyDiyEK495l2YwPjrMNePS0ZneCXBmJViDie0nhipMCG4KLwyd+4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xh5cpdJH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59206C2BCB1
	for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Jan 2026 10:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769510412;
	bh=egQHk+5Xx7Q/RSVH5dNyKFqdpC17P2pp5Er5wcWYMIA=;
	h=Subject:From:Date:To:From;
	b=Xh5cpdJHsKdCeyGZDin/Dhgma+dI41HfE3eNcjNusGoc2w7gk59KFJnI9KoGOprKR
	 TloOFjAGep762BdQLGMQoo9lCIUBi+gS1QzTK5IavwWilU7ZJXdK/8AqvcxcwTY/YF
	 INk5cxWSPdV6I8cSxSOuVcek+/nYwgDBFJi6W3kjUj4mnHRutW0vL4BF4rBmXEveBL
	 //MjTaVRUQJQQbhUvgIqpw10CzCcqlaDEfO//8FkfLfgRPZGA3zxYKO5wgq4rnQgCL
	 aoGvXPM6b0QWBE3Xs7FFCDYvm4whFaZNiHluz1cZ90PkdqmSdyxuWahjppbwDdt/0c
	 aSH5m2jBUSCFA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 8E4EA380A970
	for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Jan 2026 10:40:07 +0000 (UTC)
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
 <176951040615.785977.13488990367083445637.git-patchwork-summary@kernel.org>
Date: Tue, 27 Jan 2026 10:40:06 +0000
To: linux-renesas-soc@vger.kernel.org
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-27474-lists,linux-renesas-soc=lfdr.de,linux-renesas-soc];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: 10D1F92FC6
X-Rspamd-Action: no action

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: Describe PCIe/USB3.0 clock generator on R-Car Gen3
  Submitter: Marek Vasut <marek.vasut+renesas@mailbox.org>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1043791
  Lore link: https://lore.kernel.org/r/20260118135038.8033-1-marek.vasut+renesas@mailbox.org
    Patches: [v2,1/9] arm64: dts: renesas: r8a77951: Describe PCIe root ports
             [v2,2/9] arm64: dts: renesas: r8a77960: Describe PCIe root ports
             [v2,3/9] arm64: dts: renesas: r8a77961: Describe PCIe root ports
             [v2,4/9] arm64: dts: renesas: r8a77965: Describe PCIe root ports
             [v2,5/9] arm64: dts: renesas: r8a77990: Describe PCIe root port
             [v2,6/9] arm64: dts: renesas: r8a77990: Add USB 3.0 PHY and USB3S0 clock nodes

Patch: arm64: dts: renesas: sparrow-hawk: Mark OTP and HSCIF0 pins as bootph-all
  Submitter: Marek Vasut <marek.vasut+renesas@mailbox.org>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1041457
  Lore link: https://lore.kernel.org/r/20260112234642.225993-1-marek.vasut+renesas@mailbox.org

Series: Add RTC support for the Renesas RZ/V2N SoC
  Submitter: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1046807
  Lore link: https://lore.kernel.org/r/20260125192706.27099-1-ovidiu.panait.rb@renesas.com
    Patches: [1/5] clk: renesas: r9a09g056: Fix ordering of module clocks array
             [4/5] arm64: dts: renesas: r9a09g056: Add RTC node
             [5/5] arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Enable RTC


Total patches: 10

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



