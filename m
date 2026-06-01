Return-Path: <linux-renesas-soc+bounces-33396-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IDN8NRuHHWrObQkAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33396-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 01 Jun 2026 15:20:27 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 612FA61FED5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 01 Jun 2026 15:20:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7347B302D0B4
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Jun 2026 13:18:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A09A13A5E6C;
	Mon,  1 Jun 2026 13:18:27 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6453A5E90;
	Mon,  1 Jun 2026 13:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780319907; cv=none; b=tKuqzxa7AJQdgGDiWrqvx8JYovure7zwGa69H7S3WyQ+oC+n8fAndeZNdhblcO5f4nSW9XA9wsz18/WvBJSIQkwSmYtKO9mntoSrxCcCo+fKFfi3SNRadKTXmYxFxOqQoSKLXwxZtwQ1NBBj+ruEGu2g7wqulMzwnBgIxWv6DHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780319907; c=relaxed/simple;
	bh=tMIt9vpn68LCDZbLK6BfNCPZwdcJvF+Rbj5EWvtiTcg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DtwtHGIA6GlFjuJP0LPuBULjW8jbUEQ8Oogj0zCUJK8jmHksxQFtZZ7zzLJFwuMTQ74Gwo9TJ6ftdLE52a/HRKiByMxZ7FLQmJOtkhVqUfX4Aw3FXd5HMPflVO49BpQckWC59+wFpId18xJtuDhBwIGFm2I/zGQQHiQDxEFOqsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF37F1F00899;
	Mon,  1 Jun 2026 13:18:23 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 1/2] Renesas driver updates for v7.2 (take two)
Date: Mon,  1 Jun 2026 15:18:18 +0200
Message-ID: <cover.1780319120.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.178031911driver8.git.geert+renesas@glider.be>
References: <cover.178031911driver8.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33396-lists,linux-renesas-soc=lfdr.de,renesas];
	DMARC_NA(0.00)[glider.be];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,lists.infradead.org,vger.kernel.org,glider.be];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_NEQ_ENVFROM(0.00)[geert@glider.be,linux-renesas-soc@vger.kernel.org];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.984];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 612FA61FED5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The following changes since commit 17e48e7e5f18b45fd4a9411090148aae3b74f7f3:

  soc: renesas: Convert to of_machine_get_match() (2026-05-11 09:56:17 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-drivers-for-v7.2-tag2

for you to fetch changes up to b4d41ffa750fc3403a4076d17090589d000f13ff:

  soc: renesas: rcar-mfis: Add R-Car V4H/V4M support (2026-05-29 14:42:29 +0200)

----------------------------------------------------------------
Renesas driver updates for v7.2 (take two)

  - Identify the R-Car M3Le SoC,
  - Add Multifunctional Interface (MFIS) support for R-Car V4H and V4M.

Thanks for pulling!

----------------------------------------------------------------
Marek Vasut (1):
      soc: renesas: Identify R-Car R8A779MD M3Le SoC

Wolfram Sang (2):
      dt-bindings: soc: renesas: mfis: Add R-Car V4H/V4M support
      soc: renesas: rcar-mfis: Add R-Car V4H/V4M support

 .../soc/renesas/renesas,r8a78000-mfis.yaml         | 38 ++++++++++++++++++-
 drivers/soc/renesas/rcar-mfis.c                    | 44 +++++++++++++++++++++-
 drivers/soc/renesas/renesas-soc.c                  |  1 +
 3 files changed, 79 insertions(+), 4 deletions(-)

