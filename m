Return-Path: <linux-renesas-soc+bounces-33549-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wBqQLOFPIGpJ0wAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33549-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 03 Jun 2026 18:01:37 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D4AB8639831
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 03 Jun 2026 18:01:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33549-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33549-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4AC7E33FC4B3
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Jun 2026 15:17:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3A183D522C;
	Wed,  3 Jun 2026 15:17:15 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B87BC3D45C1;
	Wed,  3 Jun 2026 15:17:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780499835; cv=none; b=Ll8GqCNjB648SiMpRMp1zEAwbbB6IIiK6UO+E93+RyTvBGhS95rR/f3kmmnulU/itlZAicnSpG6n5TpNfGRMTYv/BSa2ls4LkovMPPK5SPY/z05jXDLJTO5sPb6oOQVDBZMfIL3r+mVBsZSJZIBpZk+P4XS0+7gCNdV6ulMX990=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780499835; c=relaxed/simple;
	bh=+3I8wOy+75gvvBtz6c8y77At198hB9zAdvxpQGyGrno=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=btgFqRKyAAFFevYY5n3HqBsGnnHSLfFxXkvJZXZmdjbFP+aCHo/rVl2cd8mXZHFhXu9PHJIHsF6vePeYkocyQq7SVpHvSkg48d7fjndCUsNXQ4T9dsVsCLFjUaZT9tfWXknzJc8A6NgXkuwj/1GMmMR+b09nfn4/UqQ3bQ6eAqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 002D51F0089D;
	Wed,  3 Jun 2026 15:17:12 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-usb@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/2] usb: host: xhci-rcar: Avoid repeated matching
Date: Wed,  3 Jun 2026 17:17:08 +0200
Message-ID: <cover.1780499433.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[glider.be];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33549-lists,linux-renesas-soc=lfdr.de,renesas];
	FORGED_RECIPIENTS(0.00)[m:mathias.nyman@intel.com,m:gregkh@linuxfoundation.org,m:yoshihiro.shimoda.uh@renesas.com,m:wsa+renesas@sang-engineering.com,m:linux-usb@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:geert+renesas@glider.be,m:wsa@sang-engineering.com,m:geert@glider.be,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER(0.00)[geert@glider.be,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[geert@glider.be,linux-renesas-soc@vger.kernel.org];
	R_DKIM_NA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,linux-m68k.org:email,glider.be:from_mime,glider.be:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D4AB8639831

	Hi all,

On R-Car Gen2 and Gen3, the .plat_start() callback checks the XHCI's
controller compatible value on each call, which happens multiple
times during the lifetime of the device.  This series fixes that by
using separate .plat_start() callbacks, reducing source and binary size
in the process.

This has been tested on R-Car H2 (Lager, disable pci2 first), and R-Car
H3 ES2.0 (Salvator-XS).

Thanks for your comments

Geert Uytterhoeven (2):
  usb: host: xhci-rcar: Remove SET_XHCI_PLAT_PRIV_FOR_RCAR() macro
  usb: host: xhci-rcar: Split R-Car Gen2 and Gen3 .plat_start() handling

 drivers/usb/host/xhci-rcar.c | 70 +++++++++++++++++-------------------
 1 file changed, 33 insertions(+), 37 deletions(-)

-- 
2.43.0

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

