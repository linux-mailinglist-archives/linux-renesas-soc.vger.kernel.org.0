Return-Path: <linux-renesas-soc+bounces-32893-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iPy4CLCUDmrJAQYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32893-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 May 2026 07:14:24 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C097659EF79
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 May 2026 07:14:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1EB6F305DA90
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 May 2026 05:13:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B554352010;
	Thu, 21 May 2026 05:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AKhrjeO3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ACAB33AD9C
	for <linux-renesas-soc@vger.kernel.org>; Thu, 21 May 2026 05:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779340430; cv=none; b=kAcT8fEsYgdhtbdg8Hgb2icqTIyQamfWV/Y0ATDXvXp9u6jTrhoGxBRGRbjnm9WbV5h/kbBeTjb/7kWA31mxKCotgoV3w9GoOxe5pMPmedbnlHyhqsfetYRYcUXX7aST7mbxI7P0XRu5ioj2Xl9LNH8OIbLXJqa/qRn15d+5/3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779340430; c=relaxed/simple;
	bh=a7LlH6SOmxH0p4iNAX3qrUusbYFuA/lKO8UCM5Mh+y0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ppnpJ2YCkEbwpSuDd8B81WiIQUtDnKeT+73Pk13gqoBSfcDnOpI0Jwc4dwDI2lWQOFMQQCOJshVrBsRDWNsp8ohZG6SSrHj1SUTBIsDOoXDKHGolHdst/M3Edg2Un/RhrrViIKqhcEBScR6u4pa+SM5ISaAR1i4Uo9ZN9V7TajE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AKhrjeO3; arc=none smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-132c338a537so3991539c88.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 20 May 2026 22:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779340427; x=1779945227; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7YPZxWestxZ6ZeoppNL4aB518UjR8C+o/ws24cKnfpM=;
        b=AKhrjeO3oWo3pW7+XGNc8WEgP/k6/fsJlceeHmT0JIHBANdMvdcP+6fa1aUfysrC9J
         wGdddDCExUc58mZV41UnZXpzz0k7DySu8idWofIDSS9LYgAd/6VOO9YW6ho9jI15i4hO
         XCkwZDvGFJGzOGYyUmmXCrG4fKn1QsQkeHparjLgXEgsc7jAg00ulnkbeYn+YPRdc0K5
         UF8Rq2m9TNDbv6DoqXf0To4Y4E9HFa+BaCrHlDVsp8ihqicQyYpeKwd/tod+krYIpW+A
         dDb/VsCFSbgO5PQCovYI+0/rD5CUYRxjNb24bK5K9nR8gjVfpKUkS4rTsy7MMkY834SA
         nIxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779340427; x=1779945227;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7YPZxWestxZ6ZeoppNL4aB518UjR8C+o/ws24cKnfpM=;
        b=KqyDCmLfhGe457KiJxzIu3Rf8q/dW8Xl7koa0jvabwX4cfHqBVfXeTXfEhdwS7AkI+
         uh+abOqK2bDkf4I6uzm45DoVpbmmXLIFKwJ0QUYpMVErPNRjYcaYdBFce47qOoK/flwp
         +Wpa1uDQjbxXutpgF1H6o2pav70oqfPTtUQi/TM2jFhlD9zQ3SdiETrC+o3jO/xzWQ4R
         NuehZcITY1BjUgTfV5tW9RBRaCUDiBO4tQm+nAYxZImYGrOjZ0LG3Di3e3GwnBe9d7dZ
         Crjn+vGcT6Rzh9eqH390mSgeXOdKVQS8k2MwKC9LfhTMo+cNgSc3yx68ZMQXQSLfaxNo
         msFg==
X-Forwarded-Encrypted: i=1; AFNElJ8zWYyHkCK813ahR2+X+WOrOg7cJkQC4I2Xx6qDPmO/ISZKLl0paYdWbLpe8hVERF/IDo8TLIX6IuXQRfElYpOglw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9qbYj9oeoIq7hHrlEfHdBlf450hPqcE6H/R5kxJcq4pWiJfZZ
	9gyHz//cuiuxSsuEFp61nimAQzCsc5KMCh9zrjNSoPktGgE+OhSLYP5RU40DkA==
X-Gm-Gg: Acq92OFSpUWoE5fjHQbeHwS5J+UhAiyKkEcp3sfBjFi7Iv/+R26G0xITvJ2PPmKjzui
	z4oTIKEIzVzpQCyBfWFzBEcjM9EwCrW9GP49D347RCuFNWMw6SbX20gRMciLtJavq9RkioblB2S
	EGegMSzHICBLGKt8Z9E+Du3s4UXKs/8pNFBPFDVf2hFtJlYoAfRapAB8hsqM3N4Ko7PmLSJj94s
	Y4/+fCdiF9xUQRNHziruB7D56DftriDpznU3Ol/1UiVg/ydbwdRC7JPDawCPfaTWyQVpUvW8owT
	nzxtUlpxFD23Ty0fCP/NCJFEuDzNyc4A1fK5M8fJfk8p3CeXWbJNqceVI/rGBx2zPN3Er5QMzQw
	piwF0zdiLsg7RwFMF9XbfGXyHm12v/miNuMnE03q/a8kg2t0zLPFU/cfSqz4BE96uC8Z5sy2K74
	lP+S7D3DAUHFqi7bIMD9LaWK7RCkXEvltsHeyYkeseN4NeilLMMlERejP3rgmCxYpumhlRATCQ1
	qO/g6LXPnupzk2OBvogAPye
X-Received: by 2002:a05:7022:f91:b0:129:1d25:f1da with SMTP id a92af1059eb24-13633a69b63mr617788c88.3.1779340426708;
        Wed, 20 May 2026 22:13:46 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:d457:597:d576:1eb8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-135e5c0a918sm6231360c88.14.2026.05.20.22.13.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 22:13:45 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Wed, 20 May 2026 22:13:20 -0700
Subject: [PATCH v2 4/5] pinctrl: renesas: gpio: support software nodes for
 function GPIOs
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260520-rsk7203-properties-v2-4-465f3308021b@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32893-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: C097659EF79
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This patch extends the sh-pfc GPIO driver to support software-node-based
configuration for the secondary 'function' GPIO chip.

While the primary GPIO chip typically uses the firmware node attached to
the parent platform device, the secondary chip should target a specific
child node to avoid ambiguity when defining GPIO hogs or properties.

Update gpio_function_setup() to look for a child node named 'functions',
but only when the parent is a software node. This ensures the behavior
is restricted to legacy platforms being migrated to software nodes.

Assisted-by: Gemini:gemini-3.1-pro
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/pinctrl/renesas/gpio.c | 28 +++++++++++++++++++++++++---
 1 file changed, 25 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/renesas/gpio.c b/drivers/pinctrl/renesas/gpio.c
index 4e59dadb7364..b49a3e14da91 100644
--- a/drivers/pinctrl/renesas/gpio.c
+++ b/drivers/pinctrl/renesas/gpio.c
@@ -271,18 +271,40 @@ static int gpio_function_request(struct gpio_chip *gc, unsigned offset)
 	return ret;
 }
 
+static void sh_pfc_fwnode_put(void *data)
+{
+	fwnode_handle_put(data);
+}
+
 static int gpio_function_setup(struct sh_pfc_chip *chip)
 {
 	struct sh_pfc *pfc = chip->pfc;
 	struct gpio_chip *gc = &chip->gpio_chip;
+	struct fwnode_handle *fwnode = dev_fwnode(pfc->dev);
 
 	gc->request = gpio_function_request;
 
+	if (is_software_node(fwnode)) {
+		fwnode = fwnode_get_named_child_node(fwnode, "functions");
+		if (fwnode) {
+			int ret;
+
+			ret = devm_add_action_or_reset(pfc->dev,
+						       sh_pfc_fwnode_put,
+						       fwnode);
+			if (ret)
+				return ret;
+
+			gc->fwnode = fwnode;
+		}
+	}
+
 	/*
-	 * Explicitly mask the parent's fwnode to prevent gpiolib from
-	 * reusing it for function GPIOs.
+	 * If we did not find 'functions' node, explicitly mask the parent's
+	 * fwnode to prevent gpiolib from reusing it for function GPIOs.
 	 */
-	gc->fwnode = ERR_PTR(-ENODEV);
+	if (!gc->fwnode)
+		gc->fwnode = ERR_PTR(-ENODEV);
 
 	gc->label = pfc->info->name;
 	gc->owner = THIS_MODULE;

-- 
2.54.0.669.g59709faab0-goog


