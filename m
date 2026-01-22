Return-Path: <linux-renesas-soc+bounces-27286-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yKOiD7s+cmnpfAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27286-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Jan 2026 16:14:03 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A4D68815
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Jan 2026 16:14:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 27F643000095
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Jan 2026 15:14:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F05436AB6C;
	Thu, 22 Jan 2026 15:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="c969SLpJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71CD01F8AC8;
	Thu, 22 Jan 2026 15:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769094839; cv=none; b=Bd53sDc1h1+uD1ZueKtnppEq6V+KkEYADuGnsjKFBs89qDGdd5UKllZ9nHO//yNjkA2N+aDMIKS68rVp6lHwb3PEYQ9QkD+zHpuQeAAA/A3/vtFROlR8YMQh/zysnWRsEDcL3h3x6Pt/r6kpaHNWSgvSNHQOblhIWdmFhPQ3pK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769094839; c=relaxed/simple;
	bh=WC/+eOZMKY42nVOoDX/04sXysusom37jMeJSBZtm6Og=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F3CIaUHHz2AXvKCQJkEC68DlG8nrVkIfg8dS3X41cY3vtMjdXIat5nPReQzrLxJwhX4Yyn7zCrmyjccbVcE7RUuPvui9UQtqFP4IRBb/G9IX21ifv/IUW1yEaSSv3qe3IsdZsxc3v1OpYQABCirDvz/UI8UVe0F8jToIJjggoLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=c969SLpJ; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id DB86F1A2A60;
	Thu, 22 Jan 2026 15:13:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B00A1606B6;
	Thu, 22 Jan 2026 15:13:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9FA77119B82D7;
	Thu, 22 Jan 2026 16:13:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769094834; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=UxtsaoqIg+6AYy2V/7KjnfLwIE5YKNYS6+v8qGxpVDA=;
	b=c969SLpJsCfXnLlhPT0ApfUbwwcMHJBi7eFwe0drjUkYGXIcSbJb85FS8vrL8/G9lxd1lf
	+6mF/vN7GCPB6mo0A+B8Nfxs5+a+3SUi+QM1r5dbtLPS9GGw3vB5JojSM0DlSkg+ADz384
	UQOvJsVco+Zr/8LEP5Hs2JhEOJspqDYuOKg58lHN1eOx0ph7LUdfjFJq11CtAbhrgXJ5GX
	lW452Yj/TqA2bEeqWjokSS2YBhQih5fBQ2bbLW4HrjhFwRW2lWsBcVNpGUF/isi5oeo5Nj
	u/X59mmOdTHgqCIYc+/O1COi58CAtd/mBAo8UsvVcMBVGFBZkubBIebJ+GoxzA==
From: "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>
Date: Thu, 22 Jan 2026 16:13:26 +0100
Subject: [PATCH v4 01/15] spi: dt-bindings: cdns,qspi-nor: Drop label in
 example
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-schneider-6-19-rc1-qspi-v4-1-f9c21419a3e6@bootlin.com>
References: <20260122-schneider-6-19-rc1-qspi-v4-0-f9c21419a3e6@bootlin.com>
In-Reply-To: <20260122-schneider-6-19-rc1-qspi-v4-0-f9c21419a3e6@bootlin.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Vaishnav Achath <vaishnav.a@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Santhosh Kumar K <s-k6@ti.com>, 
 Pratyush Yadav <pratyush@kernel.org>, 
 Pascal Eberhard <pascal.eberhard@se.com>, linux-spi@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, 
 "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,glider.be,gmail.com,ti.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27286-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miquel.raynal@bootlin.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,bootlin.com:email,bootlin.com:dkim,bootlin.com:mid,ff705000:email]
X-Rspamd-Queue-Id: B1A4D68815
X-Rspamd-Action: no action

The label is useless here. Plus, if there are several examples with the
same label, we'll get very useless yet annoying warnings.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Miquel Raynal (Schneider Electric) <miquel.raynal@bootlin.com>
---
 Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml b/Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml
index 6f9730783d34..e005869a76c8 100644
--- a/Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml
+++ b/Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml
@@ -172,7 +172,7 @@ unevaluatedProperties: false
 
 examples:
   - |
-    qspi: spi@ff705000 {
+    spi@ff705000 {
         compatible = "intel,socfpga-qspi", "cdns,qspi-nor";
         #address-cells = <1>;
         #size-cells = <0>;

-- 
2.51.1


