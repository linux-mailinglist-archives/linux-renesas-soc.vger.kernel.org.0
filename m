Return-Path: <linux-renesas-soc+bounces-25837-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D39CC7509
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Dec 2025 12:22:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 17DB630552E5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Dec 2025 11:15:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64BFA26ED3D;
	Wed, 17 Dec 2025 11:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="qlXpc7KW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6615C3A1E9F
	for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Dec 2025 11:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765970118; cv=none; b=hd0yGBwtQ+K+x+oBpUic8LOPbgOkymtEUa94eWZcORB/lyT+mV+TUnBLX/hRz0eJN8+p63mpVMrio7YEmSbriOfwM2+S3TUM2+z+adAFLmBR5whnxziMPnxAsfoFyO73Jg+281XC/r/OlBRQ7hWDTQ81dupnos6sPCPawAhdt3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765970118; c=relaxed/simple;
	bh=ewOAPZc1uTLLRex5XDX/9U5h9oB3Nl4CnrMPgz5eilY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Zp5jdiU4qUiP6KKKw8ekQbK7wCcj+KykGuNB9Z+mf0PdRks6Mi8Ei6lyHA9O16FC6l12A8eScvI1E9EJrRQKaO+vmyh2+mZ+ysVvl42ps/6zJDRhYYfYs5HNxNmYoXtPD4Mf3WHcJOZKcAl7NQv8sJg19FNQjNoXjc+BM+8GUTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=qlXpc7KW; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6419aaced59so8922099a12.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Dec 2025 03:15:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1765970114; x=1766574914; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DyGlf6oa5RfbiSrZlCMKvxwFDL5r90eILAlesdGthps=;
        b=qlXpc7KWBHL+wYRBURNFa75lQ/XdqphghYwXz9mlYql9vWoJorEdNRDikEThg7ZLcD
         /0yix7ooYe+gwBFKyeeF/GABCIgyE6cykFPto8jPSgLO3PByulhg/c2m+B9i2p6a1t5l
         y+uC2fYBbh7eHdxAVb4XZMVehe/tNJo/9NqpoO+iPZCh6+II2k8pf7aXMJSPPAbckRBu
         RqprShY25lVRvXHEhyjkcQkxz6T+c4qLlEesFo82yyeHq2Qx83NiRjnwShE/chLQ4iyd
         1mT76Ltn1CApYTotz4SwwCp0A3nVZunHUwWxJrpu9dv5B+gEWVgGzVl7Y2Jh5JPOy9jL
         4Lgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765970114; x=1766574914;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DyGlf6oa5RfbiSrZlCMKvxwFDL5r90eILAlesdGthps=;
        b=abD5N8E9NmMnJNOVd7YLDSpZjlOgTrLkPq6gT40Ye/rqCdbr1r7nHy3dMQay/0Bs28
         njVtjpxc6DrDeq+zSQvVhVMRw5JPSaSVFbSMpdsaScEBeihrQOdWzmSGpvZK18Mbqxc6
         /M5HiqwJDhqlgpY4F9Du4X3Z1tEMSAxV1YcdQKLDEvTHTzPn6oIk6LkNomRVypLYrskg
         PKjfrSoUITj0xS58X5hd67YbbOA6qjsuzuPsvmNPYo8yyEifhnie+g0heDcg3eL/UlVg
         rcF15id/6xvBD9SCctvCM3qJeL8EkezpxfgExiq1xfRkQtcAI+KPHHUSuzyiA6MusDBn
         20ow==
X-Forwarded-Encrypted: i=1; AJvYcCUQMR86yS6nxCuNppfOj6WAGPcDJEzhWGOJLJea+sSNtQ0PbQuUmV3lWE//oMbAn0FRjjMkKdiMgCOHfNH5W4wBtw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZPdW4AlGgFznvfyF/JBWUJT9FIO4yeGUR0erUTH6yhOO7LSAk
	FfeOeMQsHOaHTe53Jb866PSB0oByBTNc9lx/1Gkocc1qqHSg0oyvCtur4GZaMAIBJX4=
X-Gm-Gg: AY/fxX66OCaasRPDO0JiQmYDA0lTvAJcq89mUU3Agt2P3pnrPoH6oFDBP2KNdXYeS1n
	rRRg2qes5Q+BMsKUjsJsXFkm1URTwGG2thG6yxey/3fxsWnhZHWV066VnHrWgUQPaktZZ+ZiiJh
	JWt7XRQVIEUN1ffDtb656cJechCmXrbsZzQkcO1Na0NC5CRgXblKsvBQCiceZwwEgz9tBn4OmLJ
	6lXnH/1cigZ/w0mZ11i5oCWDaUXIZp0TvlvG4g4NmnqdcsXjYq7FltgobKVMXfCpoHU/RPYpk6e
	JGTuFz8H9GTnhDcnHRwDbqyso/au5AYJZAryPmU3dOTopprN6Sxqf9mll8YatB+znsytC2dA5ou
	p5FoUuxy6503/SvS3cuSO5Oh5yQ3AwdkchU71nnTIBHcSJm2gWqFwFy7ExLX/qE+2qmErL2LVBu
	6EIfVtmofsXpspVoiG1SSMJiNzrfAnNpJcEgxpNBp4oe6Z6G3jfvc=
X-Google-Smtp-Source: AGHT+IGrpw/ztz8lQHk5n/Diu7FydfYc10cG+TYVFE8BGuAzR90NbrZZ7iq8psbYjIViY4gAZI/J/g==
X-Received: by 2002:a17:907:3e1a:b0:b73:4d06:bc8 with SMTP id a640c23a62f3a-b7d23a22b5emr1855064866b.53.1765970113720;
        Wed, 17 Dec 2025 03:15:13 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.134])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa2e817csm1933465066b.19.2025.12.17.03.15.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 03:15:13 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: bhelgaas@google.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org
Cc: claudiu.beznea@tuxon.dev,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 0/2] PCI: rzg3s-host: Cleanups
Date: Wed, 17 Dec 2025 13:15:08 +0200
Message-ID: <20251217111510.138848-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Hi,

Series adds cleanups for the Renesas RZ/G3S host controller driver
as discussed in [1].

Thank you,
Claudiu

Changes in v2:
- added fixes tag for patch 1/2

[1] https://lore.kernel.org/all/20251125183754.GA2755815@bhelgaas/

Claudiu Beznea (2):
  PCI: rzg3s-host: Use pci_generic_config_write() for the root bus
  PCI: rzg3s-host: Drop the lock on RZG3S_PCI_MSIRS and
    RZG3S_PCI_PINTRCVIS

 drivers/pci/controller/pcie-rzg3s-host.c | 34 +++++-------------------
 1 file changed, 7 insertions(+), 27 deletions(-)

-- 
2.43.0


