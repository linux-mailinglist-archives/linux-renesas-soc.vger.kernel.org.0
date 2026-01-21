Return-Path: <linux-renesas-soc+bounces-27202-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MGh1GoXncGk+awAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27202-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 15:49:41 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id F09C258BD8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 15:49:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 49C4972DFC9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 14:15:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1DB546AF08;
	Wed, 21 Jan 2026 14:11:31 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F9A43587C4;
	Wed, 21 Jan 2026 14:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769004691; cv=none; b=k7D9ynhvqlLjEQu7ZaQh+WstmIFYIks64eSPT4f/i/KkQBc7mqYX+33ZZFUOpigzEkNjpaSLJwIi/GmlfK1Ie4Y71Jn31zP0SB4R315CGEgTFO0JnhuRPuofPAZtjndOTv5Fy2c5RDgQ+/D7dJLQX3OeqNpAMSOjpuptyowFF34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769004691; c=relaxed/simple;
	bh=jW77EJdDL6t+ci7yWGFy5IMcOo26zYw0YA+cOJ5lFZs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HhIjnlgCYZGXyk2/n0P474aRjH0JirleAwiMj7cAE5Weu8Cruy0EuzhBkQHCQFnS3eKIJSwxSsw9L5AZTdgNAdzL7ie24Mn3RGUg7Aj7QwlxCslpKYD7PzEmGxP4ajomHEFrzd1lcsG2OekgakvdbkIWeOG2L2rVpmcudGo9Y0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CA0CC4CEF1;
	Wed, 21 Jan 2026 14:11:29 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/4] usb: phy: generic: Miscellaneous improvements
Date: Wed, 21 Jan 2026 15:11:19 +0100
Message-ID: <cover.1769004444.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.76 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-27202-lists,linux-renesas-soc=lfdr.de,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[glider.be];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FROM_NEQ_ENVFROM(0.00)[geert@glider.be,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,glider.be:mid,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: F09C258BD8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

	Hi Greg,

This patch series contains a few improvements for the generic USB PHY
driver.  it has been tested on a Renesas Ebisu-4D board with R-Car E3.

Thanks for your comments!

Geert Uytterhoeven (4):
  usb: phy: generic: Always use dev in usb_phy_generic_probe()
  usb: phy: generic: Convert to devm_clk_get_optional()
  usb: phy: generic: Convert to dev_err_probe()
  usb: phy: generic: Convert to device property API

 drivers/usb/phy/phy-generic.c | 74 ++++++++++++-----------------------
 1 file changed, 26 insertions(+), 48 deletions(-)

-- 
2.43.0

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

