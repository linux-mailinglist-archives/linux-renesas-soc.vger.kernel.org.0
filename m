Return-Path: <linux-renesas-soc+bounces-34100-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 30D3Ey6PMWrUmgUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34100-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Jun 2026 20:00:14 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CA66C693B6D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Jun 2026 20:00:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ragnatech.se header.s=fm3 header.b=ZjLIv3Pl;
	dkim=pass header.d=messagingengine.com header.s=fm1 header.b="j 7rW0s9";
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34100-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34100-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ragnatech.se;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D20E4308D36E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Jun 2026 18:00:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48EA647B41F;
	Tue, 16 Jun 2026 17:59:58 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D306C47B425;
	Tue, 16 Jun 2026 17:59:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781632798; cv=none; b=FHdG00/cZ4LNKjP/baoFsSULGf4hogqDV4ZAtiMiwS4vRiH8n4HqAtm8hxe140s83aqmJ/GzHQLvbCdAV3+80mUyijg6L+DtyrKH7m82OSwTRHtBJN/c/iS67LF4Wg+Xsz6SrH4NHTlwnxujk0K+IF1ZALUWKmTz928rchf+g4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781632798; c=relaxed/simple;
	bh=utWB0TyNGq0wvytFinj1BNpHH7Rzp4XGAoyCWcuHJS0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q+uEbx8StASaJGbTD990RF3+6EYls7L1jpr+x+FsNu0Tj4NcC/xJM7JeKO1c543UKz694bWmAR/9H00ceYX9NwxA/g8SIwsNoW5Xrb+1ipx81TCLRKxRyifrvKcPnkM+RVhldmu6IxSsLUUheFsq6Vc/yf60MH3gWPo41hQN/V8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=ZjLIv3Pl; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=j7rW0s97; arc=none smtp.client-ip=202.12.124.149
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id D75DC1D000F0;
	Tue, 16 Jun 2026 13:59:55 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Tue, 16 Jun 2026 13:59:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1781632795;
	 x=1781719195; bh=LdYyRFprC6/IPCwiBAmE0jouE8njFaOE+umllzwrd5I=; b=
	ZjLIv3Pl3h0t2eVLt0aSC+8Tq26OeoxRnr8gaTkejPx2aZlI/3YcIgpzzCBoAkPG
	7DWXnTXOI0q26RoC6AXPGP9e9uJ0A7L0yq4ihH9wQcoWfYoCvXRfIORiRzvPmYfW
	ba4hlOxdVK0RiyluoADQLcZM61yFfmSbC7LE7sjAsTBXyLkzyt4XyO5OITpePtJP
	7QKl8qrnOxMHrQ1Nxs99Zt2FGImvJaB8M8NelRP0HUm5euKbL5Yh30GQTLmZ2ann
	Mpm03FZLeeofgJPjzQyL0heIjdLxwtkIwnENvWBPCxyv4EzyySieMnx4pgH4ME4R
	Lww0glOX58REm0D8Ar6LNg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1781632795; x=
	1781719195; bh=LdYyRFprC6/IPCwiBAmE0jouE8njFaOE+umllzwrd5I=; b=j
	7rW0s977+jiEibVm6Q5O7VvEamm21gqsyxgO7mWqkK8Ay6RCr6pEba0lqig+hdlg
	x79KXc7ykrBaqT2xUMYsR6fMVTFcd2CDEzZYIdH8h2rs8DiMZy8e2Hr/aUvZfuqN
	Rvpb3wi+Daq4KWbl0bvAFtPGPh4+jwTayLNS0I+r8IMuXxn42Xx0PgEA8ID794Cn
	7Mloc4OWMZaB36hQ84pIb5iH5BodFosaoA0Ylj3Z5dKdqrpB8tIEmDHsWyDBJN8F
	opGc5QiRTIppPTQ38XmFmnMwcP879ydwLn12ZQcFmu1ow0WhKXj7BYy3RutnaEUy
	JJZFAKAqZxeeypL5Uy6XA==
X-ME-Sender: <xms:G48xasyylIi6kkcoif8zoikzuIc3TZT7_gVj6c54AJYGqbNaMJStFA>
    <xme:G48xaskyhSnnMnR_sT19IN8CCrF6Cs76_Pgrj0XxmOLolPshJD7lt8TbEoAgZWvK1
    HYzs8Z4HNghdFrhhblwooGjS1HKWaNAEyfmYbgCzTQS4GZK_JBMu9k>
X-ME-Received: <xmr:G48xav_XmDLA5Nzb0SR85yYDb2nIWiTg__b2ICbm6crmwMR0cuQ7LXUsUDREjsyAlfVEazEeh8lLGcvBkucRasUa3IkM>
X-ME-Proxy-Cause: dmFkZTFzMoEVwJ23/63BROQGNT0ZS7cXR47HqO+CDSdbwtxHNmnrRpTLZYdoYwpdUpZHYj
    WU0KyMLp10RzWf3fGNyDiytarS8coUyAbaVJ854ZzfbbNXzExBiFXYdhxw/Ksaoa+hrCIx
    EDRhErfzw8A2jkir0CHck11DpMFn3TyLDsxdzSFBiyYcfZQLs9s3JpvsMupXLgDfFBYWEJ
    XqylP9jwLhP7kCi9W17W5QBv+Ns3OCGUfhOM2MbeWkNc/DrXRJEyuiflezdKW4QwnpE4Mh
    HXsrrpRLWtjcij2rIfI942nASQZ65knyAakhCDAfsNu9FN4D1mwCJyvaGubQyYaFSQebnd
    u8PUicg8tQsv4f48woRTEPR4wX/1XKdMJYDFqcsHZYZAT5rmYT1REK9QZeTEZAnhGFRPT3
    XLVJZ9KXIV/8L1Gb3BqlBuz8rI3RZ+8dFlBsEdw+o9PngrJwWteHY20Mi3ObwjXbBjK0Jl
    rNzwML+cxIBbdBoapxbRZuejUYReRHADmjB/qJC/QZqZJ0J8jgMt0qCUw08yllaPnQF5ts
    wufkvb6ZU4aspVS1wznqlIzT7LtIbJ1b46nUI35J6ZX32FqKnzJdsMr9OZF8X8Ida3W8Uk
    pLzzzOdnpsK1JRAD6BJXoALc2OXJe4oN7//DpCeRR8fGJzCl0JqhZNR+8EHw
X-ME-Proxy: <xmx:G48xanrQe2cy8Z76Xevp_zNR2hhvEiD0rPk54CVzd0piTJavtks6tA>
    <xmx:G48xajL8XgzQKaKUaeknGp_zvtY1A3NX40iMYAAiehCvkaPE3pbZaQ>
    <xmx:G48xah0mxJf5dNcYG6qydtuBdjaxSpT5Tdv3N_0jFrVCw3L7YWD7_A>
    <xmx:G48xaiX7PS4uYrgKm6036KkGDXZdljEHenGRWnL2VVecgov6Pb4_1A>
    <xmx:G48xanO2emRvETbA7C-1L3hOHUkEn7XjRpsFUDOZBnm3IeVgcpvAn_JH>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 16 Jun 2026 13:59:55 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Frank Binns <frank.binns@imgtec.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Matt Coster <matt.coster@imgtec.com>,
	Maxime Ripard <mripard@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 2/2] arm64: dts: renesas: r8a77995: Add GE8300 GPU node
Date: Tue, 16 Jun 2026 19:58:35 +0200
Message-ID: <20260616175835.2109336-3-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260616175835.2109336-1-niklas.soderlund+renesas@ragnatech.se>
References: <20260616175835.2109336-1-niklas.soderlund+renesas@ragnatech.se>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-34100-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[mailbox.org,glider.be,kernel.org,gmail.com,imgtec.com,linux.intel.com,ffwll.ch,suse.de,vger.kernel.org,lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:marek.vasut+renesas@mailbox.org,m:geert+renesas@glider.be,m:conor+dt@kernel.org,m:airlied@gmail.com,m:frank.binns@imgtec.com,m:krzk+dt@kernel.org,m:maarten.lankhorst@linux.intel.com,m:magnus.damm@gmail.com,m:matt.coster@imgtec.com,m:mripard@kernel.org,m:robh@kernel.org,m:simona@ffwll.ch,m:tzimmermann@suse.de,m:devicetree@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-renesas-soc@vger.kernel.org,m:niklas.soderlund+renesas@ragnatech.se,m:marek.vasut@mailbox.org,m:geert@glider.be,m:conor@kernel.org,m:krzk@kernel.org,m:magnusdamm@gmail.com,m:niklas.soderlund@ragnatech.se,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[niklas.soderlund@ragnatech.se,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,ragnatech.se:dkim,ragnatech.se:email,ragnatech.se:mid,ragnatech.se:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,messagingengine.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CA66C693B6D

Describe Imagination Technologies PowerVR Rogue GE8300 BNVC 22.67.54.30
present in Renesas R-Car R8A77995 D3 SoC.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
* Changes since v1
- Use SPI 119 instead of SPI 223.
---
 arch/arm64/boot/dts/renesas/r8a77995.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77995.dtsi b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
index 5f3fcef7560c..c42d96540ce7 100644
--- a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
@@ -1295,6 +1295,21 @@ gic: interrupt-controller@f1010000 {
 			resets = <&cpg 408>;
 		};
 
+		gpu: gpu@fd000000 {
+			compatible = "renesas,r8a77995-gpu",
+				     "img,img-ge8300",
+				     "img,img-rogue";
+			reg = <0 0xfd000000 0 0x40000>;
+			interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_CORE R8A77995_CLK_ZG>,
+				 <&cpg CPG_CORE R8A77995_CLK_S3D1>,
+				 <&cpg CPG_MOD 112>;
+			clock-names = "core", "mem", "sys";
+			power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
+			resets = <&cpg 112>;
+			status = "disabled";
+		};
+
 		vspbs: vsp@fe960000 {
 			compatible = "renesas,vsp2";
 			reg = <0 0xfe960000 0 0x8000>;
-- 
2.54.0


