Return-Path: <linux-renesas-soc+bounces-29064-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aBpYKt/9rmkxLQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29064-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 09 Mar 2026 18:05:35 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A18023D538
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 09 Mar 2026 18:05:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9FD36304CA50
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Mar 2026 17:00:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 059A73E8C65;
	Mon,  9 Mar 2026 17:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cr3PJGtv"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE6A3B5856
	for <linux-renesas-soc@vger.kernel.org>; Mon,  9 Mar 2026 17:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773075602; cv=none; b=D2H2lYn+d1TC7zH40y7Y5THCyQjDEboWOJxNatPBEDAI/qfGHB8xqgOdAeOSavsW9nz8wPyO9XwFCUWlvr5F7wN9ONl6YGjHxj8XoA6H+b3nK2YU6DcNsMpLKqcjFZVv9FZ4NRbQCd56gDOWZCi2EbvR7hGusim32PwTsxvUsA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773075602; c=relaxed/simple;
	bh=ZFvxbtMdql8DzdRDX+W6CTfQU/4iGXLKF1vYdes47+o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nzIFol88IsELclcOO3X2s2LCcgDC/LRQuQFP00ULxnGk1ytctYQvNDZAqNUW4Q/SwWRSbAGMBZL9J5NVgEfKJGfk4ViRxOgxATpzBqXd0CHyJ8nEakHWHyz8vTx+nyhD8aH1xD54T0VAlAp7cJ6nlPwsPlpPXIUVuGX8YbP7CAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cr3PJGtv; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-439b6d9c981so5719972f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 09 Mar 2026 10:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773075600; x=1773680400; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ZuA218B+fb9rrPGM9eEcuQjFkw0wYq/ygst0UVHe5Q=;
        b=Cr3PJGtvxKGfk1cBRZbIsoQ0jf+Z6/zW2C7AzqCaBXTm0r8e+o2Ypck1tXG81mis7j
         lye7aS0paNNpksR9KWr8MRx0g9M60xmbuEY2YlHaxRm/MkS7XosOJvPMWIqK+WTEzuS9
         nR/QRkOeYh65k0wix/sS4QBT/rdWrk/pIQCjra6aSCdDK4AHTAN+eMNtJcOpKcl8Azd9
         gjNzKiGPriTI+A+EOGikrR0wY7xNawhn/WuGubAxO+raujWZ5E8gvnech3SSIAeMbr8g
         0hApWuoo2thcBfhK4pofRR8AJyrEzQcpCJX0oT5T6nULy1BGwgbPFjINfBUcOT6IuKDr
         EguQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773075600; x=1773680400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/ZuA218B+fb9rrPGM9eEcuQjFkw0wYq/ygst0UVHe5Q=;
        b=uZX/kt2g/hDr3bf1/R+F3NotGNrqJHTSvWwimnSjFG0qXLaYGf1bBLeeVmH7I20KsO
         uWLWW2H+ttF/9bKJHm56uqVxd4z3NTOUv5pUybo85fu5hCKc+oZyOlGvkjtFJysU1CEE
         s5HUWJHcLPNsVoQHb40eDzetuzyz85GPBBC2762BJLgdidV+kI+MRz8BTdYx6nlwNhaF
         s9BYE3l1rbbZSmO1htkVfHML3+SFvo5HPBi3zuV+N6/SviwJC8BeoOEPbptsaV6cWUhA
         FXPfjqI0qSVAr2BsuqG1wv+hecy/C5HeGTzn1XUZxPnsQRJNTGbBhxssmlRdVvP9fS83
         DCTw==
X-Forwarded-Encrypted: i=1; AJvYcCUMQbfSzX49RHPQG6+yqZWPNBOkYGIAGuTNO6COWAMT5INA/6GmCQJreGa43rxYwLm+BxAenkdPizscIXkJehpmNg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7rPebEcDpZIF9eXOw502NjW2Kljy+CPC1x2IKVVqQ8FqWBBjD
	VY7qql8m8pbDr/6ThqQtaXaOvskzHb1D+R1LAH4aF3an5GWdc6fVcHHu
X-Gm-Gg: ATEYQzxkdEmC+QlclCPfVnT9WmPjs6L4OGRwYxjZywF93tOyOPeuW7lIG62dnWKP0YV
	xkcDA8feSZH82sZbq4U4PUs+86c1J2kt4QL2fvIUWcrdrMtEvCAm++H8ayJG0TCXcy1aNB/Bb82
	Zb54xNV7hmvdd/kfeFcmofJrpQr05VmHXPPEGyfc2F2nOW2ZnQ900UzwhH5M4b23tRElAgPgU53
	Pbi7yotJClc0UGcyicMYLWgVOOlUBMVe3Y7uVr1TfhXrCZamkZFQhD2sSkFWAmY9YoaMuvGE/Xi
	dfJUqLLEJ37qbgc4jnrrSVnr5aL2TlMJ7dSsL8MSoIVQdwIXeSknQr89I3xxgPceobT99gAnru3
	wNHrTj1/H1Juu3oIj4lyXhBAIZG9pKCzHRBo8RRHnErZUSYr83mbcpOCNi1tdB0U7xZwDQdjZ4z
	vuKHf3cPnSfGMURYbFdiezazsdzvQ8s01ifmOV2jAWObGIQ0oKndhxtAfLtf1hIns5X3qjGPYHS
	DrWwL1uOIqDQqu+rgQyZiceO6gDKO8zpfEfPLI4w2SsgQ8=
X-Received: by 2002:a5d:5f93:0:b0:439:a95b:3c47 with SMTP id ffacd0b85a97d-439eff1be54mr649654f8f.10.1773075599778;
        Mon, 09 Mar 2026 09:59:59 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:a11b:83ee:a423:4205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad97abasm25596307f8f.10.2026.03.09.09.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 09:59:59 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 3/3] soc: renesas: r9a09g056-sys: Mark rzv2n_sys_init_data as __initconst
Date: Mon,  9 Mar 2026 16:59:46 +0000
Message-ID: <20260309165946.3003731-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260309165946.3003731-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260309165946.3003731-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 0A18023D538
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-29064-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	FREEMAIL_TO(0.00)[glider.be,gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-0.979];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,renesas.com:email,bp.renesas.com:mid]
X-Rspamd-Action: no action

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Annotate rzv2n_sys_init_data with __initconst as it is only used during
initialization.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/soc/renesas/r9a09g056-sys.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/renesas/r9a09g056-sys.c b/drivers/soc/renesas/r9a09g056-sys.c
index 42f5eff291fd..2a8ebc209961 100644
--- a/drivers/soc/renesas/r9a09g056-sys.c
+++ b/drivers/soc/renesas/r9a09g056-sys.c
@@ -136,7 +136,7 @@ static bool rzv2n_regmap_writeable_reg(struct device *dev, unsigned int reg)
 	}
 }
 
-const struct rz_sysc_init_data rzv2n_sys_init_data = {
+const struct rz_sysc_init_data rzv2n_sys_init_data __initconst = {
 	.soc_id_init_data = &rzv2n_sys_soc_id_init_data,
 	.readable_reg = rzv2n_regmap_readable_reg,
 	.writeable_reg = rzv2n_regmap_writeable_reg,
-- 
2.53.0


