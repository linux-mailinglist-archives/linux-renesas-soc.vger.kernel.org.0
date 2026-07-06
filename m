Return-Path: <linux-renesas-soc+bounces-34780-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OSgBE+zrS2rRcwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34780-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 06 Jul 2026 19:54:52 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id F2151714279
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 06 Jul 2026 19:54:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=ViBF7r1V;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34780-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34780-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A8A6E305B0A6
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Jul 2026 17:53:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4F0943B6EB;
	Mon,  6 Jul 2026 17:52:02 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A22438475
	for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Jul 2026 17:52:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783360322; cv=none; b=XNoXQNh+YYbLbsawRoVT4nKvn0ApIf7XxhzcPqE3AbSQd+nXGUBxtLkk/jAST0DqBQikVmroJQ+RBjPNCz1VYOUlT4P1GON4khNMmNOhrx7Qs5O3IjbNSKNMNqR6oBTlejYSe+fSusXBFE+VVCqQGOY+dtRb7/bg90jw15QTI+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783360322; c=relaxed/simple;
	bh=xfryxhlFXv/pRGHJApGFT7aCI/6RDj6FSvgBXPrMglE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g6f/VuC8S9L4xCCae04Bo1OLQY/z3pYfEJ752udnzDwZJp0prtVuPHkG1QxLGNujLWpcfwl3HTTgtQLLQQl7mzQt+RmeLTm3l5aYqb60A/rL4NKR/nVcV38U+pQCP8bVG0Vw3gI7T4QwRC5t18kJLw7fUInuc9JvH6bmxBoEiyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ViBF7r1V; arc=none smtp.client-ip=209.85.221.52
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4799b3f7c83so2142977f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Jul 2026 10:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783360319; x=1783965119; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eRTqLkz1DU8NgdnLx5nD3F/oKn3hiU7y0a27XqluRQ0=;
        b=ViBF7r1VlZquGSr2H22iKYAf5mk4q1yiS+3/QjHDsf4asxbenhz1VBtIUKA/V4eou0
         dHeE9Aow/tz7JJrmXDVplmT+zxPgxyI6k978swN5pzK6sDoWBFTPQjpWqn3L1E3YD1Cg
         YxpGo524pnWpMJHJrkizeQCgI1eBPRgWO1knuoIU7z8SvPPCy1JDvjhr42GMJflWIwk5
         6gj5iB6yIZ4JqXGtD8A/hSqKPVUiuJfJnqTiOSUHHTNKdAsFvYV9c+cUGH2K/H8+Oey+
         YSIq4ejlOpo96zSxOc8YXRPrjbXemjwNxKgtvSmHRzNP5Z3DW4h1algMCSOZ3UtzduJe
         F9KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783360319; x=1783965119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eRTqLkz1DU8NgdnLx5nD3F/oKn3hiU7y0a27XqluRQ0=;
        b=P6tOan2ROO/TjTfbxyTek5NUnQrzYTjuT9GDyv6f7DSoINraxHly3wL3KgpBYnpayo
         nF5xJaqGIwhk8rji1zQndRTvIjrD8f3HhRq0R9nwHzrkTnjEJDVeTpm+9Bz3A+YjJt1A
         9mVBF6Wdxt7xvEOi3+egAM/CzicVoluQUYYda5cVHmsmWC3VVa8TsOnjuFF5e3Dq8/aW
         L3xewMcenqFWEIIaw4nBsg3ACSHT4aqGQdmRr0iWHJL6oZeGmp9YzpIJIOMi0jiCjepn
         Kud2VwB45HJpNyutrTgbiApEUvYBdCrf1A1WbdiEHacsuVMz1dlnFMTvzX6WAyw2Bsx1
         HGzA==
X-Forwarded-Encrypted: i=1; AHgh+RqFwsiA3/2AWZgLZr1/9A1IlF+oG1uO3Li4Lhs5pXGfyAJqR6P+R4CImact5ybqgC71ENOSvw5Sd0lwp1hjnpE6Eg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0R8BQBRKnTYMK5SeMh1kHTxK44I2DUTFaX3D5zPcoy8H/HEaq
	WDaBLqU3r3vuwIAHn0uUlyWg4doiZnVZYUxZlUjFdnOht/nE1w3OGiKz
X-Gm-Gg: AfdE7ckuo9AUGC21VAf6ZNFaYf29XCTq155apiq8T1tbavvNN2GHNoCOzK9MLBs9srb
	/S3kf6rtDBxr4Y9i1XjUX6v8mFJWTA8G5qgEPIc5m3Is5nP6XV3raZOS9Rfhp5Wr1U9kuP7bH6I
	Q8zXtkVAnjjeezWWiOxczhRTEkmK2m6VL2Yo6hK51lPvNfvXUWuGDrPzOrW/94rz7wCzKFwKBsx
	et8SEj7lanLtadQvpJ6HMnxj7c5akht7zlOuCjZir7s85ipIRjSeyHk/HpyQQwpSceToye6mp+/
	bRavszFdexJ4nuOMJ6xZam+lYPhAjeJ3OLzl7PfpxEtPVZ6R+eauOdiW+1gWpEEx8df8X99E5A1
	TKNz1QW1GxCcgrt46f3As8qQsk5O3TKIBk0J5tgaU9aWbD0sOM5JlDi97DGS7MkzQWW9+hXJFmf
	ETkTn7n2vx1hcxxDuD7PBcKf58fkF3ewxhjnO+fGbfUXPUsdhxoe0FSps+boRQD2+e1cIb11yaO
	n4oaByZEdP7G3MqR+p1u0SquZk=
X-Received: by 2002:a05:600c:3143:b0:493:d800:204f with SMTP id 5b1f17b1804b1-493df0a7521mr19475945e9.21.1783360318961;
        Mon, 06 Jul 2026 10:51:58 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:8e02:886d:c345:c5e2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0078d49sm1263145e9.0.2026.07.06.10.51.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 10:51:58 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-rtc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 12/12] rtc: rzn1: Add support for Renesas RZ/T2H and RZ/N2H SoCs
Date: Mon,  6 Jul 2026 18:51:38 +0100
Message-ID: <20260706175138.12587-13-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260706175138.12587-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260706175138.12587-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34780-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:miquel.raynal@bootlin.com,m:alexandre.belloni@bootlin.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:wsa+renesas@sang-engineering.com,m:linux-rtc@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prabhakar.csengg+renesas@gmail.com,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,m:wsa@sang-engineering.com,m:prabhakarcsengg@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[bootlin.com,kernel.org,glider.be,gmail.com,sang-engineering.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,sang-engineering.com:email,bp.renesas.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F2151714279

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add support for the RTC block found on the Renesas RZ/T2H (R9A09G077)
and RZ/N2H (R9A09G087) SoCs by matching the new
"renesas,r9a09g077-rtc" compatible string.

These SoCs integrate a closely related variant of the RZ/N1 RTC IP.
Unlike the RZ/N1 implementation, the RZ/T2H and RZ/N2H variants lack
the RTCA0SUBU register. However, this register is not accessed when
operating in SCMP mode using the existing rzn1_rtc_ops_scmp
configuration, allowing the current driver infrastructure to be reused
without modification.

The RZ/T2H RTC variant also supports a 1 Hz output signal on the
RTCAT1HZ pin, controlled by the RTCA0CTL1[RTCA01HZE] bit. This bit is
marked as reserved in the RZ/N1 hardware manual, making RZ/T2H a
distinct RTC variant despite its overall compatibility with the RZ/N1
implementation.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
v2->v3:
- No changes.

v1->v2:
- Updated commit message to drop reference about RTCA0TCR register.
- Added Reviewed-by tag.
---
 drivers/rtc/rtc-rzn1.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
index 2c3c82f8c693..2a6ac98a206c 100644
--- a/drivers/rtc/rtc-rzn1.c
+++ b/drivers/rtc/rtc-rzn1.c
@@ -507,6 +507,7 @@ static int rzn1_rtc_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id rzn1_rtc_of_match[] = {
+	{ .compatible	= "renesas,r9a09g077-rtc" },
 	{ .compatible	= "renesas,rzn1-rtc" },
 	{},
 };
-- 
2.54.0


