Return-Path: <linux-renesas-soc+bounces-10696-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B429D9429
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Nov 2024 10:22:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B5C5B282EE7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Nov 2024 09:22:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 283131CF7AF;
	Tue, 26 Nov 2024 09:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="k2w87Jjk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3849319258B
	for <linux-renesas-soc@vger.kernel.org>; Tue, 26 Nov 2024 09:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732612879; cv=none; b=Bo81yQy5mHzlu5kCSQ9BBeO2OFo0KanCHYppSPlrtGlAltqgXPQt7BxDnju2WUfcSqZvCn+m6LkCk1BcEWbs1hOtxaYRBTWCw/q7NzNiArvmRX/I++j6ErH5h8dDezYwZxHUBvQx1zBkhZUmjhebj+EwLTA08Rv3Y6RoARZp4FU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732612879; c=relaxed/simple;
	bh=peR4Vif7woHWK7GGXYa577M+2RIwJeK0uX7OsLiQUiU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=THtsa1FM3ORkZ1W6Bk17zQYDy6CLutr0Ds9FLXIDJqMknmYn+966pGCCrrd9VYbK2d/HqDNsyYr3bbkW4/d2wVKtV36DaHUyuLscV1cBfeN6ZApzZqxr68BYkosaw/DnHiuBUysMw9X+WE9iEMketiAWUwEG/MSgOHkpB+L2ndI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=k2w87Jjk; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-434a2f3bae4so10527215e9.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 26 Nov 2024 01:21:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1732612876; x=1733217676; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sn4qpT/iGLCOuVRl/HhbV74eVKZi/FzZDWa4nL4zSFw=;
        b=k2w87JjkHiabvDLC4jaRhmjbfFPncA2OiY4Gaxwqmhc5ne188YaKHCRXNjLeianRqW
         1493NnWQGtdSNN7Axs8Q3bg5IWUWBQcQm4koKNyZAfBQK5lP9tnG2IWpSf8ULwHhQK2p
         x+3wNDSM2BDkbdFDIqnl1mGB2g7zjbqy6FGGotYxIAHz90d/iw9dWV1N4U8w0wm+hvbt
         PrhPOrvOevVl+8ZO9I6tY6+yZDQ7vippzhKOM1YmjuuqY4X2HfkZ+rGlW2KcMSPbtR0Z
         q/iPzepPY3vNz1N5Ec4far7nRrhIgx3o5mpIdhRuY2o0EFGRlTT1+oGZwsyN6rN+GIlL
         aBhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732612876; x=1733217676;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sn4qpT/iGLCOuVRl/HhbV74eVKZi/FzZDWa4nL4zSFw=;
        b=YFqjwqtXQCQyMRn7D4lsqrYyEt7QxeL3rR5LYdDZMdfAH6TJmh66k8lWc71GTUza6k
         Hg//2Ktfndn6ICBRs0Tj8jDT5fafp612XdBTLz0Y6WdIuVi3SIgtUZRd1XaHpWRas4Nf
         eJGt8EGLAykd8r8X97wlWPj8n8qF2xYwJ0dusJRXQaU/f7tI/Su62tauS7+Jbc3b5M3J
         x4I4u/pPtwFXwAEYSYO57dqOWVQwemjKdabYtm6IZv5HGtM3v1hag0Xyzv1pqO40Bhsw
         NhR+G0QAY+Id0ZL1ZpFTi7Nf2jMTm29esGIeJW15lAbIJQDl/x9BIp3bAE/xS3kxMNvW
         ndCQ==
X-Forwarded-Encrypted: i=1; AJvYcCV58PeWTd9ndFnrGYa3AqgP2XwaDW70L+DhmOIQW3WlfhZhj/nt+1ghldaumwMIbhy3wslBh7Ni1pQ039I5VGxsNg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwteflyR5ECm+qgISxL7Tc6TAAoFOxiWfJNcU1XJFac7i3s7bCv
	0RnouVnQuOELDDu6P4GALEmksSLsj8TD2NlGoSGH6csm1DHtgz5WHNgGGJaVWoo=
X-Gm-Gg: ASbGncuJSNLH5aqC2qaRghnBbTHArO9gkghIXRd0NrGmGjNcvtF+6H2fsvBlwSl1wwA
	JrjhRiJBqfFbWukor+UPDBpSXUoSJLfPmjEnxLs9EbNeKDij2yb9hEqnDQ/7dhwmsCIGCB5Ydin
	EKWDn75nqJy1qjYKHOtMZ0RHZZbi6l34wytIo4/KK3PvxClUm2A2ZVOZSc4fi1iMg043eKzaoA1
	bcPwabXUe/HgiVxM3zGdoLCkmWawVW6MM6+fqOXrwLJA/HooyCSGyYto9cHdDFu5bIJpj/CpQ7X
	gGQ=
X-Google-Smtp-Source: AGHT+IEownUh3zO6s9pCDV0Clvw+JlHntDQwx/j8qHfP92J8/y9dWvLESVOAtn+7QOc0lvgJXmcboQ==
X-Received: by 2002:a5d:5f4b:0:b0:382:1831:f7db with SMTP id ffacd0b85a97d-38260b59bc9mr13021685f8f.19.1732612875617;
        Tue, 26 Nov 2024 01:21:15 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fbc3a47sm13027694f8f.73.2024.11.26.01.21.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 01:21:15 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: vkoul@kernel.org,
	kishon@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	gregkh@linuxfoundation.org,
	yoshihiro.shimoda.uh@renesas.com,
	christophe.jaillet@wanadoo.fr
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-usb@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 06/15] dt-bindings: usb: renesas,usbhs: Document RZ/G3S SoC
Date: Tue, 26 Nov 2024 11:20:41 +0200
Message-Id: <20241126092050.1825607-7-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241126092050.1825607-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241126092050.1825607-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The USBHS IP block on RZ/G3S SoC is identitcal to the one found on the
RZ/G2L device. Document the RZ/G3S USBHS IP block.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- this was patch 09/16 in v1
- collected tags

 Documentation/devicetree/bindings/usb/renesas,usbhs.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml b/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml
index b23ef29bf794..980f325341d4 100644
--- a/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml
+++ b/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml
@@ -26,6 +26,7 @@ properties:
               - renesas,usbhs-r9a07g043 # RZ/G2UL and RZ/Five
               - renesas,usbhs-r9a07g044 # RZ/G2{L,LC}
               - renesas,usbhs-r9a07g054 # RZ/V2L
+              - renesas,usbhs-r9a08g045 # RZ/G3S
           - const: renesas,rzg2l-usbhs
 
       - items:
@@ -130,6 +131,7 @@ allOf:
               - renesas,usbhs-r9a07g043
               - renesas,usbhs-r9a07g044
               - renesas,usbhs-r9a07g054
+              - renesas,usbhs-r9a08g045
     then:
       properties:
         interrupts:
-- 
2.39.2


