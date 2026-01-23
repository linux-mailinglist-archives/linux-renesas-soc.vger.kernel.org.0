Return-Path: <linux-renesas-soc+bounces-27369-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id t1Z2AaX9c2nu0wAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27369-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 24 Jan 2026 00:00:53 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 525E77B558
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 24 Jan 2026 00:00:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5116C300DF63
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jan 2026 23:00:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A47952ECEA3;
	Fri, 23 Jan 2026 23:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gSXbMbgG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D27252BE03B
	for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Jan 2026 23:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769209228; cv=none; b=B4QDNqsE4z/yFBNC/vWZaRUc1GrRwszMcY2oubJlDlKPupAjnx+GV91iGX4H7lA4C7kopkCYguSx+AbQAi1vJ46bowfj8Uy1Jr186st/JEgPrC48EjpHSx8egWTsVVMQod1MoH2gwQ6jHr2NMDPnTsukTMd/WA/yzB7pcqUP46k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769209228; c=relaxed/simple;
	bh=H1HtXLkOMfwZTiFA82ib7pTLWwYdqKOWBX6p2M2zDn4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rJjdqidtiTmq/ILM/b4KmA+D5vRGzxsd51EHugRc+CDxrMv6xtpc+E4S74pBkaURXOyz5HgvseiJ6YMLOjYpYbP1CushP9Zqb2lfcEbwYI/edNII5PBSmxYvgNbV/YAw4wWmRW/3Cp5B1HjcE4uJTJR/xbwU2xWy2BGqObaMsz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gSXbMbgG; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47ee974e230so24273675e9.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Jan 2026 15:00:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769209225; x=1769814025; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Ok1prVZnYzbpoz3IY6/vUwCdfPHeHtCght17kbLDLg=;
        b=gSXbMbgGnmAem2InFBIwYabUeM42aDDwTCLxs6fAsrkxbvEHkfKrJblqRP3RsJAlhO
         MYy0+PczFQe39jPGD+lqarV0QJEgFhFaBMz5MwT+lNhRRibnG7kIYWm/8dMaNXA36yV/
         SqAor6VqCe8WYUpKsIV+tnh50u2GEatcJE6WQJ+5y+gux3g+d5SVw5PCsYRLXkhmYmKi
         3LtHpFmHCpHhwPmrntqkpRsxZEjtFhKEFRXM7oyKJGgsfAlEyjR1Sc/hJn9dVSQ4vohj
         s6CpdaywTMMEnjHR1yjKBNbtTsehBkBnYb68sr3M22do83rQEB101sz8uyZ3UjaHwvfL
         ZQDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769209225; x=1769814025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/Ok1prVZnYzbpoz3IY6/vUwCdfPHeHtCght17kbLDLg=;
        b=kKv1Rvze2gTjD62WZ2kCvm2oapaOBfOK7uOJr4UqLejVCP+RZ2pqJeFndxQ1VLySXz
         h5INSIyFyHYYWXVHooseM2v4XQYL6Pgmy1ksTF6HxrRK5D5TnrWXzZNy+sNdpXevrYr3
         Wr59s98WhZYthzW8DBaiblar/Z/0QJM5HEjOnU7MGYZm7CLOARjXZ/n3wGSKy8e82mYh
         6pEvkIpiSiSn4qtP4n5MLXy3Yrtts44dncBvS3OcZR7oiXZaxG2fyg3ZUOlFPeTAhT34
         jqMc41bHm/AFAQikcKH0aoP8Jo0lRCTWyvLIUYOK6PcMj09qlFR3YaMzMChTbFvcymYV
         MEIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvLxxYz1a2k/YhlHsI9umf+y/Bv2k10nS9671OasvK3SigTzjpNIAga/wZYtyQpnTp15ZapbvgNsa7UKX41uE0+g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzqnKFGHSC0BdJ8IYbKZVA/47J37zmE5mcLFqP2uUlOR3uip2eF
	geaKLfJLuiwI4iCyqQK0lAjCqfi5TA8aKuc7TxDRBp8rw3eJjEpr26he
X-Gm-Gg: AZuq6aKPq9q/XqMihfRm/bBqtJiQPdDbQuxhoWfVkbwYIUqm8hhuscDRkJYmyPashtE
	o1QbWQS+jQd/olupZtEfzqkQ99nhqYs8KkWelCRNXhHiUnUenKWaEhGVMsd92gNV1XVRqV41LiS
	lzMpKuOZmGf/KE7bJs/AtTWkMOvETteMsq60FrFMrSUcX4iP0Y98GeOEL8KrjhYI2/hJCX5/J4w
	V+VvJrezVTiFLpTzY3qwx+GtKUwgnR9xO8vkVIPnBh7e7/QCnbAlzY53D7aBAsU2elvbHlf/Tlm
	np4FY0l4Tp+uYGgvuLAtd85lvv0cJNdm9Am8FDjndeCK+ox5gTJKJdRww+M9GUfylLEheqNbURz
	/JYhC/BhkfJ3ixK/XYs+Br0gJMvDH+pzUBZ4+LJ6M+4hVaYneOm5dYVVpEWkCjM5YYNusEjW23a
	4eRN+XeDFlncQFxgbg2/4wXFsCrJALAsacQBS1vuiy4OnQ1IJ1dgchyVidjsD2nGZLWflNquzbo
	L1gliPbci9gpXYsn0gdR7KL
X-Received: by 2002:a05:600c:6814:b0:47a:7fd0:9eea with SMTP id 5b1f17b1804b1-4804c943d37mr75807255e9.3.1769209225030;
        Fri, 23 Jan 2026 15:00:25 -0800 (PST)
Received: from iku.Home ([2a06:5906:61b:2d00:bccf:b3b1:e288:4e83])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-480470cc278sm157142665e9.12.2026.01.23.15.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 15:00:24 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 2/4] arm64: dts: renesas: r9a09g077m44-rzt2h-evk: Clarify SD0 power jumpers
Date: Fri, 23 Jan 2026 22:59:55 +0000
Message-ID: <20260123225957.1007089-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260123225957.1007089-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260123225957.1007089-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27369-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 525E77B558
X-Rspamd-Action: no action

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Clarify the board setup requirements for using SDHI0 on the RZ/T2H EVK by
documenting the CN78 jumper positions needed to supply SD0 power for
either the default eMMC configuration or the SD card slot configuration.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
index e9639bbb2d70..49464e6d212b 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
@@ -14,12 +14,15 @@
 /*
  * SD0 can be connected to either eMMC (IC49) or SD card slot CN31
  * Lets by default enable the eMMC, note we need the below SW settings
- * for eMMC.
+ * for eMMC. Also ensure that CN78 pins 5 and 6 are connected with a jumper
+ * to provide the SD0 power supply when using eMMC.
  * SW2[1] = ON; SW2[2] = ON
  *
  * To enable SD card and disable eMMC on SDHI0 disable the below macro
- * and set the below switch setting:
- * SW2[1] = OFF; SW2[2] = ON
+ * and set the switch as follows. Also ensure that CN78 pins 3 and 4 are connected
+ * with a jumper to provide the SD0 power supply when using an SD card.
+ *
+ * SW2[1] = OFF; SW2[2] = ON.
  */
 #define SD0_EMMC	1
 #define SD0_SD		(!SD0_EMMC)
-- 
2.52.0


