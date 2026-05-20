Return-Path: <linux-renesas-soc+bounces-32865-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ENVOA8SgDWqC0AUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32865-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 May 2026 13:53:40 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A0B58D010
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 May 2026 13:53:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B38C830623D2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 May 2026 11:52:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B5EA3DB30B;
	Wed, 20 May 2026 11:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Km9wSA4A"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0607370AC6
	for <linux-renesas-soc@vger.kernel.org>; Wed, 20 May 2026 11:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779277914; cv=none; b=WhQKjqwOcDVITCsfRTLj+rqldy7tHdJT5Fl7lFmBZIHLVv7GR+Y8SiOXVhEBy/pt1zn1a8gE69sBv4UIV9mZtClgemEKXbNFn7GE0Q7jKy3B7Um+GtakZeXojNDAV4ZbTW8vWYOUxRzd3vbFp4Znda3f4S2k/on+D4CXQjYProM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779277914; c=relaxed/simple;
	bh=Oe/Vzac5SSnmypL3MNxPkUlNqyEwrti004P98hSz3KM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nE9vIrjuNU/saoO26nIJdVlFeHcgHyY6w1Ytv3lBYJOTZrHtl8yVscTpogqLEYwqfigIG0Yz7gi0RtUsdvlHMUbx891x3g8PmtyKQpaOPhyEGfDurpJ+kNXGk7D1qc54y7WvHzG6odaiJj1a0d3cPe9urieg9g2j458S7cOWIVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Km9wSA4A; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-488a14c31eeso28972295e9.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 20 May 2026 04:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779277910; x=1779882710; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dCMz/IseOZebpAHaDUgOMN1trxulRuqbc4meMeT7XSY=;
        b=Km9wSA4AxOF349DKpc7ejBbVcJYUyk9+gpedFWNgwLmu8Z9NOfB8Y8+Uw8lHGFW2/A
         X/nbkiCk4qy02vwkN/65v1llnDln6QPtX3jnORxkBMYdXziqDZ9ijR8A/WhEhkUlxuIx
         8F6QpBtPgtDdEIfhdNO8MTXxfsonllK3qT/fDVytX15FSySRyHjXQ0nWNcYdu+JTR90W
         xBQmkI9rZMWfJqToSC//z4ywJY6KDWWL07Uw3gUEI8tZd0/ll6+7iVWpyM2R1gYyv0ZA
         9PKCefYGg2GJAxX6xD0ebWiyE+h9zhThT7d60iFULzcCrSAisDnHO68Nj6y7CmB971yx
         rpfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779277910; x=1779882710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dCMz/IseOZebpAHaDUgOMN1trxulRuqbc4meMeT7XSY=;
        b=poKWf37m5zrks/cvdfi/H+T2Rb4HgPshiydwtG9qs1HPkh8jk2mkPfAW0jGnqjivP5
         xLFcpLBhNeNdqC9I16Uzl/Tlzl4L1cbP/4NqKVISDr4uCE8Hn+AvrSrFMgDLD1q7YBSG
         5pYQt9801hszz7dtlvgN4z8zolhYSShaUhyVs7+oC1MxfyTO3Ld3PEO9Aw8MGegwNBNR
         iaWAXEOo0XMQAfXLHvp2bkeMVEpIWOCIZ0tzFyYk4gGcbzGZI8nIj0Se9s4ZzCFkwaHT
         4BUioAP6B6ktzf6JjxOspp6t35iV6gBfSG6sOvTduprHHnwFUKzH/yMCTrHHP4EeHRfB
         sTNQ==
X-Forwarded-Encrypted: i=1; AFNElJ8Bk2SGFCJFIiyZtTvIMAIHUnWb0Z0+8I7GEjcbK6qPTh6kqX2vkJ3RudGu+xQaTM1eE5bjzHRTlpQCgsXZF9AroQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyd/oZnNCmHq2JA+bPSTe5bNhjf0RiFogmLjPOLobX3f3IjPRhH
	e4zI1IBUi0Q8GAaCTRLpta2dBkUjTQoG0W8/d8wLefK0q1Rg+vbT/pK2
X-Gm-Gg: Acq92OFcAZwjH1a1psf1NzfhIyQIglrL2QEdj39UTAkzoI+LyW5Mn6fKxqPgpDwO9ba
	C5lGh4N2IvlcWq+JuIC2eg6JWP/uWGXBpUDq8kSmsItbNnstLZmu1F/BDil7yBsfXhoSIbvtUMB
	Q/PVE94rN9Dd2R2KlARLvMNpOkDuciEFv8uLlwFKuVzoVeBpfEf2+CDFNXF+pOxFRcPSaDAH1EL
	XdOUxYzq8RlmsFFcuqeU7dSKjfhrZjEGe3L48DM1X1yJS9ysG0wW5Gxbbl+phKItXiLzsSqM5Ut
	eoe3YTikEppeSS7GJMHodc7tqWSzCWgYHEEWqQ2F4lCJuFWl4NHBf7bNNLJjMn5ATcr7YfSnNLO
	jeh0M0HXsPwVwkagKCXDo+85Qe3cGNubKHGDaKENx9k/KCvh+GdLDoTu3/XwwtKWYuFqNLkfCcT
	+nx2vF41FKmF1ZY5m+RvIwE2fmTBfATMmvlgT95T/1mgQzs1k=
X-Received: by 2002:a05:600c:c096:b0:48f:d1b8:9aad with SMTP id 5b1f17b1804b1-48fe5fd5357mr268970285e9.2.1779277910055;
        Wed, 20 May 2026 04:51:50 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:a11b:196c:5f9e:ac5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48ff43f8799sm278842735e9.2.2026.05.20.04.51.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 04:51:49 -0700 (PDT)
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
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 3/3] arm64: dts: renesas: r9a07g054: Add max-frequency to SDHI nodes
Date: Wed, 20 May 2026 12:51:41 +0100
Message-ID: <20260520115144.60067-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260520115144.60067-1-biju.das.jz@bp.renesas.com>
References: <20260520115144.60067-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32865-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,11c00000:email]
X-Rspamd-Queue-Id: 94A0B58D010
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

Add the max-frequency property set to 133333333 Hz (133.33 MHz) to both
SDHI0 and SDHI1 MMC controller nodes in the RZ/V2L (r9a07g054) device
tree.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a07g054.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a07g054.dtsi b/arch/arm64/boot/dts/renesas/r9a07g054.dtsi
index 7a3e5b6a685f..25f12173bd1e 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g054.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g054.dtsi
@@ -1183,6 +1183,7 @@ sdhi0: mmc@11c00000 {
 				 <&cpg CPG_MOD R9A07G054_SDHI0_IMCLK2>,
 				 <&cpg CPG_MOD R9A07G054_SDHI0_ACLK>;
 			clock-names = "core", "clkh", "cd", "aclk";
+			max-frequency = <133333333>;
 			resets = <&cpg R9A07G054_SDHI0_IXRST>;
 			power-domains = <&cpg>;
 			status = "disabled";
@@ -1199,6 +1200,7 @@ sdhi1: mmc@11c10000 {
 				 <&cpg CPG_MOD R9A07G054_SDHI1_IMCLK2>,
 				 <&cpg CPG_MOD R9A07G054_SDHI1_ACLK>;
 			clock-names = "core", "clkh", "cd", "aclk";
+			max-frequency = <133333333>;
 			resets = <&cpg R9A07G054_SDHI1_IXRST>;
 			power-domains = <&cpg>;
 			status = "disabled";
-- 
2.43.0


