Return-Path: <linux-renesas-soc+bounces-10697-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56CDB9D9430
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Nov 2024 10:22:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1B55A284944
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Nov 2024 09:22:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 691AA1D3629;
	Tue, 26 Nov 2024 09:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="pR77m9w4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B29C91D0E26
	for <linux-renesas-soc@vger.kernel.org>; Tue, 26 Nov 2024 09:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732612881; cv=none; b=Ph4eswHubxloPATDc9stPh2QmiyBXp0qIVGAoyzSJjo+GYJ977HsrC+xH+Z95b18ulIs8i3bBV0Q9+Yiz8W3Fm3VavJ9itf1CSkYiYvD4kmeDwRGi8KPzjKk2wyb3mv0hX5bPqZABqYoolQoVMuedqHt66DUiylM+JVU3YgKCGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732612881; c=relaxed/simple;
	bh=lMDTraku/x7/L+HfQFFu+VuQD5cryMGir72e5kDEJHE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DPAPe4FyTNg4chwoOFovspInQIplsAM66MH4yNRWYNBog4UWbY8HiDvGQIsWxXTEcD6U7sJPfptdMbxm9eT/Bs6sAHFT/qQR69BGB4j2oAIr1Z8gwYKopZy0nzPYY7GO+1dMNbezXlA6ucPqwuF3n3AvZ9+eQAzLxanoJH4geB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=pR77m9w4; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-37ed3bd6114so3181745f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 26 Nov 2024 01:21:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1732612877; x=1733217677; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DWc+F6Re5lYpUThTPl2Jyvuy/tQl0uxdBQ2YGVSL9kM=;
        b=pR77m9w406KSH80pqt+Rw6/mp3tHCZZNEafG65Xyl92uhWFAujhH0fhEOiyG0O8qBR
         fT3sNtG/pMXSSjkZ6jgF+4c4CBVtxY+RTCfuK8trH5gSbwEIapgP4HYa41DWoqBNd3Vb
         BiDdVc/p57SwlGi1JLopl9iZ11ITRfbsPSouF2xqkz4ZvXh/0ei+4SWY78vK/KPdscWZ
         jqaCYZBmt8X9fUgO3BJvEhILEY2b0ucpVV9iaCvXa0vnIdDZFyzvYU9kEilMvD/cypRl
         WQQnJl32wXtcJb+pn9far95lOTpZ3LrTNx689T2PDlzchg5d6hnOo1vFDhsjx9IQA4S/
         nvAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732612877; x=1733217677;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DWc+F6Re5lYpUThTPl2Jyvuy/tQl0uxdBQ2YGVSL9kM=;
        b=aqkFSNkMFCL0iM0K2A6SLTPBBl8rl5OovEN5M22wG7p/DYAiZJ3CysgrTuGwpNEBUd
         bpju0s2m9kocn0idXdQaT5++OjewxwCluOod4aUyhJYAHd5Fns8wzbgWiigtq2MQWRDl
         XZ389g/yCoq99Kjoc5Q4FS9Ugw2TTcu1zoRcloZrVFXXgn6WNGGzTouepz4dXNQoQ8Lu
         ziOK8d9jnUfsYVcEdTnkoIJd9PpW8mIzgt6dmZdCVW1nqI17zuk4CKSmp45MGNQRWocD
         PoitiUUJ0jMlcdf+6Pc3WvH0JIPmNHY3SYfVOMO4I+QsVKKj+Hk9mNtol87S4Y0xg+0u
         HF6g==
X-Forwarded-Encrypted: i=1; AJvYcCUA0IVIln8zQU+HKRknE5Js7RnrgVK0HJrdPT3PZvHBhVqyyCGDDPQVeXXT7kYfDqB/3cnBOH7Lukn+2UnlAGvFXA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzLqagzr5TMeJH9m+7TEsfoKTA3hJ1AE8TJpN45nR9G7Yd7V31U
	lk2D38SXhUzV3qML60LckgAoIj//uy8TmNsB2jO4h7NJB6Evbx0yF8XTUsUJ774=
X-Gm-Gg: ASbGncuZChDfR0R7lfs/dhbEVZ/KwgTx3Ucr0EGRmTKOXwXw62jmZNk4UkztIoXudt8
	fYodp0mhIQVWEm6tsik7nSDJZWWC5eoHvnXGT7fwD400++UvpzDQJrdTtOF6XIct3GeoykeNvnh
	YIisbRW4hNhaic2pLmC9Bgtll1mmklzUiL829wxYK8gVfS0r+hYsept9i5O1fDRM4iuSY6iDbT2
	r3XmplcIXDUuu7de2FMw/emX6uFfoDu7eUq/c1cwcH1BzoU9hMff2nLgZgy1V1anlRPbLmVMVcm
	q8c=
X-Google-Smtp-Source: AGHT+IG3dGq/ZJlhJq/NurIWM/G3VWbjsNdFTR8iP7hMyFJIs0S9/bgfBkT4zkY71Su/dQBJNJTAFQ==
X-Received: by 2002:a5d:6da4:0:b0:382:4115:1ccb with SMTP id ffacd0b85a97d-38260b45f98mr11753556f8f.7.1732612877138;
        Tue, 26 Nov 2024 01:21:17 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fbc3a47sm13027694f8f.73.2024.11.26.01.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 01:21:16 -0800 (PST)
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
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 07/15] dt-bindings: phy: renesas,usb2-phy: Mark resets as required for RZ/G3S
Date: Tue, 26 Nov 2024 11:20:42 +0200
Message-Id: <20241126092050.1825607-8-claudiu.beznea.uj@bp.renesas.com>
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

The reset lines are mandatory for the Renesas RZ/G3S platform and must be
explicitly defined in device tree.

Fixes: f3c849855114 ("dt-bindings: phy: renesas,usb2-phy: Document RZ/G3S phy bindings")
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- none; this patch is new


 Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
index af275cea3456..2babd200bd98 100644
--- a/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
@@ -105,7 +105,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: renesas,rzg2l-usb2-phy
+            enum:
+              - renesas,rzg2l-usb2-phy
+              - renesas,usb2-phy-r9a08g045
     then:
       required:
         - resets
-- 
2.39.2


