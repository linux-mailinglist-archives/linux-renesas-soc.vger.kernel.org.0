Return-Path: <linux-renesas-soc+bounces-26190-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D81D3CE999D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Dec 2025 12:59:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D118A3035264
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Dec 2025 11:58:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64F7D2EB87F;
	Tue, 30 Dec 2025 11:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U4VZTX3Y"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8FF2EB5A1
	for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Dec 2025 11:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767095902; cv=none; b=W6r94zYUbUnZPLHfPmT6NC1QYeiH2a+IikxcHYq/l/PVmwbwfKi4cX0KMWcG/nZQOT0FqISwbkOQiHd2HpCjUhfTm/ii/BKE3Uye6fZ3n0GqT8R2F2tKDeF5IrJevS+29e3MHAXkuI3OqJL0sfWui/2LnJAfLWUyELiHSpFMMiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767095902; c=relaxed/simple;
	bh=KjYWDyWnoHoWoOkGnse/jvkaJ5XxxESdlC+QGJlKdBk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=muXMzwlUoh1rEXLPga543L7UTzGVEIDsHAFSfqjDEMS/uBztDQk0cKJ1gBM633nrNmvR+cEZ0hB+doLmEVgvVyn+NcZmjzEPEb0Hu0zulUserQFeJLSqY+C9f8DT8U7kkNoppvKU/A5x/906PJh0Px4FwaqzOgOC16w/f04vyeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U4VZTX3Y; arc=none smtp.client-ip=209.85.221.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f68.google.com with SMTP id ffacd0b85a97d-4327778df7fso1900176f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Dec 2025 03:58:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767095898; x=1767700698; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TH2FRCJfbh+ausD8rThQOzC7X3+nqUlsi8sfpxkEbNI=;
        b=U4VZTX3Y6HR8jERFeL8mj4yDUtKhZ005wyfej12wnpG+3w0ZtFYw0Aze5325naRyyL
         wMdyO8OdmbUZJav0ohisIOo6tDjvqsE3fENobyG2JjbkyrVHivIgrtxp5R1wNbGnVbZa
         He5YBsFukxKNvJ51Gc82XRRdhthIwjIeSH32QLm5dOFRShvNU5QQZxfd+2UDYq6woj34
         ioEAgKeg9eUThF+GcUiAuFGfK87TJrt0jQcVgU6hWn/KH9BaR+oU5C6LCOofvJofS9bu
         KzGrjddJlwkYGXBBaj/oTg8k2InrZl/Xnsds+i7uAjPA2IFVAa2HcoFV5XahrqLJkPRd
         I3XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767095898; x=1767700698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TH2FRCJfbh+ausD8rThQOzC7X3+nqUlsi8sfpxkEbNI=;
        b=UVKAjfgsb2RkJYaPNeqPIFjeeHmRhehShXrX5lz5RSI0Edc4GsmxbBsH/GxIlN+NvZ
         crmm1BUWSGjkMq6pFu/i/AkSyKg3V9uDgMTNmE65OMChcGcfQmpBNUK4E8/baDzZsWTT
         BQ1gEhq1/q9iMwaNLwLVuH0FFp0Tu/hc3XLKbGWOiLRmeKZ9pFH51xs4A0+BlUA0lNov
         Qst4Nz/+xcaaGo4aPmiL7w1TYAqHXtuWcfjeYy+AF0BqmQ+zC1aGXyZT9OYj6m+7L1jk
         pFIx+18ajfvJt+nxhclxu6HyJ2miwrnVVlxhezAsiWuyJsOYgX3MCeEXjheXrkX2NA+8
         wdxA==
X-Forwarded-Encrypted: i=1; AJvYcCVOu8CEaWgfR6k9AXlUZF/KQ+2ZQhd6x/klbegKxexWR8mHhQA3smiUK+/tnHlbZZxdv7OegbkbusgLAYl63DM8Bg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzEiEP9rJb03WX3BlJ2yTj5ArCmoKtpr+Ibx4zQQ3jxnoUvVmqr
	FaQc59GHQiqYm7slV8KvJM0HOLkZhMOdIPgTLrbRuTLrmNEXCsC8WTXa
X-Gm-Gg: AY/fxX56cbdtsZ5ZGhzU69T8zT9fbb1hih7inR1ZJkJ6y1fpbN0WARKX6JEH0WV5XGn
	+YMiwtSfx8BrdxawRmJlqAR9uCPjRYuYaOvHo4YAYXmKufgmc9d/+IHV23RLdYwHWLjFt57muEv
	NAHBh5X40ZRxHozWIbd/doobUwnXGXhPQIrc9+I002+T3t/aNYYezjwHds/XU06tKe3ph4JTNyb
	HrN+HJ71uYD6J5Q2W4EYURyKhPwSHFWKDLB+M9VziMHNv4CVfsdmMIXL4PjPOZFmSP16DInn7FA
	J+Rwc0vobRQ1HWqj8p0c55jdRpwCRqYXWH2LkE8iyLpQ8ORWYwScTW/mgcx8QYoZvesbS5lueFP
	HfVPG8fJ/CJ+YZIhvz08WeNeYkksQrYk8Co76xB5S0TE1K9tGr7UbN2k0QtanRx01ORCL12xNJ9
	jEGRkUUzIvACNLVSegRxJWobYCKsR7WA678XaN/rV62/orinz9li16W3WPGt/F1gp157+YGjuj0
	DlT5Ig1He4OQQsc4FhkmGlV
X-Google-Smtp-Source: AGHT+IG8pw2WnLdLL2INIYYvES1i8SAlbuVSbxsplffVaBslb23j4XCBcHXODUtcw/FBn+d92ElZ7w==
X-Received: by 2002:a5d:52ce:0:b0:432:5c43:5f with SMTP id ffacd0b85a97d-4325c43025bmr23773087f8f.40.1767095898338;
        Tue, 30 Dec 2025 03:58:18 -0800 (PST)
Received: from iku.Home ([2a06:5906:61b:2d00:efaa:981e:926e:8957])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eaa64cesm68337227f8f.35.2025.12.30.03.58.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 03:58:17 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>
Cc: linux-can@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 2/4] dt-bindings: can: renesas,rcar-canfd: Document RZ/V2H(P) and RZ/V2N SoCs
Date: Tue, 30 Dec 2025 11:58:12 +0000
Message-ID: <20251230115814.53536-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251230115814.53536-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20251230115814.53536-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Document CANFD IP found on the Renesas RZ/V2H(P) (R9A09G057) and RZ/V2N
(R9A09G056) SoCs. The CANFD IP on these SoCs are identical to that found
on the RZ/G3E (R9A09G047) SoC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- No changes made.
---
 .../devicetree/bindings/net/can/renesas,rcar-canfd.yaml     | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yaml b/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yaml
index 9bfd4f44e4d4..fb709cfd26d7 100644
--- a/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yaml
+++ b/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yaml
@@ -44,6 +44,12 @@ properties:
 
       - const: renesas,r9a09g047-canfd     # RZ/G3E
 
+      - items:
+          - enum:
+              - renesas,r9a09g056-canfd     # RZ/V2N
+              - renesas,r9a09g057-canfd     # RZ/V2H(P)
+          - const: renesas,r9a09g047-canfd
+
   reg:
     maxItems: 1
 
-- 
2.52.0


