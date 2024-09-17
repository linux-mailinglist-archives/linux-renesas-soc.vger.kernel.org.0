Return-Path: <linux-renesas-soc+bounces-8968-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29BC097B0AF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Sep 2024 15:20:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E51C728622A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Sep 2024 13:20:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E7161EB2E;
	Tue, 17 Sep 2024 13:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="F2CDKRin"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0044C66
	for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Sep 2024 13:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726579244; cv=none; b=HmhcaaO3awTjwCMoDTnDrD7Mgri/O42Do+PBG4whfee8twS7kItLHaRSEmHN59MqLwxwC42tW03Ed3daA1sUQlMkILSYEJ6XnDNAYbrJnIgHqxNBfgwW0JhHKkaidryPOaOfgZWpDp8qUnwNmeBBea19NvAE02m9+XTIpQDxYX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726579244; c=relaxed/simple;
	bh=agoRE+dTHQH54rKcB/aGAR+SPmCqOLY9JL2wTXnfBCI=;
	h=Subject:Date:Message-ID:MIME-Version:Cc:From:To; b=I1CF2bY1egKYQQvhHbrzPQnbDQIabdUJLC3/oR269kifoO1GnxMhxeuG0uV22IqNUS3m3bqpLUA0PyjAV/h+9UUn5oKTGBuRaLzjXV1NEiOaJ9NpTRekA2SGS0WWwhxBx/ahPFU5Zn8ywV4xKb1uFe3BtOK4SB7WOQDXfgmr9KU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=F2CDKRin; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-42cb9a0c300so48543945e9.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Sep 2024 06:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1726579240; x=1727184040; darn=vger.kernel.org;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=efz8/Dk3oJm9eC7tnYg4VLPkI9QcVtmMhA9Iue4REoM=;
        b=F2CDKRinJmQ77XCrkba67yBgiGEc7Y+3MYFNlq5ocH4fYmwVADBhPbRCEBiIJd2YB0
         IkditHPwuzFqur8pZSrcuyyAYj1OuM4gk7zr0bWxDKtW+ubiqKCrVEzlamWGFsF8ZWtq
         oTDV52otIXJdh+sl4s9LumxvxhObqT1WYlnODynPXLZMOPlmzERV1CEGpF9KrHRBfqZz
         wv9sOA5C4YK+mV+6UciVCcZdfAybQmSVenXxZ+F1qw+3PpaExMgP3LZwQ4oEWAlm1zLQ
         tKS7ZCs2M8aTOQ/RRw9akJI+hdByrs3fdWINKdfEMDhk/6fCdDR+aQx8A2hyGwrnZWeV
         3OZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726579240; x=1727184040;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=efz8/Dk3oJm9eC7tnYg4VLPkI9QcVtmMhA9Iue4REoM=;
        b=H4efQkkbQxLxtYs/IM9Dj0QcnkOx+4JMta2jBMByWuh0onRZ9dVUih8oTdwUHF4TkX
         GD1ARDkbtwUghPkjQXmLoWVEBajLVjhIhWTj1bdI2G9juzxPuZZSzJWK8xVz8+na9z5X
         5+5zZ5W2C3tfrp5xq/jyOctO70Uwp8LtdD8rGoGWD1ltTCZM9PbVIR7hBhtndw5+bx4T
         hXHuchD5Bp2EB8OW5uLEj/e4soD9LuW7nAstXGEHtnCx9QwfQT5sP/YYYS5n3Vc55O2b
         NaIwYvrJNnzmIQQzJ1gw1ltEZrP0I/30jNkxX50JXI1ae6tDFzmaQVuqCpNP/GmtEEGM
         Qcdg==
X-Forwarded-Encrypted: i=1; AJvYcCWd+jjob0tTbql5Asr/bgWcsD2uAO8xMRZYnLQxzQrCp4e4tzk1NLV8qt4HJZ+vPx8MVbwdXomWQB8I1OsKGBYzdw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2X1oAiyaeacIYGdWpNU6ZJGzk6QQYmIYePDKdEnBV7FHr/ipn
	jI1Bokfx0geRg/fq2dVNY5VU2UV/vTQLW2fRs1mre9EvzGAVxjp8V531Gl5nEm0=
X-Google-Smtp-Source: AGHT+IHfoLtvA+mRtaep/viVT0AmufamwU1g2A+08F04Ua7g+LOKCqmmS1jRE02/HpeYkCh6gd4GXw==
X-Received: by 2002:a05:600c:3b14:b0:426:6710:223c with SMTP id 5b1f17b1804b1-42cdb522c81mr134732325e9.9.1726579240250;
        Tue, 17 Sep 2024 06:20:40 -0700 (PDT)
Received: from localhost ([213.208.157.38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42da23dd5f3sm102677245e9.27.2024.09.17.06.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2024 06:20:39 -0700 (PDT)
Subject: [PATCH] RISC-V: defconfig: Remove ARCH_RENESAS
Date: Tue, 17 Sep 2024 06:19:36 -0700
Message-ID: <20240917131936.18980-1-palmer@rivosinc.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
  Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: prabhakar.csengg@gmail.com, geert+renesas@glider.be

The RZ/Five is gated behind CONFIG_NONPORTABLE because of the DMA pool
issue.  e36ddf322686 ("riscv: defconfig: Disable RZ/Five peripheral
support") removes the drivers, so let's remove the rest of the vendor
support as well -- users of these will already have to play aruond with
kernel configs, so this shouldn't be much of a burden.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/riscv/configs/defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index b51ef6cd1e39..7b896a0f78fc 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -27,7 +27,6 @@ CONFIG_EXPERT=y
 # CONFIG_SYSFS_SYSCALL is not set
 CONFIG_PROFILING=y
 CONFIG_ARCH_MICROCHIP=y
-CONFIG_ARCH_RENESAS=y
 CONFIG_ARCH_SIFIVE=y
 CONFIG_ARCH_SOPHGO=y
 CONFIG_SOC_STARFIVE=y
-- 
2.45.2


