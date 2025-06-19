Return-Path: <linux-renesas-soc+bounces-18541-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BFA3AE080E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Jun 2025 15:58:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 01D2717A360
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Jun 2025 13:57:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12BBE28B4FE;
	Thu, 19 Jun 2025 13:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GwcHI457"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A35A22154B;
	Thu, 19 Jun 2025 13:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750341346; cv=none; b=im2Eic7U8yUo5fVMFtFtlxPZKXHbMASIyvI4xdtU0fTU8f2f8Y4dGJ9nBbJaDmgpyE7Z8R2JLFfGn5Cuv/8sJzNOzzfP7W3y9ZXQh5MiKm8PJ5dh1AkeHCedHfL9K1dWj3Y6w+Yf6krC1cuct2E1tjVgB8K1wtGkqBsbdPzqw04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750341346; c=relaxed/simple;
	bh=lmoa1Y9xrSuZphbJLeAf0C7zf+UB/2yaORiYDKytIfY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ha+mUSDKCSyjZzo4OYkBR2NL6yejU92osEf0q45/Ui+bCuJJF3Y2y7GGsVpM2IlCLHP1V0+b7dKTD+eiAfj0coqOOSdR/hOtFA9zFxsvGCe5NByKxRnX22rNJrsPOOYRlEyUcWU84nNMlffgezTj3BP9IL7xNSS/WQrXy+/0L6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GwcHI457; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a4f72cba73so1307858f8f.1;
        Thu, 19 Jun 2025 06:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750341343; x=1750946143; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4R5nU7raCIhQWI0aJrQmc06KJOBxpWRfTDnAImcHvmo=;
        b=GwcHI457a5bXfPh/e5tVDEzDhQuLmkgaH6cZM7Vouv1Nelx9yP6e5ZaTa+AalQMmkm
         0LnGqghobG3eWxguUaeI22rXofTYhS/E+Vo1ublFCHxNW0TFlMI4nveiXnv4bNfI6TLx
         jFmRwBvJLnwnFiGRn/vL36XmHinE89oluHjXVXFg4nb3Rgg/XIOzD841YOpgariKYDTC
         VqPMWsdOu6wGGBOnRq3ClPbYKNtjSDATZJfNdZ9uY91ntMZF3gbt8uQEDTGhWtm86cVT
         WVLeJv4v20Whl2UZ+hyyyoWOwUANyDO81LMsMm3s3MYvKku1D68SS3dvf8PVtAgZRND8
         l6Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750341343; x=1750946143;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4R5nU7raCIhQWI0aJrQmc06KJOBxpWRfTDnAImcHvmo=;
        b=tUEZ1KFNhcHdUUfuOKjxnySN6wrbH7Eo/wvL3P0XwbZYkqn8rVrAi8z7SELZwSS3qu
         zPhK37d/evtf1ZCmgozwnhYz/ZWzGGHxmCAk0RKQDUaVZ+hSftiqa9w2V8BWcLboflvi
         AhQRaRzV9PcvCdeFfjqfwqo/2WXkdlRdQOBTDpaYaO9nHVOHBnmejswDFijB2ipoWBOX
         THiy36NO0jPAvyrxL4NTCWLxziwoB1iTYxxEKWE6rwM1QngG3olPREPS0PtwbYHGWjtV
         jrGWSHFDKxmd14VZg8f7Zvd8hnMSKKoX+P3yt7hYZEW/1/cnWeRdrKXu4MGQwkr3CGfN
         lobg==
X-Forwarded-Encrypted: i=1; AJvYcCW1jJoZ1lfk/4JVEJHEQpLdPV5/wLlRmyaaB+FVql0sj14h+g21oXi56pu4DthDvMvUyqTS7qenu1wO@vger.kernel.org, AJvYcCWvK1CGAm54u5N6ITsH+GusxJEbKEHobfWISGX7mC0sB0cl4daxJ+hoojVpphKJPd9/cR0k59uxqsQdfWHO@vger.kernel.org
X-Gm-Message-State: AOJu0Ywaw0odsIn/5XuO3LzZLiYKMu/HGKyPvwn11sjVA8RX5bIDr2xy
	/sFAlnbGe5yzaBkXYfRe8lNDfduhj88y3xQ7u9WjwYHjv/RHsYJM04o3
X-Gm-Gg: ASbGncvBRY11zqUPn+3d9HvQCnn5sOg7ZIMctRLjcyjg50cN4QQr1E9Cq77EjL5DjAU
	1T+ZCsm9gUZIwvsxplQxSLaXlcblibCMS4U3dICrWqGhXAIchjCJqNbKrhGqEFere+c99DYC560
	VPipMO2LkTl7t6eytuPmyWqaCSqAUbwuHxv6RVL3qJRrvuispnmg0o6fEDFpWBc/69BU91cPhc1
	8hN2Jr2g2GmGEcp97atroCuBnrx0u/1fiM61rRciwprueg0qbZLEgpHGBlL477tCYy5lLc/4mxS
	iauQ7gjLiDh3JUKVOl/7wGjuAI7/rw+S88hMVIPESiDjE4VgEhYNU5ztTGAp519Hpw6UpK117Xa
	srAc7KwG7EWE=
X-Google-Smtp-Source: AGHT+IE6Q5fixw/WXtqR0K39w4y+fiP6dzeDGCWUSAUVFrJs2R5E4wLyMMr/MW5gBFfb8EamlEQ7ag==
X-Received: by 2002:a05:6000:1448:b0:3a5:1388:9a55 with SMTP id ffacd0b85a97d-3a6c9693a22mr2520743f8f.5.1750341342317;
        Thu, 19 Jun 2025 06:55:42 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:851f:e727:733c:ea8f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535ead202asm29454835e9.27.2025.06.19.06.55.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 06:55:41 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/2] Add RAA215300 PMIC support to RZ/V2H and RZ/V2N EVKs
Date: Thu, 19 Jun 2025 14:55:37 +0100
Message-ID: <20250619135539.207828-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

This patch series adds support for the Renesas RAA215300 PMIC to the
RZ/V2H and RZ/V2N EVKs. The PMIC is connected to I2C8 and uses a
32.768kHz fixed clock source (x6).

Cheers,
Prabhakar

Lad Prabhakar (2):
  arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Add RAA215300 PMIC
  arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Add RAA215300 PMIC

 .../boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts   | 15 +++++++++++++++
 .../boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts   | 15 +++++++++++++++
 2 files changed, 30 insertions(+)

-- 
2.49.0


