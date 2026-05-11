Return-Path: <linux-renesas-soc+bounces-32426-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uMovIMBlAmqZsQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32426-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 01:26:56 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EFFE517464
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 01:26:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DDF113039890
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 23:26:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABA923624A4;
	Mon, 11 May 2026 23:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="LDY2fIYw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 764342DEA75
	for <linux-renesas-soc@vger.kernel.org>; Mon, 11 May 2026 23:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778541973; cv=none; b=UBzqpyobQ5QTVY9Sb8Fq3fRAdAlsDBW9JLSdqP624mjkLXQqTmkdBoXn5dw5hoBm1gZpwfnhU6dyHqCrNnVqxCv0SkGr7igH4ar3JJxzqCNJWQT++zCKMLGZLlKml917bqIgjpc4lKEEHzReFho5hWo+l9IVoEhPZDtuQccb5RQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778541973; c=relaxed/simple;
	bh=mls1RqHjY7PNVsaFw87iQUrK0nR9btfcJelIv80dJ2Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Hh7+AMQavRE+5JCTmOG5XVQC8uk6nE6LqzUG6bbwLQ3vop2985i79EJCmU8QOvjkOavgUW9nm++jTinhXBBgTYUB9ZsgxkFodrxwgZKkCmtUU2tDRcWsQumZQa1ZrhCWlZNRPvz5vs/1FjzdxBelkBQrl+DBJmzBhFRYfiRnbLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=LDY2fIYw; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0A101517;
	Tue, 12 May 2026 01:26:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778541961;
	bh=mls1RqHjY7PNVsaFw87iQUrK0nR9btfcJelIv80dJ2Y=;
	h=From:To:Cc:Subject:Date:From;
	b=LDY2fIYw0H8vukTSk/9M17nO7aN0iL1sqkTGt8eMV+M82R/WOzwZQaPfka3ZsdbAH
	 YuCPrlwTiI4E5q/Tl4s0FqwtDt6y1HIorP53r4+9qmgUaNPUTbVLQLMkyzVEgbE/hp
	 xUXLOLcKv7KvcGpi5IfIuWMOH7Yydoq74WkTnaAQ=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [kms-tests] [PATCH 0/4] DU test suite fixes
Date: Tue, 12 May 2026 02:26:03 +0300
Message-ID: <20260511232607.3464470-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 1EFFE517464
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TAGGED_FROM(0.00)[bounces-32426-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Hello,

Another day, another DU test suite series. This one addresses a
bandwidth issue with multi-plane tests (2/4) and a failure with the CRC
test (4/4). Patches 1/4 and 3/4 are drive-by improvements.

The series depends on "[PATCH v1 0/5] Miscellaneous improvements" ([1]).

[1] https://lore.kernel.org/all/20260511122237.3084426-1-laurent.pinchart@ideasonboard.com

Laurent Pinchart (4):
  kmstest: Print refresh rate in addition to mode name
  kmstest: Take bandwidth constraints into account to select mode
  kmstest: crc: Don't stop on first failure
  kmstest: crc: Use AR24 pixel format

 tests/kms-test-allplanes.py       | 19 ++++++++----
 tests/kms-test-brxalloc.py        | 23 +++++++++++---
 tests/kms-test-crc.py             | 29 +++++++++++++-----
 tests/kms-test-formats.py         |  2 +-
 tests/kms-test-legacy-modeset.py  |  2 +-
 tests/kms-test-modes.py           |  2 +-
 tests/kms-test-modeset.py         |  2 +-
 tests/kms-test-pageflip.py        |  2 +-
 tests/kms-test-plane-alpha.py     | 14 +++++++--
 tests/kms-test-plane-blendmode.py | 14 +++++++--
 tests/kms-test-plane-position.py  | 14 +++++++--
 tests/kms-test-plane-zpos.py      | 14 +++++++--
 tests/kmstest.py                  | 50 +++++++++++++++++++++++++++++++
 13 files changed, 153 insertions(+), 34 deletions(-)


base-commit: 953a810f1e0253bf029b70f0f411d051d561c3c5
prerequisite-patch-id: 97af597df0893f712f4f5a9d31bf290482cd9340
prerequisite-patch-id: 3fa037ff700001661bd385882eabb29c629eff05
prerequisite-patch-id: ffed2e47f40e3027bdfc35a9297b47d15d7b6521
prerequisite-patch-id: c4a5919073c4f02c78e963dd81d6dc61900297c2
prerequisite-patch-id: b3ac659d31a3cbd09ead62971e182aa95497b443
-- 
Regards,

Laurent Pinchart


