Return-Path: <linux-renesas-soc+bounces-32755-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oEGvGaTeCmpV8wQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32755-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 May 2026 11:40:52 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 26CDE569E6A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 May 2026 11:40:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B8FB530154B0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 May 2026 09:40:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30F9B3E716D;
	Mon, 18 May 2026 09:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QSqfVp4A"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2F83E63A6
	for <linux-renesas-soc@vger.kernel.org>; Mon, 18 May 2026 09:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779097234; cv=none; b=mC9kFzmJKZmYp8pB0euvr6RWv+dKmvqamgX4vUdf900Xf8MtTgYbXjOL8AwpKJicowWofU46QY5lpU0MRdiS6qLXmNwXTS/1VgFmk7UrbrU4mTFHoZqu0QUlsl9ML0fUiicygJVesQ1WZbVWf35BH3gFHRuOGWNXS2IeyrHZOmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779097234; c=relaxed/simple;
	bh=6b027lnRAr8KRwcG7PUFiOkdz/JXOW30rr9E/qvr1vo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=okrbGfq1I16+PTDq9iJWlMgnlETMZui5QraJzAQsVJ38FMtyiGL8G2wOJfifiqgTXEBzQ3XNeZAjX38g5FaTxWvsLP2bgl31J3kapXiL6dBbChmwHqgR8SIXQzdicOuJaf5Dx4euvDb9YwyLxTRBpIKRLbCbQFo9S60F+aKt9Zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QSqfVp4A; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-488e1a8ac40so20514075e9.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 18 May 2026 02:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779097231; x=1779702031; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YsaSBVnjMP0jxt220HLbHWP7RzYvU7nxpFnM1leO/+8=;
        b=QSqfVp4Acu8e/vfpdhTjAMhK/iuLYzCPS8sNuqWSDAUe7me95sDCAgD7uYvDpyrQNz
         GHxeGH60Rjy28vzEFdiANCn97QsNJ+cjkU3ZjFZZbn+6GyIoGHGgYdvE6N6VJR1cxm2P
         UMmdlfQ4X9JReJqRGqh8KhYYhedc7UC6U13hOV4K+6MVQv5aIQMRsyIo4S+MVjO56sdc
         Z+MZuY+kbv9HoMINbodpPthta+cKJkfE9gvTprhfobJnlz+TpoHS624GAlL3eF5t9Kn6
         +3sxf4v2qbIQPwpN8n+/RRZS3hqaQxKrp1zoXyKM6LXxuZkWR2CegnlYESyjBcqIIRHs
         4yaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779097231; x=1779702031;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YsaSBVnjMP0jxt220HLbHWP7RzYvU7nxpFnM1leO/+8=;
        b=mP4AEtciReKx/R1mvUNZzY7gPF+k3tl4HRcmKpAT26ZgFPCSeR7iMpdCJOiQrbo8gI
         elwkNtnzA4or4wjGPHnkV4ybf1bQIpn7fKxCOM813jwTtADo+eIHegMVCqutcuGTQ9vS
         dQAuV8BWRp9fJNXT/xkszg8uFX/dKBxRkZvqTvItTRStD23TUFYfJ0YgG6nqmLLOLkDL
         DBkL54M72zDSUbhEB4qiHLEMVqjXTqpbn+LP8JOjlLG2vmOcbkw0CEiVqhhAjQGQCyio
         uBtWyYizPNtPvM0kbFWMgCisH97eygn8pElEmaQ2EQs+P/tUxUqwMxsJO+J8Sm2OL49Q
         T/MA==
X-Forwarded-Encrypted: i=1; AFNElJ8TfwC3lxsoJgiYPdY+wrisKnKpYSKcoWDkQL2t8G4wOuR6mo6DpSnqTDGP9Fb+oJASZlIkxvrB4oge5f04BMK+hQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwnGYUN+2MpgYtN9gvua0r+aeBbJO3sw6KqCPXkYbwW24YhrWKu
	p2jZKv7yRcN7Hn9qyLbvdnllOMZ9bkKFkmMMqL9CFmYQyq/LTaWxpI4A
X-Gm-Gg: Acq92OEy3Lvf0mislsS5guk/Lh8xXzMX0NmV6g0pbbQksN0cGDpYes7WWFs1iSietkm
	E+L6kkXU9QCEQ2h9dCkA0zCXfBMgBFn7UuE+LF+5l2DYBgi86lk0bsgjuvHUsTrqrvuR6TP9pVU
	XjMusslqLZy0TbGh3E9Sbi+RMme1zGAloPFTKakAmm+LfZmAl6qamRIeyKHMDCGb/KWbSEk4wFn
	74eu1SBc9h6EQrwNZSiwXU4oubOjKnXdYqcbOtMrh1WQCWJnRUPXu6Rb+NlNRz43xMlQu4TlpIS
	8VY14MO4rZztmW5c6q1awVuSJKsgR+9WRt8F6Yc4AXG6GPkJBw4e2V4gXlr/8ZZJJYgr0sOJY+3
	yg5jBJ25UL03gkfxDhbBmtGknaXdpXOtiGg9m/qfTcXsjNcsq4x4XrA1e4/Ce/vFpcFENJqG7wT
	SVfB1uTEDnJumOVpdir45SlSTd/eBpsF5VmJERKooWQ6brU+CD14HZrrRgaFI=
X-Received: by 2002:a05:600c:a08e:b0:48f:e230:2a23 with SMTP id 5b1f17b1804b1-48fe661ee60mr213820185e9.30.1779097230476;
        Mon, 18 May 2026 02:40:30 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:cd4f:119b:90b0:3b9d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48ff43f8799sm127975135e9.2.2026.05.18.02.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 02:40:30 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Brian Masney <bmasney@redhat.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 0/3] clk: renesas: rzg2l: Unify SAM PLL configuration macros
Date: Mon, 18 May 2026 10:40:13 +0100
Message-ID: <20260518094027.95700-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 26CDE569E6A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-32755-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[bp.renesas.com,redhat.com,vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.999];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Action: no action

From: Biju Das <biju.das.jz@bp.renesas.com>

This series cleans up and unifies the SAM PLL configuration macros across
the RZ/G2L, RZ/G3S, RZ/G3L, and RZ/V2M CPG drivers.

Currently, each SoC family defines its own local macro for encoding PLL
register offsets into a conf field (PLL146_CONF, G3S_PLL146_CONF,
G3L_PLL1467_CONF, PLL4_CONF), and the driver uses separate decode macros
(GET_REG_SAMPLL_CLK1, GET_REG_SAMPLL_CLK2, GET_REG_SAMPLL_SETTING) to
retrieve register offsets at runtime. This leads to duplicated logic and
implicit coupling between PLL index and register layout.

The series introduces a pair of shared macros, CPG_SAM_PLL_CONF(stby) and
CPG_PLL_CONF(stby, setting), that encode only the standby offset and
optional setting field. CLK1/CLK2 register offsets are then derived from
the standby offset using fixed +0x4/+0x8 deltas via new CPG_PLL_*_OFFSET()
helpers, removing the need for separate CLK1/CLK2 fields in the conf value.

Finally, the RZG3L-prefixed STBY/MON macros are renamed to CPG-prefixed
equivalents to reflect their shared nature across SoC families.

v1->v2:
 * Dropped the dependency from the cover letter as the patch hits next.
 * Collected the tag
 * Updated commit description for patch#2.
 * Fixed the macro RZG3L_PLL_STBY_OFFSET by using CPG_PLL_STBY_OFFSET.
 * Moved CPG_PLL_STBY_{RESETB_WEN,RESETB} near to CPG_PLL_STBY_OFFSET.
 * Reorderd the above macros
 * Moved CPG_PLL_MON_{LOCK,RESETB} near to CPG_PLL_MON_OFFSET.
 * Reorderd the above macros
 * Dropped a blank line.

Biju Das (3):
  clk: renesas: rzg2l: Simplify SAM PLL configuration macro
  clk: renesas: rzg3s/rzg3l: Simplify PLL configuration macro
  clk: renesas: rzg2l: Rename RZG3L-prefixed PLL macros to CPG-prefixed
    ones

 drivers/clk/renesas/r9a07g043-cpg.c |  2 +-
 drivers/clk/renesas/r9a07g044-cpg.c |  2 +-
 drivers/clk/renesas/r9a08g045-cpg.c |  5 +---
 drivers/clk/renesas/r9a08g046-cpg.c |  7 ++---
 drivers/clk/renesas/r9a09g011-cpg.c |  7 +----
 drivers/clk/renesas/rzg2l-cpg.c     | 40 ++++++++++++++---------------
 drivers/clk/renesas/rzg2l-cpg.h     |  7 ++---
 7 files changed, 28 insertions(+), 42 deletions(-)

-- 
2.43.0


