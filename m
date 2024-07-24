Return-Path: <linux-renesas-soc+bounces-7482-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8AD93AF55
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jul 2024 11:49:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3D5EEB2242A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jul 2024 09:49:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0BB5153BDE;
	Wed, 24 Jul 2024 09:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i2221pOs"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42A0D14B973;
	Wed, 24 Jul 2024 09:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721814525; cv=none; b=SvAo89T0yl4cBTytJi9z6vaop+GMf/6SpUvXD7V8gMSuP75ILOBIvo8huPJiPd5+JSxOQnQuHCCOLyU0Ru+q+k++1z304r3499JMhH1fMzOvOu42SDBXlKAoX06EGln71N14TVFwCsZOzDFmbXQ/uyerPxOuaKczv5vjSoDnpIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721814525; c=relaxed/simple;
	bh=xWRDdJOpwiXQ+wc1zTXTtD0qbZtLq9dTMSqPvfevNDU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Pc6TR9q8Bv0npu/Hbd33h45Lvu6NRjbgFfXQ5KMipjWeqGYFeG3B73QcBM9twymm+s1zMj3BCuIDnn9v3aSo9niCGmJqlYKqZ4oYW/j9uj/UYEtHn4pKx9AKL8nCQJK7/cowYtvYZf8sNwh/+KH8iWCzR10SnvmaqTHzW4nMtDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i2221pOs; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-42122ac2f38so4060395e9.1;
        Wed, 24 Jul 2024 02:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721814522; x=1722419322; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/+zn81+6Thsh6YCj8FR9Vi+wvfbVwvNwq6fjUlIA0lY=;
        b=i2221pOs+4LdN3Dx/BGuhFuN9YllsLJNKam//SVS10+tSAXHKTkEt22VOVnI6X+kQR
         03OQuX6PuUFh/gvqZ1cFa6iMr+jLw+xv6/L9dmR3YPwKMgvd33bKMCQIdFQrFQUgUOXk
         4F9iM/oXQYlNlCY/PopqjmU9NaTFL8kYSHGCNgL3nnaHf9gdHGRXheGS+sd4RtHEMhUW
         XCQI3srCXZVb+qw3PFx11SL5bSfZ11Eei/F0OW7rf/nBS315mmXSsKWmnZjDKzIEojRW
         jG91pizM8eIvwsK85g0MJja5aVzgX6UBw4ZrLVR5hlRs6A2Yp2l5KDhVUWKRBHnbVFaZ
         Y15Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721814522; x=1722419322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/+zn81+6Thsh6YCj8FR9Vi+wvfbVwvNwq6fjUlIA0lY=;
        b=Po4u3J46yoTFO41fibhqDDVw38J6h0h4OFMSq2nRelET3NDOD2xPqGCfDNE423mAgf
         LCWaSbnS2yWZ4HkkFlVVwToz9mjugjbYjyjrjIEWqENjEIik0WvvaUpwRE0f+8+6MnzJ
         5GHfK3S5iPJWpa+nPF209zzDFvaLoJzuSleTBZxgroKEpjcRlWEiSQ3CzAyNzwlh4Shz
         VVRDh2wniFvOAb2H+N92w0duQ1K197X/SiHZelf7EBLNTvyUkAG0d1l+4ikU+3MKWUGy
         +8qmwMRmvjfhKTYMtz1Ph5fe9+4PySqvml2f1kSoif4/EzX4vEwtPWx7gfMWbjk+T23m
         hEXQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9SWMbmg1L13dAfQNt2h/okAglEo1YccWdd+p7AjrO+wKt5DKDUE/oswUaG2fMRqN7XZmuS0Ai5r36uezNPq+XfXoi2K4oky+FNsvVlLRydEP6FGKc3ueRIHoR+aRN4tCdwbhMv7QAEg==
X-Gm-Message-State: AOJu0YwJF7jqrj7ES1w4iAc6BY+R9+GcKllLHjm8QeF5g2IvwUyabGl9
	xefXfVzXsnj+Te+0BLarV1VLphxMncU2GFMCipVagqrE1Zh3hV4i
X-Google-Smtp-Source: AGHT+IG0ROd3dWy/M1+aQ7BXkXdQc0ihyAWDfraP0uE6LS6LGpRztEOMRqPaGHeOtEKoPMFVTC68rw==
X-Received: by 2002:a05:600c:3b16:b0:426:526f:4a1f with SMTP id 5b1f17b1804b1-427f9a19fc3mr9996865e9.16.1721814522596;
        Wed, 24 Jul 2024 02:48:42 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427f93aae47sm21328195e9.35.2024.07.24.02.48.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 02:48:42 -0700 (PDT)
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
Subject: [PATCH 2/2] dt-bindings: soc: renesas: renesas-soc: Add pattern for GP-EVK
Date: Wed, 24 Jul 2024 10:47:07 +0100
Message-Id: <20240724094707.569596-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Add a pattern for the Renesas RZ/V2H GP-EVK board.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 Documentation/devicetree/bindings/soc/renesas/renesas-soc.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/renesas/renesas-soc.yaml b/Documentation/devicetree/bindings/soc/renesas/renesas-soc.yaml
index 5ddd31f30f26..3e93e0c73ed9 100644
--- a/Documentation/devicetree/bindings/soc/renesas/renesas-soc.yaml
+++ b/Documentation/devicetree/bindings/soc/renesas/renesas-soc.yaml
@@ -37,7 +37,7 @@ properties:
       anyOf:
         # Preferred naming style for compatibles of SoC components
         - pattern: "^renesas,(emev2|r(7s|8a|9a)[a-z0-9]+|rcar|rmobile|rz[a-z0-9]*|sh(7[a-z0-9]+)?|mobile)-[a-z0-9-]+$"
-        - pattern: "^renesas,(condor|falcon|gr-peach|gray-hawk|salvator|sk-rz|smar(c(2)?)?|spider|white-hawk)(.*)?$"
+        - pattern: "^renesas,(condor|falcon|gp|gr-peach|gray-hawk|salvator|sk-rz|smar(c(2)?)?|spider|white-hawk)(.*)?$"
 
         # Legacy compatibles
         #
-- 
2.34.1


