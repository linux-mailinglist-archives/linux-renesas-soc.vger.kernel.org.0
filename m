Return-Path: <linux-renesas-soc+bounces-31947-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sLlEMxKz+GmWzAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31947-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 04 May 2026 16:54:10 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7304C02CF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 04 May 2026 16:54:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F3023309E6FB
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 May 2026 14:46:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED84D3DA5B0;
	Mon,  4 May 2026 14:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oW0lEQSE"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0807D3DEAEC
	for <linux-renesas-soc@vger.kernel.org>; Mon,  4 May 2026 14:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777905929; cv=none; b=G2E6j0isSy+aA0TkaPfPElhr4iSS8RMTG6jRelbIhMcfFFF7jmBfVKU20shsr8QhdMm5bqM8U+u5ylfhcO1Eaglh1xQUCaVt8PhkiJR4X31ZaJGuyO1KSFE5GuWGpodzde6bnBj3YImpfg2+S585fDWPM8+JLKP9LLnkksiIHnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777905929; c=relaxed/simple;
	bh=ORAOwSOu1au513HAgD2ycO0jYFY23lld5AbZqARyQKY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YB1bV4ROADcB9Xe8efZt3SjFUocXo8CeU/PM/ohD/8iM4eCYU6RAodBcnbc8J4qLxi4JoqheyRDRYwhOd6Nre6iVDdKPKZhIYNuVBCY5lz1nY4r5HTxDsH+kykxOpxMsvKHTgMQn862fqszcHIpFFeFKMxwFRhV2rmNW8PNr4RI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oW0lEQSE; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43d73352cf2so3754397f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 04 May 2026 07:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777905926; x=1778510726; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EiyJE29nUoz3rJ6eRkS9mylfjXne22lltijPJ26O8Gw=;
        b=oW0lEQSEpg0UhInJ3lwOmHZIlmzzMWGqYcr6fC6qe/FmlahENJDSBDAPWPj1uy1+Cq
         E1XqidzWqM1EHsuMQj8x04DVXKUL1TBzgwW0l9XcDlWc3fFX6IoP197sHetWqIQI+bWb
         BiHoZyHH9NWjwu5IFSTnQDk4e+5k3WNm19oLhU4tWUjxg3sqlwEGBEnTAR4uezfoRLJ+
         O4caNj42WlyPj1841bnj0yCt2acCV0PVT6Lol1HIOB3PWjpa671O0MOg4dCbc7SVgOmm
         yVOq7haEgxAF/tZJ0JbuMLBuyXS0lzjUrns0ZxcauhDeI+mLs/aMpZpJh/y21GK6mKLh
         Y3ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777905926; x=1778510726;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EiyJE29nUoz3rJ6eRkS9mylfjXne22lltijPJ26O8Gw=;
        b=aWyhfaC+EHAKyMtI4a+xfqOQD1yi/Y5Q2DeAxeJzbD1R//Lk9XPEEWvdx5rTHlH37T
         0J8UBUzkTiNnej6T31JNqxooaOLZ1W9zcmHKDB38g+H7cmE6mmS2GRfo7WkiotJqhkxT
         Viqy6Bxu8gnOra3vuBIr8j8+I5bWRBh3qcaMKKP1DdWryNd7ArVQLVCyF6Q+VC5uoqGn
         Pjhkll4wTPHcNhjfk4glf7RVmmRPROi0KMSlIKE0pvRsbOBfsdjcNWArElWciyw5y0ql
         cXUrbbL0/6r+jsDEfIa5+VvfFxd+xLIrOJkXXsf3TyzOH5CCACNtXEa619S/kYiTVibU
         RNzw==
X-Forwarded-Encrypted: i=1; AFNElJ8YlEfEqlgUAmBCiZJL0Kho+qqDdikwp6B0HUSBnKOCtOi4E1Vb01Kqa+X0LPMEUqAG+Mz1A2aAPhbDQTUrcZUc1A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxBwWdx83Dxj0IF2tB9FFElXLYgkECj0jvS5fEU6hdkzjw7glmG
	zPRk+dvitGFfrnxv0mJ+WP41H56ElhebyjLt1Abf2TFIGCXOkvChwf8W
X-Gm-Gg: AeBDieuJnudzFjdfiyo0dtYhvfE6U27VGBxTzs8iSmfncPWCmmm66AyMZU2l1ubLfla
	qEQSgJxueroAXlLyjxMmuqRR3Pw4AokCUb/8gS1M0aImtHO1xhSJfsbgmDCyjlIyVFJJBLY0am3
	SuJno3iNvzda6WJJDGuEFYztxMfqaEGEPwF543o2uhVnvpxwiXXyp23PVMO8RSNj/Qemrp+xlDE
	ceE77WFgbNmbB31pE5bgIam5zJqpeI96yL6pEoqAXVQ0+S6mlwnz09K2FbZuTObUQPrw+rXn8c9
	aIjVT1Ylp0GDuHDwWP4Waree0wZP4VEg+HDumEBjEZrp838xPotuPoJOGO2TxUaik7qPS5HOCjV
	xFqVOE5T9cqmBHc8DWKjwzBHAp7Vtsb5Wyst+n0hQFgzEqnjjNIhxwXmIUr0i3/tvEASoFAAO+/
	SwsyjXQcyJ0ZdkZTeMyYspAn7rpmKVXpJq2GKcUUNjNiVy9TomPnjfYTjlaiQ=
X-Received: by 2002:a05:6000:178d:b0:43d:773d:7908 with SMTP id ffacd0b85a97d-44bb65df88fmr15957594f8f.32.1777905926121;
        Mon, 04 May 2026 07:45:26 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:6444:b23f:58b2:338c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a981defa6sm24371239f8f.24.2026.05.04.07.45.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 07:45:25 -0700 (PDT)
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
Subject: [PATCH 0/3] clk: renesas: rzg2l: Unify SAM PLL configuration macros
Date: Mon,  4 May 2026 15:45:16 +0100
Message-ID: <20260504144523.153906-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4E7304C02CF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-31947-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[bp.renesas.com,redhat.com,vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.990];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,renesas.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

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

This patch series depend upon [1]
[1] https://lore.kernel.org/linux-renesas-soc/cover.1777562043.git.geert+renesas@glider.be/T/#t

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
 drivers/clk/renesas/rzg2l-cpg.c     | 41 +++++++++++++++--------------
 drivers/clk/renesas/rzg2l-cpg.h     |  7 ++---
 7 files changed, 29 insertions(+), 42 deletions(-)

-- 
2.43.0


