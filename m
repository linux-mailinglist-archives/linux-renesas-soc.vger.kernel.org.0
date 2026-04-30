Return-Path: <linux-renesas-soc+bounces-31827-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CLvHEEVR82lnzQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31827-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Apr 2026 14:55:33 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF4F4A2FC3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Apr 2026 14:55:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3ACCE3012303
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Apr 2026 12:54:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66BA141C2FD;
	Thu, 30 Apr 2026 12:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JihXw1P4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 732C7413240
	for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Apr 2026 12:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777553635; cv=none; b=nhrvPPeVLq+FjPGtjjzQg/Ztegw6+p2S/8aXcUkIF/n3jXK8+zk/GNqEVjFTYnAF+6+LVsCRdHsUYM/B8Tb3TtGQ6VVBMw1A1tTCyKigYeTuNpvxObqGAkWpMtXFCd2HdznlnDXpcI9Y0JyxZ2AwCEjV7LfVs9AjVSpAkRyJijU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777553635; c=relaxed/simple;
	bh=o+YKbv5RhiQDWHOpnX9lX6EIOyiqh7i1d9JeWFNCuUI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a74wnKJthiLXwnj0eaGji5wC9iTuNvqc0GphHlLf/5l7AlWwXFy4dRv5X2M2W7+DepnBYaeXD7nQr2vvlNoo31uzmb4A87tIp2j/GaqwewYqR6nqMW4j6b968jYUC1amXFCM0aGhm1p5HVXjBDC1wOZOTumNXge14SlKsrsQnMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JihXw1P4; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-488af96f6b2so11697875e9.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Apr 2026 05:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777553631; x=1778158431; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=toWudKeUla0DPrgjgDmSCDuuPcRrG9lCXZCKgvy84i4=;
        b=JihXw1P4l8himiktCAcWfxU6YzZD0zLX/ZHyZUjK2YJVqdBhMN/+uIDg/FUbjpcOn4
         lx6eG0wOVr7lFQP1mBl3cA6uYRHGYxV3Q/lxqQfA8R+/hnUe3if4iopi2ZzVswO9r3IG
         oxI9W8U6BmV3XZzmK41ntTK+DK2EsgUOlS9gPsCXFNhd8gQB1GJyH+gwVp5tVpxA+vmc
         Rrq2mgk6F1NwILCOMgamHFDoshfeQ2LxY1c2mRWsRVSlmgniaP+mCQxJJjVr+MkZf4pN
         aGYF3kVRZvI1y4f9+PlU7kq4lqhqm94hLR2tpZJRiHWDUGhFGIkprbxcXH/NGKjyg1Zy
         Z+vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777553631; x=1778158431;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=toWudKeUla0DPrgjgDmSCDuuPcRrG9lCXZCKgvy84i4=;
        b=NA2mLqvd/jO5sS8m9Ivojiz4O+j2ABWCHlEZd3lVzAJPi2FCwi8c2DJFtGZPrDyIuQ
         fpY9OERCYLJotfM/cWtefLIbyojY3g0vDAgsDLLzYcX9upqm/000nmLvmwfqHWNqQH6I
         XNWKAUx+lr4CqA5ztMCkX8CNelP2UAH4roWIJCtwpGw3QewuDtwBAtmfcyhEJ02kGXX6
         zZL1OlwKQ2zcdCXvyIXJ+4cK6GVc4Lpq4x0CKfWoxj8Rti2UM3SioPrOaAk+w6TaLZJ8
         eHKEDUnEu1n3tpsler7Re/MIhuG/hWqNB1g98VQr1hqNvII9eRpPNe/ydTSUpETRNO+p
         kbBg==
X-Forwarded-Encrypted: i=1; AFNElJ/MohBWLnCianpw5REtvotWe8ls5OyT0lQRwGKHTLXKBww5IUvXoLX0IY+Ad7TX0h0vX3HRQx0GCi6EzFwkByboWA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2lQetZCFBdeC7So3UW5BY+3D3fLP+kZHYqbCKdvFOnB5BWpR+
	RLV1d1AtA7r6Uw4yNgGK8uaxYewFmV/DMvRfwMfM+AoUO/qR6RtLe9Pr
X-Gm-Gg: AeBDieu+X4Gzy2E0i8T8w3g7eFjfnN4EQchMkE1+KHd9jrH7U7FdoXmfHAecLZEbRJg
	JNYjpv4VqxaqvlFZs+PMxFpzR7DI98D9EjXleDK0YY2ObZQK1p+REbgs4JETCpHA6SeFnzGwzE8
	KYEB0NW0MKuAIphmBrYKCLA8LDIdECiTzqAk/lPllcEe8v9F0f6mewGTaHHt+ea28nTuudLSul4
	RtL9aAW1pikuT7R4plMxL5Ydtjdd+cLI9A7BAhh5I5w05DPd2NgUd18pizvjSVYYCFSFMSulMdF
	NhRdAzk/1rSyGnjfTfmdxdw5w/wqEWp5FKRAqp24YTzJIX9eUhpqY3wYkEuHzDEXVMoNAqgRCOm
	/oOVqTiv60zF6MVjyMB7WAlFeSD/XihhVs/nZf036fOELVqz5wwrFWE3KK6wTARIUVAP+YTqlW6
	8htQMkwfrQTrsj+ppPwpsOa/3iABvFTsdBUytidJs=
X-Received: by 2002:a05:600c:3e87:b0:489:1ff1:74d3 with SMTP id 5b1f17b1804b1-48a844707fcmr50058475e9.20.1777553631360;
        Thu, 30 Apr 2026 05:53:51 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a758:8a01:342:901:e785:f7d2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7c3057ecsm40995825e9.20.2026.04.30.05.53.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 05:53:50 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v3 4/6] arm64: dts: renesas: r9a08g046l48-smarc: Add SCIF0 pincontrol
Date: Thu, 30 Apr 2026 13:53:08 +0100
Message-ID: <20260430125342.439755-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260430125342.439755-1-biju.das.jz@bp.renesas.com>
References: <20260430125342.439755-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: ADF4F4A2FC3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31827-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

From: Biju Das <biju.das.jz@bp.renesas.com>

Add device node for SCIF0 pincontrol.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * Renamed SCIF_{RXD,TXD} -> SCIF0_{RXD,TXD} pins.
v1->v2:
 * No change.
---
 arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
index 86db86335d5e..acead2b1c842 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
@@ -35,3 +35,15 @@ &keys {
 	/delete-node/ key-2;
 	/delete-node/ key-3;
 };
+
+&pinctrl {
+	scif0_pins: scif0 {
+		pins = "SCIF0_TXD", "SCIF0_RXD";
+		power-source = <1800>;
+	};
+};
+
+&scif0 {
+	pinctrl-0 = <&scif0_pins>;
+	pinctrl-names = "default";
+};
-- 
2.43.0


