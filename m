Return-Path: <linux-renesas-soc+bounces-27838-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yJBOIQf0gWkMNAMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27838-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Feb 2026 14:11:35 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 33128D9BA3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Feb 2026 14:11:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2E006303484A
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Feb 2026 13:11:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFD2C352F95;
	Tue,  3 Feb 2026 13:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q5NfeESL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 786FD350D57
	for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Feb 2026 13:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770124261; cv=none; b=sk9tic6SHsXCOmtoFjEJuYZilZhRb/6nanHNK7eexDXwFO7PUJpcR671rW0/Neb2a8eTwWpKwMoyYAPjhwojgagIpF/SCa0yBnhnnhzxGiw4FEfsS1KtEkfUcb6Ys6LpM+eOxR++y4lHbD78jIZ7SBdPEBi1Ew9l/KffWXVWJzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770124261; c=relaxed/simple;
	bh=nyMSbBbhX6V3L6sQl/4QwXvijPThkTN1Z7PtSHz0VjE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r7ufu8Yt/GPZH6yKSDKSlmwplFmzFh7gvJPx1O6VHJs6WzeKd2V0inBDtuXSGu+nvOUFPzkitsZPk0AJKjRyOTAC0UnTlwyYtuhTZWXRbvP+0vwD0iyDovKbrkqIUL//V/M5QdwMGqVUeP3QcwKmY1RlyrPYJlOHzT+Y6Be49YE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q5NfeESL; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-47fedb7c68dso57359765e9.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 Feb 2026 05:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770124257; x=1770729057; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rvuu97ml4n4z/jXogleYwlLZ5Qu5QPKyfFgQiwnbgHo=;
        b=Q5NfeESLrwUOuKo5Sae7itolH8VTAk34wroJMT5qfWQOwxpd9Q1xF/VjRs9luWnu6B
         SAitJq4GraRiEWvkT3VbQqPWd8Ss3vPiv0PS0xSn6i5JjECFIkIgPMA1lZouynfngyQu
         awEK4nxI4mo91XyCTqQ86H+Rsq7bX+uXNOit1eFIMHTqQa6BDsPNkSB3b82bhDnc7KfJ
         chcCoGlihxHorIZZYhpLf4qjzo45nWZTfdLTGDmpaC7johRb2LCgoAZyPzxV1jGaP+bV
         YTm14THHgNLqCH7gi8Vsoa98obXLAdHjktnJcYYn0XnyZcTlvkb8ebqVUuAWSjM4f4na
         UO+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770124258; x=1770729058;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Rvuu97ml4n4z/jXogleYwlLZ5Qu5QPKyfFgQiwnbgHo=;
        b=IIsdhCsrzFFMZEcD5LwX6gOysD8O4gGjfGDn0D5tvTbCz2T79u3k8mF6YyEOwCkKkn
         +XmJVKpf4Mewdvpv1S/I3Uac38UeOE3CgEKzxF1u0YXpc5RKX19+vJ9LdE+OQoJ+B4l2
         g65UPY+426/w8+lQww1e1KThDD/s++Ycg2BS3dYe0FSSbdKRkdS/zPo5kb9JWC0n6w1g
         Qb8SzJRfF6InC0Cs15qVC8CM27bqY6od/mJBl+EZsFsOuNAAwm8MKbjbJiEirD6w9Q1H
         S6GWquh8boj7kdGUfOAPetD43OMcKuJy87uVFbMWXXrKsqNK2QCy7nbHrhvohhOzDUsK
         ETSw==
X-Forwarded-Encrypted: i=1; AJvYcCVJY219nMeyAMchOg9IXh+I986GpSQ05JMVoraYGKc91F5KeOgkgz88eCEWDCaEBml35P8yi/vP1TcEYzLdw5UMRQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyewSg3swVCacJ102qBOuL2mvihPVRS0Q2vZbFDal1v4eUIJO0d
	/nNXIMpIIvdpq3hh47/jBCVvi2Sr6Ru099auCz4PuD0iosC7cyFz4xe/
X-Gm-Gg: AZuq6aJOahefb/RI2rtkmnHZ4MXCoQUbAeV/4jsTnCbp/Ho0ARLQfKHxKj7EKTKN1R7
	u17BAl3ejsB6CpHorWe7w5bSEXEj70jqALxq53Gb+AkQ2ENVcmbKx3lZWjqOZ9QMz1bTVG51C+r
	E8h5Xjr+czTGK+ALTy3Qenm404pLTB2uFUEnndofB9bazhq/+fxMxfmmqT2Aw8i1DZmlhQdEnMo
	aEHKh3W8WEeXaA+sYzf2gr8/cSEqB9Cgap20ThyjqiHRCPpXA1FanpzDH0XSfiiajII9QYLxSNr
	qzifCSYymAdCRkQRMbZTnKh0Bzkr/gw6t3a3aK3fEewl97erLJ3Q5DJ2/29cfQLtTKelSALGIP6
	c/gyBZYd4tKfO3zFT0ul5Ye23hum4YAeYUTHkPu5eUIRvXyeSfumR8+e8xViEIDhwAc07OqxpNi
	1xitw/v81w9BKM299uJA==
X-Received: by 2002:a05:600c:19d2:b0:477:9a28:b09a with SMTP id 5b1f17b1804b1-482db21399emr175529685e9.0.1770124257505;
        Tue, 03 Feb 2026 05:10:57 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:9cd9:f748:166d:55fc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4830512ddd0sm63662185e9.9.2026.02.03.05.10.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 05:10:57 -0800 (PST)
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
Subject: [PATCH v2 09/10] arm64: dts: renesas: r9a08g046l48-smarc: Add SCIF0 pincontrol
Date: Tue,  3 Feb 2026 13:10:32 +0000
Message-ID: <20260203131048.421708-10-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27838-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,renesas.com:email,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 33128D9BA3
X-Rspamd-Action: no action

From: Biju Das <biju.das.jz@bp.renesas.com>

Add device node for SCIF0 pincontrol.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * No change
---
 arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
index 86db86335d5e..2f918830b8f1 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
@@ -35,3 +35,15 @@ &keys {
 	/delete-node/ key-2;
 	/delete-node/ key-3;
 };
+
+&pinctrl {
+	scif0_pins: scif0 {
+		pins = "SCIF_TXD", "SCIF_RXD";
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


