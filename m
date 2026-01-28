Return-Path: <linux-renesas-soc+bounces-27519-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QHJkLyH2eWkE1QEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27519-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jan 2026 12:42:25 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 321D9A0B23
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jan 2026 12:42:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D7BE7312E87F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jan 2026 11:32:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C28BD352931;
	Wed, 28 Jan 2026 11:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g6txWxaO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D056A34FF73
	for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Jan 2026 11:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769599848; cv=none; b=GymNRPRlW/ZqQS6wuiKo6UrTuEQrMQ70HEwDTc1XIVrQKmGtpZjyHxdJfJ0br+1/RhfDR7dXKMq/TrLlFwUJU+O6x4qmiBsWdLcsa9rBwHL6nVDODKazohshslh0szn3OEmKlnS6YLJptOURXYh1UdICu8VKFKavQhsAQAKxWqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769599848; c=relaxed/simple;
	bh=pMM/PndJtcrqNunXCRWuR89rswO75KmhN6AkztYIrOc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ebMcPmBGWztAMIVVMgSB8lXfDfPqS7Udl1J2RbEn7NK/Dwu+ZSo++yO+xgCroTrFQWpEdERTauNf8JYC7hQ/iIVGqXkvTPdhRm2rS1oc7s0X3fRWZrcc5oHdefNc048EQZa02qc6GAPD6yxFbbZ0pDD8hLvmay56SCgEZhxKKZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g6txWxaO; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b8838339fc6so167910266b.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Jan 2026 03:30:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769599842; x=1770204642; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RALgE69HGcRAQ0rk+8jn5LPohv4Ds7E1fy+PhYoqtBE=;
        b=g6txWxaOv5UL6bcgTVPB4l31O/gDIMiqHWf8aSaeuzV/HVP8GYCb3uXcSOXMH1ce9W
         j9oI7QLKZDefDhG2f1UbcWaOBbcmsmD+1aiRxWQdwmnDTdkZPI31q0xzsG4LY7mq0+an
         F6O919NBxyYm4J/8pJEx6u8xAXQjDWrdk54zeqHptzWVqC56w2Y0IcSJEXAoGxlgKbLJ
         Lx9koNaUAC9Wqb5DXSpEw+0QFs3Wqe4TMfhVBWSBQCDSR3CAMvf+JDaC+bxCchOCcy38
         2JDrdg6/R8E88lihDNEwHEoTUx8F0V01HGFw9Q7JxwBzAUlykaPiAbM7ULZF9FRnqOys
         HfKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769599842; x=1770204642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RALgE69HGcRAQ0rk+8jn5LPohv4Ds7E1fy+PhYoqtBE=;
        b=S/AAiI0NJKt2EPG8mgmD/yJe+dDuXk7tBeFrKvkXGP5GxZG184U+iOWclHW6gN5xEu
         zh/ZmSowc/31uY0gILGnPAZr+Oqa4nZiu9MHalHjKZXmWKxxozDbY3vLrMIJTvvIGuL4
         qhrWZ55LJky7W4pJ+JLK5G2afzYfGZjAZoIBn2nC96nPAVFOypvHu67/jhPURc+AvMYV
         UAgUVWHkxMwUpouxiNK3hk95B8QBXLr+sDQklOWQn8O83Apa800piaYtD96n74YcIasP
         ZWOZ3MVEXx7xBIFsg0RUDSi0B5pkNEzIP9axg2+jGMM1fac4CwanYfQz2Mgn3gFO57bj
         vXUA==
X-Forwarded-Encrypted: i=1; AJvYcCWPLB6A6mrFqILpzAaOMxP3hFYHXxVOwOc2NrHt+WHyHtpS6kKvIDMDuD1wphRw6LrmM+7u+xIGB+M1m7TcTySsOg==@vger.kernel.org
X-Gm-Message-State: AOJu0YynbtXi+lGIT6GuXMNdnrcaMDlh+LllgZn732EYYHG+GAqHA+Bk
	tFqB9JoUI7CH26BQ570UJTUWBfr4VHw574Gtm5fqTv1HGrpbUsv5WONx
X-Gm-Gg: AZuq6aKifUzmYX4mLZ0JaE1fxmagVjijtPpAl6UqTBcvqnOo0qarTNGjFp80HJGmFV5
	v9vVV1jDya1SxMWjqNyZKjGvUjEcCa/EuJe5OgId1xpY9Pw9midkr2ppMFwGtZ0kLvCAKftHH2E
	eAC1q84UzgriUGNxj56R7xdo4H6gkOs66uxMHUo+cSVWdGPLHR11356DHidgZQcFIwV34h/cRWP
	Jfm2YIFMoDvmn0Goqpq7dJTSlZ3iu49JAIjNunvZ48PCiwLrCSEPLI2lSczRdTnHISEUV4h+3co
	3rlY1foxJG1IfZ25Vc86rNiD1kSO9fHVOggJTetza02OYKwTGAO6ilerDg0G4mIaQK1iPWDUolm
	f8tNBWLRC1oPtN3IDd3oSrVYv2pHjFJY0IZE5fDBFPpZQKH/LO66qSlkoDQNUv28/+gSL+QMnvX
	LAHunr4gtsNmDZIr1/oPxazUIOb25pnz3U5M0N4q+SpKZ90Q==
X-Received: by 2002:a17:907:1c90:b0:b88:1e2:ed49 with SMTP id a640c23a62f3a-b8dac996f5bmr347803566b.8.1769599841956;
        Wed, 28 Jan 2026 03:30:41 -0800 (PST)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:e29d:6e0e:72c1:d15d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf1baa42sm114400366b.46.2026.01.28.03.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 03:30:41 -0800 (PST)
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
Subject: [PATCH v2 08/10] arm64: dts: renesas: Add initial support for RZ/G3L SMARC SoM
Date: Wed, 28 Jan 2026 11:30:27 +0000
Message-ID: <20260128113032.337231-9-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260128113032.337231-1-biju.das.jz@bp.renesas.com>
References: <20260128113032.337231-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27519-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_PROHIBIT(0.00)[2.220.108.0:email];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bp.renesas.com:mid,renesas.com:email]
X-Rspamd-Queue-Id: 321D9A0B23
X-Rspamd-Action: no action

From: Biju Das <biju.das.jz@bp.renesas.com>

Add initial support for the RZ/G3L SMARC SoM with 2GB memory and
extal clk.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Dropped gpio.h header file.
---
 .../boot/dts/renesas/rzg3l-smarc-som.dtsi     | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi

diff --git a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
new file mode 100644
index 000000000000..7c21afaee9bc
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Source for R9A08G046L48 SMARC SoM board.
+ *
+ * Copyright (C) 2026 Renesas Electronics Corp.
+ */
+
+/ {
+	compatible = "renesas,rzg3l-smarcm", "renesas,r9a08g046l48", "renesas,r9a08g046";
+
+	memory@48000000 {
+		device_type = "memory";
+		/* First 128MB is reserved for secure area. */
+		reg = <0x0 0x48000000 0x0 0x78000000>;
+	};
+};
+
+&extal_clk {
+	clock-frequency = <24000000>;
+};
-- 
2.43.0


