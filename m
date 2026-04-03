Return-Path: <linux-renesas-soc+bounces-30841-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iPcZNMuOz2mmxAYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30841-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 11:56:27 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A7F39309F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 11:56:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1BE823083E21
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Apr 2026 09:53:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C62CC39DBED;
	Fri,  3 Apr 2026 09:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rfXOxFKU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB10A39B96A
	for <linux-renesas-soc@vger.kernel.org>; Fri,  3 Apr 2026 09:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775209821; cv=none; b=Z5ZYGw9oBkqit02rdHhh4TjnLg/TnC1MTHMBV3aSgHHRz5rcw2yoePcz+PUeKsllgiKNybciTalA1qDEJ3ToQ0xUlwaXgYpgLov4qe7Tb1UMgKLEBNxoRGWTZJyfF6sYg5TVnTmUdtVU2+2DroB/rR6UdcriVOZHUJvZEm3v0sM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775209821; c=relaxed/simple;
	bh=6ugWwfQ5L0iabK8CMZr+B4V7AT4RC9S6pPlq4Ilxjxc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F8km7hKb1vc6YPRWYJUwe9IhkU0Y49Yh2V+IJMLxYNBrU+qBcfC01oBaiJCtUcgWW5UynLiGdBfDekudIyqTGq2fgdlYJnG/JhSFtdnVbnzJ4n7hrmbAnsDad1/g1Hl+3dDb7FnZSfpn12gF3K87UigIqiOpyWf8QAGaI20m+Qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rfXOxFKU; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4853e1ce427so21734405e9.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 03 Apr 2026 02:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775209809; x=1775814609; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jbdj/CfPzvOfHuEeqbKOKvVft4NyhHKd3EC2N1Thlq8=;
        b=rfXOxFKUe669fED/C70yEKWrycbl9+D2etb/qUGXs1OOFYiwiSChxtiMRr3bqXTAeb
         3G8mx9smvCKZ07/2LLYNOLbc5hif4moFSf6lpgfzIsCDo6FCAMUc8TJuWeBf4hXbP4OO
         +Le7xrrmqBdgn8VwyG0ciUVqHzbi16ki+lCWMu54V+u/rvr0k0JEy7axLJrEnEYl4TXI
         8Rm7EjuaKmdxpYGhbXu+tXgP4zldEKXnqs7GR2N2A9hA/8Ij6OdPEblvNzho4F5JER7I
         CUUqavOcqNWD8EH5+99Q2ukKpKFfnIC9ET4q3qWUDQkZl9dHyL1l0SdK/prKnunc5BMI
         VZYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775209809; x=1775814609;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Jbdj/CfPzvOfHuEeqbKOKvVft4NyhHKd3EC2N1Thlq8=;
        b=e6PWdRPWWPTalmhSyzLzfl4C3AGmRLqzNFj4DKiWGRthaobQeI9YoASa0G13MfLrHG
         awcJoQBQVr/TOpZOjYVXQbDrYqn4HBuPegjllIA+/qAhIVp2UO/jYdp1Gwa6aZLQ0vcu
         QF6RZus3QqT2tz7r2gTc3UmMugHRghg4Z+1EDiTz+nGyqsxIOCFZuUooKw+FccjgUifh
         W8QQty77j3GkgsPhjDpnaEiSlXZyhqyR4GB73sgrEFgA6ZB7yyHRLZkLZgEhkXFWj+hX
         ahq+s8HV4GEr3Cx6O4F38zDNmVJe3yWAEZUEQUsSJeeaPvKf1f06SYyHlAFUIMk2poSH
         RB6w==
X-Forwarded-Encrypted: i=1; AJvYcCWcIJI2O9Yc58l074M7eEnfa2DzPLnmx6jBbS+Y+yaMZxXauygOlua3zkPZNUmtPjXvDmZN5joYG5nH1Q0IzNbrxw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxQ3HC9pIM5KRyaaUFSV2ZYfQCIV7Wefbv+UbGCOzTadKxihHqM
	dic/cGWlJGUvkPeWwxSbrmeCOsb+IYVxbyMWHWKC96tFs/seGUZfRYSp
X-Gm-Gg: ATEYQzwR2BSf40Ek3m/aURBoefChsqRs/qPmzAM+EC06vACVoD5a1i7Og5+fdlZ5bof
	2CwNvwcoytU0Xq7xsJ5F8YF+I3Uvw1kKS7X2KuQLvSIGk6K1PIXEtUZT19Cj81+CvM7If7kEyl8
	kCw4+/PEJd3GWpaoZJ/9q28mQGj7jLA/Z4nHgv8FHrlYYAZgcjR2nCCfn+1B07jtpueLpkyFXn0
	e2aelxjI3eTUZSMS07GAretkWwZnD//L6MUfky0CEW/4zSUi+eoBqhWgr5aucfTnCpwgr0gffvr
	Mx9OCkLkELxDvj/CJCHGsEMs9M6y9irr1Ippb6qt2yCps6wVZ6ceDtdg+XPh/qhnl8HW8A1LPyj
	bQXFQZUrYq9u4qFDIA4vB4Vcd75pGQ5OwhsXxAqTjMWCsXgmccL6LQNxQOyF344YS/jEt2vry+p
	8DApw8RH6EIhD4q6Y4Gl23UDn3NenQ9W85ENVyNHH5ZCw47ml2
X-Received: by 2002:a05:600c:8b84:b0:482:f564:d613 with SMTP id 5b1f17b1804b1-488997b2345mr35984745e9.15.1775209808745;
        Fri, 03 Apr 2026 02:50:08 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:58b8:b4b6:c8e1:8690])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48897fc89c0sm25965355e9.1.2026.04.03.02.50.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 02:50:08 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	linux-can@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 1/3] dt-bindings: can: renesas,rcar-canfd: Document renesas,bus-off-recovery-mode property
Date: Fri,  3 Apr 2026 10:49:58 +0100
Message-ID: <20260403095003.104542-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260403095003.104542-1-biju.das.jz@bp.renesas.com>
References: <20260403095003.104542-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30841-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,renesas.com,vger.kernel.org,gmail.com];
	FREEMAIL_TO(0.00)[pengutronix.de,kernel.org,glider.be,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: B2A7F39309F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

Document renesas,bus-off-recovery-mode property in the Renesas R-Car
CAN FD controller binding. This optional u32 property allows selection of
the bus-off recovery behaviour, supporting four modes:
0: ISO11898-1 compliant recovery
1: Automatic entry to Channel Halt mode at bus-off entry (default)
2: Automatic entry to Channel Halt mode at bus-off end
3: Entry to Channel Halt mode in bus-off state via program request

The default value of 1 ensures backward compatibility when the property is
omitted.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 .../bindings/net/can/renesas,rcar-canfd.yaml          | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yaml b/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yaml
index b9d9dd7a7967..4190e514a7fd 100644
--- a/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yaml
+++ b/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yaml
@@ -154,6 +154,17 @@ properties:
       communication in Classical CAN frame format is disabled. Specify this
       property to put the controller in FD-Only mode.
 
+  renesas,bus-off-recovery-mode:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [ 0, 1, 2, 3 ]
+    default: 1
+    description: |
+      Bus-Off recovery mode selection. Valid values are:
+        <0> : ISO11898-1 compliant
+        <1> : Entry to halt mode automatically at bus-off entry (default)
+        <2> : Entry to halt mode automatically at bus-off end
+        <3> : Entry to halt mode (in bus-off state) by program request
+
   assigned-clocks:
     description:
       Reference to the CANFD clock.  The CANFD clock is a div6 clock and can be
-- 
2.43.0


