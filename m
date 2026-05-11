Return-Path: <linux-renesas-soc+bounces-32398-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OL4gLyglAmpooQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32398-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 20:51:20 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 806D0514A03
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 20:51:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E4A013054FEF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 18:51:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F29284C901F;
	Mon, 11 May 2026 18:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wppg+EpM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 390EA4C9006
	for <linux-renesas-soc@vger.kernel.org>; Mon, 11 May 2026 18:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778525468; cv=none; b=MfAl86YSoNedGApqn4xEPPi9D9MxthFS8Yd4/CQ6b2byoN31347z5l9xhXb7vZlRooDear+StWjdbYm7tIzDaBDLh247nqOhj2lFELkgF6YEXfqMZrUl36mjDrmSX0RZJM0C6cYrQkPeuKVYbElXRqYc5/fsmSnzyepXBKaMt2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778525468; c=relaxed/simple;
	bh=L8qSGL7/R0cKnVz8Ctv0uV4rXSfX+m9YTi5M5pJ9WS4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uqNlGWf5peEgcWW9O4osj97UYDBwGF3s32bITQlHV7PsGzdWu/qfdJ/qugbCi1FkwSdI7DIj/FR+j5QAEJzf9cApLQGPg/EcySqe3YiVA3Z4aqiJFS9ei0YnU1hNtHIS9ribjWUQ+ulopMhFK0dYoXjA/mSJ+ELuNkbfts6ws9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wppg+EpM; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-48d102471a4so46592405e9.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 May 2026 11:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778525466; x=1779130266; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LMjDPGDJ+8xslo2jimMn/IGPGbD0V+wq+ySKoQFnLIE=;
        b=Wppg+EpMpINu+lnhR4ET1GHIseBJKvpjE1Y0ron5Lu4tUfBE4MM6673SqBCAJLkKPT
         9vxTuffieziEhwRvWvmKWYj3n5A1N6aw5MlqmzftKk7t0G5ZoyKqt1POqPkIev5eWQyr
         7i155bC7JD29tF/WamggHcPqDY4VKpU8SrIS9BeooQA0BXvJNR50o3Zij6T+pJAwDZpM
         veUZaseS2NAZdAnDcYwOtILYT3oXsvBRFIK4jsxR+bjuSZx1w7FbAvVDFMHXx5Ph4UTq
         zXj5hNsvFq4K8hAOKxEJIlZokofB88ydAHj05/k1Xf5Fy/Zp0VdnwIrlDQhX/pMVb8aJ
         4evg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778525466; x=1779130266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LMjDPGDJ+8xslo2jimMn/IGPGbD0V+wq+ySKoQFnLIE=;
        b=DFU/87jxZ9lI8TNWbNoqSqCV2sl3WKJbqjFGfFWcnQSs7oAJnSaiH4gR6WI76eecpE
         BpPD6y6zfRI9YqR2dhDQWlF/N2+DAPwiMgp2gATPwImGuamURLn6kwh8MQRyoDKT06mu
         TPN2iyxzd/5zOrnJjAQS6pIkebm++WZg4/5wf308E0+QKAYBCXdR8R/dk9JxG5tLaMuh
         F5kXY/AYKZEttTklZmlvpnKRUDRwS2HUfo0RTCdDjQFlBKvVwfyf/lq7sW5lEHQNfsaW
         5vgdZcrJMLu/rpLoiaCp9QaZ6XzXP5wJkmyXSHXQBGmmUkv33zgwWuX0oaryXtRzkX1w
         Afxg==
X-Gm-Message-State: AOJu0YwUV4hwe9bALegOoPtaqgKziQ8EQG5Q7hqHyxU5ouarAOZncQ0I
	h2dBS3un3fryfWnVMR6ZXzg0F5zlj3bGlxtZEBgngeqDm5lPPxHoD/d5
X-Gm-Gg: Acq92OG+X4h5nlw7fWO6YrbChRcvGSeqh155hb2ajuiBYCw2HTMz+ja0R6IuHJT9t3d
	Bqwuj0npeMaMcg7zbrt/pjPzgH0+1YthqFhEcN2cd+FCq40llc7lkmblZCHDxBFyDtlnh9ddwnh
	X770qTUrFzi1QzhJ+4uWHj4unXL9HJMpouUEPnjWa+/Ix1LG/M9jj7ppY/lIf1nY2W2pdt5Sqhw
	7Vk+PqIaSzw9GPS4BeWi4F+8LBhK6lBjNqlzZUeFLXtrxMcu44Wfc9DF7zrTqJty6Frc6R72jdd
	zguQ9YlSJt9CivvgyK721JuGzOFyVGzecCJc6TEmD/qQXC7E3mojxuQ4zIoJ9X0igzEjDbu7Y0U
	on4vrsA7+0RnBPxh6+UXniEiJ3nyhcadhkVracgXaMrBGHT8hHUJoAhhYa0VFaAmNbDEyv1q2xD
	7xfVsg4zMI0wj5/hcRrb9G+gjV3DzKtSJ3s2ryZOzi5eFEYho6it9XY7G1xt5ul+zWb8BrPIpwW
	QPnTtLT44wUgrQ6kVBxR6iRv/QegsuzKT2a3w==
X-Received: by 2002:a05:600c:4355:b0:48e:85b4:ac7b with SMTP id 5b1f17b1804b1-48e85b4ad2dmr36220615e9.18.1778525465458;
        Mon, 11 May 2026 11:51:05 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:e687:6094:b849:9886])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e8f3cf0cdsm854775e9.2.2026.05.11.11.51.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 11:51:05 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Magnus Damm <magnus.damm@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [RFC PATCH 1/9] dt-bindings: clock: renesas,cpg-mssr: Support RZ/T2H system controllers
Date: Mon, 11 May 2026 19:50:50 +0100
Message-ID: <20260511185058.1926869-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260511185058.1926869-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260511185058.1926869-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 806D0514A03
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32398-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	FREEMAIL_TO(0.00)[glider.be,baylibre.com,kernel.org,redhat.com,linux-watchdog.org,roeck-us.net,gmail.com,pengutronix.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	NEURAL_HAM(-0.00)[-0.970];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The RZ/T2H SoC features system controller blocks for low-power management
and access control that reside within the CPG/MSSR address space. To
properly represent these hardware modules, allow them to be defined as
child nodes of the CPG/MSSR controller.

Update the CPG/MSSR binding to support child nodes by adding
system-controller child nodes using a patternProperty, requiring a reg
property and a renesas,sys-block property to identify the controller
instance.

Restrict these new properties to the RZ/T2H SoC to ensure existing
bindings for other Renesas SoCs remain unaffected.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../bindings/clock/renesas,cpg-mssr.yaml      | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml b/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml
index 655154534c0f..ec13fcaf763e 100644
--- a/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml
+++ b/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml
@@ -99,6 +99,41 @@ properties:
       the datasheet.
     const: 1
 
+  '#address-cells':
+    description:
+      Required for the RZ/T2H SoC to define the address space for child
+      system-controller nodes.
+    const: 2
+
+  '#size-cells':
+    description:
+      Required for the RZ/T2H SoC to define the size of the register
+      blocks for child system-controller nodes.
+    const: 2
+
+  ranges:
+    description:
+      Required for the RZ/T2H SoC to provide 1:1 address translation
+      from the child system-controller nodes to the CPU address space.
+
+patternProperties:
+  "^system-controller@[0-9a-f]+$":
+    type: object
+    description:
+      System controller child nodes representing sub-blocks for
+      Low Power Management (LPM) and Access Control.
+    properties:
+      reg:
+        maxItems: 1
+      renesas,sys-block:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: Index of the system controller instance.
+        enum: [0, 1]
+    required:
+      - reg
+      - renesas,sys-block
+    additionalProperties: false
+
 required:
   - compatible
   - reg
@@ -126,6 +161,10 @@ allOf:
       properties:
         reg:
           maxItems: 1
+        '#address-cells': false
+        '#size-cells': false
+      patternProperties:
+        "^system-controller@[0-9a-f]+$": false
   - if:
       not:
         properties:
-- 
2.54.0


