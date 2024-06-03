Return-Path: <linux-renesas-soc+bounces-5797-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 763208FA50F
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Jun 2024 23:58:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1D0B61F21C6B
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Jun 2024 21:58:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93E7C13C69C;
	Mon,  3 Jun 2024 21:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aiil5IpI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB9D1369A1
	for <linux-renesas-soc@vger.kernel.org>; Mon,  3 Jun 2024 21:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717451922; cv=none; b=EWYrmLTVPgM+rteft5h7zYvnKsjAUmk6AYa90hbnvi2r0FP19LR9Nw8r4g7xf+msgryGeUM7ZblPHoeR8dKI1A/atfWbRuZNVJN+ds6pqEuc5u+UkApV2MLno07nKJ6wbfFVli2bzECKT6PzGpPSZTtFHdk7mDHVbywfnuagUvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717451922; c=relaxed/simple;
	bh=wN4/WFcqfAe5c9eAQkw7+lyUpzRnR6hK12SvuT5DsQQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Blpdu0Wn9bbDDV5Ttnxmv3NE8ZcUEGLBUJax82aNgxc3dz/zeMr2/SFR4wr5DcvCznoM0ZJA8idzGDiZyYvlxsu3BySb7bbhbMf1tWgmyDNLPuOxfx8bmf1dWSMIm4R9k6HGj1jDrjpOas0HgSxBoIIFis2Q2I/JSBu6767To/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aiil5IpI; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2eaafda3b90so19494671fa.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 03 Jun 2024 14:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717451919; x=1718056719; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JNRpufp1GdPfpkj//wG2tsrExygVRim0BWrgMX4dCYU=;
        b=aiil5IpIDOrtEu2OOJNkm4+9GNOBy0YzCj8b8rl5unuaBhbq2UsvwwvZIq7826Y4XF
         q49KR4GUOwKAiMeowTvXUvEoODTI/MrEpLIklUn0H+yCGNb7B64W76IL1tK082/ibrQT
         SmArIBa3NViPKI2X2vZJ0dWVVaDwEySFTOfTcY0urPK34DAMDOxbwbdZZ+SZdmHlS+Dn
         Wt6HSdlFxqFJoCduzkVrhbmvwpJHVB3Pv3JPuM7wk2XD6btLOwf1gDEmub6PwCpEJcnn
         +Hv+vdqAzwRHpOmYtqW2U1CXKE/Ok/NxyO/qu9QtQTvpA4eJANrs8WE5gn7AQwjxsNB9
         0xeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717451919; x=1718056719;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JNRpufp1GdPfpkj//wG2tsrExygVRim0BWrgMX4dCYU=;
        b=n7UlFarg+zIgDZh6ZALkITTJJgIYJI3yR1mos9e4+A8QyJ75ifpqm6iiqpP5OwFgbl
         hmKw5HxlRJsMKQFTp74qFS1dfZLtMwbYBr96dekZLcqdSciAbudpYgoRT2jk8wrbBs4a
         IjrqsGxBOD9+vURG23eOLn7fEnEHE3p6JKwBY21qv5Vrf7hQHji/WiAHPhlqd4QAqHoc
         QP6pxc7DMa1NUVkcM5BzSwUIKxUhXVhXqjSB5h3NwRjlaRfyP47GAI6EgDL+ZB4mXtiA
         uyqOj8nco72FGrHIu/0riFAnmI0M5XIbYO7h7Z306ujmAeB7s5u6mlF73fxvTyJU6/m5
         RpQA==
X-Forwarded-Encrypted: i=1; AJvYcCX9BPoyWT7PYxG8utMBNgYAoDhJNg6DNx5JxDVI1+HeCpUFM+AWeCjkMIlgpFtuptqs0oC/MKaXG0adiaRWlNbN/9cbCgxSzgNV3O76WhTCvcU=
X-Gm-Message-State: AOJu0Yxn9w5ixWhsmyxrZHxGXYBCYiAs7TBd5MxHGEmguEfEclaI6tup
	VnvLwA8fa2HYPjl0ImyMPtGV+I2mLY8xrsDTJJTH7hEnxxsHsuGzfiiqXClHRyyFCDWpqDEEkOB
	UjSbjJZIFDGPSmJqV5KLIQUVTO+fPzb6o3NSMIw==
X-Google-Smtp-Source: AGHT+IEwezwI+tCkg8w1+8oR19Y3NC5bC9ftWzVF4mS0Qz28LE1PFLM3HZhbKd3pRtQ7vvGLHJ2n10uLYgbQ+xgQPDA=
X-Received: by 2002:a05:651c:1502:b0:2ea:b44c:c47c with SMTP id
 38308e7fff4ca-2eab44cd30fmr20093811fa.46.1717451918871; Mon, 03 Jun 2024
 14:58:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1717403902.git.geert+renesas@glider.be>
In-Reply-To: <cover.1717403902.git.geert+renesas@glider.be>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 3 Jun 2024 23:58:27 +0200
Message-ID: <CACRpkdahageYBWPw3N3vWOMMFnggkD-9wT5NJQPBxg9oABTXgg@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: renesas: Fixes for v6.10
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 3, 2024 at 10:39=E2=80=AFAM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfab=
d0:
>
>   Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-pinctrl-fixes-for-v6.10-tag1
>
> for you to fetch changes up to a39741d38c048a48ae0d65226d9548005a088f5f:
>
>   pinctrl: renesas: rzg2l: Use spin_{lock,unlock}_irq{save,restore} (2024=
-05-27 17:13:31 +0200)

Pulled in for fixes, thanks!

Yours,
Linus Walleij

