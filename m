Return-Path: <linux-renesas-soc+bounces-30845-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oLeED1+kz2mZyQYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30845-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 13:28:31 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C6280393AC9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 13:28:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 26D4630370A1
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Apr 2026 11:27:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46ED43B776D;
	Fri,  3 Apr 2026 11:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eXkTBHXL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B14371064
	for <linux-renesas-soc@vger.kernel.org>; Fri,  3 Apr 2026 11:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775215667; cv=none; b=aefTMGrbydtCxnLP5Fwej1E8ZkbR8sPf/uQGUfvBZ7pybH48T6QxX542SgslHK0/pEc4g/8x/FI8o3r/lt/C036iofkdJY8mvCjoCxUA2KAIzuGFrypk6H56UWJs7Tb85IjH9xxKiKYYykDvK1N4ABhTTJZuEWZCtIoK39Q4XQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775215667; c=relaxed/simple;
	bh=5ZKt2RSjapJGUOO3d4vZSG9DTmpONEpsSL+hn9zyaLU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iQ+pNIWtHO5q2VO9ekN4uiD5GXoApSvN3nLvY2zVXZiHKaCkCUOLU/Wzo2aljoU2j4LLWlSAQcydaWbk1rHsK4Lq/TLXiJ54+6kZg1IBVTVbAqBfBPYARnlcAmfdU1u+DYnjaZb53/0iSAi7rmGR59lnljukYm44yAnLsnHzYXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eXkTBHXL; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-82a7ebc729dso771279b3a.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 03 Apr 2026 04:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775215655; x=1775820455; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EFdHi2+kpz8pfg7CkbtM24aApOcYkAvDhf1e0BZOdSc=;
        b=eXkTBHXLLc8zTNNMGLFaQRgGYVlYn1G4L3RrDlMLEyhD8eVHUYAPVTTkdUf2x+jQnA
         oZXBR1Y2RHcDqMm9trK+RlV3dijPUH1wlbS0EfGDTpMLtP2pz3Dx2feZjIHN9YktPvBR
         fXW9NgHtavrE8+06skcyKDCHzXrW5s0EI8AZlTs52EgfpuoJAzETkSB3YzP9l7pvWSwS
         2IhUkfQg2L+XUxinEScR+VHgG0j3CSTAWBKUYRbrfv9vT8cvYJia029jsLs98AAVIlJh
         zkoklv0vo43D11UQENsRL2L/fia7SA0YdBD1uRu897TzvivhHKnELLDzcYSbQY8nsMp3
         S6vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775215655; x=1775820455;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EFdHi2+kpz8pfg7CkbtM24aApOcYkAvDhf1e0BZOdSc=;
        b=QVDto5g/0MN3DNBlRH1pSq7PHHFYzp9dls6lo1XBeCSFLZ+CTdAq6lgaEkiMOlSgcS
         4lEv3BTRB0dw4hVAqzJnz4IN1C6oVPxw39nz54f4VfqTWH8n6pDfzemJWRpu+Htu3jZS
         9Il7PUu2arF2K6EXn5DsoKWD4msXGZRg/GZlOgu8XSW79VhLAdlclhh9oTXo3EGNdbF4
         NOwB9ZXV7DY/j49Qcc32dqQmQxzTL4/v0Ect14EXikdmW8tACR2zDXaYnIGb55Bgi6r8
         LP7XacPD62ul1ONj23WDzZ3/s5OBvPnBAA6fCiSJKHLx4SqZ1bPSWeZhAJhUGx9JczOK
         SnXw==
X-Forwarded-Encrypted: i=1; AJvYcCVNFsXdNRHk2P6WP8Kc/3fYLBYRrbsGJOrTh8eH1es0qU7hEBkuQDfUQDPDZ0Gfi2tU2JZ3Q8x9lN5OGmeexnj6XA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyqw66nuOyBz1f6xae64oDyN7VRYdJoxuUMhfZb+bBfcVJ4jymj
	HKGiTmy9z0y2SbRIvHoO83x+owFlJQd3QQ5zb0Sd+30501nt4XWIG5yg
X-Gm-Gg: AeBDiethZIPYC5gZKNT+HHpWjAJ9PUDZLXh0r9fJKhBYYrhXOt8BKLP8MEAABA92jsr
	aCEDqrJVmCUj9pzwZj2OvW7WdPJ7jvZy5BwzMFkm61uUZRjdfi/ZE2JgBPgihh4s5LKnmRxft4k
	8EVhmis/wUtP5VVJADg+jZy/sQX6QVqiGs3oQy6LuuBZNz2+gNGNH+n+kXGFLwP8ZYgwxIpt2BU
	7HHV0qqivPNpEiaZImwBGsG/m7lxx4ItRur5KG5i3FRoEvSDqapZ3SkqFCBJfuSq86My9NdvaaK
	NJWNnvm83+ruC9Q89ZkjfYa1IEe4xNybo0fxwKoqza6P+RrPiqlYpD/xBbE1bZLfHrpPMugFHgh
	cKkk4I6wBG/nFNag7PcLT0hCT8WRufe7G/lC2lufRL8vHEw0u0D6RjR/GUcHRtHhGZbHDVqwllq
	cM5E7465jFJXROmJDa7ASbmrOjKcWZz55RszvcX8JIzdHvJjL+LnpZA4t83A==
X-Received: by 2002:a05:6a00:2e1e:b0:82a:5ef0:20fb with SMTP id d2e1a72fcca58-82d0db53702mr2721652b3a.26.1775215655355;
        Fri, 03 Apr 2026 04:27:35 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b6113dsm5202251b3a.23.2026.04.03.04.27.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 04:27:35 -0700 (PDT)
From: phucduc.bui@gmail.com
To: kuninori.morimoto.gx@renesas.com,
	broonie@kernel.org
Cc: lgirdwood@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/3] arm: dts: renesas: r8a7740-armadillo800eva: Add spu clock to FSI
Date: Fri,  3 Apr 2026 18:26:54 +0700
Message-ID: <20260403112655.167593-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260403112655.167593-1-phucduc.bui@gmail.com>
References: <20260403112655.167593-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,glider.be,perex.cz,suse.com,vger.kernel.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-30845-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FROM_NO_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,fe1f0000:email]
X-Rspamd-Queue-Id: C6280393AC9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: bui duc phuc <phucduc.bui@gmail.com>

The FSI on r8a7740 requires the SPU clock to be enabled
before accessing its registers.
Without this clock, register access may lead to a system
hang.
Describe the "spu" clock in the FSI node.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 arch/arm/boot/dts/renesas/r8a7740.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/renesas/r8a7740.dtsi b/arch/arm/boot/dts/renesas/r8a7740.dtsi
index d13ab86c3ab4..9cae87a1979c 100644
--- a/arch/arm/boot/dts/renesas/r8a7740.dtsi
+++ b/arch/arm/boot/dts/renesas/r8a7740.dtsi
@@ -393,7 +393,8 @@ sh_fsi2: sound@fe1f0000 {
 		compatible = "renesas,fsi2-r8a7740", "renesas,sh_fsi2";
 		reg = <0xfe1f0000 0x400>;
 		interrupts = <GIC_SPI 9 0x4>;
-		clocks = <&mstp3_clks R8A7740_CLK_FSI>;
+		clocks = <&mstp3_clks R8A7740_CLK_FSI>, <&spu_clk>;
+		clock-names = "fsi", "spu";
 		power-domains = <&pd_a4mp>;
 		status = "disabled";
 	};
-- 
2.43.0


