Return-Path: <linux-renesas-soc+bounces-33816-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id S1XzIqM9KWpwSwMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33816-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2026 12:34:11 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D6EF4668522
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2026 12:34:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ragnatech.se header.s=fm3 header.b=N4XAm63J;
	dkim=pass header.d=messagingengine.com header.s=fm1 header.b="g 03hV/k";
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33816-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33816-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ragnatech.se;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 118573340052
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2026 10:26:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71D663F9F30;
	Wed, 10 Jun 2026 10:26:10 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 336243FA5C6;
	Wed, 10 Jun 2026 10:26:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781087170; cv=none; b=S+dMTMWPQtXUrhu4AR5x1sjumJ/TDbR8tTxXCRZAeNnHqKv3KV0I77mzWJK2cd7zd6tpy7e2YRHtQFZvkN6oA5Lz51u+N5oejhDaJ9OkvnZxDELtDkk1bE2oZcaW4U8N0mjdkkmiBlELTZc5FwUSG1w3Vi6OV4doaDwI6/uWdDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781087170; c=relaxed/simple;
	bh=LCwyU4brYMbkBMUmKtYK1Alqn7554RCD8MrCLyFl084=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=noO3Wcpu3zgxJTu11X25hZ9ExSJr3vy/ik8A8Vg07rDyifjlItSuKnVHeFh+tFYNehlSlm9+jPd8w/PUd637DunuUWGRRL4j0KEWf0hKc304EenusNGn2Pu58P32ZfRCoIU+Kw2djzg6w+w7x7FWoZj0NbXYPegEK1k7YzIToq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=N4XAm63J; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=g03hV/kb; arc=none smtp.client-ip=202.12.124.152
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 86C657A0135;
	Wed, 10 Jun 2026 06:26:07 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Wed, 10 Jun 2026 06:26:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1781087167;
	 x=1781173567; bh=noFkseGLZH5Y+vdncdNxvKtGAvG19QvRXItraX5/cL0=; b=
	N4XAm63JptLgSe6xSjGg0hc30RH0i6/4KO9fGxFrVX+sqELo3oPODh5Ujw2iOaTd
	N+HzYfyjtHfN0bBbtw1GYvd1IGFilUqWglw0G8I3Wrzti///uAjXqYB2xWNP2ihX
	CiX0WRpMbMLP/7oHQpf2+w02iZ61IOUTwLgsC5asCqYRpGKvs0plY+FonC1ouEtz
	34HfEHqUuym+V5DDz5YgR1gemI1iflQ652w+qk8NVDuotJGu+SK5H0GQzN0oBTqN
	A5jiD32l9YdSg9BDeW0vVMrWKx9J9ZWAsw0hw8Bf0EMsRtJcgDaU8XohbHwKcvID
	zLrGlV3SNvihZyS8iKqv2A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1781087167; x=
	1781173567; bh=noFkseGLZH5Y+vdncdNxvKtGAvG19QvRXItraX5/cL0=; b=g
	03hV/kb8IxW7AlBHHjNIWgfUVdjBZRr5KCWjaDQkT6Qn24omCLOEJTP+RmNU5ARi
	8LcyB3p+SWq2XC8n0nu714VbbwigRfs2xf65e4j/3ux8sZI5VZfqNekCLPz9kZTo
	fPCCpH7QeY6mOwxf68LYS/NBoC2i9d9iNpjVleGGuYYKs7TxwHctxuGN8gcMk9Es
	XySXrhtkjknAYo9r+Vk+9xXE3Y7YzemL7Doz++deIrFDbQ/+CzV7qxSxmNrWc5Jz
	00jSFTNL0mh0D3MX9aAtOqhR9i98rR9e32qgAqooRVNZldEr2GtrYiey29gqfkir
	6P8jXKRuPIh0W9WzNLCjA==
X-ME-Sender: <xms:vzspar56NnXM9wWPcSdpw7MhjPk3hslMXV_vuogFLg_2_r_0llCD2g>
    <xme:vzspapqSyWJ-QJsCWCqJ4vSm9J6mwOanz_AWU1YaBjZ3Gx7kgLkbpngMsq-uLyk-2
    xTF_9x8caIFIbOr6gKP-3PSMKhZqRjUsH1Ri_Q5iwF1GxnL-fEBFfc>
X-ME-Received: <xmr:vzspahLnICbKWUAlkCEWzSe4TBVeZixHR8n7kyLcpQVKE2pJD2VgZ3h3o1hABS-xedwJ1ekCRWCeXwchxzIdsBzgyXQahjx81zbh>
X-ME-Proxy-Cause: dmFkZTGRPlhAtNTyUgBqx38r5Gw3KE9/x83dTUD7r/SD/IUO9q6S6/ebbAVfjl9xj2SUoE
    mCfpki0VF/MQCfvwE1NHA90TFEVAKxJlOupWllLUecu6MoMI1TEZSN3s9eaQOohDTkrYGz
    DQYjnLetnMSBHJCdVIu+BSJKuvsEUdyr5pVrhGCN12ZyPAba93PF1RefDtJx8Mwtzv/5Uo
    kmcO1nUYVtfjZ4GkvXPiy/WzfYt2Lq9lLWBvOtTtWxDneYW8fN4S57VrMamUAL46Xsk0wa
    HrZhs9iRH3KODkXtLE+Mg/IqlvD1V3DmjLqrys555uh9q9emB+R5OWvCvCtCyiwPWFEnRP
    v8Fhv2JhuIWwovIJzBkZEsFghm88C0WhqehySM7f/UGAecH+pjjHfZzSP6VVfw2fZJ1EnY
    nmCU9rIybDq+ceMTas29LQlWnLEvZCSLkI+0BqV3V3m8ewA1syz6w9zt0sUJYIEMzDcZEX
    ADCG/8m2xsaGPbKkiliGFMJQnMhMnL+O2bvqL00Pl8HqWuYXsFub4vGGlp+/0J+WRU+h9P
    wlHyb4f6KSurFRX/e1bYk+Ppar9pJ5oKBt04qAB+O2HTxCBkF4EnVkGd9PAv0zBha9l7pp
    ZfUm+RIGvmLOtB1OAJLyCleWLtKhpdZNPK67ikj8hx2Vxdo+41FVXzLhonQQ
X-ME-Proxy: <xmx:vzspauglT86qddSCSaMvW_9iHSE81mpXhrNGqhqvwCayNzfokF65LQ>
    <xmx:vzspai9TWLEKKqiruTmwJaSgEhBmO8gBKxpQ9jXjwhS_j5Ud9pO3ug>
    <xmx:vzspaqpbolJNW1JfhxIe6XGQmxrJM1IDtKmMo7j5LeRx3HmOSM9kng>
    <xmx:vzspavPM2Q-kVsSID0G6bU_9j7qA8kON0Nu3gOXlL3aRBZTcxBIVLA>
    <xmx:vzspai-tQH_a2IWczNmKM3Xtvjz1U2QIZrGkNgfYt1WwFtaw1H6cHMOD>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 10 Jun 2026 06:26:06 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Paul Barker <paul@pbarker.dev>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Sergei Shtylyov <sergei.shtylyov@gmail.com>,
	netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [net-next 8/9] dt-bindings: net: renesas,etheravb: Add optional gPTP phandle for Gen4
Date: Wed, 10 Jun 2026 12:24:31 +0200
Message-ID: <20260610102432.3538432-9-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260610102432.3538432-1-niklas.soderlund+renesas@ragnatech.se>
References: <20260610102432.3538432-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ragnatech.se,none];
	R_DKIM_ALLOW(-0.20)[ragnatech.se:s=fm3,messagingengine.com:s=fm1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-33816-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[pbarker.dev,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,glider.be,vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:paul@pbarker.dev,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:richardcochran@gmail.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:sergei.shtylyov@gmail.com,m:netdev@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:niklas.soderlund+renesas@ragnatech.se,m:andrew@lunn.ch,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,m:sergeishtylyov@gmail.com,m:niklas.soderlund@ragnatech.se,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[niklas.soderlund@ragnatech.se,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.soderlund@ragnatech.se,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[ragnatech.se:+,messagingengine.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,messagingengine.com:dkim,ragnatech.se:dkim,ragnatech.se:email,ragnatech.se:mid,ragnatech.se:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D6EF4668522

The RAVB module on Gen4 have no gPTP clock as part of the RAVB module
itself, instead it relies on an external system wide gPTP clock. The
gPTP clock is shared with RTSN on V4H and RSWITCH on S4.

Add an optional phandle so that the RAVB driver can find and use the
gPTP clock. Ideally this should have been an mandatory property but for
backward compatible it is optional. The RAVB module is capable of
functioning without it, but can in such cases not provided PTP
functionality.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 .../bindings/net/renesas,etheravb.yaml           | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/renesas,etheravb.yaml b/Documentation/devicetree/bindings/net/renesas,etheravb.yaml
index 1e00ef5b3acd..7bc910ab3ae0 100644
--- a/Documentation/devicetree/bindings/net/renesas,etheravb.yaml
+++ b/Documentation/devicetree/bindings/net/renesas,etheravb.yaml
@@ -122,6 +122,13 @@ properties:
       Specify when the AVB_LINK signal is active-low instead of normal
       active-high.
 
+  renesas,gptp:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      A phandle to an external gPTP clock for Gen4 platforms. The property is
+      optional for backwards compatibility, but without it gPTP timestamps are
+      disabled as Gen4 have no gPTP as part of the RAVB module itself.
+
   rx-internal-delay-ps:
     enum: [0, 1800]
 
@@ -305,6 +312,15 @@ allOf:
             items:
               - const: fck
               - const: refclk
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              const: renesas,etheravb-rcar-gen4
+    then:
+      properties:
+        renesas,gptp: false
 
 additionalProperties: false
 
-- 
2.54.0


