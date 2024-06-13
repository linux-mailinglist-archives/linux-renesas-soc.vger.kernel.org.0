Return-Path: <linux-renesas-soc+bounces-6135-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CC2A99066DF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Jun 2024 10:35:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 76BA71F235E7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Jun 2024 08:35:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7CD184038;
	Thu, 13 Jun 2024 08:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="luL7cXI2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD97013D285
	for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Jun 2024 08:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718267418; cv=none; b=FCq+uV8KqExAptSDWEO5etL0nZqtsfnluhw/OT5ocKUaVMehOlYuC5EEF99C37/9C1mSdaPayrMgj792fo6x1YVLWQF5z8R+8mKhlJbitnIk0kNiE1LdFgPeBo3WZWIbWPGuDna7aDXuWd3ra+TZvy4rdxqGMZyAC5T8CKklh34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718267418; c=relaxed/simple;
	bh=zam1WrTcB2a6hkMQ4oXaEjlytSYEYESNLp+E26hWmRs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=Y1JGqt6MTflO5FJr0IXDlh9J+K+PeegVh8j28MA1z06CW8t2aPGr1fpdcev8PY37XFhWOLMARdnqF1K6/H+IAoSx5XlIRys+hDx7xPnSGCasmnm6mEfYM+lkLMbvy6LAxbakuYFDlHVGzVinQhnSlb9nCANsCxHoBTk5P6B/oek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=luL7cXI2; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2ebec2f11b7so6419941fa.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Jun 2024 01:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718267415; x=1718872215; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zam1WrTcB2a6hkMQ4oXaEjlytSYEYESNLp+E26hWmRs=;
        b=luL7cXI2uXReVUpyONbENCMEi7I9yoLTix+iLnOkFpkrA/V4JUuAuSoDMGTWH1Wy8N
         PXxa3LAa/kbSSZny2qmZ0mOJ/365zW4j+kBDKYhrfKvYdnLOAquY1TeRvlck0TZIEEvd
         914TUsc+Yo+49WfyOo8o9uJDDa4P4ICEIPf6viBYg8XEJlqB9B7uz9b1IFEAuOw9NP8s
         XYbCuPk9LtLmsYJxr1Zptm5KYjUbdL7ygzSLDedtaYLEvozmj/tnui8sORAT/7oJDapz
         1Vp9IwKJkqnyKUzP9MT6v1sTZOfcukL9+XkROz6xIBXj0u96Ui3z/5LG4NLzuiMpZnI2
         ZFEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718267415; x=1718872215;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zam1WrTcB2a6hkMQ4oXaEjlytSYEYESNLp+E26hWmRs=;
        b=rXo6kFwuBVABCbioVymr9qX4bJ9NJ//HcYhzAjXhFz62uEpyHdxidEnqonLu4YY9ej
         4ylFBZBVq5Y90ZOn+l0PugrpJomYEiLzgC0rQEQhQJlQ/pNZg2IX52ONNz4iwI7CtW+d
         xTx6cStNm8yFnQg8PvYVFFxF0jPYcn/0Em7QMC9cYKoBgxuAYyI7cH7HUBUF6A3ToJlX
         9XB70E9nbJk2bgABwCJKFVCVf8MY216y/nbtJ29LUEvyT63ZJr2XDdY+iTnV0GMdLXBl
         K+KABZOSJKagXsne7XuheZuyGIAaupUFtlXXMLkg/84uMjVru1voDAT4NomFPoFbqNgt
         4Rhg==
X-Forwarded-Encrypted: i=1; AJvYcCVXUhJyLvKmTsW7+ubfw0fo0ja5TfpBNV+mWvCTbcrh7iW8jDDE4PEFINorL8BwK7regSG6Z3jsSpIZ1XJXvE2TvwiM1YPfeMv4OirAQpkyQzE=
X-Gm-Message-State: AOJu0YyrDNQlLNJVtlfysBeZSVOgSH1sh8MC0JUjC+YtJCzTbVxXgMzx
	NNQjaZqzySBTrMWAdZ1xuM5cp6kinKNsp1JJUk6EEDEWe+T2ceUID7jldEdRMVU12TDDeF6di06
	tuVLf28iVW3p5lDTDQ0X1NHGACwZgB1suPhmu0w==
X-Google-Smtp-Source: AGHT+IF9f/c3s4Qe7ACe43UALugVI7gRig0w/mlgAWUWAzqd6KqBUe7rTJtYZn5+66dcrw87a/NrWnfZ6ZkrDnaAHOg=
X-Received: by 2002:a2e:9185:0:b0:2eb:e542:cab0 with SMTP id
 38308e7fff4ca-2ebfc9d020cmr22506241fa.14.1718267415106; Thu, 13 Jun 2024
 01:30:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240610112700.80819-1-wsa+renesas@sang-engineering.com>
 <20240610112700.80819-2-wsa+renesas@sang-engineering.com> <CAMRc=MfZ11U+kAh1+K=DxtJ=QL+cY7Q_sBN4sQDF-RNgjpV0QA@mail.gmail.com>
 <jvnvx7a4pn6evrp5ehfrt4qsiuprq6ogvrue2a3uupwtydmgcm@2rvat7ibvgb4>
In-Reply-To: <jvnvx7a4pn6evrp5ehfrt4qsiuprq6ogvrue2a3uupwtydmgcm@2rvat7ibvgb4>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 13 Jun 2024 10:30:03 +0200
Message-ID: <CACRpkdYYy_0QnzO-qPusYPFK2qFs=NG-t-X=GRjLg5DHX_k82w@mail.gmail.com>
Subject: Re: [PATCH v9 1/1] gpio: add sloppy logic analyzer using polling
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	linux-renesas-soc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Linus Walleij <linus.walleij@linaro.org>, Kent Gibson <warthog618@gmail.com>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 12, 2024 at 6:03=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:

> [Bart]
> > I really dislike drivers being called in an ambiguous way like
> > "simple" or - in this case "sloppy". I understand why it is - in fact
> > - sloppy but can we call it anything else? Like
> > "gpio-logic-analyzer.c"?
>
> Sure, we can if you prefer. I named it like this to make the limitations
> super-clear. And even with that in place, I still got a private email
> where someone wanted to build a 400MHz-RPi-based logic analyzer device
> with it. Which would not only have the latency problems, but also
> likely have a max sampling speed of whopping 400kHz.

What about "gpio-low-fidelity-logic-analyzer.c"

(+/- Kconfig etc adjusted accordingly)

It says what it is, not really sloppy but really low-fi.

Yours,
Linus Walleij

