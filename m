Return-Path: <linux-renesas-soc+bounces-18447-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 329FFADCE1B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Jun 2025 15:49:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9E6A43BBDFE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Jun 2025 13:46:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 599362E7F11;
	Tue, 17 Jun 2025 13:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LaD6bAFC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874D02E425B;
	Tue, 17 Jun 2025 13:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750167913; cv=none; b=h+euj4TFvNFWmuYXidyuYURwCXUWMOqmWs0KtvQSLI5rXXFV7gXGVWAeciL2QKixGOL4S/rreViIzR5e88yOw4UZSSqg0czlqICYhWlQe3ad3kveWLM/FgiLbK6+EFoM/K4d+zFSMdEJJGYVa0d0ja4h4JeVE1imxbS40WbvQ3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750167913; c=relaxed/simple;
	bh=YpEiNFEaBVckSeb9YBuOTClHD/pwWP0CyEjZlUPflu4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hDImDmTAwzhkRDccd7pyHrzkGzzovjROR/JOQylIN60IAfJoNSz+EVWNHHZpSU86K6PlATbpQ6LqANgbeVdaDFgqGjZwHMvN0dAf2ZvAv0TN9LSB/s3qubKi/cIDVIs00DwKFYaBUqeG9V/atuqWbeWK2Vv3OFABpcLHLL6HfSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LaD6bAFC; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so64317505e9.1;
        Tue, 17 Jun 2025 06:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750167910; x=1750772710; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5h9k35W8VUkZ64zZtOtJ4NycMcBJ361EMKMeseKsgfc=;
        b=LaD6bAFC90A3ux8uK/2wjIWMAB8mbnfGplXKV4Ls3aqjOJEqF0HI0jnM1G5cm0SeLE
         jeWnyqgQ1IVVTu49YNF381T8yIIQdz0ULnkr3Idoh9z+F6nEVbOrZWrIv4SjmYe8wLli
         wXXeqSwVbB9pqAhsdq/MpX53u9NqaIjZUaRvyHeVO7dYdWSpSoCKJnqile6URIf+hLTq
         bLk0amCI+kX724g3GuIxlMQHgo2WCCkslH/ICwSsyGiqSuhhWFDowKnBRQOmaMfMLxwS
         WQbCOEdv1Gj8kYLm8Dikq743RAeNf50FoD8gqV8jcII2KlIs+HcTaJpGtJ8bYPSGXSPM
         f+pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750167910; x=1750772710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5h9k35W8VUkZ64zZtOtJ4NycMcBJ361EMKMeseKsgfc=;
        b=mZ5Qg/mHXB8CZmMM+YZSYdi0zHZxtVeFPtqhSmtB/l5TXmYYA8NQOT4Q8fIDbpNhLg
         28kLD2n3Cf9H7drsDkKR8CrKsd3lxUXqXEjGaofN/Wg5lXQb8zp9/9iSzHuuQxohKDY9
         t1Id1pNdyqWXW6mcH/Eh1k6G7t8Xlanjc6UwKamNvsljVeA4lsjbJDf3Qe/vVW5YeB1v
         1vZPWe1eN3SKEMY4NhjP0tK4+whewt2NTu4NUGu6wZURBNexDs8ndrOHw/iqRXXeV2d8
         /GrFGsW9YnWMs2w7h16qO1CtDUgL5PPN4IX+mPeaNwuVd0o4q7N8bLMAV3nSpeJCglQ9
         P+pw==
X-Forwarded-Encrypted: i=1; AJvYcCVNp8ozbX4DuPN7fxd347er6KdKCmHZvYN+8THURURTqsnn+4IP5yNxwzl2uQWiQb5/Q81rebyZbAUw5IQ99liiqBQ=@vger.kernel.org, AJvYcCW8ihl/Djufg06EsKu6suXmRaERecRUeF7HLvj2DxkW/I8WIQ01sxMnRDCmg53eGIWV6Dr+4KpqdhtnZC7P@vger.kernel.org, AJvYcCW9kiY1Wzr9tpeF7hJ9xdwT/nnUAopWlpKxRC/VrfvuE7hAlXX0uLFMF/CTX9p2pEOK5L4uThNM/QlF@vger.kernel.org, AJvYcCWP8NXkRLQ3evn0vfzgcsC9q+jjukr967VluEGWKq+xdoRa/FeRHsVs7qBoKM6lo5AUx6kEpP01oOwfxWUG@vger.kernel.org
X-Gm-Message-State: AOJu0YxkkZqUgO4NNmObeRC78xfJtsgR6jlR0gFURKsv0K3rXvZpYB7d
	k5SDV43AaKhUWgd25nbFZ9QTxZxON7WTHUZdgM+16flJ8NaVF/S7wv01
X-Gm-Gg: ASbGncvQlU9swdfFdMyaWV6DHI031si+BZulM98GuUzvVCerQYmbXrS5T4J9sJT7Sxv
	YnGiKMS86tfIWwUVyMrFrYmX7U562FjuenmF5GICGKqbM8B6gv0QuWJMoO4f9GQnqW4olw0l1N2
	GU/fnxS3/AHEFTaNfzNxi1SoAphoHvLz5h7qmJPIVMNa3TDVw59zLRzK/iRgqV/o/UhAc5iH+bo
	oF3NU0jvIOTWD/Rh9Z3GHFRkrjB9CBwUlKvXBPNfgsmg6WImQmioBVWtdaHLRITLI96bPQP5OVF
	gK11YejAty7OxtZlVhE0oUazwZr08o9E7X111YO+qy+3xYNgiYU1u4EOkoQsK2TMRvPDhoQPapi
	tWqHy85vr23Q=
X-Google-Smtp-Source: AGHT+IHrFwv0zGTdQiCUWhPQoi5s2M4Vk3TK1s6lXyW205P9aB6tfhvsg0QfD5fzGErUUi4TPkOybQ==
X-Received: by 2002:a05:600c:1e1d:b0:442:ccfa:1461 with SMTP id 5b1f17b1804b1-4533ca6ace2mr138962895e9.13.1750167909601;
        Tue, 17 Jun 2025 06:45:09 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:a081:30f1:e1c7:6f28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a54b7asm14239728f8f.16.2025.06.17.06.45.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 06:45:08 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v12 3/7] dt-bindings: serial: renesas,rsci: Document RZ/N2H support
Date: Tue, 17 Jun 2025 14:45:00 +0100
Message-ID: <20250617134504.126313-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250617134504.126313-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250617134504.126313-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add documentation for the serial communication interface (RSCI) found on
the Renesas RZ/N2H (R9A09G087) SoC. The RSCI IP on this SoC is identical
to that on the RZ/T2H (R9A09G077) SoC. Therefore, "renesas,r9a09g077-rsci"
is used as a fallback compatible string for RZ/N2H.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Note, this patch was sent out individually [1] and is now
merged into the series for convenience.
[1] https://lore.kernel.org/all/20250609192344.293317-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
---
 .../devicetree/bindings/serial/renesas,rsci.yaml          | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/serial/renesas,rsci.yaml b/Documentation/devicetree/bindings/serial/renesas,rsci.yaml
index 548225e509e5..f50d8e02f476 100644
--- a/Documentation/devicetree/bindings/serial/renesas,rsci.yaml
+++ b/Documentation/devicetree/bindings/serial/renesas,rsci.yaml
@@ -15,7 +15,13 @@ allOf:
 
 properties:
   compatible:
-    const: renesas,r9a09g077-rsci      # RZ/T2H
+    oneOf:
+      - items:
+          - const: renesas,r9a09g087-rsci # RZ/N2H
+          - const: renesas,r9a09g077-rsci # RZ/T2H
+
+      - items:
+          - const: renesas,r9a09g077-rsci # RZ/T2H
 
   reg:
     maxItems: 1
-- 
2.49.0


