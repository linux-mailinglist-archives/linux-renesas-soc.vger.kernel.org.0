Return-Path: <linux-renesas-soc+bounces-30576-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CB1qFjJZymn27gUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30576-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 13:06:26 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E6BCA359EB3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 13:06:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B7E3E302DE77
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 11:00:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5D873C198D;
	Mon, 30 Mar 2026 11:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F0kmO/qh"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3138C2C08A2
	for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Mar 2026 11:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774868420; cv=none; b=Ra+pOEvvoOrNIwb+LUegnvw0Q7Z5EJcRX19cfvshnSWu5RBy/rv9Ikh87pHkQknbo8YflMGEhWgJm2ewSoCx9OO011NRCYHN5WFvptpXG6NOcsc7lOr3xNET6wf1IJH5wVkTptATi70H461IYAH0F1c4upmJznAv1yp9SIfwtrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774868420; c=relaxed/simple;
	bh=lpLb4HjSJFrUnTI8yCQ3LK4PAXTyG5T4IYB5jRLZJ+o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WA+daT+5v7RbbNL1b/Lo2P/jubuNCx1BEk/Ur+1LabD5VgxLUGV1xc56RmGEPT07TZbwJbJCvWaHlc3rgS34nwQg9BobXdcxkP9rYHi2vt+tO3NI2YjY9g23dCZzkpOjYaJe9tuFlirkQZE2AFSxPaN99SOZ6m+ECqfZ8sydp0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F0kmO/qh; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso36809475e9.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Mar 2026 04:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774868416; x=1775473216; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AMDzjZ30wHK3T8UVTh8udjeVLznnRZwGJY21C+J7AXs=;
        b=F0kmO/qhD+Pw6mZ9xe4yy/RSuXeK6tHNn5JXaCZdcJdosZe85IW0IrDXnnrT8tJDeI
         yzlG83317avEQg3e8K1q0E9M/AfSKy2X94Hznyh8C6tQ3m25lIrsoU3EIlIwmMWqSHO9
         9EcX1mwDJhzFXvFV7VePSw/WP4rl0ZxTV+Muy1qR72M5m0sgPaSKkgpBwpXR1ypMzhav
         Of7ISzCFsrxuel/FCGhYcmiZH7+CMMfu2/kU8+CxawP0cjenN3GurArrZnn9auha+Dgm
         cGmcKa6RKgGJD46DHC/9Lfbrt4ZSOEHn0Nu9nMr2bObKNdg3A9AaYdSTigfxlbzWcutl
         XiEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774868416; x=1775473216;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AMDzjZ30wHK3T8UVTh8udjeVLznnRZwGJY21C+J7AXs=;
        b=nWLTfM9u3zplnf18mG85lsBcQi8gQAdbdk85XyCjtKrndLGkQhwfL7SnDzpBNefCtl
         u5juh0CP0cA+9IiFFDoMcQXt4qBvEqsF99lsAkqYXf18t2+WUbwNKmDRqMiBIc4A7Ubl
         SQz6gV2chiDf7jcmokjfxhCxpvcEmouKPGlfS382g9k6yVUaMiysfPNy6L1T/54OsH7Q
         hnQpQVhn1fvTXje6NyLCbsPuDpx8ZxZQbFV9MZKXIan/aK/Nt/eHa+2C7nOfZutJGAvm
         mbuvHNUx+xoyxTa/Z5GJw3YSYLLNOs16GYIcRL5OR3JAdzsFlfP2PjoJv/bZQKXtaIFR
         uSSg==
X-Forwarded-Encrypted: i=1; AJvYcCV6dJwW2Fyt8ltkktdhI9YqCEnaPpdmGayTotKtukCVCNjLrdqEfsaJmkaPw0b4EQKvGt6NUxrK9dpoR4ZKIWqV+g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxWVX3cVJwXkEazBnqIf7JhIhO7Z1nfbk58JRSD7JEN6xaydu4r
	+I0QbcYgVlyavWeX/+j7waV7M1zbfD1cVkDyVjltBOj9gCafqvB+rDj6
X-Gm-Gg: ATEYQzwBgty4W2v97Hb9JrozaEJLTXR/UI5O1ZeskVeCaKHmJELhy+znfXo1ffUurH7
	xo1aVGdR8bhhw45nySVsJsLqV10XLVlv7w7zFP5p8b/eTXp06t4BuodvBs/6ePeOSagpOGJOYsw
	UNAZluWodzMXrwEZqZWoxiU9UYy8y/QIy+f84ew8MatETXZ++6qW1mJ1YXLMEoMzOEkX4He3qe6
	y5N2g72nECksuLlHw6zNhzFizT8SFv9/Vv/Nk/JRonJ1nX5TOc+TeXf4Z7TUpxWK6neJWn+BILb
	tAJNsUrH8Mm21QrrYtkPvRfz+21trb+a03ZP+TzON1I4BzobU2pCvP75VLh9/X3BgFhydsPW+1f
	wSNBHrQkq5a+lbj9XBwuCOZVF+9rx2zcIPmhYapwVVdUqtoMGzhpCP7iLjy40Gb8HyXshR+vCZM
	jYeqWQvs3i53saEBzUA1SHzZL40AUChw==
X-Received: by 2002:a05:600c:8b70:b0:47e:e952:86c9 with SMTP id 5b1f17b1804b1-48727d317f6mr206040635e9.0.1774868415295;
        Mon, 30 Mar 2026 04:00:15 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a758:8a01:e60:2c8a:54bb:d692])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722d236a9sm477557175e9.11.2026.03.30.04.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 04:00:14 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH] media: dt-bindings: media: renesas,fcp: Document RZ/G3L FCPVD IP
Date: Mon, 30 Mar 2026 12:00:10 +0100
Message-ID: <20260330110012.131273-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30576-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[ideasonboard.com,kernel.org,glider.be,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: E6BCA359EB3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

The FCPVD block on the RZ/G3L SoC is identical to the one found on the
RZ/G2L SoC. Document RZ/G3L FCPVD IP.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 Documentation/devicetree/bindings/media/renesas,fcp.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/renesas,fcp.yaml b/Documentation/devicetree/bindings/media/renesas,fcp.yaml
index b5eff6fec8a9..86b176a634e1 100644
--- a/Documentation/devicetree/bindings/media/renesas,fcp.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,fcp.yaml
@@ -30,6 +30,7 @@ properties:
               - renesas,r9a07g043u-fcpvd # RZ/G2UL
               - renesas,r9a07g044-fcpvd # RZ/G2{L,LC}
               - renesas,r9a07g054-fcpvd # RZ/V2L
+              - renesas,r9a08g046-fcpvd # RZ/G3L
               - renesas,r9a09g056-fcpvd # RZ/V2N
               - renesas,r9a09g057-fcpvd # RZ/V2H(P)
           - const: renesas,fcpv         # Generic FCP for VSP fallback
@@ -77,6 +78,7 @@ allOf:
               - renesas,r9a07g043u-fcpvd
               - renesas,r9a07g044-fcpvd
               - renesas,r9a07g054-fcpvd
+              - renesas,r9a08g046-fcpvd
               - renesas,r9a09g056-fcpvd
               - renesas,r9a09g057-fcpvd
     then:
-- 
2.43.0


