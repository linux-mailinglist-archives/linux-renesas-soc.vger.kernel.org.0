Return-Path: <linux-renesas-soc+bounces-3188-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 83854867879
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Feb 2024 15:30:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 132C1B2483C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Feb 2024 14:30:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B42B5129A79;
	Mon, 26 Feb 2024 14:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YaxGyCVp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 134501292F9
	for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Feb 2024 14:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708957769; cv=none; b=QQ7J/jRmbtZ45mXjH7/9vG7Xi5D5HyggjjiPsmVp3Xl2yCTYpekR4I0eozlBW+aKhbisQ+FqwOM5hbLqoIHCpKMz2wYqHOAV9Omt+3/DWIPkr0lT1ex+ohg2Wo9S2JfmCicjxinmYP7Rr1Qi9ta+0YnBDSNAo+MAAAFfbjyXDfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708957769; c=relaxed/simple;
	bh=/uLxpOLO1j6FDLAFqYCfDZm58+r5Mbfa4yVEIGWnWAk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tALPg01tfNPXpcwvpA3G2C0FyKXJpyf8TCvfnixKyLx1w0eKt+pTB5lKUXLdGHt6MPhUKJbIum6bP0PoUdNDMrJ6yn/vODtikjO7teUFWhzYq5CjlJk5RSitK2vFfPYzL/EILAVgZNCWGIXJpqo3V6kZbN0TVobzjIAf87v+Z9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YaxGyCVp; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-d9b9adaf291so2908098276.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Feb 2024 06:29:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708957767; x=1709562567; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5F5T8yhzs23v++nMWXBDO7bbMb0OiZ0ptHeCp1LPSqA=;
        b=YaxGyCVppHBulCKVLHol94G6BsbeCNEIoxz63YJqgjrHXyQyO7UvjHRBKgqv5X1J5E
         nzH9H18rZ61j+5J+VdxavpmRi6vAtbkdxH/j47beBLZN4lcjThUT8/SNo5PyE8yw6/VW
         0MaqXt+3fxnnpJRAWnzumScvHziCmjWg0Uxh/B+B0s7Aq4IrCri3iZ3IrZz+qh81Nwqa
         IvfrX3I6qcVyyuweGVbp/TW1DKOBqTQYItDNjvm1ZaxuKrsZdmARu6JyFlugyb8b6AIW
         O2/D+Ir1y0aCY7S2uAVq5YxiTBy9NMmXTqWFzYIutkx3g3Pw6pgcglHuv/FtnxgTg56z
         4PXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708957767; x=1709562567;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5F5T8yhzs23v++nMWXBDO7bbMb0OiZ0ptHeCp1LPSqA=;
        b=EjLQku3KGFVq9RIhkeHj1Xl0GQxq1Xb+HQTHIaD4uuzoRgUvA3xOUMIhQrv61VzRRo
         xO4+ej14e3MQntrhRc8NoNuLJSR3i0lU4m3TZIa2nr880NhVGOCcpdoXsCuttdNr4BQ+
         e+IpyJ6eCYnSqubkzA8c0Q0YRVnDPg6Y32RPm6TV/em044dTnA4RoB/uCOMbzHyKPrNa
         REBJRlEGq2Ah0bbnHkW6PPgeZVflFHVQMsleUbjsnQLIOOa/F2LQesGrlxbrkR4yfCe5
         FA0XkuWpLXr2aDDd4IHa2xgNuPe50j2ODw1IZH3ABCfHry1lGyYhfAo2oacA1SZGAyVr
         xigQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9OXnv6iiKFZzOy0l30Tnsy0xpfAB/6RCpxBFjjU6sELbVYZnqQOPeiSvM+MmLj74nhRqAoKBuBgjYKrjO1DV81wmviaLKjmrEdWGl49z/knw=
X-Gm-Message-State: AOJu0YzdEqHiZRO3li4mUTRoLagNWsRe1FTfi87nIsE/nXRx70G2hcBa
	H6PlbbR6ZtbNvpZw0x++JjFYscj3qq+bXniyeADHxsasSSJrkXV4L6+7sV3BQ8lY0aAluGJFnAB
	lPB7q2rPzLUbyevYODyauCFUoqsgXP3NpLHz3wK6imLN3jKDq
X-Google-Smtp-Source: AGHT+IEtZe/qnAbXXtUFnbg1Zv8vz7uzM8JXNLyuoBa8av7j0M3XZuoXCJuSmdwEFXMRCPbpjqFDWFl7kS4OBvoH4K8=
X-Received: by 2002:a25:ceca:0:b0:dc2:279f:f7e with SMTP id
 x193-20020a25ceca000000b00dc2279f0f7emr4078190ybe.10.1708957765601; Mon, 26
 Feb 2024 06:29:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1708687406.git.geert+renesas@glider.be>
In-Reply-To: <cover.1708687406.git.geert+renesas@glider.be>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 26 Feb 2024 15:29:13 +0100
Message-ID: <CACRpkdanP4nPDFwcskLP8AQ9mYP8aubK_RqXqMxk-RJU6y-zyg@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: renesas: Updates for v6.9 (take two)
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 23, 2024 at 12:28=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The following changes since commit fea58424e2523376ece6f734479e63061e17ad=
7f:
>
>   pinctrl: renesas: pinctrl-rzg2l: Add the missing port pins P19 to P28 (=
2024-01-31 14:50:44 +0100)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-pinctrl-for-v6.9-tag2
>
> for you to fetch changes up to a6f06b909fee72c679c565adfa7f080f9595e336:
>
>   pinctrl: renesas: Allow the compiler to optimize away sh_pfc_pm (2024-0=
2-21 16:34:33 +0100)

Pulled into my devel branch, thanks!

Yours,
Linus Walleij

