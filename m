Return-Path: <linux-renesas-soc+bounces-32855-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +F9lBl9+DWosyAUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32855-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 May 2026 11:26:55 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD7358AC0B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 May 2026 11:26:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 723ED300E173
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 May 2026 09:25:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7CBE34DCC8;
	Wed, 20 May 2026 09:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BsuZJ0Sh"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 011113BFAD4
	for <linux-renesas-soc@vger.kernel.org>; Wed, 20 May 2026 09:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779269130; cv=none; b=XBeJO8O/4bH9GNCaMyWPgp3KLGnhitDdlKc9wje3DBRKl8M8eUqFyfHs9Dr0K+zqus3eb3HakgFU9nFrva+tgb1ee3YQi9ATNQwfBcYJQ8RBhY+vAPPFby943svycQ4Bx6gjv5UfCq3lJpVk4wXusG+Fu1dpvCKhXGDbetgAWmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779269130; c=relaxed/simple;
	bh=4Zkx2H0PiH3MVAOPZhP25pMjtvzzQXvPzDboI7IuW88=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JAjWE8Kt/VckHOuzn7nrTLpcU7vmXKXWwPNGlHU2IPK95t6WeqReQ9+4yhnVFj7Pa/SqzjYP27UwismleYF6mz18c4WyQp+4J7Dx6k+cRQXQApdG4Y+FM1n53V57965/yBgm7LWfTKqUVpj/I7D/jsTq9ntYxFb/ShbXp79WkUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BsuZJ0Sh; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43d7e23defbso2541665f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 20 May 2026 02:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779269124; x=1779873924; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q9ii7napKSD9nM0QyMv+uOMieKZGVTfPnkU+URPN/2g=;
        b=BsuZJ0ShulgJ0A3++B4W5Rq8G3OiF75wM/8s44b7wsaxMBezm66rm8cShjPcB+r50B
         ya4+RZ16A0XbMEDS0G4UhwXApIK5K5H9PsOqsHl42lsMu/WldeVHfHwxcTQEixxTaiHM
         ngBX5VpauL4vNw0+HP0QFjniPZ16lA2rxvqv8RMgAD1EEe/pg3mR4j4Hyj0jowq7Cte2
         kYO6r0yR5K5RteuXx60r6/rTvhr6+Z+/VqiCZPJqZ3NuT/HlLEQ2vYDxENUv36iPSLEw
         dVMYcdIJZA2QB48Ik/jK3MtXQwh9vByYgdlvb49/R0iIxWAkrhVh1TW6iXTNOeFVBMBw
         DAtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779269124; x=1779873924;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q9ii7napKSD9nM0QyMv+uOMieKZGVTfPnkU+URPN/2g=;
        b=d3UY82lIGnNY6il3lackOZWwiuyGH7V16L2eEASGj4xkZuvotKDflK0i4ATjRAlfK/
         vcrn9rfEgudBfm74HJKVZmgrsf266F79o2cD/9DUKIdx6HFe+5nfvrINIx08DiXciG1Q
         axgwh6D1trvIHX6cM5GzWDlvTNmwdAHfdxKH51bvVjGh/BuczWY+6v9SglfeueOOhyU4
         lFh0GS45R4NKe6N7tTFW9d+4U5WZpIv2ypBifd9ryBW2VQKQ0Eb+UK6fYQOZxqUw5uTz
         F6CLZ1EIiuRrMQhmKcz9srOTejNjDdq8jfPmnoJjAZn8puuwnbV/ip/rriGTOSh9TWbn
         cRkQ==
X-Gm-Message-State: AOJu0Yxag3PCwwTwTFob7l0PeociA+CDIzQf9vk5sQBBTV44cwbkqCD+
	H+D1lK8G0DRWjWEQokA+UCXmMQimbEuBoHLqVd8DxUiAhzKdRAR02SPj
X-Gm-Gg: Acq92OHJAqbf31TIU1K1BcPE1Il+eHI/8LXQEu+TDFNLD2YNPscUPYFdzO1+NUYbkpI
	c7gVabPjFRuRCwM9xvaNa2bGyC3fDI+BX3JizDhJdrTxC4XIfkmCKZ3yekYWOlIA3VrVKnnhsew
	ooEfkJHQ0jKum3aGduFooPqwk8CxY769zh5ehI0nyhgDSmh+V+upVf12jZF0JCuTdG7WEw7pGHL
	+l+77uR8T6QH5onG3/NRw+oQTROMcFPw6X3cTf560Xuh9qSF3p2jwCa4/DJKLP+3iR4Jj8qJaIW
	L+UAm2cZ8+5l1IUI2Hn3M1AxrLkG39+7zcRG59fKUgLXtvvWyHZ41GIcZVRJ8wNcGvLALnk0dgJ
	ISBNJfdgIFF9V2IWKJw/Sf7DwWVMYboaV0UZU3vJyEVdW3dURyrQcjbX1pnV453L7RcsOwGKZZA
	BmZo9uykj7UaqAizOmkfbcXE5hRwTOYbfAiaBvrT/9/Y9tnRn0EyzMUoXGaUZyflmWUeJzafdLx
	hbjTztTjiZDqDfxiCf6njnY03+LLD2GMPIWF7DyoLOoBRNS
X-Received: by 2002:a05:6000:240b:b0:455:d927:1b30 with SMTP id ffacd0b85a97d-45e5c5f5c36mr39275410f8f.28.1779269123691;
        Wed, 20 May 2026 02:25:23 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:dcb8:81c1:dc9e:cd68])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9e768acesm56276935f8f.7.2026.05.20.02.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 02:25:23 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] clk: renesas: r9a08g045: Drop unused DEF_G3S_MUX macro
Date: Wed, 20 May 2026 10:25:16 +0100
Message-ID: <20260520092516.69819-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-32855-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,renesas.com:email]
X-Rspamd-Queue-Id: ACD7358AC0B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Drop the unused DEF_G3S_MUX helper macro from the r9a08g045 CPG
driver.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
DEF_MUX() helper from rzg2l-cpg.h can be used for any future mux
clock definitions instead of maintaining a duplicate local wrapper.
---
 drivers/clk/renesas/r9a08g045-cpg.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/clk/renesas/r9a08g045-cpg.c b/drivers/clk/renesas/r9a08g045-cpg.c
index 1232fec913eb..733c1ced6224 100644
--- a/drivers/clk/renesas/r9a08g045-cpg.c
+++ b/drivers/clk/renesas/r9a08g045-cpg.c
@@ -53,13 +53,6 @@
 /* PLL 1/4/6 configuration registers macro. */
 #define G3S_PLL146_CONF(clk1, clk2, setting)	((clk1) << 22 | (clk2) << 12 | (setting))
 
-#define DEF_G3S_MUX(_name, _id, _conf, _parent_names, _mux_flags, _clk_flags) \
-	DEF_TYPE(_name, _id, CLK_TYPE_MUX, .conf = (_conf), \
-		 .parent_names = (_parent_names), \
-		 .num_parents = ARRAY_SIZE((_parent_names)), \
-		 .mux_flags = CLK_MUX_HIWORD_MASK | (_mux_flags), \
-		 .flag = (_clk_flags))
-
 enum clk_ids {
 	/* Core Clock Outputs exported to DT */
 	LAST_DT_CORE_CLK = R9A08G045_SWD,
-- 
2.54.0


