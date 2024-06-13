Return-Path: <linux-renesas-soc+bounces-6134-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 302B29066B6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Jun 2024 10:30:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C0B8B281876
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Jun 2024 08:30:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 583BA1411EE;
	Thu, 13 Jun 2024 08:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uGRv3Xdo"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E3D713DDB8
	for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Jun 2024 08:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718267280; cv=none; b=p+7LFWcdEuiBCRaZ0vkN8kLEQZmA1sUg8j7sbIOZDqRWGQm6Qfdt0rRvuByGA1mEIrdDTTc0XFqePeJWp/jQ69zrN2NOlysyyBKw9jGZFDSEh4jGLx6CJz2xZ25sepDsQPsGnr/fdflKMM5vP8SMvhU1/VzhSI8h1vDBd5qilqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718267280; c=relaxed/simple;
	bh=kgwdFkT5jQVkbTkpifsZnVL3/ED3qR6JJb2HD5RT8aU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c77lZGheAnQ8A80emrzHGBNWgCNrz/I22aTAu5XYc9Pr9XRCcoy2c/VPJjaalLOo3mDdNEeJ7LMvZYy4DLBPSrMFqYf5NhEXdo4g+ULg76RkM4EB7xdrEjTra3ZgnxLVmxLPGRti9wGZmZMiXpH0kJ8AeW/fWr5RYh2N4/5aBww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uGRv3Xdo; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2eaae2a6dc1so12406991fa.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Jun 2024 01:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718267277; x=1718872077; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kgwdFkT5jQVkbTkpifsZnVL3/ED3qR6JJb2HD5RT8aU=;
        b=uGRv3XdoYYbiI7j635aKGfcIP0UtjnUKUzdm4386EtkGPl804e98RERXJXoqu1IZeK
         XnTJFLPb+HCWj7Ldw4NhodFPQrJurzisZ5fO5PL1IqbeHg+DHPVYvgXNDA8jGxSxUyB1
         8eyYMZ+qi3spfpUcJ9dAcovSnAES/h4FcrjwLX3hJ36LKMqpwA8NSVcsSHLrRQ2q3MeG
         1787AZ3f43fnCX8nCUglolB+skffrqqNA9Ee3/wLhG77KPaSDF5w/r/VjUirX3qr6xND
         ePrnug4ITFThi/EHSsn/+T2TLxsHEXDfNEseKF+O6pD0tPJ4COgnP3oH3Jnvud0sm6Sx
         A+cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718267277; x=1718872077;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kgwdFkT5jQVkbTkpifsZnVL3/ED3qR6JJb2HD5RT8aU=;
        b=wGetc27uBJvXQ+Fn1bhHZa/cEujTZ9IQq+WGsErghMpTwZo9k4NlX2rUjqivx13J2y
         4yl4PlkBpBbE+wFTdGEhPw8Kfx9AvOlFO4kdSsxa72R3/DuVxC95YqsX/dSiV1Fwr7VM
         mbDRljDb4v0Y2k18yTlM3IBzfPO1fFbzDyhpxQ0f1AwkJf0ebsDdb1CbUtQWMVzvasz5
         kMQF7wcZBB4Nrh6GplDZZYNNiSqx9DwZ0yMP2uSh5PZ4MYvpVoAsm2CzuqiK3ph7oOHo
         cyeBq1EJcgzbgsQp4OUl4/IL6zui/53Y2rX//If+sGKFOVsQgyV9oHHpzZAtZYFHwVNb
         8YhA==
X-Forwarded-Encrypted: i=1; AJvYcCVKv77uyzg/d9yW5FK1QNfNWv2hvg01Mq38jbzAZHi6SJS2E3BVQA3HOXWjTM5lyjumS0unSVVXd87HG2GnpRqBMV2Bixf+A/mQTi2j5inUiUY=
X-Gm-Message-State: AOJu0YwfBTTYPdABffI8FaDG73tyGo0qtnFzsEknghkhwWLjxEU6egrD
	1lg61F4VZ/5vl7zC/R3ZnLKFK9mPIlLvI8YV37iotjJ/p0uBtaXyLHfEwtMKuteS3luCBePkswy
	+G7Yu9F1PSmkCSkRDVx2/tWchvDtEvenTScPlpQ==
X-Google-Smtp-Source: AGHT+IG0JvsAd5xth/BC3tgv5lcQ9QX9U+ULp08rdR1sfnVOy3PCLMQDJg6DqKJ9H0ledN+9SoWOONpzWoG9MmPcd48=
X-Received: by 2002:a2e:9b19:0:b0:2ea:e2d2:6231 with SMTP id
 38308e7fff4ca-2ebfca34160mr32949851fa.33.1718267276747; Thu, 13 Jun 2024
 01:27:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240610112700.80819-1-wsa+renesas@sang-engineering.com>
 <20240610112700.80819-2-wsa+renesas@sang-engineering.com> <CAMRc=MfZ11U+kAh1+K=DxtJ=QL+cY7Q_sBN4sQDF-RNgjpV0QA@mail.gmail.com>
 <jvnvx7a4pn6evrp5ehfrt4qsiuprq6ogvrue2a3uupwtydmgcm@2rvat7ibvgb4> <CAMRc=Mc4__0zzJZG3BPnmbua88SLuEbX=Wk=EZnKH5HQvB+JPg@mail.gmail.com>
In-Reply-To: <CAMRc=Mc4__0zzJZG3BPnmbua88SLuEbX=Wk=EZnKH5HQvB+JPg@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 13 Jun 2024 10:27:45 +0200
Message-ID: <CACRpkda==5S75Bw6F3ZLUmf7kwgi_JkByiizR=m-61nrMDWuvQ@mail.gmail.com>
Subject: Re: [PATCH v9 1/1] gpio: add sloppy logic analyzer using polling
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-renesas-soc@vger.kernel.org, 
	Jonathan Corbet <corbet@lwn.net>, Kent Gibson <warthog618@gmail.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 13, 2024 at 10:17=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:

> On second thought
> though: are you sure drivers/gpio/ is the right place for it?

Actually that is something I requested.

I think it fits in drivers/gpio as it is such a clear cut usage of GPIO
lines, and it doesn't really fit into any other subsystem.

> May I suggest moving it over to drivers/misc/?

Misc is a bit...
messy. I remember Arnd being very sceptical about putting stuff there
rather than creating new subsystems, so since I've tried to avoid it,
albeit recently more and more stuff gets merged there again :/

Yours,
Linus Walleij

