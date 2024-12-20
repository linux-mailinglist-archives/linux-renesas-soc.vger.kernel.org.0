Return-Path: <linux-renesas-soc+bounces-11649-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5421F9F9246
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Dec 2024 13:35:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 60A7D188EE2A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Dec 2024 12:35:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74E9A1C5F22;
	Fri, 20 Dec 2024 12:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mJFBNQqG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93FEC1C5CB1
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Dec 2024 12:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734698137; cv=none; b=HvIXz7XdJJnjRi9QJZxhhsiNhREaNc/5oAn/EqsL300yDn8y/FlR9GvfTwqv0EWkNemDPCpnUyIpGzOE2jWRyZ1MRQE16wNSLjPJDi9/mUHOYp/od28fTMUhaRt9ucVOd3c161ZIkoFb9GPbFb1zmrKpSL+/hvv+fvjD0/F34/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734698137; c=relaxed/simple;
	bh=xnoX1Yaz4nyuSg2pnMuVCCxPPpizL/71mi0FwCn5VYg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=scTrdEsIIh4+QtWQ80pzli70hoCR0Cfu9MXd8qYKJX6Ojfs4cvXLTYmdh5M0Md80i+7N8JfynObG5F16L+xZmrYJbnLBcBdaoJ6CT6Ak3MFbNdEa22I65hRpStF/juvkFu3vB6DJvQ9lJjnf1OiDu6BeCL14CsqwCsf5LZdrjDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mJFBNQqG; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3002c324e7eso18745131fa.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Dec 2024 04:35:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734698134; x=1735302934; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cxs0EP60NRQf4q8dFn+TEuE6v7Pg6hC++mye5M5fhAc=;
        b=mJFBNQqGQQ8dkboaSZbhIEWrGLehjjVne3PLIZkdm5lI/6qnfadX7CsRWTim9Mdte0
         yKQl/Nsn0wK27Um+4PShsjqeUPHpR7z69HvByf+doKqoFREceVldsPYZ+8kG8GMIXz1I
         1mE+Tezb4E6udirD8vhU2XXI0UNlqYOiTyg7WyHR3wpHzys2sGjqULC6HixNRxoINKkA
         YgGQVF5DouJpVB0BSoxrjyOh+gjNdl5amlseTIFubMKSlBxsPcHSuMcaUm9kJ+WXFel5
         riL7O2l9HYQyhb+T+pUn1jMYO38fnkLb7mcBxpNcc4vZUI0RwEQ8VVJzQlC6p6rt1+er
         Fc4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734698134; x=1735302934;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cxs0EP60NRQf4q8dFn+TEuE6v7Pg6hC++mye5M5fhAc=;
        b=NN+/JhVx/FfA0AsQPhZ1xkGf6WxbTcENKpEnODAJLo562KOQXd7AcvKZthdF5rf4gg
         LBZJbo5SrGMkZp/FSo3nnRpphM9DD15OEI6NDZzIrvzbmSI3+1H14rhCXbPYrTc1+mUD
         yt+5ElZhtNPQO+UL0z7lF+pwojtShUef42C+jkGUrYEKTt8GrkNtlsETxIsiJZ8rExMM
         Ld+eGU3j8McnM5Vda/vaxQDZAhrHjbZDsXCYufqtexNTpRnqEPi6O9SfGNaRQOftgNGJ
         Vvx54wOp8oBzeLLA4GLFHBYAkDPYVTJSto0zReERv86dxM/CJIl6+4C4VzuH+JtrFN0F
         flWA==
X-Forwarded-Encrypted: i=1; AJvYcCUEGsAgoyhqQjyD46D0skiBsVbYVKOfxFPym8Kkgaord06bLcey+NxJEuBZlsj6ChTLOqnZ1gkMNH3jy58lD30hbA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwF1cRqaTA4M8VGzWYDdPorRqLY2WIpcYtZPM0u1mocv9y5MVAa
	BAD4AkSWO/kK89FGnVkUU7/bRGdSn5XAXJYwAeRMsO1Ga0RhMTA+kF6q+PnH9DYBDsWwxU25J1g
	UHg9YUiQRrJLJYB0TLQk/Ujd2QrFsDFsmyY/Tiw==
X-Gm-Gg: ASbGncunugC1IfswGeHP7TE1VZ/DE4KXuXOrugOOH2VUk1Smdxk2XvFgmRFQA0qT8pH
	jw51kwdrgf9KOPisJSZnv140rDzf6cFuFB7SOBw==
X-Google-Smtp-Source: AGHT+IHRxAcFPD1TvJeiUzihMypxoNDL/b0/lat/G7rTcOZHtO8aDwn2pOXXyHqw7Dz8MNlDsZHzYk0r9N4CZ6TtzHA=
X-Received: by 2002:a05:6512:2394:b0:541:21f9:45b6 with SMTP id
 2adb3069b0e04-54229562a7bmr962076e87.37.1734698133684; Fri, 20 Dec 2024
 04:35:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1734690011.git.geert+renesas@glider.be>
In-Reply-To: <cover.1734690011.git.geert+renesas@glider.be>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 20 Dec 2024 13:35:22 +0100
Message-ID: <CACRpkdb==ZaxGccrTZsay_jON1sEWRA4wVgHMG3c6VaSqmRiDg@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: renesas: Updates for v6.14
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 20, 2024 at 11:30=E2=80=AFAM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b=
37:
>
>   Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-pinctrl-for-v6.14-tag1
>
> for you to fetch changes up to 03fc60cd8e7b7e6f330d0a48c54545740addd9d8:

Pulled into devel for v6.14!

Yours,
Linus Walleij

