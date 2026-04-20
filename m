Return-Path: <linux-renesas-soc+bounces-31394-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0M51IlYE5mkJqgEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31394-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Apr 2026 12:47:50 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DD11D429893
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Apr 2026 12:47:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 75B79300FEE5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Apr 2026 10:43:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFCA239B95F;
	Mon, 20 Apr 2026 10:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VZco2aAJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DFAC39A803
	for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Apr 2026 10:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776681819; cv=none; b=k8wnAClqbuit/reNhgWBeRVfXwcO7u/4dz/t4zPcvAlzw4Ta+D2JvUIiaDN3ybb/m6Z3ZUioHd+H/rAGQs5Et8VJVKn3t7ZYLjdODIoueTPnWTSi7YoTU5t6uAc1qIQJTjrVD+cTBZmCYQDE0eRqpVzWYgVL+0g3ieVYVSXwMg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776681819; c=relaxed/simple;
	bh=VhekGTjk/1zXeGIGbEp+mvkiBuKm0sxCLfNTFeimcHU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=phkMsCeZrphQaYKsjQDLa44NfYzKyxxpVbcB2m03OwPsXKFQdCwUHbsD+Wa2DjSuJfjHdxDxtQ+tVAoQ66hujGonrxEW8o0HgVo7quv/521nIozv6rbiKmJMCS0046ISWvfOh+67dpcL048EmgTiEacSj+Jcz9h7z2DvpD89YX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VZco2aAJ; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43eb05b1875so1674176f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Apr 2026 03:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776681817; x=1777286617; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bhm2GeLeG1UM0/AQDKFsQSbZ5IfXuExVpXyI9JPf4cs=;
        b=VZco2aAJ9RKZn+y48b6y5KhQxByBjuwm3Kgk7lgj3BvOUSEqQSdfWaLrzFHMuWg9Tr
         O1rg14RdAxE5MQJKSxSHVLRCP1AjPWJle962XWIHVGTiWOkrX70EvuVASDEEXtvsX3uB
         NESzrhQ8W/FvJFj6s6VbLqJh1N9t0RKlgDkL0tTVXD4yvclwoehbVClSG4NpQuHKKDp6
         3GhhIvAnNuPWRoi04UIJuAz/FdmfGCD7v/LnG2tgFRov2VTZx1KeG1/pmFzOKhbKdi9b
         3qaapAP6JgI71odqO43GtbIQ90GR8wepoEIz8RpaPEUtlanO1RrorWUqKubzcM2A9yPX
         rBcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776681817; x=1777286617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bhm2GeLeG1UM0/AQDKFsQSbZ5IfXuExVpXyI9JPf4cs=;
        b=j55x5aFflGPC0ElFU02ZGUosEn2tgLfFft4ZhkDUnTjBzC/j3O0zDXgLkbrp4pQBr7
         9o2aC9DsvmpY6svrRsQd86WfVzAzdQTcIygCmyPfizyf2TEUjiWroUwX0S9t6IyroaUo
         BzLtgSCxZzBTMrPV0x2BdjKKOltQsHp3mXbjmaONZysvvJxELQ7X19pHZxdmP5lpxcb0
         v7bdsXV4vvqutp05rJipNvNmqFxm9YWcCVQkswaY+fwW9IfW+ummeCcLI12kZ2z0hKOU
         1perHYlVOyhdKFu1P0PnrNZ/lHN2oEXf0tl2jzr8EuNC/EEH3hu2zPhVK3UZ1zqTxDa0
         tGqQ==
X-Forwarded-Encrypted: i=1; AFNElJ+TIRiHbK5BeJjd6DMqecYq5072sBTNarvfzbXLU3N96DzIog9h794kiRDsvmmaZgBbN76C5sMGI9Og0UmL6C440A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzzqcVQUgzLD55Y07JPaacBh90o1PJzGF4pSvbQxljp3Nmazgee
	oi0ns1TO+saCwepYfjQ5P0iU5w2qlNBvelswEgVuDCfPwZn0kcbmZkoU
X-Gm-Gg: AeBDiesNt8VjKQ6w1aUFSpl4ZyY4DOYpCAjdpXxaZsSnDdKGWlUFEQqpRg5USe+HOHf
	zXkbKhXKcSbGqXQOI6yKhZoOirmhJhtmMwbuYeEkQRaHrwKRG4OO2FAHZ71pVvqvUSuuMc6DFF1
	8HyZ6ba6KU7CObzeDAxfmHqplN5jzBXAYdGkc1IFm/w8Gh9WnxS3bwM2EWMIURXIWQKm33/dB0V
	mwfyIEdpdYJh9aiEcQUNGZwPb/khY2/J77uOUwpwUYE4iSse1ICTLe6KU0mE8ZcUsG2+eHbcg0n
	EbXI92txFeM/YFj9eM3b9lGZqHOhcQFm73Vs3DCTWJJFqSbxStGRaqpfzCU6Rc264KYVQvd/7P2
	0W+li1VUmLoonbhh2FaKtsH1f35/ZbuuqbQwYtJNjNHC8BkP8ZlGC30CVI9luJ4fSVO7mGH3IlG
	reWPMx3ekpZQ/4xQyoNM2ABhtU45Cf3kCR9mMDYIdEmLUJdKsbikB6a53Y0IcVInAWeTJMTg==
X-Received: by 2002:a05:6000:22ca:b0:43d:6f0f:32fe with SMTP id ffacd0b85a97d-43fe3dfd65fmr18556724f8f.31.1776681816481;
        Mon, 20 Apr 2026 03:43:36 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:5f3e:f914:6f8c:72c3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4c221cdsm28038301f8f.0.2026.04.20.03.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 03:43:36 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v5 1/9] dt-bindings: pwm: rzg2l-gpt: Document renesas,poegs property
Date: Mon, 20 Apr 2026 11:43:18 +0100
Message-ID: <20260420104332.153640-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260420104332.153640-1-biju.das.jz@bp.renesas.com>
References: <20260420104332.153640-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31394-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,glider.be,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: DD11D429893
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

RZ/G2L GPT IP supports output pin disable function by dead time
error and detecting short-circuits between output pins.

Add documentation for the optional property renesas,poegs to
link a pair of GPT IOs with POEG.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v5:
 * No change
v24 from [1]:
[1] https://lore.kernel.org/all/20250226144531.176819-1-biju.das.jz@bp.renesas.com/
---
 .../bindings/pwm/renesas,rzg2l-gpt.yaml       | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/Documentation/devicetree/bindings/pwm/renesas,rzg2l-gpt.yaml b/Documentation/devicetree/bindings/pwm/renesas,rzg2l-gpt.yaml
index 13b807765a30..98bcde755fb9 100644
--- a/Documentation/devicetree/bindings/pwm/renesas,rzg2l-gpt.yaml
+++ b/Documentation/devicetree/bindings/pwm/renesas,rzg2l-gpt.yaml
@@ -245,6 +245,28 @@ properties:
   resets:
     maxItems: 1
 
+  renesas,poegs:
+    minItems: 1
+    maxItems: 8
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      items:
+        - description: phandle to POEG instance that serves the output disable
+        - enum: [ 0, 1, 2, 3, 4, 5, 6, 7 ]
+          description: |
+            An index identifying pair of GPT channels.
+              <0> : GPT channels 0 and 1
+              <1> : GPT channels 2 and 3
+              <2> : GPT channels 4 and 5
+              <3> : GPT channels 6 and 7
+              <4> : GPT channels 8 and 9
+              <5> : GPT channels 10 and 11
+              <6> : GPT channels 12 and 13
+              <7> : GPT channels 14 and 15
+    description:
+      A list of phandle and channel index pair tuples to the POEGs that handle the
+      output disable for the GPT channels.
+
 required:
   - compatible
   - reg
@@ -375,4 +397,5 @@ examples:
         power-domains = <&cpg>;
         resets = <&cpg R9A07G044_GPT_RST_C>;
         #pwm-cells = <3>;
+        renesas,poegs = <&poeggd 4>;
     };
-- 
2.43.0


