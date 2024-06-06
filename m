Return-Path: <linux-renesas-soc+bounces-5928-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A438FF1E7
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Jun 2024 18:13:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B229B1F26558
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Jun 2024 16:13:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 460DC198E98;
	Thu,  6 Jun 2024 16:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fZP/rKJP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F3C7197A9E;
	Thu,  6 Jun 2024 16:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717690266; cv=none; b=K/2Jr2YPUJ3nqRhZQZ5GqOiyz0imFyfmVE8tmsBZXhdAbDHznhNbBPhuIKkf19VEgcUD8WDDMIdT3VABhBSKi7VOHKfL3JOYA7bKEKeecxK8mw7kFrkeEWC/fKZqkIG0bXgFWRoFTcX7oFI2N2i9XU91u7HOygPP2siegpIbxvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717690266; c=relaxed/simple;
	bh=jPkUwIUErPfWq/A4tMraeoYy+ph2aOlfxFKOGnXfBKQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OpSXDzURvu/e4CpmfZ9PPLB9Oqjd0I7wdYiyVTeB+efswwfo/bJHdfPVDoaTn8s/r06tiIwhD/RjoDqCEJY1GhGCp1pMb1wDW5Txg6YkJ/tYHRge8QO6TLNxBdVdHte/jXHx8d3RY6PQimiX3PE5v3aL+5PE343L703fyplNd40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fZP/rKJP; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-421396e3918so14944595e9.0;
        Thu, 06 Jun 2024 09:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717690263; x=1718295063; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6gYT/WuDQbbZMRTr/c1VVX3M41AHAGXJIfymJEdz54I=;
        b=fZP/rKJPcclFUi0LuXG9zGf7+g0fGrpB5Y+zEZg30+5DUIeFeeWAp2QpMGQ1dQgApN
         PubDStHmIuyMq/o871v9xwYBFkIZoN9J8Ynxhb0dVB+mNocbE3jHzU3IxytUgD5P1gWD
         tc3IXVq6Ya0YuU4IVZ4MBpC2JBYPvcYoe8azKMR7BPfCmLxgwerfFrgPwbYMJ2rjmyBC
         q/r/7t81VUqQp2Ba7KnpnouBR+b/csqRjh0dagqlcde9tapr2136LFpyQSKAiJnMXbv2
         uGwtMGTLzFsZ+5wn0aPZZ6P/AGI5oq4kgcVo+bzQL6bW6ACWXeh5KYuWn5sZ1FwWJh0X
         LLFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717690263; x=1718295063;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6gYT/WuDQbbZMRTr/c1VVX3M41AHAGXJIfymJEdz54I=;
        b=JNt3BAPC6bUwnOkoiLzenGMGXWK//1uqoNd+14d01x7S4g7zAFyzrt+LEgvXdqTtex
         rdBR0K1lziBBnGSG0tBAbdwzvYcy7QaEw+g6SBHMnXZM86YANJheyGHvyp60jx/ZEtZT
         nT9zMntn//Xk4B9JYSivYRPYzNOVFrDq5fM+IBDT1Tym8tCJIBrwFsyFUmXuvepLT28V
         a1fqNFOA8Tay3IUlcge2ogHDFlUKLj7EK7MVHjQ1yZhIrHNUYap+Lw5IaJW4WR1LlQd0
         n8N9PE2RKXxWaLRSzbQz6F7/glyiUOweIZBU0GoktS2BoTkf7ATb3XI1Nfism1tcXomc
         UXlw==
X-Forwarded-Encrypted: i=1; AJvYcCXOXqJ6S03s+yaDyza+X6WMGdnzxhSpd7TgwrfouX5VZvzM31XoUN+YuXbOsLXWb5RYgV83zH2HZfS+n4IdD46hbIHDWDN49rHugfqfXH31cXYa/9II6HYcRp/5WyD2FmuyeRz530K+d3kcPK7Vb8/4mHTDiKx3Vax6yMbTTZcoYdSi1A==
X-Gm-Message-State: AOJu0YxSMVIbC0w7EJUz84pqJqwqco/O1DcclwhsfRQvo1HzJFgdxN+0
	Je6elyj5FlbeuX+SAKiZKXYs8iOKYhfZjgC2T5ajPwzGLelO/wFE
X-Google-Smtp-Source: AGHT+IEjmbYzoXyGZuLYy9YXCYIoFgpNnq3YKEnWDVeZM9L/qvjO7hTxRccvi71+ha+k+Rs/FajN8w==
X-Received: by 2002:a05:600c:4590:b0:41f:e7e6:7f27 with SMTP id 5b1f17b1804b1-42164a2b361mr1517815e9.26.1717690262362;
        Thu, 06 Jun 2024 09:11:02 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4216055101dsm14229565e9.21.2024.06.06.09.11.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 09:11:01 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] dt-bindings: clock: renesas,rzg2l-cpg: Update description for #reset-cells
Date: Thu,  6 Jun 2024 17:10:47 +0100
Message-Id: <20240606161047.663833-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

For the RZ/G2L and similar SoCs, the reset specifier is the reset number
and not the module number. Reflect this in the description for the
'#reset-cells' property.

Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.yaml b/Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.yaml
index 4e3b0c45124a..0440f23da059 100644
--- a/Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.yaml
+++ b/Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.yaml
@@ -62,7 +62,7 @@ properties:
 
   '#reset-cells':
     description:
-      The single reset specifier cell must be the module number, as defined in
+      The single reset specifier cell must be the reset number, as defined in
       <dt-bindings/clock/r9a0*-cpg.h>.
     const: 1
 
-- 
2.34.1


