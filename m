Return-Path: <linux-renesas-soc+bounces-26905-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 073ABD2E839
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Jan 2026 10:09:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CE823302CDD7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Jan 2026 09:09:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4047B31B10B;
	Fri, 16 Jan 2026 09:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KB6qHY9a"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7437631AA94
	for <linux-renesas-soc@vger.kernel.org>; Fri, 16 Jan 2026 09:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768554547; cv=pass; b=Xv2rzdv4IK1NCHRPeryMN/sfIoGPRCTHQGn7duZOxGe1JgTBklTRc0gSnig3GD+vFhAHqYxPN4dcutGBvlS7VpSkngMWN93TQCNhbMGa9p/pe/zAQAmonO01dEfjKHdujvGraERkxvlhO3rOnkEdroXGnIqfg2iYnX08fpLiiao=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768554547; c=relaxed/simple;
	bh=PjK03eNHVu54e46b4LG7wzxw1HUYYstUJemKKBLfOos=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lmOxcsVe7HvQBnOfdsasBl+AAH8Oph6ZwEcAIOgF4SHN4/2bhvhN1LpQHUyZ8b314Su1EWPgZ5Wv3VOIsQUyxFPjZLmTCbNTpZfAsOqS9sL3g2ID/lkRXAZOf8OUJ4oeMqjYwYBwR+AqswjrYurGJPu+IkbPKkCy0vDz02pVAKQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KB6qHY9a; arc=pass smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-42fb2314f52so904747f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 16 Jan 2026 01:09:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768554543; cv=none;
        d=google.com; s=arc-20240605;
        b=erZv97wl0s20pvv7l4WFiDTba+/c0eCufivjA0We/f87LCRjhlPM4pvyEbhzzWB1XO
         NIiuTTkomDz5DQNJgHLtjWp4ae8qT3vRC4ZYQ4Pt/FQUmKTawjNs+HfVck/LwN0RS8bQ
         8Am9NuEm4e30UKY7m3M+CsmZuZWEWAOqiFeuTIT34/6OHgiFnNAlMeViKrZy/XUQZ9vx
         zW82JO50+N5ZEhkRmhc4qtDs7gbrpcIl5kMVwLf3C+LuECBiv0kHsGEZPv+x+9CGVCzq
         ci09CoZp3CojdAxLmJZ5RWJ9VLYjTZz/92BSYPIpHTLHRCSPe0iwd5jgLyYD/4jhmL5v
         4Tqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=p3RHWH4ytRePUw0e46MQem9UGA0Z3K6iBpKhJ5leauk=;
        fh=+vTKBqIK9Rm8ki7SNIS5nImQ84/UU3sohExR2EryRDQ=;
        b=D5XIpzkSNQ6SEgIUJt6eqyd5C8SKyHBAEhLK1zOflOrpsMFtfAXaIxrRy115tBCzOb
         o2xfynNyhHMWHpkD6aULQMa2K6k6hsv8DsKBMoEfsgWVBGkkPI/+sUqPvHXztu6vUret
         KFnwayLEP0IASb0XDpf5/Qh+UMsG8PVPdq8t/m8+oJ1xm4JJ6Wd5D8yomdfWCVeweHyU
         BJL4SAsjZp7qCiXEJeFrP4x3W6QktwQoMxgR2IvEJwe1JBdPiXYTZauFNhBEiJzyWjgq
         nLHbLfaruBXrIphwRexxTywNLYMHsZ09mvpAVA2Dw87vGVqQmCMCLVDA6TUkdPlq/QUC
         4XTA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768554543; x=1769159343; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p3RHWH4ytRePUw0e46MQem9UGA0Z3K6iBpKhJ5leauk=;
        b=KB6qHY9aUmTlBw53ee9wvSbISR0dx0CFgMdP0XMBBFcmCw1xuCagmejYQTKbQ4tUGd
         VvHZJ//mpdIU5xCmnV06hmvqZpZM4ZseEHfzjtKOnGGLQwVhtDj3VAcj72LYErB5yd+b
         yhDMOO64iHxD+s6nh4Pu7uVuuWqMziMHckk3gnQpYDDCCmzd/yyQjxX7CoWPOnUUxgPL
         3szzRJDiOqWw6elaFH3jERVKRYmsbwus2VRMfCPDO68b2LR26/ZzjZaW3a0TYxYEOwmB
         LAY/sMEEBX6tF+4v1u3gud6y/7nepT2Eekh8FWzjhL4g6cqhdX7emL7zivvibYnhOjHa
         u/mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768554543; x=1769159343;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p3RHWH4ytRePUw0e46MQem9UGA0Z3K6iBpKhJ5leauk=;
        b=Q2Fz9U/4T8cBGYz9ibmhnnfCdQm5OpAypvQbqfJhW658tY6IFm0ld0udMmDynnjkgS
         W2SfloMLZtfv2kWt/2MWOtsc7qTdCKj6EOS/W+LglgRvzHBaXJgRZq7CdEc1hHE/CosW
         apKM2zOWv9FLYKrnl9zfr8nU4mVuQIdt0g7KlIaRoNNu4IJGR7vww7Q6SI5tcIJaxN3i
         bRbAjNfdVhcdvAAJR6M+eBy/i/xvHIafLGfapQLUVKBzvEEajOwtMPiYe1pY3JgI49mz
         rypuu76/bp3dURlqjcruu50Dk33QzQHr01JJOD4TRq9tm1kR9eBYt1q9KDQlTp/dV8Ue
         Bx9w==
X-Forwarded-Encrypted: i=1; AJvYcCVSHaSxRojBYrjw2KAKYbEreg32OTPngpqh5UzxtCTd7SvbpA5tT/Ndi6VrFH3+WYxDVRwsIxfCf7Dl5YN65l1NGg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxlhab0GuvfqLG23jqqPpyDhOUj9O1+1DPiRzV0CYiWwuTGvFwT
	QNGz5cdAYLiiYy55D0fQ4h9LFfUZIDYtfQGidR+53eH4j4bee5y8ThogadxoQxLCb7qTCrkSG7x
	67OUULE+vCALiIdNMMX1kYg9s7lwzMcw=
X-Gm-Gg: AY/fxX4VK1pqNY0BeGWqD+jBVHAwEIFtS8S2woLX0Bmeho/HHd6Yk+qQjuIZTL5HyS2
	jY9oJtkae+o8EUcW1uvMOnS6HIVinBwtiPgcKZMvGCLoz3CpCiwUyxKc0yiubiko4ENYSkRL1B3
	n2ntcWgEL4MU13jJjkkFIw1MhMVze6fcTmYHfwAUI1rdVqBbAegpTFuBt71HG/vj3nRPE0YKI3q
	Y21XnIHQMvlrWuECbQWeS0B17Z/PQ54/rozC93dWHckojODtcoPwi1oFxINDuPodq2w3nT6soPc
	R+uJiOsmTGWV/FVh8/lTmU/y+OFgek5fiCOMUolyczJCkC7DN8+/rtyCyQ==
X-Received: by 2002:a05:6000:1865:b0:431:8f8:7f1e with SMTP id
 ffacd0b85a97d-43569bc7bd8mr2589126f8f.48.1768554543273; Fri, 16 Jan 2026
 01:09:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251230115814.53536-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251230115814.53536-5-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdX5_TkFmgqv29Nddo4bZzEWQrL87kwqTdiLwfq+qMtsXg@mail.gmail.com>
In-Reply-To: <CAMuHMdX5_TkFmgqv29Nddo4bZzEWQrL87kwqTdiLwfq+qMtsXg@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 16 Jan 2026 09:08:33 +0000
X-Gm-Features: AZwV_QgFbQun55gGsT_2ZrF5-QmyzEueFq5_0nBPjc3PDQivLg_YkXjnYFLjBnE
Message-ID: <CA+V-a8u4o7=PXjE6nw9Bfo7Tn8dFoMQB-LGEuqk6skK_7zXCcw@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] can: rcar_canfd: Add RZ/T2H support
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>, Vincent Mailhol <mailhol@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	linux-can@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

On Wed, Jan 7, 2026 at 4:37=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
>
> Hi Prabhakar,
>
> On Tue, 30 Dec 2025 at 12:58, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > The CAN-FD IP on the RZ/T2H SoC is similar to R-Car Gen4, but differs i=
n
> > the AFLPN and CFTML bits and supports two channels with eight interrupt=
s.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> LGTM, so
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> However, compared to other SoCs, CFDCnNCFG.NSJW[6:0] has:
>
>     0x00: Setting prohibited
>
> Perhaps this is a documentation issue, as the same limitation was
> dropped in RZ/V2H Hardware User Manual Rev.1.30?
>
I got confirmation from the HW team that it's a typo. Similar to
RZ/V2H, setting it to 0x00 results in 1 Tq and this shall be reflected
in the next UM update.

Cheers,
Prabhakar

