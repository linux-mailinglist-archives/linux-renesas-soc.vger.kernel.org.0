Return-Path: <linux-renesas-soc+bounces-19731-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F53FB14C09
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Jul 2025 12:18:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9C9443BF39D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Jul 2025 10:17:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA75A288C2E;
	Tue, 29 Jul 2025 10:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gdskB6UZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C5F02046B3;
	Tue, 29 Jul 2025 10:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753784287; cv=none; b=ky/SJE4ZBIp08nxLKGk/QeCuSC1OrNEIpFLZEEV5CTiqxSJvcHLd8y2dv9pCjNb7Ra/WPa+1WSPfm0MM47U8kRL0Bh4vgcJR/efbkSHMk8U6Z0uXhNvanc5I4L/MdQNs6JZtKKlOIBXZi4SjR7iaKc3KxrNwzdumrr/s1ZiI3zE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753784287; c=relaxed/simple;
	bh=NuNw1ilHN10vwEgqOnWIiIJkLJgboyfff6Ebml3rcSc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IB96Gw2xw8/vZrDMaU13oD0mtV2hS8BuSKmWomQboJpuL2G01VE19cIgK95GNMzlW5pt8ZkJtdyZ4alcPl6aDx+IePpXTgoqhgpVwYxobgafF6KkSjbhpoi/PshLHKu7DKAICsdy5VtZmz4OPcCDQwkGY+z9RW7glaJ00cERHuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gdskB6UZ; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ae3b336e936so1097102866b.3;
        Tue, 29 Jul 2025 03:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753784284; x=1754389084; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hwEiTIpSN1SPBIddcumrWXcIt60tGMLxBjokT4wgL80=;
        b=gdskB6UZRkYlhHlmxyMewA59BcId2W1BT82cq0OYUuwcOLiW8B2dp1QG6LlPsyWylv
         sjE5rvUmZofr19orRQgOIU9LnVRbcGgqYTfI88mbb1Xa23ybTDJZbnQ32ffmTOrHX4Dr
         N9SjvljeUtA+sDwVawI0PD7/Q9QkVpBOSAZz28qOt/cG7RrfALWCNYpD0O3gB575+Q+7
         lxeMG3TIrk2T/xw0osMO2XSeCFI7/r3vyQGBeNDB2SCdG4mAXAW26rEiINkj++sbnCh4
         rq4wOAPYyrKbXcrylaM9cLQtAu9RzZH6Qh3nNdLvjDBnWk78dIxDa4TPBEKSdmbNGCPj
         lOAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753784284; x=1754389084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hwEiTIpSN1SPBIddcumrWXcIt60tGMLxBjokT4wgL80=;
        b=kYqmJMIxs/7vYYes4bAxOM/fzdFCsL5Z6QdMzfvgHfzHATXORdvsN7ScYExGbHPyt0
         LzirPpy6LB8hNiUezN4BbPK0xCq0/WB7jF2DrYdSa9z4DNb0Y7JocQ2ty+ZbKf2/cvIw
         Zh0+cclJjIl5Su8t89EGVRENfUfXdeoROaUx65GCdHmc045gWkU4S+8sfyLBd5wgpvs/
         3naoDy887dBDyQGxoljnCZYCbigDctNCdtevkvYIGgLsB9uImsaflHDUhSXwFNzkJgVf
         faKsmnwswyYQwlZeQaRdTXPnRyv9IuEpYeMqmJm+q8mvjn5o89IO12HUQQiaxhhd01e/
         oNKg==
X-Forwarded-Encrypted: i=1; AJvYcCUY05B6Qe3oVSvMpNhrqNnWfaK7qQd+KAy5MijCpimWt3nkVUvE+4p9z/TurGWvPkTW1REnu4g7gNnyE204Wqr32g==@vger.kernel.org, AJvYcCWfdSblQJy+fLUJa3QR29VL5H+PZAhfReIJGt+w8Ogyl327cE8aT9iATDuaxtdiXtTsNLAibPKF@vger.kernel.org
X-Gm-Message-State: AOJu0YzuZLtgo5kM0QSnN8w5TFTSrYmFWkPOPsg2l7wg+SaWJzKEI3YU
	Y8kJI7fJ7ltwjnFcnf0KwmZvqinz8G5gvOXYPcveGap5Bsiz9RcEWqtwAUTpuA==
X-Gm-Gg: ASbGnculEP/P8GzSSZTMXf5312C0s4PoZtkaPeIXHo5ytzToez2LjKqqHNUSY6jfEch
	ZeVT+USioCgHisKz5K+OV7hPDX/A/rjSm33iwA49NW0+VSbi9USn7wylWmahn2muktiPWpIdEdD
	cznqw/9r9zdLlKfYNZjcATX8GNhQAw10CFq8gLBIJ1/fp5a480z6JZ4alfjTDXxeBzdb68PZbD/
	VfhfotQ7k0kfWJkkl+Wtzd4sB2B1vCPKFPnNd5vaIeGUWleA8kmLREraRv39G8iffaIHmgu4qCo
	b6A1pA3RdOVAiLdB/isGpMqih93FWEDtN66ZHmBvQrMOMrIl7DGSLxCyvGG9fWQlSALNeWTx+3H
	GgEp8xmE36JcFMQv8O0r2oocubgq8Ff6ftY8=
X-Google-Smtp-Source: AGHT+IECkzHllH8u1QlENWvmCk7cRc6JbBNQM7rQL24VWTbtIzjG4IxN4HS3DjEUH1QFe9hf1PeAiA==
X-Received: by 2002:a17:906:ef0c:b0:ae6:f087:953 with SMTP id a640c23a62f3a-af61c2b411dmr1884064766b.12.1753784284276;
        Tue, 29 Jul 2025 03:18:04 -0700 (PDT)
Received: from foxbook (bfh133.neoplus.adsl.tpnet.pl. [83.28.45.133])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af635ad7d95sm567005366b.122.2025.07.29.03.18.02
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 29 Jul 2025 03:18:03 -0700 (PDT)
Date: Tue, 29 Jul 2025 12:17:59 +0200
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-usb@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mathias Nyman
 <mathias.nyman@intel.com>, Vinod Koul <vkoul@kernel.org>,
 stable@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] usb: renesas-xhci: Fix External ROM access timeouts
Message-ID: <20250729121759.0e9df735@foxbook>
In-Reply-To: <20250727154516.11599-1-marek.vasut+renesas@mailbox.org>
References: <20250727154516.11599-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi,

On Sun, 27 Jul 2025 17:44:16 +0200, Marek Vasut wrote:
> Increase the External ROM access timeouts to prevent failures during
> programming of External SPI EEPROM chips. The current timeouts are
> too short for some SPI EEPROMs used with uPD720201 controllers.
> 
> The current timeout for Chip Erase in renesas_rom_erase() is 100 ms ,
> the current timeout for Sector Erase issued by the controller before
> Page Program in renesas_fw_download_image() is also 100 ms. Neither
> timeout is sufficient for e.g. the Macronix MX25L5121E or MX25V5126F.

Out of curiosity, who uses this ROM update functionality and why?

It seems weird to write nonvolatile memories in a PCI probe routine.
Boards or PCIe cards fitted with ROMs are programmed with working
firmware at the factory and there ought to be no need to touch that.

And if you want to update this FW, dropping a file in /lib/firmware/
and loading a kernel module is not the usual (or convenient) UI...

Regards,
Michal


