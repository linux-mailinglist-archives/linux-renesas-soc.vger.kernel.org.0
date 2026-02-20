Return-Path: <linux-renesas-soc+bounces-28348-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CL20IVV4mGlrJAMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28348-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Feb 2026 16:05:57 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F4D168AA1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Feb 2026 16:05:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5C696302D725
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Feb 2026 15:05:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21C683502A3;
	Fri, 20 Feb 2026 15:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="alkGBNM2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 586F434F254
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Feb 2026 15:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771599897; cv=none; b=B3wnfshpe1KJeGjXSHzbHJE3/rHWMsA56YeX/S/s675OsoGaMrR5rO/KqK74nG4dPUrMwNwSgoW48Jj3Td156e2cReB+IMcvCx8ZfgbRI9bpSfArz45TEw7UWQFYZZvHmVsVc4v6QQmEJ9M4sknSJXDs8ecJBU5kTbONu7MuY10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771599897; c=relaxed/simple;
	bh=ucacCxa/mj+2F+aX6+B50wEhYPy32LXUflgKJU4wTxY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cGly9CaU8+mD1kzqU5f+0l4YBAbVgcHBeLxU3XM6gLyeu2Qepf3aEFDJI7+yzM4u3DkCoW2tGyYcMEtQfybLH3upxUPjxR71rVsb/J67wiu2u9L0QXePsTyvaW0UPORUf7CkJCKg1h9EUO6GY9xP4f6NWbMELww5tHjS74O8l54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=alkGBNM2; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso18179385e9.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Feb 2026 07:04:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771599894; x=1772204694; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dv+SXo/Sv4fvOm9Bdd13zyWuAiiFrpYo+dzeHabNNsc=;
        b=alkGBNM2yctjUTP2a66q6aRLUKLQHmVZ9AMGL2EXkkFAU4WbcZdOSitvQ1bY4ao9+3
         VE45VQM8NkZhTGhkUhmsyC2e+aSb8qcW0hT6UznmsPWbqYjC5Iaxr4gDnqvGys+iqDQh
         lVXord/hj1IiK+3tZiWTw9ZpjyfjLKI1nnlN2+aXdDmCAPhxoULL+4hl43/xJ2mEAPUk
         n+UTAbv94OTmG/kMvEjJwAynprI2XCBJyIIWrx7ky+6/nejeu0ER9snf0YltV0NDPsi2
         5GSuiQgL5T3Gn8ElUFg8ftxEjwCHnnaTbNw3w46cV+VqdSSuJ0em1ZoGCJsLGZW7WUom
         WfFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771599894; x=1772204694;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Dv+SXo/Sv4fvOm9Bdd13zyWuAiiFrpYo+dzeHabNNsc=;
        b=LHxe6dCnRRY9fi7ZTPcfcw1fGoVL0dRMVQ5jKSuGOE68snib0qPHqmWhAB7koGPXDF
         5wGBY9AL+7Zq4GifbLCPLwy5iIEPlLK/xW5RF5seyeAGKYZhGxovl1LzZetiV5geECWT
         2VpJ8j5LT6ZqDi0hd8aXiTfFBtQigYUtl8vvC7rgAfUum/VNZ156zsiP79y1LtXF9L/R
         TCoFcEBDeDxzBX7b5C7+wPx0sx8v6Fn9x408MIU7TV3lo0Ax1Y6OIeQFgG8+hHCHuOzw
         XNYhncGsF0sIh6nSq8njX6UofsLdUwwaalE7L07DNhbV4RTRlsAilZ1IJ2jKjVmmX5YX
         fLeQ==
X-Forwarded-Encrypted: i=1; AJvYcCVoZ2lDmzWvkkI3AatoZNqJVp2oAgPOOIhhebRViZ25qfwDgbEKUVk/OdvpoRsGnQHY6yOzmTUaQgQV3MciPqkFoA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOREQFGwZ/SERQbW3aPr5diVrURMwraVOzGjUs2a0N2D8jprX2
	s1utisW9atXjNULbIMZjpvD5kKPuVfzV/Gr1hlSMAYuNwkL57iPWy3PvNtvCdzTHs/8=
X-Gm-Gg: AZuq6aJA+pkX2RxNvALq/1/pojfQLcbJIrNoIHjT/N/L9+DQdniz0Rrh5fCI/Sp4rnA
	xWOkSzhWhQa39nzFIDkjLMrWv9R/m/f15kIGdDhLSQe+MlgPUm5VyWJNJSOKmRPfEfLxItPe/h2
	d2InmJGKAdbm7b/UZPIEjyjE9Av4MSeuyE9XJxqdmijsh+EhvGQMmSATKa7M5gosNej9XorpEbr
	3iOyQk1LN5qikq3c6dVi6/+ftKsTjeVuuqPxQw47ts1Totmh6X+sXcPLTaR14kIm+dzVyzC1i+4
	5Ts2fyT3wccDDprlyswOtlKiMGrBuDtuQPHjIltLA00cq2Ne+au2DT4jrWDm/apIzNLoGS1r/xn
	lSbuEGBdKX60zjiSN31by8vW/NzUwxsHF6pzZChCPuSGEc/oK9u48pYil0W8sFZvi1kSbHa8suk
	mJWGznqQd8DU9Cf6aZ8tIfLwWJL/Fc/Yj5SdG+2MwqLMH2
X-Received: by 2002:a05:600c:3f0a:b0:480:52fd:d2e4 with SMTP id 5b1f17b1804b1-483a52b2e32mr41598565e9.0.1771599893489;
        Fri, 20 Feb 2026 07:04:53 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a31c56d8sm122064505e9.8.2026.02.20.07.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 07:04:52 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 20 Feb 2026 16:04:44 +0100
Subject: [PATCH v5 5/9] arm64: defconfig: enable pci-pwrctrl-generic as
 module
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260220-topic-sm8650-ayaneo-pocket-s2-base-v5-5-1ad79caa1efa@linaro.org>
References: <20260220-topic-sm8650-ayaneo-pocket-s2-base-v5-0-1ad79caa1efa@linaro.org>
In-Reply-To: <20260220-topic-sm8650-ayaneo-pocket-s2-base-v5-0-1ad79caa1efa@linaro.org>
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
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=786;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=ucacCxa/mj+2F+aX6+B50wEhYPy32LXUflgKJU4wTxY=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBpmHgMWIfn4SgSHhWQnnkQkpLCpCCiDb2cJXWObnzN
 iW+G1ySJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaZh4DAAKCRB33NvayMhJ0ZYeD/
 4mc6uejEUp9T+4+gG8RCsrT1Aa+N6h+H9ToFhbv8hKKYE2EIUPxVsfwFjc23XbA+Vny8t0VzRjLf32
 UvrTK6j2Va2XQW1aeaAHWkdWtNwCTU04fmMCyjmSvpExDUtZzQsCTCw8dNekvR+k4wQ9K1aC1bToCm
 qO/RfuveNUaLtUJKg+ZhNLzaAdSeqzSi6Bkg8+fY9ZpM3Z9goQBHMSaU02N/Xs8yweVPG64rbCYTV3
 pXV+uWbS6wKQ9l7JycKlUr/DkaXMaktIM+1v1KRRqrxUNrdmbbxgsH0UsEdNAf4qTb5yeFfFh9sApR
 zvSoIFbIdKbEJipTic08Qs66lYs6VTIr1FwKXBY8PDpepu257raCvWluryVBRLWqucprYiZ9l9XIeQ
 zjJAgTzLjKWbYTIYizKHzj+Qu+/0L6f7AxQTrq1xHalrmaZUQlaZ8BV+iu8MOPqC1/zWF0zHaQALPp
 c3cc6LKX7iXtuhIp7n8FETP1pxzn2pb1WCHtMvfjMS7Ty4NOVCb/IRraj2utZdW5Zbh9fMEtIv2Lku
 L/zSKVHXzVvDZVJ8lHo0axAqmrqlgvZUkoNpHdXqrQOxfGyPkE6HSYJFzAHAYGeZOu2QBRPY8S6LqL
 whv9Vz3NSaMt8HAT8DntqEy/ZEIdLy3lN8C779VndPbl+w7q/EqNkklsP0aQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28348-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,glider.be,gmail.com,google.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:mid,linaro.org:dkim,linaro.org:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 29F4D168AA1
X-Rspamd-Action: no action

Enable the generic power control driver module since it's required
to power up the PCIe USB3 controller found on the Ayaneo Pocket S2
gaming console.

Acked-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index b67d5b1fc45b..0e8b62ffa7db 100644
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


