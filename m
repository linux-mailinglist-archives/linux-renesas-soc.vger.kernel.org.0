Return-Path: <linux-renesas-soc+bounces-6789-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 703E4917D6D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Jun 2024 12:12:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2609F1F2406A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Jun 2024 10:12:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A46B617BB23;
	Wed, 26 Jun 2024 10:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ifhg7PWI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B692617B4EC
	for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Jun 2024 10:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719396728; cv=none; b=op5c957FwEDqmi9rlLV/2hEDgC6GEtU9cqHZPKQDkIi1aPH9szaaIJbGZpGCOOeOvIvvsma7FJXU8LYZZBbZ5Lg7XX1mIshj+hj3sVVmWisKw1Xwh1YYL1vC4kNYV8yq0gUMAcXqsiKTKz8HNr6fQmgVWk3VOE8O8wKay2O/o7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719396728; c=relaxed/simple;
	bh=cmknoVngdJYQ85cuMuMf/+xJ0MzFi7KYzXKNAOTHktI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H75wXacdZ/QEMjAWElKqPF5mhB9NRB38x9+tNcaHBvcriF4tb1CvKTJ+B7cMnMhfgy7MPhsXqjJZiseYY2O0Kc6/LNea5F91RiHZa6YS1UR1aDBejo1tD+i/7PtO1WnFMgILcwWL02Oo8Ph/pjYCCGhlh+sIO2BQ+NLN6MrnVQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ifhg7PWI; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-52cdf4bc083so6338696e87.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Jun 2024 03:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719396724; x=1720001524; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cmknoVngdJYQ85cuMuMf/+xJ0MzFi7KYzXKNAOTHktI=;
        b=Ifhg7PWIeeV76pTvN+fQBxbIO1djHZsgo/3Tni0Mu/efQl2tKzrIm1IMvK0Xkt71PD
         r5BmAD7v4IO+X/8YdY/G+D7W/ZZjf37CWm67x6vCr/g19HkPGWca9XnikSpJzRfjAmCD
         t7RVMHZD/JHXCfNfD0MMgmIuGic/jGvHXVsCZS8Gv/BLKpUZQc4wVRgIcDx+6LuDb5Y9
         HC7ue3rbdMNRJvoW8H6yPaus2zDE+zoMhSAbwEmJQmOVyVkt9iBHizYZ6wBvLJL18gyv
         xovg3KsU22ZFdw7XVlEsNcw0lbeiCFC2Myrf4Kl5C6nhZ/kkZh2gg/FiYGbyyhf3Hcdo
         WSvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719396724; x=1720001524;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cmknoVngdJYQ85cuMuMf/+xJ0MzFi7KYzXKNAOTHktI=;
        b=dYGAC3qmj/TQfWME7P885Yej5uM1dnweiXrv1GItfepUtdqQeUqQ9V7yHY2U1RYSy5
         c8e0EJPUIJq86OPZI1thJbSfw5uiBmsY9gtA7pyCuFCjotDogWGo+KmTblmdMeFEG7jn
         DZFvyFuVkSiThAxTF8K6xpJL76oI3NiJ6KVG419pkz2MP5puQ3kWweTWaVsLzB4tc1A6
         ZeyuGN8T6ka9PFDT5zOWzwsuWjZma1l4yn9wPJPtJiuyzXPXYI5mjoZsFmDgH72GfKrU
         UnjNXMDhV/uiwVgqUR1bMDbZAqpiy2k8IK3nG8ja1Ae+Lw5soF+STERxcXvOzD+L4621
         zNbw==
X-Gm-Message-State: AOJu0Yzdu97U/MtX1/KQYDnwi5gaBojy/uQE/u6n6rlYlgetkoWG59iN
	9wFIQtlKIkFBjfWNaes2TwkeHdzQeb8MZRUJEtEQR3eo7Qdhed3S3TEgOx3fkG2KoxHWioAIxlU
	qhDc1+3LR6waEwABJyCycY4yjS/4kLdXGWK5SiA==
X-Google-Smtp-Source: AGHT+IFlHWSye17wo8uw0up94GPccFl/V/sPyPXlvOG615qTQFfaqLTIdJTRIPVYR4dTna0h/ALhLnj/xJOSRpjTkMs=
X-Received: by 2002:a05:6512:3c86:b0:52c:dccd:39aa with SMTP id
 2adb3069b0e04-52ce0646944mr10878848e87.67.1719396723946; Wed, 26 Jun 2024
 03:12:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240620094159.6785-1-wsa+renesas@sang-engineering.com> <20240620094159.6785-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20240620094159.6785-2-wsa+renesas@sang-engineering.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 26 Jun 2024 12:11:52 +0200
Message-ID: <CACRpkdbaCVoR97YZs7w4T6hg3a_+C__GA-qujdpc-0D8A_UB=w@mail.gmail.com>
Subject: Re: [PATCH v10 1/1] gpio: add sloppy logic analyzer using polling
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Kent Gibson <warthog618@gmail.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 20, 2024 at 11:42=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:

> This is a sloppy logic analyzer using GPIOs. It comes with a script to
> isolate a CPU for polling. While this is definitely not a production
> level analyzer, it can be a helpful first view when remote debugging.
> Read the documentation for details.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

This looks good to me and I think it is well worth the time to maintain
it in-kernel.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

