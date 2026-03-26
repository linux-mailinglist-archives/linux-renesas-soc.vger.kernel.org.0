Return-Path: <linux-renesas-soc+bounces-30296-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QO5LDYW1xGn02gQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30296-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 05:26:45 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EA1A532F022
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 05:26:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1DBB4304B384
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 04:24:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EF1534B40F;
	Thu, 26 Mar 2026 04:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="jlAxbEg0";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="JC5Lxzg3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F102264D9;
	Thu, 26 Mar 2026 04:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774499067; cv=none; b=qVA8DpNC2aFzXWArSSL/gs4/hdS/Q19OK2xTGRYiWWHPqmzn2yS3++VxqzFtUzUDFTEmVdM/yZi26AA6AEAG4zjvLEEEVMbrERJWSqkuWVcz/KnIrhP3jbShRhJDzPn/fZ5gHloA/ZVkZyYX7fV/tdApkSl46QO7Ra5HOJqd9VM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774499067; c=relaxed/simple;
	bh=qLTnJqZbaxwG2qOJyKqUwAntFRe+EXd9+bqnDfPzsFM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oMzxIyR2v3Fz9mY8pt0LiDl/WpgE5cLFRPuyiAKgGieTnxw4x57ILLYQBvFre/dpKhxvrnU8rdK7Oo5z+dCPgL0naNQBszv72IjaKFh3tIhgwW6J2anYk+WBOABEObaM8PtbZmdWhgW68uUttaNja3+UPOC3Auu0l6lP2zAdds8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=jlAxbEg0; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=JC5Lxzg3; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4fh9dy3wnqz9tQP;
	Thu, 26 Mar 2026 05:24:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774499062;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Gz8iuoLUofR9ZYC8plHS1fC055EhXSSpkNZYn54JfOE=;
	b=jlAxbEg0yC3imFvd2R1nHS5j0oNPp2IkXAldtOCbfcVtQ/oSM7gKdnklnPL06lRXEREA+A
	0bsdNdMuAkTXKblyTp5tkX02f6kQZqW1np0Kt+HvnnIB1EaSI7JlSXJ76rOQoT/FHvMVai
	3IIsFOWwIAaqt7OtE4qX0Yu8w/K8h8RjROOo7g1ZfDXP7SukK2ZFAqeFCIz9D+CTE4+LRT
	Wd+lAY+S6BFDVfzLPs8ZeHpHWp9BL/iw1mZFZNmSK+D0XssuswpW8hy0B93k14Y/U4Cbf3
	+1uq6DZCWP5aBXeaqlL6HL5Ht0KNyTmkW6pJZQZAm/3BXER6CkYgSUYCZiJUsw==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=JC5Lxzg3;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774499060;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Gz8iuoLUofR9ZYC8plHS1fC055EhXSSpkNZYn54JfOE=;
	b=JC5Lxzg3aOVdFVeZ+AYsxNjj/KTzpZgK8hYLEVSpROVH/lWt6cK0Tiwte27XJL3pv4WoRl
	RJQCWIJ7n+3iJIgDq05kjjPYI7cZxFrxk4Pn3wyBCZ32NqYDY3bHFED0eIgYcZS6bv6kjC
	ul5hH7ox+F5xZxAI5qK7R2bnknyvSlzA9R+8p1uWs9ODD/ftV/h0iQmmOAH81Or2/IWNKc
	L1Lu5e8LTCxC6DB5grbmiqM/QEC+2GZBTRtqz6YlZkorUuXJTNVP08AwnUISHu27wtiZ9m
	R41JMvqlvCVzorh6GIugYi7eNuXWXdYGWNHYLOFpaPN5DTVQEcOOdN+e8h35jg==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 1/4] arm64: dts: renesas: Fix missing cells and reg in Draak/Ebisu panel DTO
Date: Thu, 26 Mar 2026 05:23:58 +0100
Message-ID: <20260326042411.215241-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260326042411.215241-1-marek.vasut+renesas@mailbox.org>
References: <20260326042411.215241-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 65319e4c90fd8c39f46
X-MBO-RS-META: m5gzf5u5rteu7g3pc8n4f1u6u999tsa3
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[mailbox.org,kernel.org,glider.be,gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30296-lists,linux-renesas-soc=lfdr.de,renesas];
	DKIM_TRACE(0.00)[mailbox.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.2:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,glider.be:email,mailbox.org:dkim,mailbox.org:email,mailbox.org:mid,0.0.0.1:email]
X-Rspamd-Queue-Id: EA1A532F022
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add missing cells and reg DT property into Draak/Ebisu panel DTO to fix
the following warning:

"
arch/arm64/boot/dts/renesas/draak-ebisu-panel-aa104xd12.dtso:30.10-34.5: Warning (unit_address_vs_reg): /fragment@2/__overlay__/ports/port@1: node has a unit name, but no reg or ranges property
"

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 arch/arm64/boot/dts/renesas/draak-ebisu-panel-aa104xd12.dtso | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/draak-ebisu-panel-aa104xd12.dtso b/arch/arm64/boot/dts/renesas/draak-ebisu-panel-aa104xd12.dtso
index 258f8668ca361..90767d74e21b2 100644
--- a/arch/arm64/boot/dts/renesas/draak-ebisu-panel-aa104xd12.dtso
+++ b/arch/arm64/boot/dts/renesas/draak-ebisu-panel-aa104xd12.dtso
@@ -27,7 +27,12 @@ &lvds1 {
 	status = "okay";
 
 	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
 		port@1 {
+			reg = <1>;
+
 			lvds1_out: endpoint {
 				remote-endpoint = <&panel_in>;
 			};
-- 
2.53.0


