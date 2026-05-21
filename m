Return-Path: <linux-renesas-soc+bounces-32891-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SPUrCpGUDmrJAQYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32891-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 May 2026 07:13:53 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B7059EF47
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 May 2026 07:13:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 31603304C4D4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 May 2026 05:13:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D596F33F8B4;
	Thu, 21 May 2026 05:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KezolyL+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 654E8352010
	for <linux-renesas-soc@vger.kernel.org>; Thu, 21 May 2026 05:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779340425; cv=none; b=lSoqToZz9yGeLfNrj2vNX4tllFee3o8/KNUuyPp09ByvDFDM6Wu+FaEFqCIWjeWvcvcY/7/YNUIYznjEPbU/dadAHY8YSx2AlUjfSIwP9KxpkjsrSx66cnKgorqs285TEORyRp/DNHG9o7TCL+4A0V9iBrBs/ZAArovUHEnhxfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779340425; c=relaxed/simple;
	bh=an2XKnw/6oNRYjivHk/fQLnrkcFYlk+CGyiYpwsGnhE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RlhSW8yYjlx2uoqqM8p+R+mhAJhm4Fnglf3BCdoHMjA9XlHy9P9FMf3J4v/u6WlUrqXgkREQmoT8pjKRC2+9hO5bzhdsyntfNeD/HLVsnXkmtiVO/VlJta9nCWsdjKlPUpCjPnxwy1rGS11JfSHG5V5WpvFl3oodn8Vpl8fQYbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KezolyL+; arc=none smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-135e88b8e55so5933611c88.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 20 May 2026 22:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779340423; x=1779945223; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pXtisoK8i0cyvAoaHE4OQcmxs5XHz2jUEn0crM4CfGY=;
        b=KezolyL+vcKcS0eaIMl9nVTayU0vlKDWYQzWJSUqrlkQYefXHEWVu6Az4W+gq2njSz
         E+mK3BZA9DLp+bpJg+AbWc7o82rCzuIkoNrj3RtaMm0Yp753kn0XJ3DFsdVTj8Hw+e7z
         n4Vd8T7kZC89snFgCjMtiNrnk644CM1gf7WWPI4yvs+VVkNiF3t/biR7Rbozw0EaHNfz
         Ge7aWvxCiViZLkKOafU5ZZHLWfuGIuqsVvFuDdMN6oCYo8QMPRoeJCPlzr+FvRRyahEp
         lBEKI5YoUyncn3q+QE0h9NeVdtCIQy7NkimmBT6lK3KzN/9H0jBYqZtxEsAYOvY9s3mS
         o/Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779340423; x=1779945223;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pXtisoK8i0cyvAoaHE4OQcmxs5XHz2jUEn0crM4CfGY=;
        b=Dl2b+y+HkWxW1H+9VK4jiEO9Dihi7Y049Lw/7sMu7Kw7NWTUZ4budWjzPUQxZefJYw
         nSt2MWx1Y7uaR/blE3+VhBzVAGbaigMk5OlmhGIKgPq/3o9M2xp4P4Sz1Yw7vW4+lLHt
         dbl/Q/aQ2CkRfsYDG4SvMDctAXsBUygq3uFDRWjVrbZaDRWAS8xwgL+HyPwYiB7eE9bk
         9vv2/iGUiqGLPES7TS4BITYVxGCaNA7sfBwJKOQfrdM5V9RTQhHQfXew8plLcsSiO1I9
         rmPScD4IiVt4orxPXIajVnws6k3hPBd3QTncg1u8w0K6s/RBW6OkbAvxxKg9SLWYJtSl
         Cp0Q==
X-Forwarded-Encrypted: i=1; AFNElJ8Rf87QkzGqESpYVt1YlaWvQ2NbAQxv5h/y6tH++CeiU+EC5duVLStvH+0+Dn7nNJ+PeFNnakZ0n0Zdoc0f2W4TmQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyleomu+cmOtdgwheI0ZRcn74jNRFmhq5kylwgIz4aTISllvQS0
	VpNnJn8urnw8LnufBjeh0gbytto964joD6Tm1wxpJ7otcZUErpOaATpL
X-Gm-Gg: Acq92OFfVygIJzPrlduDmm0LoCYqRASYCrMcQnZKF3pu9QlLGdVx+cuUhGGtInDC9+W
	Nhb8GebKqpDG3mSUMKplWnxQV6EPvojiN2uP3J2vBidq80Vrtd9yebIeRVZc/ZIeG5hBu54Eslv
	oVYXcb3eOcSiEZ44GxPYVSJXPiv6IaqaeLsd3+toSwbALXDACxRXouJc/Dq6FRXPE/WNh6s3c3c
	tTJA9TbgJB3fPKCPCeO51oAmPs3dRchZ1E9toeElitmS/qjFAHwCZD7Wk8KwjDd7GbcyF+rH0CK
	/bfeB7Y7nP9MsPU5qSVYZHr0ooKT/MTeZj60Tmnk34t0OGxQZnNRPwZN53FWLZGqTJBc2kJzWdd
	CpsMFhpT0LmMljfldNnXWU/B72UpjStFHyvJLHoqdUE7EM+UC/WKOPBeKjGzMd8ZnheN3Qnnsqq
	5dI0JpA9xkLUH/K18q7ziH0PGlPSoim9b4anl/5ELh9VEctpey2++1b0naLlDl01ArG69G7BEVb
	OKprqdxLHnqiQ==
X-Received: by 2002:a05:7022:61a1:b0:12d:b26f:cafd with SMTP id a92af1059eb24-13632a02cf3mr857042c88.5.1779340423478;
        Wed, 20 May 2026 22:13:43 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:d457:597:d576:1eb8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-135e5c0a918sm6231360c88.14.2026.05.20.22.13.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 22:13:42 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Wed, 20 May 2026 22:13:18 -0700
Subject: [PATCH v2 2/5] sh: pfc: attach software node to the GPIO chip
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260520-rsk7203-properties-v2-2-465f3308021b@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-32891-lists,linux-renesas-soc=lfdr.de];
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
X-Rspamd-Queue-Id: 94B7059EF47
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

With commit e5d527be7e69 ("gpio: swnode: don't use the swnode's name as
the key for GPIO lookup") gpiolib requires that firmware nodes from the
GPIO references to match firmware node in gpiochip structure.

Define a software node for the pfc gpiochip so that it can be referenced
by boards using static device properties.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 arch/sh/include/cpu-common/cpu/pfc.h |  3 +++
 arch/sh/kernel/cpu/pfc.c             | 20 ++++++++++++++------
 2 files changed, 17 insertions(+), 6 deletions(-)

diff --git a/arch/sh/include/cpu-common/cpu/pfc.h b/arch/sh/include/cpu-common/cpu/pfc.h
index 879d2c9da537..d57e38c05bdb 100644
--- a/arch/sh/include/cpu-common/cpu/pfc.h
+++ b/arch/sh/include/cpu-common/cpu/pfc.h
@@ -11,6 +11,9 @@
 #include <linux/types.h>
 
 struct resource;
+struct software_node;
+
+extern const struct software_node pfc_gpiochip_node;
 
 int sh_pfc_register(const char *name,
 		    struct resource *resource, u32 num_resources);
diff --git a/arch/sh/kernel/cpu/pfc.c b/arch/sh/kernel/cpu/pfc.c
index 062056ede88d..5a8d804d607b 100644
--- a/arch/sh/kernel/cpu/pfc.c
+++ b/arch/sh/kernel/cpu/pfc.c
@@ -5,21 +5,29 @@
  * Copyright (C) 2012  Renesas Solutions Corp.
  */
 
+#include <linux/err.h>
 #include <linux/init.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 
 #include <cpu/pfc.h>
 
-static struct platform_device sh_pfc_device = {
-	.id		= -1,
+const struct software_node pfc_gpiochip_node = {
+	.name = "sh-pfc",
 };
 
 int __init sh_pfc_register(const char *name,
 			   struct resource *resource, u32 num_resources)
 {
-	sh_pfc_device.name = name;
-	sh_pfc_device.num_resources = num_resources;
-	sh_pfc_device.resource = resource;
+	struct platform_device_info pdev_info = {
+		.name		= name,
+		.id		= PLATFORM_DEVID_NONE,
+		.res		= resource,
+		.num_res	= num_resources,
+		.swnode		= &pfc_gpiochip_node,
+	};
+	struct platform_device *pdev;
 
-	return platform_device_register(&sh_pfc_device);
+	pdev = platform_device_register_full(&pdev_info);
+	return PTR_ERR_OR_ZERO(pdev);
 }

-- 
2.54.0.669.g59709faab0-goog


