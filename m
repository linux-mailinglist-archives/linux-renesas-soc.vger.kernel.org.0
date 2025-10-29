Return-Path: <linux-renesas-soc+bounces-23827-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD61C19127
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Oct 2025 09:35:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 901181C82203
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Oct 2025 08:29:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10AAE313268;
	Wed, 29 Oct 2025 08:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g0HLRTty"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E01CD3128C9
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Oct 2025 08:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761726067; cv=none; b=fDr1TzE9DoRkX7sBJQXcxacc6UXuF5I8yRUazwJc6dRqZEbBsgqmtDNMmNmOkjLbNAbo0S9ULneMQIxezBQParOAnrqAo4om7YqcML2CwYUYZR8SWJhFQ208nJiZ+CdcAHBE3x2kXk1yQqK/OA7VaFCen5wpy2H5EmAKFqfPOO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761726067; c=relaxed/simple;
	bh=z4QNcF9Eyw4gYd86FpxSeDFA3Dt0WD6vaP2DFa/zU38=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ec8YZ+yhytDSBVN6965Bf6GvEE/bQaQHtLP2qQradUpVGsj3xxv+vKxmK3J5uTSeIO/1b1lliyizXiRo7WYBUeSWxLXd+RZDX6Tf5WNB0eXtaDWbHsZn5ZJrAn0xepW/IO1fQcmnUEaFEJW9JA9LwPZbbxhKYaIK/7DLj4W8KEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g0HLRTty; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47114a40161so77946165e9.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Oct 2025 01:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761726064; x=1762330864; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QS4cXKd9nHCeMiJrsvhtqK1LgpajA4mb3ahi9ySMK/o=;
        b=g0HLRTtyOyd/pRIoNTaXTJTZZFwHoiOyXgWilj8PYDHbzm1opaHhRCVAK6NWkwJYRL
         K22y3szhtgy9+feOF3dkV2KHj8vtNBZMGRZyCx6kSWH0FUUkLXPtxt8r/SNFofaHda7y
         M9DkJwGm8pWZQ99FYWOqWTJnYvfaflkHKqfbYEOPaGaQb8IPn0j6jADYZrsLPnx/tncT
         XQAqoEl9nE9PIZpn3AaRjtdOGitzpn9IIPj2mrzhsDAQnXAPwsD8iI9I00Ob1XG5iQ4x
         hkDDbEcWERb3r6QkPMCvf/QzrC10uKYQ+59haizha5CHroq4yfpNfz68Vsex7L5XYdyJ
         c8cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761726064; x=1762330864;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QS4cXKd9nHCeMiJrsvhtqK1LgpajA4mb3ahi9ySMK/o=;
        b=Mc6A4TJIRLkg3UxvLo9rIYjfogUjr4KtV1RBdn3JIaIf5tZTYz4TyA09MuStC7x0J9
         rcXLLwchhXQKzqkk6jasUPbtbeGTUppHH0+pyaBqnkEjQmsTF58nwhWooKRUnUsm0kSg
         IWIMtLh7jZbRtyBMmmFmonekJ/Ym2OgXzUMOUjyd2yWcPXYLLyywjg53oSqUofCeP0xm
         WmjPOG0eT+opFOWnnwNgdCp3PDpt/9d1eRGE7JN6zNomRaCUaTh+WAg/d6OTMDh6TY3x
         ueTZ1bI3aWoQgPHsWwKBTnecfGUEyFnUT00/cyiLOAGzSl1/lOrya1VD86QdMAiqOIw3
         7KSQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3vUjvGJzmDvzu/FxItpfTIrnH+KFw1YelSrOleBEH/ONYJ8E8q5E4GQUSZeqIzQoDiUD0cWDxBpZ80fdVxkCXmA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwGbyHq7Uwp0W/KiQjTo2Wc23HWO0ddMYpmPUvxDIBJJWnZwxd8
	9rQXCYHrg5gLWNxbpLF3yzHlREMmaHYq6IGKy9mNk0seYe539nrLK5pq
X-Gm-Gg: ASbGnctH1VEF6yi8312sB0NYsHq6bkLMijtMBETaV91EYyIbMGt9vB2TPBqVhBD7hw6
	mRHjDkxpjyoUHJdhNhhVEO+T3OQ6hkpq9BjsXKhDGRjYwlysXCwr59DTg5pwfLNX8CEhcDain3B
	6X9QwdPbTzFotP/dPE3FEdTipYyWM6Rxa7OMQ1TwLMeIksTlaU/V22pbWvb/i30AJ4Lb9Ba5u0x
	2TbVmMn7NRjkXzpfnRlYwBzLH3gBPSkbK+JJpUR3naV9bCsvx1L7MbHdoSPysK0xQRse9bmk5xS
	nvZX7CNKCtWbYqB4peCSHqhGnVOE6RIdKv3Vsum61LPKIRQyX8TCedsdLDOqxXrccHbwgINiGxh
	nRVwzN6c7ueNJocweBBjN7f8wiACI9SJ37Y1muVNv/L2Ra/r0ulrT5JEZrq/CgzbAWAQh8pPF3N
	zhZM5suToHFDs9/DQ67DBBd94hczoTF5nw6L+n4rVszG4Jl5rsOkb8xQxjKxwB
X-Google-Smtp-Source: AGHT+IGpz04tUrXPPdzvPALWiB03f2PPa2ldKep1ogo1wBz96/Sv/MlNxLIMNVL8/snHnNzdUBSogQ==
X-Received: by 2002:a05:600d:8389:b0:475:da13:256b with SMTP id 5b1f17b1804b1-4771e3cb77cmr9172205e9.38.1761726064072;
        Wed, 29 Oct 2025 01:21:04 -0700 (PDT)
Received: from biju.lan (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4771e196a22sm35191915e9.5.2025.10.29.01.21.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 01:21:03 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>,
	stable@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 1/2] dt-bindings: serial: rsci: Drop "uart-has-rtscts: false"
Date: Wed, 29 Oct 2025 08:20:56 +0000
Message-ID: <20251029082101.92156-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251029082101.92156-1-biju.das.jz@bp.renesas.com>
References: <20251029082101.92156-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Drop "uart-has-rtscts: false" from binding as the IP supports hardware
flow control on all SoCs.

Cc: stable@kernel.org
Fixes: 25422e8f46c1 ("dt-bindings: serial: Add compatible for Renesas RZ/T2H SoC in sci")
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Updated commit message to make it clear that hardware flow control
   supported on all SoC
 * Added Ack from Conor
 * Added fixes tag
---
 Documentation/devicetree/bindings/serial/renesas,rsci.yaml | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/serial/renesas,rsci.yaml b/Documentation/devicetree/bindings/serial/renesas,rsci.yaml
index f50d8e02f476..6b1f827a335b 100644
--- a/Documentation/devicetree/bindings/serial/renesas,rsci.yaml
+++ b/Documentation/devicetree/bindings/serial/renesas,rsci.yaml
@@ -54,8 +54,6 @@ properties:
   power-domains:
     maxItems: 1
 
-  uart-has-rtscts: false
-
 required:
   - compatible
   - reg
-- 
2.43.0


