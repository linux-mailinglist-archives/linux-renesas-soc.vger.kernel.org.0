Return-Path: <linux-renesas-soc+bounces-25036-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1CAC7E022
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 23 Nov 2025 12:24:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B81EA34B2E9
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 23 Nov 2025 11:23:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 272AE2D63F6;
	Sun, 23 Nov 2025 11:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VqDfgt4z"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD4F2989A2
	for <linux-renesas-soc@vger.kernel.org>; Sun, 23 Nov 2025 11:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763897015; cv=none; b=u0vq+PyAqlYOw5zOQZoN/4V0Y6SpDN7w1rEpRQZWLPs7hq277tKY6U0UGe4s3e+LVnElZohdKGJZBBjCHN2L235uFEHDjaRAgeOtg2XuZWLiHMolvqFy10NfiQLCwHJ+qL5JIBRxqcE6STOIhuImNvI6i53PHGcP9Z5+7vaRQUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763897015; c=relaxed/simple;
	bh=uzEHYcoKTcfwr0Zzg183PcKDFO5v0fCFNVn32/9q7Ng=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B2+t6JZR7FEM2xQ4EChFLVyoejtS05onVA7NB9J/q+eF2OEZrrXFBcLDJcCXd7ZZYc3dcCWn0cmGsXY7Ke+JdDr7rlyWde4gejwcUa5MobV1jf2sUvajLXcZD2w0VmiYFf7jYHjw9TOUZiVwce42Q+yMh8o1AiXSoLyy/pv9v+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VqDfgt4z; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-42b31507ed8so2914691f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Sun, 23 Nov 2025 03:23:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763897010; x=1764501810; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cmqYTRbC+N49mXlYWIz0dgPHO+8g2wZzchgn3hv3UQU=;
        b=VqDfgt4zRFqX17SfJe0Tz5FbP2rsXxHEUYLF8lxzU7w/om8q/MCgNaO7qy9u6I+3eC
         ycqm8FRwV2JMdsYQ/AnWPO1zeq+nhurjSUvvd/oVeDOv0Ak4YTfGpV+Z8SKIN88nQ0ZH
         1zKIq8Nv3QG8bo2WeonNJzj/aKUySzsCDD9wpV9OZtOimqEXD/w2DRZXq8oJaucqR5iE
         c5vW9y4fTXKeb13ARfWC9ZZ4acQLYlPoZ0DJxEQCrIMJxmDBk4SQDYWD07io6TLTTDZn
         TLarjZyf/qpHdBUCRPH8vpTIes9bCALE3gRB80kEvkp9hgp/rfj9yavGY88J4GfEQ6op
         BgGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763897010; x=1764501810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cmqYTRbC+N49mXlYWIz0dgPHO+8g2wZzchgn3hv3UQU=;
        b=n8s0020Ya4qwIjYMYweqQp8FXdtWJG/stIP9W0NYrynyUeLYs9U06XOWuWQvZGx7PG
         JgsxTh/miLWAB8wi+Y24KrVWyjaAExfZBOJJv4222PcUFnebruNFVG822hhwAalqFcH8
         p8v1oBJCuWja0dxnstb0BDDt4hUwfoIZ/1oewnt8lhoRB20hmUemNT+Vlht/ggNN3zw+
         Pm0SUPAwQq5NYJqsiaTDV9gwuYNlvg0UvkdF1lChFltdtsedWGcNpCP935Lea+qyzl6n
         Lpm1YnbrquiMyiq2YegCdfTQiUcbLtrhB+zw9XcffBg+lfOpLHMTF3W4JgLOJSntRdij
         CVtQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2sfFKs+fB/FY1+iVxyiSQGgU9e/7GgxnWnpCkCI+u84T5nS/ylYa57nGOCgxeT27sUy4Qatu4RRbASMvZOCY+qQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxCsKeP8tJ8T5UTxDBQjQWuDOWkigdfOp+lMycAkB/OrgqL1Lxr
	cditcrMNZx+ayghUGxrOk6KAWeG9Ja5d7L6BQYIiRiB65bCPTOVaTjQ6
X-Gm-Gg: ASbGnctyQmmOCQgjEwKu0XK56IMGn93oKdHr77oVZ5YSE0IZkmaPgZJOqJfnce07Oeb
	8k7jXwPIQ8yiKX0zQ0UdA0oAsBoLLPMGsl8thynAkh0HYnkaYYRtKCgN822Zo4DoQKKgn+eHuz4
	7py74xuBgXTOplCe0kuTDCOK42uKpxxrLP6LLFvicjJF1LuKCyNGc/O/ZjWpKKyNFtwZZcoPcNl
	rtg9cF2fB6Zhr+x0AohYcKgmq8KYMwZORnsXYTyPmkhC/dMWfw6WHzr5VnYLXR7ofGsgo9JfJNW
	5FsLOu7aBS5djhD6wpsQYNWBNSuNXzegMXdXRjrd3kV3yKetamPFEjejWPOVMo5T5IOxEL6jJ55
	qPuRYbZxRbIoMTQD9+i6yoLu/iztNIMwczYORO9kfsBCXOL81JD6yfQvgM7NVW0b1v+1ZmAyqQS
	BbOwkttVrp5sEYK10mpijHQFGzQOCaGuRd9T1hniTXmq4rLxfvypWfjSwVb8OxcWDBdG8Xp08=
X-Google-Smtp-Source: AGHT+IG1sPDsCSPRvqhQ38ght1LpqKVf02yiq3tLeARl0t5UZUBzeiVuumA6ww2SkKNaccehiLsiyw==
X-Received: by 2002:a05:6000:2f86:b0:42b:32a0:3490 with SMTP id ffacd0b85a97d-42cc1d19ed4mr8434429f8f.49.1763897009604;
        Sun, 23 Nov 2025 03:23:29 -0800 (PST)
Received: from biju.lan (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7f49a7bsm21765703f8f.19.2025.11.23.03.23.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Nov 2025 03:23:29 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	linux-can@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 1/2] dt-bindings: can: renesas,rcar-canfd: Document renesas,fd-only property
Date: Sun, 23 Nov 2025 11:23:20 +0000
Message-ID: <20251123112326.128448-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251123112326.128448-1-biju.das.jz@bp.renesas.com>
References: <20251123112326.128448-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

The CANFD on RZ/{G2L,G3E} and R-Car Gen4 support 3 modes FD-Only mode,
Classical CAN mode and CAN-FD mode. In FD-Only mode, communication in
Classical CAN frame format is disabled. Document renesas,fd-only to handle
this mode. As these SoCs support 3 modes, update the description of
renesas,no-can-fd property and disallow it for R-Car Gen3.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 v1->v2:
  * Added conditional check to disallow fd-only mode for R-Car Gen3.
---
 .../bindings/net/can/renesas,rcar-canfd.yaml  | 24 ++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yaml b/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yaml
index f4ac21c68427..a52244f0b5d1 100644
--- a/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yaml
+++ b/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yaml
@@ -125,9 +125,17 @@ properties:
   renesas,no-can-fd:
     $ref: /schemas/types.yaml#/definitions/flag
     description:
-      The controller can operate in either CAN FD only mode (default) or
-      Classical CAN only mode.  The mode is global to all channels.
-      Specify this property to put the controller in Classical CAN only mode.
+      The controller can operate in either CAN-FD mode (default) or FD-Only
+      mode (RZ/{G2L,G3E} and R-Car Gen4) or Classical CAN mode. Specify this
+      property to put the controller in Classical CAN mode.
+
+  renesas,fd-only:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      The CANFD on RZ/{G2L,G3E} and R-Car Gen4 SoCs support 3 modes FD-Only
+      mode, Classical CAN mode and CAN-FD mode (default). In FD-Only mode,
+      communication in Classical CAN frame format is disabled. Specify this
+      property to put the controller in FD-Only mode.
 
   assigned-clocks:
     description:
@@ -267,6 +275,16 @@ allOf:
       patternProperties:
         "^channel[6-7]$": false
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - renesas,rcar-gen3-canfd
+    then:
+      properties:
+        renesas,fd-only: false
+
 unevaluatedProperties: false
 
 examples:
-- 
2.43.0


