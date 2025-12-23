Return-Path: <linux-renesas-soc+bounces-26060-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA8ACD963D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Dec 2025 14:01:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 55E17302BA9E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Dec 2025 13:01:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D45EC33A714;
	Tue, 23 Dec 2025 13:00:59 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5085D33ADBC
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Dec 2025 13:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766494859; cv=none; b=IZn5x9VB5/kR0ms3MGHU2jk9rfy84VX2L2743dhxzoKyKXEHcUEG1+LU2LBiljxKsx1ZAw8nuoKoEhN6S0ElsC7mUmbp/oJpzYYnveD3FYdlOOedyBhtKghK7505mgg7+hrwxlwfNM1zxVYbxc7CFPw7s9vpKAcE0QCO1IAYnR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766494859; c=relaxed/simple;
	bh=HEqsK9Z5r2vHLwE1iRzi4qqy0StklJQS/KD1cB0QMWI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SlrBYoDBFesIX/rTtJ/WesrXiL2uptmJuUSC+nciJ2S3/Re9byB6398tVi2S5XeGhhUDapeoaiJH1ABGndaaF7cDVaa9EUUuNodbR4lsA5VRyzGFDeubz7rjPRIRxa7qs07jMqd3KlEk8ZrAlknWa5UiZU8KbhvjZCIqQRkKjR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-55b4dafb425so3780069e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Dec 2025 05:00:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766494857; x=1767099657;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/MpJqkv6JnZsSqSn+n7d/g2Gjy+SF5KqOdVd8mQ0/c4=;
        b=KB66E1z0Txwmo5scnyblAKZEus8PmOz5Gno4Ceonecswuum6caW88DLcXkRpO9fNaA
         Wv3Icox4SYed36QEV+UUoScwDuHWILlR8Ls3sVap17ierEaCrfr8iy45/XKI7HA/JIYM
         FV08K0ljvn8mKiNusXv30AaH9h49QWgwy5GxdVdYZWvwdR2RCgsZsBCpCl7s6F+EaiWn
         rgvMbkcD6dSOCcPrbdoPc1qNjYvumqxTT+xeNk+h18iGHcAEPtQHuMAqOWTkQn+4yMle
         KPdTLTG5didBOjuUC7+qLIefPl6tagcRW9NUQ2ofcTiAtkKF7ND5ZLy4nNEnpX3BVvXx
         n8ZA==
X-Gm-Message-State: AOJu0Yy+aYDDg6XYabMQM9d+mbEVdfgCe6F0NPOhBt7cu3JO0t+ozmuO
	lGWwtkTbCaqedwAbwRjBWJf6sZ0tVNwcHzVdTEQqagZ/Gx2WzFfxqm3GUUYPrbhw
X-Gm-Gg: AY/fxX4gGQy/9/G1G6tIcRb3J0xtuIwvyzjFnHrmZ50RbVz9uAXo9K6Zg0MUX8wIC5O
	vpBKLfx5UjDIHXSX6gBO2f41sWXKDcn2YExRVzbe6Q4LJ59fOrht1wiyHDLKhcnltGpgAKZ3uXg
	z72x7ZV6uXAhxbxbc79lAGF4IJ+ZHdjrJ6wM7WeKihoX+uK6cDcu6EIum1i3RK236XUCq5GwtnL
	8aB3YZI9Tq95p6nFggUvTYBWmNK11f0+ARyatJ3UtHMg1r9IQ0ljPR3xLtD/FwVIw/XAQdlOB4K
	/c47EKTNXGWH94P3alJg+wOBSUYDuUuSlR/9Df679pWlNzF2uegnV50x83xxyCeAB0aWVuZJ+4G
	t1ipLk2eTV0JAYXLr/WzoINb8FbKGbi9REn2wFmpsuO5rfeT6pW6PGHmFXSfmazDRx97otHZJBB
	68gRY9ntPSxDFMxvgZ2vgN5NHLu4M4aQOn/p5H8nL9AD7dLOx+
X-Google-Smtp-Source: AGHT+IEhtCgcC25wiyHKfXtfO7d7X5GLNZdr3sxyZQkLrUI68fQcM4TGnHDT8etSczuAEfxARBddxQ==
X-Received: by 2002:a05:6122:8c1c:b0:55c:be5e:e9e9 with SMTP id 71dfb90a1353d-5615b71d68cmr4149906e0c.1.1766494857127;
        Tue, 23 Dec 2025 05:00:57 -0800 (PST)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5615d1665f2sm4579254e0c.21.2025.12.23.05.00.56
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Dec 2025 05:00:56 -0800 (PST)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-5dbd8bb36fcso3885646137.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Dec 2025 05:00:56 -0800 (PST)
X-Received: by 2002:a05:6102:3f56:b0:584:7aa3:a329 with SMTP id
 ada2fe7eead31-5eb0237d7f4mr6920137137.4.1766494855771; Tue, 23 Dec 2025
 05:00:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251215034715.3406-8-wsa+renesas@sang-engineering.com> <20251215034715.3406-13-wsa+renesas@sang-engineering.com>
In-Reply-To: <20251215034715.3406-13-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 23 Dec 2025 14:00:44 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUoac1SuzScWWPhZE4DRbwFZfBDKGmwFTJDkAz71-QYJA@mail.gmail.com>
X-Gm-Features: AQt7F2qXq1PzsVyFuQ5E9Y-8C4pfdYrXjw5o8VSen6X8c48D49kFrgPDyscXgmE
Message-ID: <CAMuHMdUoac1SuzScWWPhZE4DRbwFZfBDKGmwFTJDkAz71-QYJA@mail.gmail.com>
Subject: Re: [PATCH 5/6] arm64: dts: renesas: r8a779g0: Add WWDT nodes
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 15 Dec 2025 at 04:49, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.20.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

