Return-Path: <linux-renesas-soc+bounces-28638-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eHPYNlKYpWnXEgYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28638-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 02 Mar 2026 15:01:54 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B97AF1DA47C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 02 Mar 2026 15:01:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 37518301B878
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Mar 2026 13:57:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A0043F23DD;
	Mon,  2 Mar 2026 13:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="CYP98OVL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7AED36C9D0
	for <linux-renesas-soc@vger.kernel.org>; Mon,  2 Mar 2026 13:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772459832; cv=none; b=S51KHZaY5UySUQy8tSvVnQQ7xj0l9qIzdNbysLJ5Lktwb4BYIFUEeFBscpyXssqqdLKGH2IWf0B0emEM31UqeyeTnEhscBwmaSYPjio6wDkXzYBmARoXYBq+msJw9Vq1zoWfGw8Mp3pm69HXnSDRpTLbJzZ+LTsKS4YmwP1Vpmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772459832; c=relaxed/simple;
	bh=lEvdwJ+CQGGibJGfq/7IQEzrKZqm5RUSu5rpuUx4oAY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=rnluRl77F3z0THQXLg5uscOdlCILXTvGZ6fOHdRiJIRflzb9yl9/n+KqzZL45WHnQwVFUAiTQ5UqCkt+IpDl0rIUAGPmGxyaczUElnh8GgUNq4ptUslO5DbxdvzsXyp596lTvO8/UVsVLKfojcWXqxW6LOLUIea+lL0q5xKMqq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=CYP98OVL; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-439af7d77f0so1434705f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 02 Mar 2026 05:57:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1772459828; x=1773064628; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3KEA74Fj3pMLuFpC+9hfiR3S8SjTOgau41zhCYgt1Xo=;
        b=CYP98OVLHsI6CN+Og2ukksJbVRqkuq5XqlYCRL7mxgtBDLrESuUkaMgHjrnVmVjEox
         VmKhfo3JyxFMgfkwQp9myKfLLayEn8oF8z0sWPisefDUaH41/pUUpK5phZwJ9SJefxEh
         mNay6OzYyjvk0f8OsuODh+E8hPLUA0/BVgLRe2gi5L52UfgigQAkHMJSUDPpq+kqlFx3
         lH3tLwLPVW25nMPY7iWiegZkTQWaz4DIsFVVzT8eFh+lCu0fHwkm2OX3Fx/N9nObTuz0
         ruHCD3OjuXDmRzehQY57Zd5YLzrGopk2KoJnwyGJkFrLYb4zzTs7XXonwgFfSjUDKHGC
         f0OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772459828; x=1773064628;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3KEA74Fj3pMLuFpC+9hfiR3S8SjTOgau41zhCYgt1Xo=;
        b=wy45pLH0xeSV5TARQkfKoqpxKifxPlqls8dpg25Wv9jyp30+uC3wV5sXrOx064UnzS
         mf4hOQh0kAAsWVQyv/sPNNrM06V0kaWAn5SQfSUpvCyHLSwJB70vSHRID1jbmHeQwrS1
         4eu+aSQ4RIb6clFBShSkJP1RSdDKvKupKmaPMb78rWG6yIj8NxTuZ6u3SVU2QBIaj8XH
         ho9c5PkhKP4IeWiVL1bqml71yACIsLoTIRlV9egU/+FqLvCdiLNgqa7IAFfIMlNC9vkP
         z3KbkslzLq3lOeR/K+2MXwM2lVpIWChjYZucPdje/pCrrT296VaivD6c2BIiUVZFwiZ8
         /mig==
X-Forwarded-Encrypted: i=1; AJvYcCUxNfe8eFoGOfzZI/g+ZIAzlXoZ15NVhz4y/2XSw+M+tGs1QVYCIBo25kqQ9y2yTsQnDexXYuAzg8AxSfI3RNYLPg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzWS7SROeBEL5Bc5N0FHzd2g2LA8TCUNlyMgCGLeeB8Un74tCHb
	0aR6aOhoMhJCsPMGEkEnqA5+4qvBn/QxdgF91yC1x5Jh49pbJWkoF6WZspx7fNVG/g7ZJAbrwK7
	Jtfu2
X-Gm-Gg: ATEYQzy0zYVNyT1l8D2W+O61K1DdLnX/TE+yJ3PJsUmqrjbenPgS6hAnmIgQnTRNnzB
	XKRCr9PV/GmwNrfXXcsb+SRZod8wj4azvhv0S9CfXIziiAZxPjCXSvmKGJjsbeGihlwJmaeXHVg
	adpc3aLDmlAXwwE78O1j6zV+DliMPFwss3O38n/asmbXMaYVAhRSaXULxg5VGpr80lPW+YRmj5p
	zTMIih8Kvl34WM+W/PGbpKP9XfLu/zM4Ju1NdWnebB+JF93oF+AI0Fq0JR8g1lHy791Cokyyglx
	Cf4NjFc2VzdWGgCA9B7RzFufVDh3nW+MXnWyrCjawwoTpbwytLfckRsIbZqveHkLqecU9NyoTZe
	YmRq5xK8v3j26xfuXIP01Lt4it8nIgituUGpmAYTQdEzLeSd+hyg3EvIKD5tlmTsOHEOVtBdWmi
	BdQq6lpBkMjuDBxFEWjFV8AZO/uHlS1I1F2X5TfV8+qbBge6qAdlar81U=
X-Received: by 2002:a05:6000:220c:b0:439:ac8f:5db2 with SMTP id ffacd0b85a97d-439ac8f618cmr13123694f8f.22.1772459827690;
        Mon, 02 Mar 2026 05:57:07 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([213.233.104.147])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439ba2a58dasm5031094f8f.27.2026.03.02.05.57.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 05:57:07 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	magnus.damm@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	biju.das.jz@bp.renesas.com
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH] arm64: dts: renesas: rzg3s-smarc-som: Set bypass for Versa3 PLL2
Date: Mon,  2 Mar 2026 15:57:03 +0200
Message-ID: <20260302135703.162601-1-claudiu.beznea.uj@bp.renesas.com>
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
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[tuxon.dev:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28638-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[tuxon.dev];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org,bp.renesas.com];
	RSPAMD_URIBL_FAIL(0.00)[tuxon.dev:server fail,renesas.com:server fail];
	DKIM_TRACE(0.00)[tuxon.dev:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@tuxon.dev,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,tuxon.dev:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,0.0.0.68:email]
X-Rspamd-Queue-Id: B97AF1DA47C
X-Rspamd-Action: no action

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The default settings for the Versa3 device on the Renesas RZ/G3S SMARC
SoM board have PLL2 disabled. PLL2 was later enabled together with audio
support, as it is required to support both 44.1 kHz and 48 kHz audio.

With PLL2 enabled, it was observed that Linux occasionally either hangs
during boot (the last log message being related to the I2C probe) or
randomly crashes. This was mainly reproducible on cold boots. During
debugging, it was also noticed that the Unicode replacement character (�)
sometimes appears on the serial console. Further investigation traced this
to the configuration applied through the Versa3 register at offset 0x1c,
which controls PLL enablement.

The appearance of the Unicode replacement character suggested an issue
with the SoC reference clock. The RZ/G3S reference clock is provided by
the Versa3 clock generator (REF output).

After checking with the Renesas Versa3 hardware team, it was found that
this is related to the PLL2 lock bit being set through the
renesas,settings DT property.

The PLL lock bit must be set to avoid unstable clock output from the PLL.
However, due to the Versa3 hardware design, when a PLL lock bit is set,
all outputs (including the REF clock) are temporarily disabled until the
configured PLLs become stable.

As an alternative, the bypass bit can be used. This does not interrupt the
PLL2 output or any other Versa3 outputs, but it may result in temporary
instability on PLL2 output while the configuration is applied. Since PLL2
feeds only the audio path and audio is not used during early boot, this is
acceptable and does not affect system boot.

Drop the PLL2 lock bit and set the bypass bit instead.

This has been tested with more than 1000 cold boots.

Fixes: a94253232b04 ("arm64: dts: renesas: rzg3s-smarc-som: Add versa3 clock generator node")
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
index 982f17aafbc5..b45acfe6288a 100644
--- a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
@@ -162,7 +162,7 @@ versa3: clock-generator@68 {
 				       <100000000>;
 		renesas,settings = [
 		  80 00 11 19 4c 42 dc 2f 06 7d 20 1a 5f 1e f2 27
-		  00 40 00 00 00 00 00 00 06 0c 19 02 3f f0 90 86
+		  00 40 00 00 00 00 00 00 06 0c 19 02 3b f0 90 86
 		  a0 80 30 30 9c
 		];
 	};
-- 
2.43.0


