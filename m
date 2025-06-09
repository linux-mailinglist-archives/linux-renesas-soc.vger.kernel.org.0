Return-Path: <linux-renesas-soc+bounces-17986-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C2CAD27A2
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Jun 2025 22:37:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 89BEB1702EA
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Jun 2025 20:37:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E49E22154B;
	Mon,  9 Jun 2025 20:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nG3Gbh14"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5FE21FF20;
	Mon,  9 Jun 2025 20:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749501422; cv=none; b=kRF/2f3BHnWgvNfobk94kN0zC6qCaulVFqFZjFMNrYZYl2q7PsyoFZ2ZJd2nPxd0/vXmiT737ZCy9l1BLU590RkggAKH2NZityjqTQinZSzLY8io0gkm4UpmQyhN05quGuMtxjSAwbfnVBpyjBbkCZowoCsn3lNG693sgZpsaQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749501422; c=relaxed/simple;
	bh=slxTGVuNIzOpqtqOeQubTtfXeQoBsqXiqTHhbEQF+Hg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZWUSuwBYzMaviQQks7rjvsW++5iKxUZp2hyvSQMK7HYdf4xbjuOzM4V0F8uQRzU0Bp4gK7m5ealJU06+nwiHyKj6o6mp+uS0xk4fdGxzx1cbOafFQ0rD4Yl5oqrZDr/D9HVi5xbkDUwAsXoxMMCHfXckFYGkZlwo71Hx9304pSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nG3Gbh14; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a54690d369so1370955f8f.3;
        Mon, 09 Jun 2025 13:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749501419; x=1750106219; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xddpRQdDhe/Q49yiOP7tp/hqKE5Cns2OTNMvWmI4Kcs=;
        b=nG3Gbh14ZYPxdBXDcB0Q91fWWI/phlYJnALAOj6jzF8+o9mNO4EH4y22EPwFdNI0h8
         N+u73+x7zEuR594lTWX9CAE5RgDR4VLJ31nQHv7hyw4n771D5H1Vm3bIVPIo/pi5id2q
         IPL1/1qgkAn1F+T69bMnuy5HJNgs+7O1AxBrRJK0cpUac554LW6C162HOnliJ477T/Eb
         cXZ6IcTDsmJOx2HM1sfCjKkVc0jEoZYWwcSdUcinqtE2icjuSq+rdLqf2cYcljeWwIEf
         nH8HWHB3aKNjHp+GdiXPsY7Un/5Xu3GW4DSDJxXkc3HcFiSkAlWX4RDXijIn5m251k+6
         1MRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749501419; x=1750106219;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xddpRQdDhe/Q49yiOP7tp/hqKE5Cns2OTNMvWmI4Kcs=;
        b=q+xkbpC3mor52j/JBD6mqfFyVVR3DsKZSHFLLyLB273rwsXf+UU4bG+4N5l+mpOQ//
         diWrpe7KWAq/6SUj0fPTdVjEYSKMA0YOjMBiPIHpPibiXMQr5otOMa5MqadupuoF7rr3
         xv0QpBfJ6Se9teB2IV4LM8j7qw20egmxXdvqepHGRX1tqLfcERDhW0Y7P6bH552o6whU
         Bd8+p74Uw2cK9ivVlMiPVwhsnAHR0e7BVAhWo+G9Hm5bkYZMNwcGhSlb4jLvhRIBwyUm
         9yZRmuW4sRSIZZRJTZi49jULXOmBLkRzFtg3UNNot6uUuhAhgWDAagq4LnTzFidHWGB/
         Sc5g==
X-Forwarded-Encrypted: i=1; AJvYcCUQ7qZCgBfCbhNTTjOeRShoshWohvP1oTCeh46eIzizkF9vmAgNIAif95tGfssdQJMPdEbYF1532da8sp29@vger.kernel.org, AJvYcCVecYljeWS3tgnKTfFo3sHBOPmgkT5FXgm7LwuDr2JJt33BZOHfFyBSfwn4+FsIxZK33+Gs63Dlk9Xf@vger.kernel.org, AJvYcCXYxRDh3OJv+NTdGNcmDBJVGJ/v+BMJSdY85FFc9v39dXtPGdznDu6Ba/aVYDU7mTnHwsg1KLkVOwN9@vger.kernel.org
X-Gm-Message-State: AOJu0YwuMD1LnEsnW2hJGPJSrng53v58L/s8XA2hLfaNlf9sK1aO24DT
	HqgfpIt9WvB6t9EueMZe5690N6u9Ckp1D74UnL/qlHQd0GwuW7CZujVb
X-Gm-Gg: ASbGncseS4vbS9irQ7WYbn6F2djezhJvh4O/FsE6mq+iCALrhLPGwkIhWnNV7tDQrx/
	LmUocN+TAr9bXLvBOG6OoRsOJRh1JwwoXdFJq4OYSkQkHA16DsmtP1v2SL05hBbxz7zOgXJVFpc
	ygnzEY3/7pC0p8w2xNfd2sCtpAY3+YzhB5aPAqIlJUnQP+JT1b6Ao7ErXNOKkHJ6mHQs36aGb2X
	yBOa+fg1irZkwdlRrRAasaneCuaHqEsazgLTmD8xehsd2hLKAMKDVmzazv+JB3ERxyxvIsk1D37
	0b4Dpn7JbNQwZX2zpbZSfuXTH8AsfztS1wA/KnwyMtRzy5sB+cEBP6vTbj2heYUQn2E5WCtR9Tt
	9OiEelXFu9GcW+DJyRBw=
X-Google-Smtp-Source: AGHT+IHeu/2EKqNWF7FBUgyNQc5QGX4saGu62dPpS8CJSsIUqstPZZ1d2V1IRbKeJPkkXM7FFIaaFQ==
X-Received: by 2002:a05:6000:230a:b0:3a4:cfbf:5199 with SMTP id ffacd0b85a97d-3a5319b69fbmr10955935f8f.9.1749501418689;
        Mon, 09 Jun 2025 13:36:58 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:3c26:913e:81d:9d46])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-452730c73d2sm118240345e9.30.2025.06.09.13.36.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 13:36:58 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 1/8] dt-bindings: soc: Add Renesas RZ/N2H (R9A09G087) SoC
Date: Mon,  9 Jun 2025 21:36:49 +0100
Message-ID: <20250609203656.333138-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250609203656.333138-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250609203656.333138-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Paul Barker <paul.barker.ct@bp.renesas.com>

Add RZ/N2H (R9A09G087), its variants, and the rzn2h-evk evaluation board
in documentation.

Signed-off-by: Paul Barker <paul.barker.ct@bp.renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../devicetree/bindings/soc/renesas/renesas.yaml       | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
index f074b5c35c6f..af715a813755 100644
--- a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
+++ b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
@@ -602,6 +602,16 @@ properties:
               - renesas,r9a09g077m44 # RZ/T2H with Quad Cortex-A55 + Dual Cortex-R52 - no security
           - const: renesas,r9a09g077
 
+      - description: RZ/N2H (R9A09G087)
+        items:
+          - enum:
+              - renesas,rzn2h-evk # RZ/N2H Evaluation Board (RTK9RZN2H0S00000BJ)
+          - enum:
+              - renesas,r9a09g087m04 # RZ/N2H with Single Cortex-A55 + Dual Cortex-R52 - no security
+              - renesas,r9a09g087m24 # RZ/N2H with Dual Cortex-A55 + Dual Cortex-R52 - no security
+              - renesas,r9a09g087m44 # RZ/N2H with Quad Cortex-A55 + Dual Cortex-R52 - no security
+          - const: renesas,r9a09g087
+
 additionalProperties: true
 
 ...
-- 
2.49.0


