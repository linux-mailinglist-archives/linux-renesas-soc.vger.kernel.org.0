Return-Path: <linux-renesas-soc+bounces-23927-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A48A2C219C9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Oct 2025 19:00:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6ACDC422EE4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Oct 2025 17:59:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16101375758;
	Thu, 30 Oct 2025 17:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JNewtzJo"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E82374ACE
	for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Oct 2025 17:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761847100; cv=none; b=o12FxoZFbBKljLRIpTccpCy5U7/VwZA3JDf0hzkFmIAJ5TqrYIPiLXOW374jmHPFX7/MdZ7StJBxVwyKs1HgeTXxT4DS7vBYy+J7PeiFpIBrETXkq75GwoPJVw3ERTnkPyoh/3kLRikWvSgDEa5e9zE60ZewD3zghte98QgYthA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761847100; c=relaxed/simple;
	bh=KXgzGd6gNo09gi0VZSrUZARuDuGxlTCFI7gHi/TqNjw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IO3KuQfftyE+0apUk1wjrOs9FNhw+tF3wB+Wf+5beOftOEHMvqaAGxKPziGfvIz1bg13KBC1VEjP5T89GoYtS2CJfvZngea/6jWNU6Q25cx9GXX5Ie2PScNSNnlQNmVQssRDo9TKKYFvpUuyxUXOfbsZu9KMjtUS3VoQdQ4rHRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JNewtzJo; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-475d9de970eso9686775e9.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Oct 2025 10:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761847096; x=1762451896; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NV2npGkfv500PmnI9y9LBiyb4UX94aZHfGA0F6aPZeM=;
        b=JNewtzJotfw5LiLe2JGXAzYyGpsH7UwUG91pj2aKigmiysVtMavQWQpawJwo3XGX0L
         tMnLVe0GSNO0WDB+RqVpPANzTp1xQbYk5B+Prr3SqU9hhZ5GyV+jczXyeO7NF8sA7Tj1
         tAk30mJMsnUxaIy/m7EsDHiWP7feEjCBUCooJ8VjPrZnrAJ0xapsuqHEL4L8RPP2OLGW
         hpKVnUPIk1VuGAuOD1b4Lei/4PqbD4ZP7kp+qdLymtXmnlz4Ox4gzExymDJkAqk0xrXe
         /l1kG2Mq+5OBQJkG3CKBzQgsZA9eN0unEO20Lc6P2q2cB4cf41RMxEJo9zPYgR69mnct
         J0Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761847096; x=1762451896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NV2npGkfv500PmnI9y9LBiyb4UX94aZHfGA0F6aPZeM=;
        b=Jxsjd1GioH1lwi77/gFfFrf4vmkZSEyC4wThAFIWQqlEYoaBz6LVISaQaDn4yo2JD0
         LqFO4mU9EjuaiOBY57EUlbES9HfGR51leiMz7IpVXr9OAMrQ3qxYVbGUVnaFPdaD8awE
         bVCtRJVGn+VVLyDJIxc2wrPV4Z/mgdtBRT7XffElIsiohXqqIPFMY0Dd0dJn08bGz9l8
         8IYErsEPoxLYKeXqWxdGQ9TJHiUkU0ep9thASQ8v7c4c/ooopwV5lkhNxRLSNjyHehuT
         zbkGTEvw8QFTseSYFDT8pD1WGQXkvmK6hWscpKjhh20Jjf6luEUOIiNWB4OUjVcrUwXJ
         84Eg==
X-Forwarded-Encrypted: i=1; AJvYcCU6l3Wj4msl0fGlQrEMQr4+X6bMqmGG5ArTMjdf4LI4DQh0o/5fok1w55+sw/pOtlU+0cm+VSrD3BhbiWJxWpcDwQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyOtfKBS15zxHYc8NVnssvJ6o/p9f2lMI9zYsONwXJDltKTjiU9
	nqmewN9jBlm5MwreBSIl8inw/A0PHGe847j31OAHjLWhqBxYsD0OYhix
X-Gm-Gg: ASbGncuOzpdYm/GzBWM4PKT0m7ZewF5sJgeGT6WvNYTAUeD7ANYxNxMhRbaGFa5pRmB
	bqcO85UROF5Fwa//5G0G7jrs0VJYsNFYS+GMCvbap/jQieh82zz37xm2QwOmCktGE/IJwLQK1YS
	l5btCWyb0KlSwoVUQyCGO5Lf6j2ewj9wTds1opJAUE8j+Lc8uB3pzr83CHwjzAe8Dn8VRvC6FIV
	j38RgRjLT+eBU8Lvb/3ERQK3FhSEeo8flurZLetumMwp/pBe0f+bMp6HJtVYXsEgcZkI3ERP0QH
	gT3Mfto29ewo2W4y3lhrhWT8cxwl7EEia1B68Ww6m7oP4SQZGqwDDGmZE5R8r+8IAdFzsRHSm0q
	yDa7VSjO4issx+t5T57H/BGfTQJ48uOit44MsxRu8RVzUX9ii5IhthsD9TJ4015IL3d+QfSC9X2
	XzinJpW37dllxzN9KQObqtd1g/JpPdLGmoZe/ki+FvI+vg2bc60SUqso4A0PYlGag1CkOuVYI=
X-Google-Smtp-Source: AGHT+IEauFP+H4BtsTHNnwX2RMa6g7oaZopNNZdiBz+4pgcKwzPpZyX4Q4A5C/MiMwcUg284xoHAQA==
X-Received: by 2002:a05:600c:468e:b0:475:dd59:d8d8 with SMTP id 5b1f17b1804b1-47730793c2amr7516675e9.8.1761847096132;
        Thu, 30 Oct 2025 10:58:16 -0700 (PDT)
Received: from biju.lan (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4772f53aad6sm15098055e9.13.2025.10.30.10.58.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 10:58:15 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 04/13] serial: rsci: Drop unused macro DCR
Date: Thu, 30 Oct 2025 17:57:52 +0000
Message-ID: <20251030175811.607137-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251030175811.607137-1-biju.das.jz@bp.renesas.com>
References: <20251030175811.607137-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Drop unused macro DCR and its bit definition.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * No change.
---
 drivers/tty/serial/rsci.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/tty/serial/rsci.c b/drivers/tty/serial/rsci.c
index 504361ed5ecc..470b5701cd67 100644
--- a/drivers/tty/serial/rsci.c
+++ b/drivers/tty/serial/rsci.c
@@ -24,7 +24,6 @@ MODULE_IMPORT_NS("SH_SCI");
 #define CCR3	0x14
 #define CCR4	0x18
 #define FCR	0x24
-#define DCR	0x30
 #define CSR	0x48
 #define FRSR	0x50
 #define FTSR	0x54
@@ -119,8 +118,6 @@ MODULE_IMPORT_NS("SH_SCI");
 /* FFCLR (FIFO Flag CLear Register) */
 #define FFCLR_DRC		BIT(0)	/* DR Clear */
 
-#define DCR_DEPOL		BIT(0)
-
 static u32 rsci_serial_in(struct uart_port *p, int offset)
 {
 	return readl(p->membase + offset);
-- 
2.43.0


