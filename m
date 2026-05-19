Return-Path: <linux-renesas-soc+bounces-32816-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KBWXA1FyDGpKhgUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32816-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 16:23:13 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3C358074A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 16:23:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 11C52304A8D5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 14:15:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E39C4028EA;
	Tue, 19 May 2026 14:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QrfR1H4+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC123BB48
	for <linux-renesas-soc@vger.kernel.org>; Tue, 19 May 2026 14:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779200125; cv=none; b=rKnx76asZvU2fgQC01eykrxtUX5hDUWlSuMEx55eOfMC4wr6HbYA7NezSyKccuxPXk2xYAUKIeHxPmekoFL+BLv0rzZCOqb9Lsxy6zGSAzhC6iy6CKcvJNi0Ocwuo9PigKdlB3oBjiWqGKfUGdI2CPHLt3kCC0RU1altye6Ar1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779200125; c=relaxed/simple;
	bh=PGSkh6LvZVlA0BnCf3uh1OaxJ8WJjnqLWqIGmm6MjzE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UTWmVQyAhx5ckm9YwdjPrccAZtOTReOykH3+ra3HUkXWRr5xTMqh1irGVp0zQXFTwo6xrGTw6g70n0wDWRzLy15HPnV5XTywRH4sNMr9LebhkLMtDHf4rwAaCF6FWmCs/EqlHok+5ys8nuQQ4Gom6MNXIeJF5oZgHt+Z5CvCtnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QrfR1H4+; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48896199cbaso29306335e9.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 May 2026 07:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779200122; x=1779804922; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4RxATEsy8GcAphXScChSyablU/KR+6BWc5WdwPA2R0s=;
        b=QrfR1H4+9a3Tn9cvEnq34YdhPrtkCLm5OaKXFab7+ADitJ3DgcEzSMB1TkMEC4kfta
         NbzPrvLKfGwUeAU0uHi9QeKPuGmFuzLOYINE0LRLoRhA+2THDf/s1VN3QzoMtYW+/Bg+
         /K72sZPjYOR7WfW5D3l64aTdiUIHSQyIpOBp7NXaw2WWc1Xk7sufuN+xkAPE4HtuqdNf
         wWk0TecS/BmDTQM59zHPYezOxlWZ9exraAybNQCp38tH8GTvWlbE2/Kujz45HPVNK9yz
         U2+A6wwWhCWY+tkmGJ+sTvA2AIrSMPgeg2IN+z5HzFPFP8RxNvLa+7wsIHxRGokeQ2eV
         NO4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779200122; x=1779804922;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4RxATEsy8GcAphXScChSyablU/KR+6BWc5WdwPA2R0s=;
        b=FcOYqR9zjwUlcpGU0Q1hSFw/ofmYH671sH+VQWqsofHCmLhfwsHzDB9XMdhYYFn8OQ
         IOc7NiU5xYIs4Da6tFIJeFCu40Hl3GRdfKmov7gUM4EKctp282n6wdtxCtsZRivyTT/Q
         OLxo+lw8OqauYMoOEheZVSHLIxK3MGFDiCrmhIZhjplx0QPE7SmwGiXY2H4TWgYdCeop
         SRz+E8T6nJYUe/hsDiU4BgelQRUF8b13OeS51Qt5CxlLKxYB+UB9M4qsVQuteosGZF+F
         Z3BWFNmswRgbanwl7t6bKpdt2zf3FhSwEiE8CqfQbRTWy/WIhds6c3RoEu2UeKF8/ll9
         +jKQ==
X-Forwarded-Encrypted: i=1; AFNElJ+HRu7uOnt9XRjMj59srbcVhBraxd+GyKxtR4INUh1rXhma5M7fEm92rhkEU1Qhf4k7hg8Nj+fVrQSJjDOJP2zJoA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwNxYW2SEBGBqDl9GcxI12D46n7Ga+m4i5VFyrTdd3lgZQCeF4m
	FOMjoT/Yrmj0iazALKkvF+vN6V0ropwFvEYhQegU3MSpY0sVaahH1zVsQcdx8Q==
X-Gm-Gg: Acq92OGNsFkejGJlmMU4HDd2ZO0NTGTZn0DHSMIO156c5UevrVIVZ6NJYxqguUGPpgr
	s9/pkVw+m2pwuTYyVSiCX+zNFDXTQmQZX6EJ1zWFZZRFtS2dszZddeaOtMgMthePrJlXuXeC4bG
	ADQcAmfHziSrN/op5f7Xpls7TpiWLYKvAaTKcX3xGNYfmxBzgNJWMGyC9+/GLLXs3DPA3hA2chQ
	gfw6lZ9IDocwhq6NkyB/Wd1Sv6LxOk6nc1XSJCUqk6JZZRyUtlro93mXEzvHW1IQujPlzdKmy7V
	l4DdDjbtghsVo5pfqeqTQx6zNLGdunsw1tzqbitAbF1Kv0Ys7XEp3B1vG31yeH/voZWeC6bYhhO
	/4y3leM6QR27aZWXNTSJxtiyKgDp1Czn9GFC/8Mud1d0mk2EBBJtUU2M+hE/aG8FW8yqUJmA5n5
	JcZRmg6MwcqQGZ1LpFCRgdp32ZuvkneMws1iX+c2BmPmZt12sD
X-Received: by 2002:a05:600d:b:b0:48e:8741:fd42 with SMTP id 5b1f17b1804b1-48fe60ee64amr233439125e9.12.1779200121457;
        Tue, 19 May 2026 07:15:21 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:4abf:a82a:41d5:6663])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe4c8344asm557912205e9.1.2026.05.19.07.15.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 07:15:21 -0700 (PDT)
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
Subject: [PATCH v3 0/3] clk: renesas: rzg2l: Unify SAM PLL configuration macros
Date: Tue, 19 May 2026 15:15:12 +0100
Message-ID: <20260519141518.389670-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,redhat.com,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-32816-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,renesas.com:email,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 5E3C358074A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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

v2->v3:
 * Rebased to renesas-clk and fixed patch#2 conflict.
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


