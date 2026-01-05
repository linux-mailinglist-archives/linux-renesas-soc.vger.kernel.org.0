Return-Path: <linux-renesas-soc+bounces-26312-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E43E6CF5B77
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 05 Jan 2026 22:50:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BBEBB30AB2D3
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Jan 2026 21:49:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EAC33115A2;
	Mon,  5 Jan 2026 21:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pEgKZLJg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09BA1284665
	for <linux-renesas-soc@vger.kernel.org>; Mon,  5 Jan 2026 21:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767649755; cv=none; b=YG536ZIkXqcvf6gzqKYhQ9vqKSDcA7oWDbltkaBFPltG9W7cnL5gCRSTHlJp5E2Qnt1Bhjw1zFckblcHUkfwgx0B4P63JRorvN9VbE8Es/9HQrxXUYNwqgY1ZUE2nug9QExP8c/0TdfJF7kNQrg5/FTR6dZu0XoP8mOmKFYIqmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767649755; c=relaxed/simple;
	bh=tFl8f6UADoPenxZLfME9W/650KiiVPnoFI/uwDXDZ8o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TUSMbTFpAhVonZ4gB3H/+XKqJLYqHtnzOxuDwOkWWp3MeSy/lrmMe4ha5T1aWrph/6e2wrl70uAdhFzTXQ8WI4Vb1NnYeSzwXEiAzjxnYHwDQxI9sO8g684dfx5RtRRgiqigRiDqhTkJPo1AUW1kumBMR7Y1J/RiCdTIi/XcqW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pEgKZLJg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD687C4AF09
	for <linux-renesas-soc@vger.kernel.org>; Mon,  5 Jan 2026 21:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767649754;
	bh=tFl8f6UADoPenxZLfME9W/650KiiVPnoFI/uwDXDZ8o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=pEgKZLJgEPZjgHY77k0bL5NNg4JuqBfaaeEiexraU6t+SqnaZkXyEGABKaOuhcQqc
	 bskklGdeN25wDCPtEY6ZALGx95bGQevj9+6a+ykKmx0WspNJAUFyJGVtbu9qEP1ll5
	 uQMTAJN9P36bNq8EGfONEa+PuxWHOgHIWxlPEq366TqU38q1+ks31NW2YJAYV0bxXc
	 ph5HcYdignoBxynVCLVwdP6Z+l3hfEiMPSS70qUnt6T0KLqCh0sUltTMMtz5jsv5Aw
	 fBRwmANEi6l9uURjDV+GkPLOMRkglUWwyXWBySaaIY4Sb2GOiz+aYqVfMP7s0a2x/i
	 hq8EUddnXmdkw==
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b802d5e9f06so54609266b.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 05 Jan 2026 13:49:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVD/fv/Ks3Oikt8VlA4/uxWiER9G3efC44Az7Sv2hjh1FlDDhMZxmlDhy+YpO7v2UVQZdhtwB9uKL8mx58PeuFwaQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzX0xrtLFTV1djkUJMUpYQIXGTeEKbtO+s7pSy6d70Usw7F27g5
	RQ1V/ShrxnE0HMBT8jutDadZYt9kwM3LVJHU5srJarvfEB/PeI97lI9iZj5Cz6ZOimXtIPfxPGs
	va8zAAKY/JDm7mbioZlneeVukD5LUOg==
X-Google-Smtp-Source: AGHT+IG+ppQPJsV5r8L9Xgeu+C9bIST8u0jgAiAwSYBGXl+R+ScdDFYQgINFtAH8azHO7O1X7uhdHjsZq92cxLINzxk=
X-Received: by 2002:a17:907:97d0:b0:b83:9767:c8ba with SMTP id
 a640c23a62f3a-b8426a6aebfmr112941666b.17.1767649753225; Mon, 05 Jan 2026
 13:49:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87o6prsl2z.wl-kuninori.morimoto.gx@renesas.com> <87ldkvsl1k.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87ldkvsl1k.wl-kuninori.morimoto.gx@renesas.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 5 Jan 2026 15:49:00 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+sJrFcAu3AZ7jhL9kUMTBOWOfeirVRdbTcgELtZDus0A@mail.gmail.com>
X-Gm-Features: AQt7F2qhbY7rlVaqjVQqEVUZe0L0H85g_jSSMbxZwYmO3r-Zhf624G2erOrVSxo
Message-ID: <CAL_Jsq+sJrFcAu3AZ7jhL9kUMTBOWOfeirVRdbTcgELtZDus0A@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] mailbox: renesas: Support MFIS mailbox driver
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Jassi Brar <jassisinghbrar@gmail.com>
Cc: Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 27, 2025 at 11:33=E2=80=AFPM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
>
> Add Renesas MFIS mailbox driver for R8A78000 (X5H)
>
> Signed-off-by: Masashi Ozaki <masashi.ozaki.te@renesas.com>
> Signed-off-by: Vinh Nguyen <vinh.nguyen.xz@renesas.com>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  drivers/mailbox/Kconfig             |   9 ++
>  drivers/mailbox/Makefile            |   2 +
>  drivers/mailbox/rcar-mfis-mailbox.c | 168 ++++++++++++++++++++++++++++
>  3 files changed, 179 insertions(+)
>  create mode 100644 drivers/mailbox/rcar-mfis-mailbox.c

Seems this was applied even though there were review comments on the
driver and binding (affecting the driver)? And the binding was not
applied, so now there's a new undocumented compatible.

Rob

