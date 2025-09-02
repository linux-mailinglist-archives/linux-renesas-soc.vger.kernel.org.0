Return-Path: <linux-renesas-soc+bounces-21218-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 50BF0B4095B
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Sep 2025 17:44:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E6B2B1B21721
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Sep 2025 15:44:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37F9631E0EE;
	Tue,  2 Sep 2025 15:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DhEz28da"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A2462FC019;
	Tue,  2 Sep 2025 15:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756827841; cv=none; b=PGq++boUXqV4N8LCgBzwHTAIuwcJkj3JKi9hjkviYxdKuOBJY8UcdHFuxhMBUc7Ji9QQuga+p98wLgM+T9fVQzK8wpSxoY2p36y6RUuCS0O/YU41UFOH+KvBuOIv9G1CQUbg8gvhgioUtfMNKv1t0cSWr/tCxVJxwVjampAwRTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756827841; c=relaxed/simple;
	bh=IPqqn0GnguGU5cSP0RswoQ1BZy2RQuhjSXsG1srLe9w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tHi+Ng4a3Ut0r3vpBIgvWUAvPIN4mQG2nEqGud29P8yzuW4cv8zksnVhDsRVzEDwUyUxwRqLK+nDXgnNxXX6avIiHv+FalMPMZ3C0VjdDe11C4LrcknQvFuBVzR85rNlnWu+RijvVqAqZpgeemZlS4zfmiAnZOC+JDCKyijq1Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DhEz28da; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-afeec747e60so900257966b.0;
        Tue, 02 Sep 2025 08:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756827838; x=1757432638; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IPqqn0GnguGU5cSP0RswoQ1BZy2RQuhjSXsG1srLe9w=;
        b=DhEz28da4fpmOtTT7JX+H/lyUKvamNefxPs9yt5YT0z0ih1EPanbYtjJqsd/CAn1pz
         UeXq6LGWz6mKmoYn7HSF15l66UjN9C3eTIvixNuSgLb6fgQjyx+wqjZvEoyTsb54kops
         e2lr3bdbdp02F0rWS9iRMhIVGd5Ny6dZk+pfT61pmfEFpksJOjQEJOaOxwtJVvD/StWx
         WKaoxoAxqT3BMC5JuicnBwsH8nsbM2PE2Gs2Pbg9mtQXINQi5Ww1Q1stek3vzbWhBV/H
         1DbDDE54R+YxRiX9AHH8xVUMWyhA6R4mVx49AhaPk9QK7ppwCWxR2kwLyU7eZqfdYegW
         lrzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756827838; x=1757432638;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IPqqn0GnguGU5cSP0RswoQ1BZy2RQuhjSXsG1srLe9w=;
        b=WohBhkI2O2GNE3Y0PwXu+0FururTBzBxhE+JTEedLkDHJuQk2EFHZEtbRbjvwzQ3Yp
         m0K7yBgwr4kAg2g+joA+B/eOrMrg5BWdZL5s38ef6X/O40wldJ7bA9Ql4609k9BtZdBV
         odjavXwasbItBu7uC/FBgLUR3xnu7TSefjCpLX4rvBEvoSO1zSuEOJsvXq/STSI0j+5N
         Rv3eXLMWULmz9OmVrBvoACNF5gLo3oMvNKawjdPshrH3s/l3Gw95dhcps0jzbfZYfAGP
         i3eN4vxD+nbm3IBEjdc0nIotgtCFWILFLsr76KvAjXUfj/lzYjMT+REWVxdv6idoTys7
         3SKg==
X-Forwarded-Encrypted: i=1; AJvYcCV1paKepklpm/H0+4bdXoGjGXrivkhlssH3oaVOpqk7iFMVYlIE94Q3eivWa5R1aJAw5KK25DLeNQPh@vger.kernel.org, AJvYcCVqGvemTv1FfG1z3pRIB61mO5FPtI9Oqkp9YjCu2nOp+oQZT9K7cjhg1yvJaed0RhLeLn8AzlUlZNJuXhR1@vger.kernel.org, AJvYcCW9O+fgEMSMnJ9NNAPCvahpPddRfVWqXAUnGoVWeTFzrsEkm+lsybX+Wp66HJ1md4DEzxGoB2r++ColQml4P0i6/uQ=@vger.kernel.org, AJvYcCWAu0vW69ZK/B98eV/bwEJNFJjITRktHKDRcDmKiTVUENaRmZaYHaT488D256FrkwNouWN/lWWY@vger.kernel.org
X-Gm-Message-State: AOJu0Yw21nHjPTHukP6yy0uKDTgcdNjH5oiMpWxY+P1qjT/QgYJ+XY9L
	6XAEKSVhvdpJEzzKVwsSOc5Brr0pM3houmRWoC1MHuMSIIEEVF4hNbFJE9TajvwBC03G5kN1emI
	KNLFGqiID/5Cnjyv0Qeug0/zdyqMPwic=
X-Gm-Gg: ASbGncv2drg4iMTVaaWCuQtkIS8MnawZn3OOXyRTbWb92w7qO4ZfzYUzpC/KpT5Ok9L
	5z87hUcOtb/5fA74BvQJ5zDpH1LOuQk2iLUUPEHetY9cwVCr+a0zNcMK2F7bBtZcK4Ha+EkXQCg
	yRh7YmDiSFR1bc/eWhZHgv+LxAq/PtPfJ9knPA0R5GJWFt9Trv0NJ+oTIAA3qPWwlpORDdXuAJE
	L/XPbWc7pX2HDRKh8M/MUju3L7CBLRL1pwf2Hy1KdCWADu7H80=
X-Google-Smtp-Source: AGHT+IGjVz9zqn8BbtmRC26R4QSkX6A4Q84g3hbk2BHW4+6JnnTvFG+jS17Ww+dxP48t8AY/g3mKnA0lZtUe2mcohUY=
X-Received: by 2002:a17:906:4786:b0:afe:e7f1:28a2 with SMTP id
 a640c23a62f3a-b01d8c7835emr1258659066b.23.1756827837577; Tue, 02 Sep 2025
 08:43:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250902001302.3823418-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250902001302.3823418-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250902-spirited-congenial-stingray-f8aff7@kuoka>
In-Reply-To: <20250902-spirited-congenial-stingray-f8aff7@kuoka>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 2 Sep 2025 16:43:31 +0100
X-Gm-Features: Ac12FXzIsq1sQ-x5uMFEMxBzln58PfPIlzCTK000OG7RlVhFny-x7C12oPVK8qY
Message-ID: <CA+V-a8uy++vzYh5956X2Dpv2Low5uAK+FRTONaP4Nc3FMty6Bw@mail.gmail.com>
Subject: Re: [PATCH net-next 1/4] dt-bindings: net: dwmac: Increase 'maxItems'
 for 'interrupts' and 'interrupt-names'
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Russell King <linux@armlinux.org.uk>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

Thank you for the review.

On Tue, Sep 2, 2025 at 9:49=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On Tue, Sep 02, 2025 at 01:12:59AM +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Increase the `maxItems` value for the `interrupts` and `interrupt-names=
`
> > properties to 19 to support additional per-channel Tx/Rx completion
> > interrupts on the Renesas RZ/T2H SoC, which features the
> > `snps,dwmac-5.20` IP with 8 Rx queues and 8 Tx queues.
>
> This alone makes no sense. Why would we need more interrupts here if
> there is no user of it at all? Squash patches.
>
Ok, I will squash the changes.

> You also need to constrain other devices, because now one Renesas
> binding gets 19 interrupts without any explanation. Please rethink how
> you split your patches...
>
I see you have already taken care of this, thank you.

Cheers,
Prabhakar

