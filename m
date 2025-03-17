Return-Path: <linux-renesas-soc+bounces-14459-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD4AA64AF0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Mar 2025 11:53:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2CBB618889F6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Mar 2025 10:52:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 642D62356C9;
	Mon, 17 Mar 2025 10:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D66pzehu"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A652C221730
	for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Mar 2025 10:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742208723; cv=none; b=G7ljVzQ6we9r3ZVsJghOVV7sB91Zsyfpk5e8L9frAvPIZSkFXY9g7dxm3TFCTvTuFWcIiAUdqcmskGQ7ZEyQi2FtfLoYrgtiHMLzgBcJ/EntAwuyXaiuNxsYotqyRgDvr/YnI2bZVxMuE/xfhiHXc7kbL3wWdE8n/FHaTvU7I0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742208723; c=relaxed/simple;
	bh=sVFBQhrcAWlKClBKcDG2mFfwLfjULiYni95nXG0ePBs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Boo0czbGvM/WEJsesQAYuhRSJxp5QFbHTkWUVOGhOV5yowsnKoNKKxm5vF53Cmd+wA9P+HBybDsR9GocfAy+UZSv7pVD/Xi1l995JvJ6XLR59UYh49CmPjLlXSPMM2ZD6BFFqEpGpgCQW4NBMN1CE1tTZR/jtgsHyiKRhuxAoZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D66pzehu; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6f6ca9a3425so45445187b3.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Mar 2025 03:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742208721; x=1742813521; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lr2110cYvl7za6wMxgJOpzLaRT8Ay8EQwITnfCfbHks=;
        b=D66pzehu7JjmisGcpM+PY/lt7nkC8+5BWDRvHzgojKASojlVMPp6/n/lEFo00Uo5LA
         e3CHUMiorFtneyLasmIzP3+Q3qgruehLFG25K1WcAioU4IikVcFrBwSkHlWfzEkCZRvf
         qvcISQEO5s12xvHcNTNFHdi8+uoRtwGGDOgSTM9M37m5eMg7hDU/HtIKIOC555msoI8W
         kDxO7YqWAztr1TC5GviuxT0n+iYyNdHcay86vKxj6WBX8m6jI3iAFePLr4U2C5Kc9RM3
         Z8lhSVcCfRVW4dmwHhWkOMX4lZC9p3UH2+7W6PHBNW6xt4epaDp7gNAIg4qkPwnWZtiM
         9g+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742208721; x=1742813521;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lr2110cYvl7za6wMxgJOpzLaRT8Ay8EQwITnfCfbHks=;
        b=pJCgqtv/SdmL5DuVkSt+ZGRdYBn/vrcwh2hdmSgHc9zQiwUSZrrO6oNqEsZCZvDFvm
         iPsqqMguUumIgn+vnwz5CUn+O9E3Oonq6y6yvEaHHqjBOAUkUwZl19laC5M6yKMO6Xok
         yRc3oQhQGe6m53Gril7ZFrk03yo8Ynb0HW+hqOdwQQjAff6b5GBA9l9ctDnHe1IhXN0m
         7bMbKxa+mBHebZO4XlVJ/Q2OLMLXYhK6ofGtJWs+qcOZGStLTneRzgntfUMDCxYKgqil
         Ob2Sre0BY3KmGlJA1YdoZ+Mxzujas0t67tStJseLI+BWJu/BqZIWDCfAWEZVirMXhZAS
         4gzg==
X-Forwarded-Encrypted: i=1; AJvYcCVGgb3J9h+xZu45kWzXKz0IuNsR2grPErll9aqtlMf72EsiutO72lRIQ6hQW9qPxVh+k90HjUlf3h8r9kaqIrt0eQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzVRXAQV7jJM1aVuk6xTWxHYcZaQkDPllUfM5gUqMcHDekowegY
	f5tkbcg0Llarv/LqZykZqXJn1MtvL88DlbxBoX7+FECLTUay9F/Z4ltWh1n7tbfLW4ObDZ27LxC
	w2zZOSio9hIYXGeLVNStcQEjSf8V2gzHQdwzIiWPzr8hCTWlX
X-Gm-Gg: ASbGncvIIxGYRf75ttR8ielhZQT/UJ2Aocvdfo0NIXmSwHqF4CptAGIXgxgKw7/Msfe
	k3IDt8o0phY+ptxF8M8xToY8NsK9UC+oTIyl2I28C2Wpeu4HvwI6FVye3DHqoHbxJIdTyLFngAY
	2osSDuml+UCHVdmniIPhYmPb+HeKs=
X-Google-Smtp-Source: AGHT+IFf7X3movNjHtqdVTvAfIHVx7pgogDuutwiMoW5qPqhCnfU9dayLqxs4JjWyA9VJmoQdVD/1A6kQ2keCggN8U8=
X-Received: by 2002:a05:690c:46c6:b0:6ff:26eb:fadd with SMTP id
 00721157ae682-6ff46074375mr148199567b3.26.1742208720778; Mon, 17 Mar 2025
 03:52:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <dc39e555-8ef7-4a39-9253-65bcf3e50c01@stanley.mountain>
In-Reply-To: <dc39e555-8ef7-4a39-9253-65bcf3e50c01@stanley.mountain>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 17 Mar 2025 11:51:25 +0100
X-Gm-Features: AQ5f1JpqClchOclXJ-ISZPJXO2_ekcieYheM6YIoLWy4nEFQ2I-b44apFo7Ppjc
Message-ID: <CAPDyKFpO0a+hg0HrgXm0yv0p5JwMrD3aMN43boM73JP-EMpDWw@mail.gmail.com>
Subject: Re: [PATCH next] mmc: renesas_sdhi: fix error code in renesas_sdhi_probe()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-mmc@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 14 Mar 2025 at 11:11, Dan Carpenter <dan.carpenter@linaro.org> wrote:
>
> If devm_regulator_register() fails then propagate the error code.  Don't
> return success.
>
> Fixes: fae80a99dc03 ("mmc: renesas_sdhi: Add support for RZ/G3E SoC")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/renesas_sdhi_core.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
> index 396fa2816a15..fa6526be3638 100644
> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -1178,6 +1178,7 @@ int renesas_sdhi_probe(struct platform_device *pdev,
>                 of_node_put(rcfg.of_node);
>                 if (IS_ERR(rdev)) {
>                         dev_err(dev, "regulator register failed err=%ld", PTR_ERR(rdev));
> +                       ret = PTR_ERR(rdev);
>                         goto efree;
>                 }
>                 priv->rdev = rdev;
> --
> 2.47.2
>

