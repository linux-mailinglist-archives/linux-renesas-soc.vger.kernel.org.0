Return-Path: <linux-renesas-soc+bounces-8212-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EA06A95EC30
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Aug 2024 10:41:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 941E61F2102A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Aug 2024 08:41:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEA5A13AD13;
	Mon, 26 Aug 2024 08:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QXJ5PEXi"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 408DF4A2C
	for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Aug 2024 08:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724661675; cv=none; b=ECyOSKxk8X0xTpGWufuCZe5o6lhzn0bug//mHqG2EEUd578vWbceYgk1TKLUiTjA35dig+4aDB2y9VCh6+usQtsEyBTr8WMhKAHctM0gwI2jI6wtAN0D532qApZgah5r1GtQOMDf9O6e+aaGAMYHU55YLv5SeE45yYcBYZRnkxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724661675; c=relaxed/simple;
	bh=ZJqPV+M2ayctdGZHxpg+AofznRAfzm17VKe00rGKdUU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DtVXUVwduDuey1ypJ3i6kIKxqHGy2wOWWPsaXFSMVqbNh/+fGh6g25FPRyvo+EhqHD5bbCNfu4bheOIxkeLXS+kFlT/1b9XR+k+FsFCm9ccInY9Ns8j7+rylUmuVi7fN1TDbs9WeyE3lNSoqB1aMCdnCP1WcQ2PPMFNf9Az6rkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QXJ5PEXi; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2f50ca18a13so11195311fa.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Aug 2024 01:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724661672; x=1725266472; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZJqPV+M2ayctdGZHxpg+AofznRAfzm17VKe00rGKdUU=;
        b=QXJ5PEXimOZ13K98cB1Y/XAMdYH4RaTmfS5py/vw/c1EpBP3vuWDSuZ/nMvnJIw3mC
         th9iepXjNaYdXhdsoQTIRbFQPeTnWJ9w0gSc8+bypMPrFqIAYgt8xPbHZ/Zx6A4xn/rn
         Qa2oJ6jtE/GyZ/2LG+If+pNK+0yw1B4kGIf27Eu15WBiHnoggZ0s1DG8vbzIAXHzTDCC
         koN3voYr7wc997LIDXTOCa7wNhdEuIDByWc53MdoE7VNja8oCF3mZoieIvmFO/jm+PrC
         +Hu86PSoFs9hxZu1OZPqurQkKDezFdJkn6tfbYzd45OJKUSX7yaea0Vs8ejhvAOqepA7
         WukQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724661672; x=1725266472;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZJqPV+M2ayctdGZHxpg+AofznRAfzm17VKe00rGKdUU=;
        b=AsiacOMmsYAmFrAcwNQ+uh+pnuiNVExRwF6vVZH8/Bo1/5YjRz9kdT0D5KDSfkII5z
         DfVYpOWP7yi5wkcByUIi0kiAed9ghw0O2XLIGWiR9M4l5/YsUpge+p355k6hQSXZ7Gy5
         wmq+2tZhKXi693AOf78Hj0dUS13fX/sc/s6LhiyvTdzi2TF4Y8rMkEavWO1dYAPxstu+
         XTkgXPqBzyTLFIMwj/H9b3/IDNrKu5PSOR3T6cGxk2nREiMIBXUfACWo4t4qPeRhdohB
         P5paiT1b+pfnLLOAQiNLYLVI1rc5voCabN3XtcC6TDM5mDr1wtoTewaJr+L2EchNQz1H
         IxIg==
X-Forwarded-Encrypted: i=1; AJvYcCUB7ApBtHAsGkNJrKuib9/ZYhf5BFbOxKfUwez9hHEHlg6nqCZ3i8uohI8CIOBmtVMsJxALg85TJg+v/qANdhE0Pw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyUXPzeQsXKMwYTuUR/QyOuPTxbBuuP9zVuKEf13lsnW1zSRdbG
	KZhW1Yg5wOyUANYNatyNf9ay+W0vfvVGvNVy1zFWM3xpcuKlQSVUe6vRgFq4F1FxmVgDKkzb8+z
	dItwj9JBnGmzFiY+VyHOPDfrH2mX41f4CeYMUiA==
X-Google-Smtp-Source: AGHT+IF1xip2LZYxVRH8VpdWfcRa9uK7A6loLJRPHfWQskmDHQEUYxjPeikly02OaJhz/cUtMMvnXB3y1yNyya30do4=
X-Received: by 2002:a05:6512:3c85:b0:533:966:72cb with SMTP id
 2adb3069b0e04-5343885f659mr6807476e87.48.1724661671918; Mon, 26 Aug 2024
 01:41:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240822084733.1599295-1-frank.li@vivo.com> <20240822084733.1599295-4-frank.li@vivo.com>
In-Reply-To: <20240822084733.1599295-4-frank.li@vivo.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 26 Aug 2024 10:41:00 +0200
Message-ID: <CACRpkdb-MKYAcWA5KUDZ=oeREs86S68WjqzS9XRTrUbBhLbBtQ@mail.gmail.com>
Subject: Re: [net-next 3/9] net: ethernet: cortina: Convert to devm_clk_get_enabled()
To: Yangtao Li <frank.li@vivo.com>
Cc: clement.leger@bootlin.com, andrew@lunn.ch, f.fainelli@gmail.com, 
	olteanv@gmail.com, davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, ulli.kroll@googlemail.com, marcin.s.wojtas@gmail.com, 
	linux@armlinux.org.uk, alexandre.torgue@foss.st.com, joabreu@synopsys.com, 
	mcoquelin.stm32@gmail.com, hkallweit1@gmail.com, justinstitt@google.com, 
	kees@kernel.org, u.kleine-koenig@pengutronix.de, jacob.e.keller@intel.com, 
	horms@kernel.org, shannon.nelson@amd.com, linux-renesas-soc@vger.kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 22, 2024 at 10:32=E2=80=AFAM Yangtao Li <frank.li@vivo.com> wro=
te:

> Convert devm_clk_get(), clk_prepare_enable() to a single
> call to devm_clk_get_enabled(), as this is exactly
> what this function does.
>
> Signed-off-by: Yangtao Li <frank.li@vivo.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

