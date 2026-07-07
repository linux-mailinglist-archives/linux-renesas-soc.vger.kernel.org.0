Return-Path: <linux-renesas-soc+bounces-34822-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lAnaAP4VTWpZuwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34822-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Jul 2026 17:06:38 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B1671D023
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Jul 2026 17:06:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=iGFhyLSr;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34822-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34822-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8530E30CB226
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Jul 2026 14:51:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE13E3749F0;
	Tue,  7 Jul 2026 14:51:46 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF2A6351C1E
	for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Jul 2026 14:51:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783435905; cv=none; b=I1hZjl1Dx+NkTNaxreOlNC2bTmCyqVnR6fPhmsdXwFFAWkbMxPPtaJ852C3aQT66dP0hO2p4TR1eGSLppo0AmRtJdlIxI5A8IVNS6gRL/Y6Y8NTUSqFcb0KufY6xsrzSyoYt0EqXhkOsfRPyNsA3SQ3DQggZ1GUTXEmwgo9Kc4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783435905; c=relaxed/simple;
	bh=jyzSsJfeTLInPlFKvtpG1kf+z+8k62GDWsQ8d3uU84c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q9V9MlaYp6PbCxGwk0dl8tcARd6zrBgey9B9TptlHkn0OLYr72Y4G8/y9Yki2LhTfIJTKF9l/IMJdP0OipHkCWKM/KScP2tLlV3E7VTXZIL6KcCURBA9cau6CUgSK77HXfR8rvORgAFVdwamaPrjrB1n4yKNqSfaw7CpOP2fgc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iGFhyLSr; arc=none smtp.client-ip=209.85.128.46
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-493c83474ddso37710795e9.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Jul 2026 07:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783435901; x=1784040701; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VNFZAwQbfAY/X4R2S4dzYzrJFeb4tyhIADKaKXHVALE=;
        b=iGFhyLSrLM1925LJU/XULa6aMMie9krMQ68+9nFWu8Dw8lrvCgNh3KvL4e9Sh4U/ca
         nsHmTau97q2SmBTsjJ0z15hGvC3rT4YL4GSk2n6XyBYsThuj1VP9LH++MIoi0hwpppBx
         oAlKwPj/CwtYNijNOzFQ4YUzkzQNp4C2Ja5x6Yp7Eix36FHxX30yzTjpojApaBvVjELs
         otGwD5fXfVKLFnZ9VnW5cH8EmArCjeVDBPx4iFH72MG0JoD25v843Nwm9he5owoFRB4N
         UR1YYU0qpHOY7nBGrz2CHPN7dtyES0CU5u/cqEHHVqKt330VINEMzB2/IdtBV8+7smE3
         9iBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783435901; x=1784040701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VNFZAwQbfAY/X4R2S4dzYzrJFeb4tyhIADKaKXHVALE=;
        b=Fl74+XbLsK+2jl9t4N93s/+3x3qid1JFMK+v9o2umO/jZ4mYoZXycbxhcX0FL2Zix3
         8YKkDdSrHu5dMTRRHIo2ssJHQgjUKjWGcj77nx+OsyXkmrCyI4J9YNGeIxk5uXWbabsr
         RDKAAU8P0tJ2sOoyqaLueY5AEc18589Auib1HgHo3furbEpVye+ZACA7ATqknp8yEbZ+
         2BjRH+lQ2YFd2Spc3JeiKbEwHaYMMDIS+K0dir9ARYEAj0Wp9SM5TvU/oiDH4bzD8paF
         oxTCoaHsMOLz4bFK70RQ0R70++CUi27Y0MBpF77jMf6whmG82lo0eS0trZ55ZtGHoiVZ
         RTUQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro0MDQpTfAZx+yvMkoeWflg5PPuPbwHU5z41RCk4p5fjVcWC5S86yjrJVyeifanMJMsmfr1CMbnTn6fh0kXAWDlFQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwlA1vs3xyK8TQRVFMuxEDqQbT5nY05O4oK0OK4k3QMAyZijQKH
	4ZmYHmcqnSqtCeCVteTmylMpgNXluyyk3SWoWBnvOscRkE1a2p4YuyMz
X-Gm-Gg: AfdE7clzKVD8cckpglk8+bJEPN8jnsUHlxOJt6VWIfwPbco8z4L0+zglt3w+yySGlyF
	Pv9gjm5NJn/uMJjMuQjbdLKmLb50C0+27m6ypnU9AI1MvyEanXXOn7pgqn9UEVwUzpOk8ECbcEB
	XR1++tTy2Xi4B2/8NQ3GhN3c7H42fTZD3YYYk1uCZ8amPJWR0tHFPYOrwoUTZF/LVfRLKEpJwFX
	IC00xIJAr1f4DpiJ2HgN1PFmro0XPGhmoiFopkJDnw3oQAmUNktZxjfW5YVIGX7AkjBBEHWRooK
	j1Cfqiyd++sUGx4kOWrDFSEov9n/QFaCSvumApvyqKe9sGwAvXWU1L9s+5ELIlAcb//eI43tKCv
	QU0vn2lJUBbqMITYU0WGb4U1eWM6hVYJoE61O9rVjNiGTlueQA6RValvwksA+PKVDB+9ARioIVl
	uq3BpoDxkeRMpFTFwoxezAoq41H8SL3hPiDrMe7q6UPbstk1pA
X-Received: by 2002:a05:600c:6096:b0:492:5bb6:6d4b with SMTP id 5b1f17b1804b1-493df0a0bdfmr67583005e9.34.1783435900503;
        Tue, 07 Jul 2026 07:51:40 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:a4ac:4e7f:194a:852e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0ec6e64sm105192695e9.0.2026.07.07.07.51.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 07:51:40 -0700 (PDT)
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
Subject: [PATCH 3/3] arm64: dts: renesas: r9a08g046l48-smarc: Enable USB2.0 function support
Date: Tue,  7 Jul 2026 15:51:32 +0100
Message-ID: <20260707145135.247565-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260707145135.247565-1-biju.das.jz@bp.renesas.com>
References: <20260707145135.247565-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34822-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	FORGED_SENDER(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:biju.das.jz@bp.renesas.com,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:biju.das.au@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:bijudasau@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,vger.kernel.org:from_smtp,renesas.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 58B1671D023

From: Biju Das <biju.das.jz@bp.renesas.com>

Enable the USB2.0 function controller on the RZ/G3L SMARC (r9a08g046l48)
board.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
index b189ae8e808d..a3c491778aba 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
@@ -97,6 +97,11 @@ &ehci1 {
 	status = "okay";
 };
 
+&hsusb0 {
+	dr_mode = "otg";
+	status = "okay";
+};
+
 &i2c2 {
 	pinctrl-0 = <&i2c2_pins>;
 	pinctrl-names = "default";
-- 
2.43.0


