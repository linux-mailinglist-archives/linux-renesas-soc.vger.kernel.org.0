Return-Path: <linux-renesas-soc+bounces-34928-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EngYJXBcT2q9fAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34928-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Jul 2026 10:31:44 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C76F72E4F4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Jul 2026 10:31:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=QJIhOsWN;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34928-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34928-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D141D30315CF
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Jul 2026 08:31:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C03F63F211A;
	Thu,  9 Jul 2026 08:31:17 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21DC23E8665
	for <linux-renesas-soc@vger.kernel.org>; Thu,  9 Jul 2026 08:31:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783585877; cv=none; b=tQHlXfhrs+8I/uzRjYbK7J62HZ3+pDWrRYJ6qFUmNxQtftIrzeAbzVLn7wFZR+7J1BfunsfLYz+e/rui1ycqJTB4FcvOZ+hnTAGGe6u3NPZKpf3iFE7ooUAB9p+fPswvmfgPm/ynJjGHe4UlIqwiZYWHDfqacakWmqk97l+SaS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783585877; c=relaxed/simple;
	bh=IZleYUi6PiorkGYkY8alOYue1tOL3isz2tFad7k8jAE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W5JmrGaL9HSHsThCf7YlJnWyazPI4GGPK2VeZvNqi/ejceVfkJkayyQoD8gOeD6H50aheeTXipI1O5QdqTvK3XMx98qa2Fk7inJhd+M2I+4+v8q/nsCPT9f+2CJLELzB2xM8tl9+A7Pi5MGe2m6UuC0C2W67lALdcOxAw6gU3WI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QJIhOsWN; arc=none smtp.client-ip=209.85.128.50
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-493d1e8aa46so12171725e9.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 09 Jul 2026 01:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783585874; x=1784190674; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AM1zEpcKvD6W7WPG9CZWunBD7IXZLxdUb+DuWtxzpK4=;
        b=QJIhOsWN0F+zaoQCqKbEXlFIdSYq2MJFthUBbuxWetkhaF5bShknRfZ0cwQdtNx8V4
         /0oOhI9S44cs/QiY/etOGa5pSG9hh3dzSJ6wgC/n7pqRajridJI4Kt6czKV3ElAJ/oAL
         cOD5dXzzdzrmJg90hw+hxOZwU030IQd5IM0ur4PHM4Cm5I/qOUI5v1tcZrSk+SazSLRV
         MT+5Ho9Uozs1REJ0mDP+bErSEBGPxerapu6032da/gblzduEaJkQVQkZflA6z9m44mut
         SBecp4vtWqdomasuk89MkE+5ND2Xcb4XX9saMDqoh8oPSVAOdrQmSMR56wQ3VjjC6ENi
         xlcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783585874; x=1784190674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AM1zEpcKvD6W7WPG9CZWunBD7IXZLxdUb+DuWtxzpK4=;
        b=g/H7MadpyUt7hjh25Cpb1/q3zWwdUUGEpk4ehS9LqGD5cyP1pXurQUc7PnmSkOKGo7
         eymiqZPY7oHXCMZ3nprBZI1D0yLBMNZ7WWkBS2D9r96G2DwmX4TS2kCIXOn7IQP1JYt/
         7iB4APFki1vtk7XOH0W0nVTJlW5vvQH+BkEiqyIjCilTNvQYuxrGDDxtnUXfbRoI1K0M
         5vpiIEcmiUpdvHgD1hIW5KxyLQoeDsLtXbuWxufK4W8XiodyjxrcDYAmLzXplcMYJwOr
         Vv0TWpfui7A2At9JlLuz60+OnWJTuljTzmPeAhj7Ay1k3YOTzueBM8wvEqRNAE09h8yB
         3vgg==
X-Forwarded-Encrypted: i=1; AHgh+Rpye36fsGlpAOY4NY9OirMYETF+33UJdwZQaaq79L6riAnocfBnD99UTgeHV1D/s3Ftw9/IZmqE439/I20p0WY5Jw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwLKeBpiYGMvSPJFfx4Na5s6gbgnJLqc5r+WnpMeE3XZtuR7AMm
	kWnY635/iAy0x2xCLQpCS/IgIYRmfnGZUzcZS1tJYN76gRDjD+ZoLU2bVDkv4RqL
X-Gm-Gg: AfdE7cmBqERfDTx2XjoVxwRwD1mJn+Tvm+j3E+697yuCYKvptLXmNhQMEBID+L1Tepx
	7kMphTTeHFsM1uRSKDQL+Ua0HnDMDp9BzgDdMtE5geNoVYyW9ayNK9cApdM6ggJP82lBrdhpiK8
	6xAwLjrGLcESETG4qI5aAJSfT/NfNL6yNA0wy83KTB0wxQJZI+29PWLGyMJsFHJZCBZjoQitdsQ
	KhKhvceTuMq43jKKpxEIz3ThdFlA9RMZPrYCGUCqlwYNvqo+RVwgHNaP9Qg6SmN3i/pNC34slRE
	P66BD1WufpC9lsaHAY2Bgsi8psP32mvh3PwbQDI7ltUNH+IY/pRmLs9ooaH8VLg1t/odLn54FVO
	xQYmJ3T+rbWmSDOLIGnCRkRIfgwjl0YBAjKctKiiKxP9G4W3EPGB84i5NaX9vV5PXWmfmtJIxvN
	f5UZf+iq41NXkxg3wmu7Ns
X-Received: by 2002:a05:600c:5308:b0:493:d0f7:69c3 with SMTP id 5b1f17b1804b1-493e68eefecmr55543765e9.33.1783585874216;
        Thu, 09 Jul 2026 01:31:14 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a702:d301:8fb6:1d85:3dc1:42ab])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d780csm50316543f8f.11.2026.07.09.01.31.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 01:31:14 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 5/9] dt-bindings: phy: renesas,usb2-phy: Document RZ/G3L PHY bindings
Date: Thu,  9 Jul 2026 09:30:58 +0100
Message-ID: <20260709083108.108370-6-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260709083108.108370-1-biju.das.jz@bp.renesas.com>
References: <20260709083108.108370-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34928-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:biju.das.jz@bp.renesas.com,m:neil.armstrong@linaro.org,m:yoshihiro.shimoda.uh@renesas.com,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:biju.das.au@gmail.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,m:bijudasau@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,glider.be,gmail.com];
	FREEMAIL_CC(0.00)[bp.renesas.com,linaro.org,renesas.com,lists.infradead.org,vger.kernel.org,gmail.com,oss.qualcomm.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,vger.kernel.org:from_smtp,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5C76F72E4F4

From: Biju Das <biju.das.jz@bp.renesas.com>

Add device tree binding support for the RZ/G3L (r9a08g046) USB2 PHY.
The RZ/G3L USB PHY is almost identical to the RZ/G3S USB PHY, the
difference being 2 OTG blocks on RZ/G3L compared to 1 on RZ/G3S.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3->v4:
 * Moved the patch for easy merging.
v2->v3:
 * No change
v1->v2:
 * Collected tag.
---
 Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
index 9740e5b335f9..d6b9d08ceec6 100644
--- a/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
@@ -16,6 +16,7 @@ properties:
           - enum:
               - renesas,usb2-phy-r8a77470  # RZ/G1C
               - renesas,usb2-phy-r9a08g045 # RZ/G3S
+              - renesas,usb2-phy-r9a08g046 # RZ/G3L
               - renesas,usb2-phy-r9a09g057 # RZ/V2H(P)
 
       - items:
@@ -132,6 +133,7 @@ allOf:
             enum:
               - renesas,usb2-phy-r9a09g057
               - renesas,usb2-phy-r9a08g045
+              - renesas,usb2-phy-r9a08g046
               - renesas,rzg2l-usb2-phy
     then:
       properties:
-- 
2.43.0


