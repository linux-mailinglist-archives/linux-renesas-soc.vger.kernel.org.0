Return-Path: <linux-renesas-soc+bounces-7744-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97EBD9483F8
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Aug 2024 23:13:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 524972827B0
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Aug 2024 21:13:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3792216C69A;
	Mon,  5 Aug 2024 21:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JXC18KW7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D35C143C4B;
	Mon,  5 Aug 2024 21:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722892385; cv=none; b=S4XPuAn7lKOH9+CnzQsDodBhno5XWL2QZDNchdj9buepUbaerX5cxf/KrumJe/z2X9YJjZderJU1FaY84qgJCnFsVk8OnY9D3YOb91bNdx6iCkgKpzrrggN2IBvbTlcY7/hscmTw19++Ui9CWSN7fEa5PLe92+x1Rgs7LZNftKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722892385; c=relaxed/simple;
	bh=GKIltvKfS6leUBykxSmVYGNTPtz7UIjd8+lmcpYKYv4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fIfha07a/hAzPcug/hMsdMe6I0cVxpIxQsFt4xEhXcXIm4zCqW1oUkqUeSN72KrAELfvj7PyLrXPDw2nOhBaIfd8JrRTaiCQhyMg1868Kqv9LxotUTVg21Gh0nz3go0TnGJh5cT4lAJO8xCeCdWahZP9TSiFgis9RfpXaXZf1/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JXC18KW7; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-428243f928fso73649055e9.0;
        Mon, 05 Aug 2024 14:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722892382; x=1723497182; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9XnYk4nBJQkbEQGECG7D//tp8apD1fduAxJBFwjq4DM=;
        b=JXC18KW7nUiyf/w69ycEjuWU3hkL2ygKgIjFsb+raSNb+abSXIpjIDA9PaGykZZ0lx
         7zeGYLRFhNbWIxGDqOCzLidKjNLBqakUxixFD1gjih8M8oec9ut0PWkcVAFKuOMXKdJA
         pI9tq9gPVc1HArrMzMS+TK2riiirS/dvmWoMzcVxh1/CP5mypbXacFmwFDV73Qe3HUaN
         bgTP5r/jcigqvtHkBKs7HCRtwmXlsVzk5epDvx9dQEytoBgpi1Nu7ncZRTl8/dAvG454
         D+K8YHb+6HabsltvOMFAXsegfcbNga1xZieQpQY8P2S1Zx3d6vbH1sHAM0gkzc9hp/zR
         JDCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722892382; x=1723497182;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9XnYk4nBJQkbEQGECG7D//tp8apD1fduAxJBFwjq4DM=;
        b=Qtfv+0xB+TtJ4Y7x/EF4yTArlL+yb6vzCUOrwymBacm78K17W8zqaR0OcTImllqVKK
         bL/ObIgH/fJ4HVLC+WfzXMTk+juD6FuoqlC6aho6+szKZSkTCYQGFs35yGGKCOlz/265
         9+rTi0KOCIiRiMWWj4uMoEw1C0Sa4hJaf0YfFX2ci2U38VCW5t0z0ba4Soce/n6WXGMY
         yW7GLcQV8uxZMtUik1AVZI33f/fPYUuIBgaiC682no2EsX+7hbvzNe6pLVVhMN8cwCZa
         cC0QWxTdBiqdZfLwgIv/vOoToSyxC1skd2YZ+E0q9YL/PTXzwcS4dMvewWcCBnTJHFHh
         PzFA==
X-Forwarded-Encrypted: i=1; AJvYcCXR6kbE/11JZD3YHIC0kP8iswLZsJDArT3iYHknZfD/oKJCmNbBST2TWiBOn5wYOVMDO/xxFsDBJKcL//zWCWkJhtYhlxSn6GWy5qBmX2BAk0HS2U2qvGwBMHoi3fPaSPtGNHj5W3wmCDog73+Sp5OTjg/UA+0Qxb+Gw6AyS4H7ir5wBDrqJ6ZEDVuj
X-Gm-Message-State: AOJu0YxeKtMIDdOdSI3oAcOvA0SdlBau8r2ttFp3Ny1fe9wO81hdlkFr
	aHumZSIfqLqMbvPX4mO2CmlEACr/OKf/hhvLHtxnYYemJ8CX57fV
X-Google-Smtp-Source: AGHT+IF0MAkm46zVSrvjITVZskp6akC97LTpgOFj9SOtWvkG9u/cXHJXxqD1jpsnxB23mSTfiV0GsA==
X-Received: by 2002:a05:600c:4452:b0:428:e30:fa8d with SMTP id 5b1f17b1804b1-428e6af27a3mr115782765e9.6.1722892381373;
        Mon, 05 Aug 2024 14:13:01 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:25b8:5324:d26c:319c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4282b8adaadsm215391455e9.12.2024.08.05.14.13.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Aug 2024 14:13:00 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] dt-bindings: mmc: renesas,sdhi: Remove duplicate compatible and add clock checks
Date: Mon,  5 Aug 2024 22:12:57 +0100
Message-Id: <20240805211257.61099-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Remove the duplicate compatible entry `renesas,sdhi-r9a09g057` and add a
restriction for clocks and clock-names for the RZ/V2H(P) SoC, which has
four clocks similar to the RZ/G2L SoC.

Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Fixes: 32842af74abc ("dt-bindings: mmc: renesas,sdhi: Document RZ/V2H(P) support")
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
index 1155b1d79df5..92622d65f12f 100644
--- a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
+++ b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
@@ -67,7 +67,6 @@ properties:
               - renesas,sdhi-r9a07g054 # RZ/V2L
               - renesas,sdhi-r9a08g045 # RZ/G3S
               - renesas,sdhi-r9a09g011 # RZ/V2M
-              - renesas,sdhi-r9a09g057 # RZ/V2H(P)
           - const: renesas,rzg2l-sdhi
 
   reg:
@@ -120,7 +119,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: renesas,rzg2l-sdhi
+            enum:
+              - renesas,sdhi-r9a09g057
+              - renesas,rzg2l-sdhi
     then:
       properties:
         clocks:
-- 
2.34.1


