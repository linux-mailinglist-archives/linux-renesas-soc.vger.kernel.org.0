Return-Path: <linux-renesas-soc+bounces-21337-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 18169B43C01
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 14:47:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D38925A3CF7
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 12:47:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 520412FD7A3;
	Thu,  4 Sep 2025 12:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OzvXN/KI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C5A72FD7CC;
	Thu,  4 Sep 2025 12:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756990074; cv=none; b=g+gtnm6ibmyBZFmEkqwWNg4QZxAeB3TB3YXuz+FgINGAuTsrgmZL6vwpTzXa5XvWh20J2OHII+Vf55V1Hc4mNtCciBEJ+UHtJmnomyzVg/s8AoKvS+BqnBwZVzXXfq1fKA5UNcjGe1q/SeRA0VFC6RfcqKOrc4xflJLxsYrlJ9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756990074; c=relaxed/simple;
	bh=XRIuXJIB3Zot3wwRgKh46JJnCOZ9Q5LyRp3AdBLTiCY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cdUgW0yIB5SRqz6/jCaL2WH7oKO2fjEXBbnRFqL2kfqU057ESaOin/nDTfBUKo7PnZB7U7vclCNmPiq8Wp2Vta8UqNgxGwXAOmisSEcYcBRQnCcE4yIqNNw8kk7Ty0WfJe8FD9g9ZUjYy4m9v3Aad1QautD1tnUOHhk1oYZHVQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OzvXN/KI; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3e2055ce7b3so305647f8f.0;
        Thu, 04 Sep 2025 05:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756990070; x=1757594870; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XRIuXJIB3Zot3wwRgKh46JJnCOZ9Q5LyRp3AdBLTiCY=;
        b=OzvXN/KIa4aOH82bZv8F4+RBuuQXnoD85XPPJU/G7wt/ELjj5a/nNzQZJyHY1YciQX
         dxL9CAqx2YYcDL9uHDbW8Mogvcsuo/e+N7Z/9elAT7GwTp7YcWnvCfaLAVoVr4UdJ20G
         yWHvYufcDSLJX+OOfxW4HIpL1kUgJJoOXT9x+f+G9k/1bG4rRgTJHNOXS0WKpHMJTYbh
         WPw8vriiXOan8xmSd6BMTa91/vRE6A994hr0gNvJX0HKtRYrcJ/zqFi9tDv4csv8MrRu
         ETaasbQRuq0OR/XCfxXc8gFqvFpHlbnBDH+Pc1aD0CkuqAoK7sBYPQBhH3wpFoFyNR7p
         4vNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756990070; x=1757594870;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XRIuXJIB3Zot3wwRgKh46JJnCOZ9Q5LyRp3AdBLTiCY=;
        b=mFMIfVMxJusIQ4o0DcyW58h3axAyKN1rJ+2B7NDMWHuIng4oY6lniJEhK+DO80DU+v
         778+k8ugvUGZeFP6rE+cZn8BOTckA7SRvbHNxkNDuE+5Kv9mXNVnN4Rg+mBzZBL94BpA
         NDM36wSl2hDXpoGxg4jf2x5HCUMVAvli33Lou2ZPHtjz+3XvyqEAO+u9gXnU/xZ8aKt6
         uufEQK/C4JDGDPMZs0QdAWvg0QRB9gjHsapOBQzoOfPxkVdjT1kMIwUDHWT8txwwoKag
         fGqvZfKnqLc9iItAiJvgs5yro3bec2tBy1rjPvXLvybXGhoB/gM0h7epd7T4eNKPL3Eq
         2czg==
X-Forwarded-Encrypted: i=1; AJvYcCV1Dw8o5keMAc/KkYRO1RESqP+5XIRVQNlHNGeeOMXiBxW6p/8LVtS4WzOs/+l8VhrFuflogw1OZft3lC6qRC94csM=@vger.kernel.org, AJvYcCVcCoqeoxfwEiANqgSyYa1dISMlNycDHgw8mrgnF4KMwL2VmQ3azdVu8yJLZhFemTT7U/hQwDUJIbvp@vger.kernel.org, AJvYcCWYmZhPteud1uMOQKhFsdrDkqSo4Od7H9iFTHhub9amRxSmX4BDDI0JwCYdKLQ5Pt04LDnyqIQk@vger.kernel.org, AJvYcCXXdxRNuyFcgZbQRYVxZWG2dspV+HOGWhqZzh28dIoXwn+qqPWRirp/PlbZeUJPq0tS4lxlqff9+NvjPzS1@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4/O9IGP/WWLyplqpY6v3Sy6yDehIZ5Yp80YY7R7vuUcw8CUqt
	sVD7XjAH1S2ASjH2wCdynTCvX7IF4kIwqzIky7NaWh7WYJwIcHb6qqX14CWHHwKEs0rhzrZpHUe
	AGn4xVyCSVsHYkleE/Zwxmn2sHaaygvs=
X-Gm-Gg: ASbGncuMWKqmMgU+Xwehbn2a6QZfV2YvgkvHMXSiAJFpoe46VzYqVhUjbNtgTwxHYds
	GVDR1cIBTmDdui5uV83t0svF5Wr4/To5bCYGkhrq7V2o3fwXzZPuzHN75t7A1cxTvtHCft5JHUp
	wldRS+5wbXP2G4k9h0q/kIl9Wg2S1b4043rucMcEjIa5dEfSR9I7MpfW+GOJuMdP58Cem/nan3R
	HwN1ofJdY3yuKONkDMuFqYB2Stt6eWKVq6tEn/2
X-Google-Smtp-Source: AGHT+IErMwM9ZZVvlBYC7QcLuEmptQRL+wxuYlf3oX8bLrxBH/ZSMy/cA9GPc8/6Fwf0uswf6y2qakt5rjP2uMH0fUU=
X-Received: by 2002:a5d:5d05:0:b0:3e0:f4be:871f with SMTP id
 ffacd0b85a97d-3e0f4be8b53mr1951400f8f.47.1756990069475; Thu, 04 Sep 2025
 05:47:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250904114204.4148520-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250904124101.GJ372207@horms.kernel.org>
In-Reply-To: <20250904124101.GJ372207@horms.kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 4 Sep 2025 13:47:22 +0100
X-Gm-Features: Ac12FXxzt3ryjEuSTrJ9_f4ve94CEsJ4XZevGzz1DLihr3Jq6DPdwgFAp5rsTLk
Message-ID: <CA+V-a8u47RUNS9CgAegxcQuiJzQtQC+nZcsQueg-6f48HO8r1Q@mail.gmail.com>
Subject: Re: [PATCH net-next v2 0/9] Add PCS support for Renesas RZ/{T2H,N2H} SoCs
To: Simon Horman <horms@kernel.org>
Cc: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Simon,

On Thu, Sep 4, 2025 at 1:41=E2=80=AFPM Simon Horman <horms@kernel.org> wrot=
e:
>
> On Thu, Sep 04, 2025 at 12:41:54PM +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Hi All,
> >
> > This series aims to add PCS support for the Renesas RZ/T2H and RZ/N2H S=
oCs
> > These SoCs include a MII converter (MIIC) that converts MII to RMII/RGM=
II
> > or can be set in pass-through mode for MII similar to the RZ/N1 SoC. Th=
e
> > MIIC is used in conjunction with the Ethernet switch (ETHSW) available =
on
> > these SoCs.
>
> Hi Lad,
>
> This patch-set depends with the following commit, which is present in
> net but not yet in net-next.
>
> commit a7195a3d67da ("net: pcs: rzn1-miic: Correct MODCTRL register offse=
t")
>
Sorry, I missed to mention the dependency for net-next.

> Please repost (and if necessary, rebase) once it is present in net-next s=
o
> that the CI runs.
>
Ok, I'll repost once the patch lands in net-next.

> And please ensure that 24h elapses between postings to allow for review.
>
Sure, I'll make a note of it.

Cheers,
Prabhakar

