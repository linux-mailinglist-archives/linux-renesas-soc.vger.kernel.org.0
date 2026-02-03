Return-Path: <linux-renesas-soc+bounces-27814-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eFl3OdDogWkFMAMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27814-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Feb 2026 13:23:44 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CBB4D8F5F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Feb 2026 13:23:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5F9AC30E46A6
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Feb 2026 12:17:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 229E833EB01;
	Tue,  3 Feb 2026 12:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l2UeWlRe"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C2A533C53F
	for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Feb 2026 12:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770121049; cv=none; b=lM3d5RAm+0WRGBnT2aeeKZe6EKu4jaNOWh3VYlItgcKK39AeXfRbHXPSvdF5W9OW+kkO0+dCRsdBnuynMCQ/AoCcYNxUTH4D5rvlkdQD+TB/7vK+Ozvf7s1uitovRFzRWxRu0208o7YbEXCbucinvJWANBiUl2tIV4OX53H94Hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770121049; c=relaxed/simple;
	bh=gninZlBoLuHNxge4GK5ffuEcWrBCJW7xBMyZoit0cSQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LMmfmYPSHup+723wJDBPdNnIfVmGzgEjnRtoHVXef6aXd1tE337e9WJ3nm3m03I9nzbEFniCfL50jBd1lFt2N9ivVTd9D2RlaqvNZvWc8fVUCX+vsDbim97DDTnVH5uARZT5TTz+wDn1ZS0enRzqEbg+c9rIo0NXkYGLWXMMBEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l2UeWlRe; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4806fbc6bf3so59310135e9.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 Feb 2026 04:17:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770121046; x=1770725846; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fcy8M4BGhMrAt0/LmVopycDbCegF7gwE/HhYCJa6vg4=;
        b=l2UeWlReGN5RKajqvFD8OpnPtmrYkmCLDlD2uf0WV3VcsKlWIowdYrObskQA+y735b
         fd76Mjhh9LExpS4yY5mtrBEKNW7llQBzSu60VGR/hcjurP1AdBcR+yHDUAtdV/tl/eNL
         uUmozzaVaiKyoHBhn1o722CAs1ReE/6GmszA6PuQgnMM47dFUF7gYeNvb92TrX2eD7bL
         NAKqPmntTVz8d60vvDXrqW+ASJtQOpgITRxDHCgDBnptK6uT5Dob3BAq3PGD3QZ3a4pv
         SXJFaSdtyVZvncPfXyMusnNPvPHGNRbET1qZkg+q2GAJ17ggWwo8UqDTuF6m80KYUmD0
         hjXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770121046; x=1770725846;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fcy8M4BGhMrAt0/LmVopycDbCegF7gwE/HhYCJa6vg4=;
        b=IEJycEdccO40Pr3Id9AdQ8Zp9dlQ4U6z5GlArqauuJCqiZtv8Ect9YIaUzons8jJLA
         DwzQnggW9rJ4IgQyjx+LpUgR2Wvno8SMomeUU18om+BsgF/cMgb3oMt9wlghwRZI0JTy
         tJmrUNFPObI33XuUkvn58kAUi3V7kdG6K/HaM5FV1ryEJBzeFPbxOeeo+hpvwRV7w8Fl
         J7QWYNCoM+UaXADYBl5hE1BZ5SmuCJky4Yql0oy7j65fGVUIHgKfIXYteJgdN8Wh0omA
         x/Pz6bwEhGMXuDjDKy6MmfP4ualKxkeTRIwSfDjT2DZolInqM244hPH3oGkBDKZcn0CJ
         FShw==
X-Forwarded-Encrypted: i=1; AJvYcCUVV3UrYj23WQTANNQJfWPr4Geeqx7nxRCcBiMYUzGA+XCHdmvO7RJuf0WGnMJKsNFlEdJMtpCXsk4VWXqlfQJqmg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwqKYeRAdwhhxHcxYgN6jEZ2JyshDyArIrJAlRvzyVIszOeKx7d
	hBjPFDIh61VMqwdGOoMG918oPlp1V7e+wjQAs7nUD4cxbt41gwdiP4H5
X-Gm-Gg: AZuq6aJR9xCCou2t1p+xvGerXpiaDvJQStz2wjG1NzEJT3Yy5otb2+x/7Z38S1n5SjN
	REeNPF6DDYtq6gGm1Lmn1A82DZt9UY4TWkdbm5jHmV4bah1pv+TW5bARrHPd4EVdOunh5vydvTk
	GqeipTyLno3jCH1jPtCaQAGBLG391KEtQwmq8lWp6y+30luNKXje3vKtyhE2AaLVnMwbMa1dYk/
	D724ClsAb4btrqaGrn+LAyBz0oqZfySh2yDC4sD1rCd1atxrxUNxunfGhDLXp5Eqt7/4yzy5IWi
	Eq1dlYEXCYvh+lkQPzmQ2TRdBSRr9MInaO3wyJbJf8G4W8LVXyuw6Bv2Q+/a64fFsEpydeOnWrB
	XUj7vX5CmFzrn0JkwCV5YoLT95mmZFQqOYY/xZYpSAJqJAnt8ObuRg9+1+vHwLpEZ1CLdrPlG9k
	S5u2Qo1Iv0sgL+ZvAfb+eXFfDOi9It
X-Received: by 2002:a05:600c:4451:b0:477:639d:bca2 with SMTP id 5b1f17b1804b1-482db457724mr217768105e9.4.1770121045688;
        Tue, 03 Feb 2026 04:17:25 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:9cd9:f748:166d:55fc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48305129419sm56042495e9.6.2026.02.03.04.17.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 04:17:25 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Stefan Eichenberger <eichest@gmail.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH net-next] dt-bindings: net: micrel: Fix dtbs compatible too long warnings
Date: Tue,  3 Feb 2026 12:17:21 +0000
Message-ID: <20260203121723.312336-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-27814-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,gmail.com,vger.kernel.org,glider.be];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: 4CBB4D8F5F
X-Rspamd-Action: no action

From: Biju Das <biju.das.jz@bp.renesas.com>

The KSZ9131 PHY is suitable for IEEE 802.3 applications.

Fix the below dtbs warning "compatible: ['ethernet-phy-id0022.1640',
'ethernet-phy-ieee802.3-c22'] is too long" on the below dts:

r8a774b1-beacon-rzg2n-kit.dtb
r8a774a1-beacon-rzg2m-kit.dtb
r8a774e1-beacon-rzg2h-kit.dtb
r9a08g046l48-smarc.dtb
r9a07g043u11-smarc.dtb
r9a07g044c2-smarc.dtb
r9a07g044l2-smarc.dtb
r9a07g044l2-smarc.dtb
r9a07g054l2-smarc.dtb
r9a07g054l2-smarc.dtb
r9a09g047e57-smarc.dtb
r9a09g047e57-smarc.dtb
r9a09g056n48-rzv2n-evk.dtb
r9a09g056n48-rzv2n-evk.dtb
r9a09g057h44-rzv2h-evk.dtb
r9a09g057h44-rzv2h-evk.dtb
r9a07g043u11-smarc-cru-csi-ov5645.dtb
r9a07g043u11-smarc-pmod.dtb
r9a07g043u11-smarc-du-adv7513.dtb
r9a09g047e57-smarc-cru-csi-ov5645.dtb
r9a07g044c2-smarc-cru-csi-ov5645.dtb
r9a09g047e57-smarc-cru-csi-ov5645.dtb
r9a07g044l2-smarc-cru-csi-ov5645.dtb
r9a07g044l2-smarc-cru-csi-ov5645.dtb
r9a07g054l2-smarc-cru-csi-ov5645.dtb
r9a07g054l2-smarc-cru-csi-ov5645.dtb
r9a09g056n48-rzv2n-evk-cn15-emmc.dtb
r9a09g056n48-rzv2n-evk-cn15-emmc.dtb
r9a09g056n48-rzv2n-evk-cn15-sd.dtb
r9a09g057h44-rzv2h-evk-cn15-sd.dtb
r9a09g056n48-rzv2n-evk-cn15-sd.dtb
r9a09g057h44-rzv2h-evk-cn15-emmc.dtb
r9a09g057h44-rzv2h-evk-cn15-sd.dtb
r9a09g057h44-rzv2h-evk-cn15-emmc.dtb

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 .../bindings/net/micrel,gigabit.yaml          | 23 +++++++++++--------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/micrel,gigabit.yaml b/Documentation/devicetree/bindings/net/micrel,gigabit.yaml
index 384b4ea6181e..284c3ba379f3 100644
--- a/Documentation/devicetree/bindings/net/micrel,gigabit.yaml
+++ b/Documentation/devicetree/bindings/net/micrel,gigabit.yaml
@@ -17,15 +17,20 @@ description:
 
 properties:
   compatible:
-    enum:
-      - ethernet-phy-id0022.1610  # KSZ9021
-      - ethernet-phy-id0022.1611  # KSZ9021RLRN
-      - ethernet-phy-id0022.1620  # KSZ9031
-      - ethernet-phy-id0022.1631  # KSZ9477
-      - ethernet-phy-id0022.1640  # KSZ9131
-      - ethernet-phy-id0022.1650  # LAN8841
-      - ethernet-phy-id0022.1660  # LAN8814
-      - ethernet-phy-id0022.1670  # LAN8804
+    oneOf:
+      - items:
+          - const: ethernet-phy-id0022.1640
+          - const: ethernet-phy-ieee802.3-c22
+      - items:
+          - enum:
+              - ethernet-phy-id0022.1610  # KSZ9021
+              - ethernet-phy-id0022.1611  # KSZ9021RLRN
+              - ethernet-phy-id0022.1620  # KSZ9031
+              - ethernet-phy-id0022.1631  # KSZ9477
+              - ethernet-phy-id0022.1640  # KSZ9131
+              - ethernet-phy-id0022.1650  # LAN8841
+              - ethernet-phy-id0022.1660  # LAN8814
+              - ethernet-phy-id0022.1670  # LAN8804
 
   micrel,force-master:
     type: boolean
-- 
2.43.0


