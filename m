Return-Path: <linux-renesas-soc+bounces-18285-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC13AD8C23
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Jun 2025 14:30:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 728F317EEAE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Jun 2025 12:30:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 638ED3C3C;
	Fri, 13 Jun 2025 12:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IbRxm4//"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E88139B;
	Fri, 13 Jun 2025 12:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749817830; cv=none; b=hC9KO2WSElPf6rwV2Vng5cpBk5Sf5Ha7rX3X0LAShGB39AdR32tRxhqVGHrCnLq1KmKfD2QNypTNmHX6CNLRtebLQciKUpGK0q/tCFldm7cjnY5GRM1sxmnMYdCe0GWIvIsqelgr7PxjD5wQOrFYKK+QzjVPAx8dzzijkmRmh9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749817830; c=relaxed/simple;
	bh=JoM1Biw9+AxMLcXjIvmijSuBmIBIYRKF0yU2gIcMG3U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kGs6mZw5tUa9sQ5IantILTgEv1UdVdnmZRrb6QfY1f2gcd+DRsUxSYyieixK94fW7K2skrqBGs14Gs7WVVjjJk4UezAbI/1XQzicAd67gTpJpkw9NPhXGbvc0hVyh8gr5TynIq1XR5hfsHqw7R3XDlKp46wuIc2n7nvDqVD+WK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IbRxm4//; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-450ce3a2dd5so18803645e9.3;
        Fri, 13 Jun 2025 05:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749817827; x=1750422627; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iyKH7IE5IPc6Hr2NfqI5I89RnlgcJHTrR0JgVtHniLQ=;
        b=IbRxm4//UkpvK7b64NWYGKKv+yElbdI40pjQeWosS7aku0mpRnWaD1pwqqIq9H8AP6
         NR5mhNaevgZtWLUWQmws581TBsQoRYGDPgcekiJr0hRTxkzbeGUH2kwiHiraZ7v8dNuk
         IZaF4wqr+y9r+THU7Y2G8CCL/lMHjG2TKJluCkV6C1WpSgRiyI2DF36u3V1JQtdKGJUG
         WJKvkeVyvrU2vVIHbd604eR0IsIBVErBw47uceHlTBSA+JGTbDuhkvMDBuZaioxtj43M
         /PcwbM/Zchmtwy9TPzSDsW/dkj2U72JY1YYNmbbHv5/dJlAvgxQJZmNRiNRyLeTFKs4k
         BuQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749817827; x=1750422627;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iyKH7IE5IPc6Hr2NfqI5I89RnlgcJHTrR0JgVtHniLQ=;
        b=iZD7/owYr/Hpsa9jB49DIxa9esdbE02OOySaE7K4Eio+cgs9s6rV7IBZR7LDOxG9d0
         0s6VZXpr1ZJqONNVnyH+bD/85CDzSNarSdEo+13+6k/QimclpNx4xPARsxf56paKGvJa
         MjGA4/Z/DDvjzM+05OmrIhAif2Jc3MSlHa0NJjhe0NtrTuX+Cp8H9LpMw9fZuwVgJLLv
         2z+NxMmIobO99egfG/FBfJ4nBYQb7j5cWoVY/tTOOjEzkRCcOkTF2ciJKuDRnAaM6hVH
         jgj4R3s33MPAfFFyBf4V5cpbAzfUT9VveSnchFpGI4kwbEXhqqkpzSf3zWw/qtiPiEvJ
         KuuQ==
X-Forwarded-Encrypted: i=1; AJvYcCVq7ZVNOt6pnGPYKMEF2nhHsXzYdr0z4DYcbGiLYI0XE8aOKKPebEW2zvvjNZH2suYBT69dqYPmnuaB@vger.kernel.org, AJvYcCWZN1ohUIir2AMlH5aPhaXKY6fjivd807czeJ5vXTypVsPhvMVlqU0xNla3OyHKUe7JoEFw0SAgrMVh@vger.kernel.org, AJvYcCXDuSIZ5d8LvruRJ0NuEh0H515kvjBam3jIqdRqiD8cq9LftgY5IQFsGS7xlu7OkJkYgTYEfBKZv/T98+zJ39eVr/I=@vger.kernel.org, AJvYcCXYLJ9GJ/AcwXkUD4DjO2FLer2n36D/ZCCRx5F0rKCM4C6CXBp5tjKdFctXxGKWyIENvrtwL8p59npSyVp1@vger.kernel.org
X-Gm-Message-State: AOJu0YxpOZKbt89LY6aoEqcLkt6dsjif2+aHr2bqLiDxtue+XeeEIbu8
	C9JBPbUOM3WNDJN0/WbeF5gwRYFW24v+CtiMfJ1LQkPRFhK7ytU7rKeY8lmGUG7TwKWGZ41EBRM
	ULxQWAprajJtn6hSaQejRVy0lc66bDc4=
X-Gm-Gg: ASbGnctcvTJisHeCFjdLTJCyXQ2PHyFxejHB3ZvCQ/QotT3vuniXHlfqoZzvjGIwPTv
	hlb0TTNJ/lK9ErhUC/OkhHdUX0U+Riwxcwz1YsUOppuMnihfTzoBTkwVVUqTcdx/7OdpgbzMNeV
	Op58v6dgwxq2ztuwp+cGNz4S+TTBQfMigiMoLmTBzH2oN9FiccmHYwMyb/c8rfn2I4O5Gevgsly
	F0=
X-Google-Smtp-Source: AGHT+IHKEZ0DY4lN3QrQTun6mph9rEiHXX0KHN0OSWnhARuZn78+U4bfJHK4Yh/js2m7/cDh1QVzdFKc6kQ4DgmUC0w=
X-Received: by 2002:a05:600c:6087:b0:450:cea0:1781 with SMTP id
 5b1f17b1804b1-45334b1a0d6mr35396245e9.16.1749817826716; Fri, 13 Jun 2025
 05:30:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250609203656.333138-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250609203656.333138-7-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdWd3atW6H=ewNcHDOkC7aEzXGi1mU0YtiEiBPgB6uT3bw@mail.gmail.com>
In-Reply-To: <CAMuHMdWd3atW6H=ewNcHDOkC7aEzXGi1mU0YtiEiBPgB6uT3bw@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 13 Jun 2025 13:30:00 +0100
X-Gm-Features: AX0GCFu5pkuuQ73sJw6VCu7eJzbS6egqReBFQrZwZIamPlb61Q6iENVYo4X8uUo
Message-ID: <CA+V-a8sRD1cac_YrWb2wZVR=piSDyyqTZ0mYcQvxcdrn2cYi6Q@mail.gmail.com>
Subject: Re: [PATCH 6/8] arm64: dts: renesas: Refactor RZ/T2H EVK device tree
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Thu, Jun 12, 2025 at 3:47=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Mon, 9 Jun 2025 at 22:37, Prabhakar <prabhakar.csengg@gmail.com> wrote=
:
> > From: Paul Barker <paul.barker.ct@bp.renesas.com>
> >
> > The RZ/T2H EVK and RZ/N2H EVK are very similar boards. As there is so
> > much overlap between these parts, common device tree entries are moved
> > to the new file rzt2h-evk-common.dtsi.
> >
> > Signed-off-by: Paul Barker <paul.barker.ct@bp.renesas.com>
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> >  .../dts/renesas/r9a09g077m44-rzt2h-evk.dts    | 17 +------------
>
> Definitely a good idea! Note that r9a09g077m44-rzt2h-evk.dts does not
> exist yet in my tree...
>
Yep I have based my patches on top of v10, are we waiting for the
serial driver to be merged in first?

> >  .../boot/dts/renesas/rzt2h-evk-common.dtsi    | 24 +++++++++++++++++++
> >  2 files changed, 25 insertions(+), 16 deletions(-)
> >  create mode 100644 arch/arm64/boot/dts/renesas/rzt2h-evk-common.dtsi
>
> Perhaps call it rzt2h-n2h-evk-common.dtsi, to match the filename
> of the documentation?
>
Agreed, I will rename it. (Note although there are similarities, the
DIP switch settings differ quite a lot. So If you prefer Im OK to go
either ways)

Cheers,
Prabhakar

