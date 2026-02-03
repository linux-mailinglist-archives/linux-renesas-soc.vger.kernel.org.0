Return-Path: <linux-renesas-soc+bounces-27796-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wCCDGTfQgWl1JwMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27796-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Feb 2026 11:38:47 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0889BD7CFE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Feb 2026 11:38:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C528E30FF3A7
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Feb 2026 10:31:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33B32324B19;
	Tue,  3 Feb 2026 10:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m5JNCBA6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F8431E106
	for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Feb 2026 10:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770114639; cv=none; b=MqzONOIErglpIW6+CD+YqWZNT6LRcqrZOOHcbb7P3onDaEvSlZykNbzN2EZ6DRGnwjGy6kdl0hBoLRo2PYU+uaMt+XI2YMYrP4yaz1oeKHlz1a/glAElaMnDXUQOG56Y2l73rrUslD36HcUzZ8eSF9QQuBuBENxeRYz9569Kq0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770114639; c=relaxed/simple;
	bh=vVid8PUtvYXfm9Ugr0eVx7o7Bd10bxTZeVAyfpkG8Rg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eWKSAt3aXUMfla5B3eSj2SQZeuG8qpHTeaUetpjXibROjmDyYjzgyPWg0I7mlhQ9U12fuk4r3lnGsw9CJDJ7nVvosYibND13H+/XwnoNMZkLyD9zHNECmpTscGQusejNRrdr5EECthBld/dtUoohgpjXaM/CxAs51yDBg2zCey0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m5JNCBA6; arc=none smtp.client-ip=209.85.221.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f68.google.com with SMTP id ffacd0b85a97d-4359a302794so3724018f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 Feb 2026 02:30:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770114635; x=1770719435; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qsm+kwCXSm42O9NVlSacONQVbKsmfmrrrYzdz9iWN+c=;
        b=m5JNCBA6JZDNDD76EI1zkwII1mHOLCbzNmRHtg43KtgtAb9s4wLnT4VrxA2xID7L6d
         QHzTg/1tv8l990Gj6AxJdBGzeOJ338S2T32R1MRZuJDINHYN4A7X5roVjno22AQNTZF0
         quRcAjqandbCdKicna3mOsjihZgRziXj/rYQdpQtZY1YacbCBC32VjpUWEFzXMZeV9U9
         M2YZMXoxv4nlzI6/eD6FqhVkzCRCdX4k/zAF4gvgUBRqzAUDELfkhOvVxkBA3n3RcRtm
         AWQs7I2x4wRVqQUboNklYJY/uJaMwu/Kqyp7meZxgV4NlvsMXbESCGiBFEmFotmIo9lx
         D2Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770114635; x=1770719435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qsm+kwCXSm42O9NVlSacONQVbKsmfmrrrYzdz9iWN+c=;
        b=MCV5PDfDuBJUXBlaPA86Y87+Gi8Om0JGFp35+H+4y3a2rEYS5CWshMT4M690dZ/a0i
         O10pP4bbnriM8xN5dL7kzCR9sz5FEXXu8C0/83XUY7g03k/5nBlOZxfUwkxkIep52g9M
         uV19uxEwYznHnTBCZ24qYwswVV1QKBaeFYZ8YONHnPX47qWh/VYVmO6M00J4TumqasvY
         TBoCzMKc/KRLdBOtXL91KuofLa4v4bBTnUQvwF1ba1XecNQ4TQPj8o1jfcrZfrcgjxYO
         9bVL6TiwFBQjPd2cWsserzMXS6FoxX7mmRr93+N4nA9/khk1xsTvhsc4VqD0LV4yHYrc
         0UPw==
X-Forwarded-Encrypted: i=1; AJvYcCWj3l3lZKxtd53UWCfQWFncETpWkW3Ct7Wgh5oAj35t3YTtDgth1RPZ0geNc6c912+h0OhwYBzrKBscQf44zwWrEQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz75LeS0r6r3TrjRC8uRUdQ9YuuxCSb5cwYY1E9JYlp3o7ruhld
	XmSGYKFKhtDriU16oAY6CytOa4nDzDf8cI4Up84LJ2Qo8zs5dKP+7geI
X-Gm-Gg: AZuq6aIevIUV3AHqzXZXcIsHI450EZR+gJb7Gluf/hde/6qKdx978MT8jgZV/LAyOWB
	GAWIG7gHBRvd1fwvitf/BPaPg1CAd53LGt34Ish/QS50KNxGWh+sAGxJfRVvYqGbCm89LqzStLC
	VvL4QdzKuG+nEhv6WTUeGWUKCh1R9ByW+vLfQ10cHipoW+0u9CDBBz7sSWQobxXWDeTsemHYd0Z
	qzwkr/g7fhKXNvPFP+cTDLb4gDhlBqJyIsjzkOmWy7v+TwggMJj1ve6YB9gYUjDpbXXk7HSb5zy
	Vv1zZ3vtHJJPyHb+2EXXbHwokDTvqMJMYc5iyI0ZQgBuD+6oE+MyZ/myGfVCCccO/n/L2Lurxjm
	UlqSC07P5tLeTPmYLf5uXEainPm+7y+zqiga95VUGYFzw9v6czr/yPAVzJEsOWqyUoaDEWObh/B
	k8yzpttPfArfIve5RksFVy0Q55Zhb6
X-Received: by 2002:a05:6000:184b:b0:435:8d02:b9d2 with SMTP id ffacd0b85a97d-435f3ad1f8cmr20314991f8f.60.1770114634875;
        Tue, 03 Feb 2026 02:30:34 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:9cd9:f748:166d:55fc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e1323034sm53160961f8f.35.2026.02.03.02.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 02:30:34 -0800 (PST)
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
Subject: [PATCH v3 02/10] dt-bindings: soc: renesas: Document RZ/G3L SoC variants, SMARC SoM and Carrier-II EVK
Date: Tue,  3 Feb 2026 10:30:10 +0000
Message-ID: <20260203103031.247435-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260203103031.247435-1-biju.das.jz@bp.renesas.com>
References: <20260203103031.247435-1-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27796-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com,renesas.com];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 0889BD7CFE
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
v2->v3:
 * No change.
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


