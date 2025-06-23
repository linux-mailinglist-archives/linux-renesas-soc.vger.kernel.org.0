Return-Path: <linux-renesas-soc+bounces-18612-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 68AE0AE370A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Jun 2025 09:35:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EDF631717D9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Jun 2025 07:35:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B84120298C;
	Mon, 23 Jun 2025 07:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="gxoLlVjq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C881DF75A
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Jun 2025 07:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750664035; cv=none; b=iqgEppCXFVB4a3RQu+zEi8CDBT79TVSTbQ2o5LqcVwJ+gBsJXvtT1y99hM+wOqAjd0484zq1mU5XUGyh//IUt+sN1UHDdn21klBMOstCxXWnLWA3wlj8ny/FRbN7+7MPKeEuPZTXFslXiRKNBhcWII1po78LzHzE8wlTQlXM/qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750664035; c=relaxed/simple;
	bh=hZqwKFrQ22pH+J6FCqtPgcrjFb7CkKy8B23+PKK0y8Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OUP6HJ3+NF1JAoHicQ1s71aJUocxcAI7x0vo1dJKoCgJwlncxpK/ROKt0dpliYBOvDzwAOnXmIg2U/4hXYqpd71VBS5XbqvLPHIV+FXDwHQILRL4isSEKd/1YhsAGCOz7jgfCtzNwP4bs5ELfSA6C2qQ/naUy5fRVezI/OFhVfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=gxoLlVjq; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-553e5df44f8so2411411e87.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Jun 2025 00:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750664032; x=1751268832; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e/FmDVYFDGwW5KMGc8hcV6hExdC2WI6OVDkBnOBtebc=;
        b=gxoLlVjq7UAq81SKleh0Z67563NNike1VukXSYueZBWksTROPOITfzXDsexJQXB7UE
         gsSWZFUfYxakoUtIqjb1aOGlpIX5thWlq2hFxnjFf1d85FzqvnA5k7EgOqcmAU50coQT
         G71FSEG7TNaIaHswOgiYYAUYzg/UhHfuG7ZwWrJW5Cuwi2v7YjFM9wF6iIGt4Q9fKot8
         zoNnFnIhFB677I+/avdqujD4Y+n2+vjYzpg8QYb11ZyFWvjEHsZxUI5nhT2M/22yp8gU
         Q7JrCPV0+FvEhPMegJ0Xd7sE1yQ3oObfTAxeLviSNoMa4ZbHlgvTe25pMdutOaL9b8Rt
         EK+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750664032; x=1751268832;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e/FmDVYFDGwW5KMGc8hcV6hExdC2WI6OVDkBnOBtebc=;
        b=iI/MH0o8iYTSK4cDJCfPH2G5nBT9H0ugcgwY1FQggczeSIvbYzjGrVFgEergeR6a3b
         85a9+6b+NqsccVVLpS1u3pfC5JYg+CDxzPjit8o1ZUIIGEGh3cHj/esIIIU+xnNKvVy1
         nG5m29E4mSor2+aIBXSqnl6gQteN7YwSGliiqULnqYTkaclsmfd0566fycGhcIv4Ma/Y
         IqaGIRJwNGHjtLCVzCH4VBNIfel1H7kir7F1Lmaa2TX+SltXvXJ/klhhwATfezqWw27i
         C4AT3TpK7c2KKUXSje6InPhHCzRNVTtpqDw4q0kSEUPqxV2TzChkeVt4wLExfM5tbWi8
         zaDQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOyGy2KnccRGmHG7uQ1NyoMropvEdUGnhjapAlN3I9weqNU744O+eEpZ+NiUuTBkgX+Qy8gmBXV0KS2cye2R5vdg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwHqZPw5/FCnE/UBKBhpOmIykkl+uAE4TBriInpVydUyzf26M7U
	5gbYEHV6VYZG34kFidsptsLNLh8pjAyfAgTl1EQqLCGJ7ZNTIV6mpp7rzUMbTbRXAKalaGDs8Pt
	LcrzJwm2gjBKMi55Q444pmmHAtfbz9RCK3mVZL4cb6w==
X-Gm-Gg: ASbGnctmB5Bpov9cfWRjdzSj73XcWIVCUxDWuDY4r0taSxaFRQxUpYt2kbIn9PS7uZZ
	rCm82wf0homVJV0ZTTVdRPHBsG+RMQeNKqlBVizsdispiLT5K/CfEhg/6KiSdITEY/Aerd6ft15
	fY1qaczREpgi08uksaT3j/YH3FFbA8u3QLt3WviNOSXH6+Dv1hk9Rpz+/0C91CnTiENAuD5PkFz
	A==
X-Google-Smtp-Source: AGHT+IHXbQ1G61S6XTmap3R9KFxqdYburMPb7gYbxhsdAd+vhJ5pZrPzhPGsI5r9CHk6R8GllO6W7NbS7Xfzhgc6R0U=
X-Received: by 2002:a05:6512:1153:b0:553:a4a8:b860 with SMTP id
 2adb3069b0e04-553e3af3b66mr3432565e87.0.1750664031428; Mon, 23 Jun 2025
 00:33:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610-gpiochip-set-rv-soc-v1-0-1a0c36c9deed@linaro.org>
In-Reply-To: <20250610-gpiochip-set-rv-soc-v1-0-1a0c36c9deed@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 23 Jun 2025 09:33:40 +0200
X-Gm-Features: AX0GCFvZI7j6aCfaYMvSqKv_YVgtIm3etGx79fDwp0jhT33AUgmaBnK_549jfVI
Message-ID: <CAMRc=McVV=VBw0DRiz-4tTjh7ZtRLWg=N_LQ2-7O1sKyW30rxw@mail.gmail.com>
Subject: Re: [PATCH 0/2] soc: use new GPIO line value setter callbacks
To: Qiang Zhao <qiang.zhao@nxp.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 2:38=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
> values") added new line setter callbacks to struct gpio_chip. They allow
> to indicate failures to callers. We're in the process of converting all
> GPIO controllers to using them before removing the old ones. This series
> converts all GPIO chips implemented under drivers/soc/.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
> Bartosz Golaszewski (2):
>       soc: fsl: qe: use new GPIO line value setter callbacks
>       soc: renesas: pwc-rzv2m: use new GPIO line value setter callbacks
>
>  drivers/soc/fsl/qe/gpio.c       | 6 ++++--
>  drivers/soc/renesas/pwc-rzv2m.c | 8 +++++---
>  2 files changed, 9 insertions(+), 5 deletions(-)
> ---
> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> change-id: 20250523-gpiochip-set-rv-soc-14e1d9414f70
>
> Best regards,
> --
> Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>

I see Geert queued patch 2/2, who would take patch 1/2?

Bart

