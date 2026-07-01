Return-Path: <linux-renesas-soc+bounces-34584-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id z8V8Ah/ZRGo02AoAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34584-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Jul 2026 11:08:47 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A656EB773
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Jul 2026 11:08:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ragnatech.se header.s=fm1 header.b=QDP1ByMd;
	dkim=pass header.d=messagingengine.com header.s=fm1 header.b="f pkDxIN";
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34584-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34584-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ragnatech.se;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8B74430509AE
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Jul 2026 09:07:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9D733F4839;
	Wed,  1 Jul 2026 09:06:42 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81EE73F44C1;
	Wed,  1 Jul 2026 09:06:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782896802; cv=none; b=OODrttOA+O4KhPTfF7MNgAhDbHvua+0UkM4p9JX9KjeqW2+bOJjqXcO+tLc5iVS0xAqZSuK29ydQNaYItmYrk0UCPCXXBUN8liwBlK2uYtZTRgF+cHgnQ1HE4lqrWHAF7I/Nv6SMUyuuqvO0h80PIPbl7ctQ5whHAlJOZijJzYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782896802; c=relaxed/simple;
	bh=PpoJ8mSDeO5J500ag0sun37EeE6AvIqeZEsWDfHGEXw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CA00f4OnK75zfEKruEHVrbLQvWFM58doxwtYiJugbwR65utLYeeGNG75tM3QoQVK4HlVvaONCcHE0DmMUJ44044gHytDvhZihSMRSFrAMv5A1MQXR8JRzb7Qh01U4w28ITUfzar89Q81JpDC22eppcmPv9YzP+D8UnvlE0512fQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=QDP1ByMd; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=fpkDxINm; arc=none smtp.client-ip=202.12.124.154
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 45AD97A0082;
	Wed,  1 Jul 2026 05:06:38 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Wed, 01 Jul 2026 05:06:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1782896798;
	 x=1782983198; bh=sLmOrxWgSzKesbLl24YL8N9oK1UdIQD9gnT9tarZDw8=; b=
	QDP1ByMdIb5LNNLtI2fXmym/82zGQHpJBAI/+Z1vobMjnHN0kFmVK7hWOj7wFuqt
	j7nsYgRP+3zMujpdUCS2m9GOGvmFWA9re/ZiXiuAlSRSoifkQ2pf+tEabDMowtCm
	PAnuwPJYFklLrPn7D8JbNxvm+uuZopCJ4Q3HcdO844j4EYahGVFE3M55QtjO9mOQ
	m4NneQiZw3QibxLNJzn5atUBIbm9JwiCwA+mcgSVdoHDC0pVwacR/ZMF1YWkjX/K
	ZHhyRFCLppWTgK5BXxc4DDNaRF/m3+HkxaDq4h6vvx2ShZkQvALroflHiGj4zdFE
	BnQ9RP3Im3T/K+MVAnQuww==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1782896798; x=
	1782983198; bh=sLmOrxWgSzKesbLl24YL8N9oK1UdIQD9gnT9tarZDw8=; b=f
	pkDxINmhHi5jvfinybWRpTYhvQdl0/hY0hT1zCeg1e/ATQi6ksag0Zg23FRzyvfu
	eXKijM37rFSzWRPEFcIzD6rnyZlwW140zkImlry1GjsKKPVgwkdxHn25LM85G0n5
	2jYb/GfFzdEebWhrK43CJ1pcX9rTsuGI5N67F8hOaZk+v7xminO/zt6+cQ6kgW7P
	1dZn1zLYMNWfQthb+yaOj4AmaBCUYGwtF9ShJHDqtNw6snrSqx8APfZwT4AQdbwm
	27z2h6Y2E6Alfv53zM5ielfSD1ky8BFDo3Q1yNtQlfEWng4ah9LFN0BMGZNZS6w5
	h3eKTjs5oGdBcCFGhi8iw==
X-ME-Sender: <xms:ndhEav8kbmMOeRP3dMEwUl6DpCiepzrTNtIUxeklOlkTi7Q_-kZtbw>
    <xme:ndhEaqMYvWegUpxV9voh084YSk_ZvVnADMHz0nVX2rihqb80Wsa8jLM4xjrDQTKnW
    17C1GuhBPbF42y70L4hmKKHTgTiyQuz6KKBjOFYH-0t0ngC5x4c4UE>
X-ME-Received: <xmr:ndhEaj0L5pVHwr_-kXKuP6qzLp8_6WJhyy57AoS_DO5MuUFZ-uIpwK1bguYdeLqLg46LAA9H0H9eUiU8QFfH1m6sPCqmojw>
X-ME-Proxy-Cause: dmFkZTE3rKKFIjc4Iepj+RaZEOhnLwC8E6H+Yt72l5YB2RYF8Pr6ijJB7aPe5owdrAqOX/
    qNL90qN9LAM7d6Nhlg7Ldx3deWklWD8cVGuXYlhWC0+2rSgHyy+T/zUpqYdZrK2h6yo8rv
    zCLTAXioZy4J+zRvqZ5u+W8Q05hLHPm0phB7T6a+HbETUjmRdsyvGqMiUsxrNUJdybsduY
    4DWX9Xlth8r4N8PpvWvMevx4aJHyQ3LfMk8wH/womvO2nV65Zoc3jyD6AGQcNSlF5hDDiV
    FREQYyG+pPqI6ZcQMMI8zX7ZVWqgSVzBWwFDVIK+fyQrcP1cXSVxdCRnJ3yaWVAKcW3zR/
    6D1+I4xSQ8F/77KvOs0YJWdZUYATN/2pnRZVQIXlgtflN1g6oYgTulL48mvbpCX7Z6nTyQ
    pcwcVxYB+Jx5Mi1OXAecP/bOgMQHDLzlkuxmSKVv8hhg73rzcj60JcyPngbzxV9ONIod2q
    xlIXN6kloZHzCeteBfpWDuRGTqlIqQ7BY5EN/dnT5S4I7Byfz+RNmdMzRM75H2t5ypM3wo
    00EylqTjtchR6YOJMnE16k/SJK6nzAvfqvNSy3HHYuwNwjN8DdMCzKIUJOKaQS01rgSGZY
    PTeMHJWpyskQF/fel3El5SnPuU5wXdzclylhcFOkwt4CrWnrMJukzec0S1pw
X-ME-Proxy: <xmx:ndhEarfirZRfAOAgaUcBM3ngMfg6yx2Z5XTuk_kuPYH5RX1nf23zUw>
    <xmx:ndhEasYvbQoH0xDwlp3qSYc9ixkqWSKF1g2ixxPhDStmFasAuL2yIg>
    <xmx:ndhEaoW5KYRhqOeYTpzEsu6zlhYLbBKOsm1bvDR0B9yYAb87VU11uQ>
    <xmx:ndhEanSBuv3HbxpZMlSPFsG3rj__RtyWmTBIRg6tYGi8cg4RP2MH9Q>
    <xmx:nthEavYeTZlQ03gzsclzGf-dV6wzaWLHd9QM2g4f9xQSIE36EMUuDq7c>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 1 Jul 2026 05:06:37 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"DavidS. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH net-next v3 3/3] arm64: dts: renesas: r8a779g0: Add gPTP node
Date: Wed,  1 Jul 2026 11:06:07 +0200
Message-ID: <20260701090607.1108208-4-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260701090607.1108208-1-niklas.soderlund+renesas@ragnatech.se>
References: <20260701090607.1108208-1-niklas.soderlund+renesas@ragnatech.se>
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
	R_DKIM_ALLOW(-0.20)[ragnatech.se:s=fm1,messagingengine.com:s=fm1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-34584-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,glider.be,gmail.com,lunn.ch,davemloft.net,google.com,redhat.com,vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:richardcochran@gmail.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:netdev@vger.kernel.org,m:niklas.soderlund+renesas@ragnatech.se,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,m:andrew@lunn.ch,m:niklas.soderlund@ragnatech.se,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[niklas.soderlund@ragnatech.se,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[messagingengine.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,ragnatech.se:dkim,ragnatech.se:email,ragnatech.se:mid,ragnatech.se:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B8A656EB773

The gPTP module is shared between the RAVB and RTSN Ethernet devices on
the SoC.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
* Changes since v2
- Preserve sort order by unit-address.

* Changes since v1
- Rename node ptp.
---
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
index 82a7278836e5..b9b860ef7035 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
@@ -589,6 +589,15 @@ tmu4: timer@ffc00000 {
 			status = "disabled";
 		};
 
+		gptp: ptp@e6449000 {
+			compatible = "renesas,r8a779g0-gptp", "renesas,rcar-gen4-gptp";
+			reg = <0 0xe6449000 0 0x500>;
+			clocks = <&cpg CPG_MOD 2723>;
+			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
+			resets = <&cpg 2723>;
+			status = "disabled";
+		};
+
 		tsn0: ethernet@e6460000 {
 			compatible = "renesas,r8a779g0-ethertsn", "renesas,rcar-gen4-ethertsn";
 			reg = <0 0xe6460000 0 0x7000>,
-- 
2.55.0


