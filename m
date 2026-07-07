Return-Path: <linux-renesas-soc+bounces-34812-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id x7XNFC0TTWqjugEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34812-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Jul 2026 16:54:37 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D92B71CE2B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Jul 2026 16:54:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=GXXB3krc;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34812-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34812-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B62F83015168
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Jul 2026 14:37:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA5B442E8F0;
	Tue,  7 Jul 2026 14:36:54 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A340142CAF5
	for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Jul 2026 14:36:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783435014; cv=none; b=tr75IVR2oNjk2KC5ze7IIbem/Nwrumeir+z6/cV9aLKv7JMUHnBSn3qwipaz3d10D6Lq4OZL264Pa9xRlH5jZPIROS9CZrkr1WISHB6wDdCersDLkYJg8HnKPQItgzToBKTYiASnSFdfxNbLd63ksdQZ9JcNFSRCPmx0WnRIB2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783435014; c=relaxed/simple;
	bh=bgc4PIqSQZxUe1yo6mMLg2775bSa/NICAsyxdbxA+dM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OSJyrCcPHjoF0wSTdY4EfB/LTQLUxkQfwPsB52HJ/h1Y2mKXeXPjlhMhV+NdsrfmCdLsca3D+SIpfcUAHX5ATjASMbC+DPN1n5eWZaXWSAZd6FLFpgvPklLTcHUr+1Fr4LibrneM+YBk8YlyyiP3ro0iJSSfcb0sIwSw2UvClLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GXXB3krc; arc=none smtp.client-ip=209.85.221.42
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4629051c9d1so2197638f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Jul 2026 07:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783435011; x=1784039811; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cr4ORC5iEzVJ8CZQXiF8gWDp6d51C+uYuHd+oA5It4Q=;
        b=GXXB3krcq9gDJeG5ctUb0VvNIOzyzQE1LaVcSXJJU9KhVVgCUp0lemQjy/rBsusV+S
         TjT884asz/W8rTx9n4sGyFMtdtgzdt2fZrUJjX1MrG7Yu8sPUEiAvMYcIkyxh/mQZxjQ
         aTRymFUY5uaC2Di5+olinOL3XdfMl7bbaTkD0J4Qye7OivkhykI2Fix8uxzCcGd2bFCP
         8bT9FpfR92zmFQX1Iu3BRNly58VB1Qxvt/VAK1lW+1oSlYM2UU3hz6/wOwmVEEtObnXU
         Y5GRd0Uun3vlmn0ntaNhqOj9O4hBpIte7SnEePZTegcDI7Ymhc4WewnoAjJRBt5A7JBM
         bTIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783435011; x=1784039811;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Cr4ORC5iEzVJ8CZQXiF8gWDp6d51C+uYuHd+oA5It4Q=;
        b=sM5FAHmnVan4UY46OPzbYx0tNDJQim++BPzon2QyUaDE8iZyDnUXdHN2K+YN8wqGnp
         fUyR8IoT08tD62nDatiRH1E+wmnJs97YHW4oAmmtaKXdEgkiC2W88kHYnbmlqCC54EB3
         ACpoUFIHiqsMeQJMUmJESMIM3L7VA3sSvl8vwGSEnpFcXNsgqCeif+1zNXySgVjdTpYK
         sbZ43xsuObgGIv+knh8Rv1agUyEwHJBSUIUEIDiJ6TB8YgaJPu8T0eW7GBHPXLqH/d/n
         n/g8iqiKRHFMv7/nEmLuDe2HnjtL7Kpw+v6qfsFCn4pP4If7KGjyLOwP1RSJOAdLt+8E
         yJEg==
X-Forwarded-Encrypted: i=1; AHgh+Rq1xGAnNLyGKz92BVsXAR/xUYKKLBqzcTVOtY+l4G8JsYyRS9jJUvxo3JrAt0Fmegs49sssBPQx+LxzqDc14u8/WA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzkHWns9BTfzgT40/vOYg2si00LDaVYHzBNWQzzpQVqPM9wgkIH
	Jpod/rfoZup3O3lWJGIIqqkQNamnQjZRJ1SF0OHy8+52Ko1COrHfwJeQ
X-Gm-Gg: AfdE7ckMYfi62xmAMcP05TehHlW6Em3Y2J0vXKtiiLFwt+sT3VwWgSARpKGyUvfuryP
	OIJI2BqkVTgekQPn3dDOkG5OKrbprNyivQoFZ1fScZmaqj5SeW9pXTwnanENJm+m4/pIq1NOkY5
	puNr5Bm3a0ZZqDn5hjl36PbJtxdgdOhpzA7UJBtKuf/X9skqVglXO4k3n+2QFGMEE1paLy0X1P4
	Km3jv10PYP8yK96xJFhDviXo1ePwGWer30aMfjFMq/gnsERQJMS70bz8lseDdMrhIEOPwcEi3P9
	MNq9/2XF632GeTLyHsHj2g8n2Ep9H2IwUyXsdlqK+J0BY7d9svlBzhpfmSOcN2/s3OnCl0EaT+L
	LctOqVoXwEN8fEuxPKJwFLwlTMty59rqGCr8KmHftEcxw7x+TzbxYbENXXwnCgStphyD1jpEu72
	4WbSKyCSkPG2NQlb5ax5DkL77tr7Mx3UmPtN9E8Q==
X-Received: by 2002:a5d:648a:0:b0:46f:7d90:8127 with SMTP id ffacd0b85a97d-47de66cf83dmr5043918f8f.13.1783435010951;
        Tue, 07 Jul 2026 07:36:50 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:a4ac:4e7f:194a:852e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039ae44sm33228611f8f.23.2026.07.07.07.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 07:36:50 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 2/9] dt-bindings: phy: renesas,usb2-phy: Document RZ/G3L PHY bindings
Date: Tue,  7 Jul 2026 15:36:34 +0100
Message-ID: <20260707143646.245177-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260707143646.245177-1-biju.das.jz@bp.renesas.com>
References: <20260707143646.245177-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34812-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:biju.das.jz@bp.renesas.com,m:neil.armstrong@linaro.org,m:yoshihiro.shimoda.uh@renesas.com,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:biju.das.au@gmail.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,m:bijudasau@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,glider.be,gmail.com];
	FREEMAIL_CC(0.00)[bp.renesas.com,linaro.org,renesas.com,lists.infradead.org,vger.kernel.org,gmail.com,oss.qualcomm.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,bp.renesas.com:mid,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5D92B71CE2B

From: Biju Das <biju.das.jz@bp.renesas.com>

Add device tree binding support for the RZ/G3L (r9a08g046) USB2 PHY.
The RZ/G3L USB PHY is almost identical to the RZ/G3S USB PHY, the
difference being 2 OTG blocks on RZ/G3L compared to 1 on RZ/G3S.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * No change
v1->v2:
 * Collected tag.
---
 Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
index 9740e5b335f9..d6b9d08ceec6 100644
--- a/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
@@ -16,6 +16,7 @@ properties:
           - enum:
               - renesas,usb2-phy-r8a77470  # RZ/G1C
               - renesas,usb2-phy-r9a08g045 # RZ/G3S
+              - renesas,usb2-phy-r9a08g046 # RZ/G3L
               - renesas,usb2-phy-r9a09g057 # RZ/V2H(P)
 
       - items:
@@ -132,6 +133,7 @@ allOf:
             enum:
               - renesas,usb2-phy-r9a09g057
               - renesas,usb2-phy-r9a08g045
+              - renesas,usb2-phy-r9a08g046
               - renesas,rzg2l-usb2-phy
     then:
       properties:
-- 
2.43.0


