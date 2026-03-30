Return-Path: <linux-renesas-soc+bounces-30562-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uMUKDgxJymkQ7QUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30562-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 11:57:32 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D5791358B1B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 11:57:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5621A304EA7C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 09:51:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C35B33B47C4;
	Mon, 30 Mar 2026 09:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PRgV8pj/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0789389E07
	for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Mar 2026 09:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774864300; cv=none; b=H5XWDwncQCYIq0fXWaXYL5yCCj0tV9q8rXYgyVsMGq9aaGBU2UAt4HqAQoOTxqwINs/AgVi4N8Fs3OdNeBnMwr5MZebR2/HlI0arxit/8bBTSMsssHM2PvJgR3kqBBxDswEmDUyP44h4Gh0ian8Rhn4JHNYYl1Tr0K2GoE5ZDE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774864300; c=relaxed/simple;
	bh=OXNX/Ug2x6/gTt6PsDQ14KtrtSsY4bi054mDLVzJZXo=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=H/rw+/Awn3jUMUXmCfBnmsNPvPJZYCJfzYLfXlDgm22MYoVbkVnVPrAc5fBhMCg3PGibso1QYXSXnDyKoTLdPh+p+6UNEi8dT6o2uz1KyiuIeMATFULA+Z9VSQyTwGDIyPizHESoeryoTPyRJCMByybd7jLMdPT8tPsUh1E7dy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PRgV8pj/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48784C2BCB1
	for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Mar 2026 09:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774864300;
	bh=OXNX/Ug2x6/gTt6PsDQ14KtrtSsY4bi054mDLVzJZXo=;
	h=Subject:From:Date:To:From;
	b=PRgV8pj/iupl+WYm/ikdqHQDnsZsRPAps3s11SW/N7ROYiKle8A1oWb1f2Xa8tYID
	 bCUuWz4AVkBCyOlqIY6eySq82xUS2eunUX7VyTnJ3hLMqviLRpFsIjeiNrEk0RSa95
	 Ce2VRvPN0ahHi2URWF7/CqgT1L3aVX2r/giIyrZLYv2uUZOTJlUKaHSAvQO7IQmoWJ
	 Capz3bKpAR4bAzMwsIFGAPT14HZmMbyZXDF0K/XLUdHlptAIYSvIIq8EdnIqYHoGPj
	 yWn3ag2JoDBkRAhiflLb6+G8nemQRg2zFz60wOoG94WYNjMj/VHePgFz8iAcgkAdhD
	 3ouJZRKijr1wA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BCD5C392FFC4
	for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Mar 2026 09:51:25 +0000 (UTC)
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
 <177486428423.1080314.14947368629452795068.git-patchwork-summary@kernel.org>
Date: Mon, 30 Mar 2026 09:51:24 +0000
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
	TAGGED_FROM(0.00)[bounces-30562-lists,linux-renesas-soc=lfdr.de,linux-renesas-soc];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D5791358B1B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: configs: cleanup obsolete or incorrect assignments
  Submitter: Vincent Mailhol (Arm) <mailhol@kernel.org>
  Committer: Nathan Chancellor <nathan@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1067836
  Lore link: https://lore.kernel.org/r/20260317-arm_defconf_cleanup-v1-0-8eecb7fdd24d@kernel.org
    Patches: [1/9] scripts: kconfig: merge_config.sh: use POSIX '=' in test


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



