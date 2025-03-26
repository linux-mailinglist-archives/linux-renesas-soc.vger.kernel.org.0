Return-Path: <linux-renesas-soc+bounces-14874-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F4DA7179A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Mar 2025 14:35:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 470BD7A4926
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Mar 2025 13:34:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F11C51EB9E2;
	Wed, 26 Mar 2025 13:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MXLtPHs1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 634891EB5CD;
	Wed, 26 Mar 2025 13:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742996119; cv=none; b=l1ASKJRu3xZSpcvBsSXp50RgmeIyrtGHh5YDNAf8+3tjqOBqWblLbQj8u2sMCo9Raw8W3e8OrxMU+HO0xp0SKGHCkIzUl3/4JKtQ+kCGnfjV40eav7K00DRzFu+N0oT1B1207mKrHr+t378RTJe9LU1jb2nG1jbNBvIJspKgdRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742996119; c=relaxed/simple;
	bh=lp34vauMLSYzevBazX++zx+NSKKvk50bARTprsasK/g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V9MjIN5yJ1xeY3MLf2RGDabeueydPerG+a/1bs4LeJCeJmsLbhKh1m+9L98fEJApAvfYGdOjCWv8vf8Ky+GSC89NkPXHN9JUHcflT+6lahRLl6st4RcFUMt409keJ971XrzFEysFvU78CCBS8gWgbzxMi6AS5bYjMV+xpiQxjGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MXLtPHs1; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-523de538206so2846180e0c.2;
        Wed, 26 Mar 2025 06:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742996117; x=1743600917; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lp34vauMLSYzevBazX++zx+NSKKvk50bARTprsasK/g=;
        b=MXLtPHs1bxGsW8Tkj1besGP8pYDXArzm7VSxaIYw4AYQpVhBI1KrzaR34iIUVK4lGr
         1QwwUsO3afzZXLBLEXkXIMANDOsximHv4B7fbbRAb0kkpYXBMOqtLhNqKy4xwZcJpq/c
         XCVLk9r6kRMKr76l9iEuPYwZKMf4iiofmDSNH6usxB80qqQI5YekutIbSGfM6woc/NSS
         +Illo5fz0l+mh6MzxtZJDTJoncVpn1XWToiVfPp88f7kzh1regDkKxJP6Ljsr/F5aBAr
         KYR9nY4KkMQHV99bJ4dVOtygawZtwDfuFv3AcyaixdtYmBpnJzQ2/+IkUEB+3pArXYrh
         akUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742996117; x=1743600917;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lp34vauMLSYzevBazX++zx+NSKKvk50bARTprsasK/g=;
        b=ZGZrp8uXPoYCiLNfo9/uuCXCmGPgzfbcaLQEwIIE5oa7Yotg21M24IjnslzlTeZhDB
         9yF4YJZK4Mv1xC9VaM3wBb4yeA+8kjD4gBKN7SvLs9HptjR98SIBnh5W0n4DBRgqeNFw
         jHPYAuTn06DVZURFwxv2qbLWhXinUDrNi2QztLGT4OdI6adGzwIBrWvmVgJZlZJx239J
         zxHcku+yDsydsQSJvu+nXE7VHQacfAd04VMZiA6E6kFTLotl/uuhDSz2YVseHq0PF39k
         Mtw7ke0yq05sZjDlAfATceBYUwE1u58XEEcjxmd5/qCXET9izR2HmY/R5fbjAWEnMvev
         6IfA==
X-Forwarded-Encrypted: i=1; AJvYcCUlh2TGY6Pb6o2GE8HQT2KRCAf/62uIQKYp2EcDE7sfn/7pVTHRvDcBg1ZOGoSQqdUwmBTHkzxL7QQvpXBRKhxzO74=@vger.kernel.org, AJvYcCWVAw8l4slnoz4ob8zMw1vJokOINPmU7Muqci7njohHH34wd2GyO5B+e46eQ87apjpXR13VEUA9dPbzQs2i@vger.kernel.org, AJvYcCXK+HRQtON01AgNAYcQrzCy6plqsza02MT4qq2XpNsKZNLGAH+LHaqdgYwWuCFcFIhy1HHffmDZ@vger.kernel.org, AJvYcCXdl5AGv0pM7tU3zDRWYr8sbv7TC2Lu9NPEwTqJuI6GYvTNdJM2efEtDBXZdF4sB2DPsWZFJzYbX+Mf@vger.kernel.org
X-Gm-Message-State: AOJu0YxR71/jttDY3/dM7b11G2iC1sipRVVgPX5/v6hIqNL4QLR3CuPD
	98F+ww2IVQE7nDbQJXtOM+j834rd7yhEbvKrXZlB3Uqn5pXTBH3bQ+11D/q8LnWcfHDD/5gDjMP
	SWOwUhQmm6EQTzCS9uf1Vnztnx4k=
X-Gm-Gg: ASbGncvAacXFBscxHEAej8eWPUlX5WcQMudihFO1taT3Uy+tSnAzhAaUAmNlysinzuJ
	iiVxVPS2ZA6CUUlqUVoJ9rBF7PtRkPTnsCi6VaPd4MsYaF6DWRdz5Rlgw5PUlhuvOYb0blixRbA
	PDj1OzWcaMetXGId6tWFsmNPrXuZWqZ5ZJMbNDeNtmC7yEBj0QVwm/9bzphA==
X-Google-Smtp-Source: AGHT+IEUmcYfHuSTlZgzBbmVjkzRniQ14u/k7mUnOWNHChznAZ1HSEleCDcpDvC+yt9pwa2P1wJ87namijPVjASXT/8=
X-Received: by 2002:a05:6122:d9c:b0:520:51a4:b819 with SMTP id
 71dfb90a1353d-525a82df17dmr13232215e0c.1.1742996116974; Wed, 26 Mar 2025
 06:35:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250318205735.122590-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CA+V-a8tBh1Ev-8=0vcmz0XB7iqKzZZ5dKefrZCrY49Je3KTCAg@mail.gmail.com>
 <20250326062148.152e3daa@kernel.org> <d614f117-d07d-4ac8-b5e7-7114a3ec8404@lunn.ch>
In-Reply-To: <d614f117-d07d-4ac8-b5e7-7114a3ec8404@lunn.ch>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 26 Mar 2025 13:34:50 +0000
X-Gm-Features: AQ5f1JoBqnBoMnvSdWF3Np81xkBkv-kY_12b6ENX0lpQwcp-LHjwzvjSDvzAFGM
Message-ID: <CA+V-a8vS=MQRtO8N+GO6EUekRDrytWj8p3=ahYo71gt+m=DdiA@mail.gmail.com>
Subject: Re: [PATCH net-next v4 0/3] Add GBETH glue layer driver for Renesas
 RZ/V2H(P) SoC
To: Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	netdev@vger.kernel.org, Jose Abreu <joabreu@synopsys.com>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, Magnus Damm <magnus.damm@gmail.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Eric Dumazet <edumazet@google.com>, 
	"David S. Miller" <davem@davemloft.net>, Andrew Lunn <andrew+netdev@lunn.ch>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew and Jakub,

On Wed, Mar 26, 2025 at 1:29=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Wed, Mar 26, 2025 at 06:21:48AM -0700, Jakub Kicinski wrote:
> > On Wed, 26 Mar 2025 12:52:17 +0000 Lad, Prabhakar wrote:
> > > This patch series has been marked as "Changes Requested" on Patchwork=
,
> > > but there were no review comments on the series. If the status was
> > > marked as "Changes Requested" due to build failures reported by the
> > > kernel bots, I=E2=80=99d like to clarify that the failure was caused =
by a
> > > patch dependency, which has now been merged into net-next [0]. As a
> > > result, this series should now build successfully on net-next.
> > >
> > > Please let me know if you would like me to resend the series.
> >
> > Don't send patches which can't be immediately merged.
> > You will have to repost, obviously, and after the merge window.
>
Thanks, I'll resend the patches after the merge window.

> Just expanding on that a bit. We do more than build testing of
> patches. Some runtime testing is also performed. So if they failed to
> build, they cannot be fully tested. Hence the request to only post
> patches which build.
>
Thanks for the clarification.

> You can however send the patches as RFC, so we know to ignore them for
> merging.
>
I'll make sure to send such patches as RFC in the future to indicate
that they are not ready for merging. Thanks for the clarification!

Cheers,
Prabhakar

