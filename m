Return-Path: <linux-renesas-soc+bounces-4456-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 207C989F8D2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Apr 2024 15:52:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CA7FF1F2F5E7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Apr 2024 13:52:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 853E5175578;
	Wed, 10 Apr 2024 13:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="cN9CkAvP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A895318132E
	for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Apr 2024 13:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712756488; cv=none; b=VOmUEYX4zi2QwP3OMx9kzq1C34IlObqE5qUodNcaZOVoRx3BZQvTAVzxt4r/Dq2qmClhtY/InIwFJoLaaMU10cmx+VzIPh6bp/IOWAJPZZ07yQIHdKKBK98XD0bJ1AuQIYLa7IjIAJO1vSlT3g4slIO7DgDxau5EWbjAw7xOc5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712756488; c=relaxed/simple;
	bh=GXy2NCi8uXzU6Hc5qvGIBLwCCNQ9bIeLqQeevRksNVo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZUb6SVCQTTTGxwnk1AYbABHASVLnWt3lHzU+fhAMBMe1qq0CSciXoEvY5Pz0Ww1RswOTwmlyjnmxPqUMAn3QcL8bOJ+KUfY4W/bw98w/Qc6P04ZFMBGQSQcIz0hUsUkfE6dTLRzJo1HUCYDU22YFxtW+nLE5qruGqxt2iyzpwKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=cN9CkAvP; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2d8b4778f5fso12725771fa.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Apr 2024 06:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1712756485; x=1713361285; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qI23KqzcJt38Hlh/8lKvteGzbiZhgHD+Qy4akVKdJqc=;
        b=cN9CkAvPGfmMvZq2/2zFbXC8/W29pbAQQnDraDkOj7Y7KKgZgTKr0MDcaFVkNzwV45
         UuffDlTPvw4Kfmd/ua7N7I7k4ZY1iYaCw6hgoKueKUI9txx5EvtruQpq2NE5UrJcgbmw
         mKvxjOQ/JyHeqAWTUP8EqDMD0SXjj5QAezwejWEzuBwxZKJN50iEq/QuW0FHrBABf3Vv
         Hs3yXrAkYnjO0kU0YXza2uyAjvk9i0htoLTI+oE3OI1NRhevF0X0CP/ssELZNKrN+Xfj
         M6bi9WjOdBh2rhbGg7YsZ4onA4UtqaAFpajGMe2ayUbxeOfRiGOnVOsmwYY07cWcw9O4
         heIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712756485; x=1713361285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qI23KqzcJt38Hlh/8lKvteGzbiZhgHD+Qy4akVKdJqc=;
        b=FqCcQYyY5/f5mpC74n18CbY5qJWb+lj3qqutUAC5Q/OmhvOkuRytiZTAZE/PpnpEBb
         1ZH62awB2e4G/9ozT1kWmVtwehawtdjcr+0t+YTIco51grYFLlQwUB+X+kkhSjdVbGaa
         vtJiT47L2mYYHGcfy9IGrKL8E7A/3+fQxZBT3bqO0D0cer+KT9tOZf/TXxWfbYWLm9mx
         nXidaquaUZXDgiU+Rv0NWQ1Paoq5cPausQMhtx54XDPQLJtJAN6gahIf6/yH+d9rbTv1
         u2+PWlVdFLFqqlTKqDDxCiZ+YhoPDH2AXMoVeL+LBuWjEK2w9hVJa+5mJpY7JEzMFmd3
         46kw==
X-Forwarded-Encrypted: i=1; AJvYcCURWrAyiVKCo2IS8OX+4IXb+WOBikrchAkr7woHNeqSRlt7sPtMZICOm424/2AnywBsZ3FzCwZzOaKy+u6oS+aEmDBbg9dfU1RyD0ljLVrQZG4=
X-Gm-Message-State: AOJu0Yyr2MMM+WiwhROU6itbuwwBi91kJQ8jlMMS3P/9Uq/K3LZ6K5fg
	l2l7PlB2P4YlMRJa12+oJZEkCYxiAyWkLu+cw6QaH9eSxehq6Wu/Sb0VgXVZ9jE=
X-Google-Smtp-Source: AGHT+IFhrlweALOximZcC0BHFuTkzJPdrxOAXLFJAQUUC628k9E6cX0jEMuaEZy3td7RELRpQOev1A==
X-Received: by 2002:a2e:8682:0:b0:2d7:f07:89f8 with SMTP id l2-20020a2e8682000000b002d70f0789f8mr2135166lji.45.1712756484813;
        Wed, 10 Apr 2024 06:41:24 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.8])
        by smtp.gmail.com with ESMTPSA id n15-20020a05600c500f00b00417c0fa4b82sm872528wmr.25.2024.04.10.06.41.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 06:41:24 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: wim@linux-watchdog.org,
	linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	biju.das.jz@bp.renesas.com
Cc: linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH RESEND v8 10/10] dt-bindings: watchdog: renesas,wdt: Document RZ/G3S support
Date: Wed, 10 Apr 2024 16:40:44 +0300
Message-Id: <20240410134044.2138310-11-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240410134044.2138310-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240410134044.2138310-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Document the support for the watchdog IP available on RZ/G3S SoC. The
watchdog IP available on RZ/G3S SoC is identical to the one found on
RZ/G2L SoC.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---

Changes in v8:
- none

Changes in v7:
- none

Changes in v6:
- none

Changes in v5:
- none

Changes in v4:
- none

Changes in v3:
- re-arranged the tags as my b4 am/shazam placed previously the
  Ab, Rb tags before the author's Sob

Changes in v2:
- collected tags
- s/G2UL/G2L in patch description

 Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
index ffb17add491a..eba454d1680f 100644
--- a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
@@ -29,6 +29,7 @@ properties:
               - renesas,r9a07g043-wdt    # RZ/G2UL and RZ/Five
               - renesas,r9a07g044-wdt    # RZ/G2{L,LC}
               - renesas,r9a07g054-wdt    # RZ/V2L
+              - renesas,r9a08g045-wdt    # RZ/G3S
           - const: renesas,rzg2l-wdt
 
       - items:
-- 
2.39.2


