Return-Path: <linux-renesas-soc+bounces-23549-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E352C038DF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 23:34:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4329219A2788
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 21:34:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E29F82356D9;
	Thu, 23 Oct 2025 21:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="So2QKNNg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EFBE1E5B95
	for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Oct 2025 21:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761255248; cv=none; b=tDzMIGiERn0dYoDwseG1B6lCIsNPvCz1wFKTEOC5eUWu6Yc1CYh3vmt//WRuALTBYuG50mYRoEULOyFFfo+AKA/vAXzrj1He/rk31uWaaYT+Ypiwj11DztH8QrWOZTB7tDKu4FSSqEnAIxLj9gWlfMFrY0DEmAEmK/r3GZLLdjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761255248; c=relaxed/simple;
	bh=QrDsumBR7XmAXhTajPbH62vMSoYGzD7KDyrcNpl1qMM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MWABuylczVgZDuDJ1PiQjA+X6ix4CmB053VC0eF6g9VqkG6soxGVDjxHqN/XeDCAMvGAtBFzLRw+pQz9O6VqIDKgBargTOPw2vWcGKvqxPoauWyfY7GPXe9Oz5KWAdpI2zcjInFL/kdILVCR3tx3iXhaqADLRPz/YU4dkqsFsDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=So2QKNNg; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-33bb1701ca5so1319886a91.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Oct 2025 14:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761255246; x=1761860046; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q2pvfpdVDgSz+tiqLq0LEmu6krJe5n3X3t1r06M3DaI=;
        b=So2QKNNgz1ATgQrl3e+Xr+vCfYF4tbJFsCV59f6j7YDRjo8X0dLnSlx9t0fJ9uU7wB
         7EHYYEb43mJQE7tOb0kSOJq5hZ+kWqzMm3MhNWODf7guMHEvD/CQuiL0AjpSDfQ/HaSW
         uUHqdP6kMCzAYu+4/LpgtJoX8fTB44dtcFVMzln1ARY91IgbdnmYUTH6iAtKRzxpAmOx
         Bt6ZVekrDR25uInq/85hfm6t0dOPXaYBGGwFWfv0NqOH6uSapGweTcOBG73gohUsPz0E
         pN1dunbOSeA28W8SYxO3fY4MUsGpYkauwgyyq2VmHU/jt1h66U2xzAbcDQ5FbVoWwK1C
         fPXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761255246; x=1761860046;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q2pvfpdVDgSz+tiqLq0LEmu6krJe5n3X3t1r06M3DaI=;
        b=mr4kjjJZ+hh2Eav8BSWjuybW6XorDXQbIk97a5kgn66p7gLSyHmoBIEv/gIG27pQx9
         OTJtpVA1OqIT8u9DmQUcrsPjsB41aI67GzE35mRNN8MewgIpq1oL2oY7udI2bL1gfFfR
         cD7SGhI1FjmOMwrULXR5IPclgKmhoVwahpnVILELZUJ9LMbSLxFBqPn1CWedaoJYjYra
         rMoAI8h+fuZvGsnDHn+8v0og9vXqm8+Lq4mVWZzNO2oos0th24RPFiieOB932zWXvdqY
         ynWhHx7Fs6JqUWdzFxoAvKIWF4fj8DU5i/FYkKUCK5CastWuNP/Ssmk0wOAYxaVw1bzT
         8tMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkkzIUBH3CiuC81uaIkJzgwf0mWE2kgbyOfHeYUKEe6M3oRXG2pLGT8abncn91r577mFMTR0pPxihTm60GX0E7fg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwSnmO7x9N0h5Wrk4Yx45+NTP6XW+bnsE/vZqQYtu7bYc4W0+H5
	IcEBaIvBQH87AjXMDy6YR8B7ApvqK2nYTB7VFazaUBhIr3FpJSsBFUPz
X-Gm-Gg: ASbGncuuBYJJWNbUEtcQiFn8o60pniFyzmTeCwKZ0tZxjp67RWuWAsxOaND/CIPUWJ9
	STcQK2nIDEFtbvPb+/Btkf86A0cDjOLg06fo/8U4WKeduTEYNqkJxoAdtoLVdZfDG+w1BcEkYyx
	BhhqoP+T2hoVodh20OGuF9p+ceNMkGJfvVj0uzk1+nD9EFCzXxsfBZ8IyX6Rp765JsvHS+scwmD
	aPtcN9ZxFFtmR1rL3XG2gTdFIkLFYNs8ovpzUZt0TrjzodJOtiX2UjC9zHGReViI9R1FFvUbKre
	UR3Mh5K+DRtTnzlcb3YrPUXIplcgP3x8eQOuJPBplVSKt1L2OffPIgn2YLFrrB5bjE89dGYA4bH
	boM2uywzGdT0N8yvjZO8rb0MFGy4ALg04oJjDu6lcBe+0bzpNl6bvYdavUmcfvDjifmOVQ3ETbA
	UMdEyH42n4edepoc7Cbz5KWHvMh+5bNA==
X-Google-Smtp-Source: AGHT+IF3YGWDNWYMokVO+WXERUpBjg0IQ+EhQnmcd8t7unNBGwlJ5PPtm2xykzvuMO9uNrjZL1vC5Q==
X-Received: by 2002:a17:90b:3e43:b0:339:cece:a99 with SMTP id 98e67ed59e1d1-33bcf86c699mr37737123a91.13.1761255246585;
        Thu, 23 Oct 2025 14:34:06 -0700 (PDT)
Received: from iku.. ([2401:4900:1c06:ef2:36b5:9454:6fa:e888])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33fb017249asm3450734a91.14.2025.10.23.14.34.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 14:34:05 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
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
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2] dt-bindings: display: renesas,rzg2l-du: Add support for RZ/V2N SoC
Date: Thu, 23 Oct 2025 22:33:50 +0100
Message-ID: <20251023213350.681602-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
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
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v1->v2
- Added Reviewed-by and Acked-by tags.

v1: https://lore.kernel.org/all/20250609231905.511904-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
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
2.43.0


