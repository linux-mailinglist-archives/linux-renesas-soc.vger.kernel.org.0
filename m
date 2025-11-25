Return-Path: <linux-renesas-soc+bounces-25133-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B4477C873F9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Nov 2025 22:45:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A59504E2B38
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Nov 2025 21:45:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58CF6284B4F;
	Tue, 25 Nov 2025 21:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ay1RJdVh"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B39D818A93F
	for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Nov 2025 21:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764107138; cv=none; b=lfUvnGBf9JjVEOdbSJDER1+Aut1xFIQmwnIAYyvUreLy7R0TyC4OMWHhzqHh4Nmor2kFt+LSl4YgiVblPY3rADHeCMJmFl60/BjF5r2qzlBAQnOfnJIdruUWhPnm8zOczVEUxbqKM/W4lcRETNilm4pR7X0jgN6M+xU3DJi2apU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764107138; c=relaxed/simple;
	bh=VlxfKwb6drAkJYTHHriEjc7I47o3xKGHFN4xlLeNgxE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HhF5Fp4hPjTZmTihr4M+gP1IaYadcQlzYWXFz3LvKv7S3R9zOKXTI2ZoE7smnP4R9fXNIfqxcoRpTr3N25V6mine4L+4PECiJzbRAncBtyv/3U1lT4CiFA9HFVoIbuITCjTT0XOHJjIeV3Dh0hRCMmYdohIqO/zcMM04ptQL5aQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ay1RJdVh; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-42b3d4d9ca6so4950798f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Nov 2025 13:45:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764107135; x=1764711935; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L975bxm4Gx+EyVsxiE9RIjBJmcCJrfpso+xG2/B2N9A=;
        b=Ay1RJdVhEsspO+prwIyjrpgiHK2s1wPYvnloOMgX6XOPe7fy6qJFtFqAN5jXO8WtYJ
         6QluPnnBWnEXFkgB1dDGzHA0Z13Pppdsr8QRnEeTOAWPLKv25JFddMYQcJf29Jm89esm
         3ho3YTDKJ8h3A6uQxZig11zkmL5lU8SWp6+4DCKAxCbvmV+2jBDvKg21VZZ1skl6iQ7a
         PnI9T4NCoX0oGpq/m//FPx+F86yYHXL876c7RYXkLmCeE8nLd209gUbT8qGxepiLqF0Z
         OQde3riNDCucqZKsx8gQU8ovkKILq1n85oJpMvDHI41qKCYZ3tiTkqFPiJXg8RGGN8ZO
         dZbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764107135; x=1764711935;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L975bxm4Gx+EyVsxiE9RIjBJmcCJrfpso+xG2/B2N9A=;
        b=ig6uplhRL4v7fgIsLBJLCwyc+zuFfJr7yhyDjutKrKJYiYmhyhVU6kuD1pn6tv/gZB
         f5B1txBterRbL/JPzCnACf7JPw7mPdopDHTEBCNXrWoFZgBEjWnTJpSInJ7JFQIufe6+
         1aFceuYGIbmtreQEfO6S7ZyhClpRa+TQcGd8TwkLnIMbPidJdqxVzobNaOWDYaxuEDva
         JxcfAqliJm6/akdpVNFHfVZnD0fG3cjyMQ+wbEFrcay0z7zLtXIV8ufyp3DSEj5eQ44t
         Xg69Xwi4W+4lieEAzWIVXYnJ/MsWxDJtJ32nhpbvmqn6t0mz/yipNrEeesJvlvCyoc35
         hp/A==
X-Forwarded-Encrypted: i=1; AJvYcCUk1tDEz2A445qZ2vsXc+VQyvhTIPmHKsXwg0cpdwNexVevm84mnKW8HN+PesTZm5FdF9s410d1dfHQeds0PuFECg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyuS+BEqFYqc9Xp57shwlwhVui2cTvEGEIpRSz2VOZxXmHyyBVB
	haOTbdXI98eMRUbEuVyW4t349ns1xh1F5c0WFZGi3P13P7wsY+RfPkp5
X-Gm-Gg: ASbGnctHRxvnMcavFC+c3jKUO6TmdByEes4Zuzant7lSlUd+zz5z0xW1G6hYL2I36Da
	eX5IzVk5WuZhmsqm9zQY0pJZX4BMpklueI4/PupQePiq0SB2jXKjytehphRmXpIJG/WZYXUKzQL
	VUO/b7g27S5zRRbwZVMv+vB0d2NGtbSJndgyHi94MaUkzc5E8GoMpVfGSi+eBggM9R971CQzRpE
	7n6MQR9wyY7ULD63iqBlup2CevxtNNozngODPhRXmZy4lFM1Qz4Shg7YARSAJJeGIuii6+AxTyc
	6f5TvaKNg9ctU6kd9zPzwCEftbpM9K/vl0IlqeDeN0H1oAS+eulMe4Ux7VfPbMSbDfqIwyYqkf3
	HD/Qp/eNAJAn781Rm9WCXU+NgwACJnXQ1KghHmv1/Ia5RjzQfcZ2D2fuKp3cp745kDUI8qZiggQ
	a9fjAorZr/VNHUmjTdsmB2tW0uZyNFQUbgsg==
X-Google-Smtp-Source: AGHT+IEYQySQcwxUg9tDkdvcawtVF/nhiWKoBYOu7uxaLo4Nkvt6XZX9uPHdB9ZyxPvEO3tkQ2/oag==
X-Received: by 2002:a05:6000:61e:b0:429:c617:a32f with SMTP id ffacd0b85a97d-42cc1d51a63mr16565265f8f.52.1764107134970;
        Tue, 25 Nov 2025 13:45:34 -0800 (PST)
Received: from iku.Home ([2a06:5906:61b:2d00:325:d7d3:d337:f08b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7f2e432sm35494596f8f.9.2025.11.25.13.45.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 13:45:34 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-spi@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] dt-bindings: spi: renesas,rzv2h-rspi: Document RZ/V2N SoC support
Date: Tue, 25 Nov 2025 21:45:29 +0000
Message-ID: <20251125214529.276819-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Document the RSPI controller on the Renesas RZ/V2N SoC. The block is
compatible with the RSPI implementation found on the RZ/V2H(P) family.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 Documentation/devicetree/bindings/spi/renesas,rzv2h-rspi.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/renesas,rzv2h-rspi.yaml b/Documentation/devicetree/bindings/spi/renesas,rzv2h-rspi.yaml
index be62fd0841aa..5f2672625c30 100644
--- a/Documentation/devicetree/bindings/spi/renesas,rzv2h-rspi.yaml
+++ b/Documentation/devicetree/bindings/spi/renesas,rzv2h-rspi.yaml
@@ -12,6 +12,9 @@ maintainers:
 properties:
   compatible:
     oneOf:
+      - items:
+          - const: renesas,r9a09g056-rspi # RZ/V2N
+          - const: renesas,r9a09g057-rspi
       - enum:
           - renesas,r9a09g057-rspi # RZ/V2H(P)
           - renesas,r9a09g077-rspi # RZ/T2H
-- 
2.52.0


