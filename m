Return-Path: <linux-renesas-soc+bounces-20643-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA09B2ADFD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Aug 2025 18:22:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A73053BAD25
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Aug 2025 16:22:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D83F233EB19;
	Mon, 18 Aug 2025 16:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bdil02pz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B62E322DB1;
	Mon, 18 Aug 2025 16:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755534128; cv=none; b=uNbv1HRjzzJxgJxbliR2uXz7B31G9He4yFjrszbQzywr5KOvIxhiPk1RdjL6FxYiPBi6uswnd9wf+AXRywwfxvBCbhHfhpF8b1HGD4AVTW+TeBc0+ZWrkfltVHtvwCh+qCU/4YX2pwmq5DSXhpUoai+gCGzMWBz1mskUkL9Jhyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755534128; c=relaxed/simple;
	bh=Qfj7pMI5nMca/IztHecfq2L2z9ctOJVAhHH/VFFcIq8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hpQgJZtEmYdirgMcA63ENzyY9Fc4yMVaoZAiJBiZRmGV/ATBgqtnxDXPyWpYis9eG9y3turRDWByICLdvnHJptl1vwMPfC6KuKOA85flwXrk8FPOS9sJE9Qm/OTCqdaehk2DWotfDkopon3nrxVAip2ZRM4dT6tJIcjwZspF4M8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bdil02pz; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3b9dc5c2f0eso2880297f8f.1;
        Mon, 18 Aug 2025 09:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755534125; x=1756138925; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qfj7pMI5nMca/IztHecfq2L2z9ctOJVAhHH/VFFcIq8=;
        b=bdil02pzmMYgQLib8kv7PrNfWjTae3sbg8KRi5+V6HimzRDRjtBU6WyOYytYZRXG+k
         OGryJ7Fz/356fYe35r7LQhOt665sscvmK3KtaMF0TniIe0S+echZYEcKkeeT2Wcek9Oy
         0+dtO7KbOcED+Q/auc/vm3cV1zyZwk0NPAMWLJMpJSXWmpGa3UcmBYhDRy/SWFaxR6tR
         NLobr8Dc61XYd5gwjgEM74lcBwmJzmj3PR1Gqiw4KYr5wetFELmDwO6TiNqpNCkcklo8
         OzGNk4VTAAN44L6LJ7r5X7ikB4gMKfz4I9LcDBF1vYCi/77AucUp+3QBwkj5iluqCT2E
         AInQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755534125; x=1756138925;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qfj7pMI5nMca/IztHecfq2L2z9ctOJVAhHH/VFFcIq8=;
        b=WglqjYNaNLRU8piyS9pZfsvZEJ/8Eoh6RDkhRvKAoYbOY8U1l1trBqr1zYr3M+rwic
         BIo7PrSVxTN/RnmEKM8Js9MXq5blQrp6M85k703XO0MuhA/Gj0BCnM2humIbI+XG0/Z7
         AxqJNVQvMl8QtjMhHYHxfbzF+hhT0RQNodneFl/I8eaqyrJSz+7vDzzDpnM9mhFnCgri
         n9FnmjQ2QPpwzmIY5+licjV4u3Rla6fBZhTyxG+7vgMwW0RO3EFF9XBejyPpkQIQNLDS
         fMD7hOdU6rMwvGkmcm3n4RFLyuHYr9YFG+1PfviuR7EVYzRAIjxappIsR/L3k9FozQNr
         0vFw==
X-Forwarded-Encrypted: i=1; AJvYcCUYT0JBtnnaNeSolaLAkg7sO0FBTmYcl0ARvl601Gf3RROaDcOQY1VktskfCkPgYe6xp6zA6T5Dgp99wJw=@vger.kernel.org, AJvYcCV3cjOIcotxrGKbSXQleHTR3vEZLg6bgtJWIKbcXaAYZo7X8qBoH0+H1GZMf9KPFDXxsmEe8Dg73nfh1yFco6qKN8Y=@vger.kernel.org, AJvYcCXKmJQpAJLj3n/Ms9oYlV5MKzn4u+u72FOmOSQ3wwa7jV53NHC7EbTusObd100eub5qIFBS5mdr@vger.kernel.org
X-Gm-Message-State: AOJu0YzByZ8ErA7/4zbLg/f0N6v/2MzdboIxpHLzLmoGJlrXfc0/8B2B
	W1TqIZM40CVsGl6Mfy3vcHr1dr/BjMUT2kiq/f/zud5bCoyrsE/FWmK5qefK3Mo/G5LolEZYrHy
	NL9A4tvNi5EHkaMXB/igzJBxFRspRw1s=
X-Gm-Gg: ASbGncsj9PdjwtUWHFeaMb1I8PvRIcyDXn2XBzs1O/t/WwuhrlJzm7wpahvImTahda0
	gPJsMK8GVsYaRWv/9/STQxMuC0qAchbBb0tOZUJk/yFbL6Ko//6qzU3M+rTfNemaTlWWyoggCWM
	RdieNqO5UJw9iXcoJgNFYHa/vXNVHlqueuP2aFqYmUs3LgublxXo5sWte9wWwJPjRVCTm/68Vz8
	L6Q9Yapr6quUrJTwjQ=
X-Google-Smtp-Source: AGHT+IEbGGnQPMWCIXAvL8L/280oabkOTCvuCKOcom0cP0aggBgCZfl5KWPrE4xRC8bDhh/xPsTfXReBOIP5EAo/xvg=
X-Received: by 2002:a05:6000:2008:b0:3b7:970d:a565 with SMTP id
 ffacd0b85a97d-3bc6aa27b1cmr6648147f8f.46.1755534125386; Mon, 18 Aug 2025
 09:22:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250818150757.3977908-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <d33d201d-7777-4ed6-b50c-7429c54a2533@lunn.ch>
In-Reply-To: <d33d201d-7777-4ed6-b50c-7429c54a2533@lunn.ch>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 18 Aug 2025 17:21:38 +0100
X-Gm-Features: Ac12FXzeNb6IleaROwMEVtexu0XsPJ7th3VmpiAvAFefIU4smznv10ITNB_ba98
Message-ID: <CA+V-a8v+b3qHL=64xnVPoG8M+7drieanw5wWRPZFSZe-XqOigw@mail.gmail.com>
Subject: Re: [PATCH] net: pcs-rzn1-miic: Correct MODCTRL register offset
To: Andrew Lunn <andrew@lunn.ch>
Cc: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Florian Fainelli <f.fainelli@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, stable@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

Thank you for the feedback.

On Mon, Aug 18, 2025 at 4:12=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Mon, Aug 18, 2025 at 04:07:57PM +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> https://www.kernel.org/doc/html/latest/process/maintainer-netdev.html
>
> Please set the Subject: correctly.
>
My bad, I'll take care of this in the next version.

> > Correct the Mode Control Register (MODCTRL) offset for RZ/N MIIC.
> > According to the R-IN Engine and Ethernet Peripherals Manual (Rev.1.30)
> > [0], Table 10.1 "Ethernet Accessory Register List", MODCTRL is at offse=
t
> > 0x8, not 0x20 as previously defined.
>
> What effect does this have? How would i notice it is broken?
>
I will update the commit description.

Cheers,
Prabhakar

