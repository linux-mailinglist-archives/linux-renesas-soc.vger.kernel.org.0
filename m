Return-Path: <linux-renesas-soc+bounces-31787-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sPmmE2kr82mwxgEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31787-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Apr 2026 12:14:01 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 02AD24A0999
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Apr 2026 12:14:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 34B233046245
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Apr 2026 10:09:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 666233FFAB0;
	Thu, 30 Apr 2026 10:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IDEY+1D2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA2F3FB06F
	for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Apr 2026 10:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777543786; cv=none; b=ttg5Uy9OJ3vBZsOdAGd/A+idXp+4x7kASrkSEJsgVfEyGNpNQBwG8fBecPGfzj87XUA72GiYRmOoNsKvQGBl9EhGNgc0T3O2lncDpZCxfiXeMTuR5YZdPciXdtszMbQGgwo/1SGLmGrzc4OYzS08S+nE3La09E6l+TEfBAMRoAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777543786; c=relaxed/simple;
	bh=4Uow7JtwP8wIC6uXE5DiKRkf4rLthpWrcREBxzAuo5U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bEPGMklmM2LvBVIDEwnmt7F98K2w0jb7TY30O49SSttR9nMZlT3M7rPRoudSqQEoX93rI6ehUdo1WpvwOwJ+sea8TRmFJc+oeKdfCg3xNtnR1vFjdXjFJzx9eYwqfvbnAmq8eyAZbLUh3f5O8Ps06b6hw96LrS70mmm3BusfQR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IDEY+1D2; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so12319565e9.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Apr 2026 03:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777543783; x=1778148583; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4y5kIb0htxIVCSVgKsNlWw6RNkql9GPVnfbTeqYcIWw=;
        b=IDEY+1D2f6YKldIHmLbyUgLSnKh6js/+Zw8dnnsIgFETpb+fqpPE2a4ltGfMAef4cL
         GEuRrwM0qS1Fmlx1kBhHgYnrX+jfGhgbGPQQ70Wg79/nrBJXOP17Kiw23iZ7bjoNJ9bh
         qGT+Dj2vMj2IDF1KjLeKhsP2rnvds1FPSOWb/P23mCn/0/WZF4jvST16l0u1w6Jq/zW1
         4tDdBo14KZ46rMYha4KePLTd7vW5fx96Bj6pS5WOqpYZWfTx4ZH8Gmo9bCszrvyjqrSV
         V+TNZv2LHqmCk2mRkFiXOmulILQPaqtAkeMrm9nsWuAmv2EYabwdZeS3BsS0wevYfjJZ
         wO9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777543783; x=1778148583;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4y5kIb0htxIVCSVgKsNlWw6RNkql9GPVnfbTeqYcIWw=;
        b=AAHI5lybc+M5NvSW4F5F8gTUKclSYvn/QEKSRtYrNt4/kRFaxSMWEerAmxJbM7FSqK
         7tTEASimDsySHL1AxqVyjas4/66fHhoshCgqmyFyz1JpUbvVuqumJFHwLzWw1dfeMGfP
         pOPID9BDeUS4HNB7aEBjK8Dq7bXIU13u9PIOgyM+7NqsYtAvl+ZFIikwfW/WXoBy0mQH
         ZS2qys1exPV+bfzfDfJIw+szD9p7KORb0vlcLoTz8EZRTfJigeWCcxtaxFX983mi0P1w
         Y05nQ9cM3wn0MfwWBjrL+OCIypMWNMff49doqZntQLp4wkX3YYQcDTDFAlqnjaNmHIhD
         lLtQ==
X-Forwarded-Encrypted: i=1; AFNElJ9c817GqW4Rp/gC7C4W5cVKRRTgwOg3VLIbXllABcwYfSKNLVXtnbNc27mMgS+p9XBOx/d6m07WJeZrq9h1J3DcdQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyDkyB0NPhbRoUvkKpiPdDK/H2XNF+ocp1ZUR9ZHql3QJaRJV+i
	jF4qyZnDQPThZT4fEBn+Ng2iGY4cQMnNZQ4nihytWshj3FOnZW6U48e/
X-Gm-Gg: AeBDiesW0Ztd22n86NupxsrrA1oCmpgQomo4hGtZ7PTr8VJ/2qnGnANGXuOkbP0uKF+
	4hPdi4ALbpKJmBbVMC95j0rHK2qGd4PQ/NsHTyVAInthl2jF4PKVRHBGMDRjnETT5EZntWxSLx9
	Na2qMq1pv9uuhllLe1sc+ak9874yucKZPLZyW4Ze/Ylffc5DG7XwsBDk5Ul4KNh/5aV669JW1gO
	+l4FxgYqE95L2Q8gh1HKkFSndo2xLVaV6HLlr1R/T2P/3ZMgKMaBnypf9p0wP2sinAejicRaePy
	jTkJAmn6d8SRRZgfkr0E8e1VoBRQT3khASpJO2/c4jgxqdt7vYwUwmxgYi1kkLd5FpLtXCQq2gI
	06vw6aZSfyqJY1lYMD4nh+TjSaJxyRlpChENemrkKlt6Nd3iZEEtbQ5gS6tqjioJkwRsfsvRQ1W
	Yn3TLPa4EkWxvffIzC9XvpqbFfuajbLPbVWnYFRZehSYjjG6Ok42/tobu8QzBDrybL7RfJE13id
	rGovkEMItegLBlEH1kYtOuhCn0Kh6z37Log54PhzUXDsQKHjKIKcsgtEO/sF34WjxGj
X-Received: by 2002:a05:600c:8010:b0:485:46fd:7887 with SMTP id 5b1f17b1804b1-48a8446d8a4mr36742495e9.13.1777543782926;
        Thu, 30 Apr 2026 03:09:42 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:182e:1592:d4cf:18a0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7b9313c9sm40252315e9.11.2026.04.30.03.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 03:09:42 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 2/3] media: dt-bindings: media: renesas,vsp1: Document RZ/T2H and RZ/N2H SoCs
Date: Thu, 30 Apr 2026 11:09:28 +0100
Message-ID: <20260430100929.1088281-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260430100929.1088281-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260430100929.1088281-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 02AD24A0999
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31787-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	FREEMAIL_TO(0.00)[ideasonboard.com,kernel.org,pengutronix.de,glider.be,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-0.988];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,renesas.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Document the VSP2 blocks present on the RZ/T2H and RZ/N2H SoCs.

The VSP2 implementation on these SoCs is identical to that on the
RZ/G2L SoC.

Update the schema to disallow the "resets" property for these SoCs to
reflect the hardware integration.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../devicetree/bindings/media/renesas,vsp1.yaml | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/renesas,vsp1.yaml b/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
index 803358780f01..a28632165804 100644
--- a/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
@@ -29,6 +29,8 @@ properties:
               - renesas,r9a09g047-vsp2    # RZ/G3E
               - renesas,r9a09g056-vsp2    # RZ/V2N
               - renesas,r9a09g057-vsp2    # RZ/V2H(P)
+              - renesas,r9a09g077-vsp2    # RZ/T2H
+              - renesas,r9a09g087-vsp2    # RZ/N2H
           - const: renesas,r9a07g044-vsp2 # RZ/G2L fallback
 
   reg:
@@ -67,7 +69,6 @@ required:
   - interrupts
   - clocks
   - power-domains
-  - resets
 
 additionalProperties: false
 
@@ -101,6 +102,20 @@ allOf:
           maxItems: 1
         clock-names: false
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - renesas,r9a09g077-vsp2
+              - renesas,r9a09g087-vsp2
+    then:
+      properties:
+        resets: false
+    else:
+      required:
+        - resets
+
 examples:
   # R8A7790 (R-Car H2) VSP1-S
   - |
-- 
2.54.0


