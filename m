Return-Path: <linux-renesas-soc+bounces-20552-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BD7ABB27CC0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 Aug 2025 11:19:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ED35FB01C21
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 Aug 2025 09:10:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DADD02D0619;
	Fri, 15 Aug 2025 09:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="IXJX5EWD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF214271444
	for <linux-renesas-soc@vger.kernel.org>; Fri, 15 Aug 2025 09:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755248963; cv=none; b=H8cX/hx5tOCETs5GVCFnuNp8MJS1GCSehOHXRG2KSGHA5ENvAHFVids0a/X+DhJfvDEz5ohhxSV4dqfhhIaa+hhFxwmxhAx+EszTZ8pPevgtdTBv0IldLToCZ9CeOXS5lxVuIyyL80zyeAeouF9ebGqXljUhFBz1Q2kMFb3hGRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755248963; c=relaxed/simple;
	bh=FCHL/kjtWeV0+j9xlgMQg6HU/vJCfHILk378t4N4z30=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lw8bvTnStEl0kTA1WAAWAVw9sb1FaINivZFZ3Hj9Q7KaYXIzjqqltmmwaX2AyLGjpH1z851xnrW9tZj5sOz1SFYBTW0TgvPZQ8cQ9xFgaJoZLSOAPErXZnroJOWubU5AniVXfL8ww2gJpcY2gkoN4xSN2W1mnP2JQDqTRoyu4/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=IXJX5EWD; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3b9dc5c8ee7so1266033f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 15 Aug 2025 02:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1755248958; x=1755853758; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jWxB7D3jJyBkITTYt/u8P0qX4HLXnEbcjEWeuCzP8c8=;
        b=IXJX5EWDcMdjcEK5M69gkT1xYHHrzrKxkhezxH/2ugp5ICDTE6XZOtCVnXN1f2R++k
         TvuFjbRCgoDcSVI6exrdEP5d13l7LIDCyINN3B2dlk+c73P+B0ntq/jeCgxKyR4q0+nW
         4vPVPGxXqI6t8FjWIzKjP0B2Kx1IYSCgyVcy6cGzGLcC0skPvy06Fl1RWS90Il3JTo58
         dtUzTpjmiroiUx7xgwBj6gObKOw5ljiNn9e8UFT/YpiihzUNgyiyVIrZA1C8F367CD8p
         nC97vsspsd4wfGEvhcT3Mp7fr6WEuVRTdEb5BSl5JlFaVtbqSn+EINmESlW9SFDC+UgQ
         76aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755248958; x=1755853758;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jWxB7D3jJyBkITTYt/u8P0qX4HLXnEbcjEWeuCzP8c8=;
        b=xHx2lsF6t++QxbwDYHO5H26hSzRM4zS03GL+M9YtZxvYwz2WXsXeefNvaxS8UjcAL1
         Vvz9iKPQSnuLkY3NOrMuCKs+UIWCJvGVYbCxu5ORIQct6iPWtWsfzdHqmjljBOI5Iy2P
         Zs38ZSGc62v8c2DPGAvk4fY5ikatBbH5ffGr8ZNx3Ovq/M60KVsh62a3DIK9mCxHFTlI
         ti337mbAb7hyr3p44KpaYjnvn8aO9qi3OBAQS/85iWqdJf7xi2cNUjndtjHLxrKi/Gg4
         w8Iqd1vhcpQWZLjPkwXQ5jGQXrNIYaeEDPGCQV4BhXjEAFSpaLFdeaX2lb94hY+I3Cvr
         afxQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2CZRRItx3FanazBhqgkFaR58tE1SQxV16JSMsKONK4kVpt2VU3Nm3iIeW2HwAf/rmkqbTtZF3dbuS8Ig2TLKG3g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yycjixh/asmKwjRzg0Ry7yZ2FTjQ/fWV7QcqutgoKeb83ZI/RLX
	ap2GeHnx0XaPWPmujIsyQ87XJGtFntD2TUok3hHvI4QNqA35SXcKF1ar6vfv22gjjL8=
X-Gm-Gg: ASbGnctEz3qVljOZ88Ru0wgY1MPP9OMW7gleUcxbAKUYo5gDRGOXhFkeGBFKB5C9xJm
	gQOqM6ODevvZsujA+Xtg4t6mLft4RqQKwcCSlTDiaMdODf1UYnnnqmo9Him3hA4/hCOhFwJBn1L
	TFV3lSH94rlhO+ihPtqZCD56hMHmPrbUiJjeVIDh6shuIDPDrCnIeqIXxoikupY8gmaoFmvBWWa
	4/sL05KnH/45SDaPMjQ1NgPQhPXoFnWa3a1df80AW8Domod0uQIGzwiHDDqvS7AmmPQbCvOQLTf
	CgfMCdkWcETxGzrHMLeByaLhEAk1axn57fhOxXcq7ftyu6mMW62i9GIyaMa6+gxPlwXkhvgE9k0
	IVZ4LptYiwhPUp8Vnzw==
X-Google-Smtp-Source: AGHT+IGnCJeDOqE3G4r581ayfk7huZyQHMOX+PmOKQXkUeS7zf7iEj9jqH6oiGPuorRj19lkyqveSA==
X-Received: by 2002:a5d:5d11:0:b0:3b7:810f:6caf with SMTP id ffacd0b85a97d-3bb68a1874amr1166149f8f.32.1755248957733;
        Fri, 15 Aug 2025 02:09:17 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:a125:bd3e:6904:c9f9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3bb676c9a67sm1205210f8f.35.2025.08.15.02.09.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 02:09:17 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 15 Aug 2025 11:09:03 +0200
Subject: [PATCH v5 01/15] devres: provide devm_kmemdup_const()
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250815-pinctrl-gpio-pinfuncs-v5-1-955de9fd91db@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2111;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=yGM1a+aC0va5PQYzRl7VigwSABEcy8VUGQM8wt+k8EA=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBonvk2b9jhbpZSR4bPSrpRtG6g+7NeYTvJmeHom
 mkeMTq5AUSJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJ75NgAKCRARpy6gFHHX
 ckzrD/9dpMT6eFmPjEdr9qjjRqAOs5l02AiDkl3dHtrzFi9yMxxW2FtEtRuxPAhpHPVWiHPN07r
 0RROaKlAKF++hEfZYnZedgxj3QWia5uQqkTZGIk1C6yktsS//GQGe0diPUrRMbSsMNANL6SA3Nx
 S4wRM4tUkMPqKt23QdTH5TWkZhIsNDbuDR8Zj4iNO/Oe9tiVLXFbPOslY91hsYRIOx+29AVkUu0
 nfRh3+Be+5nBAQc73pr8bf0gR8TwhJtXlQ4oMq6OGzCUWMZs0cTeSGFiQdzL6oP9De/SWcMCMPO
 3XA0BNI12lUneQ4UuYedE1N0KElf76XPTEx2UrholVQN+5KpqruqPKypec/HgHGhpMQv0ywBWUO
 kkjEJiumlJd7SzYJ+Cl7t9foAdOHlVGbHrSwhNNAsZ6NP4umioBGxWb3qFwna55mgCL1R1YynSo
 KPOx6RPkda84XsjOzlOwSqAPBufV3AON+YIKuJBUmKqGk5ba2nja9OqTYjlQEHBOeN2QmF05iUK
 z+4I82/CtLqSGznLLQbzoJu3sRwnPRgEc1iZEg8oYC/4IqFC6/noCf4YYYvIA7C03q+RTCyPCRn
 z465BIQ5H0TfkwTOj4sYbbMsTcq7N2mrfE+fqMp4J4jUxTAhjOXedXvSYOIXvvmYPQxWMphF+EQ
 nh1EvmLIpVJ9QHA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Provide a function similar to devm_strdup_const() but for copying blocks
of memory that are likely to be placed in .rodata.

Reviewed-by: Andy Shevchenko <andy@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/base/devres.c         | 21 +++++++++++++++++++++
 include/linux/device/devres.h |  2 ++
 2 files changed, 23 insertions(+)

diff --git a/drivers/base/devres.c b/drivers/base/devres.c
index ff55e1bcfa30057849a352c577bd32f1aa196532..c948c88d395607ff511ffa6eb0a75b7847ab9239 100644
--- a/drivers/base/devres.c
+++ b/drivers/base/devres.c
@@ -1117,6 +1117,27 @@ void *devm_kmemdup(struct device *dev, const void *src, size_t len, gfp_t gfp)
 }
 EXPORT_SYMBOL_GPL(devm_kmemdup);
 
+/**
+ * devm_kmemdup_const - conditionally duplicate and manage a region of memory
+ *
+ * @dev: Device this memory belongs to
+ * @src: memory region to duplicate
+ * @len: memory region length,
+ * @gfp: GFP mask to use
+ *
+ * Return: source address if it is in .rodata or the return value of kmemdup()
+ * to which the function falls back otherwise.
+ */
+const void *
+devm_kmemdup_const(struct device *dev, const void *src, size_t len, gfp_t gfp)
+{
+	if (is_kernel_rodata((unsigned long)src))
+		return src;
+
+	return devm_kmemdup(dev, src, len, gfp);
+}
+EXPORT_SYMBOL_GPL(devm_kmemdup_const);
+
 struct pages_devres {
 	unsigned long addr;
 	unsigned int order;
diff --git a/include/linux/device/devres.h b/include/linux/device/devres.h
index ae696d10faff4468a41f37b5d5fd679d4ff11997..8c5f57e0d613492fd0b2ec97dd384181608192fc 100644
--- a/include/linux/device/devres.h
+++ b/include/linux/device/devres.h
@@ -80,6 +80,8 @@ void devm_kfree(struct device *dev, const void *p);
 
 void * __realloc_size(3)
 devm_kmemdup(struct device *dev, const void *src, size_t len, gfp_t gfp);
+const void *
+devm_kmemdup_const(struct device *dev, const void *src, size_t len, gfp_t gfp);
 static inline void *devm_kmemdup_array(struct device *dev, const void *src,
 				       size_t n, size_t size, gfp_t flags)
 {

-- 
2.48.1


