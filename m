Return-Path: <linux-renesas-soc+bounces-15504-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B673A7E769
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Apr 2025 18:57:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EFA183A8A05
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Apr 2025 16:52:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F80021423A;
	Mon,  7 Apr 2025 16:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H2kNzDb5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4161919C56C;
	Mon,  7 Apr 2025 16:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744044742; cv=none; b=koTiF/7L+7aaAFemQK23MO7msNBXsgVcnkGOwPVt36YrU2iSJ3IC9P4Ve6BmZaap31wtq4NZH1YqHPcbv+1jps5kH99rYSXp9YR4jFpR68S9aRpQ0gdZAqf+qImcaIWQcT2uG2J2v6YlySlVDLb+JvbrTkiDOMPIKG0ouisRHFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744044742; c=relaxed/simple;
	bh=zbgJ6mg3C+/MKnz8M4eNny/MvicKYv6+ykizFwE9XRE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mMqI55P/CsAYnmNFw7J1ocA9+GM71v6kwAN/FiFFHsGKcgsUe0m4GVHFU4mg0tL90zPo3rh/MOXoAs8BNXFvr3NMUZeV4cLDkGOxYi6EEjYWRz/UYY4/GDgVujfNwtIeQXWo3nLatN9ZmixtQ/QRRFQqnKNWE+i1gMbrs25tN5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H2kNzDb5; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3913b539aabso2694227f8f.2;
        Mon, 07 Apr 2025 09:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744044738; x=1744649538; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xktnEXXKtQ396AGgEmOxLxFn+tjVbH2T7f18cyqhW5c=;
        b=H2kNzDb5G9Mt73PyweIcDq0AyRc8ylIJSt+u9WTh832rnF7qlBErZimG81FOop0bDm
         tWe1RzcWODXex9iWXmH4XMbBUv+/p5tO9ftK7hIAuZt706Rg2TEnlpxSID5sI/PR0Y8Z
         4cGL+mYW0/i4i1DWYAp5QuLwh9IKKXh0+uG8km0kUB4D5fFKnwrkpU1TXg5796mn+M9J
         E2ub8vsCNahEJck3HpkakYrmSkvTurLnNbapT8ar9LHklAHXJxVpdg6pnoBbQISEzQVz
         02DJjJPEY1mXlE7QP38gwCLZm8vgNUsR/Q43DoYmx/b7CxRQU2Tz1Pm8S1t4+XPLgj/i
         TOUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744044738; x=1744649538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xktnEXXKtQ396AGgEmOxLxFn+tjVbH2T7f18cyqhW5c=;
        b=QNN70PfDR+1rrPbofGryr8+HfghgQB+zh4F/mVZ2/SuVY3o3NP0vVBaa9+00Hrc4Eq
         R0zXVA25pmTnrameE050Qa60u2PqCZNhbGS+bO7Mj9tybb6LP7AFN4I5nmYCt4FcOEvH
         tATxQ5L7BrMl5PH+JS80YDe4+1+WYZW3RkFeWeIKAwZ9Ha+8Pbo0A10qmDVQUJgRaQdS
         xCnRtCBVozHOFHQa3ZvlkjSob9sQVtkgbPmVl0ZJSBK1eNjkHJHkbwi5EYqTcZixGhqr
         10/ii8J84IrHBkKaAp7uNZVNr16NNGN8hxtPZ+GVsbinR5+Ed/1J9BRvXTf4mgPuQ/Yv
         6cVg==
X-Forwarded-Encrypted: i=1; AJvYcCUdPBAY1dAby1uRFQZVBFysSSY+ZuDkSsNIuu+Qe7MVj7iSuWGqNGZ3eAcvICFm548nnjEIkoMmQRPP@vger.kernel.org, AJvYcCVUwOKnAwMUMwCDOLM+n6Jyn/KFjcc4+Z1zAHrdbBdLkHWNfSzj+LJsvDUSTglH132kErX6VL0kTqWd@vger.kernel.org, AJvYcCWzWkiix8/gjhRNp/8Fy/6d2zWJ+Rnnq5ksFa4/DMrnx3HnuFmNaAV+A8yQdVDmfWjkiCAoddCpTiiBQJUq@vger.kernel.org
X-Gm-Message-State: AOJu0YxGgypE1qrkh/+uLDL8Pr690C9ruERy60SEYL7RadceMQbAUZBb
	M5wUg1EYtXsiQJJjC/W3CHmT2YMvtkzTSWLuEbjlkIASmOfCmKWs
X-Gm-Gg: ASbGncvOz07BDN8V671isSyipJpHpJBxIFM+k2d+NN9yM8MhCp7SxuIB0YhG+mfP/AW
	Y6J08on1V676LPD6Q92MylFUv1KTaF+wKwaPxlI/p3uU3+CRFNTMxg4KokxHPEEji3DtrBWUJzk
	MhYIDhNjo7VYI+ox7CyplbBye93J4oh4VXDwmiaSAnsYPUH21b26x9LULY+d5EvbnwTmZ9YkW4q
	kNkjN9fyU0toV4jkLYQ9qDoMUXTlh0EulxToe4UuT9Tb27W0zj70WA2mnPsi8Opt5AOfhvrKK2W
	oP83zh0un606WZBQ5zRoh83QL74vJfqSffLcpGKyoDNt1vJK8tnpbzXR+JgXxoFkJggyKw==
X-Google-Smtp-Source: AGHT+IE5Z0IG5PtFIIratWuAfb+xmtIzwhj56I4d3k4JvKf97Mvmg3LXofnC2+ZKqj4te/8TOmYLqQ==
X-Received: by 2002:a5d:584c:0:b0:38d:e401:fd61 with SMTP id ffacd0b85a97d-39cba93cef6mr9886746f8f.49.1744044738390;
        Mon, 07 Apr 2025 09:52:18 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:78b9:80c2:5373:1b49])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec16ba978sm139272305e9.23.2025.04.07.09.52.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 09:52:17 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 2/9] clk: renesas: rzv2h-cpg: Add macro for defining static dividers
Date: Mon,  7 Apr 2025 17:51:55 +0100
Message-ID: <20250407165202.197570-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250407165202.197570-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250407165202.197570-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Unlike dynamic dividers, static dividers do not have a monitor bit.
Introduce the `DEF_CSDIV()` macro for defining static dividers, ensuring
consistency with existing dynamic divider macros.

Additionally, introduce the `CSDIV_NO_MON` macro to indicate the absence
of a monitor bit, allowing the monitoring step to be skipped when
`mon` is set to `CSDIV_NO_MON`.

Note, `rzv2h_cpg_ddiv_clk_register()` will be re-used instead of generic
`clk_hw_register_divider_table()` for registering satic dividers
as some of the static dividers require RMW operations.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clk/renesas/rzv2h-cpg.c |  3 +++
 drivers/clk/renesas/rzv2h-cpg.h | 10 ++++++++++
 2 files changed, 13 insertions(+)

diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-cpg.c
index 4cda36d7f0a7..4123c30e8663 100644
--- a/drivers/clk/renesas/rzv2h-cpg.c
+++ b/drivers/clk/renesas/rzv2h-cpg.c
@@ -298,6 +298,9 @@ static inline int rzv2h_cpg_wait_ddiv_clk_update_done(void __iomem *base, u8 mon
 	u32 bitmask = BIT(mon);
 	u32 val;
 
+	if (mon == CSDIV_NO_MON)
+		return 0;
+
 	return readl_poll_timeout_atomic(base + CPG_CLKSTATUS0, val, !(val & bitmask), 10, 200);
 }
 
diff --git a/drivers/clk/renesas/rzv2h-cpg.h b/drivers/clk/renesas/rzv2h-cpg.h
index 03e602d70f69..00b52b459aad 100644
--- a/drivers/clk/renesas/rzv2h-cpg.h
+++ b/drivers/clk/renesas/rzv2h-cpg.h
@@ -45,6 +45,14 @@ struct ddiv {
 	unsigned int monbit:5;
 };
 
+/*
+ * On RZ/V2H(P), the dynamic divider clock supports up to 19 monitor bits,
+ * while on RZ/G3E, it supports up to 16 monitor bits. Use the maximum value
+ * `0x1f` to indicate that monitor bits are not supported for static divider
+ * clocks.
+ */
+#define CSDIV_NO_MON	(0x1f)
+
 #define DDIV_PACK(_offset, _shift, _width, _monbit) \
 	((struct ddiv){ \
 		.offset = _offset, \
@@ -150,6 +158,8 @@ enum clk_types {
 		.parent = _parent, \
 		.dtable = _dtable, \
 		.flag = CLK_DIVIDER_HIWORD_MASK)
+#define DEF_CSDIV(_name, _id, _parent, _ddiv_packed, _dtable) \
+	DEF_DDIV(_name, _id, _parent, _ddiv_packed, _dtable)
 #define DEF_SMUX(_name, _id, _smux_packed, _parent_names) \
 	DEF_TYPE(_name, _id, CLK_TYPE_SMUX, \
 		 .cfg.smux = _smux_packed, \
-- 
2.49.0


