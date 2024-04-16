Return-Path: <linux-renesas-soc+bounces-4637-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F80B8A6976
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Apr 2024 13:15:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BCD28281ADB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Apr 2024 11:15:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4084A128828;
	Tue, 16 Apr 2024 11:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oDdcfcIP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF0061272DF
	for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Apr 2024 11:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713266121; cv=none; b=lH3TymNNx6NurBOIVe7wIJQbOAEHQUL/V18fToISpNeWpJkCzxl6+QWbsL0fVLIRutn6NY496CfYQ6knfz8OcXW5LjP+QjbHPodJSBVS3qoc2/3vmQqHHZXsfc8DwSu2rdHpUz8B8v6hM6xpKhlK6IH0rZGe3Q/s16HQXQ4843A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713266121; c=relaxed/simple;
	bh=XiI2sQm+xgSfhKnKvaKF+M2Gq/LxaifLpyx+4yhJKWw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kL3eNGKeSGgkqfoctDKFgciSyPwae1pawfsBqWFDHGWoiisPNLhGOS0Hsm6WX6lX6wj3HVVTGUTHLFEmX15HY97GQl9EyphDA9oW1IfRifoE8zA83XFVIboA7BWq+PlS4jgX9qu96biw3EQN0HsYf7l1InxCSXR2V7raIstsZT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oDdcfcIP; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-dc236729a2bso4102292276.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Apr 2024 04:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713266119; x=1713870919; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XiI2sQm+xgSfhKnKvaKF+M2Gq/LxaifLpyx+4yhJKWw=;
        b=oDdcfcIPoC4WBs+whqfYyBlY0x5ZZ/qXGFvcFbjYvcs3HBloRNyQoQe3dofYBp2I82
         4b4w4WwrsMrUWc4Edabw9Y46DlA8vImh3mOEK4JgT86Mj6DA6b7Y6eDQzh7xeE2F0KlW
         mACutQ4VbkC4MvC9oC74yya/+0hBcYpeYWXEZdyMuiDXOecHeKIApqVKp7mLUADbppjs
         IWWw3H1Z+UtVnNKAQuCRYlZWKHcBySGUOPh5HGpj/7ZsUk1cc0zRoupG87C3z6ai1kAW
         hC81RNN76lxsS9OEJL2YA0q99l/MwWMbuvmLTUsYy7byETK19nGA1KHzka39KtEN1/kn
         GHLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713266119; x=1713870919;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XiI2sQm+xgSfhKnKvaKF+M2Gq/LxaifLpyx+4yhJKWw=;
        b=EnO8sxCkyXdK/P+6/JlPSnkMiNZm0Tsh9Z1OkHExEfGElMAt9qR1TP9RCoBUKTYKyd
         W6p+KK1xjjjsN5F8z260kwxOHMt7eAkH4qXEfZN/9QkmrRbTUvXZGZPZ/L/t8uE39Lwv
         7yWncMTiqdtv0/foFlew1bInzwvvqPHh3C/jAiZwnOqg8PMKRVpbo8J/1CA9cQL7IYil
         jrMTtNx5kIo7hJuokYrgpWLJvNqJb86NxOgHrq2zFuESkGf9AKtzHApD5ZMrCh7ezOVg
         m33ZAA1F7M5xW9H9Y9ejSRQGa3gVKEuXQK2ruUsLhmLmMGtpBA76T2mX9s2NM7I4GdKj
         phjw==
X-Forwarded-Encrypted: i=1; AJvYcCWD5961kxamgHGhfDkTt68evNQ73FQ21Z+zkCcheGyE9RXTQFq06l5X7/Py1IZL3Pr8KJQRRpJxS1dRDIJTB+/dMauFpfioH3AyTns/HQV4VH0=
X-Gm-Message-State: AOJu0YyxB07HroumOrCUAMy+GuuK2oDNAQigoDHFcRjzaNHyYB80vfop
	lnFyGPmLr+n82UuLwqFyHOEhzTxPzrcv/tNVh+X7plKqFJ/KpyMkKjeqwT4YudFtg9b315O8FFH
	b9grYCad5FyHoX6sMlekge3JtLhIwGd7W4aFX4w==
X-Google-Smtp-Source: AGHT+IFZcV9W2tonTOuCnPPIlMQCywVg80sidWJREy/u9my2wBE3zF9bOxxG9UUMKBTpN9Mc+9RLCpcd7enrpeP10T4=
X-Received: by 2002:a25:ac05:0:b0:de3:ec93:d20a with SMTP id
 w5-20020a25ac05000000b00de3ec93d20amr3808409ybi.37.1713266118876; Tue, 16 Apr
 2024 04:15:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240410122657.2051132-1-claudiu.beznea.uj@bp.renesas.com>
 <CAPDyKFr405qt58wrqNdSn8bQPRqPKJ1omUZHS_VpQrX5zxUJug@mail.gmail.com> <CAMuHMdXRwcYMt7p+xT3svo1RmJ2Tvbamrx4++iYQ-mffKb6ZQQ@mail.gmail.com>
In-Reply-To: <CAMuHMdXRwcYMt7p+xT3svo1RmJ2Tvbamrx4++iYQ-mffKb6ZQQ@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 16 Apr 2024 13:14:43 +0200
Message-ID: <CAPDyKFoMiseXbSEK4ANOeWSuVhREibm0v0zg46Q3kJHX8jYpgQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/9] clk: renesas: rzg2l: Add support for power domains
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Claudiu <claudiu.beznea@tuxon.dev>, geert+renesas@glider.be, 
	mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 15 Apr 2024 at 09:28, Geert Uytterhoeven <geert@linux-m68k.org> wro=
te:
>
> Hi Ulf,
>
> On Fri, Apr 12, 2024 at 1:31=E2=80=AFPM Ulf Hansson <ulf.hansson@linaro.o=
rg> wrote:
> > That said, maybe we should start separating and moving the
> > power-domain parts out from the clk directory into the pmdomain
> > directory instead, that should improve these situations!?
>
> The clk and pmdomain functions are tied rather closely together on
> Renesas SoCs, that's why the clock drivers are also pmdomain providers.
>

I understand, it's your call to make!

Anyway, I just wanted to help with reviews and to make sure genpd
providers get implemented in a nice and proper way.

Kind regards
Uffe

