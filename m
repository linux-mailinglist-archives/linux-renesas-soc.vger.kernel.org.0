Return-Path: <linux-renesas-soc+bounces-13911-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D31CA4C5E2
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Mar 2025 16:58:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 86BC016D928
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Mar 2025 15:58:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6939E214A71;
	Mon,  3 Mar 2025 15:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SGyu2w57"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF5B73C00;
	Mon,  3 Mar 2025 15:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741017511; cv=none; b=G/Gt5vHsh5rqFd/gnQAQzYoaogbg4UhaGge9piqB/YNuDW10HefawvlhqrHwffVJyudqM6Y1pZnZEzBieqqOKLxqOmdisDjp4qKTt7u3jM4zhDoGwYPuS1OOiXwco8FbpUFpKkGzfBO2GR3cH2+QEm/9KgYxlI0HBNDtMic1rb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741017511; c=relaxed/simple;
	bh=dcvZl8D+/ZSKXEMSWxVFM9RcCCcopUHDnFLS4WubIdc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CG0YJFBo5KnJQTYbt1m1OCN/LIk9MGQ/n5ccTVREj1LH5XcR9oTsT16ALOF6ZyI6RgSS/MFXzoLvbaKEtlo6KPThm7IUWqXcvrCYqV8c73wdYBZNo4uXOBogqB3HNO+74BpQ6D32dj46FLZ55vzELL1rGWQ58QNSQYIDgw2Mdsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SGyu2w57; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-520a7bdb901so1955859e0c.0;
        Mon, 03 Mar 2025 07:58:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741017508; x=1741622308; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=20CSEVsOsoWbrKdQvrJ9t0ssYFchlpZ8awFkCe5Gwfc=;
        b=SGyu2w57oy5FmWfpmWQBZ3Prm6W/T2bbEzpfvwLlyORTsaivRHwSTXNsoDpw5gnKOc
         4LiIkg1uos1GlxmuF7qygSFcWdaGV7NiGRuEz4kkiYhOau7YfLIKtEYTd/fKblH8eD/t
         SZPtDsfBuQ+26aVM/2d6G5CVlIrditNtOsyp38vLAoYG1/eOsGMiJBGOxzg5elfi1JZU
         rSf5iUe79FmDSkE0+hj2d+rcUe1/AGMGVQCmKqEd5oNAjlUmD6nFWLMo+FrK7T5gwLu7
         rIhCZskP79cXxmN8+n8UpfXc9aoBTO7Z11d5Ce57QeF6BqQL019m/BIOhBToIF6Q03UC
         npeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741017508; x=1741622308;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=20CSEVsOsoWbrKdQvrJ9t0ssYFchlpZ8awFkCe5Gwfc=;
        b=nPHEBpfMtmKCqFnRVr8g7k6oRXyarJnw1EvbXJHClpMHvoRBu+pmG6I46ub632jgyV
         XxnCLCP+0Ttmi50S+tjluBUYK2+MaeTqn/v2lwl4di+f2QkUa/E7yEji6nPtfWiL2yWC
         FXE77MSuBQjAO+zPG96uznwGm7QoI3KEIOhdWsO7+JW6Lll/7KpEAhVTZMi4ofCjUZpq
         nLWZXCJES6270cA+dl5Vu+Eb/axLwU6XRQzWKcqtCkFy0Tp/RCIWy8CeH3hH51F3Gwmu
         sVvR/NZy/sDxbAtjlhrmkTM/J8rIdcY+FO5Aj4J/bWStJzNZ7G53RRpwS/uY7xdXMQaM
         OaFw==
X-Forwarded-Encrypted: i=1; AJvYcCUDuL7Cp/VpB/YWJN8L81G1XUjjaxYQ5jvIEpqBKIPK00FdgdZ/iKCfGX7/q87ogZKH/Ln8ZieSe/fr@vger.kernel.org, AJvYcCUqeYUw+hcFkkipbWunmG6cBcL/xWAH6ohI4s+nmMoUtLbzfa8auQmwpziLxw0VgxIdwBIUqEgQ@vger.kernel.org, AJvYcCWJlacFWsZg8xXRkOcN5B19UnRCpUANoshOGjpcnFgAyLeNEKq8Ec1FwEd2UA5RfOANFU9S30TW98QxL339cQda/As=@vger.kernel.org, AJvYcCWULLnyD780VRvorib6nXsq2GgKQFCPVd1Lk6YeRqNsJx48MGueHPLPLC6CdXIYnptJX7tVwprEFgE+pYif@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0ZMa5CPISWacb4YS39WdNCZRCazEHEH8ro5Q5yrpJgHd8aykE
	j7WT2fFjhEBU7cEiO2H/g8nnGtEL++zJ8wkb7aojBIRy/tSNMIRbedByuCGymyaqIx9INcqjfpy
	CyCJ9G6ZJpkFljfP6J/Ns7KnoGORfzVcA/NE=
X-Gm-Gg: ASbGncsk+1J2cl25hGaLLGFkCF3Aba2CziXlTO1IXmnFQ4heiLZiFTgXu4bGTh6BMl9
	zgDvKgu3xZbr1Q5p5OzCCb1KTWJmWmUQimabgCtfmvobfUVIDDzENeTVhHU+yHR6bQ94jx7WcU9
	9WAGNp2mWbaaruUFxSvIfUsK8kIBQVpDm4r8c6Z3vBKsWu59ybxG4O5qs6Cg==
X-Google-Smtp-Source: AGHT+IGf8mOuyk+yJX8WQ3uBBifLVC0NC0DlQpg3TejRFtkWs//y7lwRv/N/QPDyUQQ9CUkzN9EVbnwVC9X4VC+ObF8=
X-Received: by 2002:a05:6122:2788:b0:520:60c2:3f1 with SMTP id
 71dfb90a1353d-5235a921377mr7533183e0c.0.1741017508458; Mon, 03 Mar 2025
 07:58:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250302181808.728734-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250302181808.728734-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250303152628.GA1873145-robh@kernel.org>
In-Reply-To: <20250303152628.GA1873145-robh@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 3 Mar 2025 15:58:02 +0000
X-Gm-Features: AQ5f1JpmCBY848cgT_1ecbvsoHfbS3xC710nAzbWM7vESPxSnajffbfXbBeCIyI
Message-ID: <CA+V-a8ukVgx7OqDTP6EharPJxUnVw5wAohveJw+VCABvz7FSRA@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: net: dwmac: Increase 'maxItems' for
 'interrupts' and 'interrupt-names'
To: Rob Herring <robh@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rob,

Thank you for the review.

On Mon, Mar 3, 2025 at 3:26=E2=80=AFPM Rob Herring <robh@kernel.org> wrote:
>
> On Sun, Mar 02, 2025 at 06:18:06PM +0000, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Increase the `maxItems` value for the `interrupts` and `interrupt-names=
`
> > properties to accommodate the Renesas RZ/V2H(P) SoC, which features the
> > `snps,dwmac-5.20` IP with 11 interrupts.
> >
> > Also add `additionalItems: true` to allow specifying extra interrupts
> > beyond the predefined ones. Update the `interrupt-names` property to
> > allow specifying extra `interrupt-names`.
> >
> > Also refactor the optional `interrupt-names` property by consolidating
> > repeated enums into a single enum list.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >  Documentation/devicetree/bindings/net/snps,dwmac.yaml | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Do=
cumentation/devicetree/bindings/net/snps,dwmac.yaml
> > index 91e75eb3f329..85d499bd49b5 100644
> > --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > @@ -110,6 +110,8 @@ properties:
> >
> >    interrupts:
> >      minItems: 1
> > +    maxItems: 11
> > +    additionalItems: true
>
> This just increased the number if interrupts for anyone that allowed 4
> interrupts. Rockchip and Intel are 2 though it is not clear if they
> support more than 1. So maybe not a new problem, but you are making it
> worse. Any of the ones in the 'select' in this file are affected as
> well.
>
How do you want me to handle this case:
1] Update vendors binding
2] Duplicate snps,dwmac.yaml in vendors binding.

Cheers,
Prabhakar

