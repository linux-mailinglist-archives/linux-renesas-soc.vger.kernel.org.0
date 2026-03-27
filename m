Return-Path: <linux-renesas-soc+bounces-30503-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WLQpKb3kxmmjPwUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30503-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 21:12:45 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6494A34AA66
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 21:12:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4E13B30B68EE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 20:11:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13DBB392C42;
	Fri, 27 Mar 2026 20:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="PbfeHNWn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B503932E5;
	Fri, 27 Mar 2026 20:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774642262; cv=none; b=FHyzq/CA9OX/U0IalZsXmyPeTCrlX9ZU+q8JaGvI5p2mQmLVAXkWQkCggq8K/FRdrSoFoJcuPIOD7PiHxtZScVPoDDtlAbwKcSihGgmcOPBKawP+0rdCJhgoJ/DlqAB+1XhhEBRth4x6E2+dfMxqKtClMX1Z1UaFMdB75aqOzDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774642262; c=relaxed/simple;
	bh=mPlt0fwCrjwYwW71s5RXcDjC/hgG4hSANbbbud3x+iQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=grImtArcPHqkDxcbPDphnwns85Rfk/PaW88tNWiJJTSLq7mHo4gTSBD5tlGCNhvXXb20jg5RL1IDAm4uOe+/bKIZmCt0iq8dUHCKxu1Sh6gB/7qUNSA008VwYX/1J46UnyL2cbDL2YS0t2w87+Ve3Q1BNvQrzvc4hgu0zakkVYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=PbfeHNWn; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B093CC58753;
	Fri, 27 Mar 2026 20:11:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DBEF060268;
	Fri, 27 Mar 2026 20:10:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EBC9D10451AF7;
	Fri, 27 Mar 2026 21:10:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774642256; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=rL9r1/GJspqmlIUASiShMPJp3IBiTzpcrlWKfB5DDEU=;
	b=PbfeHNWnYlmEhFjZsdQ8eMWrtlO4fut3zQO/skj7euezHvhq/BVoVu6VtTWtqzrIbGGPkv
	M+3R26y90B5n8synVnisE7f2AHErRhWHykROtDoQxbLqZF5JtBtFyz/RjzNzwd/+Ipu4Qk
	I+B//l8aidERiFZ3bVmgSvtZ5VlAD6Juu4RGGpuJvWrnSUrkf1GPdC0feeY9UCXwKtTJbz
	uG95QpW2kDhdOIpJrA7QXG3D1YgHUMEIy57CkV3xuGfY0xllHOlCyE7BOY9AtcRTOyu+2G
	utj4YClgstzG4d1gx4SjUqTnoH2uDx3QXjEOxiZgHwB3Abo2rYwMjLJSOrKmVg==
From: "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>
Date: Fri, 27 Mar 2026 21:09:32 +0100
Subject: [PATCH 10/16] clk: Add support for clock nexus dt bindings
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-schneider-v7-0-rc1-crypto-v1-10-5e6ff7853994@bootlin.com>
References: <20260327-schneider-v7-0-rc1-crypto-v1-0-5e6ff7853994@bootlin.com>
In-Reply-To: <20260327-schneider-v7-0-rc1-crypto-v1-0-5e6ff7853994@bootlin.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Olivia Mackall <olivia@selenic.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 Jayesh Choudhary <j-choudhary@ti.com>, 
 "David S. Miller" <davem@davemloft.net>, 
 Christian Marangi <ansuelsmth@gmail.com>, 
 Antoine Tenart <atenart@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Pascal EBERHARD <pascal.eberhard@se.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-crypto@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>, 
 Herve Codina <herve.codina@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30503-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[baylibre.com,kernel.org,selenic.com,gondor.apana.org.au,ti.com,davemloft.net,gmail.com,glider.be];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miquel.raynal@bootlin.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	NEURAL_HAM(-0.00)[-0.962];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:dkim,bootlin.com:email,bootlin.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6494A34AA66
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

A nexus node is some kind of parent device abstracting the outer
connections. They are particularly useful for describing connectors-like
interfaces but not only. Certain IP blocks will typically include inner
blocks and distribute resources to them.

In the case of clocks, there is already the concept of clock controller,
but this usually indicates some kind of control over the said clock,
ie. gate or rate control. When there is none of this, an existing
approach is to reference the upper clock, which is wrong from a hardware
point of view.

Nexus nodes are already part of the device-tree specification and clocks
are already mentioned:
https://github.com/devicetree-org/devicetree-specification/blob/v0.4/source/chapter2-devicetree-basics.rst#nexus-nodes-and-specifier-mapping

Following the introductions of nexus nodes support for interrupts, gpios
and pwms, here is the same logic applied again to the clk subsystem,
just by transitioning from of_parse_phandle_with_args() to
of_parse_phandle_with_args_map():

* Nexus OF support:
commit bd6f2fd5a1d5 ("of: Support parsing phandle argument lists through a nexus node")
* GPIO adoption:
commit c11e6f0f04db ("gpio: Support gpio nexus dt bindings")
* PWM adoption:
commit e71e46a6f19c ("pwm: Add support for pwm nexus dt bindings")

Expected Nexus properties supported:
- clock-map: maps inner clocks to inlet clocks,
- clock-map-mask: specifier cell(s) which will be remapped,
- clock-map-pass-thru: specifier cell(s) not used for remapping,
  forwarded as-is.

In my own usage I had to deal with controllers where clock-map-mask and
clock-map-pass-thru were not relevant, but here is a made up example
showing how all these properties could go together:

Example:
    soc_clk: clock-controller {
        #clock-cells = <2>;
    };

    container: container {
        #clock-cells = <2>;
        clock-map = <0 0 &soc_clk 2 0>,
                    <1 0 &soc_clk 6 0>;
        clock-map-mask = <0xffffffff 0x0>;
        clock-map-pass-thru = <0x0 0xffffffff>;

        child-device {
            clocks = <&container 1 0>;
	    /* This is equivalent to <&soc_clk 6 0> */
        };
    };

The child device does not need to know about the outer implementation,
and only knows about what the nexus provides. The nexus acts as a
pass-through, with no extra control.

Signed-off-by: Miquel Raynal (Schneider Electric) <miquel.raynal@bootlin.com>
Reviewed-by: Herve Codina <herve.codina@bootlin.com>
---
 drivers/clk/clk.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 93e33ff30f3a..196ba727e84b 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -5218,8 +5218,8 @@ static int of_parse_clkspec(const struct device_node *np, int index,
 		 */
 		if (name)
 			index = of_property_match_string(np, "clock-names", name);
-		ret = of_parse_phandle_with_args(np, "clocks", "#clock-cells",
-						 index, out_args);
+		ret = of_parse_phandle_with_args_map(np, "clocks", "clock",
+						     index, out_args);
 		if (!ret)
 			break;
 		if (name && index >= 0)

-- 
2.51.1


