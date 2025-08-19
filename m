Return-Path: <linux-renesas-soc+bounces-20664-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF48B2B8D4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Aug 2025 07:42:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 40A8A196345A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Aug 2025 05:42:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94A383101AB;
	Tue, 19 Aug 2025 05:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Oe0prtvr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C4130F814
	for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Aug 2025 05:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755582141; cv=none; b=Agjsz43fUlvTaB1WflVNBgWuIddERsf0vY4efK/7ZgQaHbn6Yy4Oso880bajP3uzw+hvKiAl1Z1nNBmo81Z5JfHN5QrBqLRDlzDqWXjtsXYMmkkKd6Tjy+wc8KnRzKOxZMm705jevMyaUOsyEkO8ac4gVBsOOvVT13BsTZ4RY04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755582141; c=relaxed/simple;
	bh=t28rDaWGzjDZuXhZQyfhA3GzdnP9Mw+dEqE0Qk+DERI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ISyF+NNGctT5oX9sR61kivI5ZrrThlNSUioco0lXVOI+FslBH0f46mWzK/Hc4HLRmxwrUYasKdncwPGxdPa+6xRzYw/qaEg7vFt8P2NRBw4Uh3MGqAXMBwjMK+DWyiaj96AME66VBBQ8bE1DGbeWduBxtye8aNaoOPdPSc6fSyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Oe0prtvr; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-45a286135c8so11357365e9.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 18 Aug 2025 22:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1755582138; x=1756186938; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iVVSbvDZnii6bdSECwyy4dO1N94UmOnjL3r7C2ZllGQ=;
        b=Oe0prtvrs+pX9P9U/ISsq40mfcw1JOW8+t4o01F+KABLSph2ygYp5pvXKQlT2avaWo
         M7E0mJV2OmAroKML7HAYpQwXzU+Ol0Gr/RFFPKBpPzoIIRZ/rIsWA9aVr2jSil5ZYa9s
         EkuOKlJg8DiVAqsf3qt8zjhqlEPzSNI2DT6lD5fQTz79sfgLjMRcysxztYABLwNW1Ao/
         nkg7v0BXYnCVZuM6BA3e6qFKxReSUw+YJrY5ohsC4fGWgiz39rgB1F5K4RCdMKKrEtq9
         bLaR2sTaWUWqrf2BFvEcKAsM/ZReS7xLIhux6ifqgPPCtYQq6Px/lkF5DYC54Q46XSPh
         E7qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755582138; x=1756186938;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iVVSbvDZnii6bdSECwyy4dO1N94UmOnjL3r7C2ZllGQ=;
        b=D6zW0QLvMqExAkni2chE571zMcVELfAMD4vw3G/ILsabzvRlX2eWk/OthX6wojLo24
         nc8dGYZVDNXRevxnXzHr7k+96Omb02eUZOzOk0wLjYLjYzw/Vm3ij6DWzUhB6TQrFrEK
         bv0SbmsdZXmvD38kJbgwxeexnIRiopaquTMdOc6osR/Sb0ce2Ucap0/Kxf6UNM7+It96
         bVKmUA+x3/BfLRhwxV1PLN+quRhwYaGnBA8Kyyx6FXLgXQx8Nod+ImNEOFXd9brTwkKG
         o7I4IFMAqsvi4/VFBIRL98WufNFt21Aow0Eu3wbd/8BqZfTnMRCDoTokvJVc+sf83GOe
         JRvA==
X-Forwarded-Encrypted: i=1; AJvYcCXQMbDG1H7OPdIQwRxXsxjluh/RVY93m/vv6eWQ1Bby5QAZy9lNZJdXy2c+QPwYKOJUyxe8o4Rnx6qNdP7PZFxA/w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxyleUXWzXtLn7yxWMvOhGp4Aao4WCHGWUGVLqRZq2f4eiCQv8p
	UXIsGgONZRKX3o9EPnHlaYOoTOlH7qHKYA1EYon9qJ81XMrUTYNDmMSDy3OzwWuOHYc=
X-Gm-Gg: ASbGncuIajcHiboXlQQnxkeQOOpo+vIeONfZITqFsyyDBexhek8rVOrOGYTckO7KT5N
	dMCEq5ZWy3KykDoEZpUVYNDNtKWvzgzNb83fmRCzbgtKyLINyr78kcwcwA0aSuRvlZTc/b/rdet
	08Mx8yLjlSRDvY+3x0ao+p3TnFigHbE56dLrepJOblJi0GYy3xGmlN42YB5AgEZpvEfAZLGGcXZ
	IQTVUuozungaJqTGVrFRt6QJzDgHUp6XsINkPmta07sDwwaKeaeDCIyHQ9FqbN3orIm79e2s0ZQ
	IveuwPRFn9A5GfmUM8NnbibPy2vsKgwwRnbA+yEgVzvvFlTMWE0rDIoHuYvCJqmsDp/NXVowyyP
	AIW+jA8mb8642TbiM5+8AVo55VL6hDy2LcuR6o3pMb9nq7FK0gZ3h1EpMQQrX3HkQQtB+fX8HHy
	LNyrvDgs0=
X-Google-Smtp-Source: AGHT+IES5nhyLecC//rzL0myf1sxGPLvYHvc/2o3mQNfeX2wl3bWpFVtSwP/LJs1efnKIwVnA0xT3Q==
X-Received: by 2002:a05:600c:4f50:b0:458:b8b0:6338 with SMTP id 5b1f17b1804b1-45b4546ce02mr14595e9.6.1755582138106;
        Mon, 18 Aug 2025 22:42:18 -0700 (PDT)
Received: from claudiu-TUXEDO-InfinityBook-Pro-AMD-Gen9.. ([2a02:2f04:620a:8b00:4343:2ee6:dba1:7917])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b42a9847fsm25097345e9.26.2025.08.18.22.42.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 22:42:17 -0700 (PDT)
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
	yoshihiro.shimoda.uh@renesas.com,
	biju.das.jz@bp.renesas.com
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v5 1/7] dt-bindings: phy: renesas,usb2-phy: Mark resets as required for RZ/G3S
Date: Tue, 19 Aug 2025 08:42:06 +0300
Message-ID: <20250819054212.486426-2-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250819054212.486426-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250819054212.486426-1-claudiu.beznea.uj@bp.renesas.com>
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
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v5:
- none

Changes in v4:
- none

Changes in v3:
- collected tags
- rebased on top of latest version of renesas,usb2-phy.yaml;
  Conor, Geert: I kept your tags; please let me know if you consider it
  otherwise

Changes in v2:
- none; this patch is new

 Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
index f45c5f039ae8..52d777057281 100644
--- a/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
@@ -112,6 +112,7 @@ allOf:
           contains:
             enum:
               - renesas,usb2-phy-r9a09g057
+              - renesas,usb2-phy-r9a08g045
               - renesas,rzg2l-usb2-phy
     then:
       properties:
-- 
2.43.0


