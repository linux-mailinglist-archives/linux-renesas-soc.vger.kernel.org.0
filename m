Return-Path: <linux-renesas-soc+bounces-2666-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 87300852B60
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Feb 2024 09:41:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 44B5B28290C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Feb 2024 08:41:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 497D11865B;
	Tue, 13 Feb 2024 08:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KsoJaUqa"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A52591C6AB
	for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Feb 2024 08:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707813699; cv=none; b=NxAeni1+6pf98YWPIQcSne7lW1R/sj1YZvtO1f0P2j6HrJG/pQi2CABiXjKs52ttNy2uxPHpADZikRtQCzjoFK5/ImpgGBUcVe3CDNc6xriACKB+7H1HfzfqL5ThSOksYVTGLW0mrn79PwUe2+Vj0VZV1r8iD5Uu6IWG4FIHGlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707813699; c=relaxed/simple;
	bh=9uhudulvDJG4m9EcgkknojfOiH3FujMKVl+tWWHEuFg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NsGd9HXkqOT7KhE4ID/FKFf3mO4wD/xeS0zXuvguOjSNcV9C1voW5lYk06eH3vh7JGvXb2D6vAjM/qmmch0FqWppk7rxC4YGGH4zxlP2npaygUF0T4sN5LqD8W/TEADcXQ4LjiQLpAIuX7tjB4xMkAfoOcueU/+0zyBTB8wRJQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KsoJaUqa; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6078f656914so1432897b3.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Feb 2024 00:41:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707813696; x=1708418496; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oIl2YYUnyEY/a7RRLxMgV4bhxVuKGpynPy5FdYIsxRQ=;
        b=KsoJaUqaQn4VFpZ2xJ9HGoq7VLEIlHVtipU+ifw7Gtnl40gv3fojyTByVPLUoMCAvP
         Q+ZM5VugB3sJJP4R5upd0wOxXYMySU1xuGqXYZVfGXBJOPA3bfjg1zto+WjomlEoZOqG
         IE/ADQ3+Oa1CJ82fOFeY1ChBe+261tAVE36UslzaC5zEcG3MwysYUb29Z+oZHg2kPwex
         q2mM63JfaImBfKpXD/+zF9cKsbAgik69THjQ7idMZbNdfB+ligyr6U59KCs7wIoAe8/0
         4EOdvsH9/33Ef12x3SeaWM0NPVOerfI4BtX2KS5t1o9qYFm3g9SJpHsObSuXi29sAwIH
         cBng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707813696; x=1708418496;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oIl2YYUnyEY/a7RRLxMgV4bhxVuKGpynPy5FdYIsxRQ=;
        b=nqOpfdzFBVkgO1skBwIDE1D7HZLMWSnIAaPAeekviSM9LNbGj5XzpwzsRchTDH8OVl
         WtN6gEBqbJLCVLn5gn9JTF+QelwoTzUJ/zk5fHWbWd3hBBM/+CKYyS6x87fBLsCbj17w
         TlZvYK1Gkd2Lpo93cV9AtJgILYwAUwi08VmXYOW9trJ5/k24z3t+hElt1Mu4D5akDlB9
         xKFcX366I9cR4dJVr+U4Z2UjRHMsnrS/aHcgXmTngFCoTGAPhnZX0SQvyLIkEF0679Yh
         rTwMb+EcI4ey3cYXaynMnrMt2sNlUxZiIsjv1MlAEoZ4X8HUxpPj75RmMWfyztNOrIxc
         oiNw==
X-Forwarded-Encrypted: i=1; AJvYcCVoif//GgR8OH6kiA1RhmxCUJYpI5aZBBMPLU91YWWlu5tmcS/NZPCJANwkdTas2KM9xhlUR29teLH0jQ/oTZUm8NyjWZ+SlQ8kqPMikrOhSEU=
X-Gm-Message-State: AOJu0YwGbE1bvQJN3bQ3yoymbgEfAR/sRLuCbI6qr8XyhYUTMr0PFBFI
	KgVoa+oUdATW6hkgnSispwluOwNhmbYeGpov7SLYD0DHkylUZ06LgjvvHalh4L0QoN25sgoStZl
	1qEU448p9F5PFftirZdMpKYTOYBF+SKfWZcLgAsIo1iGRKE/b
X-Google-Smtp-Source: AGHT+IGmBbVUw/R4L65+ko+wdqy1yKkPtgHVB1a9qElNgf0fPME2rl8vO8DuK3Ffkb7aOY8RYBckJlNiPOUsh/Qysuc=
X-Received: by 2002:a25:ac8e:0:b0:dc7:32ea:c89f with SMTP id
 x14-20020a25ac8e000000b00dc732eac89fmr9187773ybi.15.1707813696527; Tue, 13
 Feb 2024 00:41:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1707497084.git.geert+renesas@glider.be>
In-Reply-To: <cover.1707497084.git.geert+renesas@glider.be>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 13 Feb 2024 09:41:25 +0100
Message-ID: <CACRpkdZGYUX3MYKV7Pfhi5KJvKEfW0yhSLn7VGHEAfTz3CHT2A@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: renesas: Updates for v6.9
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 9, 2024 at 5:55=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd3=
3d:
>
>   Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-pinctrl-for-v6.9-tag1
>
> for you to fetch changes up to fea58424e2523376ece6f734479e63061e17ad7f:
>
>   pinctrl: renesas: pinctrl-rzg2l: Add the missing port pins P19 to P28 (=
2024-01-31 14:50:44 +0100)

Pulled in to my devel branch, thanks!

Yours,
Linus Walleij

