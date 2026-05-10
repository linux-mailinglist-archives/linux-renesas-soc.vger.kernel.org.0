Return-Path: <linux-renesas-soc+bounces-32314-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qEJ+GW5FAGqmFgEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32314-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 10 May 2026 10:44:30 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C8EEC503271
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 10 May 2026 10:44:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 03C41300D313
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 10 May 2026 08:43:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D7AA36A033;
	Sun, 10 May 2026 08:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BabbIQR7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B05A3612F3
	for <linux-renesas-soc@vger.kernel.org>; Sun, 10 May 2026 08:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778402628; cv=none; b=YbmAvTjZ2mnoM1zlZNyXaJ7ZqrcZK4PT70vnD1bF2HC+MmzZD4D+a/FETcWo1V01oxkE5WMG2qVGapgeYgGg4H86YjdYTMGxztijRqSGFsV0XYkIE+v/Vgwko2LZyTEDhjahD1TfYynj7sI7Sv/CMzvGnGenakVAl9bDsDt4EhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778402628; c=relaxed/simple;
	bh=NAsOp5VWFgwKRWRvG20Z6BUZo2fk8Rg0gpq73L+RkcM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DouYa4XDwCX95U9YboGYCSO5/Zb/iyfqtJ7AwGEwSn3yE7AdNVwh5pmSLLdkYAJGW8vV+/naJ/kH0cliG+LCSGXuBZdt+xbI4ClfJt3AIJMX37xyeKxkBDWX/SKudQCnus8Nl6Xk8uo0m+bE/JfGc2bqpRKzSMPn7InOWjLxGdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BabbIQR7; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2baef9f5ecdso15781185ad.1
        for <linux-renesas-soc@vger.kernel.org>; Sun, 10 May 2026 01:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778402626; x=1779007426; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MGdYxWBckVTlaOvEXVR7slFeLhH3KDi23p9+cqpYQPI=;
        b=BabbIQR7xhCmEJKtexEwxCTrP24KGY49wU1qj3eqRCDALVhw4auZbr6zeADdro6QpF
         28BNoevIa+FNuXdHGF6P6SBSNsiGH51Fa8PQtc6KGPWtkXhyWXX94UK0TVqsG36eIgwK
         O6eXp6nAKZzw0mJm44YkATCOOHCNuRYVJ6AuF87HchxLqVyq95T+4IlnPTd82VSVuxnF
         B2HfGkrb5Z1qi5Zy+rg4vJQNaE+O6aB/0R8yEPPrbnFaj7t4XRxHrDexyyAnr2qnU86H
         RH3jiaTlfHsdbloaUlgRSsdM5c+0QnKFeLRGyOexIbzFRS0/6j6+L2r22PIehYqeX43Z
         CMOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778402626; x=1779007426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MGdYxWBckVTlaOvEXVR7slFeLhH3KDi23p9+cqpYQPI=;
        b=KqhVIa65iCR33G+8Sml7H26Nvib2PmzzNz4sB8NCNBgZD3nqp/DEU5+5sXNYayOlkB
         FWWmDlSZOAPjLIpAXuh/5RzXo5kcdFAD5MOhtHkJpH7dBZkV+vjj9agzDisci/lt84Zw
         lFtM6UNCrWRFNEWvl1BruBVpDpkBu+KbAsMNJEBNLrnlCrM37mWzyScVavTf87ScyvH8
         BkACxGtqNQOLWyPX+G1y/R2q0a+37weCEU8sFG5vDvcIien/iAdQ/sqTB9T9DlCXTEba
         cWL4FYCLSPmjts91Eer94LYMlJpcaqdxlmjI+hgEnDApED6UMPUufc44MJFPEjiFw57l
         MsxQ==
X-Forwarded-Encrypted: i=1; AFNElJ8RYdmNPzcONS4sYzWtytc463EYRpXI+ejcOSYS0Rjt0yl8kWjK+u1WZBV3+6k3M7RQJGxh6vGxHNFbONwzBtC90g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVwv6uqCHoe3T3S46E9544w1EtcdX1g1Fbzxd4s4rII+RCDJCw
	DJP5g9aoOIJqDdRRsIKlhtCMuEQSA720trkQW51CiiLvX90ku/lb+JCK
X-Gm-Gg: Acq92OGRRyn77tYkY80O5Fd/QxT8pZMddZ6aNxvRGc+XVu644zoASI7jCZLjcqHu1UW
	KWi4HUPBUrmXPOY0lH1fHcbT2eBwiccsG8zSAoTCrLai3kpL65rhBS1a6lIMdX/4WDjih715BWp
	snKGZvN+HP/L6VKrfntwoGCLBMNhwr4k4VNPrEpLKMj65Wf12tr+NpCiAU82Kh0rODYbf3rVRWq
	NFNAWXehF7i7MVy4QJrDMkLqHVRDDZNgFilNK/r3WCIaoaBG6H6LYdEV7tYjWK5T71ZU230zIAi
	H28dA5MINUcR4fUvAGXFHyrR/V99nifRDAkMpSKN023Nc7aQP6WSlutiBxID2Jfc1raTP1TnHoM
	jiatWTkTw6TR96ECYtkZSzN6+vqtDxM8YjLXxPpgtDjwhL6b4U3DKUCSU5GzR7xILXDIWdr2P6K
	iVXVJBrrfbu7Ygamo4Rrn+SZk1IaT8u1wIKKbIW01GBnOvcNcUgd8zNz2UgsEFIcvvQ4+78TTlB
	MLA6u8=
X-Received: by 2002:a17:902:ebca:b0:2ba:6518:a6d4 with SMTP id d9443c01a7336-2bc7aa1356fmr59329735ad.20.1778402626428;
        Sun, 10 May 2026 01:43:46 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d3ffa0sm70471005ad.25.2026.05.10.01.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 01:43:46 -0700 (PDT)
From: phucduc.bui@gmail.com
To: kuninori.morimoto.gx@renesas.com
Cc: broonie@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	geert+renesas@glider.be,
	krzk+dt@kernel.org,
	lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-sound@vger.kernel.org,
	magnus.damm@gmail.com,
	perex@perex.cz,
	robh@kernel.org,
	tiwai@suse.com,
	bui duc phuc <phucduc.bui@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v3 01/10] ASoC: dt-bindings: renesas,fsi: add support multiple clocks
Date: Sun, 10 May 2026 15:42:54 +0700
Message-ID: <20260510084303.122426-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260510084303.122426-1-phucduc.bui@gmail.com>
References: <20260510084303.122426-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: C8EEC503271
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,glider.be,gmail.com,perex.cz,suse.com,linux-m68k.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-32314-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FROM_NO_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.991];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux-m68k.org:email]
X-Rspamd-Action: no action

From: bui duc phuc <phucduc.bui@gmail.com>

The FSI on r8a7740 requires the SPU bus/bridge clock to be enabled before
accessing its registers. Without this clock, any register access leads to
a system hang as the FSI block sits behind the SPU bus.
Update the binding to support multiple clocks to properly describe the
hardware clock tree, including:
  - SPU bus/bridge clock (spu) for register access.
  - CPG DIV6 clocks (icka/b) as functional clock parents.
  - FSI internal dividers (diva/b) for audio clock generation.
  - External clock inputs (xcka/b) provided by the board.

Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 .../bindings/sound/renesas,fsi.yaml           | 27 ++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/renesas,fsi.yaml b/Documentation/devicetree/bindings/sound/renesas,fsi.yaml
index df91991699a7..c50e7115b21a 100644
--- a/Documentation/devicetree/bindings/sound/renesas,fsi.yaml
+++ b/Documentation/devicetree/bindings/sound/renesas,fsi.yaml
@@ -38,7 +38,32 @@ properties:
     maxItems: 1
 
   clocks:
-    maxItems: 1
+    minItems: 1
+    items:
+      - description: Main FSI module clock
+      - description: |
+          SPU bus/bridge clock. On R8A7740, this clock must be enabled to allow
+          register access as the FSI block is connected behind the SPU bus.
+      - description: CPG DIV6 functional clocks for FSI port A
+      - description: CPG DIV6 functional clocks for FSI port B
+      - description: Internal FSI dividers for port A used for audio clock generation
+      - description: Internal FSI dividers for port B used for audio clock generation
+      - description: External clock inputs for FSI port A provided by the board
+      - description: External clock inputs for FSI port B provided by the board
+
+  clock-names:
+    minItems: 1
+    maxItems: 8
+    items:
+      enum:
+        - fck  # Main FSI module clock
+        - spu  # optional SPU bus/bridge clock
+        - icka # optional CPG DIV6 functional clocks for FSI port A
+        - ickb # optional CPG DIV6 functional clocks for FSI port B
+        - diva # optional Internal FSI dividers for port A used for audio clock generation
+        - divb # optional Internal FSI dividers for port B used for audio clock generation
+        - xcka # optional External clock inputs for FSI port A provided by the board
+        - xckb # optional External clock inputs for FSI port B provided by the board
 
   power-domains:
     maxItems: 1
-- 
2.43.0


