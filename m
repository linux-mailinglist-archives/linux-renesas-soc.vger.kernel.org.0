Return-Path: <linux-renesas-soc+bounces-23027-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4024DBDB008
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Oct 2025 21:11:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E5FE619A0716
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Oct 2025 19:12:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 177732BE7A6;
	Tue, 14 Oct 2025 19:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MoNMO7gE"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70EDC2C15A8
	for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Oct 2025 19:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760469100; cv=none; b=kj+wWznRyLrn4BSysN9ZuU7ZQshEIkZY6UTrHZ9dsvGee5jmuhK7ricSdj0oxo52QXn6FWzjTX2v4raHeOkyo1PouqD9BerUhQnYx1tSOHqjYGeI9yr8J631Bj1FPuAV4LO7yhahug7A/DfVwDmAgH7TGDAh9sapgHEzcwjsfNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760469100; c=relaxed/simple;
	bh=S+PaKb4dQqXhsbGRU/uKTbWTAhncSD2zvQfzn4XNbaY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iqEDt2KjaZNYksJcKPdPWPHmWzf572/JkWBMAbBv2wevyqFZtrQIquXqoQrvs93cg7nBwC+vXoUyVtpfWLREblkgjO9qCzg4O5cwNMISBpsbPvcqcc2nMPibV1gJQ+3s5uWdLUFh2iIL8rMFDF0u6P6e9ug+j/nXBBL78rBV8/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MoNMO7gE; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b593def09e3so3886016a12.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Oct 2025 12:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760469098; x=1761073898; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jwe7YXxDoU+cIzHCYhHi5EBndZPOQECM5/AlfPL09Ic=;
        b=MoNMO7gEFJpfhT0fJmnqe8fE8uaO59YuIZXtSdoDHDb208twu/1cJnqPqcQmbMgeY5
         Ay2x5mueKrDvQV/O6w/CdmdTI/qTDxgxb0UXet9SzD7Gd6brvIBcnHjzzzZcA9HxjyA6
         xwPKXa6KXrLccKYyKTjHG2TlF35Z1kupvgWOZXoJpvC5R+J6mai3bTGfOTdSBqmbLZSL
         FDzdkMBd661JSRZ5EuUhWw8lZweWNc+pd2bulKZ/v6OBLG78ix5bD1ozJ1N1d0/1984q
         WzIeF1holATdocVUwNfrNfIwBuAnI7OWENnKB5s1PNORwvvvS12uNhK/QZ9x3l+XZy5g
         1e/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760469098; x=1761073898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jwe7YXxDoU+cIzHCYhHi5EBndZPOQECM5/AlfPL09Ic=;
        b=leB9/JMXAn38VhwCRsUABO0tc3XLHXRdNbV94c1hopMJ9pi7JFuJNZtSjqiSLVcw1Q
         99nbLu8n0cDEalDm9Uv4QbIA3B7Q7kLP1eeRfqlloIY/EWQNCrKNcImczKw+MkL+WOP+
         uYoiP5TqGwDcjW4n9FZp8T7wbPIR5C+6p355/8IGiP3W2HXI2pIfS9eE8LwAofuS07By
         WMKlqCv361I7/4lFLWUeieedZxafYT94pCRvTrgLBXXZCrWL8O9fl0B3cJ/sqnq9yeCV
         Xe1jgqSei5lKfD3l1PGVfvyecRw4qdyswrV9AxYoVi2meNfpqIwpDraSH+7nbuwzfn1U
         DtGQ==
X-Gm-Message-State: AOJu0Yyi9i0ZL/95HUB9VH6BKCRxF3zA0JocuYCtitaKfCaRxrYi5GU8
	jBIE9JNqYXDz0QD6yyZ9gVobs3+v4Kq83TJPLYnQ23bPJqCMx1e4Jnj4
X-Gm-Gg: ASbGnctrFPdMs6rGG16bMXy9F5U/1zuxaO9TeZ9mXVh3PS4uD3spbDst1zyG7R4gjIv
	GRq5arb06J+K/5RvralEmAmtd4DQFR+LgsfuAFMF3tNwpC8cbUZDKxjhBHF1Vbv3Euh74FlIm/E
	jrGnw0K5qfg2g/QsMPct9jINxraPJ6FYVhqqCZGU3gWntZsnTZCgwasFBtt9uLpjDKbSJQpPxbr
	kHHo3lukCWdZcZNqtFmgypFM3RqtptPRdVzSFcLKqQvvxe99CgPB/FvduRLScFOamutwlQX+ilw
	L4N7VMJjFmIPk8dfx/8iy1sYAqSZeQKUtMxJ+q8ytD+384JVDR+AdovSKWKX4AGXDjehdh7SUNN
	TKvJXO7PAlwTQltS7uTilO1GhCXgXUAvCArnnlMzYwGNeWTLLANdS+2HkXX+magpCQQ6MGQM=
X-Google-Smtp-Source: AGHT+IH6L9b+RAsdBPIs/9RaZ2biO3IFLWe3hSdfFmc60wanjgFfuMqCTaW562R6ttOdauQ5UDfmIQ==
X-Received: by 2002:a17:902:fc4c:b0:28e:a875:f7d1 with SMTP id d9443c01a7336-2902729036bmr315973415ad.10.1760469097611;
        Tue, 14 Oct 2025 12:11:37 -0700 (PDT)
Received: from iku.. ([2401:4900:1c07:c7d3:9987:bec4:a0:deaf])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034de658bsm172402755ad.22.2025.10.14.12.11.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 12:11:36 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 1/2] dt-bindings: pinctrl: renesas,r9a09g077: Document pin configuration properties
Date: Tue, 14 Oct 2025 20:11:20 +0100
Message-ID: <20251014191121.368475-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251014191121.368475-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20251014191121.368475-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Document the pin configuration properties supported by the RZ/T2H pinctrl
driver. The RZ/T2H SoC supports configuring various electrical properties
through the DRCTLm (I/O Buffer Function Switching) registers.

Add documentation for the following standard properties:
- bias-disable, bias-pull-up, bias-pull-down: Control internal
  pull-up/pull-down resistors (3 options: no pull, pull-up, pull-down)
- input-schmitt-enable, input-schmitt-disable: Control Schmitt trigger
  input
- slew-rate: Control output slew rate (2 options: slow/fast)

Add documentation for the custom property:
- renesas,drive-strength: Control output drive strength using discrete
  levels (0-3) representing low, medium, high, and ultra high strength.
  This custom property is needed because the hardware uses fixed discrete
  levels rather than configurable milliamp values.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../bindings/pinctrl/renesas,r9a09g077-pinctrl.yaml | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,r9a09g077-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/renesas,r9a09g077-pinctrl.yaml
index 36d665971484..9085d5cfb1c8 100644
--- a/Documentation/devicetree/bindings/pinctrl/renesas,r9a09g077-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/renesas,r9a09g077-pinctrl.yaml
@@ -72,6 +72,19 @@ definitions:
       input: true
       input-enable: true
       output-enable: true
+      bias-disable: true
+      bias-pull-down: true
+      bias-pull-up: true
+      input-schmitt-enable: true
+      input-schmitt-disable: true
+      slew-rate:
+        enum: [0, 1]
+      renesas,drive-strength:
+        description:
+          Drive strength configuration value. Valid values are 0 to 3, representing
+          increasing drive strength from low, medium, high and ultra high.
+        $ref: /schemas/types.yaml#/definitions/uint32
+        enum: [0, 1, 2, 3]
     oneOf:
       - required: [pinmux]
       - required: [pins]
-- 
2.43.0


