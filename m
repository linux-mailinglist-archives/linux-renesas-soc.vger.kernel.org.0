Return-Path: <linux-renesas-soc+bounces-4909-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 022278B219B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Apr 2024 14:29:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 96FC31F22FC5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Apr 2024 12:29:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 911E312AAEC;
	Thu, 25 Apr 2024 12:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n2elBBFY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C8DE12C47C
	for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Apr 2024 12:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714048159; cv=none; b=X7j62pUBkQDTGV+8mA8KJf3xFjFDv1js+Usj9O28vrdRY6Dq9Y8SRj1DmpgeysNzTJFhm9pXObqg151DVpXqi4li5h7T4NHD4Upk7K526GwJqqWjTRkQoRSphVVcwdvPnxZVHMDqlF2+CF6bEga+M9u0GsGMKh/plDAvi7NiQLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714048159; c=relaxed/simple;
	bh=yxk0HR9ZSzYzouNNr1W9sEQ/oMJwFcBaF9BHsEWS3YU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tCbUpx/YbkRKxiECdcnEfrCLgOO77H7V6kAzE2ZIy2lGPFbGTTs/IE5iK8tqEWMwK7Lrg8pNtWP9NcOdaOjfIvcSzQe4wRVxpBPxikas1gy4qiI5E9iRUl8GXr9QM5j9Y2cLrRiejk5z33Q2cLtyCnoanhsz5usP5ManvbofMfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n2elBBFY; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-61b92a83216so10384467b3.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Apr 2024 05:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714048157; x=1714652957; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3phw4GwceAPncOaaaAM8gjCjiw17W02CWykkCKHn3to=;
        b=n2elBBFYmvi+eQCJMlqNQ7G+5R1obdPXn8U2PsspjBHPTGX8a2ShTAYeABdfm4Q3mC
         iH0fpgSGPQwhXkPlyZ9TJLUPpTAR0k1lje0PEyYqITRN6IMDqaU0Oz4HKTh/CGCdMpiU
         cQRJqygPzfV9aaiQGfnGseZCCFArRYZKOWlSfuHnCmkFYU63ujuvLujCtHm+7Ce/SwM8
         /mJ38hN0jVMTYbbEhiKqM3/EHiGSIN/Zo7/sc0b8GSNYMVXzietTH4YVth43It+GHKXn
         9jo116n1ZWV29NeVuhEYm876L/trWOgsgomh+5Syj8zRaREUq0plk/FjAMC3Zk25D9uM
         n5jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714048157; x=1714652957;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3phw4GwceAPncOaaaAM8gjCjiw17W02CWykkCKHn3to=;
        b=T5CJ/bblTc2hTJN9mECvzmnAFveAJOYY9e+gNrPWprtqfIKqKSOWadaunwrE4kuIQJ
         BtElZqYFBxqfc/jbCv92KI8CGLQTVNIJMXOKAV5SmTpla/+1WISMdCQR2F1yDuxXfBin
         f2OPuJAg24sY5w560vzujcZ9uxDOnb+TPcmkENIaRwMBFQs9oBjr4UpvELQQtvOw40gR
         potawdow6wFjuRmvh/u/Ur21o9XaObOs6NKPGG63ZiGoEsRG/a62/A6YMsJayt98Wyqg
         5xkDeCtlaol5LrukS4/sbauugotHwH8/TNYP0Fu9Dqe+uAh2aMPbx8gydl7N8b92n4IZ
         pMyA==
X-Forwarded-Encrypted: i=1; AJvYcCXg5oD++eek2fMe+Aqr5ohNo6wywv+8jzym8AeGCMjUwbj70TRJACF22cs6+Hx5yTUjtUhf+pyB0S01Dt4Auv69P4ADXjM0OMDueOyhB1Aq2jQ=
X-Gm-Message-State: AOJu0YzkszD9J9MW5gN8valFKbmDFQZa2KFjj7ZJJmqaN8w2JrsXshKl
	niQJvg7rLB/K/SJ52OjLc8wwLvOlFkvkmDB4ghtYO/oKE9XXFjWTF3/9h8gRwvFB2JegMxrIEYq
	LOorzOHyHD8QxMzQ6B6uPP+fVS6wSEvJaSaFrfw==
X-Google-Smtp-Source: AGHT+IH3uW6Ai+q+KnWr2xUdRGCAouBFp8Piasv6KvVaPSOP1DPOuo5QJccbWtCAlEd1gUqApm447y8ev9ZewP5hNeQ=
X-Received: by 2002:a25:c551:0:b0:dc7:4b0a:589 with SMTP id
 v78-20020a25c551000000b00dc74b0a0589mr6785399ybe.55.1714048156993; Thu, 25
 Apr 2024 05:29:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1714035703.git.geert+renesas@glider.be>
In-Reply-To: <cover.1714035703.git.geert+renesas@glider.be>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 25 Apr 2024 14:29:05 +0200
Message-ID: <CACRpkdb0u2JhiRD5g3thYPreMLPAZd_5xiLgjcFHcBbSuxcPhw@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: renesas: Fixes for v6.9 (take two)
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 25, 2024 at 11:04=E2=80=AFAM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The following changes since commit aa43c15a790cf083a6e6a7c531cffd27a5e1fd=
4f:
>
>   pinctrl: renesas: rzg2l: Execute atomically the interrupt configuration=
 (2024-03-26 09:42:37 +0100)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-pinctrl-fixes-for-v6.9-tag2
>
> for you to fetch changes up to 02cd2d3be1c31a3fd328ee83e576340d34bc57d9:
>
>   pinctrl: renesas: rzg2l: Configure the interrupt type on resume (2024-0=
4-22 09:54:00 +0200)

Fixes pulled on top of the other fixes, thanks!

Yours,
Linus Walleij

