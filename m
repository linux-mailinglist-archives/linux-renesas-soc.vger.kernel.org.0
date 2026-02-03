Return-Path: <linux-renesas-soc+bounces-27837-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aEu+Kf/zgWkMNAMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27837-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Feb 2026 14:11:27 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 35152D9B7D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Feb 2026 14:11:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A303530246C7
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Feb 2026 13:11:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27356350A00;
	Tue,  3 Feb 2026 13:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="loYbPeHi"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17F4350A33
	for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Feb 2026 13:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770124260; cv=none; b=P8OPopjicGAdpullfip+2oxuwfIucVnJTCRnnnJPiP48mOBqqm8GrHfThNx8OR/y7oUEs+te2G6TsNHD0efj9JHGRA7kzTvcKBuUsvH/fUjNnCWlji3n3qQMsx+L5efdVvY76rQyp8LSsdOGiBj23HcLDgwkSgVNp2+3fjmBC90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770124260; c=relaxed/simple;
	bh=ulzGfwFBdLI0KdBoofdp4L0xSfr6SAWHCp0feQ7Aqc0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ccTsY0prYtZxIkbWMfvr7U6zEjtLbHx+OqGAH6Q1Impg8yRwKS00LC+rQQ1JWCgGj4vH2b4dl32zObqrmNZMPURfz83F8ACPKt7IGnnFzkf1mqioqSN7aS27df8nIhryyIgl7d9WJovOD5cBOgHFbGrwVC2ftzir5BjDK/+uKoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=loYbPeHi; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-481188b7760so37780785e9.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 Feb 2026 05:10:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770124257; x=1770729057; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/C1+Nl/4wmQS8vlFidYpLBTK2ReRUCvwAwBWNYGjZk0=;
        b=loYbPeHi8emLCmXPwQJUELTWbqyrr7DkKxWTOSkypNIf4k95Mr9f2nlmrd/0biCTfN
         UKQOU6bygXYR+86lVJMsCg0L2N3y2G4/3TIJzInbBXvw9gjTn73tk88WtEXRvv+fli2K
         fUIjqwL7qT/0YkMgCIDMAN5zT0LKINeo1Mr+FpEeCTFhPZkNNuucG5ZBg9O6L1bQDYvb
         b9WaGojxiWOBXe8Eep1J3JN+B9GN+D9w32zqVFMiu5i97iZtcklc+PkVLBvh1O6RIIwq
         dZ0xuxvE4yqBNAcciTbc6xC4nOONh5ZkvO5kiPuLYeSkJAescf+Si0C1I20s4Dbqjfz9
         NOug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770124257; x=1770729057;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/C1+Nl/4wmQS8vlFidYpLBTK2ReRUCvwAwBWNYGjZk0=;
        b=O8JhduqNivkQ1pCMv8sujFjdzh2h6nKUxUvBHIJ+qxiU8NqT5pl6YIBg2RCUL1On/E
         +JOawWG+7u4XffLj8UabXFOcH1rZeTxYWQwJ1EGyXrKcOWWI8URerwKTe6GZYP/6Cm6G
         suKUaEzK7m5DOoIOMcVrZzrNSTaSqhZgtqE8+hjUJaVOji2JbjdDwrlexbA2/AONObsT
         +SfgwlwyQDMxEmwCPug+B8uhfLVJwtB65K3NSKKUM7e34uk8xCXuXmUFtLiyCO8uMZY/
         X12jbUR5pFg7x/7AOjidUavtefpCGUivc0h29rO1TqlisHij+oDDiG5yqgGP/FWzI4rg
         v15g==
X-Forwarded-Encrypted: i=1; AJvYcCU5+jYVq+ybsbvczHr5AIMvoJVvJ7pgzZET53R4vRxcK+rwWLhIm3QPz+WTNjsg1kT7jSXtawVJ9tWK4fsYD/3+xQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxkltnAz/1d1WAbFbBcMfWWGysXiXggOqh9z3VUt3JNT9u6WOhU
	OdYF86MFnSsEOB80LOWwq/6fbxMPv6GMd5qNc/acbbZiLyZa/Mf7fgW9
X-Gm-Gg: AZuq6aK0nraeNZarBB2RIfdSmo+ufBASEntph4hwM+AtbgXFyOKufErtwey8ns8iJ3l
	+nzrlZ+ewVEEirGVk4V86ATzBpIHCYdk2lOAcvEI+EYdVtJIUE2hmtvqFifCWVKp3k3aAfdaSMQ
	TK4Se4uIUi2Fp3bwoD4mEWuDTCkNivzg6Jlbackc2azAkK8F1AZIEdLyOdmrwDKprqYDPrZSAtT
	GKb8t/i45ow9JNh61wk7GT4SrtX2JzmZ7jVeoD1XIHvDTkafyWmUcBwEFqBJ+aRZuGZMk5iPq6v
	5IRCkLp8f0/cgdLeMMlbJacDiaY0H1LG/rlWyTHgA0EbPpLLbx2xXi3M7wIpw6giFnXJcTwXyso
	MMUpumEFQEt9MYOIQUvOcsLKHxICT+yUPSgzhQaOze7LAUKTPCT/sNqyUgUGjqqzrbst4BL9pma
	xGfWy9k6mPRl5LEbSESQ==
X-Received: by 2002:a05:600c:8b22:b0:47e:e4ff:e2ac with SMTP id 5b1f17b1804b1-482db4a7547mr192425315e9.33.1770124256880;
        Tue, 03 Feb 2026 05:10:56 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:9cd9:f748:166d:55fc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4830512ddd0sm63662185e9.9.2026.02.03.05.10.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 05:10:56 -0800 (PST)
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
Subject: [PATCH v2 08/10] arm64: dts: renesas: r9a08g046: Add pincontrol node
Date: Tue,  3 Feb 2026 13:10:31 +0000
Message-ID: <20260203131048.421708-9-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260203131048.421708-1-biju.das.jz@bp.renesas.com>
References: <20260203131048.421708-1-biju.das.jz@bp.renesas.com>
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
	TAGGED_FROM(0.00)[bounces-27837-lists,linux-renesas-soc=lfdr.de];
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
	DBL_PROHIBIT(0.00)[0.180.91.224:email,0.168.77.240:email,0.168.38.224:email];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 35152D9B7D
X-Rspamd-Action: no action

From: Biju Das <biju.das.jz@bp.renesas.com>

Add pincontrol node to RZ/G3L ("R9A08G046") SoC DTSI.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * No change
---
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
index df61a3b77368..a92a4e07cc10 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
@@ -181,9 +181,19 @@ sysc: system-controller@11020000 {
 		};
 
 		pinctrl: pinctrl@11030000 {
+			compatible = "renesas,r9a08g046-pinctrl";
 			reg = <0 0x11030000 0 0x10000>;
 			gpio-controller;
 			#gpio-cells = <2>;
+			gpio-ranges = <&pinctrl 0 0 232>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			clocks = <&cpg CPG_MOD R9A08G046_GPIO_HCLK>;
+			power-domains = <&cpg>;
+			resets = <&cpg R9A08G046_GPIO_RSTN>,
+				 <&cpg R9A08G046_GPIO_PORT_RESETN>,
+				 <&cpg R9A08G046_GPIO_SPARE_RESETN>;
+			reset-names = "rstn", "port", "spare";
 		};
 
 		dmac: dma-controller@11820000 {
-- 
2.43.0


