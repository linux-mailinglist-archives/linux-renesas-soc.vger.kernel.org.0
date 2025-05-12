Return-Path: <linux-renesas-soc+bounces-16997-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C135AB438D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 May 2025 20:36:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2F0923B1D16
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 May 2025 18:32:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A32529C341;
	Mon, 12 May 2025 18:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MU2U39o1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C787629C326;
	Mon, 12 May 2025 18:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747074239; cv=none; b=NoB3r5NSu0HddzNzrWevDp9WFjCpD/2JQj0xaxpVOUvuXmPB7tI4JTsKXqIZZ6Igodp/CPzoXfV66W74BM4Ikp1q5qblXn+4+tYDDhXDEKayCV0CYw1bNysJjrZRdX1S6lpsk/MVBVKdwNOsadJVjm13mxHp4myhctOoY8tlQ7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747074239; c=relaxed/simple;
	bh=YFrwzwdyCNQTPoaUm3nP7EpBXQleMbN2nlHRuZ5/0Lk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Mh5m9wZuvMzQ5QhHqVjrPKI0aU3v+cZdB8Zw7GOxB/EhQFwDkYxHHoG+b0Rtxm/6Vz6bMlQpFDeMUmjEaCbHmOU1aYIMce3duvM1tb+C/+3fsW2QccQBk9yC0VJolZ8TTUyxXQF+c6uvMUsGHoPVYdcqGznvdACASo3d8pxP9gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MU2U39o1; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a0b6773f8dso3990617f8f.1;
        Mon, 12 May 2025 11:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747074236; x=1747679036; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1193UJbE32YYQYa9WtO0rNzoJW4bxqbFkUJaurJRCNE=;
        b=MU2U39o1Ycz4NF3kQkYzeNMQ7dSdys6VxIP8ZxwgVYVrJxnjlQeyOPoW0kBIFKmqVK
         vSkawErY+emdMzqh5M0s5JA+7kzuVB6mQR2HNyXokARqYH9y8nL/4AenmsIYFCfugXVI
         obgjkgN49bMjBcmvkeY+E6eIE+x9q2Hw9b92UgbxSekdSPdiznZaSe+StK6b07JeB5n2
         Hb3mpn5Dozxd1ki9EgIGYL54S+WjRsQe15lJ4cy6Kt2tBSx/ggmi0ldMeObaCpaNZZ8X
         8+AWU3MD5JlP8w9IOVzn47arJEsDOLitUC8MdQjolCtsRnsj7LTXRsqU0sRIlEOc3tr3
         09Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747074236; x=1747679036;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1193UJbE32YYQYa9WtO0rNzoJW4bxqbFkUJaurJRCNE=;
        b=Ja5Fhcf14SXO7qg/I8IEqQpomTNWApbp8e5OBFNsLCTcWYmiiNEgl5zw77BDR0D9p/
         gXMcwHrJKUSnmUej14X9IVgJCtiyDRJSWIG/b8289bWKq9lTDa0or4mTHG+Nf+yKNiOe
         l+Dxb700oRkIkrsYl5x750bqqFUu5Ulthco1wX0P1+WgmteHrGFjEt/Z3E34ZwFHNHK/
         Omg6p0VKHYKChRlj0WM68JBubYZgL9aO8/MIUh/kRCSHmXaxX97skqfmp6ip+Z2qOFSh
         h4iZKR3nqMJKZbvY80liYwdLzkjQL2zZ7fCeJZy5ltLw5iNurOA6rPFkykTpAxLB9z7P
         Hx/g==
X-Forwarded-Encrypted: i=1; AJvYcCU7PtEjCRN2yDiAVfnqS0zXLR5vPCLA8zgrAjXs5Mb5rccd2L+lrlnfwAuk5W6/udXYvwm25vXlr9t6@vger.kernel.org, AJvYcCXrsbg9xErM3ZtwuJHOI/ZVRo+3ENAwFcZE51NoZpsyGIEP+vJc+ialgQbZPG5DtmEjEGgKKPDDycCiBgGV@vger.kernel.org
X-Gm-Message-State: AOJu0YyZX+ESo0Is25f9dO46HoG/HC6SP1ytjk/g/qTMlYLXMpnke9Mf
	VDGK/PJYqkGYvCeGyy2FFZ1J5exeHQTD6EVDkyJvpCB+oI2hXHFj
X-Gm-Gg: ASbGnctSuoicaqK3lh7TL1IA+pvVqZHSSGsAccDOEZKF08ieccoHtJEzS0YPsyuzSCi
	gkq68CKcs292BpBpcR4LUN707P/3TrUR2cz8QJSeMEaERuVma7fYjhq49q9aY/tlZojNwt+dfGc
	0m9ZOC7QWWxv6ID7B5nP3vpht1CFsAeOPskh9/X9QCsAg+AscLXXcvCs63cr6cLk/3qekBWuke7
	q8ViaLC4xSOHIcfTkdRrHmTfyvhUehN1x1RfojhLCgwdHvomhY5nNVfYLGk4wAzO4VjbOq62/jZ
	XWjDkgsd6CL/fmK3ejewuJ50c7pfdJx6GclKXIuEVQGE3X0Zd3TGsi1oj/eZ9VBWe12/iN0146g
	U
X-Google-Smtp-Source: AGHT+IGCRxHRJFT1wb4lzfAl2BcV4olfCw3AoaKztULivpbUThs/lC/VzwFMFHTd9yhq7+8VNKrS6g==
X-Received: by 2002:a05:6000:40e1:b0:39e:cc5e:147 with SMTP id ffacd0b85a97d-3a1f64acc2bmr12468513f8f.55.1747074235981;
        Mon, 12 May 2025 11:23:55 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:581b:951a:bc46:a124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a4c5f6sm13175497f8f.86.2025.05.12.11.23.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 11:23:55 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v5 07/12] drm: renesas: rz-du: mipi_dsi: Make "rst" reset control optional for RZ/V2H(P)
Date: Mon, 12 May 2025 19:23:25 +0100
Message-ID: <20250512182330.238259-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250512182330.238259-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250512182330.238259-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

In preparation for adding support for the Renesas RZ/V2H(P) SoC, make the
"rst" reset control optional in the MIPI DSI driver. The RZ/V2H(P) SoC
does not provide this reset line, and attempting to acquire it using the
mandatory API causes probe failure.

Switching to devm_reset_control_get_optional_exclusive() ensures
compatibility with both SoCs that provide this reset line and those that
do not, such as RZ/V2H(P).

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v4->v5:
- New patch
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 00c2bc6e9d6c..5fc607be0c46 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -748,7 +748,7 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
 	if (IS_ERR(dsi->vclk))
 		return PTR_ERR(dsi->vclk);
 
-	dsi->rstc = devm_reset_control_get_exclusive(dsi->dev, "rst");
+	dsi->rstc = devm_reset_control_get_optional_exclusive(dsi->dev, "rst");
 	if (IS_ERR(dsi->rstc))
 		return dev_err_probe(dsi->dev, PTR_ERR(dsi->rstc),
 				     "failed to get rst\n");
-- 
2.49.0


