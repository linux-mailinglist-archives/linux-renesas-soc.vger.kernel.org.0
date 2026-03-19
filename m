Return-Path: <linux-renesas-soc+bounces-29856-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IAB2Lb66u2mtmwIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29856-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 09:58:38 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1C52C8327
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 09:58:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2869E31BD7CB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 08:55:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDCAE3B19A8;
	Thu, 19 Mar 2026 08:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PvPbnmpL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E0A3AD50F
	for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Mar 2026 08:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773910517; cv=none; b=Vw5itOgT7V8TJeWmklNaCXo3ldRntblGVdCTzTY4sUr0wx3xcz9Cs3gkpS236o36uX3IPrcS+/cNMjGFlvQTwBnt6WBKLEynitK/lgy9OvOwMLVWly0wAgrLHqOuuziDAG+Ac+X/0p6qrMN78IKbx3v/WbcFomuDHL612uu0xBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773910517; c=relaxed/simple;
	bh=XvC/+pHwVb5NzB52XjoWhWvsP0QalYMxdzFh9h/c8IU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OdU3+BHguhogQSxFVOY8Due7MTARaOn4oqpgkAVpCOmyKfevP72qQVd1Mw5As82sJmn9m9UWEqQLfLQarHOYILIWCEW0H9pvsGfUiiW/kLagKGLqykcuFPg7QCZNflS5jUKEPx1iN5LkgxYgbCM/VVtZoSpwtkiqEkGpT2nLvPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PvPbnmpL; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-439cd6b09f8so455439f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Mar 2026 01:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773910514; x=1774515314; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u2I3d/W72WxunPTgbW/r5o2nF4g/KFg/bIY0fMyHO7s=;
        b=PvPbnmpLZqwUTwx9SWESa78OKPrdCWncJDzn/y73jLgxkvUJEJRoKDWf45RJFVknnb
         E/qpfQAud9zdgHdMcl/Ys9zrSgaLeFkBJTBOhwMCXWpSqyN/igYPDe0dkCN/HyCaHgk0
         jP+++enAzNM7RoCoNwIw6/dTXRWM94tzEt5s4dA4whgv8RHP3BAAwABEccM7VOqXS5eM
         ve86KtvNMKYVb4GgrA1mID9u0roVJq1FrH4muahx8U3fsp6hBBijhHElMX8Ajg21tLJg
         TwTH3B1J5unPoKM3OCpjDcDXImQhuZrST74yqgeZWHGlPBTTApF8wZjE/x+zryKwbkgw
         Qm0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773910514; x=1774515314;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=u2I3d/W72WxunPTgbW/r5o2nF4g/KFg/bIY0fMyHO7s=;
        b=KeoW89xaqA8K4hoTeJhTfJiMURoRT6JMcyLFfh9RujWPolTzN1HiHm+KyRc1nswqIj
         PUyyCia47Sa4q9FiW+hnz5cit0khDff8zCSw9YCRbTM+tBXxwpJIR32x4Czg0n/ZJian
         14dShmGhIsqDPFZWeXaPtzl/leUDkcChhSOTcDPUL224XDS1vvKAE8UGcOU/pO3OvBs0
         qIHu1YSm1LAQufNNWk5WmjZobHsy1R6ev9DBBUi+Z/LNDaxe3xxf+JBijcRSmUeG/Dmx
         Cra4PJ8dk5MnOohrSNwuP1gYEC+Uf0Im+CJplBdMz1IhpWmC8asaaSHxHtzojawGQSHa
         Ntkw==
X-Forwarded-Encrypted: i=1; AJvYcCUjDYr6BIoy1idJWV0xfBZtWZ515ZkxQboY9qgbLscyTIqkn6DXESHfEK1Qd/7RL2kpip3m9kc0yX0cdPTkmbJomQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6I65u5o6gP+W7zKyWykpL/MD42DZg95QFlbrJyRyb+CXzV/0q
	lLu0TwhcDUeR2avdpJwgFz2awE3XPP7+tC+VeHjO8pVqIoVSY6kS6RfcpgT1Gyp2RpM=
X-Gm-Gg: ATEYQzwdvRZnWlEkMazXzi5DKP132Z0mnN+deduCdd634WHHw8AA+lFVjIY8QNlPguG
	qDPYIHL/SJVIm2kNW90A4PgHF+VQWP+6nbKDmGe7T69GHFdZ4KwNctlnNEMr2p2PZTiS2ahYPkR
	Y1g+ApAhttv/BNgzdZLvcaD5FyjWKiuPhoNG8lAiq06DCXrKmcBOR1hUnQDZY6gtQZ7Ysc9Myjd
	VKIKi8DSYukwnoRRW1g0ArH9eaoZmBVcprUN/yfN63Kved+sxFpuoULtIdynHCal/I+ZF6S/TCw
	Z0wJEKtfemIeH84sD7hTV5yIed/3e7MM8PUrAFuoy5Lg2FNlklEChkbFjMasYisTj0XDvKgLFuF
	ubSOJym0tclLcxy8Mo5LVX68/IzdV1Ww4Qe9djmPxYK3aN8t13z+UMQQged2Cq+QXJDkle6F9Mg
	YQymuNOngnFQtsBzLhIAs1yv15etb4o5ZXCAXs8JRNJztS
X-Received: by 2002:a5d:5f82:0:b0:43b:45d1:f44f with SMTP id ffacd0b85a97d-43b527c89fbmr11259355f8f.41.1773910513729;
        Thu, 19 Mar 2026 01:55:13 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b518588a0sm23072267f8f.16.2026.03.19.01.55.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 01:55:13 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 19 Mar 2026 09:55:07 +0100
Subject: [PATCH v6 1/5] arm64: defconfig: enable pci-pwrctrl-generic as
 module
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260319-topic-sm8650-ayaneo-pocket-s2-base-v6-1-797bf96df771@linaro.org>
References: <20260319-topic-sm8650-ayaneo-pocket-s2-base-v6-0-797bf96df771@linaro.org>
In-Reply-To: <20260319-topic-sm8650-ayaneo-pocket-s2-base-v6-0-797bf96df771@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=859;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=XvC/+pHwVb5NzB52XjoWhWvsP0QalYMxdzFh9h/c8IU=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBpu7ntK92VjPgJU6LusU96CCjpdrZznIp+B8cqAhWc
 IjaiDqqJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCabu57QAKCRB33NvayMhJ0a1PD/
 9imeLObUOro2ziHQTn0Y0AKF4JJ+zd3UMzIolL+jH1PiXN/0saQQY/LYb2CTMEpRWBQPN78SQPEibW
 A79nzVQUJzwY2rAmo6OGLM5O+AfAOHEPJu9AvUWyMik8IopXmKxM6ph6Yck7Y0d0Qa2vWAykpXqONk
 EMucxj79YcQZaYTQtbJmUrrwTcEhimGlRdK2j3iO8S7BqANzmgBMeqQPHn1SoHniv2r2/uBVqRfkje
 3v9VkJzSkqgbI+uxuqLvs6S0+bAl1RrFUey7aqR8Q2PcNy2+2UIQ1AvrpgSJyNDFuLr07FJPDEmCgT
 lNkFjmisl1+JNf3ScVXykx7SJyhOlivlY8/kLyEZceIsSHrBiNn6E6MHWTKObG7Cy9KsNx/dN4da7N
 piE8v8n636zjFsYRaWEyZR341bccb1fqXXuVHpWSOIAov8IQloVj/Ln9htwhqds2a9dcebRcoaTUyn
 INHsmZGLeopDkjv44/JbirLyGJJuN8GE884Vc8DGFcWG3LkVh3s/dEN8MvgLUW/Ev9ABxsMT3lfeIZ
 XmLHFVXKegUPUnyfZtuRdSqwg7XHchxRSzbjK50/+335qj1WcUivl7Up2Bc7+XW8KzO6brgDzColmN
 2cfm8i4ex5gyxpd3iG2KIB6FG6rkDbe2BQSCc2rJrLAp16kD5RctSRRJzevQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-29856-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,glider.be,gmail.com,google.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:email,linaro.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 3F1C52C8327
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Enable the generic power control driver module since it's required
to power up the PCIe USB3 controller found on the Ayaneo Pocket S2
gaming console.

Acked-by: Manivannan Sadhasivam <mani@kernel.org>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 18881bd239f9..47347da14900 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -258,6 +258,7 @@ CONFIG_PCIE_LAYERSCAPE_GEN4=y
 CONFIG_PCI_ENDPOINT=y
 CONFIG_PCI_ENDPOINT_CONFIGFS=y
 CONFIG_PCI_EPF_TEST=m
+CONFIG_PCI_PWRCTRL_GENERIC=m
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 CONFIG_FW_LOADER_USER_HELPER=y

-- 
2.34.1


