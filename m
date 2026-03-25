Return-Path: <linux-renesas-soc+bounces-30269-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CLuSBBYmxGm9wwQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30269-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 19:14:46 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B90932A629
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 19:14:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B03B8303321B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 18:10:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B62F63E1CF0;
	Wed, 25 Mar 2026 18:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fWyXew+2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C13C202963
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 18:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774462221; cv=none; b=iesdTxD5xQ31qgv5esKpfUUasiTjowrq++uroYnQTuObHF73IaBOcOGfXf5lkfQ2i5t5ERoASRSMZtztOTR1RWqJH9SaWlrAbiCMVQZ13JMYGL8QNfL34W4ZUoEHEXz+VCBxfziDIO52VKgtNmSkqKR1BOPM0BGXvxSDKvCvLA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774462221; c=relaxed/simple;
	bh=x5JdKRKij5J+F3Tur+SK4UcHYGXOZBZACgDRljMmNHA=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=kyvVMBag4o8mMd/TfRYvPwd2mGNefOA0Tvn1Sg4rE4YY/UHaVnq3nrm+0F6xBMZ28LfMmtnLlUwXCWAW/Jek3LVhSAHSRLbzqLXsjPU9vaOu1eQup3yxacKctJE5N/h45OGD+koFr0Gk3rWCYYv34+6DL/zZll3dUYnpyPzJ7MQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fWyXew+2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8DEEC4CEF7
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 18:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774462220;
	bh=x5JdKRKij5J+F3Tur+SK4UcHYGXOZBZACgDRljMmNHA=;
	h=Subject:From:Date:To:From;
	b=fWyXew+2GwmLwGgqjnvvEG4AIl8XbWQlfmhsQNbatKVJAI3+8KfQbkgOWETOQN5Sy
	 Vq9mQ2kS423FhbsMGJ73Dabbx9qHhUQRC0Yd9+SZxw19ZUW7gsCyYo8P++YEjSkVvm
	 6R0JBVsbbc/EBJcvCTjIR2FwbTDdNMNVMaZAYV1CUtFplxMvk0Eh+gggxGdxC3L7cK
	 lXx9/YR0O/Obc2nIzXLUfcBWf+bbYLOMZqCWZRh8OweDQFlu00CBby/UP++kACIYW0
	 gh7Emnm4XGeal2NQTZ2SUC+AQowu+N6GmL4haKW+QtPwcrG92Sv2SzmKAFl6Ino/ip
	 hfd6l/8ycthlg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 0556B3809A04
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 18:10:09 +0000 (UTC)
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
 <177446220746.1745070.11837570517448242905.git-patchwork-summary@kernel.org>
Date: Wed, 25 Mar 2026 18:10:07 +0000
To: linux-renesas-soc@vger.kernel.org
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TAGGED_FROM(0.00)[bounces-30269-lists,linux-renesas-soc=lfdr.de,linux-renesas-soc];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	FROM_NO_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mailbox.org:email,renesas.com:email,glider.be:email]
X-Rspamd-Queue-Id: 6B90932A629
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: arm64: dts: renesas: Fix PHY C22 compatible strings
  Submitter: Marek Vasut <marek.vasut+renesas@mailbox.org>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1066471
  Lore link: https://lore.kernel.org/r/20260313164008.40933-1-marek.vasut+renesas@mailbox.org
    Patches: [1/4] arm64: dts: renesas: Drop RTL8211E PHY C22 compatible string
             [2/4] arm64: dts: renesas: Drop RTL8211F PHY C22 compatible string
             [3/4] arm64: dts: renesas: Drop KSZ9131 PHY C22 compatible string
             [4/4] arm64: dts: renesas: Fix KSZ9131 PHY bogus txdv-skew-psec property

Series: PCI: renesas: Add RZ/G3E PCIe controller support
  Submitter: John Madieu <john.madieu.xa@bp.renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1068516
  Lore link: https://lore.kernel.org/r/20260318085119.44717-1-john.madieu.xa@bp.renesas.com
    Patches: [v9,1/4] clk: renesas: r9a09g047: Add PCIe clocks and reset
             [v9,2/4] arm64: dts: renesas: r9a09g047: Add PCIe node
             [v9,3/4] arm64: dts: renesas: r9a09g047e57-smarc-som: Add PCIe reference clock
             [v9,4/4] arm64: dts: renesas: r9a09g047e57-smarc: Enable PCIe

Patch: arm64: dts: renesas: sparrow-hawk: Add overlay for Olimex MIPI-HDMI adapter
  Submitter: Marek Vasut <marek.vasut+renesas@mailbox.org>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1069621
  Lore link: https://lore.kernel.org/r/20260320025328.509003-1-marek.vasut+renesas@mailbox.org

Patch: [v2] ARM: dts: r9a06g032: Add #address-cells in the GIC node
  Submitter: Herve Codina <herve.codina@bootlin.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1072169
  Lore link: https://lore.kernel.org/r/20260325095718.388157-1-herve.codina@bootlin.com

Patch: [V2] arm64: dts: beacon-renesom-baseboard: Remove LVDS Panel
  Submitter: Adam Ford <aford173@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1072424
  Lore link: https://lore.kernel.org/r/20260325162735.24467-1-aford173@gmail.com

Series: [v3,1/2] drm/panel: simple: Add Waveshare 13.3" panel support
  Submitter: Marek Vasut <marek.vasut+renesas@mailbox.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1043562
  Lore link: https://lore.kernel.org/r/20260117005028.126361-1-marek.vasut+renesas@mailbox.org
    Patches: [v3,1/2] drm/panel: simple: Add Waveshare 13.3" panel support
             [v3,2/2] arm64: dts: renesas: sparrow-hawk: Add overlay for WaveShare Display 13.3"

Patch: arm64: dts: renesas: sparrow-hawk: Reserve first 128 MiB of DRAM
  Submitter: Marek Vasut <marek.vasut+renesas@mailbox.org>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1071705
  Lore link: https://lore.kernel.org/r/20260324143342.17872-1-marek.vasut+renesas@mailbox.org

Series: Remove WDT{0,2,3} support from RZ/V2N
  Submitter: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1071954
  Lore link: https://lore.kernel.org/r/20260324225239.19136-1-fabrizio.castro.jz@renesas.com
    Patches: [1/2] arm64: dts: renesas: r9a09g056: Remove wdt{0,2,3} nodes


Total patches: 15

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



