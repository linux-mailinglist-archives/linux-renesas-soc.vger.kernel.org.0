Return-Path: <linux-renesas-soc+bounces-28008-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8GRqIs//hWnUIwQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28008-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Feb 2026 15:50:55 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F9E9FF2F2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Feb 2026 15:50:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5E7F5301AD15
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Feb 2026 14:50:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B7A7421EF2;
	Fri,  6 Feb 2026 14:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YhoWeGpQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ADE440756C
	for <linux-renesas-soc@vger.kernel.org>; Fri,  6 Feb 2026 14:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770389442; cv=none; b=ecdUhbsrm1Z/o4ZoYI3IBgJgNOKL+Q92jdai5FR+LSU1lOTqGuofgeVaGLGpOdj6lMV4MjAC7iTm2MPYlCUMCT1UBvvnkJZnkoQx8z9NrirBOIgFj3iAUqwdP/MybssMPf6ePCBZunKzd0GX79Qi3iv2zTuFZeuA3yjCEJbE+eI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770389442; c=relaxed/simple;
	bh=m8IkutoYSK4AIftCStgEEiEuj916nm6elMyF2PBGCKU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dlu/NvcIeu9rx18NM5Cma3PKKiv6pw/cneeorkRbSdtGr79u5630EpjHCy2pMvN8zeNAqx6DPQaSxJPzCpzUyZlpifsGkPBT6cQKgCzALG4VcUb5CNjHGoD/2CsfYkY+FtyyponTuLp/zm5rH230wqHfSp540JQwWjB5khw6tiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YhoWeGpQ; arc=none smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-480706554beso8442255e9.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 06 Feb 2026 06:50:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770389440; x=1770994240; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zebTzi77QURIJ5j1GBNLImGicnWPF8kidr8VfF/wJNk=;
        b=YhoWeGpQip+GZtrpTwdbadjMSPRI+BoKU/UJc+EnpBXxZlP5qq38KWfKn39e4IP0NK
         pVMlYE6jTFLPaFzo3eMAggzQ9X+hVG/T0I5mXOvh3xq5K0TNLRCARWGNwnAuLCkac2x+
         VDOfomavkA0rdph7+4gb/0Cv70Ct0wRFyrDA+zPw9tpVbBKjOxRQG56Wx6Xj3Bbfx1Hq
         3GPFZySXyb3Yzl9hZKu2hM/Vcg0trQV7QL+vQ6n5wqAam6t2j5qXcPafnsCtqjzd7E6T
         02QMPIz2UAtHJ+s4+zmgHn+SqL30U3t8y0dubeGXUuVB3McOLGoiNEXJQUjFV3ljFE+F
         Q/pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770389440; x=1770994240;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zebTzi77QURIJ5j1GBNLImGicnWPF8kidr8VfF/wJNk=;
        b=jY2+gGyWsqa1oaGSiD2qnRJ7fxR8SRYlW+hFiD7nwgbPuIcHgeT3RBj7XFxReAJr5s
         FamEZjchzCdgjdKpgvg1RTbPDH48xOc7H0YzlK82gZy/+3fmvHb0JNXzrvPzC+EvKJLj
         WQB8Jmy98S9mhstgwBzkPtYtlTL6kdx8nSVhMfV6+g7vI2sn00m9ZsTIGC9ZAtihkEJP
         D5MxY1ryJy/N5qyZ5JlUK6ZJiXtr5z54RZUQw3hBzYBByR0KjU1qVg1yowpRXLBefBpQ
         9S0T6LV7FkVrCM539gMScJ55dhO+q5CHAJ1v4Ux1vlDGQ6cGX0HayX0ZpgH8vTAPjcCx
         QszQ==
X-Forwarded-Encrypted: i=1; AJvYcCVK5nb/nCMDM/f3uZmmjpLiwNsRVpfeNw9dCsQ0FhKytWqR2Iodl8DD4XWxVxkFCnWuSfVg8mkkpar5+7qrgWjOHw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5+YOsquX2bJXoM9hwVJL9fFUbyql6sgUUadCDa+JnwvAOnU74
	myKSbuJoF9mLfDzZxHYeGMf0c6Gf7sBeaf64q/ExGtaUVMTNapOGsal8zQTjosvBixc=
X-Gm-Gg: AZuq6aLWW5ka8UBzzw9EG5icS1k5cvQKS0iKBcIRWYMi6FqMHO/NPSk8IupbbBqgW9z
	VpUfzxoKzetjW+MvnqYCoz6ANO59cSnXkxKGOpybBsrLLTGrMEBrsyXoOP/vjTfGvg2sSHHTpKs
	Pq+VvmvtzYrvwaiZGJ6r69WKnTR2bvWsxXq4RAHSvX19Y6F+w6cBL4sFfXw8PqeErDMujZBpodU
	K59tcYuBKmOokV7VxglACm6TJlg7dhM+XXHCta7MwlHFi8eGGUy6d+QsJWtwzStk1WHF2NRr1mT
	vP+XR5t3lSphpNW0X12b3+zbZit7mcRjn7uJvGEidQAoGUbrQT4cPvBogJgZ0o/YWvwx49lkIxD
	52R4S0qMwNS4OHP1yYekqIA92NoRJzBh3IW7up9z/vKUDl3znCr+e3omd/1GrdPLHte5mgTwrj3
	KyA8ow+ZxkXf/yhgWiUxYI+tizJ0/6PBbO
X-Received: by 2002:a05:600c:c16d:b0:475:dd89:acb with SMTP id 5b1f17b1804b1-48320216097mr42013185e9.22.1770389439304;
        Fri, 06 Feb 2026 06:50:39 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4832a38425asm3825805e9.7.2026.02.06.06.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 06:50:38 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v3 0/9] arm64: dts: qcom: Add support for the Ayaneo Pocket
 S2
Date: Fri, 06 Feb 2026 15:50:28 +0100
Message-Id: <20260206-topic-sm8650-ayaneo-pocket-s2-base-v3-0-5b79c5d61a03@linaro.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALT/hWkC/5XNvQ7CIBiF4VtpmP0MUKno5H0YB34+WqJCA01j0
 /TepZ100/E9w3NmkjF5zORczSTh6LOPoUS9q4jpVGgRvC1NOOUNZZzBEHtvID9lIyioSQWM0Ed
 zxwEyB60yAhWmPkh0VjaWFKhP6PxrO7neSnc+DzFN2+fI1vUvfmRAQevanYRjhkpxefigUtzH1
 JLVH/mnefzJ5MU0QqBhWlip3Ze5LMsbT2lrZCkBAAA=
X-Change-ID: 20260121-topic-sm8650-ayaneo-pocket-s2-base-05c348efd86d
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
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 KancyJoe <kancy2333@outlook.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2986;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=m8IkutoYSK4AIftCStgEEiEuj916nm6elMyF2PBGCKU=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBphf+5mybkj4M8sjAXKBnfpNIYlbRXcC6v1cTVndyF
 W4GcPhqJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaYX/uQAKCRB33NvayMhJ0RptD/
 4vRDG/iYugtoeGRKl3eTTpWxV0eguyVr+qA0ihqqHccxhcAqOlZP7m1hXzQeGi7G95dnxdWmwVcdcL
 w6zQyrl5UCC/UkJ1HJm8RVpb0znKXYKlWZ+E+1n1T12Jlt6P2b0hys/G3owZ3fIkrkkYXaZqGsRcQr
 VcDs4VN3njViJUSDrvhj97YL9OkrnYJ3ZcxXjLfbIL/J2Y9WXZ1l59nGjEPD8CjC2ay1dId6yWoRRM
 lLzURG4u4OHubjrXFrZASUR6es1G9N8087pHBIko2v5u7IK4PnLHd63USpHaR6kZkexpKh2LyKWka2
 YpDu0iMSxkIxRIvTvxS2ihm+YHt8shfoDDPl686GDJhN5DOnrQlmLg/OTU5QE2vHJxb7VdvLfI7qPN
 GFAcsNlAVmBJltrorVynMJLhsFfOpB+LRoeY+E7rCo7yRf0oSrrjPIP8xNrveo1A8SOqOl2RdQGQ9+
 bfFttpUJoeBbIl1Obpp6eRbsgPp0hJ2qIBAkkt/dMiQD6FwhX20OmDlpocwOoj+WK+8PUKp37nJAzR
 ttlHmtt57G6811bAKFzE+ZXoVBy6Z1UvJ0c/dms4YChZmbqJ9pfKFWFFw9CNfcjqa/qOY7Fxbt1iBL
 1BOxeUDm4lTxnYyu/AZBGE/CRKME7dAWc2DhXXL2VlS2JLctTThu66b5/dgQ==
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
	TAGGED_FROM(0.00)[bounces-28008-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,glider.be,gmail.com,google.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,linaro.org,oss.qualcomm.com,outlook.com];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ayaneo.com:url,msgid.link:url]
X-Rspamd-Queue-Id: 1F9E9FF2F2
X-Rspamd-Action: no action

The Ayaneo Pocket S2 is a gaming console based on the Qualcomm
Snapdragon 8 Gen 3. It has an internal UFS storage, WiFi,
Bluetooth, gaming buttons, SDCard, 2K display and USB-C
connector.

Product Page [1].

The Initial linux port was done by KancyJoe (Sunflower2333)
at [2].

[1] https://www.ayaneo.com/goods/9344082149621
[2] https://github.com/sunflower2333/linux/tree/master

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
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

Neil Armstrong (8):
      dt-bindings: usb: document the Renesas UPD720201/UPD720202 USB 3.0 xHCI Host Controller
      pci: pwrctrl: slot: fix dev_err_probe() usage
      pci: pwrctrl: rename pci-pwrctrl-slot as generic
      pci: pwrctrl: generic: support for the UPD720201/UPD720202 USB 3.0 xHCI Host Controller
      arm64: defconfig: enable pci-pwrctrl-generic as module
      dt-binding: vendor-prefixes: document the Ayaneo brand
      dt-bindings: arm: qcom: document the Ayaneo Pocket S2
      arm64: dts: qcom: sm8650: Add sound DAI prefix for DP

 Documentation/devicetree/bindings/arm/qcom.yaml    |    1 +
 .../bindings/usb/renesas,upd720201-pci.yaml        |   61 +
 .../devicetree/bindings/vendor-prefixes.yaml       |    2 +
 arch/arm64/boot/dts/qcom/Makefile                  |    1 +
 .../boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts      | 1551 ++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8650.dtsi               |   47 +-
 arch/arm64/configs/defconfig                       |    1 +
 drivers/pci/pwrctrl/Kconfig                        |    8 +-
 drivers/pci/pwrctrl/Makefile                       |    4 +-
 drivers/pci/pwrctrl/{slot.c => generic.c}          |   16 +-
 10 files changed, 1655 insertions(+), 37 deletions(-)
---
base-commit: 8efd812b03edcd5fff1b3a36c0277b2d1397712d
change-id: 20260121-topic-sm8650-ayaneo-pocket-s2-base-05c348efd86d

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


