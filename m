Return-Path: <linux-renesas-soc+bounces-22428-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7F9BA771E
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 28 Sep 2025 21:34:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 06EFB4E0264
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 28 Sep 2025 19:34:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6021266B40;
	Sun, 28 Sep 2025 19:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d1LxD8wj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 049E225A623
	for <linux-renesas-soc@vger.kernel.org>; Sun, 28 Sep 2025 19:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759088037; cv=none; b=Iyi4xO8c58kGTzpARSD0Ww53LRy+zH79qwz22GhEoIvLjh7wz8tNrw07ED7XDy9Jf6Ay4bgfKQRLhcMn7qfEF7RJKMxpp4xnzxYPPh1EQqHPQyUE3zgGBlaliACyLDJchUed7vRXxoDlpHPATLtA7Cbm9iAzzRXk/DoxcRAsEJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759088037; c=relaxed/simple;
	bh=SY2WQpP4TD98VH+yCLub/gCUkYNLxrDYyequyKHzXt8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KFt0Pg8jP0OibZ7R5bBHQGUnBW3y5PLxBGjTehu/uPjwWLjDeJ6HokYMm0pqC0LJBLoruk6JBVz5u6vXYjWI2b2fCqCsyW20lGt3nafBpnxuiVZlcdw1nZct9+m/MqsHKuKg0fJF6YWbbrMIUxCNPxYQHJSAYo+Rb3MI9hu2rOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d1LxD8wj; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b3727611c1bso667016066b.1
        for <linux-renesas-soc@vger.kernel.org>; Sun, 28 Sep 2025 12:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759088034; x=1759692834; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SY2WQpP4TD98VH+yCLub/gCUkYNLxrDYyequyKHzXt8=;
        b=d1LxD8wjuw9nLarfwFKOJIFfFvrGgw/E2dsrVP8Ogmy8ygZ/j/KMOFkXJjwLtW00Nu
         0SOY5of7YQDgCmYg4WY7NKJJMIDwREU60O8sVmYJOKp3bXXSxv/vivgMP/20YBfYKrUl
         scdhEIcKARbZhEYOYD8R4gWspC8UlAEvHx6lUwwq4amPKc6xXstwr1cQ5TwuCOcyTJoX
         AiuqL+g41p8m/ugcNONdV0nCWIugc9tzkZM11jCeD7740UynR1Kg2wZoj5Mt+OJoYq/a
         SIEopqgbFvdEDdSBESOfhjXF5TfPDDCW75TQGlmuxbzko0JWe4V7pzGAQ1x4rKlGUezp
         sFXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759088034; x=1759692834;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SY2WQpP4TD98VH+yCLub/gCUkYNLxrDYyequyKHzXt8=;
        b=YpSS8MAyv29RkHQkYCGcvOFE+KfBNHyKMHBzBuNqu5/piSBixxKfuwIzQUVk7bGa44
         klnvoa7tO3/E4aIUB82MDtJauOUjsppOkVdh6tCQG3APJAte3fJexZfBdrpHTNGeq25W
         YctVfRn5wqwei5TTt/ljmgY8otmX2xdPFSTMTcEiMF5kODQo2UBIIdfroq7P6xDIQIou
         Wilahr4funoFLVZiWaOQ3YHc98h51gKk1Mxll4ckqPiF8xKDpgPnsLEtZp2/LeJNaecI
         iHPHmAAebnxo/r7IkzeCnbaqc6ZkRW5fPe6KpMt3RhgUl8DDSqMvQShFTuGzTH4oepDM
         EuZA==
X-Forwarded-Encrypted: i=1; AJvYcCW+EBVomqm1vf1XcVsD3IyBO+g1+MjNYoBHZEjKtrRgiPoLikgSFHBBLbTEN/Dvhr21EGnxiR9ItkwZA7eaOSYhrA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNabuBa1ZgpCtNlzLHWOdRB76aLp5dqvlYzqnxMwSTDcqw3nIj
	fNX2ZcLmhmKRO8bS2VMyo5EidEBmYWSBrbRgyuwpu5nLnYVSmH1R9luPHiyzDq2/RnYTetnfmvj
	ybBmN/rWcPdeJuKPRdmnCZ7lqSiTOXA4=
X-Gm-Gg: ASbGncu51nfTNUWyb6bQlXVsNFcE+eyj06UKzwVYHuJhaJaBAyLOwBSL0F7mz0xasD1
	6i1rKMNCWm3htOk1CUjXMtXZgCqGB/kWS/Ex5Yc51cw4s9IMyM+9nnCgadXcC9aIvVnYDAvqoXr
	fBb1a1Im58vsmB941w5kl9tsYxzd6HHyR5li9Tifu/7ZQKhn/TBLijYz+nD/EzWQR6OSi/Ty7h4
	V5boLTaQtA7O7wL/w==
X-Google-Smtp-Source: AGHT+IELSeCgCGyqnYFwLjpP9I/QUkSXTi30I9okuHYya2KnsNvX9kEtVC+RW54UOV7fvTUxJOJ9A57qSXR6SnQFGv0=
X-Received: by 2002:a17:906:c145:b0:b07:88ef:fe1a with SMTP id
 a640c23a62f3a-b34ba93ca8amr1820788166b.40.1759088034191; Sun, 28 Sep 2025
 12:33:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250923095229.2149740-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250923095229.2149740-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 28 Sep 2025 22:33:18 +0300
X-Gm-Features: AS18NWCwQng2zvXar3j9bvUGzv_wYAqN6A_8i_T4MH41majXCfzU6gFOBz8-dpw
Message-ID: <CAHp75VcEQ_14EY0Fd8GD17K7VBe29VN-bU5OtsFwKfpQHWrnYg@mail.gmail.com>
Subject: Re: [PATCH] lib/string_choices: Add str_assert_deassert() helper
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Kees Cook <kees@kernel.org>, Andy Shevchenko <andy@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 23, 2025 at 12:52=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.=
com> wrote:
>
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add str_assert_deassert() helper to return "assert" or "deassert"
> string literal depending on the boolean argument. Also add the
> inversed variant str_deassert_assert().

FWIW,
Reviewed-by: Andy Shevchenko <andy@kernel.org>

...

> Note checkpatch complians about adding a new line before the macro
> definition. But this is the existing style in this file. So keeping
> it as is.

It's a checkpatch's problem. It's fine to ignore it in this case.

--=20
With Best Regards,
Andy Shevchenko

