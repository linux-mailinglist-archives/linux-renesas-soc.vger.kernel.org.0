Return-Path: <linux-renesas-soc+bounces-34477-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Peu9L47APmrALAkAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34477-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Jun 2026 20:10:22 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4F66CFA49
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Jun 2026 20:10:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=sang-engineering.com header.s=k1 header.b="k+A9xw B";
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34477-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34477-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D92E3308EDE4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Jun 2026 18:03:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63D4D3B1004;
	Fri, 26 Jun 2026 18:03:39 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A3AA3AFD14
	for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Jun 2026 18:03:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782497019; cv=none; b=T6TIc+zyhcfypc/SZk0gQNYSUy44UQGazDzNd8bvhuaV+6Szs9jYFgH9KC1fmUXjSeasso85Ur+FUdWzTkjOmuhWfRAotVGKz+gbmK1AY8uRLhz3wHl2Uip2qYaAObAecS9SoUPQ5/onCd1iXffDHKB4CZsebR+1ly2R8ODHyuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782497019; c=relaxed/simple;
	bh=TR4JJkbczPJqnBZozxssK9USknm3EbwtFsD9ETh3ikc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=no8FCa7gaOLCbWV89/d9Vh4SbJBvm8erUrj+cDYu2KKtUG+JSu/rivCKMytJ30WRK+z1tpit3AnyYcsyaEvr8ifKJHI0pPWxpcM+NAFSkJXlusGj3A3JzMinUobRNdGRTYnRElxQdiDSC4YTggBs7MXwqX5us5T9L1Uu7CG66Bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=k+A9xwBo; arc=none smtp.client-ip=194.117.254.33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=TDBxImWcNkeCo7o9U3wHYjvtH9B9qqjr7UbJJy5F/cA=; b=k+A9xw
	Bo36SRUSKx2VhgoCTXkYcHx3XcvPEXUXcPKo/SHCX82C9Kk/W0oNujoBeZ07A9++
	3aq+qCTsPQG/mgp9YLWfbS+Uk87X3hqDZj0hU7e/+Qif8JEWogk9OlZdfKW5mxv+
	RcHJtZh+4QfvZ1/2n/upeP48SNVPKyLvvxjYCfhB6cmIeVeVUfHg3HUlHM/tl2wY
	j5ieQGcMGhMd7iOzMTkpIjAJgGS0GIhIXLeIh6jV1tjvAVG6LfuNwDEUbXDCPW6Z
	AprXQOfmaxNXOicyzCWeTJ2G36F088xMEx/YYlzVwsXuTiael0iHdnvrTnz+kk8k
	PhaBaAtY1/v1mHAA==
Received: (qmail 3649245 invoked from network); 26 Jun 2026 20:03:32 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 Jun 2026 20:03:32 +0200
X-UD-Smtp-Session: l3s3148p1@G/s47StVmMMujnsl
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v4 1/4] spi: dt-bindings: snps,dw-apb-ssi: drop superfluous RZ/N1 entry
Date: Fri, 26 Jun 2026 20:03:22 +0200
Message-ID: <20260626180326.9593-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260626180326.9593-1-wsa+renesas@sang-engineering.com>
References: <20260626180326.9593-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34477-lists,linux-renesas-soc=lfdr.de,renesas];
	FORGED_SENDER(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:linux-renesas-soc@vger.kernel.org,m:wsa+renesas@sang-engineering.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:linux-spi@vger.kernel.org,m:devicetree@vger.kernel.org,m:wsa@sang-engineering.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	DMARC_NA(0.00)[sang-engineering.com];
	FREEMAIL_CC(0.00)[sang-engineering.com,kernel.org,glider.be,gmail.com,vger.kernel.org];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5B4F66CFA49

Commit 164c05f03ffa ("spi: Convert DW SPI binding to DT schema") added
an RZ/N1 entry which was not in the original txt-file. It doesn't follow
the usual "<soc entry>, <soc family entry>" style for Renesas SoCs which
was properly added later with commit 029d32a892a8 ("spi: dw-apb-ssi:
Integrate Renesas RZ/N1 SPI controller"). In that commit, removing the
bogus entry was overlooked and is finally done now.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Change since v3:
* new patch

 Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
index 8ebebcebca16..e0f249e82fa1 100644
--- a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
+++ b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
@@ -50,7 +50,6 @@ properties:
           - enum:
               - mscc,ocelot-spi
               - mscc,jaguar2-spi
-              - renesas,rzn1-spi
               - sophgo,sg2042-spi
               - thead,th1520-spi
           - const: snps,dw-apb-ssi
-- 
2.47.3


