Return-Path: <linux-renesas-soc+bounces-33745-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YCjeGszzJ2rq6AIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33745-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 09 Jun 2026 13:06:52 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 066F765F4A6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 09 Jun 2026 13:06:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=JDlkAepP;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33745-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33745-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C110B3051652
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jun 2026 11:00:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB7B13FE37F;
	Tue,  9 Jun 2026 10:59:36 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E47B3FC5AC
	for <linux-renesas-soc@vger.kernel.org>; Tue,  9 Jun 2026 10:59:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781002776; cv=none; b=OTRYJnjbahtet7CjUlJVqrqBihwtv7l/Fpk4GrxczE7wbRYlmhhN3s/WdwwQ6i49B6eEilfjBjFUpyNJAPy/jIxf3ywdT6nitCSvXioKzhdFcv4YahNZBN2oP3dBVdMtPYAOWImW8CeVIMQvhRN0bkdc2a9UbEusYfly/8/ZAmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781002776; c=relaxed/simple;
	bh=ZvmNBM0dEycs0ZSV4pUzv9neHna2gcQfukCmjf+ujfI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=US9Ij/hVmv2f9TLsyEN5H3Kax69CQRr4A2v7fFK9q0kWqkJuz5l7Av7MCfKG1/AEPIsamfZtTIk7jG4x2wCj3xcgjgVVrAhMEBAZq2hu6RjbhftNDxRZmByB0DpwrpoacUlSAsjATWOT9NPMI10TsnQDW0z/fN0n8Oj/N9K9ImE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JDlkAepP; arc=none smtp.client-ip=209.85.128.50
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-490b4a8e28bso44553255e9.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 09 Jun 2026 03:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781002774; x=1781607574; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZlQ7E/EZea6BzD4lH08QBVmk0H9Rm37lQbjREjZTGMs=;
        b=JDlkAepPL6igXebSuZNnSCed6C97w9eP9LvgJm4sRlpSaLy8A8Cult3HhCTSc8lpAM
         NO6zZHYtz58v0YuwKqYHUI5TuGZ5sRNw7wrZNyreeva/rAAbibeUq+SFSal5wPvW5980
         +t9uUgsj/vhQ/vq5EIcGtKTME7eB8Vq+R18pLiUlBe74wGRGfEz0L4YjwM2GtBIsNQAf
         OaxzdfIvYC+148CdKlycwDDRiYwzR8S/kwhgEFI7oT4mMyi2qQw4zpeTWQpod0Opmcr4
         lFiU5LuFTxWjIO/jz6+AMhXXErCKvQLlFNhjM8S1AWqvET/I0sQBH6M2GFtk2YN1nNJg
         AnOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781002774; x=1781607574;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZlQ7E/EZea6BzD4lH08QBVmk0H9Rm37lQbjREjZTGMs=;
        b=SFVDDR9kQqKPmY6tLPM3MIKIYgsHXx2+qH4KuMYUHRALujrVkgruny8KHw6xKEbyZO
         LZ3YLgNkL12/kRlPffPNclY7PDSyA+8k1ZbURrLgpjsWKt1AdJxzEY27tXXhXoF63IPo
         pudxLpXCjAkdzcSpJk9BL5EQJNjM7Mq4OmcrJ7crUfUeEJGk39Rr6MpkjRI+FGPuLf+5
         ZqjY5NxjFHsfVEe6XZbRbTK5PDTRBiNEcCYXvNA9cuAN0sQknfPwz1jj8oKe02hHaFJY
         U9qjRkXNtPdfuCBlLLB1I3DhIlyeOavwtLS2ou9CNI+r65jdpF9qh2CquHsEjHW4TUj3
         lBMA==
X-Forwarded-Encrypted: i=1; AFNElJ8oZyJi5MZX9Omd2CaFhhx+L727MVUSFTYXCDQOQ6T/Y3zhItdx+RUDY18Salr28K1a4MYANXhXq5/60rZozEwPSg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyemRIFKvSyq9MKIh5prLOIH+E92XnmkXeAo+4RijZN+pTcazWe
	mvaUVDq4xnM3mz/hFw+B2J6xYDfxmNf6ZmMY5No2cP7HvhtCijXqGTJA
X-Gm-Gg: Acq92OGHzGvT2hyD2L9sNB0ssO+BBozRMKZEzGGfZ9VYeXTKLZQWeN53A6oQVciABW5
	t7SGayfW1LKivd2DAPQOv7guqOBaYIBp7JF+wUwWmkmED2W0yx3Ma+U/3dyON047oj9pqbMWwmn
	n0MB9h6iGr/DuNeB5ArVN5Y1BNiqXJkeCKglh4lyfy6G6COJjr9CEgZpbjrR8migEIXxrzQgwct
	COBWf/2N1h02g2uWFaGS3QKuMGBCfeD6tlh3Pxan7+Mni41TajGo6eHPkONmBisAsGmh9hIzo40
	sd15a+kl48R9v8s5uJO4p9j4AD70ztdcy2jB3UWHN1ixcUagM4KINmKfH0xbfrRSR9mhjCxpVV8
	xFSsDbhoecpcLRi8EPqGu+CJm8piHMWHliGiPYnUrQJ9hHfY0nXvsDqTOuzy/0vWdCtW7t7sDMx
	daJiteUUD7Q3hd140Icg3oEoJcCMX17NfI0yt3wv7fiaqLrx+W8KW5MjxEOEEd91UtVb0/8Wp6/
	cGfjp6N5boN9Z/CHZkQo2veSdC2rsQrWT2yNFNdQwVtJu0K5ejeIw2C/g==
X-Received: by 2002:a05:600c:4e4b:b0:490:bfda:7d7e with SMTP id 5b1f17b1804b1-490c258999amr335438365e9.3.1781002773647;
        Tue, 09 Jun 2026 03:59:33 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:2b2d:6009:3bbe:fb84])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3d663csm524250635e9.11.2026.06.09.03.59.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 03:59:32 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 3/5] dt-bindings: clock: renesas,r9a09g077/87: Add LCDC_CLKD clock ID
Date: Tue,  9 Jun 2026 11:59:22 +0100
Message-ID: <20260609105924.962573-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260609105924.962573-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260609105924.962573-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33745-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:geert+renesas@glider.be,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:prabhakar.csengg@gmail.com,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:conor.dooley@microchip.com,m:geert@glider.be,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,m:prabhakarcsengg@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,baylibre.com,kernel.org,redhat.com,gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com,microchip.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,renesas.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,microchip.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 066F765F4A6

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add the LCDC clockd (LCDC_CLKD) definition for the Renesas RZ/T2H
(R9A09G077) and RZ/N2H (R9A09G087) SoCs. LCDC_CLKD is used as the
operating clock for LCDC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v1->v2:
- Added Acked-by and Reviewed-by tags.
---
 include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h | 1 +
 include/dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h b/include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h
index c4863e444458..f6cb8d649a46 100644
--- a/include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h
+++ b/include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h
@@ -34,5 +34,6 @@
 #define R9A09G077_XSPI_CLK0		22
 #define R9A09G077_XSPI_CLK1		23
 #define R9A09G077_PCLKCAN		24
+#define R9A09G077_LCDC_CLKD		25
 
 #endif /* __DT_BINDINGS_CLOCK_RENESAS_R9A09G077_CPG_H__ */
diff --git a/include/dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h b/include/dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h
index 0d53f1e65077..312e563b322e 100644
--- a/include/dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h
+++ b/include/dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h
@@ -34,5 +34,6 @@
 #define R9A09G087_XSPI_CLK0		22
 #define R9A09G087_XSPI_CLK1		23
 #define R9A09G087_PCLKCAN		24
+#define R9A09G087_LCDC_CLKD		25
 
 #endif /* __DT_BINDINGS_CLOCK_RENESAS_R9A09G087_CPG_H__ */
-- 
2.54.0


