Return-Path: <linux-renesas-soc+bounces-17598-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8590EAC676A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 May 2025 12:43:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 53A581BC70E7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 May 2025 10:43:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4859B28030E;
	Wed, 28 May 2025 10:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LhABzjRn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C1C280032
	for <linux-renesas-soc@vger.kernel.org>; Wed, 28 May 2025 10:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748428918; cv=none; b=h1EicHr4ibnESC/PVvwszxML8EjY6ZO8pts50GDMJguT1XxJic7VdVf6YqbZJsTbm9WjasGXLD/b++Nmc7UuXd2FnbJV9F0CShucqPuXnbrB/9h9atq33DScbl/snKwx/A5c7MqQ/ZRhJl5nPsBYM1fqV/CFhu4eojpjtao6V0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748428918; c=relaxed/simple;
	bh=ABHNDkrQtwVI0zXe6lhvrQu7yt9ZZOAkqbbG+yTdfqk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iH0mUS24QxB4hvItvDaLxsbcUjXDzGZVK9yD9FPYciJLA9iYu+ZySSpb3/Adlz9kZQEEGfiNQh2dX058Qz9RXTw6XTG0O8i24fgdaqQF5FwIOyBSfg1lZj6QwtDf/gw1+cPiOKyMzAlzRHW3OACoN0uyjtRA2zibeeSt3QcauoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LhABzjRn; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43f106a3591so5000925e9.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 28 May 2025 03:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748428914; x=1749033714; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4eqWfvPKnGs6dEV8KWDXklpALBHd/Gw82aMk/cyVxWg=;
        b=LhABzjRnYUUUXXPxOVI1V6tQiCx9IQHvAgamOunR1WnO8PdeE8wjlCV1VsbHboQMy6
         lur4hrHc4wG2jIrXjPEkmge9rgaZeww/ROJOvOnRwj3//5RjwaagXmdHbv/iP2mFHQCW
         ja+c/Cifaid+8GVM0JcfSwmbnGFgIuXgNluOmSsmWHxC0c7JmRM1Pw/92Sz7uxFBIkiJ
         fSsgDog02oSibRxDgLO6GlBEm2AVHQvjq2UJ6YbO6rejqK7IlEDDR8Gvs3WuUGHP4dr8
         pH8wxgdZOGOkkAwRTwyAzWxU1dtvw1ezGopsE48TNd3bHfIwDj8tpwNbOYiSCfNNxS0H
         tKHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748428914; x=1749033714;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4eqWfvPKnGs6dEV8KWDXklpALBHd/Gw82aMk/cyVxWg=;
        b=cigUd0xfM0f5lUB1q5Q77A4vlL5riFq0hmOrnL15P4ItGMMA7LA26wjE+Ldh99y/TQ
         i/HNVfPxdtY1wNfWe3ZN8foqPZAtffNfuUhAloPMdJD8O7HUGfJ0MVB52TiRNnTc+aKv
         5mlf7SLi8gEDi2LFFRDc4lOoHlHb56IAKe7b5mHPhUyQqLvnTDHyUlfGC+9s2gEXLbyd
         nz+WrPbCMRtgyaGuSfvTSuVwA9nUUZuGRqzLBP8D3Lo9L7UToJDcXHpeFak7XYa45ECK
         mVQisw3gzc2ajQ4wUMdGcR4nwf9L9vuKu0eGBsUMSajBJEjZ8WnDuM+UGwG+A77drYZm
         kXXw==
X-Forwarded-Encrypted: i=1; AJvYcCXjrTlPTZ10rYIX4kUu9w1tYvcn4EFQz2cekQvlnrpd630NlfVCjnp6TGDZoqyt6noAGGHWngI50PnRxxKO+y44RQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwFNxotSfH7DW6KLlG8XZaeeo0I3Qxx5CIEVlmktfo0T/nFdIK8
	K9HRcpvDDNpYf9UZA4bG9E9EcsL4RG/rcL1G4EvkEPCxYAAOgobvu4a6UhDENbnm9Tk=
X-Gm-Gg: ASbGncubk+1WaPZMu3MGdAWDFFoRtIVqtPaSjNSnwxr3i9mNn7crc4MlA/w/ivRdKfX
	IPT43sddV4QrPKB094PCI04362IgK4awNlhYcDpJJ9+HHfblL49iw43nMkAWylWR1UkvtPWK+7F
	jpaU0uu/fSeEz35cbG5pKpCpRtCtndDzD1pJlVhmzkdv7+eo/xo4Ih/IE6g9oiW0HUuYD4QELsf
	EEd5JLHA4FtacliCKE9PATa5kDSLHtBcZf51m6wnLXOjnVMX4qXIlynO2h45f8QgNsEiczuvgRD
	PgH6PHzBD6uCjTyFVTdxcyr21VSgSSvjxTvjWsNun5XohfhSF6vuYlUDzTpF16E4T7i84Zw=
X-Google-Smtp-Source: AGHT+IHqXCD2Zw01Rwu6Y3SAvsPyX9CqAzleS6jGDMZtlcG8vOZNw6N59XBM2abO07C+micSLyXkEw==
X-Received: by 2002:a05:600c:3c96:b0:442:fac9:5e2f with SMTP id 5b1f17b1804b1-44c91cc3bc4mr57701585e9.2.1748428914050;
        Wed, 28 May 2025 03:41:54 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450064add8bsm17331595e9.17.2025.05.28.03.41.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 03:41:53 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 28 May 2025 12:41:03 +0200
Subject: [PATCH 07/17] pinctrl: bcm: Constify static 'pinctrl_desc'
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250528-pinctrl-const-desc-v1-7-76fe97899945@linaro.org>
References: <20250528-pinctrl-const-desc-v1-0-76fe97899945@linaro.org>
In-Reply-To: <20250528-pinctrl-const-desc-v1-0-76fe97899945@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>, 
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
 Jesper Nilsson <jesper.nilsson@axis.com>, 
 Lars Persson <lars.persson@axis.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Damien Le Moal <dlemoal@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>, 
 Michal Simek <michal.simek@amd.com>, Emil Renner Berthing <kernel@esmil.dk>, 
 Jianlong Huang <jianlong.huang@starfivetech.com>, 
 Hal Feng <hal.feng@starfivetech.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
 linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@axis.com, 
 linux-riscv@lists.infradead.org, linux-rtc@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1496;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=ABHNDkrQtwVI0zXe6lhvrQu7yt9ZZOAkqbbG+yTdfqk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoNuhOkNkLKO2b0zaSv6TMTVNLJbk5UgYW6TFwg
 jxSUj1tHraJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDboTgAKCRDBN2bmhouD
 11tIEACA1WGvClNApJH2VgRBIboy0fFx1D+Y+FmGZZOWF2Lr82rwxR+M2b748c5TlSo9L++jcYr
 ZIR9lt4fSg+Yq5PmKkMDS5q4/ycD2Gcrmt5FcuzV3FHj/sG2BsZ4jRCEU2k0iCiKO2X1G5tK6zW
 cPFXEwBw4P08YI7Nu2Ke8Li1A5AQfcSHEssreNopxfynn3hcgemwVvxqcrgTgn7LKeyty9xxRFf
 Kn4F8QcbHnhFHps9umRJISETKamqcHenUST3DXcgLh47hR495Vcu58lodmhE2bAmutSDn5thYfe
 DoO8QFiiJskkUniuoDUTujIX6m6u+A6gWbXWz6beprpg3Xf05DIvGAxvrQw5iCf4HEKY+m10FEY
 43eDfDRbqF3WlANoUSuRFJNxtdKy/sbJjlSx/hgmTrohMHQuWXOua6jZ+L5S0pD+1WTBkGWJ+X1
 xFECehBz9isI0FWdgZrOiu7VDyAyjj+5nFjPqGNf1RCGXB4e9CQ3Wk3tawW1XnuZjfYNJxyX9LL
 wGPxw86wuE4eFNLbtUC/wyhkH0OYnduQDq8aidt0TCaFCrmsSv6hkV0VKDTnjl7D4cOaPPst08d
 I6jHmNloifkKQPK0TtV1VNakHBf8aR1kzbxtqVvWqR2c/B8gIYE1dpqeAFLbE4Pxl+6pc4QiYJN
 MPOQPOjSdZQleng==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

The local static 'struct pinctrl_desc' is not modified, so can be made
const for code safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/bcm/pinctrl-bcm4908.c | 2 +-
 drivers/pinctrl/bcm/pinctrl-ns.c      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-bcm4908.c b/drivers/pinctrl/bcm/pinctrl-bcm4908.c
index f190e0997f1fa9fe8bf07fc3ae5700bc721e1651..12f7a253ea4d5bd0af5dbabc320fc2df32172e4f 100644
--- a/drivers/pinctrl/bcm/pinctrl-bcm4908.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcm4908.c
@@ -456,7 +456,7 @@ static const struct pinmux_ops bcm4908_pinctrl_pmxops = {
  * Controller code
  */
 
-static struct pinctrl_desc bcm4908_pinctrl_desc = {
+static const struct pinctrl_desc bcm4908_pinctrl_desc = {
 	.name = "bcm4908-pinctrl",
 	.pctlops = &bcm4908_pinctrl_ops,
 	.pmxops = &bcm4908_pinctrl_pmxops,
diff --git a/drivers/pinctrl/bcm/pinctrl-ns.c b/drivers/pinctrl/bcm/pinctrl-ns.c
index 6bb2b461950bef5c420f1b250d48fcf6e907b98f..03bd01b4a945adf72445576a8a111f3c0637e095 100644
--- a/drivers/pinctrl/bcm/pinctrl-ns.c
+++ b/drivers/pinctrl/bcm/pinctrl-ns.c
@@ -192,7 +192,7 @@ static const struct pinmux_ops ns_pinctrl_pmxops = {
  * Controller code
  */
 
-static struct pinctrl_desc ns_pinctrl_desc = {
+static const struct pinctrl_desc ns_pinctrl_desc = {
 	.name = "pinctrl-ns",
 	.pctlops = &ns_pinctrl_ops,
 	.pmxops = &ns_pinctrl_pmxops,

-- 
2.45.2


