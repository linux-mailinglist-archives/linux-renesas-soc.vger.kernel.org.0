Return-Path: <linux-renesas-soc+bounces-7125-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 06635928671
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Jul 2024 12:10:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B2006282C51
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Jul 2024 10:10:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECC571422DD;
	Fri,  5 Jul 2024 10:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LaRKZUbb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A59113B5BB
	for <linux-renesas-soc@vger.kernel.org>; Fri,  5 Jul 2024 10:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720174211; cv=none; b=c8GoX/pCtP/RADEVY8ZoURxl75QVkBV2BjLOEoPzfeklls9iUVu4fGuELe112SxJz8cl49pzxxB98KkG+CWp670aMFkp9qUwaufZ/PTscZvYvDROi0AR5sKq+MiCxG3gu+8kwxQVkSVqfnuWRRn9+vt8NdAxApWw98JphAv8cx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720174211; c=relaxed/simple;
	bh=c9HKBSkU881QyZ6TmYsFOtG6cblNGj4kJLXG8VMTfW0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q2Kzm165JBgjhUcGzrx04wzYtiX0+Ld6j8oX1+ltMfthxFykM4oEIslagSqITEPiGMujNCB14M8wBo4SUE4pnjrTG+mQgi/YgKtg9Y057vPZ86YBNzgMxqhHtBjDNr0IyNvYBhtohSSiVKxJXQ9t9P+F8yYFZNa+tL6Oc14bQyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LaRKZUbb; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2ee4ae13aabso15278871fa.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 05 Jul 2024 03:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720174207; x=1720779007; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5zL+hYPsUGikEvYevKEPW0lYUrvC/7OhcuhwA43XQsI=;
        b=LaRKZUbbLsN6nBtBs08/oi4/e66nqDUJm5RCrDDHuSzVfxTehC4is227SIX9hKzL9t
         BKavV24PwiB+wVl7OzNxWWfurCcMkx+fTWsfkWgvJYfaMv6nqTTWGXEQDoZWEuGEd0hu
         ct327XeHHFqzQdsPVdcnjD8OqnRlCJMYtp3OrDVa+uhS6AAqU7PVGTkcq17mvplKpO5g
         MpafCBYQqHfeboFzXJBtDvM0csJoVPCvYX18n7o9m+eEERhTiVHsYr7HzQ9rDKBzH2ZF
         jwFClDj15pS0Hy381vTsMLNqCtkvNFU/EN2uDFtaZ3bBq3+h+9Ac+DQf0U7AUFYqMVgD
         tL7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720174207; x=1720779007;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5zL+hYPsUGikEvYevKEPW0lYUrvC/7OhcuhwA43XQsI=;
        b=UXS3UYrHuva+H/oR4hsQ5SGMw7pLkDy5ymzANfN/jrnutYAraXwfpw9RfDXB1NHn8l
         /sECviSxrN/wKKbdrlY32xM4//ahWMcXGVR4+MvFPDrisWD/mhVy9g/2Ig9v0UE/wscw
         Q5QHqmi4Dih6VV/CnbdUCkjHOPZoDVvctlLzHMSh3pNn/LdeAYICXrPZBgZIFA5jrBEM
         UT/ZxoNb5OKq8i8dxTbNkWnyuzrM1ZfrNy0aaxT3RHvmFNQ5oIXsCvImf3p7wopkxMME
         9N6uGNO8L0xTGTiS0QZJ1PBQvpKss/vSHNamJ/50NLF465kMiz0LJInm/vUC6rSdTz/7
         rmug==
X-Forwarded-Encrypted: i=1; AJvYcCULIz6nl3eMu1yxyyXzM+6+WDU+DcgUWBZ5IpSJ5ybAROgcPKV57DyFNE1rW8h+ffGyLstCKa8W18JK8PXiuh6eoNvheTk576W8xCe43RwYcx0=
X-Gm-Message-State: AOJu0YzOj6jeDUzAQsERgKJgnlYokBJVMKUWpcdHfG2eWPBkKs47BYds
	oVUwLxh7ZWgYDTUnp9gvSqPS+3M1dUcErEpwRv8SASglAFJnYc3Ku24O246v6JLO1aD+wuibsfg
	mBfKaRTNmwp2WeCVV5zw/s7MUuZRm/bHr3EBqT/vIpciuTW4K
X-Google-Smtp-Source: AGHT+IFv5JfLcSkOP8U2CR1h8+P7JKu8p+xD5A6Q83YEsiD0frFc4MeILWhzwfbxJxNK0TUkLCcP+X9AZOokpyU8KsI=
X-Received: by 2002:a2e:be0f:0:b0:2ee:7b7c:7f6e with SMTP id
 38308e7fff4ca-2ee8ee01a91mr36027841fa.39.1720174207338; Fri, 05 Jul 2024
 03:10:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1720170526.git.geert+renesas@glider.be>
In-Reply-To: <cover.1720170526.git.geert+renesas@glider.be>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 5 Jul 2024 12:09:55 +0200
Message-ID: <CACRpkdbF6w7eJeP6sMFmTBi-7Ud7Ch9EyASAaHmNsxwQvQc1-Q@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: renesas: Updates for v6.11 (take three)
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 5, 2024 at 11:15=E2=80=AFAM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The following changes since commit 71062e52fc0aea0f3477aaaaa789226388a7ee=
af:
>
>   pinctrl: renesas: r8a779h0: Remove unneeded separators (2024-07-01 11:2=
7:39 +0200)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-pinctrl-for-v6.11-tag3
>
> for you to fetch changes up to 2453e858e945e5e2fa8da9fde8584995e7dd17d1:
>
>   pinctrl: renesas: rzg2l: Support output enable on RZ/G2L (2024-07-04 19=
:22:03 +0200)

Pulled in, thanks!

Yours,
Linus Walleij

