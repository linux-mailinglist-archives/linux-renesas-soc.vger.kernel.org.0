Return-Path: <linux-renesas-soc+bounces-20558-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C847B27C83
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 Aug 2025 11:17:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E589662201B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 Aug 2025 09:12:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90BBB261588;
	Fri, 15 Aug 2025 09:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="lM5FrsUA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 530A22D6632
	for <linux-renesas-soc@vger.kernel.org>; Fri, 15 Aug 2025 09:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755248976; cv=none; b=br0RhaxM315Gg8azWrHyWSNFczy5HwGQ36YCx/qKfZX9bwRGu5tJ7/xmIuy62kRmVMGXtC4Xd/XUv4Ha9WX4tUFQHeoYdMeRb+oXsm32JanL3+/a9mpXfjeqpu4aQ2nPCmKBrVSPddFOtTLQfp3/en0gecSql/ynuR5Ix1kNyJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755248976; c=relaxed/simple;
	bh=8LckYYbv7wEiVDCoVOTbwt+nYJz1zV0AkW539eEIzwQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U0TzNwAStKkpsHDjJqRu3pgbevM9pJUNO8JMtrKHUHNeU0ugGlFWkjLpuzxrS7GhhQmF9Ju4TkiyJ6D/wZ48L73tmYrIrQ9B7qVWhD3oMYSJkyz6YTnJHi8TPh1EvM0Bg9AdSObQ15LkEpJicKWzQz/yogswXdvedg2wB69tB2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=lM5FrsUA; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3b9e4106460so1534807f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 15 Aug 2025 02:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1755248968; x=1755853768; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rcnhHIb6eNEwdjxZYrigpF4SQxNgYqLi3t6s+DqhmIc=;
        b=lM5FrsUAZ/iISpG3qH9ZcIwprw9a5mb+dMU/g6T6QSymbTgFeTxAkspSvMpcpse1vX
         e7JoFpggf74TCyxb5FdkCnvLW3j2g18xAcE2qJ3vvChrPhog8VNXh0xJ7VFdHYFy7ERr
         EGBxg0aNma3d6CIMpENev5u4bMuV21t/RsaW0Jqp9hWEakUJNOrkfU7GWOLSPHwGM35g
         BA32azQjH4cGCKMs3D/efysAK7DDheWxS4YH0CiaA/KkQ6uGEFsIFXdoEpWidxCJL46n
         z7MoS5/mHxaFU6lUzDNrbMp6+OxrzlbN1+ROiJA9XiFvXOJSI98PHx8P4mLyapK7X3fc
         zJvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755248968; x=1755853768;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rcnhHIb6eNEwdjxZYrigpF4SQxNgYqLi3t6s+DqhmIc=;
        b=BBKSKFGSzpeVgSh3n5iE2u12Lx8VP+jHBvlUMuJC21FIk6GPY5hRHSGEcGSNDg3jcR
         eQizMgHjqTHULQHJ97hbwAko4eaft6yZLiJxofB0o5UbmnZKzOGXUd+w+aEjyD8NEWlx
         8soS0SxJ5EVJANvT4BAvEU0HXOil/T10w10IcN6w7bbIuWkZzBcLHArK0/rSheJ9itn4
         bWGCBEHX8Gmf7PmLgVozgksdRcISmASY/kPx9Xd44EK7FkJbN5oMakHgYVUAuw+X63W3
         wIpNR+O/TqAaMyQ0cgRv4PoqiwQ2/5lOkPlL8oJBQIxam9GA8Db1lS+7SzAsmQ+YudDV
         4xjw==
X-Forwarded-Encrypted: i=1; AJvYcCXlTnPnJsjJJXqJX6OMlfnadgM58wKvbGK5H/iZLcA43+d0Wb+KiuzASKsslwoFRScPpPfEQ7yfiTKiBQPDnBUA1g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZEB2HKOdnJFkpcNME3Uzjz1Kx/2XLuQwMkEVLM10N1XKDMcHJ
	jA8AEbTz/W2/wuAOZ87la64ioWhANU51GtBubFs03pDN9md0sTpaPyRAdiiHEuWaEBE=
X-Gm-Gg: ASbGncsvpnk54hMF91EDExqVOkghcz8qRWp75X9kIK4rNc9za/XCzcrWrXQjho7JY2O
	jz/ltWdGSSRV1ayUj/znt2710w/NDByqSf6Dp1yVWVaLyY5GMGS36gB3KDTSAem2CBS5IwTdqb0
	QExUctAXAxfFmbQL2QPPfXlNK+zUvM6j1Ckcnk52G0wPofN6n278BpbVVdENyXE+5Ixk9Yywd89
	kdCGFdYxwW9rJrpYDS2If6TUfdD07pdjFeeXJhSDbnXlP2dDtVLR5bwH9j8rirpymtovtrDbkyQ
	YpgQgdZkVUjpFFwoA20PBtfQqadT6VpWnumJqfqsr2/VMQMvXoMCGileVJvEz97xPGbotdcFSOi
	yaEF4DCLsQTTXx0501w==
X-Google-Smtp-Source: AGHT+IECk334T6DAR4a8TS6EmWlh7UZ1cAoTGRWibGBdabTMKZmowz1e9Ft1rEqZaj0/xx+92lKCEg==
X-Received: by 2002:a05:600c:3596:b0:458:add2:d4b4 with SMTP id 5b1f17b1804b1-45a21803ebdmr13438335e9.12.1755248968009;
        Fri, 15 Aug 2025 02:09:28 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:a125:bd3e:6904:c9f9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3bb676c9a67sm1205210f8f.35.2025.08.15.02.09.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 02:09:27 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 15 Aug 2025 11:09:09 +0200
Subject: [PATCH v5 07/15] pinctrl: keembay: release allocated memory in
 detach path
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250815-pinctrl-gpio-pinfuncs-v5-7-955de9fd91db@linaro.org>
References: <20250815-pinctrl-gpio-pinfuncs-v5-0-955de9fd91db@linaro.org>
In-Reply-To: <20250815-pinctrl-gpio-pinfuncs-v5-0-955de9fd91db@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Alexey Klimov <alexey.klimov@linaro.org>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Paul Cercueil <paul@crapouillou.net>, Kees Cook <kees@kernel.org>, 
 Andy Shevchenko <andy@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@redhat.com>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
 Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 NXP S32 Linux Team <s32@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Tony Lindgren <tony@atomide.com>, 
 Haojian Zhuang <haojian.zhuang@linaro.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
 linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
 linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1867;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=qPaUa8oAewMMgl8vCYU8JU6h4WrDoK89nonD2PTBKh4=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBonvk49vTvI4Yqki2vhfowvJ8itgBed07OfvWWP
 1IW0D/2sAiJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJ75OAAKCRARpy6gFHHX
 co8/D/9RViTI69yJDAM4EMnxpBHjTbkjgLCo5+12MdD6irQvlPH7WAMDEHdgXHTfPuZCBslRHDn
 F681CDNXek0ARfTKOVwzdElXzOuvo5lfXVhpGWSo6l/hIEvn/8FvOQKWjbblDOQBRaPA4kW/SsT
 PX0h2zSSKtBSPAgqPlNsj3Hrjk02z5swiKfVNby/Rf75Gmt3jrn1gicqYNy4XvAdvk8MfssoZ67
 ILV1I34DYFex70AWKbHeILC0np2n1j0JNkhqPrZW98Pb8Fs0D2ZBVUAWwSBYZHOTEJvcetF0ptk
 hgBOxHPAlBP1/ZOqzemRwR6dI9QFVOBr7WXCBrHngAGalo4je2J0NXKdLUKMdxskRm4eC4yalT9
 vRvVjU/79HbKWhgGWCMMx5Yqu4cn8xAgkTtnpB382uQCJA33DiwPkovDMv+sdXi6PT3XORi6b2C
 dw4oNnImVUmuboHfeuZ2yL1MBZjfbpanOwrJp9ctvS1yWQHZG5n42OosyJncBXExsKHd+EdepP7
 UdKsNk5KwjnxNWyAi4y2GVvTE9N8ZJNJlbjNuGv2CIE2tr7kd/JRzZaj8hvlYwXIdp0un3ZUhX8
 ut8bcXSn36AAFe5iXHWX0OLQHgarcKs4M1EDx+6cfYjBM8lnOjLezxbetYfeTZSYpZEZMac2O3I
 zIs9a+PBsdnaHXg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Unlike all the other allocations in this driver, the memory for storing
the pin function descriptions allocated with kcalloc() and later resized
with krealloc() is never freed. Use devres like elsewhere to handle
that. While at it - replace krealloc() with more suitable
devm_krealloc_array().

Note: the logic in this module is pretty convoluted and could probably
use some revisiting, we should probably be able to calculate the exact
amount of memory needed in advance or even skip the allocation
altogether and just add each function to the radix tree separately.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/pinctrl-keembay.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-keembay.c b/drivers/pinctrl/pinctrl-keembay.c
index 60cf017498b32a9f36a1f8608e372951c2b8f12a..6aefcbc31309995ec1e235416b40aab3e4a073a9 100644
--- a/drivers/pinctrl/pinctrl-keembay.c
+++ b/drivers/pinctrl/pinctrl-keembay.c
@@ -1603,7 +1603,8 @@ static int keembay_build_functions(struct keembay_pinctrl *kpc)
 	 * being part of 8 (hw maximum) globally unique muxes.
 	 */
 	kpc->nfuncs = 0;
-	keembay_funcs = kcalloc(kpc->npins * 8, sizeof(*keembay_funcs), GFP_KERNEL);
+	keembay_funcs = devm_kcalloc(kpc->dev, kpc->npins * 8,
+				     sizeof(*keembay_funcs), GFP_KERNEL);
 	if (!keembay_funcs)
 		return -ENOMEM;
 
@@ -1634,7 +1635,9 @@ static int keembay_build_functions(struct keembay_pinctrl *kpc)
 	}
 
 	/* Reallocate memory based on actual number of functions */
-	new_funcs = krealloc(keembay_funcs, kpc->nfuncs * sizeof(*new_funcs), GFP_KERNEL);
+	new_funcs = devm_krealloc_array(kpc->dev, keembay_funcs,
+					kpc->nfuncs, sizeof(*new_funcs),
+					GFP_KERNEL);
 	if (!new_funcs) {
 		kfree(keembay_funcs);
 		return -ENOMEM;

-- 
2.48.1


