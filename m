Return-Path: <linux-renesas-soc+bounces-26311-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D8315CF57D5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 05 Jan 2026 21:17:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7156F30DCC5D
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Jan 2026 20:16:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 324511D7E42;
	Mon,  5 Jan 2026 20:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ocZDw/Ng"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4009433A01E
	for <linux-renesas-soc@vger.kernel.org>; Mon,  5 Jan 2026 20:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767644162; cv=none; b=YVaenZDGG6/JkfqcCEPmQS2Ly3bjSNWgRr3nGgKPEHRJlJX+iahSmblMieL3ahqmE9s0V0pPfGlGj1rlUmRtO5bioD2AI6Se6usbJJANzxFxaLf9XoKy2WPhmLo+wofpxGKKWisGWuHD/l2SrTJdGNvN0myt1f7l0JAKtJU6xdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767644162; c=relaxed/simple;
	bh=isx8tZ/KgDsBW8GX1w0daR0bqpms0d4lc8DbbBBJ5xg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=KHlpyW2avnt9gU9xdVjtJa2zd6XcT8u4FH03PqtXqCEc/Q1DG3hBqzaqHD34pPJ9uDW/arYU63DyItJY6qD2QPrnkE0+twuInGu9zDklFucfWq3yn2v8CNXuA90jm8yWkhDvmJ/eGFvyLgHf4OCdc8qmhgcHzBOFSXvORchpwd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ocZDw/Ng; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2a07f8dd9cdso2614975ad.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 05 Jan 2026 12:16:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1767644159; x=1768248959; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wNqPSklJFm7WommF1LrsVSvRrNDwiCgns7zSiqfr3I8=;
        b=ocZDw/NgxeZ+mwZXN9Zlk8d/RUNhNlQRi4MO7EC/4oiY4Sc2RXr2cDUje/Q9Vd0dpb
         qm+d+W22XFBJ4Zqck8/1wQ0CIL9VKkCi8eKGfsMJTA5YQDFYeu16i8H2xVfIcbxORIF1
         +6ikL3pCeP0Iv5rc+9RBaWISHXD9NvSzwVeOvDobgoYLqlNTrXldIZlfjzgV/56EssKv
         fQDPO6bmt5DI6sa94xxm7d9bNRbYhA3FPhn23AWqVhcT4NdbJjI4MVla76vp63dhXuOE
         WV4apl7t56dgLcvV3LtqocGnsun2qmLh0JALjFazPkYG6zPmh01SLnHOWWt6VmmIlK9B
         g6MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767644159; x=1768248959;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wNqPSklJFm7WommF1LrsVSvRrNDwiCgns7zSiqfr3I8=;
        b=BxleUrs6IjR17x2ySkZsfmnFl8hullpNAuCVwL3X9vtMUnXtXmVeL9W0aGeLvL8WYG
         QtpfPf2uI64ndUia3+HvIRR6yWKtTLWhcqe+FSGZ7perU6CGdHQaE7pKDosWJB4GSMIU
         OhVQd7cjfTvzITplrrSmz7t9+kkyVz9xqPpDPVjn903KQ+HB5Pcf7Oy0YnWYTkMnc9nc
         Q11NFKE6bucdEJasW+mx9R3tXDVUAy226Uc7+1CTCV32x0CYnof1PI/zFq5WNfie55TX
         rHXV2bmsCMbfAnn7ZG0t0JGQdXmrcic2gNZf8Nts4uyRSZ5NKxOAr0PhqaP2gGhL6pKw
         yuPw==
X-Gm-Message-State: AOJu0Yxaodx3BgfFccDL359twT1ua8FfKCzwmwhq8q/XjqMJa4jX86Zw
	qylLm+9kjwDMcHymC2/EcYaDuz2xPk8RZVISq6gt3rYSJa/AiZqT31/yCMiF+s92n3o=
X-Gm-Gg: AY/fxX49DR0IxRoA/0fxPvrDVKHWwv4oxDwE6N9IWoPhg17O+BaznQhDTqFULOryFgn
	bq5L7JJO0gNtd8vAAmluR0Us7jx86JjbvY5bTwDgtLpOUZF3LrCkacNQ3T67jUJzVWw1/Y3nlDA
	bhz60QazN6+sOnVUHkldl9Kr+uPJVNJdHiSLbVew2Cr5Cw4rpvdYlpVcR99etMAnbGLANai8Hbl
	OitG1wSzVJSso9LWsTNN1Og1x944/+kydNL61/iKLsVpLq1W2a6aWjaeBOdB/7rwZoO5ZDx9eLF
	sMEiAHnUA28LFcxe5b6HiP8sAbAgu4RosUYpxmulzrnQU/o4M8MNyoDmIiaI2GDi3Ht65eGq6Bl
	3qNtYzDeKdlOAo/4Mztwya7yCO0IqHYjGjkKt4eGqC6PO2q1FaSEZUWaL74HUdab9wASJrRevKK
	WSDfe111y7
X-Google-Smtp-Source: AGHT+IHfr8XE6k+bGYDQot7AdQMy9OZfkG//q2v3AUg+8RsnBdbZ9rEFP0yZYdIdt/G68wKJ/++tRQ==
X-Received: by 2002:a17:902:e74b:b0:2a1:3cd8:d2dc with SMTP id d9443c01a7336-2a3e2d44154mr7368205ad.57.1767644159531;
        Mon, 05 Jan 2026 12:15:59 -0800 (PST)
Received: from localhost ([71.212.208.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c3a311sm1028145ad.19.2026.01.05.12.15.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 12:15:58 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Roger Quadros <rogerq@kernel.org>, 
 Tony Lindgren <tony@atomide.com>, "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
In-Reply-To: <20251212203226.458694-6-robh@kernel.org>
References: <20251212203226.458694-6-robh@kernel.org>
Subject: Re: [PATCH] ARM: dts: ti: Drop unused .dtsi
Message-Id: <176764415854.2561401.11477878819275792210.b4-ty@baylibre.com>
Date: Mon, 05 Jan 2026 12:15:58 -0800
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-a6db3


On Fri, 12 Dec 2025 14:32:12 -0600, Rob Herring (Arm) wrote:
> These .dtsi files are not included anywhere in the tree and can't be
> tested.
> 
> 

Applied, thanks!

[1/1] ARM: dts: ti: Drop unused .dtsi
      commit: 9da91ec4a6b22238d9178cbc5679467ea4261df3

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>


