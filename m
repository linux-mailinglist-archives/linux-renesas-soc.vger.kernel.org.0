Return-Path: <linux-renesas-soc+bounces-11877-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C24A0236D
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Jan 2025 11:50:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C73E93A4985
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Jan 2025 10:49:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEC721DC1A2;
	Mon,  6 Jan 2025 10:50:03 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83AF41DACBE
	for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Jan 2025 10:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736160603; cv=none; b=Kq3tG6lnnwxTdHobltvdLC8rVqbfzCup7Ne5IaW2TAn0I0peIv4vYDRrFmENYWYLTwgrbe8c+Tff2QWp3o+7OuKJR2APiDawqUtnNgyPyqhjZDEkYBryKNinxpRalAfKXMacb/PNZv8xRHq0vuvGZK0U0vfoJlYIAkFGF39ISsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736160603; c=relaxed/simple;
	bh=fi3WA2O1XF1zZXfwBAoN7jPcMrjxXw6lIumsJ5DsxQw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FEG/vyAJcy5u9bTRzzXIXJFFV5XPztdbXJCahqL9lQPZQ4xV71crzQhchJujXpDoAQftgEPzXZM2rNB6nmshBAi7Li401lXZ3yPtnDTr5aryhgArpgfJhaRS7Cu8AWypZrZadqrFMYfLwxsXJ4e3W9ze7yHrnK++TbLCxyzbLCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-51bb020339fso2945923e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Jan 2025 02:50:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736160600; x=1736765400;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0tXv+ztMpJ4WhcnPErWXaaGR8pborXqbk9iF1FMT9jU=;
        b=T6us/YHIoT8j4qeU1jMqsA7JdCvHs7g9NP0q6VGekRoGGdeNniilT9PPDinzkDZQdV
         JSY8yxNnRTH2Iy6Q2BOwulHb9weyLJOQihF+rcQDJ/n/PCjkr+wrNmxZ/V+qugEcIEOi
         srXqOTF47IdDJPu/vBD5H8CrX2yVxswZxtJXcmDnd6fIwb1ZcLKhjMVbqrjlrC7TtZBF
         88+BfoDVhn7zi3IKzJ1a12jPdUURPrhKqVyD+Sn4OvbUtx/kdnyXv9ghpy5YDWuok6AV
         m1HccWPjn/c6JPeRsTZBmaomEKuC+grsTe3INdDhjDFYc/H9rGKiRoaobO22m9nCpoX3
         5nwA==
X-Gm-Message-State: AOJu0YzCGTkg89upCLDljWvoNKfmArn2bXDXvTaAdI7xRKiybF5eqtp0
	T+2yBvDhFOGms27yFFQLN0tvy/3LsUbN42CIRs+x2Q1h80DyyIqekqfQzdia
X-Gm-Gg: ASbGncuuCH8GHJjQLfEijBFPHpZxauRvQ/LXCN0RGunbsiVsHPFAQUA0ONXDHW/ra1o
	6YTGCpjRN1j3P9jV+mP1IoRv3kVTlgxRLNMuIAZfWI+vBCbCX58qXhAHb5ttMM8LyFX/4PdtTL1
	wIsRU7ipFeEDMLk7BTOljXdpQNoo0CcM1BX+gSyLgQMn5pTFU5aRhmjmiqiFqnEiE4OM+wtRGHz
	WrDqkxbKfaeUwol3BvpBfClKT6fO5wxIYwfzonD1jrsKy/z2O6EW7x+A2LnIoteaqtzcJRPzZaV
	FPek9xmHL8q4Mf1jvR4=
X-Google-Smtp-Source: AGHT+IH01sInpzkLZt851jSr8B4Veq1YvcnVsnXxSEQJWHxnIqyB+NOgHKS93V3tC9dKM+00wbBRRQ==
X-Received: by 2002:a05:6122:2383:b0:518:859e:87c0 with SMTP id 71dfb90a1353d-51b75d40f16mr39287155e0c.9.1736160599891;
        Mon, 06 Jan 2025 02:49:59 -0800 (PST)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51b68cd968bsm4251677e0c.42.2025.01.06.02.49.59
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jan 2025 02:49:59 -0800 (PST)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-4b24d969db1so3351678137.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Jan 2025 02:49:59 -0800 (PST)
X-Received: by 2002:a05:6102:4422:b0:4b1:20b1:bff3 with SMTP id
 ada2fe7eead31-4b2cc3a5d1bmr45914070137.16.1736160599343; Mon, 06 Jan 2025
 02:49:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250106104458.3596109-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20250106104458.3596109-1-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 6 Jan 2025 11:49:47 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXPYwJfO2ojsCCc5ou3FZvGkKjwDpSvJGCOzr1E3z1WHw@mail.gmail.com>
X-Gm-Features: AbW1kva0N4d7xzc93VZLjGcymibE_aDHrX6s49e90NiPseHN4GS21hv3hEiD718
Message-ID: <CAMuHMdXPYwJfO2ojsCCc5ou3FZvGkKjwDpSvJGCOzr1E3z1WHw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: white-hawk-csi-dsi: Define numerical
 CSI-2 data line orders
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 6, 2025 at 11:45=E2=80=AFAM Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> The second CSI-2 C-PHY data-lane have a different line order (BCA) then
> the two other data-lanes (ABC) for both connected CSI-2 receivers,
> describe this in the device tree.
>
> This have worked in the past as the R-Car CSI-2 driver did not have
> documentation for the line order configuration and a magic value was
> written to the register for this specific setup. Now the registers
> involved are documented and the hardware description as well as the
> driver needs to be corrected.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>
> ---
> In this change the numerical values for the line-orders are used as the
> changes video-interfaces.h are not yet in the renesas tree and it's a
> good idea to get this DTS change in the same release as the driver
> change.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.14.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

