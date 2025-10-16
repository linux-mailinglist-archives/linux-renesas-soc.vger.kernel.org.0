Return-Path: <linux-renesas-soc+bounces-23156-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E71F2BE3F1D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Oct 2025 16:38:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D33CE4E22DA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Oct 2025 14:37:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C75E71527B4;
	Thu, 16 Oct 2025 14:37:56 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8503D340DAA
	for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Oct 2025 14:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760625476; cv=none; b=rRpohznUkOJBgDHMMIvYwoz3yhC3mJEdy5NUoF6z2p36xUxMEZCscskXgAKv6WyF/QgKJowDt2s4vavhriNtM1dFQfbbru26OC51aBjuqg7bSz4h8HS7yghd57QYraCqytxAU42jIsmZgk4LDHRHwC3gpoVGYPbTJ936jOQga6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760625476; c=relaxed/simple;
	bh=QMYwPDdqJ8DV681rGtY+oh0LJ+MFkkVHcY4G0TluSio=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j7cUcwAbycpVr5hFzdZI48hvsVxh83aDF1ss6bjvNYwRe5kesGMtjhHiOLBmvaofbNYb7xLmtNhUWxWG63fk8C/xE77E3J0uSjzN3IMQdfM6qZDQeHN7x5nqHYzMXpteqRn08xsb1gs+0YSCXOud6ikxDS8nILAjUKqHLiKVOe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-7900f7f4ba9so10198226d6.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Oct 2025 07:37:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760625471; x=1761230271;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7OKo+B/N8OpvVSgOheqCo9k1dnTlp+LYue6K4y6i8Mc=;
        b=I/ir+w0MhPunCiqsVnzIAnyDt2ns1TctljSTomZtO+X7qua3K35bWGAdvItEBl6fPh
         vFyY8D4fawEl5HUaXWwMSyAYbuToFFUiAfeAJhwLXlMAMVfzpamar3QclcRaZfLbolX1
         snzCmwwY4mJkatk9Qikavud/9vxpF2zA96dafEGHKeFWAm835GyIGoz8OgmfFPSOBq/s
         UXyxU2NG9qrZuJtekRB4bGxpME9VuynxDoZOsaK+dQqgE6+H/K/REY1aGpjKamH1R98H
         HCU3/YUs2FVYGZu4UthEGgDUWjKkNpcHTiRt+MUqtVQ/iETStkuWuncoGkLywn0d9Pew
         JFNw==
X-Forwarded-Encrypted: i=1; AJvYcCVumzqU19EuoWTm1pNj4Ly3Dx0N2CtROwhCuvWvoyEi4saD50dms6ZkMDCpLz/YVxsdb4z5aLs+dwo8lW1uvsQ4XA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8EuIHHcJCt1Pn3MY/dhysXLgMFXfV5vxBwI9A/d2I30X9IVvL
	xW0CAePiqoQ5zIbD0zdSfnjtLFid83HNRK3TIQcxIHrk5g0R4weDFN3W+xT8BOeE
X-Gm-Gg: ASbGncsUL2sa9cCf8ohSULkv/PeJVwtIijhrHUwNS2+WKd1JgBFr1zp8u1ukJoFmn6l
	s/3sdeqN35WNeTV8lCGeopHrkKRvNsP08sVBgAIcOZOZAnOeefLdaOuV1c1emHahmd09bCMnPKz
	dFB4MErif+KVjCWROZeVrflCEOHsgrUEXfid2IWW2u8EKo+o9AqvTIrTLbrg0plMf1n2Bv4uKqt
	nnFRF9LiLC+SbFQSi0e0DyoRQab8QMY3Z3Sfgd10g1fDndGAId0WpQODBSawYPDM9mQu84eiYGy
	h//7lxokx5jF+rlHJsLov8Im8pzuQJYl8WlNBFalMFKpisXWvn6SBj048rHzXU4jtaL11BS11Kl
	sHxvHkhXcELOwsSCYpWP1eOFaLNPsioeKwlo48VMiO8Q2G5fb7DuwEuFc99JtH15h1pZZwrTS6r
	cu40jJ53E2VsEfyw0Vi/AlQxqujfsQ6JyJayTytz7zvTewFdxmA5Ha
X-Google-Smtp-Source: AGHT+IEIMz68Fgv2QJkHSDza6bHkKEI0shqkuT3D2C9zpXtyH5YBUq6yKm+Uul8KN6QzGsDYqgxViw==
X-Received: by 2002:a05:6214:21c8:b0:879:b99b:9952 with SMTP id 6a1803df08f44-87c205664e9mr4868256d6.17.1760625471018;
        Thu, 16 Oct 2025 07:37:51 -0700 (PDT)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com. [209.85.222.175])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87c0120ca24sm41205206d6.6.2025.10.16.07.37.50
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 07:37:50 -0700 (PDT)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-890521c116fso23946385a.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Oct 2025 07:37:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXCmYZBEXuMk36Nq3bAIq9xvEZxyFj2aIaDN7885Fko5xmfe3nsobJwjmQNDs6ZU0KKpm5HFXifdzdXTM37brYFFQ==@vger.kernel.org
X-Received: by 2002:a05:6102:54aa:b0:5a1:3bcf:a93f with SMTP id
 ada2fe7eead31-5d7dd555922mr220616137.4.1760625133095; Thu, 16 Oct 2025
 07:32:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251015153952.185249-1-marek.vasut+renesas@mailbox.org>
 <20251015153952.185249-2-marek.vasut+renesas@mailbox.org> <CAMuHMdVdW+tMA1=g9D+BQV0fk0kis8FzyQgf7BpN-u=pi5eQfA@mail.gmail.com>
 <51ff107d-126d-4481-b94a-f614f31c7bb8@mailbox.org> <CAMuHMdW+_1NZYdXrGsNcHkuvh_ym9148BRB+d0Wbz1oZrpWCdg@mail.gmail.com>
 <6f29d7af-a2e5-4412-9575-6368621c1178@mailbox.org>
In-Reply-To: <6f29d7af-a2e5-4412-9575-6368621c1178@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 16 Oct 2025 16:32:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU9xSeFtLB-jUSUnJb1JHxYDXLe91GhZbT7QVGzYCXkRw@mail.gmail.com>
X-Gm-Features: AS18NWBZ0iJCimoz06t01ILJ3nlCiaOTwnBjpX9tKhkz8DwVN2SfgQuIjQCiZ2I
Message-ID: <CAMuHMdU9xSeFtLB-jUSUnJb1JHxYDXLe91GhZbT7QVGzYCXkRw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] arm64: dts: renesas: r8a77960: Add GX6250 GPU node
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, linux-arm-kernel@lists.infradead.org, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Adam Ford <aford173@gmail.com>, Conor Dooley <conor+dt@kernel.org>, 
	David Airlie <airlied@gmail.com>, Frank Binns <frank.binns@imgtec.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Matt Coster <matt.coster@imgtec.com>, Maxime Ripard <mripard@kernel.org>, 
	Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
	Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Thu, 16 Oct 2025 at 16:13, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 10/16/25 12:14 PM, Geert Uytterhoeven wrote:
> >> which are also never disabled, do we want to disable the GPU by default
> >> and enable per-board ?
> >
> > Yes please. We do the same with renesas,*-mali GPU nodes.
> > The board may not even have graphical output.
> > Or do you envision using the GPU for more general and headless operation?
>
> The GPU does have GP-GPU compute shader, so even headless system can do
> compute on the GPU.

How is this handled on other SoCs?

> >> I would argue the GPU should be enabled by default, so the GPU driver
> >> can do a proper power management of the GPU. If firmware is missing, at
> >> least power it off on failed probe, if nothing else.
> >
> > The *_PD_3DG_* domains are powered down anyway when unused.
>
> If the driver was bound to the GPU node, then the domain would be surely
> powered down in control of the Linux kernel driver, without depending on
> the prior stage to leave it powered down.
>
> I think it is in fact better to bind the GPU driver to the GPU IP and
> let the GPU driver power manage the GPU in a well defined manner,
> instead of depending on the prior stage to leave the GPU in some
> specific state ?

The domains are powered down by the rcar-sysc PM Domain driver,
hence the system does not rely on any prior stage taking care of that.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

