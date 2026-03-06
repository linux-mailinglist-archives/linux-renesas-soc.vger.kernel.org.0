Return-Path: <linux-renesas-soc+bounces-28954-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uBRwNp7aqmkZXwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28954-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Mar 2026 14:46:06 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ABD2222021
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Mar 2026 14:46:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E1AA0306AED9
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Mar 2026 13:42:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEBE6311C35;
	Fri,  6 Mar 2026 13:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iryi9dW/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B112311958
	for <linux-renesas-soc@vger.kernel.org>; Fri,  6 Mar 2026 13:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772804554; cv=none; b=gh/cAM/Uw4W5vpTQuWHHjkzJsa5NjIHIzfI3nDbHL6oVOj+2c7i+M4sCsGxWm0I0dtDL964z3EDVzCHZKqAsF7TdmRDRvDdORJftBxNEYjDkoVpNGKA41eNX5xfRt0yWErZyAEX1P6OHMqfRaYRNtwttIhoSEaGpy6+xEzbNKJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772804554; c=relaxed/simple;
	bh=lGHLYZSmETibXwSj2VD58en7KnXrQTVmuEiwDEOnrKo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rP5nn+nON+mePw9ieUi3bBQlLPIFkxkpBHD3cCnUOQtTHPCFVs5yXKtt/4/+xuhDMwOjM8AKW16B43DuIahefZHPj6WkbzYsJM/OHfg4skLsPP1RhiNJZgAjZqhgN3x3b7jcwGvfoDbcGAFVOxcN+0vSDtGivK1f4VomBst1SKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iryi9dW/; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-483a233819aso91307185e9.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 06 Mar 2026 05:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772804551; x=1773409351; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ny3tn36LFHeisfwSmSM3Ed1qDCiJ36YcJ+5UOs6qsD0=;
        b=iryi9dW/l+pZ5XgMNSzp7qBWiFhXUbE1xKupHtwMhj41hoDBCB+qVFUV37bFm/zeeh
         qQ+GAf7Gkxixr2Fay1yAy9WjJ+kow4fIuYXT2ZznD3HkAyPj/3DnF7yQKAe2G4FMDXxy
         ToZHAfv2EsHLRvBlYh7fQ9KzhBuYwpDx9X6qUctuCZGKqPhOW6GgJKrgsrssbmXVpVDf
         xWJbI7OqoPTklOaMrP4nS7pgaj76Fp0CK7Bxzy9fCIJtG5u3Xo66bxOCR6QDs6qQHCwZ
         palZIrShFHHuQRXpjSULMemeNRdYngZJ9dCm8/gCb4SHiUG36MaDlT2oZPqdSnJNAN8O
         QMhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772804551; x=1773409351;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ny3tn36LFHeisfwSmSM3Ed1qDCiJ36YcJ+5UOs6qsD0=;
        b=cL3cBeC66YA3nZlyEG2QrF1Skfiyeav7pv8pLbH36D1g4qddVJC+hSVSS3GE0L46HR
         UcMC5xiN+hl2YoaUvanRQTHjBTv+4Swu9NCDgaLQPKOzk6VLe4CdHRC8ik2emAHgGX3l
         S86H+dNdpgMD8/LIRpHkioIOzWmHnSyvM0JU066GSF0fmlMHbE0F7mNULJBGiGO1OivT
         2VPUHubx0qHAl7JoLYbq57/IZX4MmKVXP2mZm4tMhRv6ZdPLdBgMWwApNwetNYM5yNs0
         xqIBv20ahhynKkP17GVDyEBTM94XnAzHzLb9Urj8vwPwxZOpQ8sqlErL6zL/9tNPzx0M
         pWsg==
X-Forwarded-Encrypted: i=1; AJvYcCVm8YpVrEvg9RbA3dnFPEFGoNC7KZdTZ4g4NONuP7EuTUzsYnr6wX5dQYqBGLrqFk0qwzQLAi+QzMt3SaV0adMniw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwEgBenyIg/ySq9DtBWxoBbRfJU1sjY3i/kOKW6MNyFLpZzc10V
	1uTBY8Odx+m0Njj67k4LVZlmXjLC/vH+f7Q9s0L9RV+0+GeyRvkm67GC
X-Gm-Gg: ATEYQzwavvpHTRK8dnYuRrnpK7i/1oDLQ8Ws1e9uvRQKWzhwzjQh7UsDjxDJ782KcC6
	LuoVrv9T+BFy1Z4o6Fe67cWynTsJYUv7Po4XtRRzFVHjsrJ/Aq20cK0rkGhJuyIWKJtkYK5524x
	uxapTVCuHlDHQxKA5lgLrDp9IZjTl6jWuvNw8mpwcE9CA0tmHLsRdoU8xwKnK6XYx3V0Jn69zF5
	jBJd5WsDpEM2QD1CinFp8PtDcxXIagrXrOrPG+QxJLYBgNI4tsD7z4vfsLagtR7dyQjDMfKMMI3
	Gw4WwRZjv033gGxNW95A0pUvvkSXzMbntixlZwdck0q/F6B3V/+Gmd/3v52dpEwZOOc2JTV5EcM
	Q4BjipZ+33grnsNEMaS6qsIyB13KyDbV+MB7kVCD3s8PS3GtBrqMLIi9fEf+30evbcJJVGoXcHr
	zPsEN3p/iTrdj8naOMHuivKGLdbJB3GotHJ6ssQsHhnuKJzKg=
X-Received: by 2002:a05:600c:470d:b0:47d:73a4:45a7 with SMTP id 5b1f17b1804b1-4852696487fmr35700115e9.24.1772804551319;
        Fri, 06 Mar 2026 05:42:31 -0800 (PST)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:d0f3:534:36a3:523a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dadb85b8sm4223790f8f.17.2026.03.06.05.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 05:42:30 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 0/3] Add critical resets support to RZ/G2L SoC family
Date: Fri,  6 Mar 2026 13:42:22 +0000
Message-ID: <20260306134228.871815-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 5ABD2222021
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-28954-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,bp.renesas.com:mid,renesas.com:email]
X-Rspamd-Action: no action

From: Biju Das <biju.das.jz@bp.renesas.com>

Some reset lines must remain deasserted at all times after boot, as
asserting them would disable critical system functionality with no
owning driver to restore them. This mirrors the existing crit_mod_clks
mechanism which protects critical module clocks from being disabled.

On RZ/G2L family SoCs, DMA reset to be deasseted for routing some
peripheral interrupts to CPU.

After a suspend/resume cycle, critical module clocks may be left
disabled as the hardware state is not automatically restored. Unlike
regular clocks which are re-enabled by their respective drivers, critical
clocks (CLK_IS_CRITICAL) have no owning driver to restore them, so the
CPG driver must take responsibility for re-enabling them on resume.

Biju Das (3):
  clk: renesas: rzg2l-cpg: Add support for critical resets
  clk: renesas: r9a07g04{3,4}/r9a08g045-cpg: Add critical reset entries
  clk: renesas: rzg2l-cpg: Re-enable critical module clocks during
    resume

 drivers/clk/renesas/r9a07g043-cpg.c |  8 +++
 drivers/clk/renesas/r9a07g044-cpg.c | 13 +++++
 drivers/clk/renesas/r9a08g045-cpg.c |  9 ++++
 drivers/clk/renesas/rzg2l-cpg.c     | 75 ++++++++++++++++++++++++++++-
 drivers/clk/renesas/rzg2l-cpg.h     |  7 +++
 5 files changed, 111 insertions(+), 1 deletion(-)

-- 
2.43.0


