Return-Path: <linux-renesas-soc+bounces-16178-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A04A942E4
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 19 Apr 2025 12:40:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 14AC517D535
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 19 Apr 2025 10:40:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55ABE1D5160;
	Sat, 19 Apr 2025 10:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s7xgxUNY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B98381D5141
	for <linux-renesas-soc@vger.kernel.org>; Sat, 19 Apr 2025 10:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745059210; cv=none; b=r0oiIq/Danj2Xx1misXIWgCS+XSwXrfv3ZJD+mqGeZLH8F7FElPD1btOz93PTRwG5MIlIbDHY54/+RvDRV1A550WJdUgyKvP9nuZOW2a2jKQzyqLVJT0jVhn0HMRvh/4eCvOIBZeAqQFQnE27XsYX/k3dOWsHmLLiP1i9X2xXsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745059210; c=relaxed/simple;
	bh=F/8HfcwjCYVciaSf8sOnCLPv0Ch0D3Hd1xngEvK2sAY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fOLUJG4yOQCycGJTRLzBplC2Iz85J0x5xuksnNFiKeN0/Wr5mj3uro5F8bPZNuJatubofAJ/MtzWt04j2pTjDXXenHYMQEuPFGGZ2zgBaZpHpStu73Dy7EhA90E36+1uoC8vAxYPsTC/n3q10F7tn8o13x8cnEXxY5U6RKPObgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s7xgxUNY; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-af523f4511fso2206238a12.0
        for <linux-renesas-soc@vger.kernel.org>; Sat, 19 Apr 2025 03:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745059208; x=1745664008; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zZZUE7lDwTEz2N4r/fX75wAzeLWxw2u+R07S3BlIwfA=;
        b=s7xgxUNYXmDzOJkBJBgVo6llKNEBvNeds4w9odsFAwqXWP1RlmfawngWLomgOqT1If
         adnhc7LoroqI2viuMaGQNtOlfJx0/Bi1vk/ovyQXHDxfq6fZ3v4/tLIVuKrg88Vv9xzg
         ZpS0WXHLeyedrSMf8gunZEtSd2OlFy2md5v09UJ999CK/l9ATi3WihclE1l3WNatxDuM
         q93gUe+7SOiwj+t+L3nw55UnLhspm4cG859YfZ6nJ96XgbpqHPDytcLlx6cTVGRJ7gTJ
         E2+GMdGGD87ra263RvIRZGDE2FyqlxkMzOQMntliS/uH1nmR2y9BFZ4LglmQbrWh6x+P
         I8tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745059208; x=1745664008;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zZZUE7lDwTEz2N4r/fX75wAzeLWxw2u+R07S3BlIwfA=;
        b=vbxNeCDqX/Vi5mcEf84Z4oOGIH5pGwG5QaqNr5ilN2tCKHhS2bEpThJlMwr1HK/yIk
         XrVd/tnvQfq7uwpcC59FzfuzJ7l3CSTz7oNfsLln5YYvXjyt+jAzCaKZOVvlkoH0YkBx
         l07/lKbMW6I7PXfxQXiJJ2xLHZv6nq1qcPmcmUeS2sgVJ0rLFSUgPONLN1mNEn1irNz7
         XYGG3dmCf08bfkakiyk/XYv5SF+P93JN4uq9SgaSiJCl7HDkoaDkOufK+ovGRB243fCv
         9PHAS2PFWlGltF7K+A2rQhKTTaNzR7EmU3APIFPVet0Q1A5i9kMpEPbo9ydWAHKgf+Qn
         ZHow==
X-Forwarded-Encrypted: i=1; AJvYcCVlXI0pxUaG9YHczpOpj19Yk+W4xeO9Lj/MbHTJPJn3HamJ3tzoG5bIvEgnXJxTJDpDkZJPmrKevDjeQ3oLkByypw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxIOnDQGe6tgbMbr4utDb3CZVIHf9ahgmKeJfzcGLSZ89e8ADJ3
	1AvVhl3F9W6Rvuj64yqf/KsxdGL8lp8uS6qWiHwICGR9ducBwGTNpWr4jRTCIQ==
X-Gm-Gg: ASbGncu7hjQjU8XJKqeAXptHif9tgWlrTqlFIHUqETkIQbJhj199TXR35wScbdDT/Tp
	oL3MnCAMnJqndoJ2peiauQMJrLy+BLuD5Bk/TjOUyNxRB+PW7IkJzGHjtxA+fA3CjkI/35oyHAx
	HDv9cc/KoBSs72b3W/G/ttBLZLkeOWYDBx0aNrbyhKoDiPVhtbYetMdtVemczjf3vu8C4KSNDVz
	KswIL7w++TiQtfA3QwvV1FsY5UTUpFNQnoNe7LF5qXaWYQ9NhrX8pAnVotJVSRV0gm3+d9uttYx
	+AZA7QKTS/q9KV6/fIuC1bAyHbjQk3yAQxtTC3cfUy7jh4c01dWkuUI2kWFSR+d8
X-Google-Smtp-Source: AGHT+IG48rfT7dO1+AZbhGTz/iIYddl71I2wayyAJZkp73FfKaGBUzoje28Z41u2PE9+dTi/GMGgcg==
X-Received: by 2002:a17:90b:57e6:b0:2ff:5016:7fd2 with SMTP id 98e67ed59e1d1-3087bbbfcb1mr8635818a91.24.1745059207952;
        Sat, 19 Apr 2025 03:40:07 -0700 (PDT)
Received: from thinkpad.. ([36.255.17.167])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50ed23e3sm30785155ad.194.2025.04.19.03.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 03:40:07 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Jim Quinlan <jim2101024@gmail.com>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Srikanth Thokala <srikanth.thokala@intel.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Marek Vasut <marek.vasut+renesas@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Bharat Kumar Gogada <bharat.kumar.gogada@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Tom Joseph <tjoseph@cadence.com>,
	Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: PCI: Correct indentation and style in DTS example
Date: Sat, 19 Apr 2025 16:09:44 +0530
Message-ID: <174505916020.32700.15920085651288867306.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250324125202.81986-1-krzysztof.kozlowski@linaro.org>
References: <20250324125202.81986-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 24 Mar 2025 13:52:01 +0100, Krzysztof Kozlowski wrote:
> DTS example in the bindings should be indented with 2- or 4-spaces and
> aligned with opening '- |', so correct any differences like 3-spaces or
> mixtures 2- and 4-spaces in one binding.
> 
> No functional changes here, but saves some comments during reviews of
> new patches built on existing code.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: PCI: Correct indentation and style in DTS example
      commit: 37b52f92334c522d41c44ee4446e2a74cd830419
[2/2] dt-bindings: PCI: sifive,fu740-pcie: Fix include placement in DTS example
      commit: b3274b553aac4daddad998f426995b2388c8abb3

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

