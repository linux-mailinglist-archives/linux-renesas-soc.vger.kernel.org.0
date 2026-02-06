Return-Path: <linux-renesas-soc+bounces-27977-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OORnMCDIhWnAGAQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27977-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Feb 2026 11:53:20 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E15FCD90
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Feb 2026 11:53:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5E21F3008CB5
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Feb 2026 10:53:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50A2238F94B;
	Fri,  6 Feb 2026 10:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AfyTNOjP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D474032ED57
	for <linux-renesas-soc@vger.kernel.org>; Fri,  6 Feb 2026 10:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770375196; cv=none; b=Ir40QA/lg3KJBC5g5Moqb77oI4byD5rGqYvau17yffsrq1eK0UlFyXaUphoJM3e9WlEfAy1FyRACjY/6RaYRbruICSkhyfoaPTt61rfEFza8jizuhXYSZrI7ylVuLvMBI/jdzaq6DlY9GUB7Ko7Q/2nLhGELVPsA6RccR9r+pQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770375196; c=relaxed/simple;
	bh=0SECqUzwFuDOkuMRS/YSRrygzvaLp2b4fw2eaVqcQ2w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Eo9ZXh+XWTpIAMlzbbf/iQRB3wNR4kI6+4yD887zKRKDC4BztFwfjSgG9LHXq8vYDnoHhOF0rYSskTjsZZNVzAvR9n4rHsxykH5Ye7iN7M+0gkdRBFofjx8nWoaYomFo/4nPLtqVHhhRbtTM1TZ4DKiEVuIusi7YnG/Vlkov8uE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AfyTNOjP; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43628a01c32so410814f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 06 Feb 2026 02:53:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770375194; x=1770979994; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sJU+Y/OHyOyzpNv7LFCtS3L2+xMqX8KTcSp2BWkvYKc=;
        b=AfyTNOjPOXn8v+6uy5kKM2TlH0qEmUabtQ5Xc1D9zJ7aQt2P3a0eX668ojwyisOjDn
         ZYJUnyXmkYqqPaqsxDiMAa+4eymundH3b7uXrN4t6k2NzyXdj12aqY8NsysgduUbAM7P
         j1GI9/sJfwEFarOaHKh29NSdxvzzM0C08YmtRCXxEQxpgeobNdrLuXSPOuh3TykZkDlG
         2Puh6952HM769/74otBS0OrWSU9qepc9EwQ6uKdsOC4fCEVZkdhYRtUE9HNln5zLRlHa
         29owyT7bKsef9HgVhXuwEBR0ine+gJmjoU6QmKWaXi0h+rs+YFMfYI3Km6u/UExnEnuO
         fkDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770375194; x=1770979994;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sJU+Y/OHyOyzpNv7LFCtS3L2+xMqX8KTcSp2BWkvYKc=;
        b=u666K7ov3lHd3XYtctcG3Y9IhQw6WsYTm4CldIxglGe3tYfsfKZQo+iH4V33/klecg
         p2Tts8iPRcRRkT8kxGtiwsfGmU+BvhrRQmfHXX3NiN28aS30l/vgeEtzhdDiykfsk4ph
         Ysr1EwUvNYkxba/kxODd3ckzND4wv1WiIEWcIim/s6bGWSj3NL8NhdoT7KDCIk2yRqGG
         jmF42q1JLtmc8/orYz+4J+hL0j+kzJpz72uW8YDxNHf2XczKVzMNpUgaluub8euYDh/Q
         puKjKrOf+F3ZK8tlqMTBNAO9cLxXDtmv7RECC/J0C1VweKnENB6+JDoc4CR93yDmo2hn
         hTdQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3759Opj/rxHECDPXrDOFj/al4ITSEb7uNHjKB9quTLCUDPtyL5f2iZ60HPmVpUFthapLy8P6Chr8WhU5axCeSCw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/MxIxnvVcrVRSAKWwjqdS0ugHbcm2tII27CGaB9AxEiLQEAEy
	xR7EFxkciukZwhJsP2Oaps5dPQfLmLJUx/k3odJ+4OUb9gfWvV9FA6uu
X-Gm-Gg: AZuq6aLHmXODsTgpTC3w2bL5va4zvQLvqXUCbCLeqSBh67W9oQnuy7HEnJftnSNvT+5
	phDnQfI6g8/5ECC/QjPu2VmHTm1Txcu8RvPeuJNcSno8rCf3WHX38Mh/oW+GYiGhMKyFrVLk2kr
	eMsGTV45ziFH1Hgeu2e/J5/mrwg1PiePQ30MxVHJSijaTx8PtXJWn40SDiOuB3L94ZEok1GEAVw
	0W1mCPnHoksmMC1xKXTk2BpHzi8+Zn8qrzvQuDqAYPEbVtFSel9zZl4ZqOTAiDigKBdkhWVLSP5
	s/NX2Q7uo96ESFLqd/Yj3kJd/N8sdbVk403d7jWnr0nmb6FUiR0OVfM2poDcE0SSp0l8SZNax5Z
	Itud6D5QNjeMK9+gl1qRER/f2qkPt33lYbJJbnLC7KUzGIGwzp6yHJwCRK4ZbH8pspdl6Q3e9m6
	T+bpw44NV8WjtPtN6TKDhMQelnyb2u
X-Received: by 2002:a05:6000:2585:b0:436:1a2e:9f1c with SMTP id ffacd0b85a97d-4362937847emr3452623f8f.19.1770375193993;
        Fri, 06 Feb 2026 02:53:13 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:1e64:f8d5:9d7a:19d4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43629730992sm4519611f8f.21.2026.02.06.02.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 02:53:13 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v4 0/4] Add support for Renesas RZ/G3L GBETH clocks
Date: Fri,  6 Feb 2026 10:53:00 +0000
Message-ID: <20260206105312.231015-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-27977-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E5E15FCD90
X-Rspamd-Action: no action

From: Biju Das <biju.das.jz@bp.renesas.com>

Add support for Renesas RZ/G3L GBETH clocks and  reset signals.

v3->v4:
 * Updated commit description
 * Fixed mstop bit for eth1_clk_chi and eth0_{tx,rx}_i_rmii clocks
 * Added r9a08g046_no_pm_mod_clks to avoid PM framework enabling both
   rgmii and rmii clocks together as they are mutually exclusive.
 * Fixed checkpatch warning for more than 100 columns
v2->v3:
 * Added eth{0,1}_{tx,rx}_i_rmii clocks.
 * Collected tag for patch#1
v1->v2:
 * Separated ethernet patches from series [1]

This patch series is depend upon [2]

[1] https://lore.kernel.org/all/20260128125850.425264-1-biju.das.jz@bp.renesas.com/
[2] https://lore.kernel.org/all/20260203103031.247435-1-biju.das.jz@bp.renesas.com/

Biju Das (4):
  clk: renesas: rzg2l: Drop a check in rzg3s_cpg_pll_clk_recalc_rate()
  clk: renesas: rzg2l: Add support for enabling PLLs
  clk: renesas: r8a08g046: Add support for PLL6 clk
  clk: renesas: r9a08g046: Add clock and reset signals for the GBETH IPs

 drivers/clk/renesas/r9a08g046-cpg.c | 153 ++++++++++++++++++++++++++++
 drivers/clk/renesas/rzg2l-cpg.c     |  70 ++++++++++++-
 drivers/clk/renesas/rzg2l-cpg.h     |  10 ++
 3 files changed, 230 insertions(+), 3 deletions(-)

-- 
2.43.0


