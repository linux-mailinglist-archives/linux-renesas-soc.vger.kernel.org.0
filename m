Return-Path: <linux-renesas-soc+bounces-13374-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B63A3C4B2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Feb 2025 17:17:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0AC1017BBD8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Feb 2025 16:13:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BEEC1FFC5D;
	Wed, 19 Feb 2025 16:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="U7dkyGrk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 063411FDE0E
	for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Feb 2025 16:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739981575; cv=none; b=Zwbl/WnD5UpZLl0nOIMr6EyC1p1Z0/5Gh9avFAmeOU7uyytY10HsaRtu6g1DFns9Tz5ErxkzHLgOIJtnHZahu8F2rTDGZvpg4/0k4ivpOz4LFM1qpQlUYj+YYUDPhc+u7uLnYYajfCVIz3udi2doWmg01WqZIxU0opkTwMQndi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739981575; c=relaxed/simple;
	bh=axF2Pp59a3z4NWipdCDsQn5fYbe8VXVp+WNIBSWoobk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jn+vk3eUEs6nqD7nKSTTq+905CRUp8x7yu8ABms1Rdd8D3ajDsAqDORAjILjLWKM6pcWceL+E17PTdPO8ZjgtAYzpjzEhyy2u4q/5XLQsVKGk6QOnYsEjqscVeG47mUnt2DNrPbqtPcvK1PNV0qvv+ZD2Yv1GMEKnyxMZ8WypY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=U7dkyGrk; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5e0516e7a77so5609064a12.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Feb 2025 08:12:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1739981570; x=1740586370; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pWZtx2jwJGHqxUnFIBqmFUKuSbo4cAmKHNmhP1PJ3qc=;
        b=U7dkyGrk+ttK0dBMzESf5NGFwMmAxjA8UJMS83+gUOGqgw77NA+Kcs76Tp0u8TrZx+
         MpvnW6norj9M/3wAF7r8jJPUjriTxpjBV4rL62kYzfUgGbwAwcU4peRZIjICqcbROaTT
         tlChDhdkpfh/TEg0SsYQws4ozNLCc64+onzzlyEC202M26DV1wt5eCVVnYBXGcoAzWmq
         3Pe5XbpBfwVJeElDM5C9BdJIDgEKCEAFruwVi1x3pYTd5qg1WJrmJs0rN/z1JpoB8NVC
         xndkNlTKzxz6oqeJB9G9MIzf0U0MF/diy4X3tJ06kI8NX1NWoJNR+WAWXgFCOX+6B66c
         D99Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739981570; x=1740586370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pWZtx2jwJGHqxUnFIBqmFUKuSbo4cAmKHNmhP1PJ3qc=;
        b=juF/IzxZV7eRHgJCo69X/vIxPTK0DnM36TH5N52qps3q8gXx2ic/enH4h0UHq65kKA
         BC8OjO5Q7/610J3EibBQQPEKy2vU8QnNqajyfdhWAT2zpR2TAC36JkuGi+k5vA3rkBnc
         PLKRXYxYlxbQP93gyJlHe/4hmoVjcFEs8MnUtJiklFNc3vp9QPHDEyQPnJ2ioouuxb6D
         QAl5x5X26MrgNKZz1+9FqLPxvgLsuB9onRGEtO/zOsBA+tuo1Jv8MbrK3OmVBJg24gjn
         kDJTH0JN5uFl3De9tbdd4bpQwia4sKW8wwtwOVkhRFos5aUjU/vxxGkBGtV00B+Szgb6
         Ws7A==
X-Forwarded-Encrypted: i=1; AJvYcCUDUCjoZtRCbh8SVA+V4CMYPQIFVyrC9eCglXAjylYijHo8GR1bRPLfP8wONe0BXFr57lS5Ne3/D48v/7qBl/c4EQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyL9TGm+2BOSbsi4uQbnb04O3fDYbB/4zJ9pYGeAtmDzEZSLw8c
	8hXrcL1huyK++sqRUNUztlpc6qLKjh/5bnRAx0jMki44yvk+FOXdnYWyTvEt1n0=
X-Gm-Gg: ASbGncu7qjff/QfbbF+Vp9B5JZz+I1dQkhawF88x4Ps4fAQpvoUbogvMMozJR1ufeA9
	O+k1vH1E9kWGCOWDW0aoBClsV0u0jwFWibPNF0xm4TYZFmbd4F+HDXJR+95eW1cGANY7NwmwEzl
	O+CImQXTuvBtkYnpJXrkRlTh41GJ7Ub0P/PtEETUE0z4X/viGh0ob+VBO4g4Jiim/FVAcCWjpa1
	m42ct0VV2/48JfvQPO7p4YbaPGEls5VdSbrQ0lT+hJ1kRffNVslfMlVmfL2A8RHxt4OWB+pRZa8
	K8B32OUVcQSd33gJjwZG/aVcV5NScDMyuxsxSLvKVjTZ
X-Google-Smtp-Source: AGHT+IEbhm7NcKnV5miBbyC3Mc4QXaqAGBiokThdnN9Unuo9244Ug/u1c1MM+nOw29agWhNsuqTOsA==
X-Received: by 2002:a05:6402:5111:b0:5de:4b81:d3ff with SMTP id 4fb4d7f45d1cf-5e0360bb387mr15073998a12.13.1739981570329;
        Wed, 19 Feb 2025 08:12:50 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.25])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e07f390626sm2548881a12.30.2025.02.19.08.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 08:12:48 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: gregkh@linuxfoundation.org,
	biju.das.jz@bp.renesas.com,
	geert+renesas@glider.be,
	yoshihiro.shimoda.uh@renesas.com,
	laurent.pinchart@ideasonboard.com,
	phil.edworthy@renesas.com,
	balbi@ti.com,
	kuninori.morimoto.gx@renesas.com
Cc: claudiu.beznea@tuxon.dev,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	stable@vger.kernel.org
Subject: [PATCH RTF 3/3] usb: renesas_usbhs: Flush the notify_hotplug_work
Date: Wed, 19 Feb 2025 18:12:39 +0200
Message-ID: <20250219161239.1751756-4-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250219161239.1751756-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250219161239.1751756-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

When performing continuous unbind/bind operations on the USB drivers
available on the Renesas RZ/G2L SoC, a kernel crash with the message
"Unable to handle kernel NULL pointer dereference at virtual address"
may occur. This issue points to the usbhsc_notify_hotplug() function.

Flush the delayed work to avoid its execution when driver resources are
unavailable.

Fixes: bc57381e6347 ("usb: renesas_usbhs: use delayed_work instead of work_struct")
Cc: stable@vger.kernel.org
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/usb/renesas_usbhs/common.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/renesas_usbhs/common.c b/drivers/usb/renesas_usbhs/common.c
index 6c7857b66a21..4b35ef216125 100644
--- a/drivers/usb/renesas_usbhs/common.c
+++ b/drivers/usb/renesas_usbhs/common.c
@@ -781,6 +781,8 @@ static void usbhs_remove(struct platform_device *pdev)
 
 	dev_dbg(&pdev->dev, "usb remove\n");
 
+	flush_delayed_work(&priv->notify_hotplug_work);
+
 	/* power off */
 	if (!usbhs_get_dparam(priv, runtime_pwctrl))
 		usbhsc_power_ctrl(priv, 0);
-- 
2.43.0


