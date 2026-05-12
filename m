Return-Path: <linux-renesas-soc+bounces-32492-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eLL0Oic/A2rO2AEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32492-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 16:54:31 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 668B1523079
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 16:54:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4BA3130AE09C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 14:44:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71BDE3BB690;
	Tue, 12 May 2026 14:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NTJGZUrX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB5E63BB674
	for <linux-renesas-soc@vger.kernel.org>; Tue, 12 May 2026 14:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778596904; cv=none; b=VsyEJmOshAZ6q2Acle15CepPoY9bowDAfTYRFiRaFD5TAjoWXulzfnzRfxKQtD1ZrvEBg1SFsxtU+gAVI5NOX0YaZ8xUa+uTUs6fx1fG7qHfdTm5okdAHD0/Nce3yIt/WTA8TsSMJvb5c7BIZ8pBKELLviYzSfMA5IC1YxdHFtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778596904; c=relaxed/simple;
	bh=6e5su12ZJ7vhdSu5qAUM56C1srarpr16wNr2uJph7Zk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XHkhZqmu28jftHdGmlRpU2QOFzVlr/ONhabmDE+LrMaOV3NB3/me2r8IRFI39lKPGP3kIc/YKLXuHPQ5elOmPLopPSg8uGLOXDF8J6dw0XUL2Dk7efhG+pvS1oQD6CEu1OQvo4eP9+zLEYxiOzbnTdd5stMtA0vPToDFz02+biA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NTJGZUrX; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-488ad135063so45701645e9.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 May 2026 07:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778596900; x=1779201700; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dZMjl5wlw03SWoU3yFGiKDurKpP+omQjQUlHWLj/NzM=;
        b=NTJGZUrXaBe8gT+ZdNzuq9M9HcE9EpdIywg2mfO79qi28wfUbpSH/j7BGmriWpSIhT
         BuXq1yFaIxiGF8Y+AGI8p/soV3g6tAV/W58R9vJFBa7vIXI18f3q5vF8w3wnoVQj94IE
         0KyLUeKPtf3cuhyafDJhToctAFflA7w8Xksb2nCCrnPbamAf5xduYvwvEGZ4/ZoSnoDg
         JS1Z5gWd88gzXUDcd/TpAxfjnxwtYLu4wBnSLdSVDjKSgXhiDY707BqvT9jKxMQ1/b0K
         g3pKlK4QFqeqUaEa/JKAI91kDwFhQ88Pt+/LIYgvI3sIwtVA/PDi9OUMhdPBdsTgy740
         u6mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778596900; x=1779201700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dZMjl5wlw03SWoU3yFGiKDurKpP+omQjQUlHWLj/NzM=;
        b=ZoQI57iP9WYA3TyfNXPQlRMApqYRTNl0yYHAqscArucesVJlFjns0sEbafCp468tYy
         mHGYOtRSlVHqm+yV/AkIo5K8Pw3aNcNHf3pdHcb8RTi2ikOxk5EWodLzFDbgATU9Zu5P
         Cz81i0Aq8u+NrcYNhpiIMewLDRcExz00rE/G/oL+W0hIHW5T6/e0gSa1UL8Lwg7JjsDR
         BfXeyHlM9CuuOcWldPVYUQ9RHYkIH8TyX7AzEatdBpGduRsvQShFlFE6O9S7EGu09q5O
         Dq+OpMp0m2AVuxqfND741DwN++Zzx7CkdBKXK514bjd1z6I/hkOdaCfsMcrQUhlSeY3y
         gOGQ==
X-Forwarded-Encrypted: i=1; AFNElJ+BInXGfnnf7dTV/Y+TgOnJGa/22C13lvV2fJQLgkTZfTrqipJqqORGB6gijdtwyKh21MYxX0Zt2sJ7u1SJOI5ppA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyDEZgA1E6hu+gQpMJDgmuoiqqw2fukb7gRYZAR9FJ1zphNl79Z
	ohwE75BNB8Hr7v0PABRW6T8tUvD5Ax735V7P0iQDF3Vgng4ww/Kmfw4g
X-Gm-Gg: Acq92OFt55+xppQJTG3e7hl7gH7XPOg+Od0TWfreSTSks+NtkesDaVEdenGSBYk3kVl
	h4pCkeDSU2Qee2WofPvHjy0qR0DDQUUNyB0H5PVDJcEBu/6bvsAf5Uh4WfYFGMqcRB1Q0q1J4Nq
	8wTJoO4DFXO5CQ67jVS+Ry/jGNs01W2dYBnznXigdmTT0FHQl7NXO+ZOJwIIemYXKqB8UoKVXGX
	EDh4y+QyPVwravzakQCz8t5WZR4uRSD3Oznb7UbimxizOHgiS5Z0glKflC/9saixXEcMtu05Q5x
	5tlW4X3X7+XYTygOaEuUNdHc6vHUWjzG9dqK88yzamTirEzmfCBY/TcXCNIhvZnfscTrn3vM3M2
	5FgvnyOcJKxmUx9CrPquSaRtdLNJaNY0yxdIgNLYegjuXEeb6JwDy/lwoe0KkCVBnIJMGF7RrWm
	k1WXSlF4aQOElor0K6h51RF0tZgWpIiL6r9IDh0PpmbpoKhLMh4zRaFGEYsKVj2yE4GOsp1OBat
	hEGKOYc4EH2sD1hLk2I
X-Received: by 2002:a05:600c:33a9:b0:487:2439:b7c8 with SMTP id 5b1f17b1804b1-48e51e0bb9amr295666785e9.1.1778596899908;
        Tue, 12 May 2026 07:41:39 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:77f5:545a:798:321])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45491cab9c2sm34978713f8f.31.2026.05.12.07.41.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 07:41:39 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 1/5] dt-bindings: display: renesas,rzg2l-du: Refuse port@1 for RZ/G2UL
Date: Tue, 12 May 2026 15:41:00 +0100
Message-ID: <20260512144104.761531-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260512144104.761531-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260512144104.761531-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 668B1523079
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_MATCH_TO(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32492-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[bp.renesas.com,ideasonboard.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,pengutronix.de,glider.be];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,gmail.com,renesas.com,bp.renesas.com];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	NEURAL_HAM(-0.00)[-0.939];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,ideasonboard.com:email,0.0.0.1:email,0.0.0.0:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bp.renesas.com:mid]
X-Rspamd-Action: no action

From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

The RZ/G2UL DU supports only a single port@0 DPI. Explicitly refuse
port@1 in the ports node.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v3:
- Was orignally part of separate series [0]
[0] https://lore.kernel.org/all/d1e0d4e0fe74e60345a3d043fb4f9128c1057638.1778141145.git.tommaso.merciai.xr@bp.renesas.com/
---
 Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
index 2cc66dcef870..5add3b832eab 100644
--- a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
+++ b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
@@ -102,6 +102,7 @@ allOf:
           properties:
             port@0:
               description: DPI
+            port@1: false
 
           required:
             - port@0
-- 
2.54.0


