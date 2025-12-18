Return-Path: <linux-renesas-soc+bounces-25897-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 927D5CCC9B4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Dec 2025 17:00:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 46DD730AB6E5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Dec 2025 15:56:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E083E34F244;
	Thu, 18 Dec 2025 15:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BggJZifg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5371E34DCCD
	for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Dec 2025 15:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766072868; cv=none; b=paJQVYhICAa2nImNk/2Ond2/8EJFT/gEaWZXgzuW0sUY+IqGj50e9fTSFLoTH99vkTlnzxhV8JDImVQUiPhS+ycXLmWGy5qbP1nTYmoeluWsiNUMaxW00BDlczZBhkMjHfpiiHE09pb++Bx+KcZEObNf92ZEZh/SGd91TYRtZA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766072868; c=relaxed/simple;
	bh=LzxNzF7MpItYcU3pEGmTXATHal65pD7N5vjHukp5bDE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ed3eCqK9icYyHmJrv+ct2Z+91tSwv/i+UzeOlLtt66pmXwOlXzfgiHYt21TUD+D+u7+Uugj++AFgvaA+4YX+DnhGspttFqxHtLR/tubxm8FHyLwk+rzwDizMsGP6nUlqWWc4OXDc4dDJJZk6F+3GgV4+HJ5zo/6B+McUBftzx2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BggJZifg; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5959105629bso695085e87.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Dec 2025 07:47:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766072864; x=1766677664; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LzxNzF7MpItYcU3pEGmTXATHal65pD7N5vjHukp5bDE=;
        b=BggJZifgjvx24PLzSYnjQCRW8lcVGi8OQ3JZYKH1fJf+W1Yphj6PpOXaY/v+7/K3Wq
         svn7fUsuVdAD8JmSROt9ZGzmbTXjYttt2FcrmgoL0MMQc5OGRIf2ubxQfS9ZRLXP1poC
         ljDz/txTjHP5Sg82DWwHJHrkU8aPNTpnkAsintYGBGw1KwwG74ZAxbJ5/21OQAjIrT9g
         Zg4M2Xk8tsIh9wGMDbpVgX6TqPuZb1kmeYVaoYa7NNhxa5eKwL3ZW+KBSNKNbsam59hC
         Tf9/JyaokJRpw5kT9rU1gJaIl4QPPQaWLx56+SBJPNIZl8SkOVFdUvA3EUTrqZkJn6e6
         QQ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766072864; x=1766677664;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LzxNzF7MpItYcU3pEGmTXATHal65pD7N5vjHukp5bDE=;
        b=qcjNkuoBvNcHRCe4AC5uaLqervz/cDQulZq6mM6HlOkQhQ2XEIcdgf6m2f4xFY+CQR
         IjCMq146UHLRnIeW5G30l2+0oN1ubE7dSW9gj07cb4NXgwVPzgv/GbOOiPhJ9HxXuEGh
         baUp0XAj4lEOmVS+OAC0u4yorV+3Qkzi4s7iT7hsTUqUkrrg5jLTOG5rMVvV349PIAfi
         EyvUMkIJjeofCjAOWf5+r/pjrtdMubQn864eCsdvaKTEteINTvPPNkQ02QeSkdKHSRjP
         B68AI+TecmGPEfFwRzIBR1UN/XmG9cePpoofD3KM/ekTs21Ja+0xfH2dcLQLes3dMxxa
         r9Ng==
X-Forwarded-Encrypted: i=1; AJvYcCXHZTD9Gd7yYc284rjZwN6G1XQfbHJDL8SYh4Gg53+TKcfCBvSrs8FJkI9DEXbHkUDlkBM/NU2SZc+/q+aM0C7Abg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwftSHg6BjqR8LZ37zQoF+tvG56DyrunFesAxJN3yExfPpFS9Ax
	Jb6mjo43zy0f0+gaLIUuNXRmuHbQJnGSbU4Vs8lj/PtETb0z6xjVjwsBgPuQEqzqy6UOBS4KtL8
	aIWYuWNPBhWYT11lWvQ3FnrotB3SexNo=
X-Gm-Gg: AY/fxX7ln+o/FpQxnIkkmWKL0rshb5J/zn2kGNllXht63/EZ3t/jxBxKoeve4Gc+YMm
	XHsNd27aTQwIv2ICc+PYVzmvhjNxtdRMnv5olbUZzXnoLfAyEs80St67pQVDSBYIdMeMfjxghwg
	WXCkmNFBL+vC/WHch+dfj06UkcLNO/aa6FBhCcAKgPArR8CjuhEae17hvvFH1TwaKB0n6TXV3dG
	w7xov39zdKvXHDQszorG9xhrh1pi6No7tUEsVedoWLxOi2wAD7GSFduRf6V3JyR4gb8SAq17a5M
	ximed2EAneCEsCEb95z8eYzL4+I=
X-Google-Smtp-Source: AGHT+IGrYbGUckFbA0uI/Uak1RoxWaGizxcWDMRvFWxpw/hL/+bdMgS3hQvghW4USBbg4LCsrOKENWVewsmE9VZ7WWY=
X-Received: by 2002:a05:6512:128c:b0:598:eaf8:8f5a with SMTP id
 2adb3069b0e04-59a17d573afmr14623e87.38.1766072864074; Thu, 18 Dec 2025
 07:47:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251218152058.1521806-1-alexander.stein@ew.tq-group.com> <20251218154412.1524249-1-alexander.stein@ew.tq-group.com>
In-Reply-To: <20251218154412.1524249-1-alexander.stein@ew.tq-group.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 18 Dec 2025 12:47:33 -0300
X-Gm-Features: AQt7F2qc4TJ7gyArwoED7PIRPB0eAsifB8ZnC9eeMqM3yyZByNJJ_XOF-WESW6g
Message-ID: <CAOMZO5CmP_rdFA=PqGSmKDU+ObzifHFDjwYMD3J67bjs0h_sfw@mail.gmail.com>
Subject: Re: [PATCH 5/6] arm64: dts: Add TQ imx8qm based board
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Peter Chen <peter.chen@kernel.org>, Pawel Laszczak <pawell@cadence.com>, 
	Roger Quadros <rogerq@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Magnus Damm <magnus.damm@gmail.com>, 
	Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-usb@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 18, 2025 at 12:45=E2=80=AFPM Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> * TQMa8QM on MBa8x

This commit log should be improved by explaining the SoM and base
board in more detail, providing a URL, etc.

