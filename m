Return-Path: <linux-renesas-soc+bounces-33649-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cvpsBXCHJmrGYAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33649-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 08 Jun 2026 11:12:16 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB69654719
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 08 Jun 2026 11:12:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33649-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33649-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4A6AF3007AD9
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Jun 2026 09:01:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B64C3B2FC0;
	Mon,  8 Jun 2026 09:01:39 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 419AF2C11F9;
	Mon,  8 Jun 2026 09:01:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780909299; cv=none; b=rLnKQ7VDfLQg47UIlcBFcl2lOFiGsQMm5kbfCulfgA0YCSNetcIc+X3YcTv/QoIUNrORyHPEMRNLJcfe1keovpMiodgVbSc9VLod4wLZVzt3sgnK8Yf9Tq1ju9YLESY0uZ1bfHj9g5/V8dOqnIvMJMuBbeWcq5Bm7YgbD310Iok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780909299; c=relaxed/simple;
	bh=45opUBklqFinzsdfEAoutBxgb+Sn9HZsSJHlC9WaMfM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dQnXA3C5CfhRPZfBIODWVgSr0/qXUlqwmXCvxDDjMc6lOEN6o1PYkqM8Sm1/t4Dxs4xvSrhgJPzi8Q7P7axtPHJhosBgq1BJS2QTyiStQjIAYfMA6Pcbg4fPNg9bpbqTX3SpRGe9edIoDmafcO2+yQ1MmDLGJqePYzl3IL/vHYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 189851F00893;
	Mon,  8 Jun 2026 09:01:36 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] pinctrl: renesas: Updates for v7.2 (take three)
Date: Mon,  8 Jun 2026 11:01:31 +0200
Message-ID: <cover.1780909189.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33649-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[glider.be];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:geert+renesas@glider.be,m:geert@glider.be,s:lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[geert@glider.be,linux-renesas-soc@vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[geert@glider.be,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_HAS_DN(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,linux-m68k.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,glider.be:from_mime,glider.be:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8BB69654719

	Hi Linus,

The following changes since commit 80538a53978bb9788080caea6e5ee3393dfb6a72:

  pinctrl: renesas: rzg2l: Use tab instead of spaces (2026-05-28 15:07:29 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-pinctrl-for-v7.2-tag3

for you to fetch changes up to 14270179806b876fecefcbf35905e512b56a5867:

  pinctrl: renesas: rzg2l: Use raw_spinlock_irqsave() on power source update (2026-06-05 11:44:54 +0200)

----------------------------------------------------------------
pinctrl: renesas: Updates for v7.2 (take three)

  - Fix locking on RZ/G3L.

Thanks for pulling!

----------------------------------------------------------------
Claudiu Beznea (1):
      pinctrl: renesas: rzg2l: Use raw_spinlock_irqsave() on power source update

 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

