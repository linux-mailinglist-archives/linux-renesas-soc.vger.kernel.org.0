Return-Path: <linux-renesas-soc+bounces-30528-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GIe2BGzFx2mTcAUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30528-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Mar 2026 13:11:24 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A60034E57B
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Mar 2026 13:11:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6E0283011BEB
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Mar 2026 12:11:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06BB13793B4;
	Sat, 28 Mar 2026 12:11:12 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D03378D86;
	Sat, 28 Mar 2026 12:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774699871; cv=none; b=tCC264r5uMVipwxJn6GD61LL37BeVqwfT9y2UnpoBmVE0uxr7KdqoaKEgzTPW1NRZ41E7fzACvACDb0ZJRGQlG2H4vueIEb3jtpnPF9F2drKtH7l7cmpUDfg1FowzFcPX+yrVOomfaqjagJ4EYStBduCFDLAiz7cxaqfJ7MBrdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774699871; c=relaxed/simple;
	bh=uR2BM0hVutRP5M5yInGuUpfr3Ps6x8wD9jYWSweSY7I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cFt+n2xsKfCbe0qknNrBVik7PAHsgS6tIB/bobEflBVKzRvWrxww9+r7lATO4ZyDk3tQrAuonYU6icX40A/sbX0Q74AmNevKMaVDGhW/Qv8H3dwAR0o/QVAW07zrnorFLhgvXZJt5pjxxHfqeQ0TKkbi426QHgrXKZf/wu9mgeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CF20C4CEF7;
	Sat, 28 Mar 2026 12:11:10 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/3] Renesas SoC updates for v7.1 (take two)
Date: Sat, 28 Mar 2026 13:11:03 +0100
Message-ID: <cover.1774606536.git.geert+renesas@glider.be>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30528-lists,linux-renesas-soc=lfdr.de,renesas];
	DMARC_NA(0.00)[glider.be];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,lists.infradead.org,vger.kernel.org,glider.be];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[geert@glider.be,linux-renesas-soc@vger.kernel.org];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,glider.be:mid]
X-Rspamd-Queue-Id: 6A60034E57B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

	Hi SoC folks,

This is my second pull request for the inclusion of Renesas SoC updates
for v7.1.

It consists of 3 parts:

  [GIT PULL 1/3] Renesas ARM SoC updates for v7.1

    - Use the of_phandle_args_equal() helper.

  [GIT PULL 2/3] Renesas driver updates for v7.1 (take two)

    - Mark remaining rz_sysc_init_data structures __initconst.

  [GIT PULL 3/3] Renesas DTS updates for v7.1 (take two)

    - Add DT overlay support for the MayQueen PixPaper display on the
      Yuridenki-Shokai Kakip board,
    - Add Ethernet PHY interrupt support for the RZ/T2H and RZ/N2H EVK
      boards,
    - Add SPI and PCIe support for the RZ/G3E SoC and the RZ/G3E SMARC EVK
      board,
    - Add DT overlay support for the WaveShare 13.3" 1920x1080 DSI
      Capacitive Touch Display and the Olimex MIPI-HDMI adapter on the
      Retronix Sparrow Hawk board,
    - Drop several superfluous C22 Ethernet PHY compatible strings,
    - Remove WDT nodes meant for other CPU cores on the RZ/V2N SoC,
    - Remove unavailable LVDS panel support for the Beacon ReneSoM base
      board,
    - Add initial support for the RZ/G3L (R9A08G046) SoC, and the RZ/G3L
      SMARC SoM and EVK boards,
    - Add Versa3 clock generator support for the RZ/V2H EVK development
      board,
    - Miscellaneous fixes and improvements.

Note that "[GIT PULL 3/3]" includes DT binding definitions for the
RZ/G3L SoC, which are shared by clock driver and DT source files.

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

