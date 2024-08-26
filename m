Return-Path: <linux-renesas-soc+bounces-8211-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D656B95EC0D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Aug 2024 10:34:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 14D281C2037D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Aug 2024 08:34:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D81414601C;
	Mon, 26 Aug 2024 08:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iCv8FYl8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A112E145FF9
	for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Aug 2024 08:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724661148; cv=none; b=KAHZPQE8b8G7Iq0gYHeBIi1KIUGr8ey/vW6YepN59l/zItGOtbZVPlUHGruZtGmwzpDKofUqpWr4KdrvzKkls2fIbse68f7/rBYeCK16B2nYitXbkjQv/RWILcIAWkvLah9PnICsfc9A2hHLXVHk6v6KAX1oOO52XMyqjIV+AhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724661148; c=relaxed/simple;
	bh=yGRpH390cIyFALt2t0CcbDlSOLSSqXGmqK3JfCzLd9Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XO1K7mZ7udSH5QRVu9gwhx75UkgaB1qFnZKsFQnw8PjKhBvsCgT1e2zHrGxMDeHPRjF7q5dCtBdDvobZh2CKNJdNk0tdJN4fQHzOh2NY4kv5fXZLHFow+K7xmmmiYkP3frFc+/iFQ4fBlxYGsXPHpSLa78Kr60kv9/+h/oLMo2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iCv8FYl8; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5334879ba28so5076998e87.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Aug 2024 01:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724661145; x=1725265945; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I8sQKtqv5wzARsf1iUw+jbIU+yQtdvGHkvDkArg5/K4=;
        b=iCv8FYl8M+81wJ5vv5tM/Tpv0IeO02e0FpbuEsJnHXQhLmJNQ3zO4LweuR9/Llpbvc
         6rk5aIcxGrIWbS4gI7IRNJ00XWCd8u4nrUIAOBnvWx5i57iH3v4JJZR/i7vb2lAqTebX
         D+z00vNHiEEacI5BculOSqA0n5cWunEROKxGNsrVhQHolO56mzo91kc8uYU20xUw0iWj
         afQbsmiNd5fYS1wsv/ryjoS426weG6XdeHr8tJ+cjKaQyul7QpG5Lg48xYJjX1rEiCPD
         nIdiP3Dg3ii+LnprNHMU8WlFYrV8AtZeX3AnfYqm82R8B2D5xfDCacRZmLTkodI3Y3CR
         PHyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724661145; x=1725265945;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I8sQKtqv5wzARsf1iUw+jbIU+yQtdvGHkvDkArg5/K4=;
        b=A5qyoEF477c7X6dOx8+m8UVri1dMnqx5zYIqJ5j4G7V/VIqZIp9ljYLlDPYK2Guf4O
         zTtmSJelQEbw7ZYtTcyxjEJ4k2GFM9m2O3idi1RrSi4I88vxAuRa4j9x/uFq1q31oFMI
         qJuS8YQoG15GVFQAm69Bvt2gshv+654oULsBl4Nz9EsQLGaG/3t0NyKLiE7TdoJY63Wy
         R6jKi5tUV3zO5VYQ4VCz07bDm8lo+ZxDD/0V6/QM+sXTQ7/XIzV+4qRiuL3FKRh45DhB
         HNpc2w3Gw5OQJGWNHFUBgNUx2NpxvpH3xpZaog5kwd5rbw/0y+ZNR3ih1NgV0FO4HdIq
         +fXQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/qcTr7+QZ7FC5sM2ebjSBHx2n3gxKvgomWzwvwfpiQI2/J3Nj7zTChVK5z5jXIA58H7bxJDuA+cjQX2CYhcVTMg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwRjiBPnM+FJB4RY4ne48goHgVw7lI4m4I2OmIU3CZvjCXNpqmi
	2QDsdvqaifvzCsuXQH5MUofflRmk2EYXQlsNhq9SLTT1BVndsZYEDZTyehZho2UIR6TIlTeOTXP
	lBe93kpFUJAHCf/gk3TQU8qCkYa1WzjoHthmi4A==
X-Google-Smtp-Source: AGHT+IHg671DVE7CeENk8THLAO0DFARQr3Ubk6DPV1aYGoEoLIMdXQK/fAT0O3Uz3toNUCfv43Hha+HCJ66IgoQnrbg=
X-Received: by 2002:a05:6512:281c:b0:533:44e8:5565 with SMTP id
 2adb3069b0e04-534387bbf97mr6078620e87.46.1724661144027; Mon, 26 Aug 2024
 01:32:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1724317862.git.geert+renesas@glider.be>
In-Reply-To: <cover.1724317862.git.geert+renesas@glider.be>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 26 Aug 2024 10:32:11 +0200
Message-ID: <CACRpkdZyqdVHFjT+SBXp3gYfKWAo8TkwwjGp=vbwQU+hNXPqbw@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: renesas: Updates for v6.12
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 22, 2024 at 11:14=E2=80=AFAM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f01=
7b:
>
>   Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-pinctrl-for-v6.12-tag1
>
> for you to fetch changes up to f73f63b24491fa43641daf3b6162d2a451bd8481:
>
>   pinctrl: renesas: rzg2l: Use dev_err_probe() (2024-08-02 11:26:03 +0200=
)

Pulled in, thanks!

Yours,
Linus Walleij

