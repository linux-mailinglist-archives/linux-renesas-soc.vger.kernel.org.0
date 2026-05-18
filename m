Return-Path: <linux-renesas-soc+bounces-32759-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eJMgOCPhCmrU8wQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32759-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 May 2026 11:51:31 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4115056A159
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 May 2026 11:51:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EC0543076C6B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 May 2026 09:40:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D311C3E3146;
	Mon, 18 May 2026 09:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AGbniK64"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEAA23D5645
	for <linux-renesas-soc@vger.kernel.org>; Mon, 18 May 2026 09:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779097258; cv=none; b=fGkYOXM6GuGbSEg4pXhZSARPHcZswxSUs8UycCT81eHEWt9R2EKlaLThIoT0aPpg+dNsy2eE/0L3TcN2MRSOIRLCbi9+mGINNTlgWel75Qtfhl9zrttErEkVlpX9P1MD48X1mPuaCLO6ILFFMcEY4uYAzvVnX9vPESC3MNtovKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779097258; c=relaxed/simple;
	bh=wr6juJa8a55svbyqJW4IRtzyK16QMDTbkuHMYD/CI/4=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=adGhxZx2LvwxgeWBNzscZgavydChddGZquyfR3RLFW1rfX1NpYc77JChmN2xG9NAnA50porCcD5d+Y2j93oxtpdfJHC7M3cMBeTkcKYxPx1uI73mMBnV3QBhe61I5UnuAxkDF8fIECDf86ppD9Wi71sn0DBQrz1pXXYsANhgizQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AGbniK64; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F00DC2BCB7
	for <linux-renesas-soc@vger.kernel.org>; Mon, 18 May 2026 09:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779097258;
	bh=wr6juJa8a55svbyqJW4IRtzyK16QMDTbkuHMYD/CI/4=;
	h=Subject:From:Date:To:From;
	b=AGbniK640sbuhw7pUWNEQyVUGLxXpVdj3H/XOvxxFokMtorQCD27db+5xSafXhhxA
	 TYUdoa/OJJ8SwYvQOsJw6OqPYp9qW4VU+K2toG0TYtJ/qyQwMyRcRVFGxtkSrj/jIk
	 eUhLdQt2dVY8Gd4B79C7NV+8mNGdE4P9i7JxeJE6tZwVZkjSHQFdb9SpFV34pCmcQD
	 vwu7105pnX2gXYlLkFWgbBEJ2bEidVTGdl3aywslnoAjiJ+u+y6L1KkYVVgizj1wUO
	 Meg0R3/8DGuP1TL57rIQ4kGbo+jexF4JNZXUbiHUAT4KFUVils3BTpBVoBHdTRiw6b
	 wpcXk5u2B6qDA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 1C3853930BB1
	for <linux-renesas-soc@vger.kernel.org>; Mon, 18 May 2026 09:41:11 +0000 (UTC)
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
 <177909726980.1305655.8310252288519869815.git-patchwork-summary@kernel.org>
Date: Mon, 18 May 2026 09:41:09 +0000
To: linux-renesas-soc@vger.kernel.org
X-Rspamd-Queue-Id: 4115056A159
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-32759-lists,linux-renesas-soc=lfdr.de,linux-renesas-soc];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,ragnatech.se:email]
X-Rspamd-Action: no action

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: [next-next,v2] net: ethernet: ravb: Do not check URAM suspension when WoL is active
  Submitter: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
  Committer: Jakub Kicinski <kuba@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1092248
  Lore link: https://lore.kernel.org/r/20260510103017.613773-1-niklas.soderlund+renesas@ragnatech.se


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



