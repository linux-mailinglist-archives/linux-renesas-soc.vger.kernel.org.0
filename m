Return-Path: <linux-renesas-soc+bounces-8744-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E37496D9D9
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Sep 2024 15:09:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0FB1A1C2166F
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Sep 2024 13:09:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0530819B3FF;
	Thu,  5 Sep 2024 13:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nJtuxFYq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35B3583CC1
	for <linux-renesas-soc@vger.kernel.org>; Thu,  5 Sep 2024 13:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725541738; cv=none; b=bigu70tLVFF9pLOHitHi9dPjYh9MXHFCm2rTbsODpWsN04sabQzZvySGpfEoSu5txNPwcVq16b05s3ndnmXp9WRCE5Zxhk662TbkfQf7biWm8R13NM6p0T0dSorc2hOhxiqylsPHCr4oipNQopXNWYce2L6ylPs7Wi1WCwwS6kI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725541738; c=relaxed/simple;
	bh=f9N4xrTTes+g7/U54vG6V+6L0L1TrCM5nN3Nv7eOD40=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f8KEgv2NEzilq58XNwoHpysioZVDhDJN17C4o0c+Q5jpxBovr/F/Z6sLF91fdR3nD11vzPvYWRO1HK2Yyeb2T4+NOhqoeu/nH1MjyD6oJqY+AObmlkoJdnBJGXKcUJXYRbK+m3mOp8yVIoSrOfTPY1MAaafOOBHNkmY0CFrWAME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nJtuxFYq; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-53654dbde59so292953e87.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 05 Sep 2024 06:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725541735; x=1726146535; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pneB5MZJo622qMiA84d3oB2fd0IWKTmHmFHMugfOKGk=;
        b=nJtuxFYq9NPkSvRf39kp6llSmlXyaPeAH6ndgRILSTNqO7Eq23UxbnAkkgxiqVJRe/
         +d/nfbHzAqXVX9ayf4kKlo9xEF934gQ+n+rFRjxmX9uuuJEdzYyjnc7O2UKEGSNO143S
         Ma/WUOtvaF45qGqZn+TG6hzjQakiWPkdsXY3AMX1Ll/xFmxXK2VRBVB3LwcKp9xv0ZPR
         icAFUpwqWqK9t6RpnzEVv5Z1uWY3QbYjdCxJSxHZgdTSqReGBC55t2ZFWu8nOONH598L
         6nVtLT10SMukMDAMgGe2mUdnGhoyLlCKSAtEpUN7tLzAN9roYc4VCWeFAohnHIpgS6VM
         9mog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725541735; x=1726146535;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pneB5MZJo622qMiA84d3oB2fd0IWKTmHmFHMugfOKGk=;
        b=K0gN6/gMwO08DqtHc2xgTSv44HqyOxwbO3u7W0W5JPX/2kykw/hvTnIMMyfMtudm6T
         Y8iHsmGhwbzaiibSBfCZRgUBBXK7Mkyrvy4UIJknOLtVTs0KToLB23f6YU1OrBFxhf4a
         oNZRwILhgSnRIwgJZvFZx67NFu96qrWldCkarC+1+3NgqNn3byi83JreTMq+AtFNg0Nx
         bEwOZTJPJeZDQjJXFIXUO02SpBIec0trcNFjo8AUM9i1tdiLQPNuJp6q9+Fsu7wlEur+
         TV6wbfZY0/vXjVrBlgH3bXxtMpEAENwuUr2/zGWfknvggG0nJzdkhSzyZKpu/jCB+5G4
         bEOw==
X-Forwarded-Encrypted: i=1; AJvYcCXHomuMOX5YnD7JRrJQ0CYFxA4lylOy0+Ct+aVGDlNWYDs5wwTyve0toSCm8eFc314Q7Ni7qm8zDrTQ34of86ZetA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz84RKGyyWcRtAT4KWRRaCO4lrce8+NUip2XQwJTZ0Dda/myvIV
	CuclSznWDq4Ys9m/7C3gn9A0Y+7U34zvkJJVNAs+Ixvx5Ueom2bWr9Q8hony9b6AEW/w0pSebCi
	GH8zpa0xr7sv30CCJlWD+FXbHns8YzSDQ+yy/xT4e9C2EUcoW
X-Google-Smtp-Source: AGHT+IFDB+SQJUcFHIcGLBtUAOQM4sjWL8eQZL09m+CyJVfUaqz9ywFiYDlcdoeQwKx+jer8WTrcghc5W5KnnXyPtLs=
X-Received: by 2002:a05:6512:3ca1:b0:533:4613:21be with SMTP id
 2adb3069b0e04-53567791065mr2156474e87.18.1725541735090; Thu, 05 Sep 2024
 06:08:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1725374961.git.geert+renesas@glider.be>
In-Reply-To: <cover.1725374961.git.geert+renesas@glider.be>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 5 Sep 2024 15:08:44 +0200
Message-ID: <CACRpkdbtB_MbxdiVM-V-CsBvKah2Mv9h1o2KmoZ0YCwZLxxrcQ@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: renesas: Updates for v6.12 (take two)
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 3, 2024 at 4:52=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The following changes since commit f73f63b24491fa43641daf3b6162d2a451bd84=
81:
>
>   pinctrl: renesas: rzg2l: Use dev_err_probe() (2024-08-02 11:26:03 +0200=
)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-pinctrl-for-v6.12-tag2
>
> for you to fetch changes up to 1325820dd085809645bdd89a2fd408a05b4a5492:
>
>   pinctrl: renesas: rzg2l: Move pinconf_to_config_argument() call outside=
 of switch cases (2024-09-02 10:13:59 +0200)

Pulled into my pinctrl devel branch, thanks!

Yours,
Linus Walleij

