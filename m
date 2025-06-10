Return-Path: <linux-renesas-soc+bounces-18025-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C7490AD35CD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Jun 2025 14:17:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 62955188D6FC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Jun 2025 12:17:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB95028ECEC;
	Tue, 10 Jun 2025 12:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xKAYnwT0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A2A535D8
	for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Jun 2025 12:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749557824; cv=none; b=UfwZGdJyTb3kRqDkswpAGmh759iZLMJkWyIjtQjqfOQl0H8+asaB3fIF/gOE+hRIm48clLxoO/xfqLFPHno5on8Chn4Z2B7eaQ03PQDZR4C4Ju0rDxXOu2en+VkAnbDR9mpRURp+nyx89DE4POZO0kFLZ3nXNaeWMD5KXtz0gkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749557824; c=relaxed/simple;
	bh=siXBLzRLss7mh07NwalB4yKgr7YnqKr9rIj6Xo6f3j4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=izGJe5BxF7gWu5PkyjAp9G7062SUww9A+ktG7d8nhZ2GCiTSulABCNJaixGounC22Dy6iTVee8Hh4SVVtiOrfYKX9l5Nvysy0Vl4rNj6kW0qK5QgsOT+i+sTAtWyZm8+eGYSrNghK8IBfiRe0EqjT6DyjXHA/mqES1wgAWn4Ekg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xKAYnwT0; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-310447fe59aso51954781fa.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Jun 2025 05:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749557821; x=1750162621; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=siXBLzRLss7mh07NwalB4yKgr7YnqKr9rIj6Xo6f3j4=;
        b=xKAYnwT01L2nhypvYKscjinTuM31ltvKGf5E3UmypxMkAwpbw3718/cE2rbHHKcZNz
         Twzyryv3vHidqjN9rTY4zlibzIYqXCC7qtrthfAKCmLYrhLoF+3+ratQCgG38FhZ7mEK
         bCLGlqOEZLloWdF8ACmzbyRRiwPhp3b2pjzLa+IPetGeksw5pVXtLJJkWbx1wNzq0X1i
         u3M2Ag8GcLV9JpROERwk6wd7dZMrkuzwyt4y4m6KXmkuDFZTzhG7ZYnTSNU0/OTaMTJN
         i8XbF0aThVtJ0UlYncCosCYbtpFwIwtCOar/SgjJTxlhXzRIBmIncQZhqpT0ajXjCUVA
         TFIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749557821; x=1750162621;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=siXBLzRLss7mh07NwalB4yKgr7YnqKr9rIj6Xo6f3j4=;
        b=KYxA+YDkeG8xogZ7pczzlCa4t22LDKgKwXFjN0ghfY6SsdXWa7719CWc4fE5HJBpQJ
         TL4G7KOXbWn6iDTyKfgPJBTKAsgvl2Z1j9zHrql23aY1cDLLR6yUpPOIC/IbuO4j0mnE
         3Na7rwToV5H7zt2w8cVdUNgIoJN4M57LcEDJa9BuD53JM/PJPKVCyc8rfVS+6pJsojsG
         BZXAilq36uTCFGkO/09nkXlWnutJ/dCy48ww17IOBJn2A3LiouyqtOYxQaQkvSY9sJG8
         km2PsHh2rvyruIClD9a/l8ZQKilm6krcPIlltM2DmqBFt1a4VA9A06YU5kRRGO2+jlE5
         HG6w==
X-Forwarded-Encrypted: i=1; AJvYcCXk6l/V1GDSjRcMFWsK62TGpwkK3aiO0NFIKWGc7Gq7m5KEz5FHrm2yWJrimD2IST3R2j7FRkVoRBf3g8Pa8PdrYQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzBA0K5NVwuA/iUEPrNfNgcYs8sTQ528fOTV1Tf3K9geBNUgxZv
	7tyPqdz6vRnngN8UdXQ8zrn+Bv7sY3xycAEGVExRaGa39ueSb8cHDZPz85NJHcAILohWm2vX+tx
	eI8SR/TB23ITv5/7bixHipOgFj+y3d6E8IoyuYPrJ/w==
X-Gm-Gg: ASbGnct2gDxlO1ncX6cCBriqQuH/xTDroFIhn7tjX2T7u2bKJxEUwFzmzHRur7AAOtz
	Km4iaK3AMugRLu2Ym6Zxb7Fuek+6XQz6r4kocUj6l4VZos8wzsS00SFcteJvggSRGghv1rmNPIf
	ouT8sXj35cnLN2GnGDbMoerouH1JfvoUwkBiEjTqH56mFGgdTjRRwpmg==
X-Google-Smtp-Source: AGHT+IFQxMti2+Q8Uenwhc0/S6UdaliHxGCkJGgDod8emAA4asQK/90KUnu0JtAhA4sI4nKXBC2mhVRJZkpkWFN1Jcw=
X-Received: by 2002:a05:651c:2211:b0:32a:8591:66a9 with SMTP id
 38308e7fff4ca-32adfbb0c50mr43449421fa.6.1749557820819; Tue, 10 Jun 2025
 05:17:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250528-pinctrl-const-desc-v1-0-76fe97899945@linaro.org>
In-Reply-To: <20250528-pinctrl-const-desc-v1-0-76fe97899945@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 10 Jun 2025 14:16:49 +0200
X-Gm-Features: AX0GCFuA2Dfvx1J77MshD7Tzhu9rwDlijvkgXfC-wltdCoDdq-4uVh1ABAKFvmw
Message-ID: <CACRpkdaQLq3YGfOg81gt5=1Wh2ZkoKHeK6H=NWaeW9aLbX4VCA@mail.gmail.com>
Subject: Re: [PATCH 00/17] pinctrl: Constify pointers to 'pinctrl_desc' and more
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Basavaraj Natikar <Basavaraj.Natikar@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
	Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
	Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
	Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
	=?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Sean Wang <sean.wang@kernel.org>, Jesper Nilsson <jesper.nilsson@axis.com>, 
	Lars Persson <lars.persson@axis.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Damien Le Moal <dlemoal@kernel.org>, 
	Vladimir Zapolskiy <vz@mleia.com>, Michal Simek <michal.simek@amd.com>, 
	Emil Renner Berthing <kernel@esmil.dk>, Jianlong Huang <jianlong.huang@starfivetech.com>, 
	Hal Feng <hal.feng@starfivetech.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
	openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, linux-sound@vger.kernel.org, 
	patches@opensource.cirrus.com, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@axis.com, linux-riscv@lists.infradead.org, 
	linux-rtc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

On Wed, May 28, 2025 at 12:41=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> In several drivers pointers to 'struct pinctrl_desc' is not modified, so
> since core does not modify it, it can be made as const.

will you rebase this series on v6.16-rc1, fix the snags and send a new vers=
ion?
It's all nice cleanups so it'd be great to just merge this.

Yours,
Linus Walleij

