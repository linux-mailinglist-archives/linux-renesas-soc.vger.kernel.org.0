Return-Path: <linux-renesas-soc+bounces-30507-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qGpZJS3lxmnrPwUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30507-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 21:14:37 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A46A34AB5F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 21:14:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4972630EAF25
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 20:11:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B9D639183F;
	Fri, 27 Mar 2026 20:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="DaemZSFK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A75C6391505;
	Fri, 27 Mar 2026 20:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774642274; cv=none; b=SkDTaqb035jCU30umPh3kCyeiZhqNfBv7SRMMdfdRhhmdxdblh4axkZ7FCgJZON2mXr0ehCE7eWMnSR3ogMFG/8VMU7qyh5yoiToo1erRqWtl9k9Fxz3LcYydbciYhKPtouTfiarBeKnUpX3nq7EfXen7pDUHNKFmTvLaJybgps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774642274; c=relaxed/simple;
	bh=DN7wXHstW0a9Eh6qCjSIqfRfPKM+Y2CDrcIA4SlXgdc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ENwOnfH5mVf/oWA1BT1LmPeqcZfhN2mk5FYwf8hUKj6qLXCwSJOkPyUbb3pCtt+MDJNMypHPWdHVXP4iaXPGA0I2LdtV9YNMbinq9EDgZewYG8SlP39YeDe1l/2OPIFvaO7bF51OlZ1NFLmZerqE1jIyNN0G4qcuLTrq6bZVdxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=DaemZSFK; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 749AAC58753;
	Fri, 27 Mar 2026 20:11:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9F69960268;
	Fri, 27 Mar 2026 20:11:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A7B3610451AF7;
	Fri, 27 Mar 2026 21:11:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774642270; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=U5hIhzF+ik0my8XUFw36mXDKRSbF8EqUsA35jiAXhuk=;
	b=DaemZSFK1ljRDABW16g6POqTJ8KJoTvF1UnN7wETtZ3356iAEDkuIj96uD7xXcxmOKduqZ
	tYivP1ewmu+UG8UadV5OnSDtJ1+qzh0vPldc3gRPn8c8fs34NdHXo/c1tWzViHTtXbuUiQ
	4QqEaZCi2H9oyxgIty/wMpyAzybSw1ptDGrjmIWQnozTHSsK9sSFUI/+lhbuOSayCVwfjE
	YxzpZJM9nCzlUX4im1MH1x8SBWtq/XpqMV6xM7rRokf3mtMX4XePk8U9ByL07J6LYY6am2
	0nqSbxnP3Vot2xIVRnr8iE774nYaMRf5xYfMfDtAV5uWRb8cxpED0qgWtWA6TA==
From: "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>
Date: Fri, 27 Mar 2026 21:09:36 +0100
Subject: [PATCH 14/16] crypto: Group Inside-Secure IPs together and align
 the titles
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-schneider-v7-0-rc1-crypto-v1-14-5e6ff7853994@bootlin.com>
References: <20260327-schneider-v7-0-rc1-crypto-v1-0-5e6ff7853994@bootlin.com>
In-Reply-To: <20260327-schneider-v7-0-rc1-crypto-v1-0-5e6ff7853994@bootlin.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Olivia Mackall <olivia@selenic.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 Jayesh Choudhary <j-choudhary@ti.com>, 
 "David S. Miller" <davem@davemloft.net>, 
 Christian Marangi <ansuelsmth@gmail.com>, 
 Antoine Tenart <atenart@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Pascal EBERHARD <pascal.eberhard@se.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-crypto@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30507-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[baylibre.com,kernel.org,selenic.com,gondor.apana.org.au,ti.com,davemloft.net,gmail.com,glider.be];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miquel.raynal@bootlin.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:dkim,bootlin.com:email,bootlin.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2A46A34AB5F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

There are several drivers from the SafeXcel family already, the EIP-93,
the EIP-97 and EIP-197. We will soon also have the EIP-28.

Group them in the Kconfig menu and both titles to make explicit that
these components are from the same family and mimic the string used for
the Intel components (above in the menu).

Signed-off-by: Miquel Raynal (Schneider Electric) <miquel.raynal@bootlin.com>
---
 drivers/crypto/Kconfig                     | 45 +++++++++++++++---------------
 drivers/crypto/inside-secure/eip93/Kconfig |  2 +-
 2 files changed, 24 insertions(+), 23 deletions(-)

diff --git a/drivers/crypto/Kconfig b/drivers/crypto/Kconfig
index 8d3b5d2890f8..b3a6bbf0aacf 100644
--- a/drivers/crypto/Kconfig
+++ b/drivers/crypto/Kconfig
@@ -782,28 +782,6 @@ config CRYPTO_DEV_BCM_SPU
 
 source "drivers/crypto/stm32/Kconfig"
 
-config CRYPTO_DEV_SAFEXCEL
-	tristate "Inside Secure's SafeXcel cryptographic engine driver"
-	depends on (OF || PCI || COMPILE_TEST) && HAS_IOMEM
-	select CRYPTO_LIB_AES
-	select CRYPTO_AUTHENC
-	select CRYPTO_SKCIPHER
-	select CRYPTO_LIB_DES
-	select CRYPTO_HASH
-	select CRYPTO_HMAC
-	select CRYPTO_MD5
-	select CRYPTO_SHA1
-	select CRYPTO_SHA256
-	select CRYPTO_SHA512
-	select CRYPTO_CHACHA20POLY1305
-	select CRYPTO_SHA3
-	help
-	  This driver interfaces with the SafeXcel EIP-97 and EIP-197 cryptographic
-	  engines designed by Inside Secure. It currently accelerates DES, 3DES and
-	  AES block ciphers in ECB and CBC mode, as well as SHA1, SHA224, SHA256,
-	  SHA384 and SHA512 hash algorithms for both basic hash and HMAC.
-	  Additionally, it accelerates combined AES-CBC/HMAC-SHA AEAD operations.
-
 config CRYPTO_DEV_ARTPEC6
 	tristate "Support for Axis ARTPEC-6/7 hardware crypto acceleration."
 	depends on ARM && (ARCH_ARTPEC || COMPILE_TEST)
@@ -876,6 +854,29 @@ config CRYPTO_DEV_SA2UL
 
 source "drivers/crypto/aspeed/Kconfig"
 source "drivers/crypto/starfive/Kconfig"
+
+config CRYPTO_DEV_SAFEXCEL
+	tristate "Support for Inside Secure's SafeXcel EIP-97/EIP-197"
+	depends on (OF || PCI || COMPILE_TEST) && HAS_IOMEM
+	select CRYPTO_LIB_AES
+	select CRYPTO_AUTHENC
+	select CRYPTO_SKCIPHER
+	select CRYPTO_LIB_DES
+	select CRYPTO_HASH
+	select CRYPTO_HMAC
+	select CRYPTO_MD5
+	select CRYPTO_SHA1
+	select CRYPTO_SHA256
+	select CRYPTO_SHA512
+	select CRYPTO_CHACHA20POLY1305
+	select CRYPTO_SHA3
+	help
+	  This driver interfaces with the SafeXcel EIP-97 and EIP-197 cryptographic
+	  engines designed by Inside Secure. It currently accelerates DES, 3DES and
+	  AES block ciphers in ECB and CBC mode, as well as SHA1, SHA224, SHA256,
+	  SHA384 and SHA512 hash algorithms for both basic hash and HMAC.
+	  Additionally, it accelerates combined AES-CBC/HMAC-SHA AEAD operations.
+
 source "drivers/crypto/inside-secure/eip93/Kconfig"
 source "drivers/crypto/ti/Kconfig"
 
diff --git a/drivers/crypto/inside-secure/eip93/Kconfig b/drivers/crypto/inside-secure/eip93/Kconfig
index 8353d3d7ec9b..8a671b709a11 100644
--- a/drivers/crypto/inside-secure/eip93/Kconfig
+++ b/drivers/crypto/inside-secure/eip93/Kconfig
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 config CRYPTO_DEV_EIP93
-	tristate "Support for EIP93 crypto HW accelerators"
+	tristate "Support for Inside Secure's SafeXcel EIP93"
 	depends on SOC_MT7621 || ARCH_AIROHA ||COMPILE_TEST
 	select CRYPTO_LIB_AES
 	select CRYPTO_LIB_DES

-- 
2.51.1


