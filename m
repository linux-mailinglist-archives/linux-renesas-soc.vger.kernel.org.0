Return-Path: <linux-renesas-soc+bounces-25132-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B4199C873B7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Nov 2025 22:32:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 841A84E13E8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Nov 2025 21:32:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F2CC29E112;
	Tue, 25 Nov 2025 21:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CEZs4Rsu"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55AD4274B37
	for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Nov 2025 21:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764106331; cv=none; b=Tezxqr1ufw3xyik/7ahxDWkyC4EZTw0DBs8soJvjb8UdvoZETOSuVPA0rGFoiaJQ9TmuaY3caG/3Bmh6w2mR6ZNS7vpr/iDfafTfOUoE/WHnyjokT7wPiCkPPk5n0xhftx03ykcWGyxp6aOTzWFZ0EiYEzdkdWR7JRxdNzuNTHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764106331; c=relaxed/simple;
	bh=4eY4f3c5CBEwAGbkB4wJvvuf+PLHMBF6XvcBPNG1Lvg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VGmxDKgLlRaaOpfN0CDfNl3PyQ51gJ214d78zm8NCG9KLham7W3xFMiQX3fNLQBg6eNjetnIwl5jAAqHKNgXxullQoLaWFtyRyOeKLAhQJPlOaPJbcU9pBMJ0+axuqVzcLf7hxQ5PyiWeBYQPu6UjMXnE1OBnVixDT9Z5QY8eOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CEZs4Rsu; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-429c4c65485so4815309f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Nov 2025 13:32:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764106328; x=1764711128; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EW3Z3TOeiqfSEGbu4L2QHhccduvq/CsDNdyBw1wE2+0=;
        b=CEZs4RsuFcL9zh24Kbu2OztyIbDBYmSQQEOD2zdBNLAkX43oZLZKZVYJDHaHsgZnAX
         X7VzR8LFsh93EfFhAYWxec9Bs2ysnQFMnh3YlZIP+UrRMyiB20fF/etOnUBrJYS7UpTB
         LbRSrIchY77FH3GX2FIXpF4tgT5TjEo0AnGhiMBjr2q0S9RQBXqnaLv0WlMCYQK/IgWe
         6fUMeMV5BmHnpXtOn/ZqIEitrvm3/QhhuERdyEo1WXtJ3lbjRmjOc792nemgbwo1rVPz
         RQFF+L9v/Ew68vKx50VCIKmhp3vrS3sTyM7B6XPTsY+Wqcg1rxgKC91PEmENwV8sFBBp
         +n+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764106328; x=1764711128;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EW3Z3TOeiqfSEGbu4L2QHhccduvq/CsDNdyBw1wE2+0=;
        b=LWdaUiWRvCrCqp2vgEWGe2+EvAzPBeCNnRQRW2dp0b9MY+KpIlkDH3uz5ifnfYswT9
         yJ0BSmtO8WSN03kvMS152VsAgDA5rqCnlNYLX9ip8Tn1HdLPDc0tX7C1JOKf2JFSoNjL
         r+gUwLrpoQb9QcguqfxYpTMkbL2w7E4WsBdD9p5avj0INqiuTY7zFlucCROJD598SFrd
         BEoFEKkgqo/hKATWOO6ObeAT1lKShWc5aoB9of8haiK8+jm2UpLddFItVsoscQAHWaA9
         vHGLMt2NebM0/bUv5bJLKqWLmULLrkeOs1aNg+boTtbSdORFaAj2/80HhlNSCxwuvmq9
         PAVg==
X-Forwarded-Encrypted: i=1; AJvYcCVV3/c9BojYL7dUa3QIVDbb/9VhndWCDHUiG3cpGJzEY0qEs1/dQxRmRs4uv9Fs7Px1j3mdmiE7a/jc6OHExXG8Qg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxGrxwfznoED/VF3VJuSMOOenmbj6icizSZ4MCSaqRZIFofQ1fR
	cKZQ6FqavjsQ8IxRO4DtyrvW73+QttlJTeYnodVzPKSyE5/2xfuVfzwx
X-Gm-Gg: ASbGnctr7PlPCyvLlCUBXeKfosuJ+ObplZlkDSVFHc0eeDj69aVLZC6NJ4AVGJRnXr5
	W0TT6K8tIz0lpNpRzjGn660fquSVNCcHkaK+i8DBu5Sz4ctDyvyMf5dSNIS8udptEkH0WO+axrR
	9/3u9Ci3lOOvPUQ+Y5sOPhDPTOsXCTUuQLYOiOy8++HbxzXfi6AZlbJ5QyxE+zMguAVDAjV/nNB
	ASel7iz9JZH6l6CVTpQNR+Ycd8sJLUpAeMGIpsM8VVWJDwdr1T7ENO1a0s9rWo+Dc516UYzTb3c
	VXB4k3MhFss2DrYOl42KQBv958U0kp9DtuaqdOIk+DLmSKwiC3TVCh61TB7+wN9yRwo7m9GPGDr
	HPObTwEchEuIhpE1nlQEmonG9Rl6wTJIU5UVfT8O1pcZHoMkhheSXRBZfES0DYjt3tG6+Z/miW1
	p0HjAyIBn+3NmSxhws03eTKHeRxiKW0CiwSw==
X-Google-Smtp-Source: AGHT+IEyG5TEPMhtRSwEbZVRNInhQdMO9YJuiq5JJwv0euWXBPqshkSS05tv8q4B91RRowkrkw7O7Q==
X-Received: by 2002:a5d:5d81:0:b0:42b:3ded:298d with SMTP id ffacd0b85a97d-42cc1d2d5ebmr17987399f8f.32.1764106328405;
        Tue, 25 Nov 2025 13:32:08 -0800 (PST)
Received: from iku.Home ([2a06:5906:61b:2d00:325:d7d3:d337:f08b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fd9061sm36677163f8f.41.2025.11.25.13.32.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 13:32:07 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] dt-bindings: interrupt-controller: renesas,rzv2h-icu: Document RZ/V2N SoC support
Date: Tue, 25 Nov 2025 21:32:02 +0000
Message-ID: <20251125213202.270673-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Document the Interrupt Control Unit (ICU) on the Renesas RZ/V2N SoC,
which is architecturally identical to the ICU used on the RZ/V2H(P)
SoC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../interrupt-controller/renesas,rzv2h-icu.yaml       | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/renesas,rzv2h-icu.yaml b/Documentation/devicetree/bindings/interrupt-controller/renesas,rzv2h-icu.yaml
index 3f99c8645767..142aef5ec1f0 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/renesas,rzv2h-icu.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/renesas,rzv2h-icu.yaml
@@ -20,9 +20,14 @@ description:
 
 properties:
   compatible:
-    enum:
-      - renesas,r9a09g047-icu # RZ/G3E
-      - renesas,r9a09g057-icu # RZ/V2H(P)
+    oneOf:
+      - items:
+          - enum:
+              - renesas,r9a09g047-icu # RZ/G3E
+              - renesas,r9a09g057-icu # RZ/V2H(P)
+      - items:
+          - const: renesas,r9a09g056-icu # RZ/V2N
+          - const: renesas,r9a09g057-icu
 
   '#interrupt-cells':
     description: The first cell is the SPI number of the NMI or the
-- 
2.52.0


