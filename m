Return-Path: <linux-renesas-soc+bounces-27807-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SAOnA8jVgWkCKgMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27807-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Feb 2026 12:02:32 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 39ED1D808E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Feb 2026 12:02:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E37243005314
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Feb 2026 11:02:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 536A6326D65;
	Tue,  3 Feb 2026 11:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b9YyjFqu"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E29C13EBF29
	for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Feb 2026 11:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770116546; cv=none; b=YuJhzmHT+PTgSjo38QO2AxkWKyWQaYqO1LRWVSAp9regV3+xEqn9kjigzl0FrypWJKpmuCzOlRCBij4V68xITVA1OVsAak15I0n3+ssmZEDsAczwFRc63g6EqTzeYN5/304EyzRvXEeMR9rd1Kil06u0WSezqgqK4RW7lzmYENI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770116546; c=relaxed/simple;
	bh=uZGwCyR8TaBRIavVs9R9g5MQv26Vz+AVAIrRexh9L1I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n6/fHRaSAS0e79DQek283twMmW01tz+HkS6FItoCHyaVAfIfUNH0OVDsOGyX+nXEinItpxfWAkZE7LgK6q7MYT7sCC/jGdPzEvphLjf2klO/o33J5OJCp6Y6Y+DjfGZBN/T7zX6ZbYD9m7dxeBbPRsvoZtyC2J2ijVVqC3tkIGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b9YyjFqu; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-42fb2314eb0so4473223f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 Feb 2026 03:02:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770116543; x=1770721343; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=75bzqaTpN3IF/Dik9fopBoi2Oeugf3y24iWYj8B42gA=;
        b=b9YyjFquQIo8bD6ZiAvhv2X7XI/YoS2mtG3ximvuXxwhxjXV5djHVQwoIPHFuWmDS7
         JrWFXpfFPpYfJlFU/tRqm0WfLP5rVF9/XaZe19UGeoz4GuLnGEWzZr/fJY5bvGySe7lf
         ePZdAxevVGRx7OTZ3DMVYl4ZHzGMVdBtr8wdy0VF7BdbdsBRLmeWn+nndXZcniUVv5wS
         p8vrERbLBE6hBG7Jy4t/MpGg/ogQuKrZGy4FaQWBg1SAc/Awhd15RkNM/8+s35v/G/HJ
         NH/YGIYbPbCAkf9c5aCAuWY9J0lCifjUToGpTmF3HUij4UCeGv+2k7P6X09KylYeFiGH
         0+hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770116543; x=1770721343;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=75bzqaTpN3IF/Dik9fopBoi2Oeugf3y24iWYj8B42gA=;
        b=K9GFGnp8eQbhshrH4cR5Pyg4+tey/0fq490v0c3HSItnFdOGIVxHa2SWWxGqX2a4K5
         isF0qrir+V7eWcylGOPDWYA4EcrLzwz+3g4ndLyJwOFZ43WwcS25zCh1wXMKCkJZDyXE
         Rjg9/h2S4MIz7xsmfW1I2zwYeHh0BZs/3VUlSuVDcI0zWp+wCacQ9+ngz7EeM66RyLnB
         qd/ud1RJt8qLd4W43vlHGQoOrEQNer4P3iM9A/QDyk85nLQtkcp7CCZXX4v8auZM37K4
         RAF8Wkq9yEVZR2sq0RwySxTyu56MY3YOGmGHyYhbUShpjIiGqhf4fjPHGHfNCG9Tw2GK
         6zgg==
X-Forwarded-Encrypted: i=1; AJvYcCXDe0D0vLAXoErOL//hlxINpIWl1GQB9IXP8m1ocjTRyHSiUn+xJlrwqEo/klrVsw1BiquH+lhDtDV17P4E62XjJw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7ooDd0lRnSpHA6C8Vc3LauZ95yqDgYBtHntodGcMfezqVwsTj
	TcU0zKlEl68wIk/YYZQYY9Do3qL6gAnb7Rzwa4V2QoESpuaeo36p7XCX
X-Gm-Gg: AZuq6aKoqmpAbGFSXCnpLUE2WbLV1qfpKwxeQIVvX3qABo/eFJIiTcgUtoupI21LCws
	GGexT4u4bYfqPTrg8b/7M6XSchvLQTBntyNOPUJ1E+RejXKvZHgQI5sXMSwBiJgQSBD86oP0sZ2
	vZmQdccz4oWGLbnplxdhVSzWw5vszhiILCslV1CN1xittM8md+32AfzP9MOFmklFhDju6BL07Yo
	ldLzXELFxNQJ7erYRluPa5MhPtXpVIpFZSgC7lgkRuTAQKCn+HSHgN85c9iCo267tMOeT5LOv3f
	RuaN/LbUS1FIqrqyGUjgfHqP3eViNBBNfcdMe2pJNtKoYhnD0ohhPwaS3jdq39oItTcZVQtT+9Q
	WPXKXjuL+SEmbFBPX9Ew2k+CrhSUPs8BRrNnJIoc9xkZUmCMXNdsd1N/hu/e8bn+cIcnrLtT4in
	Kr6sZdi30Sc7bxRLsSyg==
X-Received: by 2002:a5d:5848:0:b0:431:35a:4a7d with SMTP id ffacd0b85a97d-435f3ab35bdmr22564999f8f.58.1770116542969;
        Tue, 03 Feb 2026 03:02:22 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:9cd9:f748:166d:55fc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e132356dsm54110495f8f.33.2026.02.03.03.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 03:02:21 -0800 (PST)
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
Subject: [PATCH v3 0/4] Add support for Renesas RZ/G3L GBETH clocks
Date: Tue,  3 Feb 2026 11:02:11 +0000
Message-ID: <20260203110220.265748-1-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-27807-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,bp.renesas.com:mid,renesas.com:email]
X-Rspamd-Queue-Id: 39ED1D808E
X-Rspamd-Action: no action

From: Biju Das <biju.das.jz@bp.renesas.com>

Add support for Renesas RZ/G3L GBETH clocks and  reset signals.

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

 drivers/clk/renesas/r9a08g046-cpg.c | 128 ++++++++++++++++++++++++++++
 drivers/clk/renesas/rzg2l-cpg.c     |  70 ++++++++++++++-
 drivers/clk/renesas/rzg2l-cpg.h     |  10 +++
 3 files changed, 205 insertions(+), 3 deletions(-)

-- 
2.43.0


