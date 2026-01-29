Return-Path: <linux-renesas-soc+bounces-27584-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0PVxLG8ke2nXBgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27584-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 10:12:15 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 463A4ADFF6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 10:12:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 83FD2303B171
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 09:11:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA5BF37F757;
	Thu, 29 Jan 2026 09:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ekFCyuJ1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5AB37F11D
	for <linux-renesas-soc@vger.kernel.org>; Thu, 29 Jan 2026 09:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769677878; cv=none; b=svSNAsJooDSn1vOVyZrayLGXalFBMg5f4j7d/BMgfmpJqf0YatxUlsa4HVb58tHUnyjAN6BH04s7YsJWNSJw0rR10bDFvUM61JZ4cbmsiG6DepUqAAXgl0t/gMCMauJaji/FR10u7EcOZBJdZhfRzjfVGfrCdWnuD6alidixO7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769677878; c=relaxed/simple;
	bh=v6FdTaM3/9S+cgZOR/jP9oZ2cYA4WGpZsxblMxIWwD4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H5ZYRrvS4uyTkIKmphfYwl8glbwiAw0GzO/EEy+GYVFqiPFYehD54eUTlpc1/HGgwe7uKp8lGnh8eqsxd9eN7ofDbuK/BS0+6YVBqb1XdqVdQnyHUEwG37KdsD32Cpm6EhbyBj6aZiXWOzXexAXC9T5+Il+DNTKyg3aMOsat47o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ekFCyuJ1; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-47ee937ecf2so5796045e9.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 29 Jan 2026 01:11:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769677875; x=1770282675; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yxb+xzLrz5vUgOO6D/hBhQgk8cWp111oMhH2v5GHUEo=;
        b=ekFCyuJ1gP/PZsf61ep3ZZVggHI6M10J8OD5qdyjoXM4wppazlMHknJUMbX6hGozdF
         ixAgMLtaHUKv9L6+18qSBWk74GYKtIa0iA9m1qzxs7yy9ZNT1SlqztvKNwUWxJdlZVb9
         0BZUetnbFcwg7g3qBr02Gfk7UcDGOvQeoIP6dAkCRRjO6k/SfUrNxiHk+CAWO2q69Kvr
         Ju0AkIJpsDqXlQgbjNoXIqPrggd5Nj8Kd+8OW2PZFIAgIr9w8zLA9ThdbWhNQtaXidvv
         h/7Z9qVyPGxV+Q9XGMXzs9MYfC23zChUyqWZMWMOfnoBSiMwruEFheMgC0TApNkfTeUY
         P3bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769677875; x=1770282675;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yxb+xzLrz5vUgOO6D/hBhQgk8cWp111oMhH2v5GHUEo=;
        b=BnQ3diG5M9Beme5mwQpsySAVIlivoZ/B3uVvnJJyWKtiFVmzFkeGyVXfZ1ScSIAmku
         MpG5X1R0nwyGQw1lwPAon3LBUHkiCG6xRmAMd+IPejwno7WNlMpmSDWVxCmsa0QDg6mY
         jlB89ziVDELojApbq8xEEXoUURR9GX0g8WkPCDjluJmojnWMbNCfy8+MX9u25np4Ve80
         uLcqwrjeIpynLAN22/D6qcWAceo/1GQALm26s+WG5HM4ddHwnLiwahdXu/yl6+b+MFLp
         pS9r/SFxh4q/8FACjmoWtmyD3eDcQYGimNzO/NqIFgyXstEilZDu4we69d2sEg6Xm4pK
         VNww==
X-Forwarded-Encrypted: i=1; AJvYcCWurQDP6n50lfF34yYnIM7eD6lz+FAs3rq/OK8vspeHFfktw6TYH+OXQ+fjdNReyH8YIQNJmGHI2GMDOXp1AOKZ7Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzb3gUMleib2gMpVdH7tVCkR2nB0KatDHta8OPMUKhajANy8P7q
	IcYsxehulKRP91xJhmpDumT63sT9awV+y4H/w/Ley4gk/UysTD9hxFeJ
X-Gm-Gg: AZuq6aLgm8ajgLAlAu98BTG6ZqQqr8jqB7DVixBEx+R6tB71eeYrwScoT35nCn8qi+h
	j8NNnzmjQcJEVy6tN7dVhHyOsRj/4ss4Ft85+PGFUDPJ/mvrtU2rGrzvMtEA6AH5W5dQL4VE6wP
	mtcS5Qxsk09/ozlC+epDb9BKg2HoEDftOWcLawNen8+ObFyatnobAOn9EpSZPrr4auB6NyV8xU0
	AFZOY5Q0tidQlHe8KZ1lgD1TkMJeBqpvcCzBlgjNAM2guDTrrEjfjZo03eh4AR5z01Vj/3mSbux
	owIAV4Ju35t8yX/QCXtgY7Ut53OhOvTtuB6GPFzCYrwct7krYnKlySbSTtwS5w6XXFco/5k1t0h
	L7ByKJrX6LFVfHiEbCC/ae8LAA8iq6pyyhKK/DpRjr2NuPr8PsHX1NwJYe0zw1ufj+uUF1ilG4M
	Vmfy2dJvzTwZA6aG3s
X-Received: by 2002:a05:600c:1d1d:b0:477:9e0c:f59 with SMTP id 5b1f17b1804b1-48082891d58mr31641625e9.2.1769677874568;
        Thu, 29 Jan 2026 01:11:14 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:5792:2065:403:a80b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066be77b5sm175338875e9.2.2026.01.29.01.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 01:11:14 -0800 (PST)
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
Subject: [PATCH 7/9] arm64: dts: renesas: r9a08g046: Add pincontrol node
Date: Thu, 29 Jan 2026 09:10:58 +0000
Message-ID: <20260129091108.95277-8-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260129091108.95277-1-biju.das.jz@bp.renesas.com>
References: <20260129091108.95277-1-biju.das.jz@bp.renesas.com>
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
	TAGGED_FROM(0.00)[bounces-27584-lists,linux-renesas-soc=lfdr.de];
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
	DBL_PROHIBIT(0.00)[0.168.38.224:email,0.180.91.224:email];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,0.168.77.240:email]
X-Rspamd-Queue-Id: 463A4ADFF6
X-Rspamd-Action: no action

From: Biju Das <biju.das.jz@bp.renesas.com>

Add pincontrol node to RZ/G3L ("R9A08G046") SoC DTSI.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
index 231b118ecc62..c6b042ac9c36 100644
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


