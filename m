Return-Path: <linux-renesas-soc+bounces-15436-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 801D7A7DB7D
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Apr 2025 12:50:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3A7623AF6A6
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Apr 2025 10:50:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1412923A98A;
	Mon,  7 Apr 2025 10:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UEiWEpnU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B1C238D2B;
	Mon,  7 Apr 2025 10:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744023014; cv=none; b=bM8YnsN3ovQipxmZM4f0vspNH5YNJ1DRhbXLUDLl0+o5W8mHAHf99jH4P8Q4PPzAIsk+YABP5jWDJjXba+9yZfAaVu66bzQF4iNW4n4VaN+GusKui6psKUn3Cr7QnMlkjKuEA10ZruVVqMnY3YMKShHvRqgkvxgdynblpeR91w0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744023014; c=relaxed/simple;
	bh=ATUIayw5g2MB/P4Cf28yTaKbzDcul5/51x1bj+KByn0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lqqyLtchguS8OcDWhbKqETVDZxPlIkvbd5NBZRSu30H9ZTq/Ww+37o+ixz3XozAC8i7CCwGX8Gq1TsWOlHrbFIB5EQWEwgDuURcpkQo2ZWvz24+f/+tqFG/64jCkvHqk5/4E/4KEQy2NfJyv4XPD9nQB9mu7qVigicZK9IvCToA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UEiWEpnU; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43cfb6e9031so38955555e9.0;
        Mon, 07 Apr 2025 03:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744023009; x=1744627809; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i42+usEMrEMKE2Zbz9YF9lzk6FXr0K6ureFV6wMnEjA=;
        b=UEiWEpnU9/C6goqOEo6ry0ZAjc2UQnR7oFOg2/f9cM+Sg5MlqqhO5scVCfUC3F8StC
         L2ZZnJ0BLCuH35Dz2aZGxPWxvk+VH/OD0u976GjfQJWVTQFawmXp/3PklG2dzbwNXnOW
         BZvLPD4AXxt+j55e2cuzmd0K18MsDYfG07I/DfomR+AqmwGzNIRr7ITH9LoL+cUFslz5
         9tglTH/Aq4T+1HxiwTMf/mRJd5WGzFdNWR/rtqshlAmmKMI0OlBaBIXo9IumheQsJOiA
         ckd/yjaXYG7EsPUudD4MmIPQM73224OPvLSL0+liMRjXQ/az6dTQpZw0zJuaURKpjno7
         Z+FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744023009; x=1744627809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i42+usEMrEMKE2Zbz9YF9lzk6FXr0K6ureFV6wMnEjA=;
        b=sG9aad00j9lNO06dzrzZWMt5bQXsr99URG8SG1zsCVcpAsF/9gH4lZn2ag2s4aFRAB
         1TPcyegq5LJLnvHc8zJ0mAoKO6vOCTyZNFBIsFATrMQHRjmRVRntVjQ66Bvbp7H8LOqy
         neIetCEHVKgkaTlZjHpEIjGVqiD2Qu8eQNtP5t1TdIU2hwuE0IXJZEq2Ge6dRZm/JGOR
         IjY6EPHCIK9MUIwBIOfjWpgeU/WJDmGlvJ0amreoOKeYeW/iJalqWO1q+NryT6gJzPZx
         jBNcgsoeJ5I1/VBpSloOqCj1jOcudLWi8sFUW8Z8RumvFaq/G5lNM5itfwldmFEGDYKK
         hr/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUAx782JikfewSIAo6K48lY48/WfmbI+TNoECwYm8ghVHzYJwtvkE3r1my7sg0guD0Ze8mmPmhSGyNzG1k=@vger.kernel.org, AJvYcCWUzOUJWlnhHWfy1wHo6/i3wBxIUBSsNrXWQVCthqllFp6eh/rAWoVT5O/1k+0rswcsErPU0CEHmVg2JzFQNmr2v/g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxw30xiOKZOgDTPXrmaxL9VJkaGRWr3PWMFsUCgSTdT2Pb0t4Wx
	sUeFMhKby+dQcFYgMDj++Y52zpShhSRAjZmMgeZ9I2mpmFEbg4Pc
X-Gm-Gg: ASbGncuBRwkwX+YGH1rzWO6AiO3fOICyCydKv7tkG0oK66ttSyoYeTy61CyYxOZ+ppV
	Ux2nADp0usM7d5fGjV27V2piGQfE7gA6n7uj4RtLyMxCOW7+U4X9jziGrKcMgfdFlyiIvSQl0CI
	ZzDMf7JBvAa/D9OwCkynoOulJTrJj76i7O/tRRXyYAPwS1MxMiCL8J4ntD6cyMf1y/biUu13izz
	MkPinFISpa33AnQSRbhQpAHTiUUt/YKbQMqGMA21OID9KCfAf3TL6HXLMocTLkkwYxvkakLRTaG
	x52BKQ9tHyK/TOJkU1Rn5xCPeh8/A4gn7cnyh9igcHs4C9JWy3PMZXUUFLLcCqLn/c0t0OBiqNK
	0qmWQ
X-Google-Smtp-Source: AGHT+IHQlntxN4Yte+Z25fvQMt+ZJ4riNzZQNUAzoCOp/q+xF35N8bB/U0sBBM35bJV4TW2DFangTw==
X-Received: by 2002:a05:600c:c11:b0:43c:ea36:9840 with SMTP id 5b1f17b1804b1-43ecf9c7c07mr91540105e9.22.1744023009402;
        Mon, 07 Apr 2025 03:50:09 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:78b9:80c2:5373:1b49])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec3174cf0sm129975765e9.0.2025.04.07.03.50.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 03:50:08 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 2/3] usb: renesas_usbhs: Fix typo in comment
Date: Mon,  7 Apr 2025 11:50:01 +0100
Message-ID: <20250407105002.107181-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250407105002.107181-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250407105002.107181-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Fix a typo in the comment by correcting "deviece" to "device"
for clarity and readability.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/usb/renesas_usbhs/common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/renesas_usbhs/common.c b/drivers/usb/renesas_usbhs/common.c
index 03d4d40c90b3..703cf5d0cb41 100644
--- a/drivers/usb/renesas_usbhs/common.c
+++ b/drivers/usb/renesas_usbhs/common.c
@@ -710,7 +710,7 @@ static int usbhs_probe(struct platform_device *pdev)
 		goto probe_fail_clks;
 
 	/*
-	 * deviece reset here because
+	 * device reset here because
 	 * USB device might be used in boot loader.
 	 */
 	usbhs_sys_clock_ctrl(priv, 0);
-- 
2.49.0


