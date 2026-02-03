Return-Path: <linux-renesas-soc+bounces-27802-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OE4RBA/PgWl1JwMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27802-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Feb 2026 11:33:51 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A78D7BE5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Feb 2026 11:33:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 57EDA303B170
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Feb 2026 10:32:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5CF33218DD;
	Tue,  3 Feb 2026 10:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PzCJ6CgV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB5231A7ED
	for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Feb 2026 10:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770114642; cv=none; b=TxpPdxIvRIhIeM5FrM79t3sX1s4sdkYdTG/mA+vNbe8pxHhQFFRwundZsjTAR4oGy8sRkaa2h0U7R0hPlNV5XTuYUFwrRVPOo2hDUQwRN+6moQUXkHl8NlL0GBzTW0cv9MHkL4qR3X/fVhKScpG752xhaEjph1kZo80nXz/xy5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770114642; c=relaxed/simple;
	bh=Wq+a0akVk10PgsktNJq5HYS6ak+Cjn/XFmPIdz5iQj0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n0KVtBtkWtVEmGUt0ka+CuWxsEbkoxJwJmuzPcNwtcZvRazVeTe1QS4ehGVdssA8vVlbJrj/Lfxv6tVdTUm7aJDrkZiPmt68hariT8XhLzbjXHEEXgfqb7UCZRzAfzFFcsGqH6cn8vLyTrEJJN+CmVuXaE7/b3TxMMK/UsgK/Oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PzCJ6CgV; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43596062728so372281f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 Feb 2026 02:30:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770114638; x=1770719438; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ikFL8PTnKbTqxK17C0/xAPkkgkgnyx1QdclrpYFlkDg=;
        b=PzCJ6CgVFtBSRN8+2oZjjwJRGYcDJ0jI1JYPHpruuqdy8ArB3ki+fNqXSge8F6hCIR
         5Mk4PbNqCyYmmNf0XgFoUiL7ALBJGqyv+Dgg92qGSYBKfgOqDzk7HRacA+Q3ZIWGG+Q/
         VHO/gi3fXJROKiTOBH8T4Lws00aGabKAsfMFL0/EX2Z9WD1PjlgkC7HlOPGeF/gZ8mH2
         HorG8FpUzrdQSQ5HrHzEuUyk6dejnb/p99qe/Q+xOhTcYiFOi+kAQKnYiMokcUtHFccV
         GxhD4I78pi1bPfb+QmJzatD5Kf/21fusHwoA9Ive9BPZjI2vk7c538n5o2TM2douJdzJ
         c0hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770114638; x=1770719438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ikFL8PTnKbTqxK17C0/xAPkkgkgnyx1QdclrpYFlkDg=;
        b=KhxfgnKZe78Qho/Km37wf51dcRotuUtFEtKJbRUeE0KBsyzycjm3f0XFhAp4Ku/l1d
         aR1zEE0X/APEPLsBBCE3j7yG4RGZY+5F5SLMNv6IwDKail8EqbiZY9WuWk089nwI4r76
         2q5ow0ReLBRW4m/clkDIxqvejmDiHnpxbfec4TzuRMCfryuau9RE1prsQj58EjYmh1MJ
         K7u3Mc+xA3pahyvOmd4JDFksbOw+KJ5OtKLsWl1Qkv4TmSVI5ZIwAFo4G7ihZ8hTlQSW
         GkUXOCepb4SnZw5Uy7T0wh/clhh3sIM0N/JoXquN+0WWbjtver+PLEV4QeMnbJBU7VRk
         P9BQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4sWwlpvhxXVz6eS8tT2aPz1d08OcGVSfpOQ05opGTOWorWGN11t8xTlDpyMv+fZaweDfW1ZZfByofcHy1GUEAnA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ5zIB3TSz48YTVkrfyHdLYL2U/v9FQut9eMxF6SZ0JMpeW2tc
	ZTAwgix26+alv9Th9KkCKpzM43EP4CRdBkBX8q+VJMke/WDbdu7NRj1R
X-Gm-Gg: AZuq6aIQx8JL+n0bLU5eLwSo5/FO1jtmgACd0TbgRxxt2a6WtwY5HirLf0LZYuJPqbl
	79nDSQq+XPeSpzW7nxHHNDl1SL07OosGhoTg6ZeSpDbYwvc4s2KyREWhuS9WEUHsdcBX9Qv2dN5
	Rj274C0OyPlLJ+oLcv34Y8fL6IVDdLlgTfWS2/2ywHCFOCSV0v4peyd0cIyMgMIi0Hk/KUy/UtJ
	LmiOSPIFJSHj5xdr+91N443kjIIgg7NbquUfVQKsEWJ2BHE9rqJGi6laK5MxaoYF0oleGJ0K/ir
	QhC+S2qYDGSneC0lgg3lU+xTX9xZldiUVVScleDXEHXjeptCQlUZfZqvKyxMPdclWOuhTawblpc
	Q6RA/ZbWxfoiRsHYlTKj5rCbTbg2+F+jgCmQOVUmxdyLfnpWrywW6oxxQYC8g3cstPSbSGiMGj5
	gwDh91MqcgF+zvPTSDbA==
X-Received: by 2002:a05:6000:402a:b0:435:985d:1023 with SMTP id ffacd0b85a97d-4361130e9d8mr3936898f8f.7.1770114638382;
        Tue, 03 Feb 2026 02:30:38 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:9cd9:f748:166d:55fc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e1323034sm53160961f8f.35.2026.02.03.02.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 02:30:38 -0800 (PST)
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
Subject: [PATCH v3 08/10] arm64: dts: renesas: Add initial support for RZ/G3L SMARC SoM
Date: Tue,  3 Feb 2026 10:30:16 +0000
Message-ID: <20260203103031.247435-9-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260203103031.247435-1-biju.das.jz@bp.renesas.com>
References: <20260203103031.247435-1-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27802-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_PROHIBIT(0.00)[2.220.108.0:email];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A8A78D7BE5
X-Rspamd-Action: no action

From: Biju Das <biju.das.jz@bp.renesas.com>

Add initial support for the RZ/G3L SMARC SoM with 2GB memory and
extal clk.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * No change.
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


