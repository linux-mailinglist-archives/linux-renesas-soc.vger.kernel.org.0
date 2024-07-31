Return-Path: <linux-renesas-soc+bounces-7667-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 51AE49436CB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Jul 2024 21:59:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 82E671C20E9D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Jul 2024 19:59:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0903B446DC;
	Wed, 31 Jul 2024 19:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="T1GQM9Z6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DA6615F40D
	for <linux-renesas-soc@vger.kernel.org>; Wed, 31 Jul 2024 19:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722455981; cv=none; b=RgJr+g5tyINwnJJTI1NQlvIJNkoIxUIyg6VtrSZsY1yk6HuFOs6RIv1X6kzx7XqmYWNLomtcOwGLKpS+MDCWxcuHVoJnnzoXGzNc73pHjdX6eLSLTF0LJ/H+fptGmyHxQwqQ9ITJJuqcIKcxpBg1fK36oCIURPuXrNF37a1m2gA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722455981; c=relaxed/simple;
	bh=dWIe+SVflan2SsTYfU+ly+kEamX7THOV6NbrTrZgYsg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lDMLRToqjYnYd3xrqpHRVnjVncBjvj0yIzZfwEkXuWB9asjlOsSJPBo1yEc6NlSywgs/3Z6xG7hpeXvqnaVupjw5WOdo5JB2DcVfG+8MfFdSpjMOWoYzRH5x8Kea9TaSbnFFV8WoL7AZJTNVFxIRLVyqf49wiLeyI7cDlBUzNOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=T1GQM9Z6; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-52efef496ccso1350726e87.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 31 Jul 2024 12:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722455978; x=1723060778; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dWIe+SVflan2SsTYfU+ly+kEamX7THOV6NbrTrZgYsg=;
        b=T1GQM9Z6q6l5wLlt0eypCHG9rt9+uo6yhpPFTymlrz/3RwsH4oSdrRhFyKPxErLpr/
         MPbcoVkQNieAAVhcDHFWCtUt8tZeMrEY9BO61z149A0P095bTAid2KG6nzA1zwWl3Abr
         RVX2nNsej4PJPXaZ35+TdUqpAbfOxnVS+FiswMwU7F8GBI+pWQRXDO0hFBymML7Xxf6O
         NW7GRvivSvhMHRTpOuz2JCNE5FN1BizavbvfAY7ETSq4WM2sXinoyZ3h6kGQr3n+8bkl
         GkxhOnNz41rEXhf7mwgKazEZHKxDDJj8epjbkF0+bJvEB1roF/uZ8ElPeh78E9bF7CeV
         ykpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722455978; x=1723060778;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dWIe+SVflan2SsTYfU+ly+kEamX7THOV6NbrTrZgYsg=;
        b=AsYnwp11uu0vNgw4/BSjaPMeqvCoQDN0J4ZTvc4cT+LmWlUSwLvfw79TD2l6OPBpLR
         mOP7xP2Nl7TN2k1qJnFisr1i1zGUuZV/gIRKsSLC8MrrrRyITCfRAPQzSYN/xudhGaSq
         1Du5cZ94FUou5Zz9Eu+C35a6tt/x2he+SyTmzifGszBRo6wo3ZtAYyWm+g2PMPjHPt16
         cWqF4p5SzEbarBbcFn+AKiFQGtPtcf9CJQnZuAzNNMFCmKtnnc8rPKsuxp/giAPuab2u
         cfhw7jdCNHbK+hY1QsKYrUNiHhll3GLoq9VaaqQZ/bFtf/TcsiCiWZ+rOODS7kteKf/c
         AOrA==
X-Forwarded-Encrypted: i=1; AJvYcCU/rFTu+EovcyzrVJJmdOaza7eHGgXuhjVnj6XLfEcNEx0caLkga+l1N9D7NvucKW0Yn6IoopO6V9oxdfdsFf4y+df/oChbGWl21aps49B0C5o=
X-Gm-Message-State: AOJu0YxNYCub2aAYNKacGv7A0u34cbnz6hRbQ1A5ERaVrj6z7Ciyy+iZ
	E4561FJUKzHSN9V/9dZSAXp44q9uB4+o+wxIChxueQ+GsPIqr9HwiQ6qELA/uYqTSFLsVJXIx5P
	SQL8sjH2ll10XeMU6bVbs+Y1mavKIrIDWK6c8XA==
X-Google-Smtp-Source: AGHT+IErH91gsiP0jknUbGQePRQcEui321R89TogJGgXf/NOgJfDu4BwCrxCl329HVydBTJibEm0OrBmEJW8f+7EJ0w=
X-Received: by 2002:a05:6512:ac8:b0:52f:260:c459 with SMTP id
 2adb3069b0e04-530b5f2f6aemr57773e87.22.1722455978122; Wed, 31 Jul 2024
 12:59:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240731191312.1710417-4-robh@kernel.org>
In-Reply-To: <20240731191312.1710417-4-robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 31 Jul 2024 21:59:26 +0200
Message-ID: <CACRpkdZ2wft1MU37fZQWKRh2jmz2HWiCLyx+ihvawWgkvORE_A@mail.gmail.com>
Subject: Re: [PATCH] clk: Use of_property_present()
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 31, 2024 at 9:13=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org>=
 wrote:

> Use of_property_present() to test for property presence rather than
> of_(find|get)_property(). This is part of a larger effort to remove
> callers of of_find_property() and similar functions.
> of_(find|get)_property() leak the DT struct property and data pointers
> which is a problem for dynamically allocated nodes which may be freed.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

