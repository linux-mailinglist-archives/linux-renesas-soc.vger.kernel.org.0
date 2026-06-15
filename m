Return-Path: <linux-renesas-soc+bounces-34000-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id U+uyBWbUL2qzHgUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34000-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 12:31:02 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5616855C7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 12:31:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=ngNWlGHO;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34000-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34000-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 551E23016259
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 10:31:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66ABD28C869;
	Mon, 15 Jun 2026 10:30:58 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C8102848A1
	for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Jun 2026 10:30:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781519458; cv=none; b=M4VOMnuGl31C0YRTD6YUxsSE9FlozN6s2K39S1JbfIf/rzgihETpdLFRPrDTah2ApS6jrth/qFDpS2Na2URgGmCniRQ2z8FiReN/aDA3QB/lSH2hb0wEUifX5j/j2X1xNXb2j9pqCff9xPdKh7LsvCTs9smPPBN5EojE+y8s2Js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781519458; c=relaxed/simple;
	bh=nGsVU1sUyPRAKXxkCwAwbbprZiXc5wF6nGcXW/egwUE=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=VYm8vzJy02JNYrjnQF25h+I1+eGyRNPI0yrBPJa5OzZYW4VKZQmnXhBBmuSNuVhA0f1XuOvp/7/EX8ry1ZtZw7fe6+Qm4spHLoREZTMMlvM37j4FGT74kzICiwl/7NlJrrVWHxYnmfrqaZryvko/Ba+suMUkp1YKNOWmwJ/Rle0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ngNWlGHO; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14C3E1F000E9
	for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Jun 2026 10:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781519457;
	bh=5wIQtFA9hxJydYzvILGR7eS37EimwpAAuW3JAxLKNIs=;
	h=Subject:From:Date:To;
	b=ngNWlGHOIGbqsN4Ld5L01LFEhM2qCVa0DTNiz+QKnR5db2zEgyRTrq7QytlG87ctE
	 n9BZYwXqkXY8MmozdDO6zjTwt4FQzN49eEncYQb8GhnY4j5k2QTjDgmScWk2OoDfZl
	 XlCz+9Fkmv4fwXG1nYc0A8ix0l/DN7QqhVAeeCARgTm2KNwRVBW9oC8zfalCviLypw
	 ce/3kb+mxBi2uFdRoA6GxYFCoVeYp8SEq7rPdDce/kFvV1hQRgjQxc+kqqS6wMyE7V
	 BdB+UuF+OuFvkh4291lVuUszMXzrgeL2ubGur0eZoUCyfw/bOEflR1e7+1qstph/ZY
	 PyYLQw5bMPC5Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 93AE43A5676B
	for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Jun 2026 10:30:53 +0000 (UTC)
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
 <178151945215.2995782.2896210149451351101.git-patchwork-summary@kernel.org>
Date: Mon, 15 Jun 2026 10:30:52 +0000
To: linux-renesas-soc@vger.kernel.org
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34000-lists,linux-renesas-soc=lfdr.de,linux-renesas-soc];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:linux-renesas-soc@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_ONE(0.00)[1];
	FORGED_SENDER(0.00)[patchwork-bot@kernel.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_NO_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,mailbox.org:email,glider.be:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7C5616855C7

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: i2c: riic: fix refcount leak in riic_i2c_resume_noirq()
  Submitter: WenTao Liang <vulab@iscas.ac.cn>
  Committer: Andi Shyti <andi.shyti@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1107536
  Lore link: https://lore.kernel.org/r/20260608071123.128964-1-vulab@iscas.ac.cn

Series: [1/3] arm64: dts: renesas: r8a77965-salvator-x: Enable GPU support
  Submitter: Marek Vasut <marek.vasut+renesas@mailbox.org>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1109595
  Lore link: https://lore.kernel.org/r/20260611005952.146825-1-marek.vasut+renesas@mailbox.org
    Patches: [1/3] arm64: dts: renesas: r8a77965-salvator-x: Enable GPU support
             [2/3] arm64: dts: renesas: r8a77965-salvator-xs: Enable GPU support
             [3/3] arm64: dts: renesas: r8a77965-ulcb: Enable GPU support

Patch: [v2] spi: rzv2h-rspi: Fix SPDR read access width for 16-bit RX
  Submitter: Felix Gu <ustc.gu@gmail.com>
  Committer: Mark Brown <broonie@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1109244
  Lore link: https://lore.kernel.org/r/20260610-rzv2h-rspi-v2-1-40c80b4a2c90@gmail.com

Series: ASoC: renesas: fsi: Fix system hang by adding SPU clock
  Submitter: Bui Duc Phuc <phucduc.bui@gmail.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1108533
  Lore link: https://lore.kernel.org/r/20260609113836.45079-1-phucduc.bui@gmail.com
    Patches: [v6,01/11] ASoC: dt-bindings: renesas,fsi: add support multiple clocks
             [v6,02/11] ARM: dts: renesas: r8a7740: Add clocks for FSI

Patch: ARM: shmobile: rcar-gen2: Use of_machine_compatible_match() helper
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1105392
  Lore link: https://lore.kernel.org/r/2230eb28da9b8d8bdee4e4fd7e19dc8f074531bc.1780499233.git.geert+renesas@glider.be


Total patches: 8

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



