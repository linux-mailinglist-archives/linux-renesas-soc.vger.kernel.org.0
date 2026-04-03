Return-Path: <linux-renesas-soc+bounces-30817-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sIpuFUx9z2mvwgYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30817-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 10:41:48 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B293923A1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 10:41:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 36133300383E
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Apr 2026 08:41:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8619221F1C;
	Fri,  3 Apr 2026 08:41:37 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD351D6DB5;
	Fri,  3 Apr 2026 08:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775205697; cv=none; b=pN3H73jYza0VWDmIRu48KzzrXc2DkRJZlUn1nsiuHD/E15mI4c8vb8f0uvicYlUfuy6KLUCbglztdSCrn0foxv/rXwc+TR2pTAYUHlESHXIJuUbxG2ur8/VKUPayTVDEWesMacCzFTCI962x3vOMO0nvxNk3EPpp3FgRwe9x1MM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775205697; c=relaxed/simple;
	bh=YvYSbzhapvm9Z3Hb9a2PvQkeGkuTyz6vA0vZs5GdtQI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EfdHmfyHsdNot2b6SzShZrVY8g8SutayDtGYzZlkBT5zTGBAQyVFmKMoV08hvrTwAWZKZfVIr5dyEtyIjWA6f6juGV+JjozgSdejzLpPyuojFamQIDXfdzmHgJVyNAkSG15Z9aPmYHkN/3KVNAVSeKBp4uS8zGzz/pKmOUoHAVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBDD9C4CEF7;
	Fri,  3 Apr 2026 08:41:35 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Marek Vasut <marek.vasut@mailbox.org>
Cc: arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/3] firmware: arm_scmi: Miscellaneous improvements
Date: Fri,  3 Apr 2026 10:41:28 +0200
Message-ID: <cover.1775205358.git.geert+renesas@glider.be>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30817-lists,linux-renesas-soc=lfdr.de,renesas];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[glider.be];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[geert@glider.be,linux-renesas-soc@vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,glider.be:mid]
X-Rspamd-Queue-Id: A0B293923A1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

	Hi all,

This patch series contains miscellaneous improvements for SCMI quirk
handling and SCMI instance iteration.

Thanks for your comments!

Geert Uytterhoeven (3):
  firmware: arm_scmi: quirk: Improve quirk range parsing
  firmware: arm_scmi: quirk: Simplify quirk table iteration
  firmware: arm_scmi: Convert to list_for_each_entry()

 drivers/firmware/arm_scmi/driver.c |  4 +---
 drivers/firmware/arm_scmi/quirks.c | 15 ++++++---------
 2 files changed, 7 insertions(+), 12 deletions(-)

-- 
2.43.0

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

