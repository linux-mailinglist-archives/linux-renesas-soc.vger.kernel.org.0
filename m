Return-Path: <linux-renesas-soc+bounces-27512-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uL3uBMb0eWnT1AEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27512-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jan 2026 12:36:38 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AA5B9A08A6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jan 2026 12:36:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C1ED0305CAA5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jan 2026 11:32:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B3E634EF02;
	Wed, 28 Jan 2026 11:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b1UXqsgx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A572135D7
	for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Jan 2026 11:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769599842; cv=none; b=ZQlLK3DkPV1eEk1r9dU1b0Euv32BG5R5S2+UYIi2VS0w3j+f9iuLaYk6dV3kw8XsczNkBroeVdf+Kp3b6ccAxWOMTdq0cUaslu0FI/5Y4irmCoRK0OS2cMS0jSO2OIe0lmL1x+ueU++6tvnuVW0NXYMmaUMy34ZQkM1F4I66Lxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769599842; c=relaxed/simple;
	bh=/RCaq8Nf9DK3BBKk1+1Bzr//w+kvr95FiZjsjcdJyuc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m/sKKSgzYKG0HlBFQ+zEm/N7JUOqvUu+Gpj0jnRP4HF4jBaTis7+1Xm+vJIBUECZYrfy8TGp61wfj4rZjREkZQmFImOMqVUsBfjftbHQ1iAeLOKKwvk94g0bwiMMdZVjY9n6tjHcoxzD7XhMgOKbsdD+g70y+179U9kwJf7FH8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b1UXqsgx; arc=none smtp.client-ip=209.85.218.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f66.google.com with SMTP id a640c23a62f3a-b883c8dfb00so1429526066b.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Jan 2026 03:30:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769599838; x=1770204638; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nGs+LR4jbDBowtza76Mu6Qaa4SHKRymwud+Uk5Ptu8I=;
        b=b1UXqsgxL1qixfvA6+Dk/N8qe36z0OO33GJrECZ/Fq1mM6q5k/A8xnblVCFMkdSmKd
         nNaeS61oq4SKIme4o8OVaE4Us+NHhngFczWEZJwK5frnhoLBuwF29KC4PeglDSr8GoYX
         3v7RFRp/SydPT5rYiUNpCQgR91dy/igMNTCHjqw3DcMUbwpp0Rzdfq6VOD3CX+B6zc+I
         1UM03PmwpwTBhtGo5PlD4bYqrsdGwt/vAGQp/TuMinq5JTOGY3KAdDdVpHSeYU7H1Zxa
         ae7F/0+FzTU5aW/47qqp57oRHu6LTKz4v/CPRcfrb3LuS0U9GtsOtPdzqKNsU8BAmjoP
         DS6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769599838; x=1770204638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nGs+LR4jbDBowtza76Mu6Qaa4SHKRymwud+Uk5Ptu8I=;
        b=FpnjK2U7s7K0BHeuP1MLPdKyYRRAbKYeCfHbeHoDM7BpsAQdS7vihsXiuiShq2sr7e
         29izu/H9E5m4WY8SGPnf9NMmWgANCLAK0pHMNT849yCkcJErGgyhj27ZrZyRZ6Qw5XJn
         6oWX74N3VUXC/uKkO9sq7Aw6BYvkSR9Y07CVbYabec21LR1Wb3QIi950gd90Ym6a/xFJ
         Aw2MU06Xz2aRGtH1nDlCSVJRLOJzMBrQGZOqKD62CC4tLKYFD9uwI1kYTtw2oW/iQsCi
         B3ocruAtBw3WAV3CqM9iNxSo4Xd2WPJrh3vSuQVMwYEgcgAr5tt7LjjykxjW899hulVg
         TpSA==
X-Forwarded-Encrypted: i=1; AJvYcCXZIe4KzJpXhgqd8mR8DLJZvSEZ8PgZQUI3R598lItZseu211BHw6o8QKji3M0PwfCP/PP+sB1Csm4zDECNixvYyg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4JeBuDN4Qfem4TI0LInD4QZhNMe6tj70zVU3G2VM9CLb7LfGG
	2KXKHUULbu7TOHqls03np3H0HkrnWOPZfLzLnfGIFxTYo6MrU4qyNyTY
X-Gm-Gg: AZuq6aLHdVQDlUduyK2KGKJoaqxujJfL+W/PLF/Hda1p8VIMBLqtiQBNSBXwzxgwBuM
	WkGIzL1DIkhL2ETLbs++FdGvyb08+dST8PqHJPz5DHAuMbXnRLt19V7NRTY8y8HauOZ8J/aTXA7
	RasYiSHRMyx6nM4KtXSvZD8kIgnTtauUMVH3yROPHGGK+mXPYTU12ndUl0313pLgdE/nm0ZLQkr
	Dc7uAcV69NybjIsDN+9xXPxvBSAWl1oMlhIaC1cniylXVNeXBpfG62Ug0J2wHjg4GrfjJV/vmYm
	eWSuvJdvIKhpDkE0GD+gBSMzme+Pf0Cz+BFuUDX1b3+HOE+X93kad3flg9qVxCCHpxmL7ntjxsL
	tosMcSI83noswaPidQeLnq+CjVS/Rev10vBL4PWUgh5k4R7XsCOXCKinCQoLVxiAKkOg6LfnQU8
	v/2tA7yUen1FnkzcYCV3fPKfqNSAgjExzcX0I=
X-Received: by 2002:a17:907:e118:b0:b8d:be69:78c1 with SMTP id a640c23a62f3a-b8dbe698346mr174031866b.46.1769599838005;
        Wed, 28 Jan 2026 03:30:38 -0800 (PST)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:e29d:6e0e:72c1:d15d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf1baa42sm114400366b.46.2026.01.28.03.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 03:30:37 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: [PATCH v2 02/10] dt-bindings: soc: renesas: Document RZ/G3L SoC variants, SMARC SoM and Carrier-II EVK
Date: Wed, 28 Jan 2026 11:30:21 +0000
Message-ID: <20260128113032.337231-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260128113032.337231-1-biju.das.jz@bp.renesas.com>
References: <20260128113032.337231-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27512-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com,renesas.com];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: AA5B9A08A6
X-Rspamd-Action: no action

From: Biju Das <biju.das.jz@bp.renesas.com>

Document Renesas RZ/G3L (R9A08G046) SoC variants and the Renesas RZ/G3L
SMARC Carrier-II EVK board which is based on the Renesas RZ/G3L SMARC SoM.
The RZ/G3L SMARC Carrier-II EVK consists of an RZ/G3L SoM module and a
SMARC Carrier-II carrier board. The SoM module sits on top of the carrier
board.

Reviewed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Squashed the patch#3 and #4
 * Documented GE3D/VCP for all SoC variants
 * Collected tag
---
 .../devicetree/bindings/soc/renesas/renesas.yaml    | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
index f4947ac65460..5c22c51b1533 100644
--- a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
+++ b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
@@ -548,6 +548,19 @@ properties:
           - const: renesas,r9a08g045s33 # PCIe support
           - const: renesas,r9a08g045
 
+      - description: RZ/G3L (R9A08G046)
+        items:
+          - enum:
+              - renesas,smarc2-evk # RZ SMARC Carrier-II EVK
+          - enum:
+              - renesas,rzg3l-smarcm # RZ/G3L SMARC Module (SoM)
+          - enum:
+              - renesas,r9a08g046l26 # Dual Cortex-A55 + Cortex-M33 + GE3D/VCP (14mm LFBGA)
+              - renesas,r9a08g046l28 # Dual Cortex-A55 + Cortex-M33 + GE3D/VCP (17mm LFBGA)
+              - renesas,r9a08g046l46 # Quad Cortex-A55 + Cortex-M33 + GE3D/VCP (14mm LFBGA)
+              - renesas,r9a08g046l48 # Quad Cortex-A55 + Cortex-M33 + GE3D/VCP (17mm LFBGA)
+          - const: renesas,r9a08g046
+
       - description: RZ/V2M (R9A09G011)
         items:
           - enum:
-- 
2.43.0


