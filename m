Return-Path: <linux-renesas-soc+bounces-27596-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YHjtL68ze2lJCQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27596-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 11:17:19 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C197AE796
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 11:17:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5EB45300DCE0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 10:17:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 368303815F0;
	Thu, 29 Jan 2026 10:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B5ytokqH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F235F340273
	for <linux-renesas-soc@vger.kernel.org>; Thu, 29 Jan 2026 10:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769681822; cv=none; b=U0RBO/qjDxLOHLmaXK+eZeKtDTJgU9z+HsSxDS4g422m4O872qJooDVsQ35saiHoOBiIUiziUDAUFt0cz6YNbkfyq1E8fIrt+B5w76d97Vhhhtoioa5uOeQd23DjesUI6M/XSLBpUojVFCTuAP8yIHQP3IoJHn8H3CE9lykEYRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769681822; c=relaxed/simple;
	bh=l53JAl1A5TRe2s7pqTepmBMNLndaNxM1i2f8fJ+CJTQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b3oMomYB3ctjdsu4TaQr2LTmbHBMPbUAvGeSWEmvSPC9mA1lFNTTSWKlTdKKVQPn6fvy7Rh4rVe9P04FEB6tRVBciS9cQ+dYML8pUWbZu2FgWXutirRaz3FYUfKugB2T1c/a1L8T/fR6AxN1pdQlKXHDUK51xZf40a+9iQER+Tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B5ytokqH; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4806fbc6bf3so8222655e9.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 29 Jan 2026 02:16:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769681816; x=1770286616; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kt7uEiXTlV6e7nA3ca7sq5Y8eWxdpRVOenYUuxl1aik=;
        b=B5ytokqHOXE6HNDPinSMT5WL3E00A3POWmFiXns1tIzGFYxou8yfE9ypera1dWGU3b
         2JrbvoN8mlm7LJWiJnOurKJA3zIkNv3KxpbiWZ4hJRFsszkyLG2o3M6G88b6oj5QGFPJ
         PruwM0jJF/mM9vHnN9+L2WccsWnqpxzKDtFKCnqsIFzlW7VIYdx6Jc2A2hvHt9JkBQMC
         D8GEn352w4QfOrADzU2Y99uCSlhapdz+2OTxKt8A5JnNVxPZrLYC6sXWnMTMO13n/MNp
         Z8DBx5aSC4FYjiKj4cJESGfpkii1fhiw8bTbfb9lTScPGLhQVNsPs34g1v+iQRa34UAZ
         MDNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769681816; x=1770286616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Kt7uEiXTlV6e7nA3ca7sq5Y8eWxdpRVOenYUuxl1aik=;
        b=rhzHf3uOt63RxI+CTk7hIkX4DlIU+8fwX7KbVmVTEVAnozyuxu853Kh37ERSj44dx0
         DdE7ROoo3U9dcRNbQXESXZgo0EIYH+oNDh666dF9F3tnEABbjBjWsogtkxrLzi9nPB+n
         zuSQk2Y9im4FkIKlnwlzJ03S4lXbQC299x5Ckv3kc3nP01eFZqwPirKdigFgQCuErCLV
         OygFP4DzpNTMiT5nD03ZvQtenohO47L65iA5FHSDjqyd4fY6VzUVwEtkifyD3hFDojjE
         w2kPx1HRkVW9LwyXJoOO+QNQz6pC94i6cDjG/ruiPQPinJKfMBiCgc3axNA4xGj0DK9h
         WVqw==
X-Gm-Message-State: AOJu0YygFKNOSdrDifJMB+6qnMq5jJ4Pq4jF90d5WE3Lctns26bkNYiD
	W8Va5dF6TA/loIOI/P0J4KiGrswa8Ou2XWhXsDwfADWM+wmEDDPWVLpa
X-Gm-Gg: AZuq6aLiCoEGpoQlDh2qbl9pv9+IbIEgCUMikvkbpgbogaw59aT1Nmv1eYm/YRu9mFW
	nXoGPv/uoDcL+iw/GYcHPTuK5ZNd6Q20lZhpWpMf1TXyDvIS4IoqwhmBMH5tvZQELHu7Y4s0bqN
	BjvyAk67CJqyD/TGsOEdlu2oyQmpnhjcsePzEyDaXkLF64udg/m1HnARdQxQPULwVcNowjf8SnE
	DGp3kn6SBW69GQ/xDD/MZDHuyccQKM3eUFpq1EqtmLTil0L7Dep0dLEwFCyRlOmynRXtWgAYHV3
	Ula4fMEt3+ttZP2oZB4+UR3XOjUhN3A6I1i9s8a8ezrHXIt7QgKcl+YOeZZ3Vdk8dIiEg1QPiuX
	4XQ26ScLQbQkVAcql70UblhNoU7KHnjXFLhBsnRIqOECvKtCYDwV8ZG6z2/B+lQtF8Cp/uf9zq1
	9zjrnMSvXvMu9he80I
X-Received: by 2002:a05:600c:8b24:b0:47e:e807:a042 with SMTP id 5b1f17b1804b1-48069c1c009mr101678685e9.15.1769681815992;
        Thu, 29 Jan 2026 02:16:55 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:5792:2065:403:a80b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066be77b5sm178642065e9.2.2026.01.29.02.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 02:16:55 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: biju.das.au@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH RESEND 8/9] arm64: dts: renesas: r9a08g046l48-smarc: Add SCIF0 pincontrol
Date: Thu, 29 Jan 2026 10:16:43 +0000
Message-ID: <faaddb4d8bce3aacda6cdf032c677d8380f71b66.1769681553.git.biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1769681553.git.biju.das.jz@bp.renesas.com>
References: <cover.1769681553.git.biju.das.jz@bp.renesas.com>
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27596-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,glider.be,kernel.org,gmail.com,baylibre.com];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 6C197AE796
X-Rspamd-Action: no action

From: Biju Das <biju.das.jz@bp.renesas.com>

Add device node for SCIF0 pincontrol.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
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


