Return-Path: <linux-renesas-soc+bounces-29335-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AKsCL13xs2nYdgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29335-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 12:13:33 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9996128206B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 12:13:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 28D0B305D497
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 11:13:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10656373BF7;
	Fri, 13 Mar 2026 11:13:08 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF1F37266C;
	Fri, 13 Mar 2026 11:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773400388; cv=none; b=maqOTYj81lw9DoXXLP+7fvwKKGwdsDvzvxzCt64X34MEeDze4DPmIq54iKH3OoTmTvvot2uBFy2Vthjta6R6SMO6g1cZ0RtKi2DjxBio7KFWBPSAh0Bdm3PpldZ0TYt2wY8e7ztSCPMqP/mejAt8rErdzPYvVhMyApc+vMzwFic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773400388; c=relaxed/simple;
	bh=24ZwHrdsWY5gVi6YX1lCeGYD6+QEMDixqXhlNlCt8WE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ASYrCmbUSqu7YfBQfOr8ZfBFPxM+ZoRZ7Xv1+ksRk7/QlC5YUSpL/AaN/hK4V5i4WzQlF6AyRLLRCckwdFfFJWW+1BytannSqcybYhj3y/5M1CUQDU+jTK45HZP+64UasfaecCMHLOyVJgJc64km39Hhyo6/yN5KJjdooS+6cko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86B46C19421;
	Fri, 13 Mar 2026 11:13:06 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 2/4] Renesas driver updates for v7.1
Date: Fri, 13 Mar 2026 12:12:58 +0100
Message-ID: <cover.1773399671.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1773399669.git.geert+renesas@glider.be>
References: <cover.1773399669.git.geert+renesas@glider.be>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29335-lists,linux-renesas-soc=lfdr.de,renesas];
	DMARC_NA(0.00)[glider.be];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,lists.infradead.org,vger.kernel.org,glider.be];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[geert@glider.be,linux-renesas-soc@vger.kernel.org];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,glider.be:mid]
X-Rspamd-Queue-Id: 9996128206B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-drivers-for-v7.1-tag1

for you to fetch changes up to b1de9823fdc67a8e9cd0dcf1f6f0e9780d425d4e:

  soc: renesas: rz-sysc: Add SoC identification for RZ/G3L SoC (2026-03-06 13:40:12 +0100)

----------------------------------------------------------------
Renesas driver updates for v7.1

  - Initial support for the Renesas RZ/G3L (R9A08G046) SoC.

----------------------------------------------------------------
Biju Das (1):
      soc: renesas: rz-sysc: Add SoC identification for RZ/G3L SoC

 drivers/soc/renesas/Kconfig          | 12 +++++
 drivers/soc/renesas/Makefile         |  1 +
 drivers/soc/renesas/r9a08g046-sysc.c | 91 ++++++++++++++++++++++++++++++++++++
 drivers/soc/renesas/rz-sysc.c        |  3 ++
 drivers/soc/renesas/rz-sysc.h        |  1 +
 5 files changed, 108 insertions(+)
 create mode 100644 drivers/soc/renesas/r9a08g046-sysc.c

