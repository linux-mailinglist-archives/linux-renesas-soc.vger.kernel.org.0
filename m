Return-Path: <linux-renesas-soc+bounces-6320-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA5B90A713
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jun 2024 09:28:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EA4A41C22C3F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jun 2024 07:28:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB30C18C326;
	Mon, 17 Jun 2024 07:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h9TWqKA4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDF4E18C349
	for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Jun 2024 07:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718609318; cv=none; b=Fx9g16iHdLn4a4YFk5UyAKmNFW2tnNwZTKkk7yHuR3gMlez7bgJqr9pQ5aFBdmpNjjVry6uG+y2Hd6J9xn2UUn5XHJMEbaQOOM1e/JgdY0XtqlzQ8aBJ9dzeoaGsq2qBOxrXkFF05mFbg04fhlDFRmlv/HacD9l1P+ODWsMfXW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718609318; c=relaxed/simple;
	bh=RjqBKeGOSxgGBf7S3OsZ85a5sdG5XhMRG6WOllvDOTI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h9tac4LSCXg7nbXi7MRwEk0e0XprF1URxWedMvLN8SVpCJ7lHyTwdR6UbsHI6WRlOQatf7nR3/oh25I8RAzq2S8c7cBi1k/gjIMddvZcX7Z2826QaoA7ZZpMUFxu1FJcYzxygOR6c4IYgLFvJc0UNz3JdF+VVWM7q6HEI08Mimw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=h9TWqKA4; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-52c84a21c62so4603033e87.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Jun 2024 00:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718609315; x=1719214115; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yq4fscHRPtrzf745XjM2Gn6nzaK5dlrVOgHk/n3Bln8=;
        b=h9TWqKA4wENbajE2nMWlOpXsS5ciHwVHEVq97KZdyqwqQb5iV6RI815puG6hwuSZoj
         /Quj0zOY196fZN0yK7Kne2c5onRft41DidlRsPr1LPwvgMsPYwMw3kJ8giOO58By7rqf
         ZY8S3owA0uk2LlgRxvCUPNA2F7V8MYoiP+TXuUGX+XCcDzil5o5apRdNaC6lknB6B0uY
         53PF7tJ7hotoqv7NVaLSFBd959B4m/8CftCEPKaRq5k2YuX4NKVn/TA5ENsNKT8okHen
         Mte56ZB20jvQ4a8arIggjJFPifCsSj0CzEt5cDrB/XuGEU5CtkrQgZt5Rv3xhjdasKNb
         avzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718609315; x=1719214115;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yq4fscHRPtrzf745XjM2Gn6nzaK5dlrVOgHk/n3Bln8=;
        b=Z7IXd4HI9K022XGUviUb7K/S8J1RrQCTrqLJ99TeijTBsKqnwMrE4yDefSEsmO+a/M
         zZuPUy/2zhEOCdoJIeWXlYinlSotHjizNz5qCtgch9kZW19AbKPmhrhCY/vyYYCaKR21
         GsnlZfCK1XoDGkgcg0JKiiShuV/uzOPDLAuj9x1G7uQZyKn+yKv3/Sngm92+5yuGGiwl
         YN3avUK9RmE2Dysi4JCZDjUiH/Nwh872TMmzWUmZ92XrXHSYQtrFY4nuUBEO17pIw72q
         NP6cD8zQvQeykD2cZ4gtjAkATMmR+pFO4EcU746/Br5ZHH9ZZzRcmrbVq72rYJxr5piv
         8arw==
X-Forwarded-Encrypted: i=1; AJvYcCWb4SEjlD21QXRvTEMbvTvvMu2ZoxXhmIDBsl25ZsFFI8t9CDHB/jVw5GZntznpPz3sEpU49fXekSoqREivKFsGVwwInKpcnY8U4I4UkxEhUho=
X-Gm-Message-State: AOJu0YzrWNRfXBRPqqFVYcrCemnMUN1wr6z/Zs/YyHMaL0zwIme7zZJV
	wx5W7ICFF941PD0/p0O5t7qpWAmAuwhO5aiEk/wHZI66gdr1zr+O56pjZrq5o5SPQYVk/YQG6WF
	9gA0+FOgSZvxA13Wg7q/n1hrYMXmCWUbpGtD2xL3+sUhrFK4r
X-Google-Smtp-Source: AGHT+IGpK3NHOO8C8rUcsresgTT9K/Yx1lfadCHo9dfWB+YwtCNKlaQDh4zm+laBNu5XTG4oLXwtw63W+7bcb0Y/Jr0=
X-Received: by 2002:ac2:514f:0:b0:52c:7fc7:f40d with SMTP id
 2adb3069b0e04-52ca6e6585bmr5668159e87.21.1718609315006; Mon, 17 Jun 2024
 00:28:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1718355498.git.geert+renesas@glider.be>
In-Reply-To: <cover.1718355498.git.geert+renesas@glider.be>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 17 Jun 2024 09:28:23 +0200
Message-ID: <CACRpkdaK0DqRyouzTD4Qp_jJ+fx6MLXjBDNC7=661s8AeSt=Rw@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: renesas: Updates for v6.11
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 14, 2024 at 11:07=E2=80=AFAM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The following changes since commit a39741d38c048a48ae0d65226d9548005a088f=
5f:
>
>   pinctrl: renesas: rzg2l: Use spin_{lock,unlock}_irq{save,restore} (2024=
-05-27 17:13:31 +0200)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-pinctrl-for-v6.11-tag1
>
> for you to fetch changes up to 9bd95ac86e700ab8b1a6c225685e0e5afe426b4e:
>
>   pinctrl: renesas: rzg2l: Add support for RZ/V2H SoC (2024-06-11 09:50:2=
5 +0200)

Pulled in, thanks Geert!
Excellent work as usual.

Yours,
Linus Walleij

