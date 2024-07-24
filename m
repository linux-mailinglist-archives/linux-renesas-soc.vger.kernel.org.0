Return-Path: <linux-renesas-soc+bounces-7481-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D905A93AF51
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jul 2024 11:48:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8A7272821DA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jul 2024 09:48:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69B7615359A;
	Wed, 24 Jul 2024 09:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZSqvSAeO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C319D17E9;
	Wed, 24 Jul 2024 09:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721814525; cv=none; b=td2f73O167BdOG/k17AqXcPOeEArjqgHGthfWhGVG+35x9LlyjntyFOD/GAffxzl3VyrS+RkrKhrweavcKKXCHlp7oryYf+0Hzq12SWJDyOartcQhmWeVsskoCgN01lL+QKUVX6FcrtFKHzc7o3TPeKa8CHXmgLW0OdM6kGcpN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721814525; c=relaxed/simple;
	bh=51kxNFmvjuIchlWpbYukpNBUslSWB5r07WpBl69opRM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hYYp42YtCGRmdlhWcTGsYWDcqTif+4l8gBMF/taNFewgBvpMnjJ3DI4hq63DZA8NW9ZAndl67b2Nq+Lagh72xfc7cvC2NUbXGYADKR6D1KI58Ks3QFvoeShU3WlbL8QlYwzpk/i1QFXKdFWSc5/2ZOYNeFxRg+eLixVS9kBX5ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZSqvSAeO; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-426526d30aaso49259515e9.0;
        Wed, 24 Jul 2024 02:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721814522; x=1722419322; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wBdTZvdNFVphClPxDMOgGh+KFljGD1Sz2r4UZNXhDRY=;
        b=ZSqvSAeOE84z14KXksMqmocMLndkdWA39RwrjZdp2ySbFNpLngpQX/JWiTKk+NqWZg
         SXyjNuFRTkJQxjVEVJBAvJP99cbmClgV19nvG0/+m2VLHkfq3y8eJlT44zOUbfIgJay9
         ai5xdSYV5PN3QCipXPUbUltI6a8d24kfy7rlC4JO3xRqODdg8qR6wEhk9TwnBB8rTru/
         wC91nNVK2lmBPo4hkotw6XIb7xiKdsixMcd9WnZQDBdkrran5/PkHptMo7CNGyt7Ezkk
         W6ROdqOrp2ekWx0bBZBONZyu/uAY59I3nbBPTFPzkvf2w/Ym6c0raBEa2I6c2kz8II+T
         UwOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721814522; x=1722419322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wBdTZvdNFVphClPxDMOgGh+KFljGD1Sz2r4UZNXhDRY=;
        b=jGg80z7HkDMyJ3x8iCcFo048FDdDHLX8gLHlwV3E8EjHqLHMF6a7V9Gh/LW4KYZc5U
         RIEuV8YUMV8lfVvJIioAWABKP0MfRomImy2PCAvvNZ2agsyUfXVrVFCNu6E7m48v5PVF
         Et3+T/rvXEygUCTLWI5TNsRrT5jB/sw5qu3+X0njfRGDhrJ96SA9Ol2fAl3K5wLMPN9+
         HggHIYjf2HTwIdyDGWgPqJgF5ZonHhb8wqET0sDDjggIhThxR2oHuHmvAep2QJenp4UC
         55zs+Gp7aHHG6iLM6Y9W3WdVWCwBSsIh2y1RTRmBNbE/QlZ/nB0CltFRYUZ+C10xxeGS
         AXYA==
X-Forwarded-Encrypted: i=1; AJvYcCVYr1qhj1oj1fZkfJE1fWc5Yt1UypupALjl96WSdxUBCKtMH+CIxFHEHIMTF15ZMBcSyQ35Oyhao8j2m/aYjHh+fr7QpPsIRbKng0Rdo75nqwjIAiuIOwONT0tN1abfcNJu+QwK3HcZiQ==
X-Gm-Message-State: AOJu0YyOJ3aSlM5jUfk7IQJY/hqHd5AOXUmSALyrVik80F8Tx7+W0C/N
	EBdNVDHwFEltapCBh8YaqwSG52Y6HB4FJQZZTxXKFM3y2qWRKnTX
X-Google-Smtp-Source: AGHT+IGG4nXH9n1wtOQVoSrvqsSgdPUT23H9/84b5FFaoF6GxbiUcz5hCXE+2WRCRrGXfJcU4KxLbw==
X-Received: by 2002:a05:6000:18a9:b0:366:f994:33c with SMTP id ffacd0b85a97d-369f5bb4d48mr1278016f8f.56.1721814521724;
        Wed, 24 Jul 2024 02:48:41 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427f93aae47sm21328195e9.35.2024.07.24.02.48.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 02:48:41 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 1/2] dt-bindings: soc: renesas: Document RZ/V2H GP-EVK board
Date: Wed, 24 Jul 2024 10:47:06 +0100
Message-Id: <20240724094707.569596-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240724094707.569596-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240724094707.569596-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add "renesas,gp-evk" which targets the Renesas RZ/V2H ("R9A09G057")
GP-EVK board.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 Documentation/devicetree/bindings/soc/renesas/renesas.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
index 09d3ce97efa2..5d2f7e22f9e1 100644
--- a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
+++ b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
@@ -515,6 +515,8 @@ properties:
 
       - description: RZ/V2H(P) (R9A09G057)
         items:
+          - enum:
+              - renesas,gp-evk # GP-EVK
           - enum:
               - renesas,r9a09g057h41 # RZ/V2H
               - renesas,r9a09g057h42 # RZ/V2H with Mali-G31 support
-- 
2.34.1


