Return-Path: <linux-renesas-soc+bounces-18900-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C61AED18A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Jun 2025 00:03:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BFEC6170125
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 29 Jun 2025 22:03:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9798223311;
	Sun, 29 Jun 2025 22:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="YLo2sGII";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="bHU2jcaY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11D762BB04;
	Sun, 29 Jun 2025 22:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751234610; cv=none; b=Fj3gupk879zAKYw7yTZ8o4WX7umNj4uUsgvKxjPyueqdmgYd9zHbGssjLP/hSSqtXHsOoyekj6oR26v5uVGQRXvI2BGdauPo/VvdwiceGunwE4wetpETUdfkjy4k7ktvOL9axtyrp38uezKgJCwNGMVE1Z2H0lRMyi47OZoQhvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751234610; c=relaxed/simple;
	bh=VYrxT2BNQHjU0MJz0OdEn520vMRwoVhW+g1xOW1znyo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r3aDFjdUY6xK594GXBZaE27KlRQzfhjQq8daI2XGun32JPuAfJO/mwWN97JwjNLmgp2dYmm8yrWGC0WzNh1Jgx6NISvuX6GgR0LT1gbXll8JV5EvblLv/qdvVWWsKPwFkORhPuLKDan2mcjlLp16uksT/vuYoIcqJMAlJLHipCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=YLo2sGII; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=bHU2jcaY; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4bVjwS5RNRz9tSK;
	Mon, 30 Jun 2025 00:03:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1751234600;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=tLOBASu67jMssiQT5SFkON0glgTsFRDPfajmiWxxwog=;
	b=YLo2sGIIyIG9Al/YEyGCgmObSwoTXAq+0GnKu2t8O89WF6Q7Zzeq03/5twmZKR93LjZdmT
	UnksZyK7whTbO6m6NH8OKUBSA3Hm2WEa36hQHL9fAxypgzITdvq7WukK0Mt+ItvYfhG5Df
	V8KECzDBKDKedJmuAYD/i73/i58qLD9XChT56vHrqe4+4xyLGGR9GW/AhXXQVRVTTgPvYh
	VCVI6j9KbHTS37cUhGy3NuZd+J6akDVRrOycY/VTAVt6imytrEEw+HR/mE0Oygs5EdWDnx
	MDioJONaUy2d8DZXhbDvXHGKNUx5tfofTUbS4dPsPHOW89Q8gituhxYswAF+xw==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1751234598;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=tLOBASu67jMssiQT5SFkON0glgTsFRDPfajmiWxxwog=;
	b=bHU2jcaYCIJ3si37hgS9IhNk3jzcwDR6e1mp49Oe98Cfs0Swg632JLEgwzixQXH9BDm8JN
	HB0dluEoG6BRVakMvHS83c2gCpxWIXy71pb9fWXuPuHmwYirvYJsa9zTFlzcnifJl5VkhK
	T75N6ZX5BQNa5vJdQOx/UwC7MHd+I+j980RTzWPHxGhVy7z9obYAwi7RrokacGt+6dvllE
	xqQTIE8z4KTtbg1RNaZmX/KmdAkmlN/dT34B2mRFV1rSXvv9Vxc0yXiKnGsII+J1V+NXaQ
	EVbCg01bvIK3zduFghawK72s2xQTeEjI/2Ti6pUx5YcTLSsO9ylw+782WcGWkw==
To: linux-hwmon@vger.kernel.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: hwmon: pwm-fan: Document after shutdown fan settings
Date: Mon, 30 Jun 2025 00:02:08 +0200
Message-ID: <20250629220301.935515-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: oehwbwereg8x7fbrojyx4srs96aq8pks
X-MBO-RS-ID: 663836b5dffa5e279f4
X-Rspamd-Queue-Id: 4bVjwS5RNRz9tSK

Document fan-shutdown-percent property, used to describe fan RPM in percent
set during shutdown. This is used to keep the fan running at fixed RPM after
the kernel shut down, which is useful on hardware that does keep heating
itself even after the kernel did shut down, for example from some sort of
management core.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Jean Delvare <jdelvare@suse.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-hwmon@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 Documentation/devicetree/bindings/hwmon/pwm-fan.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/pwm-fan.yaml b/Documentation/devicetree/bindings/hwmon/pwm-fan.yaml
index 8b4ed5ee962f..a84cc3a4cfdc 100644
--- a/Documentation/devicetree/bindings/hwmon/pwm-fan.yaml
+++ b/Documentation/devicetree/bindings/hwmon/pwm-fan.yaml
@@ -31,6 +31,15 @@ properties:
       it must be self resetting edge interrupts.
     maxItems: 1
 
+  fan-shutdown-percent:
+    description:
+      Fan RPM in percent set during shutdown. This is used to keep the fan
+      running at fixed RPM after the kernel shut down, which is useful on
+      hardware that does keep heating itself even after the kernel did shut
+      down, for example from some sort of management core.
+    minimum: 0
+    maximum: 100
+
   fan-stop-to-start-percent:
     description:
       Minimum fan RPM in percent to start when stopped.
-- 
2.47.2


