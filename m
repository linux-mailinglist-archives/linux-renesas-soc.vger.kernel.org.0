Return-Path: <linux-renesas-soc+bounces-27106-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0AKeDEIncGmyWwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27106-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 02:09:22 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD6A4EE5D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 02:09:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 561CC6A7ABD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jan 2026 12:56:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1859A436348;
	Tue, 20 Jan 2026 12:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KfjNRXIe"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D8742EEB8
	for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Jan 2026 12:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768913562; cv=none; b=a4n08mHIFt9ip4Lj8yP6g17eExOHHnPiL5t9l3eSpRv8bWDyrvX7aRGsleWW1278xhO9QMW8EJBncOxiss43YJS+hmFCNnA2ZqlXqTImZOgbCb2T/Zy5wgVRhqTGTqL8APMu+25NCzKRzRBIx8j3Zc2hqoeB+O0RA8vSiQQU9hA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768913562; c=relaxed/simple;
	bh=EQgwPx4CoI62AfbaaKeHd9Knq7LJDxSoljXeEUvMeTA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pFS1uIDnb4SfJKG1Q42n41zg89vW969JkE9SkQDCQgudXDCek/gz4lWGtsftQLXnAPLNjKZtPIYsqf6HWo7ZoHcnsnAv2QeyQPfiVBfIx/tz5UOMsVT71ptJ/no0i0HuJSur/4tbKtbvw+U0XH6/2YsE/ERdj2ZY/4FBO5gFLI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KfjNRXIe; arc=none smtp.client-ip=209.85.218.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f68.google.com with SMTP id a640c23a62f3a-b8718187eb6so815189566b.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Jan 2026 04:52:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768913557; x=1769518357; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LPgxyg9G76/sx4czSUJY3/AVEyCMG06p1zf4yLzzaHk=;
        b=KfjNRXIeepSKFXNPp7VbUpsYdYLTX1RL9j7rWQDYUevR0ux6pZ+2XePvFTtIjtCWyO
         tsz5IJWfaTPd9W78xjO/znFhEPWzcGMc+rI71dhTTyl1ESKkZ12YBjwbD8/DvGLlyupp
         bhmJ+R35elE+wnHQOlj6Fztid8QHTCHNGCxQ7BFWHga+hvzcSX6EnQdqvLrJ8aSbedj7
         ZtFVVSkXD4soQQQKSPqxYMMUD3e9vhKO+4Bchw/km0S0h8R2WxM9F8OGibkwsZLLa3cT
         3Fthop3XCK4hbWlmRp5UZzBIJPbdohSxywoKUTTPy93bis/8xzwrMD/3j4TssMZpBpR6
         8vhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768913557; x=1769518357;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LPgxyg9G76/sx4czSUJY3/AVEyCMG06p1zf4yLzzaHk=;
        b=hwKZSNqtp0hxUILpnVxFOvf2nYZrs8YCh7FJiH0e9Srg6BhJRR/wpPq/ieEnuu3CtL
         1TBT87ukswVGX6vOvVbSiRZKQE7lEnAcEMVnsG6/Vn9pUK9zwiYb1oQj/tseuaBI/4AX
         HHH2fLOH8Mi/Dl90omglO3yBPSPJrK2L8R6U9DT1AvKL4XjaPcnSjhUGYcM8pf/EOy9u
         maakWap0v+Db+QASnv1IkStB9K3vtxbDLdybiqR1sG2ckUMo1hD1BQjTxSha6iCjY0qI
         uMxLptpxlsoaEIM0jqBKSJFDvOP29oyUyMdC+P/O40glLTCnLNrmCAefmC3tIKQ8J+bs
         FUHQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/NOpC66OjEjefMMFm+ihHwcnmlBCMB7/hGkAFV1GLDDgWHAlkqUdCjDq8bqCg1XJPJmj/r/zJiq7beqTRifLDGg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzBhtAWCKmG8nNK8YJesubB5KEVp09VIY/xM4T19e33+WkJC4C2
	ERoDYnCtJFMkKTDncpKcG3XPg/PwbGmtK+2PoHfSmFgeqGW4hwPVJseA
X-Gm-Gg: AZuq6aJAYKJozqn+5JI2URCUmlpUea6LeJfxPWYdjc26lgTYmXawF8gQdmuO72J0187
	DIG85+5sbXWHSu0psT7bBJ2UsQZj09qJvuKbOWd5+ObMjw0A85vjPhizchpSDxV9S/kG70Bivxi
	o5Fnp8ZlOPqvCfNmLtAnL9H1CdDfORjerfpUo736uI3Hu5udtAF7byhT0yHoaA051c3esGS8Oic
	6BxDx5/J5ah+eMcOY6LpXCk4xP5ATdD+EON28jodAgtk2gduVO8RxiNyGDzCWMjo/ML6ZtTS0Dg
	PHbryU00cnY6rOGAVNc4BRaJ890YMu29BtdN7tDLhmmLx2k+wPgRr98xf62XYsFWqyZVfuaohlX
	VEqfLdcJxkLZNerHiCGLryvoVAaU72dtyUarEPoTT0NfaadsPrCDYyUCzBhyfBiNuBEtHY+kif4
	FSbvuT9ytzhAoiYCz7M7eIA2rNLAd8S/coe44=
X-Received: by 2002:a17:907:80c:b0:b80:3447:e0c0 with SMTP id a640c23a62f3a-b87932b8d3amr1153946566b.62.1768913557168;
        Tue, 20 Jan 2026 04:52:37 -0800 (PST)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:c8c7:2ef6:8ac5:5556])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b87959ca32esm1420626066b.41.2026.01.20.04.52.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 04:52:36 -0800 (PST)
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
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 03/12] dt-bindings: soc: renesas: Document Renesas RZ/G3L SoC variants
Date: Tue, 20 Jan 2026 12:52:14 +0000
Message-ID: <20260120125232.349708-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260120125232.349708-1-biju.das.jz@bp.renesas.com>
References: <20260120125232.349708-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org];
	TAGGED_FROM(0.00)[bounces-27106-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,renesas.com:email]
X-Rspamd-Queue-Id: EAD6A4EE5D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

Document Renesas RZ/G3L (R9A08G046) SoC variants.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 .../devicetree/bindings/soc/renesas/renesas.yaml         | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
index f4947ac65460..be61a71c7305 100644
--- a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
+++ b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
@@ -548,6 +548,15 @@ properties:
           - const: renesas,r9a08g045s33 # PCIe support
           - const: renesas,r9a08g045
 
+      - description: RZ/G3L (R9A08G046)
+        items:
+          - enum:
+              - renesas,r9a08g046l26 # Dual Cortex-A55 + Cortex-M33 (14mm LFBGA)
+              - renesas,r9a08g046l28 # Dual Cortex-A55 + Cortex-M33 (17mm LFBGA)
+              - renesas,r9a08g046l46 # Quad Cortex-A55 + Cortex-M33 (14mm LFBGA)
+              - renesas,r9a08g046l48 # Quad Cortex-A55 + Cortex-M33 + GE3D/VCP (17mm LFBGA)
+          - const: renesas,r9a08g046
+
       - description: RZ/V2M (R9A09G011)
         items:
           - enum:
-- 
2.43.0


