Return-Path: <linux-renesas-soc+bounces-25379-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 10CB7C943EF
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 29 Nov 2025 17:44:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 28F2A4E5A27
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 29 Nov 2025 16:44:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DF6931065A;
	Sat, 29 Nov 2025 16:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O+Ine2No"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6076830FC38
	for <linux-renesas-soc@vger.kernel.org>; Sat, 29 Nov 2025 16:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764434617; cv=none; b=VmR5HbhMmqKDw85RV22EsnxwdPOzAcydOZFkAf+fu7Ag8JscJl8jVJDM1fJad2kTTS4xNS7VCXxEm+xniO4lPsoq2cM9V4+2lWoSADrXwc9Uv/uIfi5eM0rkGvzfJsHcJwqLLL1OIh0j+Dyn8O/12vlNkf1QaegwSFsnOnEct0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764434617; c=relaxed/simple;
	bh=rQpDIU6guW5TisAhVN1RrekmUcn6qvG4tAu7NY2Kzs4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QYVRgWIIM8T76avC7+3itxuN2xOgwemlkOwCjuoRIQpNCvSiz6Q2D+YbOJWBJS7h/jBykF7MpWxa2inZHP3dWHWxzvgCXH5RgycveNG7rzBzfpheSjTcU7+vNbj/pvvuABGlFDZBCm/GJpQWKupDrQ1Y7JgtC+61aC2TbGVaz94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O+Ine2No; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-477632d9326so16737375e9.1
        for <linux-renesas-soc@vger.kernel.org>; Sat, 29 Nov 2025 08:43:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764434613; x=1765039413; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EgwVwBYKZhPFgsmAEFQqqtyF7p4aZUluwhsWNQ7hNV8=;
        b=O+Ine2Noht1W7ImlGptacEUwwSbonkIWDqJUQOJ3YHOgrQz6nMszR3xOiSQH8cLuJO
         jhFK3Qkj6693Ie/oj05M6e3HfZKGydelsam7X419oHXNir4KY6M0aFOOIY8SZb8ha9lY
         qLmcrXXMNA8gMFOlh5WeNtCNzMcaH4hgtRewAFdCjLqnXMW2zEwxXvslluiMGNMFP+p5
         3TrfBmtIjn33t6u3arwcKkZ07edaXB5ycjg92pp5HNT1++dPVPtEY54wjjzsKfc1Q6wn
         GF09wVBQCOWOWcq/9Q2Fg3EIVPdFPHfzuf8UpCjIfj3QcUhajsgt6rO9/c+VAf9fDvSE
         mEZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764434613; x=1765039413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EgwVwBYKZhPFgsmAEFQqqtyF7p4aZUluwhsWNQ7hNV8=;
        b=sIc/OKzmuIbWmVU+5k8IxX4C0X+kPu3eKMua8jH+/v9K/jX5pdXWmq5w2++QgTu0mR
         9+qM/aSczRAT8zSQz8Gc2/iyaeUJtEXSq3YrwwAuabNPNayktsL/TNGkVsvHM60LMl8C
         UkK7HAO/T7DRWHnUQ9IoC3TKIo5beE143qkfYB+3tKgzQ0434+8x1LzENYDQCRzMTCsJ
         OQe6WI9hgTxO00PnhLhRQKjJ/iwwgUo4H6awxvx5UU5rCRXbjh9ZV/Zc0Lik4B+vE9+u
         22Xgfx46wdKnqnwzolY/TBJPezC53lI3YJUoniLvCZKC2sS4hkUfkY6q82Zqd/Gbsblm
         FZIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXodNsSG1NL4fLN2YYyGoyC/J7taRJ3gMZht35T3UqvUPMrnmaE40SNFvTvAmKaSpsYNPa9FNR5wiyxGee3fFEUyw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwuwDnlVOS/jRZh9x0cZgQBKSuJrCrSKmoymGOrv9gRqvDhsrmf
	BJkQKzUDM3P2LsLa4jB1OKxMLTPQO+J/i1TeV2y8C49OGYNsZEr/Q0cW
X-Gm-Gg: ASbGncu4iwVE06FpFlraq78Dws00ypgll5k34TPIxNOML+Bvhmd2T/KNfu8YHmGD0f/
	WU09fCKo/VAgTZaSI46ga9CS3s9OGRbkIO61N8kJuBamjXUZUSeqB8dPlzHyvkFrjA8m4odQ2H+
	zVh8nTPMPOK94CeaP0HNPml7nm1/lGDFIXRfw4NjnseXwV+KzZ0xNQdZ0kUfigwfSxutHpsbMHd
	N7rYK+fIENfpOu7qfoR12vGx0Cy4pbCGHzk86GUaUrmx4EK44tNRggAkFlQn9akqfWtaZkZpqM3
	kH48Sv9ANs61JWkDQHDX6ZLy4/055C+K+DOynhKrQ80/1QObYGjFpW3EiHq4k+vWvrCPdnBqE7j
	/H7ZI1LkE5O6kPqdYggUGzejCPvZUhwg9Pt1Qm6h+i5UpRfGqGj08qLdPNlqD7fl6rQG/fK3pRW
	xLaND5iGA8QOlPUM+iQzwnC/5sWxxopXubOKu3dvEIqWt2MW/NMKtDMzzTFmFs1PKJnFpjZC40V
	0vonSzQUnV5MPPvO0cHXplXSQ0=
X-Google-Smtp-Source: AGHT+IGaZAREtl6NXRyEBHs3whc3cv9+Ie6xWn8QQTMCAIyc9I7Ia0lzjDPmCBCB7fkXaU5WpwDQ8A==
X-Received: by 2002:a05:600c:840f:b0:477:df3:1453 with SMTP id 5b1f17b1804b1-477c01eea66mr306351795e9.28.1764434613285;
        Sat, 29 Nov 2025 08:43:33 -0800 (PST)
Received: from localhost.localdomain (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1ca4078csm15970060f8f.29.2025.11.29.08.43.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Nov 2025 08:43:33 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v5 07/17] serial: rsci: Drop unused macro DCR
Date: Sat, 29 Nov 2025 16:43:03 +0000
Message-ID: <20251129164325.209213-8-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251129164325.209213-1-biju.das.jz@bp.renesas.com>
References: <20251129164325.209213-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Drop unused macro DCR and its bit definition.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v4->v5:
 * No change.
v3->v4:
 * Collected tag.
v2->v3:
 * No change.
v1->v2:
 * No change.
---
 drivers/tty/serial/rsci.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/tty/serial/rsci.c b/drivers/tty/serial/rsci.c
index 158173077c2f..15ed6cf5c6c5 100644
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


