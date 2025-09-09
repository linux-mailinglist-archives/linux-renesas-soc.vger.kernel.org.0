Return-Path: <linux-renesas-soc+bounces-21666-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 04DC5B504DF
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Sep 2025 20:08:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B5A9E5E5E94
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Sep 2025 18:08:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45C2235CECA;
	Tue,  9 Sep 2025 18:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KcwL/Kxl"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB251F875A;
	Tue,  9 Sep 2025 18:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757441290; cv=none; b=pIl+fdqnhJiNT+9fHvQ9antck9vlkIugxdmqqVWrIooQeweX66GxgCGuiBr+9bRgvoinr4JPaiJcDXSAldz4/A6XqQPTaUCoXrPO4osvFTpjqyeBwikQ0vEMwNLz2BZUaAlZtjlUHDpwQxsehwUJufMWmiJU1rTI3nTYUspo1eE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757441290; c=relaxed/simple;
	bh=G8hz8dQd4XOaGw+OM0L80X/niwlleEdtJzMIC7rQS9g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FWwZCN2mFaTpA0xsXzU9kpoC9fGPHWV2W2k8IGfdYapJL3T4BVYcEXM+vu1j7ShLe+Jibg/EUTMeGmHlb7I2jNC99fmb5QGAMUu1ws0yA3GDB16gssRvYwnwEGxTv0oaTHEdK7kZZ6HMY8dZNcNkVQ8YPPSzpEwscoOK0q2og40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KcwL/Kxl; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-45b9c35bc0aso52291065e9.2;
        Tue, 09 Sep 2025 11:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757441287; x=1758046087; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dB32BUMqpiozwWCDxDW3VIk9u8n3oOa0NH8mBc6r8LA=;
        b=KcwL/KxlFsLIPSOXkrjjXaejokiLjueJS/fI4GRUIilhHyZtkM+zgb8qOfifsGX9w7
         jLK9YHudqSY2vp9ssk6y9uyI8WDACHC1QO4n+BlRuMVQWVgu8n8r1vg7v9NMlT9amHDs
         phxPxwgUUq3Xn27cvkp9BEGOr3d8yLHkudG6bY4DZSy22oWkklVWGMr8OQJ9CQDUsi8b
         +P5MABSHT8eeEWQRuabLd4Jr3L3glu8K9RzwAraxLRdu6KvWrEIPNqFowDeTPZPAYWzL
         3UPc+1qAWFbWY3WsRZ/bEkfKAFrWrLWYNit1hZPrc6AB2BdOvpnBH7YfMiy31AME0QMZ
         3mAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757441287; x=1758046087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dB32BUMqpiozwWCDxDW3VIk9u8n3oOa0NH8mBc6r8LA=;
        b=Ac89yFu489pYBAUcQgIkba16YsbwPDj6rDSbDEmgoRL/sk5HBiKcv1a2RCnGqKSmgh
         1VJmVXIsCnQfPFMFYcBw7ucB26ITyxaGLiNn4Qqo0HjJuKA7uCFF1VQJil91rXMICTCJ
         UWsk2NFDFBdZ1S6VmRwvssPeVl8UnKr9pxhrO05qT5G0/7wEBoCENighiZTfyz/0eYam
         B1v5aJgSgao6w/0aJ2QqN+BQi35kfHXonMqSQd7txqd39p6K/TObEmt5PYTrKv7ezwqw
         433TJp7f0ma3oGFtcZHuaTX/u+kYSF46XEKPyhKkqWN50P7BY5yteUrPaUgH0sLac6pP
         +gtg==
X-Forwarded-Encrypted: i=1; AJvYcCUHC59XNz/tX0oMQWRBLnctBsk71eWwrgn0hfPgnJ5oqOa5GS9YaO8o9Fxo8oW6KnQUhpZQIZs0kcGk4joFMOlY9tc=@vger.kernel.org, AJvYcCUSZ54oDZKN8jZnBK0+3Ye+MD6zBJgdo/BiBfVM55LT1ctXQuR7jEBZ2yCkY7Yq+CB0wDi1R2FDbtnZ@vger.kernel.org, AJvYcCW623OcIO99y4p/0A22L4sn1HxQMj8fLFn+DNYYQpryDt0oQUJGvn6JbuEYNu6TMOg0tb/RD8c7mofaSr51@vger.kernel.org, AJvYcCWrPBAF95KY7jBv6rqPX0QGEREGxjISGaobk3Q6kZ95MhncqiPOK/fl7NH363lqnCGlqnhulfY9IvJS@vger.kernel.org
X-Gm-Message-State: AOJu0YwaHZE5aeiSKjkB4nVxWLErrKnxQLnfQTzzaBM4d0tEzl3OxNMW
	gbLOH1DTbSpc5IY32lmzC1k/Q7Ho0U8FdRUeamyCyK1Ea/qM/nqiHLEw
X-Gm-Gg: ASbGnctmkEndVnP/VUFQ7D02mS3TtmgDK22nWjtHigODgxYW6K1tDhgviQc+YLTdubg
	ayYdTJzDLslA3KdZtwT7/t5t696NXi4D2UOsfLGTkmv/ibWWn6jAT6g3FA0txYU8x43fp95vj2U
	eesz7PyudC3FGDfi8GFdrImV1+02GkB9Ba+BG1Po3tBONNXOU/CP+8jTKvMKT5epAdWGOTdHjCc
	uxZnR5S8AaAd70M1KWcZ6VQzmQoUNndtxhBIdo6hehSyVmarZdcyIrb7LWvIPlK6YV4/01gCYIn
	pjKW6rVUT8djKP6q3UZSm9Iqk0K36bygzC1yQ973Y9Z43WoCK46vAOEWqitzdNEuw093P7NuazV
	7j6TNHU2hsW8FuXovBBOW/LlBxQZEu7482gBtyYB/mlYjy0onA7wihct8uzyDv9nOjdWU5X2T+8
	syh8KpHMFPtOir
X-Google-Smtp-Source: AGHT+IFJ2eGAGCp18P4r+qPU/8l9mTLI0JAyJ6pxcyqc9wJ5NKWuEzAxvy2YBgtFXYVbLmjfhxMdMQ==
X-Received: by 2002:a05:600c:4683:b0:45b:8f5e:529a with SMTP id 5b1f17b1804b1-45ddde9764dmr93112995e9.14.1757441286483;
        Tue, 09 Sep 2025 11:08:06 -0700 (PDT)
Received: from biju.lan (host86-139-30-37.range86-139.btcentralplus.com. [86.139.30.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df679a4c9sm4174015e9.3.2025.09.09.11.08.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 11:08:06 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 01/11] dt-bindings: clock: renesas,r9a09g047-cpg: Add USB3.0 core clocks
Date: Tue,  9 Sep 2025 19:07:46 +0100
Message-ID: <20250909180803.140939-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250909180803.140939-1-biju.das.jz@bp.renesas.com>
References: <20250909180803.140939-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add definitions for USB3.0 core clocks in the R9A09G047 CPG DT bindings
header file.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Collected tags.
---
 include/dt-bindings/clock/renesas,r9a09g047-cpg.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/renesas,r9a09g047-cpg.h b/include/dt-bindings/clock/renesas,r9a09g047-cpg.h
index a27132f9a6c8..f165df8a6f5a 100644
--- a/include/dt-bindings/clock/renesas,r9a09g047-cpg.h
+++ b/include/dt-bindings/clock/renesas,r9a09g047-cpg.h
@@ -20,5 +20,7 @@
 #define R9A09G047_SPI_CLK_SPI			9
 #define R9A09G047_GBETH_0_CLK_PTP_REF_I		10
 #define R9A09G047_GBETH_1_CLK_PTP_REF_I		11
+#define R9A09G047_USB3_0_REF_ALT_CLK_P		12
+#define R9A09G047_USB3_0_CLKCORE		13
 
 #endif /* __DT_BINDINGS_CLOCK_RENESAS_R9A09G047_CPG_H__ */
-- 
2.43.0


