Return-Path: <linux-renesas-soc+bounces-34253-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id E92RGVFyNWpuwgYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34253-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Jun 2026 18:46:09 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C728F6A71E8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Jun 2026 18:46:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=GocizQdB;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34253-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34253-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8256430A61DE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Jun 2026 16:40:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDB723C108C;
	Fri, 19 Jun 2026 16:40:39 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B80803C09E4
	for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Jun 2026 16:40:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781887239; cv=none; b=qJb5HOZmtVqJD6IswfS909px2ntq+skEhjaPGeXs7tz0qKQbrlYO0o1X2jtLp1lzecclpW910PWud9fYi68/drAthS57OnyTkpyEI7yyyvrZ+3YMExJNFqadyzJBkLH0Nv/auBXLzn3+MGY5x7ep4Os1G2FJBp44ojEvmKJsLps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781887239; c=relaxed/simple;
	bh=7g4MMeB7IIOIejiLxfWMTgNt4No63FdlvVIhly42xoI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CSDgUTYCflH2JFOquZ3lnp/BA7oE7Rkbj3jGv1Wq60JIfNFYPLBc+ojB6huCpofdyww0dT+UmLfTdid2avX5WTmgh0dgzjJEye76/KqWrDTkFutLtMFJMlBmAKLh236WTIAN760V/4atFlvY3WthOjxTGMJYCUsHg0zYrNgnWU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GocizQdB; arc=none smtp.client-ip=209.85.221.41
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-45fd464d51fso1392746f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Jun 2026 09:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781887236; x=1782492036; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uy+cIiF49VvblGRBUt+XsP6S2/i3NpoE2QqOrEuws9I=;
        b=GocizQdBry/mYOGVSevGega387DT1kUpQ0TVDse/gpvLKgFlJh+bUYqiMlij0P87dV
         gLVu9CQJkrvo9LouNP/TbQkfhBMMd2bVoNFdgEneZ3LhVbPDBS0mM/QXPjeNlev97ncA
         KF1rizFLmbuWqBbP/Jn34eRJhPA9o1f+5V2aW5CQzXvpn0uxDwoq/Po7NBjtGxrzhXzN
         VrphzyNF+8USg54zgK7FnnzHj6X9uxisgTO0HBvwGkhBW7mJNMZX1uBQjxmBqSp0McnQ
         n3eJMtDcNsAtMbAN0vWjjHNJTGDovC4jC/g4iw4Qx8OWHFH5XsYJts/CG+WVdgWLUigA
         1aoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781887236; x=1782492036;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Uy+cIiF49VvblGRBUt+XsP6S2/i3NpoE2QqOrEuws9I=;
        b=ZQEcZt0HfEMls2kgH4wz2hz83YGKHLbYGDVWPD2bNRx4sQjzUc+PRncnBaAU9fD1hI
         pWE9UL7MX8cVJLFnLeKRK5KwVwjUG3psAmLFFZmartGm9XW02Fej33LNt8laKw+Sqw1T
         vFqIsAcb3HUFRu9AtJBlNdjkClfJjVyNc7sZdQfVc0u/cybkktFo2gyPPCxz/DqDauu0
         M4QVprV3Oa5GX9jCgQ+r1a3VVGw7am3G78uzKlStXiAjGJ0KPo/9tvFOrMhEO8qCePot
         G2GRV5M5Fe3/5ffXz+NiMEtOV1IK8ziZ9FAeb8IMptmMcUEPIaJRHZ8cY+U/5fXxkx2w
         YZDA==
X-Forwarded-Encrypted: i=1; AFNElJ8zMw0fDRqQXw51NHp68IvvXPLryH4GhBQMCZ+BMq6rJdH2WZIuR+YmUTzH6V9hsoxRYGHX3qQg2sIgzx5sCaAs1w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxWgYOmYXek3D0kS3IwtHtevaZ7+miMcbYE7YxbjdhWgBUyGImV
	A1unxW8HXkR7Bk7UNsp1sBNdlXr9Ksoobo+OTgKL227C2fhL52WYSZ0N
X-Gm-Gg: AfdE7ck3yYNiWxdqv6s4Uwjzy8GP2ec8l4RaoABiALvbFLwm2S9klXPYWLpe/G2Ww3w
	Q0dZidBbbiLEaFabV55zOoXtOdoUzXAjxPKZytSjCjZkXl+xpgtxD6kSARjUx8mOiQgyle7qKr2
	YaPmBBmX8OdahTen3AwZEu23Lfp7DmMuKDCBSPDaAL0VOcnytaS+HFy01o+NeTywc1qpP2LlpDc
	gyyU8PdXmDPSsAOlf7tgi1nnIZPr9wsUO0U+8zYxpOGV/x4IZQz3dWR5svakWj+WEW5zIktRtOH
	oQWBOoLSNsNmZW9u17X/HEvGh+nZc/OmO0IpbORYtmSajYgQ1V48ZMqgeB9TmKF6JwFMtQBU3LX
	yPqGrc2P6DW2wYAGdXS7+lpSgIyxhNtykzwCHFQpzpb4LNMhXVQN3JLxzvv3ngbCR2fGWbDNVi+
	P3endmwClyCNPa6I2E7R8gkG2AmcUHR4HbFRgoOQ==
X-Received: by 2002:a05:6000:1844:b0:460:25f3:b25a with SMTP id ffacd0b85a97d-46503176022mr8323367f8f.34.1781887236111;
        Fri, 19 Jun 2026 09:40:36 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:b387:a6c7:e8fd:bca5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46667221de7sm261621f8f.33.2026.06.19.09.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 09:40:35 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Brian Masney <bmasney@redhat.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 3/6] clk: renesas: rzg2l: Add support for divider flags
Date: Fri, 19 Jun 2026 17:40:23 +0100
Message-ID: <20260619164030.380098-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260619164030.380098-1-biju.das.jz@bp.renesas.com>
References: <20260619164030.380098-1-biju.das.jz@bp.renesas.com>
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
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[bp.renesas.com,redhat.com,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-34253-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:geert+renesas@glider.be,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:biju.das.jz@bp.renesas.com,m:bmasney@redhat.com,m:linux-renesas-soc@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:biju.das.au@gmail.com,m:geert@glider.be,m:bijudasau@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C728F6A71E8

From: Biju Das <biju.das.jz@bp.renesas.com>

Add support for passing divider flags apart from clock flags from soc
specific clock drivers.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/clk/renesas/rzg2l-cpg.c |  8 ++++----
 drivers/clk/renesas/rzg2l-cpg.h | 12 ++++++++++--
 2 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index 83c9f393c832..f3a9d2675748 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -484,20 +484,20 @@ rzg2l_cpg_div_clk_register(const struct cpg_core_clk *core,
 
 	if (core->dtable)
 		clk_hw = clk_hw_register_divider_table(dev, core->name,
-						       parent_name, 0,
+						       parent_name, core->flag,
 						       base + GET_REG_OFFSET(core->conf),
 						       GET_SHIFT(core->conf),
 						       GET_WIDTH(core->conf),
-						       core->flag,
+						       core->div_flags,
 						       core->dtable,
 						       &priv->rmw_lock);
 	else
 		clk_hw = clk_hw_register_divider(dev, core->name,
-						 parent_name, 0,
+						 parent_name, core->flag,
 						 base + GET_REG_OFFSET(core->conf),
 						 GET_SHIFT(core->conf),
 						 GET_WIDTH(core->conf),
-						 core->flag, &priv->rmw_lock);
+						 core->div_flags, &priv->rmw_lock);
 
 	if (IS_ERR(clk_hw))
 		return ERR_CAST(clk_hw);
diff --git a/drivers/clk/renesas/rzg2l-cpg.h b/drivers/clk/renesas/rzg2l-cpg.h
index 41e8f389c566..6fea87d84dd6 100644
--- a/drivers/clk/renesas/rzg2l-cpg.h
+++ b/drivers/clk/renesas/rzg2l-cpg.h
@@ -112,6 +112,7 @@ struct cpg_core_clk {
 	notifier_fn_t notifier;
 	u32 flag;
 	u32 mux_flags;
+	u32 div_flags;
 	int num_parents;
 };
 
@@ -168,11 +169,18 @@ enum clk_types {
 #define DEF_DIV(_name, _id, _parent, _conf, _dtable) \
 	DEF_TYPE(_name, _id, CLK_TYPE_DIV, .conf = _conf, \
 		 .parent = _parent, .dtable = _dtable, \
-		 .flag = CLK_DIVIDER_HIWORD_MASK)
+		 .flag = 0, \
+		 .div_flags = CLK_DIVIDER_HIWORD_MASK)
 #define DEF_DIV_RO(_name, _id, _parent, _conf, _dtable) \
 	DEF_TYPE(_name, _id, CLK_TYPE_DIV, .conf = _conf, \
 		 .parent = _parent, .dtable = _dtable, \
-		 .flag = CLK_DIVIDER_READ_ONLY)
+		 .flag = 0, \
+		 .div_flags = CLK_DIVIDER_READ_ONLY)
+#define DEF_DIV_FLAGS(_name, _id, _parent, _conf, _dtable, _flags, _div_flags) \
+	DEF_TYPE(_name, _id, CLK_TYPE_DIV, .conf = _conf, \
+		 .parent = _parent, .dtable = _dtable, \
+		 .flag = _flags, \
+		 .div_flags = CLK_DIVIDER_HIWORD_MASK | _div_flags)
 #define DEF_G3S_DIV(_name, _id, _parent, _conf, _sconf, _dtable, _invalid_rate, \
 		    _max_rate, _clk_flags, _notif) \
 	DEF_TYPE(_name, _id, CLK_TYPE_G3S_DIV, .conf = _conf, .sconf = _sconf, \
-- 
2.43.0


