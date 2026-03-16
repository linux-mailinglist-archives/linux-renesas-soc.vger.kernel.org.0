Return-Path: <linux-renesas-soc+bounces-29469-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OBA3MAvct2mcWAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29469-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 11:31:39 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A1A297F10
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 11:31:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D9D823001592
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 10:31:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9E0030CD82;
	Mon, 16 Mar 2026 10:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CHghwczX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C82641F872D
	for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Mar 2026 10:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773657093; cv=none; b=a/Rxo+IayU7j96jR5T+QhJIV1N9jezDrPplqGJlX13iNsGZCCpjY4y4L6R3dCZSvlL7I/iBGASkcC7ReoTeFQXT7QgUre/XVmzE9RUKP07BZ4gt9tRcogGyPO2SIgDV/4wlFaBxGYluWpW7TKlaui91HHWJJyrR2DL3SK1sFtQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773657093; c=relaxed/simple;
	bh=X6NY9FRsBJc3ny9aW7MaQe70OU6tAmoZBxgGtxIgVVE=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=U0V2r5Xwh7bc8bAhQpKqYeWRYJK25eoqRsRBRuDS71dhNE0Ib0tI4G7ofkqtJTUa804koMS32N0vjPy+iCqiV21WE/kOJ9o50kkHRwVCSUlBGUQT/aw62yg2dXlN1Gev0PL7VP9PzGjpf/fQ1OQzcaUcgU2kl99fNtaly8QS43Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CHghwczX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79015C19421
	for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Mar 2026 10:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773657093;
	bh=X6NY9FRsBJc3ny9aW7MaQe70OU6tAmoZBxgGtxIgVVE=;
	h=Subject:From:Date:To:From;
	b=CHghwczXFAg25BDbwYnDZz3fV7bV2eVe5y1VY5PXn4CPsjG/cuhAYsx38LNRVfbjU
	 WDQ55TMD/Ow9cQeAIPq6dGIumxa8lx+APSYnAm6hpjw4lz8xOIYemBr31i6FSGnWX6
	 HDjAwLfEVSeondV870q5aBud9eY9/u5Gq5w7N230GlYJTkY/8PkBpch4HluhbYQCjA
	 7O99PD5c/YP/CYDABWsgtP4iYtj1x73ccO3S0zOiH8nqrND8gsCQTrqRYAJY/qJGHz
	 joy5+ZgCGMOX1cnB3fqnlvUsAoGcCxFFqruHFYh7AEpi0eB7bFMQPcOBk6/L9Zghg0
	 Lm6TYpIM6QSRQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BCCE13808200
	for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Mar 2026 10:31:27 +0000 (UTC)
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
 <177365708627.2594954.1970225303530571313.git-patchwork-summary@kernel.org>
Date: Mon, 16 Mar 2026 10:31:26 +0000
To: linux-renesas-soc@vger.kernel.org
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TAGGED_FROM(0.00)[bounces-29469-lists,linux-renesas-soc=lfdr.de,linux-renesas-soc];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	FROM_NO_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,glider.be:email]
X-Rspamd-Queue-Id: C2A1A297F10
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: soc: renesas: r9a09g047/056/057-sys: Mark sys_init_data as __initconst
  Submitter: Lad, Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1063801
  Lore link: https://lore.kernel.org/r/20260309165946.3003731-1-prabhakar.mahadev-lad.rj@bp.renesas.com
    Patches: [1/3] soc: renesas: r9a09g057-sys: Mark rzv2h_sys_init_data as __initconst
             [2/3] soc: renesas: r9a09g047-sys: Mark rzg3e_sys_init_data as __initconst
             [3/3] soc: renesas: r9a09g056-sys: Mark rzv2n_sys_init_data as __initconst

Patch: ARM: shmobile: rcar-gen2: Use of_phandle_args_equal() helper
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1065101
  Lore link: https://lore.kernel.org/r/d8338ff1fd795912b466ccf55b49dcd6885b6925.1773241833.git.geert+renesas@glider.be

Patch: arm64: dts: renesas: Add pixpaper display overlay for RZ/V2H Kakip board
  Submitter: Wig Cheng <onlywig@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1046622
  Lore link: https://lore.kernel.org/r/20260124163611.3279104-1-onlywig@gmail.com


Total patches: 5

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



