Return-Path: <linux-renesas-soc+bounces-5834-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1918FBA64
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Jun 2024 19:29:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 31FD81F26D1D
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Jun 2024 17:29:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ADB81494D0;
	Tue,  4 Jun 2024 17:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FkYd3YCY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ABFF13DDAA;
	Tue,  4 Jun 2024 17:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717522193; cv=none; b=sEAXzC4XlswA8KwaVCbTqtEpo/n2DQLqj3yipd7WS+4N7ZThVzF4BvRBhZvonTSLirAPnta6/xz1o/lwVD+RSLAGx9/w0ZXWlr3vPOv2cNeZ4RhxFaiFsmHm1GM+7Ti3WEA9V0fSrMBWcDjm5PPTNyjfdR2wBO/dZ+NAw0cybEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717522193; c=relaxed/simple;
	bh=U3D7TqCSnsa5JXrna72XpItN3YcmUJ4w/u1Mgfh8zz0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nfr8KvwTMTftfr4fDFk5J1B6GJ4oc7qDwRO6F5vCxXYhcTQayeBZSiUM5M8DIsv7CPi2/XdGgtM2SRU9AfdVrOqfCQ0xjcFL2wd3ue2fCy430U13PNlMRQhikP0+SXkrQKJwLKUbdltCdiDgFam4SG9GBJ1KHfIGRgcobZqAdyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FkYd3YCY; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-4e8a6159479so2216628e0c.3;
        Tue, 04 Jun 2024 10:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717522191; x=1718126991; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dhf7xqZrwkLw5NUZb8BD/WUh5IZMoEG6/RhzoUC0vpk=;
        b=FkYd3YCYrSZ6NMJhBKA2udv6YlHv2kD52v/P3XqyU5CYYDafEGu1piniIw7RotiM/R
         JvdeeVcUh42GSivL4gZSZ7gIaFH14ltsbma7YDbVvA0w0Qm9rxO7G+l5Ldy7ySAZUhyc
         6+a+QuZpKj6TqSQO+PyEaaeprtbneMYeSN8D/Dec8RweC8yaJM6UbekmSApOQZHybAsM
         KW1SWzfxdesFz+ziHp/3BxgGkqHjrmOSutW3cJMxhyYukNaX3Ilxo5V4EbteB1rPAIoR
         emEc/G5cSqHxJ5cYu6lcyUFMGPY9iM51G5jKc47tSJ0szjFs3q5gOmQ3lvdjKVtF6HXb
         iEsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717522191; x=1718126991;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dhf7xqZrwkLw5NUZb8BD/WUh5IZMoEG6/RhzoUC0vpk=;
        b=LGrtSxOnCcI7lO+DCVXa8fe1Yl3OjqrFu7RFDq/MXB5MIID1dl3k/5zkwNdtXJZ6Gb
         3D3/zNhXy9kXclyT4nr32HwiHkZQkZR7PTtQtYIgU4Vc3h0cWmv7ad+2pvpsQGmhv0IT
         lDAO/1zl+0egrmCPa53ci75x1Pp/6gssW2lCY0jn2SIt2HgB24VaUsbNZ0Kgo0kx8Fxm
         5CN9r1u9Q9b8qGHv54IctS5H1hvRttFLk6u4GhjJI3fWOEzZL7YxjJG0PV6hGxjOoGQ3
         rf8VPq+MfczbaAx2f/anUHG5vfq4xncTMeFNcGWF2pmNqcyMweVtwXDpLVWX/MUCtTSr
         v/ng==
X-Forwarded-Encrypted: i=1; AJvYcCW8VFr+UH1EmeUokbnhtt+qUn4PRlzeZRbhF3nymT2EsaDZbGaxDospRXZUtGRvCIOVzwV0lhekSxtaUPBKqecOMl4KPD9j4RYZG+w8ziriZ43R6MzlYxELTDMklCbbyu2Lu4Xo1h16TpQeRADivfXVlO5HAwlIPd7ydUQpyWlNPQSwKvWoFdm2OZWs
X-Gm-Message-State: AOJu0Yy8ul/3gEY93LxHOKCR9lmLLlK+mvmgXolLTFt2cKt07yLpcBVZ
	3epZc/HMXhsBfQ1R8mIixUmT+5HhhxNsYaBo+sieI0Vr8A3f+pzHllYuu7MLZaT0ur3lY7Hwf72
	8OJV3ho0ITHuO3Q5GLMhguWUE2v8P3Oft
X-Google-Smtp-Source: AGHT+IE97PdXD1tU05yz0fHu5J1CZj2oecJ+xOhY73xdSkqztzvirzgDTOnF8sooW81mzCAuhReaafog07Zach5f330=
X-Received: by 2002:a05:6122:723:b0:4eb:1b53:47a8 with SMTP id
 71dfb90a1353d-4eb3a4c7b0emr278924e0c.15.1717522190880; Tue, 04 Jun 2024
 10:29:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240430141438.132838-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240430141438.132838-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <87bk4i6vyx.ffs@tglx>
In-Reply-To: <87bk4i6vyx.ffs@tglx>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 4 Jun 2024 18:29:24 +0100
Message-ID: <CA+V-a8tDYjEmuZVoBk+gv-XCneEchiS91J15p8p96aKFRbo8DQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] irqchip/renesas-rzg2l: Add support for RZ/Five SoC
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

Thank you for the review.

On Mon, Jun 3, 2024 at 1:40=E2=80=AFPM Thomas Gleixner <tglx@linutronix.de>=
 wrote:
>
> On Tue, Apr 30 2024 at 15:14, Prabhakar wrote:
> > +
> > +static void rzfive_irqc_irq_disable(struct irq_data *d)
> > +{
> > +     rzfive_tint_irq_endisable(d, false);
> > +     irq_chip_disable_parent(d);
> > +}
> > +
> > +static void rzfive_irqc_irq_enable(struct irq_data *d)
> > +{
> > +     rzfive_tint_irq_endisable(d, true);
> > +     irq_chip_enable_parent(d);
> > +}
>
> This looks wrong. Enable/disable should be symmetric vs. ordering, no?
>
Agreed, I will reverse the order in the disable callback and send a new ver=
sion.

Cheers,
Prabhakar

