Return-Path: <linux-renesas-soc+bounces-32121-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yEybHck5+2nUXwMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32121-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 06 May 2026 14:53:29 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1619B4DA8D4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 06 May 2026 14:53:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 887AA30B52C0
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 May 2026 12:47:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08FEA44CF5B;
	Wed,  6 May 2026 12:46:49 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A86F744D035;
	Wed,  6 May 2026 12:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778071608; cv=none; b=bPTq1CMJNJ5i5V2519lSlivk/l0G5ge6zFLSlmYT/wMAmtu9EkfKQEImkGP7bWfUi/yYoCxnNtbDke3u+dyunaGp6OCKPwjQX8OnRtB9riPyPLrfwRwjhTAv9n2jijtOtXAqX18txWX+AzAmKHnf+qLteWHdH6Nw6+R44EMLqIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778071608; c=relaxed/simple;
	bh=ci4G32kXgsRtqmHBwO1z6lksgAlQyPPNYMs8uyrUvYA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SSCtsRezp19vYn88TWyjzW6+flLb3oBXLtr6Sdp2vqVfmeQujHtHE0AE4lXIWgRXAYVxdtS9eyByMWtmPGhlZ9ZkRmON7TZFlup0Iu49kEgn0Kdw3cZLI0Rsgjv4AFQYVxXIun/pt+C3T22EApZIHNpCk44aA5SSxSELz4uILqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03389C2BCB8;
	Wed,  6 May 2026 12:46:45 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: John Ogness <john.ogness@linutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-serial@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-sh@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] serial: sh-sci: Remove plat_sci_port.flags
Date: Wed,  6 May 2026 14:46:43 +0200
Message-ID: <20260506124643.128021-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 1619B4DA8D4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32121-lists,linux-renesas-soc=lfdr.de,renesas];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[glider.be];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[geert@glider.be,linux-renesas-soc@vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.988];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,glider.be:mid,glider.be:email]

The last setter of p->flags was removed in commit 37744feebc086908
("sh: remove sh5 support") in v5.8.

Link: https://lore.kernel.org/CAMuHMdXs94k3-7YD-yO7p2=+u8waYGAz8mpP5LDbMf3szt4V-w@mail.gmail.com
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/tty/serial/sh-sci.c | 2 +-
 include/linux/serial_sci.h  | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index 6c819b6b24258d36..a35230d57540384c 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -3369,7 +3369,7 @@ static int sci_init_single(struct platform_device *dev,
 	}
 
 	port->type		= SCI_PUBLIC_PORT_ID(p->type);
-	port->flags		= UPF_FIXED_PORT | UPF_BOOT_AUTOCONF | p->flags;
+	port->flags		= UPF_FIXED_PORT | UPF_BOOT_AUTOCONF;
 	port->fifosize		= sci_port->params->fifosize;
 
 	if (p->type == PORT_SCI && !dev->dev.of_node) {
diff --git a/include/linux/serial_sci.h b/include/linux/serial_sci.h
index 0f2f50b8d28e2743..36c795d61f7e8457 100644
--- a/include/linux/serial_sci.h
+++ b/include/linux/serial_sci.h
@@ -51,7 +51,6 @@ struct plat_sci_port_ops {
  */
 struct plat_sci_port {
 	unsigned int	type;			/* SCI / SCIF / IRDA / HSCIF */
-	upf_t		flags;			/* UPF_* flags */
 
 	unsigned int	sampling_rate;
 	unsigned int	scscr;			/* SCSCR initialization */
-- 
2.43.0


