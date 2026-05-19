Return-Path: <linux-renesas-soc+bounces-32797-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oDkUOuo/DGqqawUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32797-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 12:48:10 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DEB857CC7C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 12:48:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9CDC4305FC1C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 10:36:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09F2E35203A;
	Tue, 19 May 2026 10:36:10 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E56DA352003;
	Tue, 19 May 2026 10:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779186969; cv=none; b=U7IcKJYjczoDXu6j9QqUfKwshM4Pps+5e7UfErlvvuIBx428LxIraNWeYDtJxAG7MytYcFJspsbURmlLOHZWuTTDWL/ZfHHWwlf5tdOOQuwl3HmBLV6ZZ8HOOO29hOnWhye5so7ibFCaWKCcuwxvobPS7gZpMisx8krcwjy7eb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779186969; c=relaxed/simple;
	bh=GHLGeOXfajLSwh91ObeupCCnaHKN48SnXB4fGejZD0M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SRtVEP0c+DE2eAgDJhA/N5dcGtR1Vv5BvXmhKKP6+shFB8q9Kw5KKVpCdyte4IKy4T3LvSystGH2PHMQhcEqWl3Sxfl3LV/KyQksjhHqNZd98ef8EkhUE/HRh898DxgYrrYj0enIW48vD6BPspLMa+us3XruDH5e0PDrlHHHijI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3ACE4C2BCB3;
	Tue, 19 May 2026 10:36:08 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/2] Renesas SoC updates for v7.2
Date: Tue, 19 May 2026 12:35:57 +0200
Message-ID: <cover.1779185457.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[glider.be];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-32797-lists,linux-renesas-soc=lfdr.de,renesas];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@glider.be,linux-renesas-soc@vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,lists.infradead.org,vger.kernel.org,glider.be];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,glider.be:mid]
X-Rspamd-Queue-Id: 6DEB857CC7C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

	Hi SoC folks,

This is my first pull request for the inclusion of Renesas SoC updates
for v7.2.

It consists of 2 parts:

  [GIT PULL 1/2] Renesas driver updates for v7.2

    - Add Multifunctional Interface (MFIS) mailbox and product register
      support for R-Car X5H,
    - Miscellaneous fixes and improvements.

  [GIT PULL 2/2] Renesas DTS updates for v7.2

    - Add GPU support for R-Car M3-W(+)-based ULCB and Salvator-X(S)
      development boards,
    - Add Ethernet, OPP table, interrupt, pin control, and watchdog
      support for the RZ/G3L SoC and the RZ/G3L SMARC SoM board,
    - Add Coresight support for the R-Mobile A1 and APE6 SoCs, and the
      Armadillo-800 EVA and APE6EVM development boards,
    - Miscellaneous fixes and improvements.

Note that the first PR includes DT binding definitions for R-Car X5H,
which are shared by driver and DT source files.

Note that the second PR (1) is based on v7.1-rc3, as PowerVR GPU
enablement has a dependency on commit 26735dfdd8930d9e ("pmdomain: core:
Fix detach procedure for virtual devices in genpd"), and (2) includes:
  - Renesas SoC fixes for v7.1, which are already present in
    soc/for-next, but not yet in v7.1-rc4,
  - DT binding definition updates for the R-Mobile A1 and APE6 SoCs,
    which are shared by the clock subsystem and DT source files,
  - DT binding definitions for the RZ/G3L SoC, which are shared by the
    pin control subsystem and DT source files.

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

