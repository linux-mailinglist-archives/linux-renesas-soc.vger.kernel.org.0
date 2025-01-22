Return-Path: <linux-renesas-soc+bounces-12310-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D1EB0A18D82
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Jan 2025 09:21:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0B7EA165459
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Jan 2025 08:21:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75E0F1B3948;
	Wed, 22 Jan 2025 08:21:44 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [195.130.132.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E2B217BB6
	for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Jan 2025 08:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737534104; cv=none; b=e/FHNWM/t7NTX5n7HfImjRhwfsBdNpMsPfuFSwrmnfyME0YwXCFsaJ2moH4C4dz7O1OQjDAgTne4sk5V/cM0R3fMMBcNq6WPAQbqOGGMwSe+2iYIsN24ciZNFcmRGDuW1zDIi55HtPg/SaIB5u9y7Qh7LVpCSboIZgdfaP+5P1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737534104; c=relaxed/simple;
	bh=BR5h2JUnR5PUm/non386vdaKgp9+sq3jAzzmOs5WjhE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iWZG8+5iO57E8IsAqW4fxWHjabz3BNNvA/d5D72MwKMGsA5Tn2aUQmOD7PjdnLfgt0ql/hIuYNWdCc+G/AQK5NuebeB5QQO4DVC6aBqUY17AYWKK1DChCJl1tRcGa5I3VIi8qVSj3LlVosW0GDGkxbX0gwo/EAivNcM9cFXVY3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:6949:ff:ad3a:db44])
	by baptiste.telenet-ops.be with cmsmtp
	id 48MZ2E00a4mXrYp018MZlq; Wed, 22 Jan 2025 09:21:35 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1taVzJ-0000000E28f-2ZOd;
	Wed, 22 Jan 2025 09:21:33 +0100
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1taVzR-00000005E0S-1TOh;
	Wed, 22 Jan 2025 09:21:33 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Rob Herring <robh@kernel.org>
Cc: linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ASoC: soc-core: Stop using of_property_read_bool() for non-boolean properties
Date: Wed, 22 Jan 2025 09:21:27 +0100
Message-ID: <db10e96fbda121e7456d70e97a013cbfc9755f4d.1737533954.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On R-Car:

    OF: /sound: Read of boolean property 'simple-audio-card,bitclock-master' with a value.
    OF: /sound: Read of boolean property 'simple-audio-card,frame-master' with a value.

or:

    OF: /soc/sound@ec500000/ports/port@0/endpoint: Read of boolean property 'bitclock-master' with a value.
    OF: /soc/sound@ec500000/ports/port@0/endpoint: Read of boolean property 'frame-master' with a value.

The use of of_property_read_bool() for non-boolean properties is
deprecated in favor of of_property_present() when testing for property
presence.

Replace testing for presence before calling of_property_read_u32() by
testing for an -EINVAL return value from the latter, to simplify the
code.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Seen since commit c141ecc3cecd7647 ("of: Warn when
of_property_read_bool() is used on non-boolean properties") in
dt-rh/for-next.

I could not exercise all code paths, so review/testing would be
appreciated. Thanks!
---
 sound/soc/soc-core.c | 32 +++++++++++++-------------------
 1 file changed, 13 insertions(+), 19 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 3c6d8aef4130901c..26b34b6885083908 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -3046,7 +3046,7 @@ int snd_soc_of_parse_pin_switches(struct snd_soc_card *card, const char *prop)
 	unsigned int i, nb_controls;
 	int ret;
 
-	if (!of_property_read_bool(dev->of_node, prop))
+	if (!of_property_present(dev->of_node, prop))
 		return 0;
 
 	strings = devm_kcalloc(dev, nb_controls_max,
@@ -3120,23 +3120,17 @@ int snd_soc_of_parse_tdm_slot(struct device_node *np,
 	if (rx_mask)
 		snd_soc_of_get_slot_mask(np, "dai-tdm-slot-rx-mask", rx_mask);
 
-	if (of_property_read_bool(np, "dai-tdm-slot-num")) {
-		ret = of_property_read_u32(np, "dai-tdm-slot-num", &val);
-		if (ret)
-			return ret;
-
-		if (slots)
-			*slots = val;
-	}
-
-	if (of_property_read_bool(np, "dai-tdm-slot-width")) {
-		ret = of_property_read_u32(np, "dai-tdm-slot-width", &val);
-		if (ret)
-			return ret;
+	ret = of_property_read_u32(np, "dai-tdm-slot-num", &val);
+	if (ret && ret != -EINVAL)
+		return ret;
+	if (!ret && slots)
+		*slots = val;
 
-		if (slot_width)
-			*slot_width = val;
-	}
+	ret = of_property_read_u32(np, "dai-tdm-slot-width", &val);
+	if (ret && ret != -EINVAL)
+		return ret;
+	if (!ret && slot_width)
+		*slot_width = val;
 
 	return 0;
 }
@@ -3403,12 +3397,12 @@ unsigned int snd_soc_daifmt_parse_clock_provider_raw(struct device_node *np,
 	 * check "[prefix]frame-master"
 	 */
 	snprintf(prop, sizeof(prop), "%sbitclock-master", prefix);
-	bit = of_property_read_bool(np, prop);
+	bit = of_property_present(np, prop);
 	if (bit && bitclkmaster)
 		*bitclkmaster = of_parse_phandle(np, prop, 0);
 
 	snprintf(prop, sizeof(prop), "%sframe-master", prefix);
-	frame = of_property_read_bool(np, prop);
+	frame = of_property_present(np, prop);
 	if (frame && framemaster)
 		*framemaster = of_parse_phandle(np, prop, 0);
 
-- 
2.43.0


