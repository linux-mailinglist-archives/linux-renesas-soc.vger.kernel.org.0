Return-Path: <linux-renesas-soc+bounces-28249-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qD7ZA0Mok2kI2AEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28249-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Feb 2026 15:22:59 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB0A1448B1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Feb 2026 15:22:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B2DFE302710F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Feb 2026 14:22:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8F4C311950;
	Mon, 16 Feb 2026 14:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ILLdRl7O"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E963031195D
	for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Feb 2026 14:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771251717; cv=none; b=ndJfTlwOrWwJJnWrOn+gnoo8acxcGsiHddKlv4UBcW3C/bd28mRETZ5HCa5yNR7eW1790pMiEzo0QMPjsP4/OUTMLjHptkOqyCd5num2EtpeQAGQj1GO2WpIj0U6D0VVDtHq2cvA1mgXnwdOZyEdRdH6GsD83pWG/8hZmqeySYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771251717; c=relaxed/simple;
	bh=rBYpoHHrmScCv7WRIQFrevKZghJeIckT6rUCti4DDbo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ncPBVRY0L7xXr+OR2nIF3txhPV2XR6VfqOnHV0VSkhH8CPiGKzluK5bUcJAn6AzzJJpAFXd7vpKDRkPqOs1Xj02WNJpr+h+qpffskGC/MTP4dX2tvxcFwtplC20YH/ZAdZ0yhG0G7lR0SzAymYGz2saNwfmwTWNuD5sHsO4yQpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ILLdRl7O; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso4603345e9.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Feb 2026 06:21:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771251714; x=1771856514; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fGJ5JEVkfXkcRDLD7rcIejDONU0yTWmpuXz5qQ5PddA=;
        b=ILLdRl7Ox1Dxt0vH/ApYMEW9W42nGx07F71Q6QyeY7MYqgINEHkQJXDKryQyY7g1Nh
         JEC8p2xiEi2sIVJk3Llst3kuP5zhvw3ewtjiaLuZY6HdavDN05Z3+yefAq2WzBVq+wij
         4/q/yDTLJXHQyZSed9zLotwXtSbng6FDgpgVuhGmIhEo0St++G1xtVAlE5k1FGScu3XX
         1SaEwATPjRcSIDtAhm4LT25dox/FOKIAaKGcpLJACZDITTw5Ww85ySMfbnhtQMWyodw0
         R99kl306N4pShSaIi5utZuXIf3H/LNdWkBSb5uQNN8c8ViQtn6HJ9W5ioeu15o2V9BBS
         c1NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771251714; x=1771856514;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fGJ5JEVkfXkcRDLD7rcIejDONU0yTWmpuXz5qQ5PddA=;
        b=DO64iWicUC3QpgwHW1E03sNnuql2GNMAVOCXD1GJXsir75BLb5J1/oavyrWBJYZRrO
         CIDSVaWUJyD+wTznr3qjsd277JMEp3+SatBslHTAsjiqI81951zZN0O1D9g4kWBVAvXc
         pKA99d36sIrd6Z7NBwiZ19PvfUHmAnMDiSWVfk7sLTDiPCTQsaUXLPbyxdGzLsaJ8dO2
         KDfCcGXjudctwYhNW4VQeBivC5BFPh9cHK94iiJWNDcE8v9i95v9dm6L+cj4hHWdlw84
         l+x8Cph7i+ZhznLavG8RdzUKcgDQdZbluNeI/aBdZ9+C7OTKrOH8N5PSw3Se4G5/5HtS
         2bCQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2dCXplvcDJN07I2Vsd7+tmpCafJEGxIfbj80K7lEWvoBA2Yf9lQPoEuJxB2MaddnuJh7AjSXG1Fw2VkQuUAABqQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzEvl6+iNvB9HOPtp11TCO6d0YeKMB5wdjTEfK0KdsThUG+D3kN
	G0A20eeaYtBTlpYzF28YILP88uxdK88iIOko1Mbx4YW70BgPxC4o5pJk4EaZn69ewR8=
X-Gm-Gg: AZuq6aLruoJIqkCoHgoYA7tOOx19aO1P7vc/qsQInK3OjLDT8t9vE3DxD6E8W74niCH
	Q1XWwyP5rB1eiEBjlqEVeqfaxvMGFwRiuPPjejCPm0e1qqZlpLI5ptbDKAK+dxHElMUrNlPEFWY
	shM6w5ODsm0t9HDCFhf0xkVA4NPummqekD94QquGF8gLKYs7ugHf42jPXLoyZnRzrTpi8zlVzm6
	AQV4bRcr/dTgnUQs3gjm/Ji8gpHQAJ3fBNHEkxWOmw2fCVqdAk7zrjBmUO88LeBtIZ8TbYcpuAf
	4r/GQzndLWXXL7cr0wpHBgl60mrBYRxHlZawNvC2ouECYc5V1DjQfvXBnNYcy/zdfhUeotxyMlb
	fWC9XPzk/1GoEU401QTkx5cMgeyooPF8+4PiuZnCH3owGm0EibykXLWAi25Zm8afRe15P1SUPDt
	zig5RuaewvHlgR7kROBSGce/UoXgsmOTfiJRIaYm1gmJ2c
X-Received: by 2002:a05:600c:1d28:b0:480:52fd:d2e4 with SMTP id 5b1f17b1804b1-48370def8e0mr167070165e9.0.1771251714147;
        Mon, 16 Feb 2026 06:21:54 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48370a63afesm86717475e9.9.2026.02.16.06.21.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 06:21:53 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 16 Feb 2026 15:21:46 +0100
Subject: [PATCH v4 2/9] pci: pwrctrl: slot: fix dev_err_probe() usage
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260216-topic-sm8650-ayaneo-pocket-s2-base-v4-2-802c82795431@linaro.org>
References: <20260216-topic-sm8650-ayaneo-pocket-s2-base-v4-0-802c82795431@linaro.org>
In-Reply-To: <20260216-topic-sm8650-ayaneo-pocket-s2-base-v4-0-802c82795431@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1707;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=rBYpoHHrmScCv7WRIQFrevKZghJeIckT6rUCti4DDbo=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBpkyf7ynkEsMQlMdHuQv8REcBYj2EJipmHCpZ8m3Lm
 VXLeo/uJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaZMn+wAKCRB33NvayMhJ0fXYEA
 CRswv2o7cbBmJ5SIXmeFwDesiANasQakpkYIH2bFrbhuHe238TAWmSfcoHVyPknU3r+uBGiEKqhDgT
 RLfCzomv488ZnbekfOmtd90Tj2osP2iKtUGftszTUbPuBONqIofb0oj+7Lbz9I3V9segmBWPWJ4k/W
 7EZxHoIInQR30vU3lB21WYY0Oxz8Sjm1T6vyNLg0+5Ic+8aJqJU1K4qsyVRpuijd0kzV1SnGR24/7g
 A8JlSjVAMIBc+FdiGMSIoP3/s+2Jx7Yqd9y25RcVCZB8LMvkZ7Kg6hWVyNe+h9jEwwDUhViUzYz10B
 uQm+0JTXXU7iI6HYto7eg3w93WLVuthzygRARTeb7ROmMIDq+4aO9GvADqOB2D1+/qJsnYjWUHjPBI
 T1cUQCXUkg0fjwhqe8TQ/M6K1PMeUB/OgaX7GbetLh1Fm79cWgJYQsanzjdAEdbPn1YrkoqY2DHi0t
 GF/8n+Uy5Sw8PDIeankxeuu8tQUlin7fgT4ebvdK2G0eE0/ObBNLuztD6Fxg18jKpcAWijAyhN1YQj
 QSOslFUSHh8wF+fGiJ0J3c5DmSh6Os/kLCdz6kn/7Hs81RcOV60kai+5ltzv6AuXhptNhqqB/tD0f6
 hLk41hiI6Li0G/DHZHPdUqDHmHJGZNDpmKE2PS7fTcOdAywnb8vcMhiLvEEw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28249-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,glider.be,gmail.com,google.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:mid,linaro.org:dkim,linaro.org:email]
X-Rspamd-Queue-Id: AAB0A1448B1
X-Rspamd-Action: no action

The code was not returning dev_err_probe() but dev_err_probe()
returns the error code, so simplify the code.

Suggested-by: Bartosz Golaszewski <brgl@kernel.org>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/pci/pwrctrl/slot.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/pci/pwrctrl/slot.c b/drivers/pci/pwrctrl/slot.c
index 3320494b62d8..08e53243cdbd 100644
--- a/drivers/pci/pwrctrl/slot.c
+++ b/drivers/pci/pwrctrl/slot.c
@@ -40,17 +40,14 @@ static int pci_pwrctrl_slot_probe(struct platform_device *pdev)
 
 	ret = of_regulator_bulk_get_all(dev, dev_of_node(dev),
 					&slot->supplies);
-	if (ret < 0) {
-		dev_err_probe(dev, ret, "Failed to get slot regulators\n");
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Failed to get slot regulators\n");
 
 	slot->num_supplies = ret;
 	ret = regulator_bulk_enable(slot->num_supplies, slot->supplies);
 	if (ret < 0) {
-		dev_err_probe(dev, ret, "Failed to enable slot regulators\n");
 		regulator_bulk_free(slot->num_supplies, slot->supplies);
-		return ret;
+		return dev_err_probe(dev, ret, "Failed to enable slot regulators\n");
 	}
 
 	ret = devm_add_action_or_reset(dev, devm_pci_pwrctrl_slot_power_off,
@@ -59,10 +56,9 @@ static int pci_pwrctrl_slot_probe(struct platform_device *pdev)
 		return ret;
 
 	clk = devm_clk_get_optional_enabled(dev, NULL);
-	if (IS_ERR(clk)) {
+	if (IS_ERR(clk))
 		return dev_err_probe(dev, PTR_ERR(clk),
 				     "Failed to enable slot clock\n");
-	}
 
 	pci_pwrctrl_init(&slot->ctx, dev);
 

-- 
2.34.1


