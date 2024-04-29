Return-Path: <linux-renesas-soc+bounces-4936-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 790308B5891
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Apr 2024 14:31:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A95A91C21890
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Apr 2024 12:31:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5781A2F29;
	Mon, 29 Apr 2024 12:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fY1Nqd16"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B099E322E
	for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Apr 2024 12:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714393909; cv=none; b=s7xxQWd543mL1Y00BxnV4z4Eawpg1uXoy4UH0p29fn/iQHtAc3+sLWdppMN5DO210FdyJHviTjlkDDJhO552AUTZ42pU0dKKBvHc1hmLHJ5Qr+ifxZJb8rAvvZYho0zTRbX2/ooeWH8ve+9plNsNzx6LGalcAnUBwde8vCos0+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714393909; c=relaxed/simple;
	bh=TmkIUZXRReP8Drugn++pCGA4iSh3G0AlHnp894U10GY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gxl41wSoCkC4YBnUYF+UqNS2LdvN/UERgg5K1gXMYYdyBnEorX+E9bm3a/I7QTcyGwlkqz20ogct4+G+hEj0fD0bKQDc4Xn6z9sglC8PsV36oz+HlE4YCZVO6w/YPUv3gTe+Y9m/a1dDUIloeMJFPtcFHtCEVGA4CoXmBKF2G9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fY1Nqd16; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-d9b9adaf291so4626751276.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Apr 2024 05:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714393905; x=1714998705; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4BfrJkdfPHOL7AZ7zAIUgNp5Hv9h3M2AxRlbqmRGzF0=;
        b=fY1Nqd16urogFBLwGMz/bRVOQjO8LpRSLX9bf9vtmG8JMav6k2MqkkT1CH3bytUy/L
         w2jNM4qD5dSxDFXf+OiZW+l9SRDALWGa2Xe7zG8WTr/JDXR3VktvRfsbVNqbS/k3UWBC
         e9C9xXHqJs63/PREhVt6b1FLaJ9bSV5hZyCnX8A4lkcBctTXVNekiruF7L0g5S4PKqQ9
         5s02KdZfXuNGhqpAzRRzKg0rjEkP4m4WQSPiGx+DZ7K5RWVRwpYrDUte2FcwiWxYB42+
         zU80MUBrVcRzT02kBF8rDeQ3H+vK2JppboRGQNJXrOFeKOLjk/ZW7rx7j9HPLgmXiYor
         KsKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714393905; x=1714998705;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4BfrJkdfPHOL7AZ7zAIUgNp5Hv9h3M2AxRlbqmRGzF0=;
        b=ELRu5Kb7HbMl3B23wknfpebPuwcurR6yrQblaZSxzx00+iRR8MxWfJ6Buvl7g93ZEz
         pXetN3iNrqOzE5emZto6eAsWYYWrJDQzTdkgcwHLzVssHZbt2A+RiO+1q5TtUX9DlD8t
         KUSYY/1RZSnLTBlbMzCb8RzgJamwIljXA9+f52ifaM86BhnDEnt7ZTndkGPIPiH68MUo
         X6tXioFu+8GJFyT4N9Y/m55DtItB4C8Isa89CVBEWH2zdCb7WPpoEgxvRQ8NJq/vV4iT
         8loPBqmv3xbjxdtxn4t+ijXd6OvTTpYruQGeVGuGb3VQu/erldb+OuvH9rxMgOuddh4P
         Lslg==
X-Forwarded-Encrypted: i=1; AJvYcCWtxlbfabGbfQoiPEwqoSheXfY6SLQqNSj3Imliq0FJH0Smio9+B6UYGSEEfZTog3BsxDkL9crNGIfVz/wzpoKI8HloI+XlfRWmYG2Zh8afaww=
X-Gm-Message-State: AOJu0YxDb1IGcnbSdYuOrwDz9fkyCwbwN5fkqfPDI2dC89LkDi6VUBW6
	wMv2m1eCzXYiCOiZDK/aVGwZmXqFv6XX+KUMkWi2omqhyQbdV3j2Cv1hktRvA1zloH5Upor+cgy
	UBles8qX8qyi4KlTzUpktCYPSR5xph9V1qPNZWrAmZMoq/uWN
X-Google-Smtp-Source: AGHT+IEPuO6HzvZL2Ct4Yme3zR+g+AeyBsIaIHr+0ylrivlIkBWKK4kW6nJ1YMCoZpqQ93NbUbeOthpLwAWklcYjnQ8=
X-Received: by 2002:a05:6902:1247:b0:dda:e401:df8c with SMTP id
 t7-20020a056902124700b00ddae401df8cmr10786869ybu.48.1714393905625; Mon, 29
 Apr 2024 05:31:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1714118620.git.geert+renesas@glider.be>
In-Reply-To: <cover.1714118620.git.geert+renesas@glider.be>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 29 Apr 2024 14:31:34 +0200
Message-ID: <CACRpkdZtY-BFjn8agbgwVc2K6AkvO2iFniTsi+-VTNiP+7rfEQ@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: renesas: Updates for v6.10
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 26, 2024 at 10:10=E2=80=AFAM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The following changes since commit 02cd2d3be1c31a3fd328ee83e576340d34bc57=
d9:
>
>   pinctrl: renesas: rzg2l: Configure the interrupt type on resume (2024-0=
4-22 09:54:00 +0200)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-pinctrl-for-v6.10-tag1
>
> for you to fetch changes up to cd27553b0dee6fdc4a2535ab9fc3c8fbdd811d13:
>
>   pinctrl: renesas: rzg2l: Limit 2.5V power supply to Ethernet interfaces=
 (2024-04-25 10:35:05 +0200)

Pulled into my "devel" branch for v6.10, excellent work as usual!

Yours,
Linus Walleij

