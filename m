Return-Path: <linux-renesas-soc+bounces-25226-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BCE1C8BECD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Nov 2025 21:56:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D65DE3A919E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Nov 2025 20:56:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35FEF33FE34;
	Wed, 26 Nov 2025 20:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ao41VIod"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48D44318135
	for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Nov 2025 20:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764190583; cv=none; b=pOdYEo7dRYjZb/vbPwGDOAmJ13aetpK17XGQJr4y+tSa3+9l0glpyx6DmnSaOqgq8yrS9jhG3SC6VSOWnljgz4tHJxCaBrzphH4f7WJsGjiFBOdfuDvPPYHVX5QP/xYVfbguLIBBvjxFJ/6hD2JwAPbY19QGK4aQavrI2UZkG3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764190583; c=relaxed/simple;
	bh=Dt350O4s7/IUq+j9naCofzl4cWJ8WislzSXHIBeUF9w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XZ9fZArw2yve9/TdXXnXy42Dt8maeb4qRizHwbhue8j1hVmHq79oOslJOnPMphWD4+G0Y+Zj+1UMaCaPkI0mnaOnIQ+XNUvPqy+LvBLqVhvOtMa6iTd9AUR2P/J2/e3O3pFwAfsUSgfwuGq3hI7T/al8Cg4rnwtIRpMlKMVvH54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ao41VIod; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-42b32a5494dso141328f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Nov 2025 12:56:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764190579; x=1764795379; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dt350O4s7/IUq+j9naCofzl4cWJ8WislzSXHIBeUF9w=;
        b=ao41VIodm6FTNBwsolI2pjkHM5dolV5rBr19ho/wEOfbWyXWxa99W5ZM05PXpUO+zr
         XeiuL5MPx9U8qwMiY7weF7Jd1TTqlDATdRVLVgY9gor64gBndr5/3wi5DprLjhxaYr29
         Rmw+PemP6IFnkF0JGn704Bjy0QDEHIW6cOEx5DhUvShdLlmNteGO8mgh/p8dvo+jVAir
         nXIXj24QPFsIgQViK7rykkHlNlGo0uOaW4RM+TG2R9NHPkH+Q8dPUaKGHLDOO5v5bFlQ
         3lqyVDA9d3SDwjjkXkVKNRy6Eq6FAsRg03xG3fK+bIJzH5RDjR0K7GwL5FP3SF2GqP0n
         Nrhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764190579; x=1764795379;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Dt350O4s7/IUq+j9naCofzl4cWJ8WislzSXHIBeUF9w=;
        b=LHVHlFQn6PS74cXaHXM2g2gaG1TurG3OmN5lYKMiJoVBD2yY3SBi6nRToFTG7h4ZYQ
         ttMvCBWw/5e9Yp+SQQXJLXeICoi199LadjcP8z8mWfzOlhVOAZdvXDkaKwLoEvzEAk5s
         r8cJAGGPDCi93ES5Zort4naIKmIfRh1jLLhUpODkbbMH7fk8bjjWODq6xJJFu+O97ht8
         djO6h62TszNqmDuWSZd/tiZY2TDoLLbC5vUS9WNoiF0+OVOW5C/R3QBLZMm6srJtaBzG
         nxlcPCegKlkEuiPAsLu7CnUdYzZBEuKIg/b7OSjcOqmeQ6tk2BHXWcvVpwsDjOY7iNbK
         DK5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVtXwUzoVsYv4DnSbPgodvOWdvBz9lcysBYDjj3XqpcempqaO/cDAgLReYMTjcQPAuChKtltOxhZRCrzzwwvyNPFQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwdhKptDDmxrAjrgfLnIPE12NBbnJBd6cDjI5DkKVa4EgTJqivm
	vBQASpQRCwUDN0KXjGWUJr/5RrBghxfeLrLIxkNSa5POIe2GZwfVWMu9vhiHDdjWWHObZk8IHHr
	oKH/VVqD4IKDit8v5huBTTmuy7xciOZw=
X-Gm-Gg: ASbGncsDZ7jqvyvztRcsSHdPglK1LQl0jIe0Uw6w4gyNos4lj+tuEU22SEei556a5+o
	zYdgIhzcDtUuB/L9MgJyiWH5LniehayLgis9AYweKCAJaU7fUKYQw1RDM1qoZYIdmg+z0fKWCkB
	nS7QxiadJJfXokOyFBxOVQG78TMPWNwapbXGVVnz6AtDfsaxO1M1SRSEcbC0wz+YcNJYXSkPu70
	qlhszBHrPzFota62AAjicL8E/Nt0EV2VXJAQwexUpBVLP/uV/xEt5Tk+8osZm7hWoFUhCkUJyZ+
	gPJ3+6Cd
X-Google-Smtp-Source: AGHT+IG0RXp7g3rwG1N9bVOtQ9ozNjjP0xKrNIIS8B+mwcvqHsgckTZtjgViUtn3Goop7bdPAsM6eed81Zilw5ZfTQI=
X-Received: by 2002:a05:6000:2f81:b0:429:bc68:6c95 with SMTP id
 ffacd0b85a97d-42cc1d520camr24897838f8f.47.1764190579376; Wed, 26 Nov 2025
 12:56:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251112201937.1336854-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251112201937.1336854-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <de098757-2088-4b34-8a9a-407f9487991c@lunn.ch> <CA+V-a8vgJcJ+EsxSwQzQbprjqhxy-QS84=wE6co+D50wOOOweA@mail.gmail.com>
 <0d13ed33-cb0b-4cb0-8af3-b54c2ad7537b@lunn.ch>
In-Reply-To: <0d13ed33-cb0b-4cb0-8af3-b54c2ad7537b@lunn.ch>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 26 Nov 2025 20:55:53 +0000
X-Gm-Features: AWmQ_bnVIRWusTHYXQG_pEIVx7CON6jGq6AQSdf9oiT5MLxC0fJE8jZLc8Q18PI
Message-ID: <CA+V-a8vx5KTUD_j7+1TC9r5JrGo2fJ0D7XXJCc-oHidtbUN=ZA@mail.gmail.com>
Subject: Re: [PATCH net-next 1/2] dt-bindings: net: pcs: renesas,rzn1-miic:
 Add renesas,miic-phylink-active-low property
To: Andrew Lunn <andrew@lunn.ch>
Cc: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

On Thu, Nov 13, 2025 at 9:58=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > Each of these IPs has its own link status pin as an input to the SoC:
>
> > The above architecture is for the RZ/N1 SoC. For RZ/T2H SoC we dont
> > have a SERCOS Controller. So in the case of RZ/T2H EVK the
> > SWITCH_MII_LINK status pin is connected to the LED1 of VSC8541 PHY.
> >
> > The PHYLNK register [0] (section 10.2.5 page 763) allows control of
> > the active level of the link.
> > 0: High active (Default)
> > 1: Active Low
> >
> > For example the SWITCH requires link-up to be reported to the switch
> > via the SWITCH_MII_LINK input pin.
>
> Why does the switch require this? The switch also needs to know the
> duplex, speed etc. Link on its own is of not enough. So when phylink
> mac_link_up is called, you tell it the speed, duplex and also that the
> link is up. When the link goes down, mac_link_down callback will be
> called and you tell it the link is down.
>
Sorry for the delayed response. I was awaiting more info from the HW
team on this. Below is the info I got from the HW info.

EtherPHY link-up and link-down status is required as a hardware IP
feature, regardless of whether GMAC or ETHSW is used.
In the case of GMAC, the software retrieves this information from
EtherPHY via MDC/MDIO and then configures GMAC accordingly. In
contrast, ETHSW provides dedicated pins for this purpose.
For ETHSW, this information is also necessary for communication
between two external nodes (e.g., Node A to Node B) that does not
involve the host CPU, as the switching occurs entirely within ETHSW.
This is particularly important for DLR (Device Level Ring: a
redundancy protocol used in EtherNet/IP). DLR relies on detecting
link-down events caused by cable issues as quickly as possible to
enable fast switchover to a redundant path. Handling such path
switching in software introduces performance impacts, which is why
ETHSW includes dedicated pins.
As for Active Level configuration, it is designed to provide
flexibility to accommodate the specifications of external EtherPHY
devices.

Please share your thoughts.

Cheers,
Prabhakar

