Return-Path: <linux-renesas-soc+bounces-29855-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2GIGHqC6u2mtmwIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29855-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 09:58:08 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C452C82D8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 09:58:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9FA84319A165
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 08:55:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC6363AE18F;
	Thu, 19 Mar 2026 08:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="akZdPIUn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 664BE3AEF2E
	for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Mar 2026 08:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773910516; cv=none; b=kfGo46EVyPdjRoxx+PkXVp5wFbWXRUcDFOHKi27iNFZKEIME64KYDO39gyTJC5gP8LJklgliDzXvFtTRjLsIIpM09p2p4F9VZvSR2sSWcq7PyCXxOpg+iK/C6xsHZ/i1rq+Dd795JyHFPHRupSVZhUbDOwU5hSd+j0BcZhe4xwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773910516; c=relaxed/simple;
	bh=zrw23kbaB6w9Tx36goqR08XFMojlC5+6mg4vLV+ld8M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=KpAYlHw77uArjwRlSLDiJBjcu+NW1HB2ATyluDo48XCYnMAWw/89s9MB7C8W+P8U+tn//vUMgE0LEOnRxsST7RBBLxqRcniPdaW9+IEQ+nUQs3JNictZHNVQpvm/qB2zFMwW3jCtXcXTtKtiAGK7l5JZL0pNbCVUJVOub/scpFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=akZdPIUn; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-439d8dc4ae4so345427f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Mar 2026 01:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773910513; x=1774515313; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g2aJhnD/vRwXSeh3Fhk/ZXgYYRMhSjsCNQv0oxpRs+s=;
        b=akZdPIUnHy2Bpu0VmBS89IRTh+tGrmxEp7YSD5pMx6k6Q0M7cwIawhE1dUnVfzuBZL
         Bydk+pmdfnpAHmZOifBJxBArZG2RjTrs1oVOPUnYIyw2S7M8GEodGz800WDaQSNnYPsE
         utHN2D+D6ybg0Nu7PdSgfP9zVeskmHXr6KmcKln7Mf6EnT6eIZMcPLTPeJvvNa1Ekc5q
         u294kHDen4HGTcv7ujHvECi4OirHLBN+YngZlY73x8FEJ3YiGT93JbNcJCkkq7ZAS6W/
         z/khAcM8I8zsbhQDXgEql6Lix9w6GgiD947qjdk3NJ8MXqNE0p1ibyZKcPGRewTNLCk+
         llZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773910513; x=1774515313;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g2aJhnD/vRwXSeh3Fhk/ZXgYYRMhSjsCNQv0oxpRs+s=;
        b=cKWFbNOnZcW2R9xgjSTeal1F/5F3+kzaUk/vhm/3kED1+NzWoRzU6xuGoZ1/oRYjHL
         /l9Ob8bXcGEdz5frfcLyd9dseMnEAdm2siviOwRgFLgkEojpqVUgefROIzhEJhWbEl3H
         lgyJ4kVAADz7jvDy9jgLd+nWHxX27lLX78fdMoP9WaSGLw+DdlHf9P5c5FblhuhgAfMW
         H48+tYhuhbFcLP0m0uvAi+FUdykBCbyoLyL7gND0juO7b82KCq8qIiZEd4dZBnkawSN1
         F8lXWPMc7z/CyZFtIb+RH5+hHQaS+03tjQa75Yd4CaixA5uX36VR8gO66JSqGZXiPWoo
         HmuQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHTUEuK+HEWhZhEfHFiAG4lYGhoiTMM19R0QFzYAdVbWI/8mf8mSexM/T5mn+qzGLKnxxbAmbSckD3afSy/riXng==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9Kz4ctrZ4kPDonQyfVcdfcJg4bS2MsKC50l9y3KxEbTEf/rhC
	xKTs2mWnJzeOcVDI++G18YXLXRs65u0XvIjAVbMrvQ4hwP8sIv0mKadKQCSc8638AoA=
X-Gm-Gg: ATEYQzyiZeZBwtfciLG6RGTiGmj26KumwDvKPYmm16QUronPskL3HzT/DziUw59t9IW
	sAB7sMgegrElAbmWtfTEURge/MqaLTYc42zWGhvkI+ggICMZLcQFabqr+A649+k1UYnphnwj5jm
	XMCOUQ9BbS1wGalNcp3DilopTDlTW+maqU4kLFtSPoEELbZQbPjBNRd4WgHifa4S5L40aF8ygKV
	MnUIu5kOHMd27Vpl5v8YtvjGdelD3qKu6QnQB5ArMLWoQapybsRPzZ882JP793YwvV1RDZBdRLM
	sG8rQCGFgUvYOGhYlAyQRS+SWT3V0xxEXg0ylOdvxoyFhzh1NNd7dH56V/VgHzTNSwaOyj+xmps
	WOKlqdCeHqK6t4YV2GAc/pGv5wIvGFRKqXeDZIePr4N8xmsYk92wodzpC2Ji95GHhfcKFdpshMt
	1s/TFcL08nxoeASptf0DYe8E/6m6noXZpHC180IB3Li8Lc
X-Received: by 2002:a05:6000:40cb:b0:43b:4f97:9608 with SMTP id ffacd0b85a97d-43b527a7368mr11451596f8f.14.1773910512637;
        Thu, 19 Mar 2026 01:55:12 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b518588a0sm23072267f8f.16.2026.03.19.01.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 01:55:12 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v6 0/5] arm64: dts: qcom: Add support for the Ayaneo Pocket
 S2
Date: Thu, 19 Mar 2026 09:55:06 +0100
Message-Id: <20260319-topic-sm8650-ayaneo-pocket-s2-base-v6-0-797bf96df771@linaro.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOq5u2kC/5XOTW7DIBCG4atErEvFgAfjrnqPqgt+hgS1NRZYV
 qPIdy/Jpq68cZfvLJ5vbqxSSVTZy+nGCi2ppjy20E8n5i92PBNPoTWTQmoBEvicp+R5/TIaBbd
 XO1LmU/YfNPMqubOVuECvOkMxGB1Yg6ZCMX0/Rt7eW19SnXO5PjYXuF//xS/ABXdOxQEjeGHw9
 TONtuTnXM7s7i9ya/aHTNlMj0geHAbj4s5Uv6YU+pCpmomuHzwGDVaondltTDhmds00Qnoj+wE
 7BTsTN6YUh0xsJtjQHrUWKNo/5rquP3vSoaolAgAA
X-Change-ID: 20260121-topic-sm8650-ayaneo-pocket-s2-base-05c348efd86d
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
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 KancyJoe <kancy2333@outlook.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3500;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=zrw23kbaB6w9Tx36goqR08XFMojlC5+6mg4vLV+ld8M=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBpu7nsszJs/FqL3KMrYDOOOifv9EJW3hrIP7kVI0ui
 uHuA9oyJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCabu57AAKCRB33NvayMhJ0WoYD/
 9MFI3MCQ8UwJfOb/HO9DZgqVoTf0uRjzlLchxD1CyAp9CUoDyxcavBJ/57z0HqE4ACNfK7ebavrOlX
 4556xHWTIMurKfERPtQ8d9CEeAvE8aYRSwlKDmH2Nr0fvII7822w1SsAG+Eq3AXA8xc82iYEPjYqDB
 0wuWK8wYK2LKeYpbr/m+foyYoyOT89Sn9Kaq4GDumRVEAc7URBD3qL7xfDr+V0SWgWExwM+BP8Gr5a
 Y35rzHBVeg5ByZFtOxl8RiGnHv3RQuvRkNcSHAaN/rTjmbRSBQyHndaddbLHMfZs9z9J5v2UvD84qK
 z51CuHMtckrfBt/mp4633LbJSnUU6wIEEkU3cI08HjsEErOy4v0oQkzsYRRQ+kjHskM3mSQFvC4Ipr
 cfW03ElcQqwrUo1KT5TH21WDstsCtWI82Wuz0R+fi9Lr3BBn8N9xAJsNgSbg+RCX3m2dAAR6ETxJ9H
 E3bf6QXK2FN/svBw7lL8oeZvcE0WNWv/UjzGeLx6Y31/X0vNeIIBmJ2Ke0vWwJ2OA46/8Drm0fIs9O
 xlKC32YG8wJzqGB7X3IjEaaqUPDzNt117bJBpIU7axXSbLHnfacXMKCI7vz0e6emAyR5UbiH0EjsYj
 XOfsUiCI/XivfXokXW9DD+wd1qSN4W3Maoj7hZEs2TkpNB84PCncSfuxDf/A==
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
	TAGGED_FROM(0.00)[bounces-29855-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,glider.be,gmail.com,google.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,linaro.org,oss.qualcomm.com,outlook.com];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-0.992];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:email,linaro.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 11C452C82D8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Ayaneo Pocket S2 is a gaming console based on the Qualcomm
Snapdragon 8 Gen 3. It has an internal UFS storage, WiFi,
Bluetooth, gaming buttons, SDCard, 2K display and USB-C
connector.

Product Page [1].

The Initial linux port was done by KancyJoe (Sunflower2333)
at [2].

The UPD720201 binding patch has been sent separately in [3]
and is ready to be merged. The pci/pwrctrl changes were merged
in the pci tree.

[1] https://www.ayaneo.com/goods/9344082149621
[2] https://github.com/sunflower2333/linux/tree/master
[3] https://lore.kernel.org/all/20260319-topic-sm8650-ayaneo-pocket-s2-upd-bindings-v1-1-84e4ef564022@linaro.org/

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v6:
- Added the review tags
- Dropped all the pci/pwrctrl applied patches
- Sent the UPD720201 bindings in a separate patch
- Link to v5: https://patch.msgid.link/20260220-topic-sm8650-ayaneo-pocket-s2-base-v5-0-1ad79caa1efa@linaro.org

Changes in v5:
- Rebased on -next
- Collected tags
- Rebased/renamed slot to generic based on changes from Bjorn
- Link to v4: https://patch.msgid.link/20260216-topic-sm8650-ayaneo-pocket-s2-base-v4-0-802c82795431@linaro.org

Changes in v4:
- Renamed slot to generic, in the code as well, fixed Kconfig & commit message
- Switched the UPD72020x bindings additionalProperties to true to allow devices subnodes
- Collected acks
- Link to v3: https://patch.msgid.link/20260206-topic-sm8650-ayaneo-pocket-s2-base-v3-0-5b79c5d61a03@linaro.org

Changes in v3:
- Made renesas,upd720201-pci bindings supplies required
- Fixed description and example of renesas,upd720201-pci bindings
- Renamed slot to generic, added renesas,upd720201-pci entry
- Used PMIC_GPIO_STRENGTH_LOW instead of numbers
- Removed all output-low in pinconf
- Link to v2: https://patch.msgid.link/20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-0-c55ec1b5d8bf@linaro.org

Changes in v2:
- Add proper regulators for the USB controller, with bindings & power ctrl
- Add proper regulators for FAN
- Dropped support for headset over USB-C, audio is connected to a jack port
- Cleaned up Audio routing and fixed the DP endpoint index
- Added i2c clk frequencies
- Renamed fan node and used interrupts-extended
- Dropped the usb-c self-powered
- Reordered nodes alphabetically
- Renamed pcieport1 to pcie1_port0
- Link to v1: https://patch.msgid.link/20260121-topic-sm8650-ayaneo-pocket-s2-base-v1-0-bb3f95f1c085@linaro.org

---
KancyJoe (1):
      arm64: dts: qcom: add basic devicetree for Ayaneo Pocket S2 gaming console

Neil Armstrong (4):
      arm64: defconfig: enable pci-pwrctrl-generic as module
      dt-binding: vendor-prefixes: document the Ayaneo brand
      dt-bindings: arm: qcom: document the Ayaneo Pocket S2
      arm64: dts: qcom: sm8650: Add sound DAI prefix for DP

 Documentation/devicetree/bindings/arm/qcom.yaml    |    1 +
 .../devicetree/bindings/vendor-prefixes.yaml       |    2 +
 arch/arm64/boot/dts/qcom/Makefile                  |    1 +
 .../boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts      | 1551 ++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8650.dtsi               |   47 +-
 arch/arm64/configs/defconfig                       |    1 +
 6 files changed, 1580 insertions(+), 23 deletions(-)
---
base-commit: 8e42d2514a7e8eb8d740d0ba82339dd6c0b6463f
change-id: 20260121-topic-sm8650-ayaneo-pocket-s2-base-05c348efd86d

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


