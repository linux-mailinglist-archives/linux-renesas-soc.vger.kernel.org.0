Return-Path: <linux-renesas-soc+bounces-34578-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7cvGJ4cnRGrrpgoAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34578-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jun 2026 22:31:03 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 470976E7D63
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jun 2026 22:31:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Fn+FDHTL;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34578-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34578-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B1DD4301FF21
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jun 2026 20:31:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1313382368;
	Tue, 30 Jun 2026 20:30:59 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E5D3C4B68
	for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Jun 2026 20:30:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782851459; cv=none; b=sGtXeqm5ZwpJvk/5yN6eneUI6jmdjHXrp2wJSCltFJ0SGrjxDwDZfnwVW4LV7e9KT/o+WGMDOWqE3m65MsFI9hH/BLkf2THw9QQYgcGyY7CtTG0QaBbCdjhZCfJSsLSquVEeZ3KkRwnx9WrNAZXtzUAlt9XArSprN9bmXLRylCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782851459; c=relaxed/simple;
	bh=J18Zeh6Bn2zL3wQrGBUUSOws9ZfzBxt/QiMKLS3YPWw=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=o6S77QlV1kvEKg5r/LrN5ta8Tte5wc4a93ZZeERRL9BPKfSsLa9WOR210f+iE240MzvLkog6bJqPLr2pGm/5XzZ0BaXtUp+O77RDVzQfgguhTAFNZhQGjmd7Z6YFBxXoK257z3tPh8AUOtFv4t3cbj7gRj4g7m6Jwc4VAV3ZKrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fn+FDHTL; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 703221F000E9
	for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Jun 2026 20:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782851458;
	bh=gApZDvx+AytDktRyOcyzPAmleb3jQr5ckJUsi9DrFJo=;
	h=Subject:From:Date:To;
	b=Fn+FDHTLi7S34RDqCBRnkea6NCCqSe7ljjBZIYRYEFHm31xBJnuivAQKb7aqlJ2Ct
	 Gzkqht6Kxwb5GLeSataqKFyofQ/L2XlTODlcTF8nS2g6uz++b3ijRiNFgz6jTdHbv5
	 o7jg7JDRW+CfFWAwjsIPYlFfnqhSe0+5FDEweaXFGIVo/UiX42wtbYZ5c5kuQbZ2bj
	 FBXrDTPvCY8gDDqsfchyM8yBC5qQiV6PVzsrc7Bwpo2NkJdjArwpmdGEVFGN3egBys
	 PfciPG5BANfkTR6f6dpLlYnhVmdjezHcrVbCHi6OF/gq04ogiHr9mT35DOsgwT8umB
	 o9xcwXWZZgbEA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 93EC1393A951
	for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Jun 2026 20:30:43 +0000 (UTC)
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
 <178285144224.267316.3370606023801739085.git-patchwork-summary@kernel.org>
Date: Tue, 30 Jun 2026 20:30:42 +0000
To: linux-renesas-soc@vger.kernel.org
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34578-lists,linux-renesas-soc=lfdr.de,linux-renesas-soc];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:linux-renesas-soc@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_ONE(0.00)[1];
	FORGED_SENDER(0.00)[patchwork-bot@kernel.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,glider.be:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 470976E7D63

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: ARM: dts: renesas: r9a06g032-rzn1d400-eb: Enable SPI and FRAM
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1117262
  Lore link: https://lore.kernel.org/r/20260626180326.9593-1-wsa+renesas@sang-engineering.com
    Patches: [v4,1/4] spi: dt-bindings: snps,dw-apb-ssi: drop superfluous RZ/N1 entry
             [v4,3/4] ARM: dts: renesas: r9a06g032: Describe SPI controllers
             [v4,4/4] ARM: dts: renesas: r9a06g032-rzn1d400-eb: Enable SPI-FRAM

Patch: arm64: dts: renesas: rzt2h-n2h-evk-common: Add memory nodes
  Submitter: Lad, Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1114861
  Lore link: https://lore.kernel.org/r/20260622170733.1703585-1-prabhakar.mahadev-lad.rj@bp.renesas.com


Total patches: 4

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



