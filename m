Return-Path: <linux-renesas-soc+bounces-13827-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E025A4A445
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Feb 2025 21:27:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E723A3ACC8D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Feb 2025 20:27:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DC2F23F39D;
	Fri, 28 Feb 2025 20:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TewiqD71"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A35E923F37A;
	Fri, 28 Feb 2025 20:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740774432; cv=none; b=Eb3ByCBHXwcTgyB8/dsa9mMUo4rLB0K4pf4lLiqBr7s0/JLlC8Hb/JuTlXzec2YrDxMImAQtWaeP89JwWgzCy65kqBgVSWlmf3HQ3QlCTMrsNVxrvbge+gbXghITSmVNUXarMJVnIlRpqnN5lns65nKZVoUlgenJNe3MfQBlico=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740774432; c=relaxed/simple;
	bh=vElvHMtkV+z4pIAHjAgAKqg4EUQg4CeDstv80T/oqv8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lqjbDHCFSHbEB28RhOwakk1ugZ+nATBjvVM0AMAxfyR/BTUGJiC5pPVcWXRbHxAGucVtYf0mwF0Ab9nVlQy1noT5EX1H7XCefSgmQKbPY3Y4+bCIba3xciHHW/IAaeXkVlCwSIh2N8whE2C7xdPboaavzuYMRRElakgw9/brbLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TewiqD71; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-38dcac27bcbso2553229f8f.0;
        Fri, 28 Feb 2025 12:27:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740774429; x=1741379229; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wRGvqDwz9ACHgvY6mKuqWKcELrdbhc8ff8wsgZWlpyk=;
        b=TewiqD71yrZ6Cn1kqjaaxj2PkT6caDvRn1oR7XXC54+FXu3MI7UT0CYe6SEGlRHsPo
         7EO33KZxvdgBiElor/zWzR3y5cw9V6ZXzkL/WDVUDxUrUM5qzMOOs2X+5ynYkfKx8F1V
         ZgOYWV2cYQnijcXa3Yo520x7PUqXWH0ie0XpSQsgWyX1q1wouJj28Nc5V/O3z8HIpvP6
         GiTjn9hLUtzkywBRQkuTF1RUE/VncJg7hyv8FZeJru8kGQ0jt5Z5etuc6EwT0ennO69V
         0tCEDxqZ6hJAl0YktniatK9V6O4PElPWPgd+a+vydyJ3WsNcq+DsKoVBPtFxh+zspSa3
         B0sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740774429; x=1741379229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wRGvqDwz9ACHgvY6mKuqWKcELrdbhc8ff8wsgZWlpyk=;
        b=ue0bwl09S8AFSjCGPIcFEloX5ktzRJaoaVYO5OOumtpmrrx+mPcVvpZYX5DS4rRxg6
         6hUO1tzdl50AcTnHOQ8LjHe6dQNQFfIZjFgBhUKUbFuyjBd8Xqq6lMstONi4XDt96zEt
         eoRUO89758CCj/lSfiuLARTAhijYha0qccUP7KeK01oLpIP0DUjfscgDdXC4ZUWONiEw
         FQ1ttgWIjTohWcaseJnPmwkJEjk4Yhpcs4OJzhHuPqxFTKw0pQFx0HbbtXW9XBwKbusZ
         8mHtZqr5C/mjPekJabdsPS+dzTCmNHVHF8R38UFfDziEzEvmlumwcdbXyDtbgnC1tlS1
         C5FQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJQ75LftJN2BW6+90fQ69La03o633G0OizcdNelTFhnUpBaogiDnhXEBefHxIefUIe13Dvwiw+NgM=@vger.kernel.org, AJvYcCXqgbVaYQZpjRdDA10pcG+zUKrLQNEvt5FTDiPWO/TX0+uuxtEiQTYASV4Vh64ajgTxse3k/lLjfgCRtU6w@vger.kernel.org
X-Gm-Message-State: AOJu0YzmkTzvzwHbgrOnAYIdsmRpyDqpPFN/zQInrLGPr3bDUP6z+u7/
	iDeRkzJTy9geQfa5ofBi6wR4rIR0aMpp7nA4ADLcWJJvCRNclxw+
X-Gm-Gg: ASbGnctpkp0O9Of8IhVfwBeuUgQfYGeBWO0jqtm3FRQOjlLgtVb6AUmqc1lnhAnApT9
	Y8OzZI7qkGeSusx/hu7Rdb0QS9uV9T/+YYPHkGTjNPUUWpIWECPby2tYk/md0ealzjsoKimgSqL
	d6SGlANGWENJAW80pJoZAXsVMYg78mIQg19z0FhF5nTuJ/VOL44Asdcpo4lBI/pm9NrEj7YoiEV
	gIzXhaGmuQXivz9GqIWOFTTDpI7oLUscVOhp67pZTcQ/SgD8sbsOyfnapN0ld1NvBGUWHshF8rQ
	aZGW84QTqit1s41e9etoNFqHm1hjAW4oGEl7ZB4mh2rbkqJjYZJYig==
X-Google-Smtp-Source: AGHT+IEQStm7cpW+6euRHTLk2hfUvGeyBkpeDjg62svZXf8gB+24vxVE0jAVHCeE6uei1NlgYruPzQ==
X-Received: by 2002:a5d:5f96:0:b0:38d:afc8:954e with SMTP id ffacd0b85a97d-390e168d26amr7155587f8f.11.1740774428831;
        Fri, 28 Feb 2025 12:27:08 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:459a:3857:be17:b16])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e47a6739sm6152099f8f.22.2025.02.28.12.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 12:27:08 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 2/2] clk: renesas: rzv2h-cpg: Add macro for defining static dividers
Date: Fri, 28 Feb 2025 20:26:55 +0000
Message-ID: <20250228202655.491035-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250228202655.491035-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250228202655.491035-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
index 6cda865c94fb..60d49ff2f8d3 100644
--- a/drivers/clk/renesas/rzv2h-cpg.c
+++ b/drivers/clk/renesas/rzv2h-cpg.c
@@ -302,6 +302,9 @@ static inline int rzv2h_cpg_wait_ddiv_clk_update_done(void __iomem *base, u8 mon
 	u32 bitmask = BIT(mon);
 	u32 val;
 
+	if (mon == CSDIV_NO_MON)
+		return 0;
+
 	return readl_poll_timeout_atomic(base + CPG_CLKSTATUS0, val, !(val & bitmask), 10, 200);
 }
 
diff --git a/drivers/clk/renesas/rzv2h-cpg.h b/drivers/clk/renesas/rzv2h-cpg.h
index 0ac2db805614..ed7036073b0c 100644
--- a/drivers/clk/renesas/rzv2h-cpg.h
+++ b/drivers/clk/renesas/rzv2h-cpg.h
@@ -25,6 +25,14 @@ struct ddiv {
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
@@ -130,6 +138,8 @@ enum clk_types {
 		.parent = _parent, \
 		.dtable = _dtable, \
 		.flag = CLK_DIVIDER_HIWORD_MASK)
+#define DEF_CSDIV(_name, _id, _parent, _ddiv_packed, _dtable) \
+	DEF_DDIV(_name, _id, _parent, _ddiv_packed, _dtable)
 #define DEF_SMUX(_name, _id, _smux_packed, _parent_names) \
 	DEF_TYPE(_name, _id, CLK_TYPE_SMUX, \
 		 .cfg.smux = _smux_packed, \
-- 
2.43.0


