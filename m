Return-Path: <linux-renesas-soc+bounces-26151-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7219ECE6930
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Dec 2025 12:43:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CB3D63002D37
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Dec 2025 11:43:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31B9830C63B;
	Mon, 29 Dec 2025 11:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YWCpoTWb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67BB02EE5F4
	for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Dec 2025 11:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767008591; cv=none; b=OE3sCnXQrMZIy+p4BSYiIsYhFt6jHSI933z0gJdpuWFIVYNruB8Uag9HKRSesBk94wHAOS+6YDTNzGG8iorIFGl2Pa+WNvO9sXgsORdtSTI/I9lQ7vX82gx7hnzkowHmOe7v6d2G7SsTvfOx0Mz2cTZBnIMOnnrG7zti2fKD694=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767008591; c=relaxed/simple;
	bh=eB3XsZRjJ1YFGjnvrsqrBm1/10oeK+YwC4DIQNxLcCs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PiBInaN7sQCfz7dTuVJ3bJHFmEcZrxKVLSPy2RATB09IkJHql3Pii+2DnH9I1czuUSHAeUofy1+hyL8a6v0Z+R+AYE5+Jyh1ONGJKq+rjyOrJcmfU8bLMURY+P6t1j2X2hpDKXXjYzhmwU1ziQ8Hz9ks4K/nAtZ2edsWaiKw5Ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YWCpoTWb; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-42fb4eeb482so4458656f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Dec 2025 03:43:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767008587; x=1767613387; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eB3XsZRjJ1YFGjnvrsqrBm1/10oeK+YwC4DIQNxLcCs=;
        b=YWCpoTWbjQNXHJtkkb4+FR+bpQ4qxPiECNSByzCf7V+UE6kEFumH+a0Iyw/jn3JbvK
         scP9MyxHRlwxhI1/0cdg+TDZO7+KRFIi/bSgXIeszh9tyt+J2433NVsOG0SJf60NJAG4
         WpkaN6cLlDnvcSO0NBX6Z+lDG7zWva3St34uLwHo88zxZWOQ8/nVhs33chCQ7guCi9zg
         eddwCn3W8YO8tpioL1p1HNz6jEEEu4QDdFzAi5Ssgd50O/JSXtgDYcgkTu8ZcaF9u/rO
         be4KIc+tz2ALFpB3K3A6/8nDoM2zVbDNQw+JpO0fmQeMg2I3zVDT2M4qhCSH8XCE0I6M
         gOIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767008587; x=1767613387;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eB3XsZRjJ1YFGjnvrsqrBm1/10oeK+YwC4DIQNxLcCs=;
        b=ldi/HbMdF0vstkUEnYbqEQ+FqWnIkrJDYdlNXWKyCx6VJZVuXqDGqQf2hYuAsYUcOJ
         dzx3u5Kp0iYX0Dc/qrhFI0XIVWslfaowmgQjowtnrZ1zpCf54UWULbU6bVwisrV5jaQX
         Q+BTihHFvaJnhUSsW0ph1ZNF0ZPyOyiNsxE8xxFTYsEwaqz2agqKJtUlPhBfElawnwos
         6IsYuqwK8eH9FLciTHQkpvyd1GP9SzYTMzbD9Elbuf3xbWLjb9aB3d13YPh8tObGeU93
         xtGDp0uIUqvpI0RImCNiOAjuXLrsISBzJckuBUQhSu3TzV0A8jApWuhkeX6/nMQrd6hr
         fnvg==
X-Forwarded-Encrypted: i=1; AJvYcCWTx6k6hArzqBRSqHnKsau55lcMW5MYUPzoTl550gADBIWAeUIhUbl/i3uXu3dSqLz1As9xCf8xbuzHb9fumao2tA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxVTxI6WAMyyVquPf1p7pOgXdvAnhVstjnUgPK1F7t/UOUzDH85
	oXWGRfahTRrNcI0sXTJnnSw6JiO6C/YtTIovwDldxSsBucAq0D5k1AF+s1nfITzbD/S9qKXOoqj
	W7bSe0g9sFiNU2NOPb48C1/wRR732zF8=
X-Gm-Gg: AY/fxX47BTaGJnfOikzAYGloC+Bsj8NOnb4ULeVIN0VBAfwXrEGqOg9gAVpQYpXqwu0
	JdfQ7dMCPVBXURxJsynX5HaHA/nMCS/zTgD8ijittqKfghZOQDfAZnt6UZ6+lVENloNAOps+UKT
	CurV379zp7dCclhlWcEooorDBVYP1REvYfe5PxjtL4NMkhWB7eJoUs8YvQUFKy/mLMrCtkRtEKa
	w8n8c5XAWi+k85I2ebRbAJPgg/yxn/rYuAhngBQt9FVKtAjKAss3GH20Taob43aYYqv0CRMm/tb
	hsU/kIpf9RcZxPAdVRjmW3TyClOxCoiJH1TFmvkgJ5aZsm//qCBxkHvWJMgIIZfy0QuLx0y6PP4
	Uo051PtzAac4WVQ==
X-Google-Smtp-Source: AGHT+IGBZW6yTetvwnfGicrHJgS8HgNiMNHTIySH+8wEUsN70PrQ6mV0WydgwJ78qbVIDZx67ELX/OVuFUTj4cYkPUE=
X-Received: by 2002:a5d:4e01:0:b0:432:5ce4:6fed with SMTP id
 ffacd0b85a97d-4325ce47133mr21404075f8f.9.1767008586940; Mon, 29 Dec 2025
 03:43:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251224173324.3393675-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251224173324.3393675-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <20251227-tacky-cordial-ostrich-263625@quoll>
In-Reply-To: <20251227-tacky-cordial-ostrich-263625@quoll>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 29 Dec 2025 11:42:41 +0000
X-Gm-Features: AQt7F2oSeBaKR2srEY0LF2FWkPeA63InFdu1sEluQEP7fjKOHxwpFhKhpOiS8To
Message-ID: <CA+V-a8vh5gEfozFzym_J+aE1zDXXVbQwq8OWpr2F6rxLZaWKYw@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: can: renesas,rcar-canfd: Specify reset-names
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>, Vincent Mailhol <mailhol@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-can@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

Thank you for the review.

On Sat, Dec 27, 2025 at 1:11=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Wed, Dec 24, 2025 at 05:33:21PM +0000, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Specify the expected reset-names for the Renesas CAN-FD controller on
> > RZ/G2L and RZ/G3E SoCs.
>
> Instead this all mess should be fixed - you need to define all
> properties in top-level and only override them with specific constraints
> per variant.
>
Ok, I will define the reset-names in the top level and adjust accordingly.

Cheers,
Prabhakar

