Return-Path: <linux-renesas-soc+bounces-7492-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB7E93B697
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jul 2024 20:23:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1194CB21D23
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jul 2024 18:23:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A7C816B38B;
	Wed, 24 Jul 2024 18:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DIeYLkbl"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A1615B963;
	Wed, 24 Jul 2024 18:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721845373; cv=none; b=klQQQho4yeidm65W4UMVq+rnZSj5Z0Gvqh2c4JqJS+v1PwaPMJZEW96oQHhK8Oe+v1OWlvyhmTWywOrfmGM9e0pVUux9xldCx4/hcFWIph4U0N/kgO6Rloatt1DWyQEJOlXJsZmx9/bBNJuT41iMzm70omTisjhvPgUBQb2SWAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721845373; c=relaxed/simple;
	bh=t483l2brnvBqjz2JZbiV3vdQvhs7A1Vha5nhdtCXtPc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TwTAHqRuKk4S0YOeyH4Ny/KJGt5RVPMjBpRAyMRWZ6uBsmfVqUDv8gl4xD13Ic6Zpnqg4NTmWYtH21V9PEoEQZlBHIQb1jpo8REpajHnYyQt+veIWs9DVGyCeS6j+yHNzdmQTjN26TeIbJRc7iJZxbnf8GAnkNmD2QQM4z01qfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DIeYLkbl; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4266fcb311cso585685e9.1;
        Wed, 24 Jul 2024 11:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721845370; x=1722450170; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WSqBBCtB+lOHBpG8zQq+TLg6p4H/QGn61xYkLlbVHgQ=;
        b=DIeYLkblqdr9MRYFRw5+lVUD2c/9pknek5er55NcV1kgeI76jJPPbohqguxvhv8uKX
         qzC4Jq+PRYwa4FfxYkjqub8kbgr2c15EBFfTbi2TK/43OmZZMRXDjFecZIX26LU9fp+7
         CJbNRYBeuZ+FRGr1LWlzyuu4lgfYEyTY8cFKOL/Rzisd0JBFYbfjraRpIs9ldIrXxEW8
         z4PMsHmpsU8TtIOhcruqx7GFjYcf4Xc1n8KWYtgdp5WAP3PPYR5XHnfWbdmYm/KHtMO6
         VkPusAAkPtzqotCt6Pouo7Vd/llh6aT3keIaFBf0vRqsVvErwRkA2drr+zITy0dVnIjX
         omHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721845370; x=1722450170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WSqBBCtB+lOHBpG8zQq+TLg6p4H/QGn61xYkLlbVHgQ=;
        b=UPtXrUqa6GBZp4JyhzLAy7pNHQOfr1MvS0Z/oOu7br7R+d8SGzTWkxmMg/J1k+11Zu
         Iy6FpKLnT9VWEeCQXp78inhrdYRa9IXHl3HjuBQNtbAO6GKSPpAZ3DNZOhIugDGGnqtj
         Zy65wPy3+6KnZn0BLioTMkykxXqM2QSe9JOXnAejMUJFldumnA1AVbKlOjhBJEtgeUw4
         SEscpYZcl+7ik6Hd7VMvTWmFUL3iUtONHwaSJRoZA6ejRw/DEv59Mmi5PA4psB6nJlvp
         RkdwHfhp6oE6EsjMp+2S/c3XWiu9+aIfEk5/yYl+kW3faVGfFDqBWoNGX9GF2ErAv9ip
         xWEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWir7iuiDa0zK2G2p46nH1t+SEhHfAMZ/oBhCJUmKLqKKiTTZysjrCjP9NkIavzIot23riuIdL58VQfN5+KP8oorCJvIjAd9qYkR5F93aQn4QZZfAxVVNfwDWZqgpGY8Qg2a+OQ9p8HUnrPmL1os8SmS602vQ9Cfjvn/1ddt7+FG602ATb7Iv2jE+1U
X-Gm-Message-State: AOJu0YzeJmb6vpBDykQ0aHYqt2nalE7EhGo/dbAu8gDSOxaAkBLiHZN7
	uweyvJR4AEBQ/HJeoMbsBwESM/usz4hGqCi7BGpJ78mQUxq6P/0M
X-Google-Smtp-Source: AGHT+IGhmdjY6cqvoXXLaAzoc1WG5lrKZFi+D03tzm5HaF3teZuFx5mF1dvZHYivKHgrRE0xhoqPMA==
X-Received: by 2002:a05:600c:4e8d:b0:426:6ea2:31af with SMTP id 5b1f17b1804b1-427f95b61c3mr21129185e9.37.1721845369412;
        Wed, 24 Jul 2024 11:22:49 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3687868b5fdsm14909882f8f.38.2024.07.24.11.22.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 11:22:48 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v5 1/3] dt-bindings: mmc: renesas,sdhi: Document RZ/V2H(P) support
Date: Wed, 24 Jul 2024 19:21:17 +0100
Message-Id: <20240724182119.652080-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240724182119.652080-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240724182119.652080-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The SD/MMC block on the RZ/V2H(P) ("R9A09G057") SoC is similar to that
of the R-Car Gen3, but it has some differences:
- HS400 is not supported.
- It has additional SD_STATUS register to control voltage,
  power enable and reset.
- It supports fixed address mode.

To accommodate these differences, a SoC-specific 'renesas,sdhi-r9a09g057'
compatible string is added.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v4->v5
- Dropped regulator node.

v3->v4
- Dropped 'renesas,sdhi-use-internal-regulator' property
- Moved 'vqmmc-regulator' to the top level

v2->v3
- Renamed vqmmc-r9a09g057-regulator object to vqmmc-regulator
- Added regulator-compatible property for vqmmc-regulator
- Added 'renesas,sdhi-use-internal-regulator' property

v1->v2
- Moved vqmmc object in the if block
- Updated commit message
---
 Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
index 3d0e61e59856..1155b1d79df5 100644
--- a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
+++ b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
@@ -18,6 +18,7 @@ properties:
           - renesas,sdhi-r7s9210 # SH-Mobile AG5
           - renesas,sdhi-r8a73a4 # R-Mobile APE6
           - renesas,sdhi-r8a7740 # R-Mobile A1
+          - renesas,sdhi-r9a09g057 # RZ/V2H(P)
           - renesas,sdhi-sh73a0  # R-Mobile APE6
       - items:
           - enum:
@@ -66,6 +67,7 @@ properties:
               - renesas,sdhi-r9a07g054 # RZ/V2L
               - renesas,sdhi-r9a08g045 # RZ/G3S
               - renesas,sdhi-r9a09g011 # RZ/V2M
+              - renesas,sdhi-r9a09g057 # RZ/V2H(P)
           - const: renesas,rzg2l-sdhi
 
   reg:
-- 
2.34.1


