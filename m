Return-Path: <linux-renesas-soc+bounces-27810-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2KM0GPTVgWkCKgMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27810-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Feb 2026 12:03:16 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E6FBD80CA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Feb 2026 12:03:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3AC79300981E
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Feb 2026 11:02:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34C08330B27;
	Tue,  3 Feb 2026 11:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TWKbD9M2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABD0F331227
	for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Feb 2026 11:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770116551; cv=none; b=LXt2UzqmAN77iLTapH25DxyQSqXwihGRW/BVSKtjIuVjUApIsa467jXRkcGna3HpgwmCF93J8m4P5PAkdXp27ChocBfOMiGGT54s4qe+NehEjgcPY7uur1PVhp6/fpEqd5xFRIy0QDADajDN3NJ3Bw/ay8Tg6aGmhkw4CC2Pd5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770116551; c=relaxed/simple;
	bh=+YFdaMDpXhd1kssNROsVNnfestvy44gFsrxkDIl/BJY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=txw2pImwjJI+Z4tP7evT+Cpp4VXjYuNsL3P4QztKzCo8TOl4400I2N44T79ae+ZONV27YOGeHgpuInpy8JGUM/EshhCtOI3S7simZvrrePOCSw55AboaKc8JxrhSazVnqv3C4smCDz1cffFFG8g8R+S1BBPQ9FEs2vSDCZfrhJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TWKbD9M2; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48069a48629so56759075e9.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 Feb 2026 03:02:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770116548; x=1770721348; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WE6s3RzlI9MLhSRJI6UuaRnNdQS5iQ3GZwPe8O0765I=;
        b=TWKbD9M2tXwI6WjuRs+p/XESNmPWgFYdUFwr1Z63M/ZuoB9ZKj5d/I3ZYO7tNk9LI5
         /Yij2SNZUo3qxQWe6l/+zRPabU7pyGWwYWRxZb5i+ITfNJkMywMbu8tXhSHa256FjbJD
         IDOAqr9rYegfFll+v8KOYTWS5GIg17/xEJUXyh4VOzEZeoxFBfwXZqCdmd9oFUyPoUaC
         lk1r2maF6wyZcvE53ZjRgWdQaYZ6CMKcQs0qg2yl0JoPcQlBOaZVYcKcsgdt2RenEbgX
         73Z9dluoLSnQNC65N0Djrdfd7MCMTVPqVtgEGeJavdk4JV2GwF1A/Uxf+axtnooPn5Y3
         tFow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770116548; x=1770721348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WE6s3RzlI9MLhSRJI6UuaRnNdQS5iQ3GZwPe8O0765I=;
        b=pLdvhN8hGOb6Z+fzho8cKATaSD2drxcArqzPip27PXO6pvpKb+co98egLDe/o9+Cr7
         S6Mbn5s7Ld45ZoqKYSRV4SgiQhpYFnmPbLKRJPX3AjL9jtk66bCoyfhlquorrxINvZO+
         wHRZGBVks9gua4IGzslIXDgw/3/GvmZsAK3whOEYxoK8fle2dIjcYWtvXgbdjTaq0Xw2
         xIvz/6l/8I6fVxFz9fy/UT7FUHdP9hSj8k2AEhKwE4ibTdQLDNxysBFAjb2DRtDVhF9M
         p/Sz8tY4LTTcpf03cNZPFvmiCiOW3C3RpxMI3pBQNGCOqh8YClLY9AnbApHK7ckBj8Cs
         7aQw==
X-Forwarded-Encrypted: i=1; AJvYcCXcBT4zO1EYJL/xP38/glQx8UWk627y77flYqtAw8jWorocdm2CQCPg/Rl6Obe6EtTAgT4/ecxAcoU4dLDxw/h1Iw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzOKVagKYM49v+lG96oszL+Mu+csiC8XJyflEvpc1BbBUfq/Inq
	sSfZlVP+v7lY6AtCZxmvqqlDV8y+xgeU2bcYgKOEFYpOk7rhzsKcmm+OeGU/VDa8
X-Gm-Gg: AZuq6aIfjxZGDRXmiNAZI/3ATGR33577Dko2JpMs/EbH6z2G+a60yFbxRicnBm6gQhK
	R8tGPPiLPnatsuqaORsjkmCIwMf+eoFHCJMmOo8XK1Uf1STeFgMI7ymWzU06rayxbqzl+qIU0hO
	hE4E3b0K2vOR5b2XQAdIPz1Gf0HWdi2mYC7J90seNpm6Ou1GgGPeaOQqjwgq+nVT+gOSxsaJGyv
	qMA80dHw3CLA+7t4OJbXhkxfnmQGZYX8EdJQBFYPeZdWU2QitdPYZh5HP91psKnrzl9tUvH3dPt
	B3ErtTsWHrSALOrtN9D+VCW9tnT1PK4a5dmLo/XALkZ1oZUc7dJbuJvuXF+tpEDf2FTPHgPfAan
	HKWqFWJx9ygguJvcW/TCqOvMnvmqMBXn50OImNEzGjusW0cA0nsNUglFS3t/OmfATzjhoZpAK70
	URTvX+Ae5OeMDSV1ArYw==
X-Received: by 2002:a05:600c:8b12:b0:47d:5e02:14e5 with SMTP id 5b1f17b1804b1-482db44e7f7mr192967875e9.5.1770116547996;
        Tue, 03 Feb 2026 03:02:27 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:9cd9:f748:166d:55fc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e132356dsm54110495f8f.33.2026.02.03.03.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 03:02:26 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v3 3/4] clk: renesas: r8a08g046: Add support for PLL6 clk
Date: Tue,  3 Feb 2026 11:02:14 +0000
Message-ID: <20260203110220.265748-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260203110220.265748-1-biju.das.jz@bp.renesas.com>
References: <20260203110220.265748-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-27810-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,bp.renesas.com:mid,renesas.com:email]
X-Rspamd-Queue-Id: 8E6FBD80CA
X-Rspamd-Action: no action

From: Biju Das <biju.das.jz@bp.renesas.com>

Add support for PLL6 clk by registering with rzg2l-cpg driver.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * No change
v1->v2:
 * No change
---
 drivers/clk/renesas/r9a08g046-cpg.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clk/renesas/r9a08g046-cpg.c b/drivers/clk/renesas/r9a08g046-cpg.c
index d77934872cf4..cc7d3872e9e4 100644
--- a/drivers/clk/renesas/r9a08g046-cpg.c
+++ b/drivers/clk/renesas/r9a08g046-cpg.c
@@ -29,6 +29,9 @@
 #define G3L_DIVPL2B_STS		DDIV_PACK(G3L_CLKDIVSTATUS, 5, 1)
 #define G3L_DIVPL3A_STS		DDIV_PACK(G3L_CLKDIVSTATUS, 8, 1)
 
+/* PLL 1/4/6/7 configuration registers macro. */
+#define G3L_PLL1467_CONF(clk1, clk2, setting)	((clk1) << 22 | (clk2) << 12 | (setting))
+
 enum clk_ids {
 	/* Core Clock Outputs exported to DT */
 	LAST_DT_CORE_CLK = R9A08G046_CLK_P4_DIV2,
@@ -45,6 +48,7 @@ enum clk_ids {
 	CLK_PLL2_DIV2,
 	CLK_PLL3,
 	CLK_PLL3_DIV2,
+	CLK_PLL6,
 
 	/* Module Clocks */
 	MOD_CLK_BASE,
@@ -78,6 +82,8 @@ static const struct cpg_core_clk r9a08g046_core_clks[] __initconst = {
 	/* Internal Core Clocks */
 	DEF_FIXED(".pll2", CLK_PLL2, CLK_EXTAL, 200, 3),
 	DEF_FIXED(".pll3", CLK_PLL3, CLK_EXTAL, 200, 3),
+	DEF_G3L_PLL(".pll6", CLK_PLL6, CLK_EXTAL, G3L_PLL1467_CONF(0x54, 0x58, 0),
+		    500000000UL),
 	DEF_FIXED(".pll2_div2", CLK_PLL2_DIV2, CLK_PLL2, 1, 2),
 	DEF_FIXED(".pll3_div2", CLK_PLL3_DIV2, CLK_PLL3, 1, 2),
 
-- 
2.43.0


