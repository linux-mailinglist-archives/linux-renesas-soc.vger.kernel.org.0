Return-Path: <linux-renesas-soc+bounces-1663-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A436836CC3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jan 2024 18:16:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 400A328432F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jan 2024 17:16:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D50D64CEC;
	Mon, 22 Jan 2024 16:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="Vc06XKXG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8104A64ABD
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jan 2024 16:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705939562; cv=none; b=NFVZGMoAUoQth1cMj0SdE0b2L7Psw+TwvqDYYObATxVLEFdQ2QsNUoTg5WH6mV9jPFxuNKYYaR0b5dMNu9dLJNKBO22WO1u9+Q3cSy8zfR5hLDO1cwsEuxCTjUnBZylbY4uWvvsuxIe5DX1R9QZUs1MiPs5rErRgyxuwcvXUFCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705939562; c=relaxed/simple;
	bh=1jYXZfWrLOHinxcNKnqEFxQDsZbalKVKG1PbYFoqvqc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Rk+uXbaeshh7XdRcL9/Tx5F57j7h+l+sloE1JqLIoXhiqLUnRkoKr1kEYeaoNJZLrxcvvYz1uBod5fn983M4REMIzhERDBFAtv0SijVRa22wo4S0emi2ILed0+4eMCcalIZvpVJqYQyhboCo7eXfFTp2S9UQbVaOuQ7FO/YkT54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=Vc06XKXG; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-33922d2cb92so2991188f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jan 2024 08:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech.se; s=google; t=1705939558; x=1706544358; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NZNHZS0q4byKDJuigPQ/QfD5/RuPKZ9eozHLiGNZ04E=;
        b=Vc06XKXGvLhVRZE1m9M47tLdkuzN5nGATiR0bCudTly6bPuLTeel83UVMFX1Dm2slU
         8konDazj34ba3/MbajljOrdYT8vED6gjAjf7Eba+jwvvQiFbs4vXNIEmcEewoDnMg2/U
         zqv6zZxy5nckeAFdMLvLgk8Q9+zKgimLFiHJCASBjYoKcG0GqRlOW23ZrXxkCfaad9IX
         qFZWYgL4GrzyJJzVEhjyW9pO5aiYLaDo/5ulOS+rx6IKktwBA4a3LRNNXcj9OMzHumdq
         jAVtKw03m5n9VhxXmZZHPjTxQDzsZUDM0d/FvvrT4CKoDF3+CLrgL/T3ThAvQ8VdM9LL
         wYhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705939558; x=1706544358;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NZNHZS0q4byKDJuigPQ/QfD5/RuPKZ9eozHLiGNZ04E=;
        b=uxhP1nhkD8hgedXjsOn7UvTVIZvPfgowVjPuXATlit1S11FYQShY+TD7Z8xSrUC81F
         bGqtlsbPYCoVuQyIAebrmWZW7kNAUeFYwfxvGccSWlqmBToOIEQFkX+D9oOMTByoyfAq
         ypKvsgutokkcLqHjpiMfzhsv3r96CSKuxdDPHOvx34oy6E4lSRIQo5XPi1TTChBOScNL
         xLxSp91Mu8DaYh7izsy2Hnla+eWJmdhGS9xmCaapz7n1mMbX+MKZsZTVIUxWmWxjmUmJ
         YQW4i8lvt1sMJafKUSAxGTNu3kuIPwSVhhpjrO2225hvZY8pYX9ltLoBAyTeGycuGtMT
         dH0w==
X-Gm-Message-State: AOJu0YwoJvu5kYmlB//nnsZHceZBrLjGZdTQKxajEsjJFU7p9A0J8p2y
	YRPoSp5anwNO0MdO8gjH6BzYFkELSsaMInAFpvIVKPivoR27M5wici7fMfhHUyg=
X-Google-Smtp-Source: AGHT+IGn7YldabyJ8traxss0J6ziCM/pWKKHJnDem27L82NDnqNWUKPwQVuy81geKMmmj6Suep2AbA==
X-Received: by 2002:adf:e3c5:0:b0:333:3117:c46c with SMTP id k5-20020adfe3c5000000b003333117c46cmr1367025wrm.253.1705939558595;
        Mon, 22 Jan 2024 08:05:58 -0800 (PST)
Received: from sleipner.berto.se (p4fcc8c6a.dip0.t-ipconnect.de. [79.204.140.106])
        by smtp.googlemail.com with ESMTPSA id q6-20020a5d6586000000b0033921f48044sm8808860wru.55.2024.01.22.08.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 08:05:58 -0800 (PST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 0/2] arm64: dts: renesas: Add TSN support for V4H
Date: Mon, 22 Jan 2024 17:04:39 +0100
Message-ID: <20240122160441.759620-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

This series describes the Ethernet TSN on V4H. Patch 1 adds the device 
to the base DTSI while patch 2 adds an overlay that can be used when a 
PHY is mounted on the board.

Niklas Söderlund (2):
  arm64: dts: renesas: r8a779g0: R-Car Ethernet TSN support
  arm64: dts: renesas: white-hawk: Add Ethernet TSN overlay

 arch/arm64/boot/dts/renesas/Makefile          |  2 +
 .../dts/renesas/r8a779g0-white-hawk-tsn.dtso  | 53 +++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi     | 16 ++++++
 3 files changed, 71 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-tsn.dtso

-- 
2.43.0


