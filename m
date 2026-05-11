Return-Path: <linux-renesas-soc+bounces-32375-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SLUWMsrLAWqgjwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32375-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 14:30:02 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2978650DCB0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 14:30:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B4FD2303FAB6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 12:22:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DC643358D6;
	Mon, 11 May 2026 12:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="LVM94+xQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF5837B3F6
	for <linux-renesas-soc@vger.kernel.org>; Mon, 11 May 2026 12:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778502169; cv=none; b=dGXbIAAhvc3244ftxRoCGOKyzYOaYVwz8DpYGG5OlnOLpR+fKOrpR1BPPAUB9YvxhP9LO7KFIGQkbkvKPsWAsNpdI9IovnKuePmMJaqqnXJvyI/Q3Ftb6w0HS4h+4aySxlTSQnmQXK+y5pBFjyBL6LAjFcCuFjlvwpRTNnmpu5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778502169; c=relaxed/simple;
	bh=xiyaQI4e1MlBgZyaCm2SVADJW6+VCsyRrSsP8Qu0XFg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lnmiJYxDe42rskJr6O7Z0tFf6mp1MK4bDUVI6KTTRssDnZcoegqhN12qX4HjRNA3b1/wSSN42kX8CFdliHcNO6WeBjY3J8IeMXa7kcP6koF2S34SfrrbeP7rgbQpPP0pVE5o23OAqQR2UIbtWhWVY4XPVAZpSaTVcyNX5HTQp48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=LVM94+xQ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 58246593;
	Mon, 11 May 2026 14:22:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778502152;
	bh=xiyaQI4e1MlBgZyaCm2SVADJW6+VCsyRrSsP8Qu0XFg=;
	h=From:To:Cc:Subject:Date:From;
	b=LVM94+xQSt5r9g5+KybpSXx2NE/3HRh9YGZOT9wWRhAi38w0ZjLWScn24i3ZyJBjT
	 2YPkuS5iIHtErGjv1nDdrvtcqh0qbAtX2w1p1n6L6egEKgD7G0blSzErdE9WHfz8U0
	 7lx8ns04bc2nOqIkRen59lmfG5C4FVgeGQlaZUWo=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [kms-test] [PATCH v1 0/5] Miscellaneous improvements
Date: Mon, 11 May 2026 15:22:32 +0300
Message-ID: <20260511122237.3084426-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 2978650DCB0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWO(0.00)[2];
	TAGGED_FROM(0.00)[bounces-32375-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	NEURAL_HAM(-0.00)[-0.996];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:mid,ideasonboard.com:dkim]
X-Rspamd-Action: no action

Hello,

This small series is a collection of miscellaneous improvements to
kms-test that I found handy when debugging a display issue. The main
changes are the conversion to meson in patch 1/5, and prioritization of
connectors with accurate connection status in patch 4/5. Please see
individual patches for details.

Laurent Pinchart (5):
  Convert to meson
  kmstest: Fix formatting of kernel log message
  kmstest: Factor out find_pipeline() function to KMSTest class
  kmstest: Prioritize connectors with accurate connection status
  kmstest: Fix typo in comment

 .gitignore                        |  3 ++
 Makefile                          | 14 ---------
 README                            |  4 ++-
 crc/Makefile                      | 32 ---------------------
 crc/meson.build                   | 22 ++++++++++++++
 meson.build                       | 24 ++++++++++++++++
 tests/Makefile                    | 10 -------
 tests/kms-test-brxalloc.py        |  2 +-
 tests/kms-test-formats.py         | 28 ++++--------------
 tests/kms-test-plane-alpha.py     | 28 ++----------------
 tests/kms-test-plane-blendmode.py | 28 ++----------------
 tests/kms-test-plane-position.py  | 33 ++++-----------------
 tests/kms-test-plane-zpos.py      | 28 ++----------------
 tests/kmstest.py                  | 48 ++++++++++++++++++++++++++++++-
 tests/meson.build                 | 21 ++++++++++++++
 15 files changed, 137 insertions(+), 188 deletions(-)
 create mode 100644 .gitignore
 delete mode 100644 Makefile
 delete mode 100644 crc/Makefile
 create mode 100644 crc/meson.build
 create mode 100644 meson.build
 delete mode 100644 tests/Makefile
 create mode 100644 tests/meson.build


base-commit: 953a810f1e0253bf029b70f0f411d051d561c3c5
-- 
Regards,

Laurent Pinchart


