Return-Path: <linux-renesas-soc+bounces-33928-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id J8cFM9IYLGpdLQQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33928-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 16:33:54 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6253067A36E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 16:33:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Zh70tzCE;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33928-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33928-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9E02431D72D2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 14:31:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 053C338AC91;
	Fri, 12 Jun 2026 14:30:57 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BFDF389DEC
	for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jun 2026 14:30:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781274656; cv=none; b=tB3JjKCbdgsW0g7zjx6UWf55cI3MgPeKS3i/RASfpJ+EBfQoDijlUL5ITFFoCSd2U31sWPAw4xBotyqNGwEantreH89iJdNvXMAoTjVQ5EasGfoJZGssyG7TNy2tY1a0O681blczh8/6Baaq4aQmeLSMJgRNQoFFvwblG/0F1Yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781274656; c=relaxed/simple;
	bh=oT5/vREXYCSMxDUooYQ3Uq+Ce+jvgcghDcj49uYzYFw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KEv+LkSW+qyQVbso1ZC1UXq6XZe7ATsoOYTmcPqVFQZzrJW7M8Q7UJmjsAj3vaQbRSio+emuSLiQr9eRekUtHGjGCDX7PHLq3MlowMAkn6OfNfLmoeX0dTEuDauFgEnI/Rji+lFsSciyc5pgUlnIpouRgHNRtFzyQDk5qsrqGbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zh70tzCE; arc=none smtp.client-ip=209.85.128.53
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490b1bbcf3aso8590465e9.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jun 2026 07:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781274654; x=1781879454; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cZzbdchxZEz6YjPim6DoD1zHzuSoHlBEf2xfHYElE2U=;
        b=Zh70tzCEeRWQXuPriEwj1GRhGJ5NW/t8vN5b3um+O4+atOEe2RMTGBwN8GaDuQSqY7
         BNEEItwmQxtfsxPBxEfMvy9CRiJPS8a0CqUlF09uqq+JBd3f3/Kwigwx6odWeFlPC2ju
         hd0ScVuIPzJ3nszXOM9DrXH37O3Ai9R9xzIvoBu4jiXnaAJLTBkGDzHJHzU+dPqb/tXE
         ECrwoZXcw6RmeCSg3bN952dYaZjxVTPMhOXm1wTH/5SxT5an12QhYe4cduTlHo8DNzGs
         2LV/ZrNLvLiTlxOrmbguYNcbMzCSFq6Q3xNoT0mhPYGo/e6kaK0W22Hvv6gfhOrz7hjb
         HijQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781274654; x=1781879454;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cZzbdchxZEz6YjPim6DoD1zHzuSoHlBEf2xfHYElE2U=;
        b=dk5uxm1wDF9V4RoX+Z/q5p9tXG2M7Ave1z+bE5+4i7IpOY3HhMzJnLjCZMQQPDvukw
         FfKdqZDoRxcAHh5/Mcbw9fMCZ9oSZCUMnhOuNu2tMRLsWdX9Hd18OZiUJ10xFNAV0IQW
         69RgsFhf+ohiMIcf7MAHEOWjjprFoHdYQpU/M4E1vqDJMSF457KLMqgihCnIkBObHnCH
         L5DZy4w3GnyfMDcb+QB9DbxVf8rE1gzBZU7U7vEZYwMRqRiyjS2Lxfq1xjJFbr0zdSAE
         Ibu5A9/CfGylJEUQrM8JrPvUkWtsM6iRNaPAN7hix4v7l9uSYXdS/E4cEIuMuGuAJoAR
         k6Rg==
X-Forwarded-Encrypted: i=1; AFNElJ/Bs44pds6vn74Pdh7XaGqxPmzJDv2VlDzTC9Mpr7iWQ2YrjoYtuePhKp/3xBGnB3R+odfXFJVj8yPWJpGvobwx8A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyY2e13jaAvVwzCBKTvWtw4+mYDQQoSGa9+ZOwM5RG01+bEZckX
	pnlf0h0TD8U/gk58vu3sjAhmlnfGwcZm9c3OiFwdOVvC5/AM1kxCZDxR
X-Gm-Gg: Acq92OGY0sSmRaTYLZv63UaiRWMqkpI2IjCS0i1fG+WPe/yYRTv9sE3DtiMKNTNKDtd
	p225vQxSIckFgEM8koONF1Xk0XrILgoyBlC5JLv5X2qD+s+yhHgbWhQCTb3FRtKECkeBaLTvghu
	DFi8ZSV04VyLl1WpFBcMXI5SrnebfuWthGmJtyScnpeZZAauojNyiunT9lnvTMUASeYLGsJpGB/
	CMoPDGwfP63SDtG6kV5TmRotKbPMZKzG1Z6iVzO/k+2RsfPpcboUM9Rzi6OQWv1INRg2V5eyFmC
	pd7ofUtXfy3ND5TSiq0qPgRP5IH5TMwZdOYLwcdR+L10o1CKqCld7IieSQhniohFiXDYYxNrJRP
	mTech/vbd2g7lcr196T/BXJBo4LxCD7j2/jMsDNBi/B2TvIu9p6vA8CaI0NTr+LQlN6yNLYsTUe
	AEml4Ux83QeZL5apEXCyLW1z0QgJge6VQ/uHuqC48BwTPEvUr/
X-Received: by 2002:a05:600c:5942:b0:490:47e3:929a with SMTP id 5b1f17b1804b1-490ec4cd289mr30178815e9.6.1781274653838;
        Fri, 12 Jun 2026 07:30:53 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:c72c:50c4:8b28:9a3a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2c3782sm5850016f8f.25.2026.06.12.07.30.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 07:30:53 -0700 (PDT)
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
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 02/11] dt-bindings: phy: renesas,usb2-phy: Document RZ/G3L PHY bindings
Date: Fri, 12 Jun 2026 15:30:30 +0100
Message-ID: <20260612143048.317907-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260612143048.317907-1-biju.das.jz@bp.renesas.com>
References: <20260612143048.317907-1-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33928-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:biju.das.jz@bp.renesas.com,m:neil.armstrong@linaro.org,m:yoshihiro.shimoda.uh@renesas.com,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:biju.das.au@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,m:bijudasau@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,glider.be,gmail.com];
	FREEMAIL_CC(0.00)[bp.renesas.com,linaro.org,renesas.com,lists.infradead.org,vger.kernel.org,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,renesas.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6253067A36E

From: Biju Das <biju.das.jz@bp.renesas.com>

Add device tree binding support for the RZ/G3L (r9a08g046) USB2 PHY.
The RZ/G3L USB PHY is almost identical to the RZ/G3S USB PHY, the
difference being 2 OTG blocks on RZ/G3L compared to 1 on RZ/G3S.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
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


