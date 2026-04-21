Return-Path: <linux-renesas-soc+bounces-31459-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8L/6BPez52lV/wEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31459-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Apr 2026 19:29:27 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ADE143DF5D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Apr 2026 19:29:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 726293009E30
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Apr 2026 17:29:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9412934DB61;
	Tue, 21 Apr 2026 17:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A+/qwkjI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 052D4309F08
	for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Apr 2026 17:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776792559; cv=none; b=QMA4HCA0KVMtiiZI8Y1ouaVpJEKZCgAXNq7GqaekbY0bR+ZYa0qSxBPOBjdmFOnQefm3CDmFfXcckT2Apu0Kq9Ofgy5l51wjpWon6w1t0/6TQokXLHvO8BYmyldXarNNAdZKzoZp8nHX9+9RTKM6b3NUxX9CbdPB2Ue0NB+vQkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776792559; c=relaxed/simple;
	bh=VT6F7pP5zpkVt+Q6oy48vr3dMiUpqgOtr+S2bUDTP+s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LZ2MS0n7D+NvzWQsG5JxE9D09Cpdnaqqz7iLSQsiruzaaTTPG1XHcO8J3tH/2GoYStDvBLHvQsO6jGvXTvEBXY42zteRzuh4SfPBD/2ZjBtpS2LXYamrwjivN97pIMLcq2edLJwSGpgmlMY4UXOIaR1Z0WaWvPUveLanp4xxWUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A+/qwkjI; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48a3e9862f0so14808615e9.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Apr 2026 10:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776792555; x=1777397355; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LH2h0hmWtthS7ZoPVC0SQxbSn/Bs9GnEe+2qEICPqmg=;
        b=A+/qwkjIRSxhjPxF20/zJ827jm/u6U4BKlt42hPjfZulRlfKRrp2TQ+CJwNYNVkOhh
         Zbq319qujBTv+QNM9nz/budKqx+xVnuJOdEasgSfigqeN21fgnUvn2O4WwWA214/4G/5
         lkq7y5SZ5aQGIV06nKjHJiIHaisBnA51NeGdefX90DpL8OnM2fXidw/3iD7nlLoXZ0s6
         pcfO3Aj2qJFpDJAcIVTVehbELzfR3bcXBxTR2srS+uZWTvq0D2QQ3UwxxW9szQJ+/Xsi
         MOXKNjcXE5Wr43agko72ElD+ue0QHDB1DNaH5Ig8K4erSZOQKAColBJpNlo8HmMIWbIK
         dDSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776792555; x=1777397355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LH2h0hmWtthS7ZoPVC0SQxbSn/Bs9GnEe+2qEICPqmg=;
        b=Vh+hkcUYS3kw7Gv/hCnmow+bVvKn8P0TxchhVqtL/LfUQO8SlitR2osbSbdfDR5j/c
         Ha1df5w5ZRoxcLoMlnOEMIxqOrKQU+6srxHPziRGyMaI007bQPhn36Qu0HgtVyEPItIO
         4VF7+/K6LLa2L5vEyDXuNhihSqIKacTkI9ybgFniWspfa0GcFXGF+I1KJRqzYjIgXAw2
         AwLbnG32CvwNQbJulnYzLoCcHgMy9s7Hxh6Jq9zTyb7MltoIQi7mT8GJFGNupjvzVCTB
         +ynufgojBVWR2MnXfV4lVZ6BZJH4LES7DCQPDYHR2jmyP7/BqV/M/zbuTIUnr2fisDYZ
         z9jA==
X-Forwarded-Encrypted: i=1; AFNElJ9VCq628EnFlF1j2Zk1WhBtA/8IY1ITJ3yAWcPchaJg3puw40x4hTM8vdS1wqXrrRi/2Ss4wl5GkX+JKLYW4ZX5Kg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxVnLR+ld8DEuRdzYaa3k9A0ITHvGFZKNn/91QROUepOJZGeYsB
	yu/twIDmw9flizsHM8Yh0k6uZfEdiBqDz5pbnZjsSc4PjBerzEMhQjkbHgKbVw==
X-Gm-Gg: AeBDietas+WfbfY5reIOQ5ioIqBWVdjqz18hfjwub9CX2Q/krU+dyRAn5Z/on/7EHwx
	9//LtUKY1GGk9kaeujvlKqekxw9Af3OgeyrZ7eSdI7yE/R6tdB0H2p/o43AQRq7iYJOTcX/W3Hd
	Q2hB1Zyw0lm31dWUK5VwUz5iI8M7/4XpCQGFABXpsKNQ4bQs31ZovDXxq6don0cacumndKAX1GE
	azuVX7FNUGK95/74kePLeLfkdDZLoa6CipTt+VoQZLMbcHQEbbsvBdkbPZSRI1D3JXykuOS+Ck1
	Bq/FNzbIzHOxIhiCfCGVuMiviEyptUhXo/93YE7kQZzE4AZLquBAlxEuEkAawtoWCkLzOZXefNa
	wM7+t5k1cRwzPwB11ILPup5gqrAVxfCOJQ+M3u0omBVQZYoqQ2I9YqyRL3vQfhLvxiFBxxSSaHr
	al8G+pY37voccvSP4tHEYQgJ5IxyzoFn3l2b1E7U1mHBMFnKJ6SbF7C75kWVc=
X-Received: by 2002:a05:600c:c112:b0:486:fe83:861c with SMTP id 5b1f17b1804b1-488fb896910mr211023925e9.7.1776792555368;
        Tue, 21 Apr 2026 10:29:15 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:de57:c37d:677b:c772])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a525a0b1asm57445855e9.2.2026.04.21.10.29.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 10:29:15 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 1/3] dt-bindings: mfd: syscon: Document the LVDS_CMN syscon for the RZ/G3L
Date: Tue, 21 Apr 2026 18:29:03 +0100
Message-ID: <20260421172910.218497-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260421172910.218497-1-biju.das.jz@bp.renesas.com>
References: <20260421172910.218497-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31459-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,glider.be,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com,microchip.com];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1ADE143DF5D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

The RZ/G3{E,L} SoCs have an LVDS Common (LVDS_CMN) region which is common
to all LVDS channels. The RZ/G3L has single-link, but the RZ/G3E has both
single and dual-link.

Use the syscon interface to access these registers for scalability.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Collected tag.
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index e22867088063..9c81010d5a74 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -221,6 +221,7 @@ properties:
               - nxp,s32g3-gpr
               - qcom,apq8064-mmss-sfpb
               - qcom,apq8064-sps-sic
+              - renesas,r9a08g046-lvds-cmn
               - rockchip,px30-qos
               - rockchip,rk3036-qos
               - rockchip,rk3066-qos
-- 
2.43.0


