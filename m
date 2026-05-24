Return-Path: <linux-renesas-soc+bounces-33053-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ABRQAF22Empy3AYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33053-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 24 May 2026 10:27:09 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 890A15C1AE9
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 24 May 2026 10:27:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 87EDE300361E
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 24 May 2026 08:27:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29AE534752A;
	Sun, 24 May 2026 08:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LQAUT7Op"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B50122D7B5
	for <linux-renesas-soc@vger.kernel.org>; Sun, 24 May 2026 08:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779611224; cv=none; b=KWz1EEG2Gf/Ylc1BY6UERYxTjU3hVSU+IeuJTj6f1T54fw9E/M+wG93gZvGB/5dH2K4vTmQvuAwuZIohL1ugsKBQdE8cRER8Q1dIkiK1E+dk3GvMrNI62nTorjR69dBAbz4oES9BwrGo3SV5YFIAK0X9aCqYxgfzG3onshq0Lq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779611224; c=relaxed/simple;
	bh=34dp9f5T9YrXRKgyAocDQRHMx/8sQhWIOEfGzLLGqGs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dRrdKvcR6CtBehrj5KMgJlTftFaDCE81CiREwa4+zAnpft6bLxOVSOkX/K2mwhPmUWlIrtStIUrQ4sGKw/XdIef957vyKF0g3R0arEaPILsqRpHzJp0Aez5azb9CSbyVNnjBjxcbMUfXWKguKZvnGTCOf7HNRAUBk9yOV1VrOiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LQAUT7Op; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49048e043e5so12679385e9.1
        for <linux-renesas-soc@vger.kernel.org>; Sun, 24 May 2026 01:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779611221; x=1780216021; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7qdTAUWZwMStvqigprrXqH9hWjCxZHQLI8rGUkZZZlk=;
        b=LQAUT7Op12qOXhtHVB2LySn92qY2m+9kNMyi1DQKp69pMJDUzzcxW/NxjnyeCk/sSb
         c7gy+u19fOwHOv0kUv+xGKYmqmGpHCjidCKonwT+mCmuvVMdA4Btyl5QV5VRIJ2kRpZY
         2LS81a23qFrumWJqg5F9y09LEYiFuACEI7BQJWRTypnsJcx3hVg3lt6P7vr3JpOY9kF9
         6f3BcQ7h4LHub7n+SiIzJ05YrpYheIkqdmWQcvZSiQJYNxxs07rObd3vkmPjHLoEnNnm
         PpJHoHd7hCBFKMhnG2QV5dmGcSWwnZnstOPm3wOTZAYSuOKO+MV0ultJb+NRxnTsclpX
         lABg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779611221; x=1780216021;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7qdTAUWZwMStvqigprrXqH9hWjCxZHQLI8rGUkZZZlk=;
        b=KJHbe0B4DLv6snTix6GWfnDCDauI088TlX5SHcLuD61aGQ73OlyKHDagOd+G/zrA9u
         K6nxbv1kt5XlJ3xxXtsGhJIMHG2DXRtjJB6feV6qnOo6EhOVgDcF521lnlGhA68lz/uX
         U6LtrxDlig/M94B6QeRODV4Jn/8xtO8PwFjXiUUxUtDC/eIEXfgHfRZ9rYh3zMF1YXoj
         YBQcsaXFGczRwN/VE1gg/XPmPx19fbQ1q6ejCR4d6QRFS+uKi9K3P6a+bEO2zA/EMUDV
         xvbwrImGLfM3sLaIeTB024pI4RmLEZb/iLArH9/bcSSY4013p1nfQPzjebBIL9f04DMI
         oK6Q==
X-Forwarded-Encrypted: i=1; AFNElJ/oxMPx02jvEZEzQPznN07y06gSEIcq3NaEW1Akhsi/hPpbipwy4Pk517KQkWzsrYg2UmWaf4OqrIi58f2GRcYApA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5uKRA8IAde9eqjNzOiJg6/BNbEjcV9fp8g6EF47RuRATC4NKX
	5atpaY+TiOWZJPedJavf0vqV5l1nyqR88eCj1y9f29AOADa33Tsz5IHd
X-Gm-Gg: Acq92OFinBi3A6sjXSArSwR7cxWx5//g1DEwioQScYgWOOiy3DegeAbPiBqzkT1vE5/
	f/SU7jF5xOjjsZuxek9UwTFhrxLd+LUFaBE38Vfi9uWLfFrjlc+z7g3YvNB/BcwZcosRLRQpTTY
	cSIuu9l5D2Op98B1UIfsY99Ouy4TzPwkjCxmI6QIK4JHaTzJo3h5EvMlstdPHpGRbAQG2V5Z90i
	Un4nJ6TtuOmnyl9q2D78pCyaf/sDt/7pkSOSR5S+268GodFGjkOi1YJ5S+ywg/R6IUerXyo1kM+
	0N2FXdOdg5VwjfN3jHN90f9K5SLgconb2rHZFhCG3IycRNGNcaOTME5DTN+YxQDGUHwJY4/iGHh
	CMLEY7VPp9RBj3b0HMoMds/P8b8cY/iVV7xyDlMf4LtUMr4/WK1ZPp6COy4p2Z2yJOnPqUIhT5n
	bfRR/Ny+ssYRVREtykqCpE10oRVbkIht33XlysPdcYbJ0A93mbiBd0+yhNh+M=
X-Received: by 2002:a05:600c:1c0b:b0:490:44eb:c1dc with SMTP id 5b1f17b1804b1-49044ebc2e0mr172726285e9.20.1779611220498;
        Sun, 24 May 2026 01:27:00 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:ae73:a12b:ca55:91be])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49059fb42dasm47284715e9.7.2026.05.24.01.26.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 01:27:00 -0700 (PDT)
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
Subject: [PATCH] clk: renesas: r9a08g045-cpg: Drop unused pm_domain header file
Date: Sun, 24 May 2026 09:26:50 +0100
Message-ID: <20260524082657.19335-1-biju.das.jz@bp.renesas.com>
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-33053-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[bp.renesas.com,redhat.com,vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.997];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 890A15C1AE9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

The linux/pm_domain.h header is not used in this file. Remove it to keep
the includes clean.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/clk/renesas/r9a08g045-cpg.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/renesas/r9a08g045-cpg.c b/drivers/clk/renesas/r9a08g045-cpg.c
index 9610676058de..29b47469d814 100644
--- a/drivers/clk/renesas/r9a08g045-cpg.c
+++ b/drivers/clk/renesas/r9a08g045-cpg.c
@@ -9,7 +9,6 @@
 #include <linux/device.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
-#include <linux/pm_domain.h>
 
 #include <dt-bindings/clock/r9a08g045-cpg.h>
 
-- 
2.43.0


