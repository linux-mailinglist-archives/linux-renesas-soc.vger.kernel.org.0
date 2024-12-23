Return-Path: <linux-renesas-soc+bounces-11691-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B3E19FB399
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Dec 2024 18:37:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2CD4116660F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Dec 2024 17:37:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8AD01B4148;
	Mon, 23 Dec 2024 17:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ODurtAbe"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4588F1AF0AF;
	Mon, 23 Dec 2024 17:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734975450; cv=none; b=Yu4OcYAmeq4ceTlmaxu6IckJUT81KnkuzK1v5Rp5RHcA1NTMIkgBeX97w5hUWF+8sV/TnPXVu34Bdbj+XiI5r3bVBje+baRn+89qz621SOdkJrdfT5uEO2mH2/9xnc7oQiKWUOZhG4T5MGISBp1Llj7rA1r2SHa5skdzMGWni4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734975450; c=relaxed/simple;
	bh=0WMhW6nmHXdgCK+36LN8wvCObNOqnUkMi0Kjc1qzbfY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b53CbRikZLvXmthsLONsDxo8AdkstO4sERpAxfFzw0/taViGZyojrAxNdznJ9UptLjVIiShH7yeAN9FvUrRoAfwCc+mPxaRA/dZ3DPdFoOP5oFfIkioOtctfsaEbrJJVq56qKiPl0eJMl1ABU99PPzexVcEcblVqZ4EYWMf5Reo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ODurtAbe; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2ef87d24c2dso3557649a91.1;
        Mon, 23 Dec 2024 09:37:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734975446; x=1735580246; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jc/HHUKNNzsFid4OT9uFgxuCUz95p5aRrY3eI+B3r3s=;
        b=ODurtAbeG7oWVh6XNvsiBx3JIdhDFLLZSNQU7qvgk+gXn4jzRK896TnDlYFegG1JCV
         ddLD9Wy1xesSVutp8A7qQ5+JDzq8RICQMUW8QsY1k1Dk6jjU37RNxJwgg8m0eIoVbjII
         Jo6KVJxGGbZygzI2uR+eMx5wd0QuowlkDm4HtXNDJi0hSlOe2G7viTLn29Jd+RwsmFep
         az3IApPdvfK72V/mKWhKsoJxFsYtQ1QxBpuc8zl/7Ym5oubaMlGBv5NyDj9lEsCdjJBU
         qEJs5o0NRmseBnO9OhF4NakdHCfxiK0Bvhd7pXF40lyqbSp0QGta5y6M690GeL+V94Bq
         lXCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734975446; x=1735580246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jc/HHUKNNzsFid4OT9uFgxuCUz95p5aRrY3eI+B3r3s=;
        b=jb2QnWPsquQ27OVj0r8jk3kA9arRF+XsD4mH3atQrItK3mL/X+JvRgUsGcaCnMQKD2
         mkXRbTLKs0vR2//CtWUzY56cSMmoTqWIDXgHxrTHE/PEpqw3M5pU9bpwRpigbo+cXf1E
         RGbIHo6alpNeghsSjTNPI+MKSr7M1qWdJaG2OD3IowJcE8Z2fnJScRMJxxVnmWm+5bDg
         eqhUeZ8ITQLYBVsN6wFDxF2D8tCSS/wobP0TnxC6+ik5c0gSGbPO/X8qURo6GgPn8dtD
         jfOoJKhAC5vx8dRUQFs/62So9GIV7GEIIQl9wCXHMbc46HI1oQb4PyjhFkAZRTjLrW4r
         m9nQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIHthx8jzG90je6VtaQXvM3bRiZ2XAC/P854x5Dgf3nsCbWk0WVQI8bCJLriNxb6fD1qlPX6I8t4w9SHU3@vger.kernel.org, AJvYcCWe2J4TPF5sxibfVWzNsjiCfVfiCeHgxbz96b6Y328VrmJ1NaQFqcpA5Q6tobL2sr6oartsYbxjAtI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ8zI2PTVPHXFr8eVY6RF8XXNOIQJJs9slmpSJ7Lf4OySD2Bxm
	C5ft4FcL0UcNvKs/T5p2BBN4MKDTF7G3gSPBtn8DiUwOlOe0mfKc
X-Gm-Gg: ASbGncvVkJLzETTXA32eGUY75a270pd7f3dNt2AkUroP2gz+A+0/5Pjd/m08EGEW8zA
	pXB2F2VZYei8kyuAr2tB3N+KPrzLpOEt0cSiUHvxiS3zkFtzQWmweTtCVqFjsxndqIgFaegcRoP
	5xgaYnxbJNBbYyeaOwwmbH9JXrDd4eqinEjGrOhzK3yI7M69ZY8+0QyvOiTX++LyAFQn6h287et
	0rjsf7nXQ9M80cKSYUs4UciijBviSBUyAsNEkDUsfplknbpX0w4TjSlhTMbE77qUNQZbDnDaalu
	GOesJP0=
X-Google-Smtp-Source: AGHT+IEjBHuU4BjAgP7cQV7PHOgb3OBGa7Qw4iDO5WKmyKYhukbEv5Om1375nwRuRqIYQCHQNCc2Og==
X-Received: by 2002:a17:90b:1f82:b0:2ee:a6f0:f54 with SMTP id 98e67ed59e1d1-2f452e214c3mr19563357a91.13.1734975446499;
        Mon, 23 Dec 2024 09:37:26 -0800 (PST)
Received: from prasmi.. ([2401:4900:1c07:689d:b086:b856:9280:38c3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f2ed52cec5sm10664032a91.7.2024.12.23.09.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 09:37:25 -0800 (PST)
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
Subject: [PATCH v2 2/6] clk: renesas: rzv2h: Relocate MSTOP-related macros to the family driver
Date: Mon, 23 Dec 2024 17:37:04 +0000
Message-ID: <20241223173708.384108-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241223173708.384108-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241223173708.384108-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The `CPG_BUS_1_MSTOP` and `CPG_BUS_MSTOP` macros are exclusively used by
the RZ/V2H(P) CPG family driver and are not required in the SoC-specific
clock driver.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2
- None
---
 drivers/clk/renesas/rzv2h-cpg.c | 3 +++
 drivers/clk/renesas/rzv2h-cpg.h | 3 ---
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-cpg.c
index 23c89b0de38a..38edddfc42d9 100644
--- a/drivers/clk/renesas/rzv2h-cpg.c
+++ b/drivers/clk/renesas/rzv2h-cpg.c
@@ -41,6 +41,9 @@
 #define GET_RST_OFFSET(x)	(0x900 + ((x) * 4))
 #define GET_RST_MON_OFFSET(x)	(0xA00 + ((x) * 4))
 
+#define CPG_BUS_1_MSTOP		(0xd00)
+#define CPG_BUS_MSTOP(m)	(CPG_BUS_1_MSTOP + ((m) - 1) * 4)
+
 #define KDIV(val)		((s16)FIELD_GET(GENMASK(31, 16), (val)))
 #define MDIV(val)		FIELD_GET(GENMASK(15, 6), (val))
 #define PDIV(val)		FIELD_GET(GENMASK(5, 0), (val))
diff --git a/drivers/clk/renesas/rzv2h-cpg.h b/drivers/clk/renesas/rzv2h-cpg.h
index 9be5a312fa96..810275eba473 100644
--- a/drivers/clk/renesas/rzv2h-cpg.h
+++ b/drivers/clk/renesas/rzv2h-cpg.h
@@ -35,7 +35,6 @@ struct ddiv {
 #define CPG_CDDIV1		(0x404)
 #define CPG_CDDIV3		(0x40C)
 #define CPG_CDDIV4		(0x410)
-#define CPG_BUS_1_MSTOP		(0xd00)
 
 #define CDDIV0_DIVCTL2	DDIV_PACK(CPG_CDDIV0, 8, 3, 2)
 #define CDDIV1_DIVCTL0	DDIV_PACK(CPG_CDDIV1, 0, 2, 4)
@@ -47,8 +46,6 @@ struct ddiv {
 #define CDDIV4_DIVCTL1	DDIV_PACK(CPG_CDDIV4, 4, 1, 17)
 #define CDDIV4_DIVCTL2	DDIV_PACK(CPG_CDDIV4, 8, 1, 18)
 
-#define CPG_BUS_MSTOP(m)	(CPG_BUS_1_MSTOP + ((m) - 1) * 4)
-
 #define BUS_MSTOP(idx, mask)	(((idx) & 0xffff) << 16 | (mask))
 #define BUS_MSTOP_NONE		GENMASK(31, 0)
 
-- 
2.43.0


