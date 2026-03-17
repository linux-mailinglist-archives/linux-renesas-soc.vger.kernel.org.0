Return-Path: <linux-renesas-soc+bounces-29544-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mHFAGmwLuWk/ngEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29544-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 09:06:04 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 142B92A5488
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 09:06:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4FB61304E7EC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 08:02:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC5F83932F0;
	Tue, 17 Mar 2026 08:02:51 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A85192D97;
	Tue, 17 Mar 2026 08:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773734571; cv=none; b=lbfSG4nEW/qUBHwjymZKSaz6RvbYXrMJKrwyiPGjSOHDIVQoMzfJIVAgNXBlVuKSjsGGr6KwAs3pflKAjF2pFqPRlkkskzfMG6AlZr9SMBQLlUju67fjyQogbh5s7ozHEjo4d7CYDdPaJv1xcXBleQAw6zz/kvJuERQDDi6znnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773734571; c=relaxed/simple;
	bh=IZKww2otcBzDR0P97EA0n35AlA4634XqGNY7ER2DOqI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HDfSnSQRe9NFrI1AQGq+0ApxPALWOwCb3uTZyfW0rBhyKw/koFZOUk6X+a0FOqWQ0z/5QsqWqIIZVGy6aKOLE3VZqgaf263l/sv9EtRAKLZErYkKJG4M1xcS02H2a3E2NpzoLFWNzSwFx7j8OeQ2JaSxQksjF5ou+iKtmR47C6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5758C4CEF7;
	Tue, 17 Mar 2026 08:02:48 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Stefan Eichenberger <eichest@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 0/2] dt-bindings: net: micrel: Fix KSZ8041RNLI dtbs_check warnings
Date: Tue, 17 Mar 2026 09:02:44 +0100
Message-ID: <cover.1773734298.git.geert+renesas@glider.be>
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
	DMARC_NA(0.00)[glider.be];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29544-lists,linux-renesas-soc=lfdr.de,renesas];
	FREEMAIL_TO(0.00)[gmail.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[geert@glider.be,linux-renesas-soc@vger.kernel.org];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.952];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev,dt,renesas];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linux-m68k.org:email]
X-Rspamd-Queue-Id: 142B92A5488
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

	Hi all,

"make dtbs_check" reports several warnings due to some KSZ8041RNLI PHY
nodes having the "micrel,led-mode" property, while the DT bindings
prohibit this.

Apparently the DT bindings are incorrect, so this patch series fixes
that, after a customary cleanup.

Changes compared to v1[1]:
  - Add Reviewed-by, Acked-by,
  - Fix KSZ8041RLNI typo.

Thanks for your comments!

[1] "PATCH 0/2] dt-bindings: net: micrel: Fix KSZ8041RNLI dtbs_check warnings"
    https://lore.kernel.org/cover.1773321267.git.geert+renesas@glider.be

Geert Uytterhoeven (2):
  dt-bindings: net: micrel: Sort lists
  dt-bindings: net: micrel: KSZ8041RNLI supports LED mode

 Documentation/devicetree/bindings/net/micrel.yaml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

-- 
2.43.0

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

