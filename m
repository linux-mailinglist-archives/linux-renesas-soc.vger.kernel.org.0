Return-Path: <linux-renesas-soc+bounces-14964-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB6FA7481A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Mar 2025 11:22:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7D8623B13E3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Mar 2025 10:22:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBE84214805;
	Fri, 28 Mar 2025 10:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VIXIVEL3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D5DF214200
	for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Mar 2025 10:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743157341; cv=none; b=tLkFkkOfFoniKLjfDvWYKp0aA7mY4TXubCGCXKcyoo1qMEU0xkkiAjcreZRoD7kenV7ZWVWPow4gNT4Tlbxr59LWw/kCtkSsd+8E3oGiwhXcMABSscJnUJhKMM/OEnf/wM2oD82GZmLqJsvQKMvbPmUHWzrotUYRVi8dIS1beIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743157341; c=relaxed/simple;
	bh=1EvdB14G9dZ9V0d+gy+JSmSb+iAYQGCNgOKmRsIyMfY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QA1pVsBBkYC9I2hahvgKc1fQJbR1YYlei5cHD62ALlYFFc9IjbPYumkr6iSePAE10eCSf7DZWK1xOrWUMIX0vEhhEPnGl0klJl64Wr5F4GakMzMcmEZC7B5zFy/dcLq4bCvZHCs1QRpNb9V465BGumqC3ybAlZ/qOOdiQYyEk9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VIXIVEL3; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-700b17551cdso19673467b3.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Mar 2025 03:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743157339; x=1743762139; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QWcdknvSCYeb4zRihPe/MxApMaJfE7/coMmdm58k8mE=;
        b=VIXIVEL3iR1pses4SVICAvRQoYKm3GrKW/gGsNf7jjGVM7GkO2q1XQb53KBo/m4Obz
         r8n5PEm5q9hJ83FrOpNfKyY+W1hwzleT79Dpdl+03WqmAQOrNoUzECTDjRTWhNafhPZ8
         N30bZ1g04ofeeTnP2keMVD6gndXLWONS1PUE1mYvzOzHDQ5QZhx0kCeJxOfYrv+5Rl3g
         2q+lXnf+6VsEvLUd1enBmPba+C0VZrxYcxWKm459zsjJeVnmAwko8a1oMPV/dK7aiMWn
         pazuDogB6I0SkpeuVmXImAI8SNzvjBm8QtiyOEnOnDQ4LxsX1hjYkQKURJi7IeYH4ECr
         hY3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743157339; x=1743762139;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QWcdknvSCYeb4zRihPe/MxApMaJfE7/coMmdm58k8mE=;
        b=utQVbJDl+oJB0GrHXfWkJMxOVWXf8DHwowztBL9Ufh3dvCZs3QQ1QzG4mXefjtGR7H
         ORwC4hRFY/rHT3k475vI7xi9J7ckT6M51NuUzjBI1LdQntx913yDJfqmSNikK9Ny4FAB
         ywuWTNDbsSIJIv0Yi7d6P8nvLnZ348LfbnRgRgksasii84sW/XHLtm8F9NDoPNYdiLNQ
         4cLFVICpLxQJNhNgjyX9ETt1VmDkZqOdlPPkFqtil5H+w00L0o7QXoyUsIexyVxzKnET
         FjFYUPdL37htqbBvWv6yl5Vrp1VjupcGLLanBR5WJzo75hL2kux+W7Dhm+CXq8f8eiRu
         UO/A==
X-Forwarded-Encrypted: i=1; AJvYcCX+S0YgBaarO/xulKy7ch1wn2s5GlDQiGyRHhMg99yd9GiuEzVTLjbmSuLYWvriF9NiBCEiE2rA2BGwdlkiFV+OLA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwyDt5rxuoGdb5fLrO6yv2VmiMQoJYdJ2mw7OPp3gSs2vo/35Bn
	p2kMdk9hQOVjc2vQUGAijMX40oZLbefzu4tGAGDOuAxN3/reuLEyzkK5Lcm+NKv0dPyKi4NuY+B
	p8jFXaWGQOc/xg9SvFgO5HAKhg/utbSYN9DW+eYUDv2j+GlHH9iY=
X-Gm-Gg: ASbGncuUJvpfRIUGnsXYvjP/+QCTYtGETaNkelKecFWZMqcyXtExRMAhWTDs/hd/ug/
	6e4MstUXdTSBYjFG2k9oCgQaLmfzIz/NqFfXOU+YA1RpA9v9BAEFgfeHqYSrO0oUBhiyCr1i2OO
	5ftNQzD9dW7VtCk5kPCVoU8KO55NU=
X-Google-Smtp-Source: AGHT+IF+THyscD1I70Q1OyNT7wZ9pN5Y8ZMr40r0UC0Ra/TZGyedSTAVl7xxm7Ivr+fxGPflDlGfnf1oayC1W3EzhlY=
X-Received: by 2002:a05:690c:9b08:b0:6fe:bf9d:8cca with SMTP id
 00721157ae682-70224c5ae42mr93037477b3.0.1743157338910; Fri, 28 Mar 2025
 03:22:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250320140040.162416-1-ulf.hansson@linaro.org>
 <20250320140040.162416-5-ulf.hansson@linaro.org> <PH7PR16MB61960D396B3E5B61571F7F82E5A02@PH7PR16MB6196.namprd16.prod.outlook.com>
In-Reply-To: <PH7PR16MB61960D396B3E5B61571F7F82E5A02@PH7PR16MB6196.namprd16.prod.outlook.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 28 Mar 2025 11:21:42 +0100
X-Gm-Features: AQ5f1Job6rz184fUICiPRY1Ma-qfbAVYw2uwJkaEoJZeRzZpT85dOgBmc4R44BA
Message-ID: <CAPDyKFreJu8jZXoBJ2J1Mgj+OOAJX5rjzX0D4ZfbTj_uVrPKPw@mail.gmail.com>
Subject: Re: [PATCH 4/5] mmc: core: Add support for graceful host removal for eMMC
To: Avri Altman <Avri.Altman@sandisk.com>
Cc: "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 28 Mar 2025 at 09:13, Avri Altman <Avri.Altman@sandisk.com> wrote:
>
> > +/*
> > + * Host is being removed. Free up the current card and do a graceful power-
> > off.
> > + */
> > +static void mmc_remove(struct mmc_host *host) {
> > +     get_device(&host->card->dev);
> > +     mmc_remove_card(host->card);
> > +
> > +     _mmc_suspend(host, MMC_POWEROFF_UNBIND);
> Couldn't find how _mmc_suspend handles this new power off flag?

Right. You need to look closer at mmc_may_poweroff_notify() as it
should return false if MMC_POWEROFF_UNBIND, unless
MMC_CAP2_FULL_PWR_CYCLE.

[...]

Kind regards
Uffe

