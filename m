Return-Path: <linux-renesas-soc+bounces-31936-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0IEgGnt0+Gk9vgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31936-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 04 May 2026 12:27:07 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F474BBB3E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 04 May 2026 12:27:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 99F7E3006B31
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 May 2026 10:22:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8135E389441;
	Mon,  4 May 2026 10:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oNhVeBx2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 234143A3E69
	for <linux-renesas-soc@vger.kernel.org>; Mon,  4 May 2026 10:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777890152; cv=none; b=mKrkwEr2AXEytjGAa1YmXpJaNADRw47nSlYzl4MqmExrPF4ogBubu8UTQAdSzDRXvo1fvCP+Qlg7TdggBTznATX98d9FGpEwUPRfwVRLy8G0VAZGQ4ShX6Re87GVND804aX+383vl0VarppFLS+1OS7Xp8Zt/psJrut3dQOU3Bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777890152; c=relaxed/simple;
	bh=p1rS789rdoPVd1R6JoDVDI8TJA0gQU5QHe1ytp+IhiA=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=a/Z7SgNq45jUyjscVS0k7k7B2bdQpCeDXS1uNxeGaN/ASJV6kt5Ko62jGRu8o65BlDMrIeqrz4F6MFdC9RwN375GsdUjEoPJrI4v+wuyp6ktauSswxWWyu4A6Cc5Ui0yszDwvPVwFjlVjN1Jbph9OcmC7KifgXOCxOwcaeLDC0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oNhVeBx2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E000C2BCB8
	for <linux-renesas-soc@vger.kernel.org>; Mon,  4 May 2026 10:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777890151;
	bh=p1rS789rdoPVd1R6JoDVDI8TJA0gQU5QHe1ytp+IhiA=;
	h=Subject:From:Date:To:From;
	b=oNhVeBx29BNlkx6v55Z5j0RqnPKZFzIFHB3MzSeYMU7RCAnrlWRTvpe4lG6hnQZCT
	 y0q3/0OprsfCpK2ZHrHdFK0fcCq28JqUKMvATwXaZ/z986469lhXutEwdtQO7KyiKN
	 R8Nhq/6Q2fGaVOaIhq7XSxVxPA0RhtlW4orVh2rIZKub6UlMjytjmbrvO3xxlZz4M1
	 Qfe0qYhhATXZrZujX3+y35iNppEEiE9twPYqbpn9HUpbgFCmWbnTpHGr3NsnMBzMJT
	 7Yq5WWVnLZcfCZSGn9eeXU163oa01rVxoA/SZcDliSZJQDbDfyGuDtuNqPQV+S95sJ
	 hXvFfXrPMPg4g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 059B4392FFF8
	for <linux-renesas-soc@vger.kernel.org>; Mon,  4 May 2026 10:21:44 +0000 (UTC)
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
 <177789010259.648268.2778896565759352113.git-patchwork-summary@kernel.org>
Date: Mon, 04 May 2026 10:21:42 +0000
To: linux-renesas-soc@vger.kernel.org
X-Rspamd-Queue-Id: B2F474BBB3E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TAGGED_FROM(0.00)[bounces-31936-lists,linux-renesas-soc=lfdr.de,linux-renesas-soc];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	FROM_NO_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: mailbox: improvments around registering controllers
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Jassi Brar <jassisinghbrar@gmail.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1080653
  Lore link: https://lore.kernel.org/r/20260413104240.30493-1-wsa+renesas@sang-engineering.com
    Patches: [1/2] mailbox: add sanity check for channel array
             [2/2] mailbox: update kdoc for struct mbox_controller

Series: mailbox: mailbox-test: fix issues reported by Sashiko
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Jassi Brar <jassisinghbrar@gmail.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1082380
  Lore link: https://lore.kernel.org/r/20260417074237.16053-1-wsa+renesas@sang-engineering.com
    Patches: [v2,1/4] mailbox: mailbox-test: handle channel errors consistently
             [v2,2/4] mailbox: mailbox-test: don't free the reused channel
             [v2,3/4] mailbox: mailbox-test: initialize struct earlier
             [v2,4/4] mailbox: mailbox-test: make data_ready a per-instance variable

Series: soc: renesas: add MFIS driver
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1076389
  Lore link: https://lore.kernel.org/r/20260402112709.13002-1-wsa+renesas@sang-engineering.com
    Patches: [v4,1/3] dt-bindings: soc: renesas: Document MFIS IP core
             [v4,2/3] soc: renesas: Add Renesas R-Car MFIS driver
             [v4,3/3] soc: renesas: add X5H PRR support

Patch: mailbox: prefix new constants with MBOX_
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Jassi Brar <jassisinghbrar@gmail.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1079757
  Lore link: https://lore.kernel.org/r/20260410125105.39340-2-wsa+renesas@sang-engineering.com

Patch: spi: rzv2h-rspi: Fix silent failure in clock setup error path
  Submitter: John Madieu <john.madieu.xa@bp.renesas.com>
  Committer: Mark Brown <broonie@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1085406
  Lore link: https://lore.kernel.org/r/20260425024725.2393632-1-john.madieu.xa@bp.renesas.com

Patch: [v2] mailbox: exynos: drop superfluous mbox setting per channel
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Jassi Brar <jassisinghbrar@gmail.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1073641
  Lore link: https://lore.kernel.org/r/20260327151332.5425-2-wsa+renesas@sang-engineering.com

Patch: [v3] mailbox: remove superfluous internal header
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Jassi Brar <jassisinghbrar@gmail.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1073631
  Lore link: https://lore.kernel.org/r/20260327151112.5202-2-wsa+renesas@sang-engineering.com

Patch: [PATCH/LOCAL] arm64: renesas: defconfig: Refresh for v7.1-rc1
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1087952
  Lore link: https://lore.kernel.org/r/33e5562de46405d41ea55cee0ae781c02a75cdc6.1777535762.git.geert+renesas@glider.be

Patch: [v5] mailbox: test: really ignore optional memory resources
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Jassi Brar <jassisinghbrar@gmail.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1073640
  Lore link: https://lore.kernel.org/r/20260327151217.5327-2-wsa+renesas@sang-engineering.com


Total patches: 15

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



