Return-Path: <linux-renesas-soc+bounces-6987-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D2380924004
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Jul 2024 16:12:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 787601F21DE6
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Jul 2024 14:12:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 196CB1B580F;
	Tue,  2 Jul 2024 14:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K6ZAUWmC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E6351DDD6
	for <linux-renesas-soc@vger.kernel.org>; Tue,  2 Jul 2024 14:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719929539; cv=none; b=XE4HdDo61akVuU6GxbAB8FeOGKGFyFJ29UtnkJqrWQ1A+DJDmC325n8s6Bn+Lh3eK9hP9BvZeStaZ2wOmiBKRJ1Qwz1EitE3gnS2nElBTiLhVTil1J5r1Zfm9WDxBPzkSneLMLCxl27i3xjqvguxsCVGAmUFiXx44gjPpYSGrpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719929539; c=relaxed/simple;
	bh=shG5lZWmJIegSYpSHXhcYRFDeuQI27pdOgORWbTtyac=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Te8aWFeIen2zOq+1iCynl+0Z2iVOtEH4zhGdnZ6XyGJvw62SBsFwhjdebKLSiEptGer+JK6GI1jjc6i8nc5KIHWnSYWdeyC4rDAixLXPQwM8faDOcBH8s+9j9H4kqvlHgDJ8JBhihUtArL5+lkFEAydJiDPPoOXYw2qUTQxxJP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K6ZAUWmC; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-52db11b1d31so5937437e87.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 02 Jul 2024 07:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719929536; x=1720534336; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oJ4UA5evAUJjIoUWG77VadWQLKwj0QB4y+/NHan8kFI=;
        b=K6ZAUWmC9unUTM4EDv75E+RwLh/0SHkljVBRNE+H1um0lZVCwt7AkrIhItKDF0LDfr
         0rdd5Dtuj8wbIPQDnbSax7s9hggo+HxnNsjMgXGXQ7Z5495iqw7Y1X8+6QZstkYK2DWu
         Nx6yMgaas5nvS/j6ngQioNxujZIzBjHKm1tINiHoaDicZzknh06Lv1sFinZfqGRQRvx3
         qyPx0fZEt4blcsrcBoXa2eCKO39mO47YIaiD6YR4s4LT4Ay8F1CfAdiFYqlKeuOSDdYs
         Rwm7X6v87JKe1w0C6CXYSrGvoOBeZjwdsDixn2eV/qpXJ8GMM0WPQkR6Ff+Sy6p1XOMT
         brLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719929536; x=1720534336;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oJ4UA5evAUJjIoUWG77VadWQLKwj0QB4y+/NHan8kFI=;
        b=km1YbXoychICi/KtNXGdAdrlUZ3zqGPioBi9OXcvjLp+o/oylNtsFQtgpPmzF76QWl
         5BcSbtOqSEQdXdZ1kgrnb1hmkvy54FUX4FBxtqNeD31qCtA0swLT935N7nj4qgxg9FQF
         Jo0oR/tplqYoSOwdupUDoWsUbDK0X7lFNDCghTVZ5O2dGH2IyILjsWYYAFleGDHOg2zn
         sunT4guPMI+r0FW7OLkX6cZm9oYIGMSrwSUoA5daDQE2mcjs8N0O5FA9H+7SFNW4ywl8
         nqJ2kDYZWvI5HfUvkoyCDlZjZB9NDaDoqqyHSSxdSbZcWheQby4OWUfrtRj8/JfuCLDD
         DvcA==
X-Forwarded-Encrypted: i=1; AJvYcCV2Hcgqpch3Srncms0/11W7eTtIrKWPBMdr4m5x6LA7ahpLD4RRFeqW53MEimhf3j17Z5+ywYv+1/E8Hx3L0+c1xffI3PAhbqb9jvwEOqe5NZw=
X-Gm-Message-State: AOJu0Yz53dm7rSafNZHBgpxDX4gG9xFvfv1wBd7W0n/8AmvxNENcgx6S
	R+6WcmqyZAhmC8Ld+0oyYd+/RQHN8XOVc/tTLGci2MQqGOqRmmItOPetgw+w2VoeM8peoGbWYFn
	BSOR5pHJ5viVD1F+zFKH4JZgKSu3udfaoms72Wg==
X-Google-Smtp-Source: AGHT+IFaxQxCQEEb5o/B2PpaP5biYN4d8g2kkpus5N+4+6r8yLxYI6GBvNnfB0J6ohbOlIM6qiaouvHssrfz75vqxrc=
X-Received: by 2002:a05:6512:3b87:b0:52c:df6e:9517 with SMTP id
 2adb3069b0e04-52e8264bd04mr6961071e87.11.1719929535516; Tue, 02 Jul 2024
 07:12:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1719837986.git.geert+renesas@glider.be>
In-Reply-To: <cover.1719837986.git.geert+renesas@glider.be>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 2 Jul 2024 16:12:02 +0200
Message-ID: <CACRpkdZzj2unuMjE3TMzFfEcGzvaS0nsF8Pzh_eRwo7V86YU-Q@mail.gmail.com>
Subject: Re: [GIT PULL v2] pinctrl: renesas: Updates for v6.11 (take two)
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 1, 2024 at 2:56=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> This is v2 of "[GIT PULL] pinctrl: renesas: Updates for v6.11 (take
> two)".
>
> Changes compared to v1:
>   - Back out all R-Car fuse commits.
>
> The following changes since commit 9bd95ac86e700ab8b1a6c225685e0e5afe426b=
4e:

Pulled in, thanks Geert!

Yours,
Linus Walleij

