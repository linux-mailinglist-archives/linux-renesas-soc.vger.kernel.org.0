Return-Path: <linux-renesas-soc+bounces-28109-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UFm+BhwOi2l/PQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28109-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Feb 2026 11:53:16 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B85119DA7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Feb 2026 11:53:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 06B0A302DA28
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Feb 2026 10:53:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E59734C818;
	Tue, 10 Feb 2026 10:53:12 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0491117ADE0;
	Tue, 10 Feb 2026 10:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770720792; cv=none; b=nRv/7v2f4hGmf1AEy/XQpmCjzQl0W6za0azH1FSA3Gb1c0aMEqQDO3piA+58AsMCzC2CUbhiNZDLRmSo9AG+7N6Y5dlNgyz91JhVW+1XWb64gtzteup1/uaiLD2cmM8ILEE/cjNtkw6nBb1zY8x7hdbkPAmV6dTttTON8VPoMjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770720792; c=relaxed/simple;
	bh=DdH9HV/drzVjOipT+cCCruo3aAqMdLhSXoBDSWowyEM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gj46GVE9Xu+ZuA4u37F5X0gCW+DghkDh+iPkwWiviqpmrRkKRj43UCqK5HWkm2wkIWW5eAyc5LgVZaOqG5r0cgU/dbcglywId/yE1pEN/2ycio9GYY5tJmmuyhzx0qGma8YW2BJKP7jn5HGa8yLb1vvP2zcirONsllcj2uQSN/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2888C116C6;
	Tue, 10 Feb 2026 10:53:08 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Josua Mayer <josua@solid-run.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: linux-phy@lists.infradead.org,
	linux-mmc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-next@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH next] phy: renesas: rcar-gen3-usb2: Drop local devm_mux_state_get_optional()
Date: Tue, 10 Feb 2026 11:53:00 +0100
Message-ID: <67c8c4f9bf9f09fd0c13daedef27b82ff389ddfb.1770720452.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28109-lists,linux-renesas-soc=lfdr.de,renesas];
	DMARC_NA(0.00)[glider.be];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@glider.be,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,glider.be:mid,glider.be:email]
X-Rspamd-Queue-Id: 68B85119DA7
X-Rspamd-Action: no action

Now the mux core provides devm_mux_state_get_optional():

    drivers/phy/renesas/phy-rcar-gen3-usb2.c:944:1: error: static declaration of ‘devm_mux_state_get_optional’ follows non-static
     declaration
      944 | devm_mux_state_get_optional(struct device *dev, const char *mux_name)
	  | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
    In file included from drivers/phy/renesas/phy-rcar-gen3-usb2.c:20:
    include/linux/mux/consumer.h:64:19: note: previous declaration of ‘devm_mux_state_get_optional’ with type ‘struct mux_state *(struct device *, const char *)’
       64 | struct mux_state *devm_mux_state_get_optional(struct device *dev, const char *mux_name);
	  |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~

Fix this by dropping the temporary local wrapper.

Fixes: ad314348ceb4fe1f ("mux: Add helper functions for getting optional and selected mux-state")
Fixes: 8bb92fd7a0407792 ("phy: renesas: rcar-gen3-usb2: Use mux-state for phyrst management")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
  - ad314348ceb4fe1f is in mmc/next, and a PR has already been sent
    https://lore.kernel.org/20260209133441.556464-1-ulf.hansson@linaro.org
  - 8bb92fd7a0407792 is in phy/next
---
 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index cfc2a8d9028d58d0..65cbf330bd8fa10c 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
@@ -939,16 +939,6 @@ static int rcar_gen3_phy_usb2_vbus_regulator_register(struct rcar_gen3_chan *cha
 	return rcar_gen3_phy_usb2_vbus_regulator_get_exclusive_enable(channel, enable);
 }
 
-/* Temporary wrapper until the multiplexer subsystem supports optional muxes */
-static inline struct mux_state *
-devm_mux_state_get_optional(struct device *dev, const char *mux_name)
-{
-	if (!of_property_present(dev->of_node, "mux-states"))
-		return NULL;
-
-	return devm_mux_state_get(dev, mux_name);
-}
-
 static void rcar_gen3_phy_mux_state_deselect(void *data)
 {
 	mux_state_deselect(data);
-- 
2.43.0


