Return-Path: <linux-renesas-soc+bounces-28503-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oELgN7iSoGllkwQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28503-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Feb 2026 19:36:40 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A611ADC35
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Feb 2026 19:36:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 79EB230C681E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Feb 2026 18:19:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6FE84279E9;
	Thu, 26 Feb 2026 18:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BGfZ6Zev";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="S2Jhhr9I"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D1E426EC7
	for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Feb 2026 18:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772129893; cv=none; b=Tt5pS0IbbCi985zKg2e6jDkbtCBce6D12aRuYoUMLWn1e+ep45Lrmzd7eRiCZYpitVjZf0JKoY63I4Uq+WrnmkuX3xnf1GuxGgUm2Jl2mufT12MBa1l5wvR/Io1Kj5EYFZeOf5Qn3DxWx3JTVPUX9KgdBdpSZIUdB8/MYlZhEo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772129893; c=relaxed/simple;
	bh=vTSkb/uxps/JUNv0OVFO98AZpgX3dLaqxpAdaAyq/f0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sP/jUJcWiJ1tlKPxxoU1wGOGXbUjhS01qie3V0Dq3pbdiAgc2J/YRilgt2TFo09eC0c9w+Brub6JW1cGUiPkbrx0C8yJa0+/gm/ycAbsDgFtd/d21JIGNEKyB4Wlmy1gmVByLzwKkyuIlQ4l2YqcfFV/RlXkIAoKfa48kgl/3ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BGfZ6Zev; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=S2Jhhr9I; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772129888;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Rdwnz0qMT3dj+ycYsyT7/Q6vsDkg7lMjGirPWYhw7Ds=;
	b=BGfZ6ZevV2EknuzDxEOuki9VxckCiUbl0XTZ+9RyTNYJZGzVizibcq7nAXJYqv+JpnEDZZ
	rv95sF/YH6wJjZlL7N6ElqHpI8HLmqfwuxaUHlQKz/OoM7a3qUWAPF8juCx6rnfYqC67DY
	Kwj+6NfRWO1wAQ7PW/DgG+1+ZoUTqrs=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-75-1TY6JuIlN8WOepYcRncKsw-1; Thu, 26 Feb 2026 13:18:07 -0500
X-MC-Unique: 1TY6JuIlN8WOepYcRncKsw-1
X-Mimecast-MFC-AGG-ID: 1TY6JuIlN8WOepYcRncKsw_1772129887
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb706313beso142377685a.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Feb 2026 10:18:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1772129886; x=1772734686; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rdwnz0qMT3dj+ycYsyT7/Q6vsDkg7lMjGirPWYhw7Ds=;
        b=S2Jhhr9IMhGDmd6c2vu8vRo/qeHnnIzCglyHgqb/afPz64th+C1/qurBY/BURgevBk
         TI1K2fgXfe+XdNHWKbsbWwdp5RUAwC/Yqmro3QLWNz7/CrKb7mk/FuAZYHNq7bBLL160
         QKdn5ro3r4NlRySYnpvX9UTNyKQSU4vYZ5F9y349w33v2eznSdvcHiZnN56HjuEoVLZB
         5i3/YRbPu24aaYkXYEKBx9li2oALcN4FkmJ7tJCluZRQebmP5fytEVC+bvCQnrsVZMkA
         P0vxCl+Ql/oZqgifxh/88gwr4vrb3G9ryigDUJRR9PLa8UlPrMJO54X7iLdMVem+jtUK
         5Tkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772129886; x=1772734686;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Rdwnz0qMT3dj+ycYsyT7/Q6vsDkg7lMjGirPWYhw7Ds=;
        b=R9GdFJKdMge4NYp36uvk3Qq3sUc12PgU4tMMBOada74wD9HI2+hffh0dD3r4OBcbmb
         1z6wlEMB0VZf2vJnxXCTN/Y6+n+/u2ZQWp+843mgMm6o2n15RoQVq73jJQHqMiSIX3/m
         edvF4kXQAlisWTea8ueMcb/ins04mlttVJtlyMnO4lf9yP/3fAc6RRa9aciAHX850myO
         IVmimMJEI8xZDrDBgvCPqR6R6weD/HBqDiexZjmq+4tn1a9CWSgBEsToppufT50/Z7UR
         qlFwhzFS+jrK7iTfHJOaqIa+PiYoZ1mXNk5JnQPEfTsEx3ohjoZlB/OZA96m84w7yNLI
         PDRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDt70441SR2einANw5PerphRcyAo89c2oD4ZdVNWWKgL6HLCrtGmkXvOVkWBbaiMh5bzCNFTPPTxBSriqDFzwkfg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxDXi7QbsJA6EFkBuO3r6mJerqTuvXO8HpWP04NUfJ5DtsoTtZx
	IubOYw0Htv1JZsURSpXQYkfmcf/AI+VCs/cL3OZAs0U8CZYXnwSaIHIZhXG4PeXiuvXN116aD7S
	Bvi6uGxJo9LaXfM/lsrinnNrTZjGiHyMwU8eJDFSLz0+ayG/BLT8ZeTnSeoc5uZaeDv9LRNvw
X-Gm-Gg: ATEYQzz8kNC2HhHgNNewpye5+JNLLvc0ObzlNIq9oN7PAogWAgKnnW1QXGbTjbfBk7u
	vzMq4CqU6y/RjJqRNYCMFyt4cn6NfceDhoZEZqWQAvBEuUHwg3BRru7Su+1Jskwf0JA8jMaJr67
	h4sDW3XC6VPxw+WG3TQfb9vZ2PqrHMgC7KbIasy23y77krKiFOfC6xz4WfKFUAi6TzR1k0apOB3
	7DuSSvc48KFW1PI8F01YuUMUlZXCHuRYvx8fe8o1mFCCwR639VggFtXtTkr+FzAz34iRexeLWO3
	QGgrNKgVaT9BNBeob6/MKRZ9Qd4l7lg0JGXa3yjwj/F2IXChIdElUdx3LAmMiElmvP8/7hYM5VK
	G6W4c4WoYDBHT0Sfs9FRc2x/8yrlX4c4P5MMDB1gAJs19XSHHhKzvyWG4dK9Q
X-Received: by 2002:a05:620a:40c3:b0:8c6:a51e:eee3 with SMTP id af79cd13be357-8cbc112301fmr370820485a.14.1772129886562;
        Thu, 26 Feb 2026 10:18:06 -0800 (PST)
X-Received: by 2002:a05:620a:40c3:b0:8c6:a51e:eee3 with SMTP id af79cd13be357-8cbc112301fmr370814985a.14.1772129886094;
        Thu, 26 Feb 2026 10:18:06 -0800 (PST)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cbbf717f2bsm247046685a.35.2026.02.26.10.18.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 10:18:03 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 26 Feb 2026 13:16:55 -0500
Subject: [PATCH 11/13] clk: renesas: rzg2l-cpg: drop determine_rate op and
 use CLK_ROUNDING_FW_MANAGED flag
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-clk-det-rate-fw-managed-v1-11-4421dd2f6dc6@redhat.com>
References: <20260226-clk-det-rate-fw-managed-v1-0-4421dd2f6dc6@redhat.com>
In-Reply-To: <20260226-clk-det-rate-fw-managed-v1-0-4421dd2f6dc6@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 linux-renesas-soc@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1771; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=vTSkb/uxps/JUNv0OVFO98AZpgX3dLaqxpAdaAyq/f0=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIX9Jl4NDxjV5kzdYrZvfarIVsfPN74K/7MRFOn41FSF
 V5lnuFKHaUsDGJcDLJiiixLco0KIlJX2d67o8kCM4eVCWQIAxenAEyE9zgjwwGdP9LdSyLXrpBJ
 /+C2/Elc/ebaT9dPOSRcrd5e3nQy9yTD/5gdCWU26VMZ+TYYeSSdZn71+oh83vmNkbJBSctvrFC
 7zQUA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28503-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bmasney@redhat.com,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: F3A611ADC35
X-Rspamd-Action: no action

This clk driver has a noop determine_rate clk op. Drop this empty
function, and enable the CLK_ROUNDING_FW_MANAGED flag.

Signed-off-by: Brian Masney <bmasney@redhat.com>

---
To: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/clk/renesas/rzg2l-cpg.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index c0584bab58a3ba8a637e77662191f89a57bf1390..126398267e60d1f0fa7ababcb22a5c540884e810 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -938,12 +938,6 @@ static unsigned long rzg2l_cpg_sipll5_recalc_rate(struct clk_hw *hw,
 	return pll5_rate;
 }
 
-static int rzg2l_cpg_sipll5_determine_rate(struct clk_hw *hw,
-					   struct clk_rate_request *req)
-{
-	return 0;
-}
-
 static int rzg2l_cpg_sipll5_set_rate(struct clk_hw *hw,
 				     unsigned long rate,
 				     unsigned long parent_rate)
@@ -1015,7 +1009,6 @@ static int rzg2l_cpg_sipll5_set_rate(struct clk_hw *hw,
 
 static const struct clk_ops rzg2l_cpg_sipll5_ops = {
 	.recalc_rate = rzg2l_cpg_sipll5_recalc_rate,
-	.determine_rate = rzg2l_cpg_sipll5_determine_rate,
 	.set_rate = rzg2l_cpg_sipll5_set_rate,
 };
 
@@ -1041,7 +1034,7 @@ rzg2l_cpg_sipll5_register(const struct cpg_core_clk *core,
 	init.name = core->name;
 	parent_name = __clk_get_name(parent);
 	init.ops = &rzg2l_cpg_sipll5_ops;
-	init.flags = 0;
+	init.flags = CLK_ROUNDING_FW_MANAGED;
 	init.parent_names = &parent_name;
 	init.num_parents = 1;
 

-- 
2.53.0


