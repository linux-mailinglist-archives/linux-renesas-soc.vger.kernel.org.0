Return-Path: <linux-renesas-soc+bounces-15895-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E3EA87B08
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Apr 2025 10:52:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0949C7A8A51
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Apr 2025 08:51:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E18D23BCFF;
	Mon, 14 Apr 2025 08:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AW6qmC5I"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E1BDF42;
	Mon, 14 Apr 2025 08:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744620752; cv=none; b=G++C6qUDOcsXqB+LT0fs6Y1MRaHilEgAR9QA7mZo9XdbpPZ6CwEfgx0sE6YVRmCJ95AESuRpexuJMewMqpT/Hv4KMUt+SbA4KerpqfDiSApwp/ZZ+eshgshIz5KxIr5mFDPmNFyICRjCYkb8cFNl5xegHC6f45Qnl/AaTSea+i4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744620752; c=relaxed/simple;
	bh=njlJ6wOPTfgXbiVOtvyAn8VB29ZgxhG14ZDHCkhqO1c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UXF6RVylfc12feN5NuMHwn82mQ+16mAKDSCyMVZm858QrcQs2zOx7rR4QU7yt26Uf4yphIhPaWpwMywANjm/XdVU2Vys/oGa8Bf9i3znHMx394i5/J/5EXdTX6HBgxuDmmp2SpwmhLido0Om88xCVlrEmPbBcQATXnubWjt9CCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AW6qmC5I; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-52413efd0d3so1707430e0c.2;
        Mon, 14 Apr 2025 01:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744620749; x=1745225549; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RK1FjQCAv98Eay4SPuOitMP3sY6he/myS3klmD5dY54=;
        b=AW6qmC5IPbxz4Os6/GQ7QlrGXje+Ynhqgf5gEeZhCfvhwfoY+s1JApLJKoX0agIs68
         mFIiLXV+X3RrIiAm2ZWw3gaXrpgGXGZ0BMmu2QHjTHJfx6g8GFL+XNFczrnMeMQlDZ+E
         teubzc4eUzcU26cwt4XPo75NGxdZ5PXX/ID+h+iv9mXt8PA2XIBiL3TxDlOzE1nqWnjo
         5D1eZbkBJKwpwep9tCZEGCIefLCKCmOETbE23aPuC8qpMiKDoZr+VhrNnZRrtmnxDHSH
         7ijwP0Zla/F1WxMl4KXYksd9cJeEsOvNfmxy3cmR0ok4fmYsaYZTPgciEC03F2XYmazv
         Qoig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744620749; x=1745225549;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RK1FjQCAv98Eay4SPuOitMP3sY6he/myS3klmD5dY54=;
        b=UZ0a60jdoRjP104cvqr1fYY+Zh4VJAEGCB2PgjqXmJzdAZKGBhfjPS6RM8ZsFUJ5cp
         utyeaWrm/XJrakW8eKNKsxk2KSeMGUMgr1ApsWNV/4ln9+po7y0L9vm9JH0hADg+fjm+
         /qH/ip2xtC5s7UQ3rRnbYwRCZ3v6OYwEQPTmNg53ePjFGWiDB6jlU2ZzJqa2RgY+G57X
         1nfgvJUaEh9+Z4O5rzwhNrnXP4TzS1XRC8BTKNdfDxGsR1cV6OE521bjtbjn1jSLpKq3
         shQQSA3+KGZ0gQjFDUhffQfKMUBOFcVapS6uqMGMZ8VDwBdbtjQb9tOiNjM8S8I2wGBM
         WnJw==
X-Forwarded-Encrypted: i=1; AJvYcCViPkdkEpqHoQRQhU1ru8YG0UHobQYTDrwIzS3x7wYv4FbBjprD0TZlKMehzxKRyhJ/+5Nkmv5y@vger.kernel.org, AJvYcCWGqQ7bWB965qkivPnNMl1hJQc4wTCEdHt8JQtv2U3JtjEGLtGJRyKetjZ8uxauogV1GuuLZxA6dFyg85L1@vger.kernel.org, AJvYcCXAC1ssdgWYd6UpdG3eAfiVcz/q7aJfB/3C2nx3BErNcIhGZpbUwGLPP8fv8didMrxl6Nxo9vlJ+OHa@vger.kernel.org, AJvYcCXkUgiZn4aU0KdtWRP1scEEjpkhNLMOy4VtQlJWeZta9mabVlRtJS543si52LvY1kGNVl7Lg2I9vdGJScWlCJLgyKs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOnGsHLfZLig6LCa0xDjKJMHtqj0bRtCF1quwzsv/H93cc0Mfc
	xt7/yU6LzHMyrLBxMmTFl/Ame81zTL/BhXqjpowr2cKtTq5ca7Ha9rb2/a83lsSmijoCmH6nU5I
	BrG8Q00cG5JmJQ9X6MzONdlEQL8o=
X-Gm-Gg: ASbGnctjPh6TC4Xiu4WOWvudlsaUOgm8yaKYroliU9MNnDXPuIoRLxs8yor3qeHGdka
	pzB4NT50QksGBWevm/gSOA5pp6exVQV8JbRQvS4kKSl9n7Ca5iyjMoetHlyBoXGFZoY2vUbQyC5
	fMjUaUhc1Apoy4jaWfsQAxtA==
X-Google-Smtp-Source: AGHT+IHDQYAJXdFj/iNG0npq557KpIZpBxXkLL2l+9hPwfBOs75fehWJLdCe6um+3vhYJFwWD4BbKD7nZni0VXc/gQE=
X-Received: by 2002:a05:6122:319d:b0:527:67da:74ee with SMTP id
 71dfb90a1353d-527c34d1fd1mr7094050e0c.5.1744620749318; Mon, 14 Apr 2025
 01:52:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407120317.127056-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250407104447.072449cd@kernel.org>
In-Reply-To: <20250407104447.072449cd@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 14 Apr 2025 09:52:03 +0100
X-Gm-Features: ATxdqUEHxcklYN6PVPbrfMER-iWYYX-JiIMzDYloXSJi2mPCrezqGIzibq2L6CY
Message-ID: <CA+V-a8uqkG+u_ZXztPe7R0BNV6BA46KgGRHRW-G3axBt566pEQ@mail.gmail.com>
Subject: Re: [PATCH net-next v5 0/3] Add GBETH glue layer driver for Renesas
 RZ/V2H(P) SoC
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Richard Cochran <richardcochran@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jakub,

On Mon, Apr 7, 2025 at 6:44=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wro=
te:
>
> On Mon,  7 Apr 2025 13:03:14 +0100 Prabhakar wrote:
> > This patch series adds support for the GBETH (Gigabit Ethernet) glue la=
yer
> > driver for the Renesas RZ/V2H(P) SoC. The GBETH IP is integrated with
> > the Synopsys DesignWare MAC (version 5.20). The changes include updatin=
g
> > the device tree bindings, documenting the GBETH bindings, and adding th=
e
> > DWMAC glue layer for the Renesas GBETH.
>
> This was posted prior to the "net-next is OPEN" announcement:
> https://lore.kernel.org/all/20250407055403.7a8f40df@kernel.org/
>
> In the interest of fairness towards those who correctly wait
> for the tree to be open I will ask you to repost this again,
> in a couple of days.
>
Are you ok for me to now respin this series?

Cheers,
Prabhakar

