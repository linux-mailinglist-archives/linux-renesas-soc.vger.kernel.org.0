Return-Path: <linux-renesas-soc+bounces-18008-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D1892AD2A5F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Jun 2025 01:19:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B48CA3AFE59
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Jun 2025 23:18:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A27222A4D6;
	Mon,  9 Jun 2025 23:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ORVXOuJu"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 625F622A4CC;
	Mon,  9 Jun 2025 23:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749511153; cv=none; b=fSVryxdjH3WxBjWpVXDi2b5hDeUJHRwQcmwpZ3c2xLActbIMXGvc043qR67KGsk3hhixbLSNLXCMyCC1iAR5YaOcsrpwGT8IVBktYoh/LedOOW+ql9LDB5pQ4GLsn0bjlxJxcfL3GAEIXApnFGLmPNVa9XLfmM+hUL/g9D50w6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749511153; c=relaxed/simple;
	bh=XjeOFD7NHyYj2QssHfU8SMCjk6DVR57iKzCi5SGOLxk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l/Q/geHGsICHhSvs1OKhLFizpQKLnraYol4gDUNcQTtQ+bkW28ze06gIkB6lF42tPrJtO9opq1uhBwmLVMPffCwTcZC1ByU2xvL6IO+JilZe/lOoVLN9aAVqlK2RWb9uGV4kZf74tPpzQzzn/U6q6IeQ6jAML41TQ6puqHU8GWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ORVXOuJu; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a528243636so2854515f8f.3;
        Mon, 09 Jun 2025 16:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749511149; x=1750115949; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9vSVjvUP5pzFqCNMAgN8V1P/hYKkRfbNHW13r/UQoJM=;
        b=ORVXOuJud8nYIalI2tHvgR5dFABDwxvFKwCyLL06aK5QZt3+C3NIWl7Ka+6rib9m22
         Epaqh2889wqHXkn8uRrz8sA3kKyGP5mEkgV2cKYoUXHl2V9ezQVu7G5pUw0+yoOrqaRD
         hXp8N5pGPjpZwEfN8W4v0IJSZWItEBcsBvL0gmdctleYY81PTpg7ko4xoIdt3I8s3ash
         rN/2FGsvuODwBXWe+rfcfavTO8AQUHU9IBKhWcpkcx4XkcaFM3JIjLpmhZ2gl/xhq3ZU
         Mu+FN+0/170i0pt9CbEwAIReIxtyci++Xv2HA377kipn72qZXEYiR0baLL2hL2yBIxeV
         WwZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749511149; x=1750115949;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9vSVjvUP5pzFqCNMAgN8V1P/hYKkRfbNHW13r/UQoJM=;
        b=jEALl2ZTzzxj9xoeGKPnD/3MzqfwHvY3AxAoAZUBdhMkT2k6wULiNWci5AECvoV3vq
         Vb0ngbc7QGMQp8FjvkXxuNJmnL+cNndk1z/1+dmFNMYKiRSUJD2KRWetMwdGROnakwZc
         IqIT9sObMA2lCssiVpoRR/VU2XKCRdcxeCqjajAs7wVBm2IfGNY0dgNI7uzjCIHqQ6+A
         HIJEdGc/xCwLmndI/pG+58AIjcLy/hHIhy3eQJrCJlYqov+j96PtTrY+Fz0eKBVnBN6e
         lHTtTSU47OA1tankTGQjNJLVY/lOwrGyMVU46n6LrrzjKedU18Ar5FfomvKeDkueCQZS
         R0TQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0AmXh3Ln4qu7Zl0El9ehqY+WK0RTPcdZ6J5EvCpefcgYRpi4n4LUI4S4b2nOGxEcLRLevY6qLkG0U@vger.kernel.org, AJvYcCVEbc6t8Q35V5Z/FVMIJeL1ZjgIsUf+Sljnszfjg9U5IqyztqR1iXqbB0stdbRLxWVrc/GxZdDjXtI8TBEy@vger.kernel.org, AJvYcCVn1cTwQTWUXSTwFvFn45FCFz2cnAx5LvcUJboXSYbiI0t38EzP8IOnkeYOBW5h89j85dvUM3vczM/R7VZCx1T2eRs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6Suix7oeRcxoFj+tvCLzTJg1+qXR0XKwGVRF/GK5JvpIaxjBD
	1PYSIlGCUBNHKsSgYKJDOqNvWux1ktyIzBI/cJIgk/7RVuAMWC/7Ceu7
X-Gm-Gg: ASbGncvKxRC+oDdHjEM7Tguhdt3Y5cQ/Z8DzmditrY/TNh2xxuD007rdxKqCFTFcgLQ
	vQIJuoOtAxyx4KBoxBT+wkFEkpzccVWvmimXrmxysnJu7+UMjVtZop3qi98vVfvJOtQOcBC3FzF
	l6gpYEDY1sSLYrD7xbSeEP+mzh2ZFTHmjOuKFBxDV2yP+Ryr2tBNsMKH1c6GML1VTDo8Qt5W1oC
	nop2a4t/MMTGRTIEU4tdXHQKb6Ef83FDiej9RoC3IWTpcY0LrG8Z1qmX9L/tUjpd8Wq3DD4JcqZ
	kmKfSAP1uMLVH2ha4k2kDo1SQp4riXthD2euO0xxWU4Y51+lQHwsrLRKzL2fUFOcga1Q70+Y3Sm
	kJ+F1NIMnCV00Yau435hH
X-Google-Smtp-Source: AGHT+IHR0S6UKeu38kBall8nzPHP5mE6KK0m4w1kvD2JToJoXXZea95MeWR/Gq7+9AsDTW1rcc9hvg==
X-Received: by 2002:a05:6000:2482:b0:3a5:2848:2e78 with SMTP id ffacd0b85a97d-3a53188e2f2mr11635785f8f.28.1749511149486;
        Mon, 09 Jun 2025 16:19:09 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:3c26:913e:81d:9d46])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244f0cbsm10546543f8f.81.2025.06.09.16.19.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 16:19:09 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] dt-bindings: display: renesas,rzg2l-du: Add support for RZ/V2N SoC
Date: Tue, 10 Jun 2025 00:19:05 +0100
Message-ID: <20250609231905.511904-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Document support for the DU IP found on the Renesas RZ/V2N (R9A09G056) SoC.
The DU IP is functionally identical to that on the RZ/V2H(P) SoC, so no
driver changes are needed. The existing `renesas,r9a09g057-du` compatible
will be used as a fallback for the RZ/V2N SoC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../devicetree/bindings/display/renesas,rzg2l-du.yaml          | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
index 1e32d14b6edb..2cc66dcef870 100644
--- a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
+++ b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
@@ -25,6 +25,9 @@ properties:
           - enum:
               - renesas,r9a07g054-du    # RZ/V2L
           - const: renesas,r9a07g044-du # RZ/G2L fallback
+      - items:
+          - const: renesas,r9a09g056-du # RZ/V2N
+          - const: renesas,r9a09g057-du # RZ/V2H(P) fallback
 
   reg:
     maxItems: 1
-- 
2.49.0


