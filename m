Return-Path: <linux-renesas-soc+bounces-24988-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E7296C7ABE2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 17:11:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EA0FD4EC2B1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 16:09:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48FCB34FF53;
	Fri, 21 Nov 2025 16:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WGS4Bcj0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC3C234D4E8
	for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 16:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763741335; cv=none; b=EU5izHxo+kPszUWjt5yPfZthrhOzRAiwDgjrOcGXzAu4Vs7ZTUZvTYPlfMtbWBPCKv01sHnX9ckg6t4IFKbMBlYWXRb+S33cIgiEIi0oUC8n6fSxe93w+C/AIOXo0z6B0KvhulZqpSJ354GL/H4IoO8u7is5+Yt6xaBhZtl646g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763741335; c=relaxed/simple;
	bh=7ti1LkaJ7GEjSiw/Kxv1tDD3JzJyQQoABu+37FbuNnk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fAYr6CPMaRxlSH5GbSPoEID6hsIZHXLzIj0r+gboCF9pfUO/3kjTEcibPDdyWHz1auMVXqZzkZ2jRHVfFu2gqjJ3ZQy5cMhPEFkb28J69wtasSYlxqCZzFsuO9XxKc9WFjWO0NubFG+cgPIPXa7E5i95OSvs9cflu2BP8+WmmcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WGS4Bcj0; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-47789cd2083so13689345e9.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 08:08:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763741330; x=1764346130; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U2wLPwX/66fvOGQrPKIlcFv7sBz4/0jky4dTNMZ6toQ=;
        b=WGS4Bcj0ocUYIrwbZzIR2lcZ3VpQmX7THfMzEP9W8mPp7nkIk/CSupDCl01MFXwY/z
         B6+gGaS1bTzCZv2iYUFp3LSI+HZaa13QQDpus0qzJNY4cd0AMpKeJxK6ftV84mnOygbY
         vJ6LKrAayroq0fdtbs+VFPQluC6fJFAMdNC3a/QrCmeB6IPg20MSeYFeA/eEGashHDZl
         efGmh+5QQoZ2mMjcJuiz3xERj5KQrT2FEF4oS9CIe8zW2M7r9pST7RvdTgNh19IHmk2T
         j+Fqf32hWNKXnTMU+1uxCscUTpKWpyCmBg2cWnuPq6M78l99h3Un5vFvQ63suD+bR8fF
         WoIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763741330; x=1764346130;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=U2wLPwX/66fvOGQrPKIlcFv7sBz4/0jky4dTNMZ6toQ=;
        b=HkMDhtfclIMVwu3Nf/0F2Gg+/N8IItvic6c4XyTbxnAW5Nv21hSWsq9DECGFYAsY7b
         OWXsaXAOGMla+UZfkIUeYbLMGElt7dW/SioUy+K/KbgE5UsKbgM4SVIkOBLJl9EbmXga
         lbaStQqFH3BITbQ9EZMuTncwExnSPOGY3RroBAxL3uONgRW0Z6MoJba7qfvHeQxVyvtY
         KFeki/2JpVWfVgVFs20DvAAvXJS7sjuAabr2LxGLG2sY3u6/vMo1LRnCBuCBunijAW7+
         Vzg2HD5JxBD/O9GkKuWSYZLyoBW6zR8xmhv35aYyYYt71MlZ9bu/1LBmxu4KsUw5afF0
         y2+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWo2JwOYza0T5wEzRwHfZKrkY88ERc5JfCDgDlzr+rCeimhYDm1kYdQYSAuFsh2uabPNFJ+PJNOLM2IQ1MjY2VxFw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwUwkHGCC3Rlt30tocAAjCqSFsONve82d27OlLW6d+bOGME6kYX
	RxpweOnzgQ2781RViaF49Qu8YQ7bu9ul8QlYJXFiqw2/XAw6hLoUTMqL
X-Gm-Gg: ASbGnctku4I9fgn7aDzoIpYY26Lu6I6idBNmMzvZqLY218JW/SHMbT8qrz4BmhQOvpz
	lRGYkXSl856jkUvuDsQBsk7h5les38tjj4nMCj+pm93tEjz3QGKB1KeYpU+IdLGy8++T78IpYOz
	iPXhV4NhkGgW8qXEiYKRgqKvBARb9fuUazKFGU8lTDOHIAUaczjbQaGRsMXVFXMB8oKcu3L1FE2
	y3uhXnOmXZiFpMz2rsH8dtGtLa02Lh314wzwZjPV/4tyRaP1/882rQSdet79PhdKnKzlTPybHMt
	o5vH0z7HOXiBlUnAVXwLqa6WIwHZsbBscGiygW2czRnW/3Bhm10N+wQWH8/tR/n4q5tSxjdNH4F
	Z4aFKpPqrfj6us1PbdntGd+nsIPAlDxg4tnTDG5XmvqR4Qo4BeulIK0LyUoAuxXvmGk8eMAeUJc
	r30IbWTd1oQCcfdSIY663PtnKMRz+H3bWzMJpnLR5foHTqTLureiBMDwahFczz+PtHKunG5ZM=
X-Google-Smtp-Source: AGHT+IG/KxHn9JP2lXt93n0uZ4RQ2Mm6QaQadKnh/31kgIK0jQLYlRDopxeF2kmsHVNusB/9ER1cmQ==
X-Received: by 2002:a05:600c:a07:b0:477:a3d1:aafb with SMTP id 5b1f17b1804b1-477c115c657mr30075725e9.29.1763741330388;
        Fri, 21 Nov 2025 08:08:50 -0800 (PST)
Received: from biju.lan (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a9dea7fcsm89496195e9.8.2025.11.21.08.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 08:08:50 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Eric Biggers <ebiggers@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Luca Weiss <luca.weiss@fairphone.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-kernel@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v8 07/15] arm64: defconfig: Enable Renesas RZ/G2L POEG interface
Date: Fri, 21 Nov 2025 16:08:14 +0000
Message-ID: <20251121160842.371922-8-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251121160842.371922-1-biju.das.jz@bp.renesas.com>
References: <20251121160842.371922-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

The Renesas RZ/G2L POEG interface is used in SMARC RZ/G2L EVK.
Enable the driver for it in the default configuration.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v8:
 * New patch.
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index dcdd4fcdc2a7..f2c28deb2283 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -688,6 +688,7 @@ CONFIG_PINCTRL_SM8450_LPASS_LPI=m
 CONFIG_PINCTRL_SC8280XP_LPASS_LPI=m
 CONFIG_PINCTRL_SM8550_LPASS_LPI=m
 CONFIG_PINCTRL_SM8650_LPASS_LPI=m
+CONFIG_RENESAS_RZG2L_POEG=m
 CONFIG_PINCTRL_SOPHGO_SG2000=y
 CONFIG_GPIO_ALTERA=m
 CONFIG_GPIO_DAVINCI=y
-- 
2.43.0


