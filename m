Return-Path: <linux-renesas-soc+bounces-7523-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D62F293C334
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jul 2024 15:42:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5F1111F21425
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jul 2024 13:42:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B74CB19D096;
	Thu, 25 Jul 2024 13:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hBN6+fth"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0667F19CD13;
	Thu, 25 Jul 2024 13:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721914882; cv=none; b=ckxS13kQgYI5bqQodskljhPASK6X6tC41YaxCAHpWRDDV0Yd1JtKD+MxGPfIzfIf4FWI5q4zuBz+AlSyJDKdVLztASMVzZhWShgExRxM4DyLnepqv2/soGH4rI5Kl6zJDZahdq6V8xtivu/eG9thwniR4IqGY/oN2/ZB0II3VXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721914882; c=relaxed/simple;
	bh=z1kaUQhbZZqQVSii+w5FhFlwoHXyshbvDbliVG+ye4c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=olAJSJjggE0LU5mUGWwMwTdvCQ3+g5qRs5d1dYsXwdJ4YouwN/ojfeG/8UZ9/7VDUPBG/z9YhGKxkTDilv819IzD+Of27WdeAvYz3O/QDTwEsEp72ARMU0Mlxz7SGUpp0Wc4ne1dsGKXoMX1dM3Mg501lOABVIGAt6IdVpxPex0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hBN6+fth; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-367963ea053so681780f8f.2;
        Thu, 25 Jul 2024 06:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721914879; x=1722519679; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=km/iXQmIqBZkUmp3HQ5vTIe2HROlOMB5iF+IuB7CQ0I=;
        b=hBN6+fthvFQJCB/wLk/kKweXf0UEvhwZ9MBRztm6KnDg7zdKFWJ/gYc64rQsooEFQn
         YdXjRAQWKgDE7HCADvnfTGMJuDh2ZxvM2SHHfM21DeZg8ufjz1C44DODk0az29NA21zf
         zx0ProvnzggFB3uM+EfM98sweUvRKeheTal96eND6q09VAgB9NDXxJVv2PRb8gKFqHWD
         16L8+5loM38x8gcA7DUcuuR6hgeljmE0eRmmbfRtH/BhqSFlflfjXTFbQKIr0AhcXp/w
         n7JMrK4ibirGhubSP8WkUxH/3OAhhmvg5stTSrZyb+YTQFBPcdf10NA3p1hdvpDw7Bmz
         bJdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721914879; x=1722519679;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=km/iXQmIqBZkUmp3HQ5vTIe2HROlOMB5iF+IuB7CQ0I=;
        b=phST4mm+y8gBElPjS0hz9twvlQyl5dO/VREHx5jXyKiFewNln5eOW/ZjEpE9rrPskE
         0Wc4t+fTQgYwHN7l6Yq4hATXxipXK5q+kFBMMJORoqCvZ0j8LXye1z/Xa90OmbSis3X9
         iMa2q3hREWjoNQHUemxa6/Tc3l/5HVB1IMo+x59Rr6feo+EIgrLDEClo10Dw5FfV5KBC
         Y0wdnPthIIQLdAj3MDoatFFbLFRUUa7UJn5ybQysh2nZ/IIOhuwpkzSd0Ac7LlqHrkK4
         jpx6ui+JYffrAO/NzP5cJ9dCvJztn/vA7CvNhi4DtBbIl98KgMNv5nLvuHuLtaT/KWZJ
         5TqA==
X-Forwarded-Encrypted: i=1; AJvYcCWjTB4uPY6ImKuUu7sRTkyOAAzEmyyLjxi+0yO3KOXhXJdod3Y4MTNZhk2yRjdvPpNd9lMw8qShQpBxLf+aW0JbNMcuBlZ5rbuBC/h8g2uwKTkRSLwIKTRNxlWz4cNsFDHdcsdx8gv5ug==
X-Gm-Message-State: AOJu0Yx/3szwj0zd5TaKqsKo8QnUnaL/EOdO3FIEbq8iKKwlK9KtYE9f
	5R2B08TYOZ2Bicljc1qc2A+aZ+T9xByDpL/iLX+75ROhei5mdB4t
X-Google-Smtp-Source: AGHT+IGPg9YybdoX7hYbruxxaggQpenuR6wDKRBUZhwZ9SeZ4QZG0rzQYYEHL7U4dKCxISC4Dx0psw==
X-Received: by 2002:a5d:457b:0:b0:368:7ad8:531f with SMTP id ffacd0b85a97d-36b3643c9c2mr2211316f8f.42.1721914879405;
        Thu, 25 Jul 2024 06:41:19 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427f93e605esm80447085e9.34.2024.07.25.06.41.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jul 2024 06:41:18 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Marc Zyngier <maz@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 5/5] arm64: dts: renesas: r9a07g044c1: Correct GICD and GICR sizes
Date: Thu, 25 Jul 2024 14:39:32 +0100
Message-Id: <20240725133932.739936-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240725133932.739936-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240725133932.739936-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The RZ/G2LC SoC is equipped with the GIC-600. The GICD + GICDA is 128kB,
and the GICR is 128kB per CPU.

Fixes: 3a3c2a48d8c6b ("arm64: dts: renesas: Add initial DTSI for RZ/G2LC SoC")
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a07g044c1.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a07g044c1.dtsi b/arch/arm64/boot/dts/renesas/r9a07g044c1.dtsi
index 56a979e82c4f..18f092c4090c 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g044c1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g044c1.dtsi
@@ -17,6 +17,11 @@ cpus {
 	};
 };
 
+&gic {
+	reg = <0x0 0x11900000 0 0x20000>,
+	      <0x0 0x11940000 0 0x20000>;
+};
+
 &soc {
 	/delete-node/ ssi@1004a800;
 	/delete-node/ serial@1004c800;
-- 
2.34.1


