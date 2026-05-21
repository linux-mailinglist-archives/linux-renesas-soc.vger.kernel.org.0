Return-Path: <linux-renesas-soc+bounces-32894-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eEFCBKCUDmqtAQYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32894-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 May 2026 07:14:08 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BBCE59EF60
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 May 2026 07:14:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B248C300D4CA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 May 2026 05:14:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D9C2339844;
	Thu, 21 May 2026 05:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gqgccGcL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C07D3BB40
	for <linux-renesas-soc@vger.kernel.org>; Thu, 21 May 2026 05:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779340442; cv=none; b=cf1KgHEKE+CCwQb+Szo8ZpVQVv5g2R1nwL0bBKZ8Df+gSjLXC+mv7xH3QaRYYxmzRBpQwX4NyCdgnuJG0LV29cXVS5jpE6aYZf3J61iBnF6eZPpu7dRhNFae3xjlfMxybieP7CEi9rlhVPcLsHx1HbVMSomwphM4V3itMtcYv28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779340442; c=relaxed/simple;
	bh=84IYOUDRqLdOZnUza+I5M9XOglV9RpLSILXCdsenQOo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jNTTJa+1BRVO1NrWo8tYgx9nnToC9K0e4JB3jCd6OZ4jsAW2fS1uekBl2U4VWE0NajSM4P9uw6A+HrXo+WcwVZYdy0NB8IyuPXgaMlcnvBuGIYTqA/JhaorbNp7n+pU8mgDihJl9UIj6cvi1AglJ9HoZEXMUXrPW/K6IaVYdhX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gqgccGcL; arc=none smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-12c19d23b19so7778297c88.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 20 May 2026 22:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779340428; x=1779945228; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dC01VeKjcCopxQgK4IvKVGSUYqXlRoKtYIJqUaE3G8s=;
        b=gqgccGcL7ikNdfUlba6O0OKe01h8wGXTVdhJwTJjWMeGH+B/tPkwxhkSSNjmbONHn8
         kG9VeCsGByrR0XeiCjydp+FaObjJbw1b4BHhbrrxHHlrN3cGrwYPCi8f2EA1Bl7WUzzL
         zHsCl6wMaAPHfHo/72B8i/Ia1VuLkfiuWoD22WMwrI0lhkGCtFnQ86uJ7hg28Xzs2ZDn
         X7WOiM4aWQg+ztNGr7t01adly3kMGAGAlPvkUNphStKMq1RCnGBCWKZ71vtmtHyunPes
         NSARwOfNTRxzmKH/EpRlufEPXTXYHNXN6QiQJ0XQW+uwZVoCpn+J87xs4XwOZMQZNtH1
         KbJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779340428; x=1779945228;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dC01VeKjcCopxQgK4IvKVGSUYqXlRoKtYIJqUaE3G8s=;
        b=EAm3SUSG/2HMvyS98XVEDKb6LJyBt+ZTfOKZIZPmE78L0/dja95Xe49CiyFgRN7nnW
         Z6gI4Ea99A1FjOX0SthPk2bi+UH6MCxA3IvvpdmNCxs/zNQAITimozuDESdD6EF76zEK
         L5+rk6WijvGRoYe52xgkZOBcaHYCtn+AGfNYvQUJifgm7sDyKUAFu+MZpw4FxA5QxPJ5
         FHOzVeePXqvp6GDoJlm20DZTacQR4zq8n/E9JTbRhS1OesJj0UfebswBZYgys/lkaSdf
         hXIvorG4zqTGzED9sNA+kbIAXtxmvL0TJDTN2jWB9jUz/BXnpLGfXb7ZXsZ2hRHlc3zY
         lRPw==
X-Forwarded-Encrypted: i=1; AFNElJ+h6gF7ubAUR1XGiRcOE61PxqU8zYSZNp+1j+7G77oiQuI7QJqnCPElI+LIkADtvodYJxg6n+3dnRN2seHr7q3kkw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyVtL2uxJrLmHcyGQzuFkmh7+breQlvGwWDFP4tiyY+YzOX7C8Z
	O9DpuASl+g+vlJHGqXsxR4jDEYPeCgYE1ZNIr/SaH+BI5/qUEC6ZX4yQ
X-Gm-Gg: Acq92OEm4Yw5kLTUxaocSq+k5mSbuvl9DWlxrNvXNmXBfRA11w/xmSfWR/gm7gvjjJz
	mArnXVcp1QgRA3wpy6TG5RdsRNxcbm4OGQ0Eqf3id4qm7MVkrrstCM+3IlYNSc7Lss0S5lliOfc
	ouGG0XzDpEOqMak0qIDqTOO2zIpaVRcDgB39paVbEd5Reh1RYs04FbNjiuapcMrY6WErpw6JXH4
	e2sDudXrl49jEu1IPkF4MsYX6oFk5NNs5ycZuYmhpnN3q98veLH9G4k7rf3B1YHUhvH2J1vAAS6
	GUmhYb/m8oUGmuPkoL45kBknzDU8EXDknVYSAhEdZmmHQUFjL44rEJCP9vF/HIUSVvlQTPnPAX0
	/MrACDab4m5l16vvWBZ6JcqnXSjNB3fod2QP+8zByxJ09gIes/e+toXeX+/dS4WJhfX8/LS4rWO
	MGk/NS3HuXEH8qObIfiI84p0BkDxZKCAHhhA9TtzLOJDFpGXGRj/0pXV/4uLo0S5nLog+hxzpA6
	8riSYtsnZftzA==
X-Received: by 2002:a05:7022:438c:b0:134:a6f0:6f08 with SMTP id a92af1059eb24-13632f60d3amr652796c88.39.1779340428152;
        Wed, 20 May 2026 22:13:48 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:d457:597:d576:1eb8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-135e5c0a918sm6231360c88.14.2026.05.20.22.13.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 22:13:47 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Wed, 20 May 2026 22:13:21 -0700
Subject: [PATCH v2 5/5] sh: mach-rsk: rsk7203: convert pin configuration to
 using software nodes
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260520-rsk7203-properties-v2-5-465f3308021b@gmail.com>
References: <20260520-rsk7203-properties-v2-0-465f3308021b@gmail.com>
In-Reply-To: <20260520-rsk7203-properties-v2-0-465f3308021b@gmail.com>
To: Rich Felker <dalias@libc.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Arnd Bergmann <arnd@kernel.org>, linux-sh@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org
X-Mailer: b4 0.16-dev-6911d
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32894-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 1BBCE59EF60
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Replace legacy gpio_request() calls used to configure function pins
(SCIF0 TXD/RXD and LAN9118 IRQ) with software nodes describing GPIO
hogs. These hogs are attached to the PFC gpiochip node, allowing the
GPIO subsystem to automatically configure these pins when the driver is
registered.

Assisted-by: Gemini:gemini-3.1-pro
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 arch/sh/boards/mach-rsk/devices-rsk7203.c | 97 +++++++++++++++++++++++++++----
 1 file changed, 85 insertions(+), 12 deletions(-)

diff --git a/arch/sh/boards/mach-rsk/devices-rsk7203.c b/arch/sh/boards/mach-rsk/devices-rsk7203.c
index f8760a91e2f1..e8a8fc1d2ca9 100644
--- a/arch/sh/boards/mach-rsk/devices-rsk7203.c
+++ b/arch/sh/boards/mach-rsk/devices-rsk7203.c
@@ -12,7 +12,6 @@
 #include <linux/smsc911x.h>
 #include <linux/input.h>
 #include <linux/io.h>
-#include <linux/gpio.h>
 #include <linux/gpio/machine.h>
 #include <linux/gpio/property.h>
 #include <asm/machvec.h>
@@ -131,6 +130,56 @@ static const struct software_node rsk7203_sw3_key_node = {
 	},
 };
 
+/* The base of the function GPIOs in the flat enum */
+#define SH7203_FN_BASE GPIO_FN_PINT7_PB
+
+static const struct software_node rsk7203_pfc_functions_node = {
+	.name = "functions",
+	.parent = &pfc_gpiochip_node,
+};
+
+static const struct software_node rsk7203_txd0_hog_node = {
+	.name = "txd0-hog",
+	.parent = &rsk7203_pfc_functions_node,
+	.properties = (const struct property_entry[]) {
+		PROPERTY_ENTRY_BOOL("gpio-hog"),
+		PROPERTY_ENTRY_U32_ARRAY("gpios", ((u32[]){
+			GPIO_FN_TXD0 - SH7203_FN_BASE, GPIO_ACTIVE_HIGH
+		})),
+		PROPERTY_ENTRY_BOOL("input"),
+		PROPERTY_ENTRY_STRING("line-name", "TXD0"),
+		{ }
+	},
+};
+
+static const struct software_node rsk7203_rxd0_hog_node = {
+	.name = "rxd0-hog",
+	.parent = &rsk7203_pfc_functions_node,
+	.properties = (const struct property_entry[]) {
+		PROPERTY_ENTRY_BOOL("gpio-hog"),
+		PROPERTY_ENTRY_U32_ARRAY("gpios", ((u32[]){
+			GPIO_FN_RXD0 - SH7203_FN_BASE, GPIO_ACTIVE_HIGH
+		})),
+		PROPERTY_ENTRY_BOOL("input"),
+		PROPERTY_ENTRY_STRING("line-name", "RXD0"),
+		{ }
+	},
+};
+
+static const struct software_node rsk7203_irq0_hog_node = {
+	.name = "irq0-hog",
+	.parent = &rsk7203_pfc_functions_node,
+	.properties = (const struct property_entry[]) {
+		PROPERTY_ENTRY_BOOL("gpio-hog"),
+		PROPERTY_ENTRY_U32_ARRAY("gpios", ((u32[]){
+			GPIO_FN_IRQ0_PB - SH7203_FN_BASE, GPIO_ACTIVE_HIGH
+		})),
+		PROPERTY_ENTRY_BOOL("input"),
+		PROPERTY_ENTRY_STRING("line-name", "IRQ0_PB"),
+		{ }
+	},
+};
+
 static const struct software_node * const rsk7203_swnodes[] __initconst = {
 	&rsk7203_gpio_leds_node,
 	&rsk7203_green_led_node,
@@ -141,6 +190,10 @@ static const struct software_node * const rsk7203_swnodes[] __initconst = {
 	&rsk7203_sw1_key_node,
 	&rsk7203_sw2_key_node,
 	&rsk7203_sw3_key_node,
+	&rsk7203_pfc_functions_node,
+	&rsk7203_txd0_hog_node,
+	&rsk7203_rxd0_hog_node,
+	&rsk7203_irq0_hog_node,
 	NULL
 };
 
@@ -165,26 +218,46 @@ static const struct platform_device_info rsk7203_devices[] __initconst = {
 	},
 };
 
-static int __init rsk7203_devices_setup(void)
+/*
+ * The pfc-sh7203 device is registered at arch_initcall level, and the
+ * sh-pfc driver (registered at postcore_initcall level) probes as soon
+ * as the device is created.
+ *
+ * We need to register our software nodes at postcore_initcall level so
+ * they are already present in the system when the driver probes and
+ * tries to apply GPIO hogs.
+ */
+static int __init rsk7203_sw_nodes_setup(void)
 {
-	struct platform_device *pd;
 	int error;
-	int i;
 
-	/* Select pins for SCIF0 */
-	gpio_request(GPIO_FN_TXD0, NULL);
-	gpio_request(GPIO_FN_RXD0, NULL);
-
-	/* Setup LAN9118: CS1 in 16-bit Big Endian Mode, IRQ0 at Port B */
-	__raw_writel(0x36db0400, 0xfffc0008); /* CS1BCR */
-	gpio_request(GPIO_FN_IRQ0_PB, NULL);
+	error = software_node_register(&pfc_gpiochip_node);
+	if (error && error != -EEXIST) {
+		pr_err("RSK7203: failed to register PFC software node: %d\n",
+		       error);
+		return error;
+	}
 
 	error = software_node_register_node_group(rsk7203_swnodes);
 	if (error) {
-		pr_err("failed to register software nodes: %d\n", error);
+		pr_err("RSK7203: failed to register board software nodes: %d\n",
+		       error);
 		return error;
 	}
 
+	return 0;
+}
+postcore_initcall(rsk7203_sw_nodes_setup);
+
+static int __init rsk7203_devices_setup(void)
+{
+	struct platform_device *pd;
+	int error;
+	int i;
+
+	/* Setup LAN9118: CS1 in 16-bit Big Endian Mode, IRQ0 at Port B */
+	__raw_writel(0x36db0400, 0xfffc0008); /* CS1BCR */
+
 	for (i = 0; i < ARRAY_SIZE(rsk7203_devices); i++) {
 		pd = platform_device_register_full(&rsk7203_devices[i]);
 		error = PTR_ERR_OR_ZERO(pd);

-- 
2.54.0.669.g59709faab0-goog


