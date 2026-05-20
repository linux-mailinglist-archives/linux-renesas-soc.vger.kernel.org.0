Return-Path: <linux-renesas-soc+bounces-32862-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8ODGK4+hDWou0gUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32862-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 May 2026 13:57:03 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F0658D138
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 May 2026 13:57:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E8D1630433D3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 May 2026 11:51:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92FD63D811E;
	Wed, 20 May 2026 11:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B1XgMdOc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 997AB39B483
	for <linux-renesas-soc@vger.kernel.org>; Wed, 20 May 2026 11:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779277912; cv=none; b=kXBPnCrvHXNRo8zWbSjnQZHiB1oyTSAftMoIt1E5SzbAWQ5FpN5EuumVDB99JIXgBbL6Pk7JPX4kFWIbFzC7O62T9NXTj3L3e/cLpIqE2I5Ia33Qut+nemLraOaI2lC2xREJBrBMBhfby+/98ShP+cI1V5/fD2aaQt/Za0vYqWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779277912; c=relaxed/simple;
	bh=8eXxgMRvwvak+ZE0RwYotqpuKtjBzsLkHKbyXFDzy+8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B5wOI58T3hIj3IZF+F0GYheZUKUkJ36a/bKN1qPAmX0I2bdaYfZXIrv3B1UkCALqwC5otHXgrUD4TiEJwp6/ZrXtEIoPs3NX1epknZtLn06T4tlXKzlHqwCUdjU/QAYDX3PC4TRFQMM2AVgun5CFRFE5T/sTKqb1DCbBnRmh0k4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B1XgMdOc; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-488a9033b2cso39043775e9.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 20 May 2026 04:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779277908; x=1779882708; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yIfKEnRkl+xfWeFX2M7Vryt8G2X889LLQhN+8qPTBrk=;
        b=B1XgMdOcvrB+jAMSMF1CelbebleWObMY5YA4i+4vE49nYtjkfbHc69TBOvYf/Jb0lP
         alXV0wUCB26ZqhYieWiE0aiUgCJg49by/pVPgpn0Smn/kOsbNxc5yD0fJgoUjJbuy0nH
         +URIJy2LK8xo33bN5O3oakkUym9/WHeNy6UyuPCjg/ItiR9Frcu6H/QZfbwqX7qiawxE
         S+JeFc20fFcZEpNLrXG0+J1AOW52v+htLPhaorw2SmUFJYFqjeKEiJmoet2Ff6NGZYYv
         YITo9DZf9wjCUbdmcfNJy3t/Idwulp3XSjE+w9WEKYceS09HT+XhtePU6knawhV/yydT
         CDHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779277908; x=1779882708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yIfKEnRkl+xfWeFX2M7Vryt8G2X889LLQhN+8qPTBrk=;
        b=Q1TL81jKVm94b/cbp4WF4OduKoZYHq5FJ1pQzhKlF2JjjkKSJ/Pp5psiVYE84DS6Cm
         Jx0uhOl7VJdUKP7/CoM+tb9eNbd/Mp8g7Flp/fLTmtxfM5Urrtw2qz2SEzQaeeAY4pxh
         WjZO7HqzPHBQRqJaoqy9BCwbb02z4VF/FlFCFnFHeycGKUVlDdo+PyYRxWuFE4r74Ezw
         VpZXSY437yW/e6T6XmNfIuSLWeSUOYJTYQjH2E1HLwRIdGQ1S0v6U9FSAY1kVNZ8vivx
         rfr+n84cXxxPqhafSTEbYaWbGZoQB0V+ZO4gVdB44C5AEKPA19O1ZTnFdYZ/gT3LJT/E
         qiGA==
X-Forwarded-Encrypted: i=1; AFNElJ8Pc8skWylouXrJhN50zxvqHwuRB4UbFx1bbAAHTEt1WtAAMI33jr8erKjeWHKQCFP+3BKpKMo5DRLW6sAEyMg/Sg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwGK+TcAXuK+f4xJod0mXrrXw7oLOJmAUxNFm9HmWgML63JEMAT
	BeKCL2+/Foyn8vbe0jjILsoFX/aQa/aiROJ+rGBQ/j1u3sd5J7pHblNK
X-Gm-Gg: Acq92OFZ7NvjUShynS7nGT1isOV7lGFyvKT73RgIJ/0kCXMzom/szThONBT0OXWnlc4
	s4AzuxVsCfeq6LLOCZagS9txFbm92n403A/lJGCX41rcg1vY60PdcSo6oq3OP8iBrUGKmpJRY0v
	rXGlsSbssBcSPKFvU3Mr23NSzIEozywrA85dsBM8b87D6fOzsRWoNjQo68PyNdZnodlWAakVILD
	SK+QDWA5J96Zw/FLG40MZwluLdY8H//nNin1AXN1o0t017R0vqMjhGr6FQNsVBjAABdYlxjpEjU
	vnxEGhC3MrCjbxl2M8/TPEjvMScJr4ANp+G0z4Fvev+C7g0XrsJnmfPLb5dCeXeJdDwezZBSY3u
	0pP4a1ALUnuvE4AUfdjQebh0PJwsbcg7sJ/xf+zBLtoILT9p3r8wYKV4LJ7FyVZxeNmvfuZe8Ae
	5D5WLUFZKdgeczHjR77jU6DJQ/rTekAptfxQkrE7xXMzKD4VE=
X-Received: by 2002:a05:600c:c10b:b0:489:1c2d:211e with SMTP id 5b1f17b1804b1-48fe5fcdedemr279401685e9.5.1779277908333;
        Wed, 20 May 2026 04:51:48 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:a11b:196c:5f9e:ac5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48ff43f8799sm278842735e9.2.2026.05.20.04.51.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 04:51:48 -0700 (PDT)
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
Subject: [PATCH 1/3] arm64: dts: renesas: r9a07g043: Add max-frequency to SDHI nodes
Date: Wed, 20 May 2026 12:51:39 +0100
Message-ID: <20260520115144.60067-2-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32862-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,11c10000:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,bp.renesas.com:mid,11c00000:email]
X-Rspamd-Queue-Id: 53F0658D138
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

Add the max-frequency property set to 133333333 Hz (133.33 MHz) to both
SDHI0 and SDHI1 MMC controller nodes in the RZ/{G2UL,Five} (r9a07g043)
device tree.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a07g043.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a07g043.dtsi b/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
index ded4f1f11d60..ce2023c01baa 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
@@ -656,6 +656,7 @@ sdhi0: mmc@11c00000 {
 				 <&cpg CPG_MOD R9A07G043_SDHI0_IMCLK2>,
 				 <&cpg CPG_MOD R9A07G043_SDHI0_ACLK>;
 			clock-names = "core", "clkh", "cd", "aclk";
+			max-frequency = <133333333>;
 			resets = <&cpg R9A07G043_SDHI0_IXRST>;
 			power-domains = <&cpg>;
 			status = "disabled";
@@ -672,6 +673,7 @@ sdhi1: mmc@11c10000 {
 				 <&cpg CPG_MOD R9A07G043_SDHI1_IMCLK2>,
 				 <&cpg CPG_MOD R9A07G043_SDHI1_ACLK>;
 			clock-names = "core", "clkh", "cd", "aclk";
+			max-frequency = <133333333>;
 			resets = <&cpg R9A07G043_SDHI1_IXRST>;
 			power-domains = <&cpg>;
 			status = "disabled";
-- 
2.43.0


