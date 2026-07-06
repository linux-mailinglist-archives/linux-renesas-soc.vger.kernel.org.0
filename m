Return-Path: <linux-renesas-soc+bounces-34742-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hk+RImN9S2oRSQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34742-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 06 Jul 2026 12:03:15 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DA59B70EDE3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 06 Jul 2026 12:03:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=afd9UC99;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34742-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34742-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D618534B666B
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Jul 2026 09:22:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 605AB3F54AE;
	Mon,  6 Jul 2026 09:10:37 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7232B41D4C3
	for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Jul 2026 09:10:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783329035; cv=none; b=U8VhHwZ49a6Cl8cy430vrm7WtOQpy1nHvpfe24B3ysmOTp8eD6F5d7OunKc3wrXFDeDqx0g77gc6TkDERDvWNft0DAh29xH4ngcqVkUiss2xBGBNJ+LD/OyYVfnh6xNb0PWaSzztREHA4T0cd9WzURMyCoxq78rR7IRvxQyAuoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783329035; c=relaxed/simple;
	bh=HFIAirpKxq4Dim87YDMP8BE/1CbJFX2Gbkswc02tIus=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=KpB51yb6wQT9Z8VrnG/Y1CLp05FEVCskzDYnCE9J+fuKi+4I/tmrR+tTOSmemiyg8rWp0oQ7Y/fG03NKpQktx5Qq8R1cgS3S1jcZkKoM66mLDb0qa676n/EX0Gqr/y49TieqrczEHuEw8pdR6yUxBE5cVTp1E4woTbS3mC9AI9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=afd9UC99; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8CBB1F000E9
	for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Jul 2026 09:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783329026;
	bh=rYm8a3EGTJKmaduXlHfgfRAj2+K43IKORJXfzaLsrVg=;
	h=Subject:From:Date:To;
	b=afd9UC99b4Ye+0tk0Y35FkRAQ/6+WKXWgYJgviy27delU4StKuHxZKfSnyPQv9EOg
	 uHFMIQau2j/LqeAB/6yd+NtrvmGJtgBO3U7pX+D3z49r6L6wY3Bj8TrkjuGfhTjCIY
	 r2henyNKRFLzoGoCyN5pw+a2bmepRobcivOhCZg5eL8DHXjRDqA1pEeYIxByiAB5vx
	 liyYWXm1v/Qub8VSkIV3KiXXH6exnT8W441hacIJ4Vqxec+mZ73N2I1YeFC/+cV+mZ
	 2MyWx6Ibo8c9BYABcp2t5Kx2aebCwq10ZPzIpPOCBKahyp0o2RtYOarLyI2syrVqBG
	 9y7LIJSpuSWYA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 9618A3AB0921
	for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Jul 2026 09:10:08 +0000 (UTC)
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
 <178332900721.448273.17793584380890834586.git-patchwork-summary@kernel.org>
Date: Mon, 06 Jul 2026 09:10:07 +0000
To: linux-renesas-soc@vger.kernel.org
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34742-lists,linux-renesas-soc=lfdr.de,linux-renesas-soc];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:linux-renesas-soc@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_ONE(0.00)[1];
	FORGED_SENDER(0.00)[patchwork-bot@kernel.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,glider.be:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DA59B70EDE3

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: [PATCH/LOCAL] arm64: renesas: defconfig: Refresh for v7.2-rc1
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1119709
  Lore link: https://lore.kernel.org/r/bb081f7fe646a83c9b59764267f67116db7aa052.1782907421.git.geert+renesas@glider.be

Patch: [PATCH/LOCAL] riscv: rzfive: defconfig: Refresh for v7.2-rc1
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1119710
  Lore link: https://lore.kernel.org/r/acdb2c6320865c24bbd3bf7a83c35db21cefd21b.1782907423.git.geert+renesas@glider.be


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



