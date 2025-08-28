Return-Path: <linux-renesas-soc+bounces-21012-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F268FB399FF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Aug 2025 12:33:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 49E84461892
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Aug 2025 10:32:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1F8B30C63E;
	Thu, 28 Aug 2025 10:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gYhc/lEP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6FE530C617;
	Thu, 28 Aug 2025 10:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756377066; cv=none; b=pyDCzskQ/rlBe0nLpgO1lznwf3il99yb0cBhzYscIuXPuIO0hGX0Cg+Ww8qcMGspVDaIJtCCDB3z3wgeob0EIiwojYBdeEqBSwElvlG5b8MCJebpMHyulN4WbX5Ck9Mb/vx+lszvbG7zexumlD+HzEvrayyOjNdIA2Vf7Ubcn3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756377066; c=relaxed/simple;
	bh=W0brpwimq9RkxLnZXWt+xsI20F1lkIh4nfqFZz88N2c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q/0zPj0Y7MAfEF9kDTXUvc6Z5FSVHBscd865ib/ICRKQK5bjA17ELBTUqxuA9ZswIixCe0iFw71GUXfe6w1fg/ilfQdQK5oai6GezXy13rCrNOGzqmR29SRYdS/mNmGMXBh4FgU536rcuP34g8GLXIU9IZsHy4kReE5ylYjBaFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gYhc/lEP; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45b65469a5bso7186285e9.0;
        Thu, 28 Aug 2025 03:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756377063; x=1756981863; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W0brpwimq9RkxLnZXWt+xsI20F1lkIh4nfqFZz88N2c=;
        b=gYhc/lEPgoeuV4IYpzdr4x04bJZpWoeQ4IMNXCyDX/KaZMubRvLCAReqboDRNhLxVa
         6yXpXK90U9VmXb8LqwZlIH9fF7lPhdhw60W454H1m2+kCBTACKx8x129p6d/FuqRTdyS
         2A9SMCMKONQGKMmDdGqZ3OikVyMJttHWvGMgRcFHK09Od2c07Rdq3puXKf9LM3TqGcsK
         zs0nfkL6z7ycXPpnymffuRAZr+pv2V7np1zd27hid6hYTuYpq4Daf5lyDK2EvjI5LnFD
         epSURh4K7jAeHtSi8xvkQVMAlncQc5dn9CfPsCO0sY7arKOeQl2ZWCxdcOIG3tYt84Sa
         N2Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756377063; x=1756981863;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W0brpwimq9RkxLnZXWt+xsI20F1lkIh4nfqFZz88N2c=;
        b=Agvsjaye5iF9uxCqRoAVvgigv87iT48maoicixvQIw5opwM3nFBr/x8/CWOhsfud4r
         SlpOgYkKuoCpzxBcNyuGcnfO2TwRdh1Ezrvivkc1J52fvBlGO2AaQm1eOy3kkvaAZSIy
         rLOvjK7LLGi58tPz2/Wvkr6zFsuVc+IFUqx3dWYZnQdep4IOzrKoCO860iAZKZQpPBhj
         28eUMcOvDi+SSYJnHW+c1YDmLDEdjWYG3MQ4f5Xhlt8Rt2+28vXQHQcfPNqn5/gLYEwo
         It21N9CBgjKsc0ADqP921vmbVWwPIVtZJXjlq0qAYnC9S1DgCngJ/qHJepdw4L+H6WLx
         tlVA==
X-Forwarded-Encrypted: i=1; AJvYcCUWrB1wi9FU2+DBRIcIjdNktYdk3iOXImdUfWQr982kkUHE33LpmiRmr+wTqNLa6RL+tVkms6X166jMJARKMNoABmI=@vger.kernel.org, AJvYcCVW3DIN21nyg2QeX/acB9hayrm0vYnR2/Fw0Bcgy7qZH2544WwpcXvZWdjobxO7o0fcWukgrq2aeZNO/gE=@vger.kernel.org, AJvYcCWGFYdfXUILOR+b29MbX0UYv8mOo+zdRPV5oLm07x7wTNFVogsGj2pjCUxws6ZsYYJKNnzjvVJJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxfY0Ax1SPf9H5xpxhBGZGJ2PIT7SuYAwbFG4JzgtTsm3UsGz6F
	kZ70jv84jjVQBYZuGdQoPGfMBbgbeJLz6ErZNnBiEH4m0rBbBT0D6ob05mhQ430tNPcv9ysl96i
	M6qoeZROhyrhPHG5aMvX/gMhxsJODlXk=
X-Gm-Gg: ASbGncuF8sabw9ki8DjtU9u+FwcvWT8ozAYERTFQvIFAaZxTpPTYggvOEAkhucdyLde
	b1u1hsv8pcF7RlSwa/2tbXj26QfDOuCy2bWQHR4nTswNF26NvfrJytWvC36LWGIAgTcb1Q3jeri
	92s1PnZsWgZLCx2byiDViUZD7CHdDkvmQ4rkfeFv5LSP1VEww645s+bROtZH7sloxEU04iqmj7Z
	5R/SJvkCFO3qLcIDh3aRASXvpaVyVa6oSAnKyiB/7U1LLCi8TI=
X-Google-Smtp-Source: AGHT+IFyVC/+WRvh9JSxqdAQ/yLSaR52foVl4syPkfiy2XxLVMaaq4Qor6K0FPWwwUei3BmQyyvtU7RrYrfEpFEUV6Y=
X-Received: by 2002:a05:600c:c0d1:20b0:459:dd16:ddde with SMTP id
 5b1f17b1804b1-45b517c5ddamr139088735e9.23.1756377062866; Thu, 28 Aug 2025
 03:31:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250820170913.2037049-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <aLAumWuFtJrSi7Mv@ninjato>
In-Reply-To: <aLAumWuFtJrSi7Mv@ninjato>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 28 Aug 2025 11:30:36 +0100
X-Gm-Features: Ac12FXyHaokmLJu5YM6HMP59keuCAro7VX_D6vTPjs3n4hnWie2deZuKhM3_Lhc
Message-ID: <CA+V-a8ufD4uH=9FYz+-MCeCVZb53Hja5s=LNhcr3Psi6o0yBWw@mail.gmail.com>
Subject: Re: [PATCH net-next v2] net: pcs: rzn1-miic: Correct MODCTRL register offset
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, 
	Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-renesas-soc@vger.kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, stable@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

On Thu, Aug 28, 2025 at 11:25=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> On Wed, Aug 20, 2025 at 06:09:13PM +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Correct the Mode Control Register (MODCTRL) offset for RZ/N MIIC.
> > According to the R-IN Engine and Ethernet Peripherals Manual (Rev.1.30)
> > [0], Table 10.1 "Ethernet Accessory Register List", MODCTRL is at offse=
t
> > 0x8, not 0x20 as previously defined.
> >
> > Offset 0x20 actually maps to the Port Trigger Control Register (PTCTRL)=
,
> > which controls PTP_MODE[3:0] and RGMII_CLKSEL[4]. Using this incorrect
> > definition prevented the driver from configuring the SW_MODE[4:0] bits
> > in MODCTRL, which control the internal connection of Ethernet ports. As
> > a result, the MIIC could not be switched into the correct mode, leading
> > to link setup failures and non-functional Ethernet ports on affected
> > systems.
> >
> > [0] https://www.renesas.com/en/document/mah/rzn1d-group-rzn1s-group-rzn=
1l-group-users-manual-r-engine-and-ethernet-peripherals?r=3D1054571
> >
> > Fixes: 7dc54d3b8d91 ("net: pcs: add Renesas MII converter driver")
> > Cc: stable@kernel.org
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>
> I had a look now. Because the bootloader of my N1D board already set up
> MODCTRL correctly, this write to the wrong register went unnoticed. I
> verified that the now correctly written value (depending on DT config)
> matches the value previously set by the bootloader. As a result,
> everything keeps working. We were lucky. Or unlucky. Depending how you
> look at it.
>
Thank you for testing it. I'll send a v3 soon with `net-next` dropped
from the subject.

Cheers,
Prabhakar

