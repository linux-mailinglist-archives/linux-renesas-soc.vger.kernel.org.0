Return-Path: <linux-renesas-soc+bounces-29333-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yCM6Fl3xs2nYdgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29333-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 12:13:33 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB64282063
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 12:13:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 81468305BFF9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 11:13:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E93E2375F85;
	Fri, 13 Mar 2026 11:13:04 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E0133F385;
	Fri, 13 Mar 2026 11:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773400384; cv=none; b=RS+tHWkkT+GEiIigiItRkAEMIKyTJ9sC0p+wGPyl4zqEv4WhhDmFoZr3HK3s2NCE65bq6T/jKHDVlGqQAPMvaTaQGJQ7iw0ZQ4q1VhAfhYmFXnHSvjW6eEWHCHSJJO6xOCOG9okLQXUX4XA9ahLfeCxcGSvoYTZRIn1uCg0dpek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773400384; c=relaxed/simple;
	bh=L/rMt4kne8vcYLBEXWwX3TF8nVloeJq0HNQ/EyWRJMM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O2SivflQtFt90+lz7sCWaHCF5C1KegM5/AVH3GQ3NN92bC9k+M1BiacOykkd5LtZkVHvutkbslp20KKe+G5Xa1y8pyiCb7vViqKPwjKWjbDnAamDQye8OzkbJpxFsAmkvMuYbJfMSLYUJ1jXHwscbLuLC2au9MbsWMVnCzijMq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A089C19421;
	Fri, 13 Mar 2026 11:13:03 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/4] Renesas SoC updates for v7.1
Date: Fri, 13 Mar 2026 12:12:56 +0100
Message-ID: <cover.1773399669.git.geert+renesas@glider.be>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29333-lists,linux-renesas-soc=lfdr.de,renesas];
	DMARC_NA(0.00)[glider.be];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,lists.infradead.org,vger.kernel.org,glider.be];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[geert@glider.be,linux-renesas-soc@vger.kernel.org];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,glider.be:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: CBB64282063
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

	Hi SoC folks,

This is my first pull request for the inclusion of Renesas SoC updates
for v7.1.

It consists of 4 parts:

  [GIT PULL 1/4] Renesas ARM defconfig updates for v7.1

    - Refresh the ARM SH-Mobile defconfig for v7.0-rc1.

  [GIT PULL 2/4] Renesas driver updates for v7.1

    - Initial support for the Renesas RZ/G3L (R9A08G046) SoC.

  [GIT PULL 3/4] Renesas DT binding updates for v7.1

    - Document RZ/G3L SoC variants, the RZ/G3L SYSC block, and RZ/G3L
      SMARC SoM and Carrier-II EVK boards.

  [GIT PULL 4/4] Renesas DTS updates for v7.1

    - Add CPU frequency scaling and QSPI NOR FLASH support on the RZ/N1
      SoC and the RZN1D-DB development board,
    - Add PCIe slot power control on the R-Car H3, M3-W(+), M3-N, and E3
      SoCs,
    - Add USB3.0 PHY support on the R-Car E3 SoC and the Ebisu development
      board,
    - Add PCIe/USB3.0 clock generator support on the Salvator-X(S), ULCB
      King Fisher extension, and Ebisu development boards,
    - Add RTC support on the RZ/V2N SoC and its EVK board,
    - Add SPI DMA support on the RZ/T2H, RZ/N2H, RZ/V2H(P), and RZ/V2N
      SoCs,
    - Add support for the second SDHI channel on the Atmark Techno
      Armadillo-800-EVA board,
    - Miscellaneous fixes and improvements.

Note that the fourth PR is based on "[GIT PULL] Renesas SoC fixes for
v7.0".

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

