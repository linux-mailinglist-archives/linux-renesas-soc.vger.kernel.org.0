Return-Path: <linux-renesas-soc+bounces-6798-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6814918018
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Jun 2024 13:46:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 841B628194C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Jun 2024 11:46:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72E7917FACE;
	Wed, 26 Jun 2024 11:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="1Z6ba+QH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9531A16A934
	for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Jun 2024 11:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719402384; cv=none; b=Zzf+bHraADLpql7PMongfHQN86ItLyEdDL4ZH2Ueh9oM+RXooO6w+ayjdyJ7H+mN9MlciF85QuMz8oUG1M2mP3+Tys6HBPFM/ySo2NeO7y5ikOa1gCPPHGj9hJ3wOklfX1+m9sxb0IRlaW+z/hUWNx9l81bYYSPg8vdFwz+w/V4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719402384; c=relaxed/simple;
	bh=Xk2LNbzme7MT44mPDYnDDNt56ztybDfUPtZQBVnnN0k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HRT+WixLExZHfSVMPrYR4J1lfxhe4mICz4cPXBqCWU9qUSmcVhYh4HZgNmZGcYrFLF9is6PI4DmGGamnjcmrghQIqKYwTUwmPGXOCBUiwl9BD9KyYJTTOC47F5L14OTD4m72LJ2nz0FgNqFtia4iijn97ECSpi+yCMhleoi5YSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=1Z6ba+QH; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2ec3f875e68so73357641fa.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Jun 2024 04:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1719402381; x=1720007181; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ivKhkKERiob7XeIyEG2ezyLpuRNeSLzhi5OPf/vRhDQ=;
        b=1Z6ba+QHorNNM88Ul1HC0MfGu7Ztr5io+d43cwUaLra2dUPV8iTbCH6lh3/dF8Tt3w
         uOgo8g9odiGMuFx4F55hkJ82AVxaA47afict/SjfoNfEnCuWRLuWs2YHj8/0MdZ1kEsa
         OwrvLTkpuSIqOnmRNVKE4lYAAR1GcWZyH8YEk9xFPIcKbwuVm2BuRuZth87F62ZfrZHM
         PqiaV7QIcc0B6B268LSWf8DJp4HdBG0EhISuBlZLImZ87d0oeclNrKHitKhDlJ3Uw7/0
         MLjjzmLDUI7bb3wUH/7t3+DsNYDHd85lMVYTkg96ome79HM/e0YKsvb+Vo+4VwNGEvI/
         BG/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719402381; x=1720007181;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ivKhkKERiob7XeIyEG2ezyLpuRNeSLzhi5OPf/vRhDQ=;
        b=VoQEkkd7M5T9hUSqjRChKLgcN7iEu5LzbzPvymC4201v495Kv7kfiiBAJVgEV461/k
         XXXe2qrCZzUW0ZP4rzml+YDVN0shqb7D2fqKI4IJTjznhFgf+jEsW+Mlc9DVq3AnB86U
         Bnzle7YVgUrqejBaqyd8oBFgKLJeMNDUFff8toNCOH7F47YT4woUMYQLlzvyS3UdtwW6
         p2AhCVmzW4l+ts+/9y/2WfZi9tJHtQkTHgXuB/rdPh/jRrLTwly6JAC171XQsnm7X9ai
         qYzdMKi3LqHoYo5UvtqzZPyl4Rg0zBX6ngpJ+WBJ/whJZvzc2WgSvb5FNu8Y1YitljDU
         mPZQ==
X-Gm-Message-State: AOJu0Yyjtr2NzkjknBqQ3Ms/AS01cetl/ebK7mgXylMLk13rToein47p
	w9lSV1RPFFDA3yObSJQtsBGLUYFebjjiieV4p91HoOQZD/iBb93BhoL4vE1xjefo3ABlwRxgEmB
	7TnvTvSRzsAsBupya/1IDuuCTlcAzJKOsctvW7g==
X-Google-Smtp-Source: AGHT+IHZ3UXaVFuTvL/MpPHs91fWdqv+FqBhfwARoeGwnutlQoZWH/zebBBRKJgfItL4zMJThnRDmj/Oj34rj2pK6FQ=
X-Received: by 2002:a2e:9596:0:b0:2ec:1dfc:45bf with SMTP id
 38308e7fff4ca-2ec5b3d496emr54685221fa.42.1719402380803; Wed, 26 Jun 2024
 04:46:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240620094159.6785-1-wsa+renesas@sang-engineering.com> <20240620094159.6785-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20240620094159.6785-2-wsa+renesas@sang-engineering.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 26 Jun 2024 13:46:09 +0200
Message-ID: <CAMRc=McPFAKh61r_L4kpTdD2HJCWo_u_=Wt3bJ5SMVmtSgE8oA@mail.gmail.com>
Subject: Re: [PATCH v10 1/1] gpio: add sloppy logic analyzer using polling
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Linus Walleij <linus.walleij@linaro.org>, Kent Gibson <warthog618@gmail.com>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 20, 2024 at 11:42=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
>  endmenu
>
> +menu "GPIO hardware hacking tools"

I want to put my GPIO virtual consumer module in here as well so how
about calling it "GPIO debug utilities"? I can tweak it when applying.

I would have changed the general architecture but it's always a
trade-off between perfection and getting anything done. If Linus is Ok
with this then I won't block it.

Bart

