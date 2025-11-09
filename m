Return-Path: <linux-renesas-soc+bounces-24371-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 899C1C4497E
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 09 Nov 2025 23:56:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 467FD3AEAA3
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  9 Nov 2025 22:56:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EA3C2594B9;
	Sun,  9 Nov 2025 22:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RN7wdptD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FBB0221540
	for <linux-renesas-soc@vger.kernel.org>; Sun,  9 Nov 2025 22:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762728968; cv=none; b=rhZ/MXVkK/LNor19DhtwkDjwk+s2rYUNqEN8kw1A4ivE9lyfStOhYmt435tt9IkZ0xZEoKe5umYLWmdoW9Sj3NqNKqNQS5wEvjiI0W9XnzDny+9xKE3QJFcR3j+mZ1KyVUJg7gei5ycHLv5n9zaiMEfWg0gkwBq+f5YUC568ue8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762728968; c=relaxed/simple;
	bh=PLFGWQAspdbCZRDef875kIYLM1p0E4rzqKQQiCIOPHU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V9PCwMVso2Y9oW1yVb4C/QI5ENbEEBxNMkv+vYq9EDDkT/9Qh591MJoi6YaHivB9BqgBj3vLiulTc13/BC8aWD8eFkoT7LuFV1VPyDhf0gtY2gOGvF0WnC4ZxZZ26F1cxnQSJGAQ8sYG/4BBnXsdrJFs8DIy4EacFWguaagA/I8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RN7wdptD; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-36bf096b092so18918201fa.1
        for <linux-renesas-soc@vger.kernel.org>; Sun, 09 Nov 2025 14:56:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762728963; x=1763333763; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vsVnuKc6cjflpQWcgE4gpq5jpcc5QldZ0S+6grxXq2Q=;
        b=RN7wdptDmjEeTE/85vn8Q8Uonm2dZ13MD/I1PRDcV5tXjXm6n7aoTQV+DiU7Gl8C1G
         LtNdVXHbHVAO6iXqo6ZblSuv2qhX3MmmhUuQkj7i71CqGK4V1Awoiv9WiaXaN09HopG1
         +irTNiHo5lFl/Zjh2ww5k/Pn17YgKsKqcC01lCWUuEhk6azncZBx6dkzq3OgjlfGLFHG
         dSuOTvCN0njp3r3iPXud39G7F6+DOxjZxPsk0CCbVk+qKKhBinBD2Jjd4yzIe7A3VriJ
         YISUPoEdN69At2IRAbhU3RJk/ezl1nOgH9lotOJFqU6k+ABKA7DosoZ3tb7+PVn5bwNO
         4hcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762728963; x=1763333763;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vsVnuKc6cjflpQWcgE4gpq5jpcc5QldZ0S+6grxXq2Q=;
        b=vePBO6vD/aR31U/yHxAYi3tKeaJVb4pq9iZEzUD+wHYRVzRC6g6Knw6v0Ny/ClW8RD
         21MDxK6f0m2BX3xJ7nm0hwySeIctj5WGY7uCDjgfr+yw+EGiK+AvA2xUqO6Rr9cU/VSw
         f+PpSBdHhuJwarmlvdYzqZSjiqb4JiakUPaw568Q4Np8zUxSl0RAQVKI8KQZPPAsE1NT
         W84lzPlTEKy6bUctrdFgOG4HK+zLwXzsT6U97u5yVhbb+PkqyzpVPsnW84bXY2zN5nlv
         bkDcrOtjj/4/hiKOY6sHdyJo1kd0IMluPxjBLNnLN11Q0AvC/k8+bGNG6FfnBdZan7WD
         p1ag==
X-Forwarded-Encrypted: i=1; AJvYcCVfDEZ7f29j/oLaLwnEQkZGJUDH+7vKpFp3f8Ydc2M2sHzRBILlzlc3VBHguk5t7vrYoap9S9GlV0042kihZRyIqg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwurXsWVwe0W9Owy9sDAJsMWnFDSWV1lRGXBFS0h+x9KkatbFo2
	0ZTP/NJVnuA0dw6/c7nqvTb5JiLG0/+/dCDd4Hds5OkFF2KAMS1uqEjrdf/EOsGwSGciYVGLBS7
	SEtP3SRpTIZAsv1apTEj6vtcvL+Mcc1qXhKoYLmSpAg==
X-Gm-Gg: ASbGncs7/nNKrzzz6N0pZYC8gNgtNm63Q7SWTB+oLMS5ftGOKvyjhb05+xRE54wUWCl
	zZaMArULGklbUJI5zhu2prKYpqluJj8iUCYDHctUZxw8EWwxQZjC26j1eKeA9DivAq8xab0hEBA
	G/YHVcGkX9v5F8LLMuFaelBLo/n0RmWTwmwl17CaxafpsHcGmibWft2W8ExXUfd3LVUOMae8w75
	7NKaS3RiSF7pZZ/4d2/qOXJy9JYODhMa+k4YvVbxEbQRwe+/xSoZJ9dR9f812fV0PcH5+E=
X-Google-Smtp-Source: AGHT+IGxal11KMK0AVWrPPETyfd2Fbys/t+t+fib2c6sSU5/wtz3kucnMR8Cgt91zKKPda+AvoBQHik9p8Say+Amk8Y=
X-Received: by 2002:a05:6512:3c8c:b0:58a:92cc:581d with SMTP id
 2adb3069b0e04-5945f1e0185mr2142297e87.50.1762728963144; Sun, 09 Nov 2025
 14:56:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1761906880.git.geert+renesas@glider.be>
In-Reply-To: <cover.1761906880.git.geert+renesas@glider.be>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 9 Nov 2025 23:55:51 +0100
X-Gm-Features: AWmQ_bnqa0cEGYyZL8QXQZaZ7D5Q2RPrSMm_Zqk2iLrLMm8olzmGDV2oTbnQTJ0
Message-ID: <CACRpkdYw63fNruavFCn6x83VqaGw2JJj_-6D+j17kin-7YNDwA@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: renesas: Updates for v6.19
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 31, 2025 at 11:44=E2=80=AFAM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df567=
87:
>
>   Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-pinctrl-for-v6.19-tag1
>
> for you to fetch changes up to a5fad3aeff41f89ac94230d66ee5f9c1526cb3ce:
>
>   pinctrl: renesas: rzg2l: Remove useless wrappers (2025-10-27 11:53:27 +=
0100)

Pulled in, sorry for the delay!

Yours,
Linus Walleij

