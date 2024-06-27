Return-Path: <linux-renesas-soc+bounces-6828-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA26A91A65C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Jun 2024 14:14:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1E6D91C20B03
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Jun 2024 12:14:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1BDE152190;
	Thu, 27 Jun 2024 12:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hyCxr++t"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 360AF14882B;
	Thu, 27 Jun 2024 12:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719490462; cv=none; b=qBC6USfK6hjWFLVC4ffOugA5vckFRPLNgKguyrv4v+n3YTHoHtPC4imN1ZUYMjqu/BYZb90mkZEtSa5NDqgBLqrvBPZYy5ZRktF3PHLnTmRJn2iVpUptPolvICwTmU+HgxRj4XjcIavUR83bg23W+l9l0PR5f3Yf3dMvLt/WYq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719490462; c=relaxed/simple;
	bh=Ccp42sBsP4wCUNkJ4fWtYGD6GJRKFZhy9CNgXpdHHRw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BnbQR4Z6XPrD3aceG7lB6hcv/2s/Fu2/VmMJY/TPY07b/9fqS/3zSr/2LpF9zvys/glI7iNLLqoO+QFBteWStHhSZOYM1+BZdG8lIfIKc07futXTCQ26QBBHJvOjPTfWymh1E70akFQE/+Ztfq2P5/PHReMePuhUvZAtEs5U6Jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hyCxr++t; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-48f36f57a5aso2219447137.0;
        Thu, 27 Jun 2024 05:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719490460; x=1720095260; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kA9Nu3yXPSlmkCAGisPs/HJNxhPzCxuyX/fh1JKdHi4=;
        b=hyCxr++tjiW3SD4YftMM8/IkeinO9anpmK06x2UBdj+TT4R7psW5iCgfAVfeKpfp2x
         zWfLkvkLcSH2OEqcJ9aJWsA/AZjyOyDcPV7iDucdM7S0vezfhKsZxdpjKsu3IuNyR47Y
         IP+4we30pKeibiz7lxcbspQ1HBbpCye+/1VBb8wc9CG1C2uovKJj40soqlhQ9cHYoOGU
         oFkH5uBjFPfeuEgIMCdIdKEyUXFyiooeWUP7S6+DR01Ogi7JHu8Q0tKUeKDX2Mku/HPC
         R50dgKG4GyGKDXfb45r184bQVfvCXEaJglzOKTrOi+JcZHyHZ+B+iyyCAUiMgj5WkxIF
         6ZAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719490460; x=1720095260;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kA9Nu3yXPSlmkCAGisPs/HJNxhPzCxuyX/fh1JKdHi4=;
        b=PuBFQBxiKMZNI1RI0H889UX3OwkuQ6d/O7BEdlv0CfAB96TyNNA5vn8IsS9pOmfbIK
         BdEcKab0yXBzjLNYCox4rmyMX3KTewKg7IC/hVA1aF9TZGiXjO5ME0tJKMotZ3TCTRpl
         0R21yaK2AqyJsfIuBbQ7WoJGQBgFHjwzeyTEaVF1G4ugIcEqR5i36hwBXo2XLxj5IytW
         TLF6upnz7t+lKNsyalR83LNA3JQSQNIrXNzP5nINhgxYIduBJfMvVyFK3HUbb04Xxfgl
         K+EIVDx2Lv9Nwq5moomoFQ24vnf+T4aAbCwEyt/9z3tL+Xn7C6JqYLu0G0Mni5QefAjW
         quwA==
X-Forwarded-Encrypted: i=1; AJvYcCVNMO28ug56mbYuAXoYOAsKNkzmcdNHMdREzu3ssFtDMxix62CQ1KcQFR75FKMGR1piWEKgbSTes9K7hMH6aDeWBvBIakR8vcFDcymfqFyNWOUUduK1P4vKHpdh4JbCw9dRo4WdV0IG3rdLV7QP
X-Gm-Message-State: AOJu0Yw6EJGMwm8sYcow49Cs5KhDH4cyAE3YEnM8Kxd3BXHbCnTqwL0+
	XGsV88FGMhTIyhTzaMpEU+9ZmM7LHvn0AMQKrftVbJ0mKfk1eyiYHgjYKVpzandq8JKHHUtyYWM
	IqoSI2czxpShxZuxeuSzs2CX5pos=
X-Google-Smtp-Source: AGHT+IHWEG9Ye7gFXJn9i1hqnyKYevBrUPIayLdV/SS2G7pss/nL74+LAxYYXPCD42hu0zyUD6zXy7xdm/szj7GtFb0=
X-Received: by 2002:a05:6122:45a9:b0:4ef:530b:9d56 with SMTP id
 71dfb90a1353d-4ef6d80805emr13123566e0c.6.1719490459837; Thu, 27 Jun 2024
 05:14:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1718890849.git.geert+renesas@glider.be> <15cc7a7522b1658327a2bd0c4990d0131bbcb4d7.1718890849.git.geert+renesas@glider.be>
In-Reply-To: <15cc7a7522b1658327a2bd0c4990d0131bbcb4d7.1718890849.git.geert+renesas@glider.be>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 27 Jun 2024 13:13:52 +0100
Message-ID: <CA+V-a8tAP9H7bLvuNL9NOLg=qFRxBnzq=dRDz0Waho6Vh8bWEA@mail.gmail.com>
Subject: Re: [PATCH 4/9] arm64: dts: renesas: r9a07g043u: Add missing
 hypervisor virtual timer IRQ
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, Mark Rutland <mark.rutland@arm.com>, 
	Marc Zyngier <maz@kernel.org>, linux-renesas-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 20, 2024 at 3:03=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> Add the missing fifth interrupt to the device node that represents the
> ARM architected timer.  While at it, add an interrupt-names property for
> clarity,
>
> Fixes: cf40c9689e5109bf ("arm64: dts: renesas: Add initial DTSI for RZ/G2=
UL SoC")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  arch/arm64/boot/dts/renesas/r9a07g043u.dtsi | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>

Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/arch/arm64/boot/dts/renesas/r9a07g043u.dtsi b/arch/arm64/boo=
t/dts/renesas/r9a07g043u.dtsi
> index 165bfcfef3bcc69c..18ef297db9336362 100644
> --- a/arch/arm64/boot/dts/renesas/r9a07g043u.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a07g043u.dtsi
> @@ -50,7 +50,10 @@ timer {
>                 interrupts-extended =3D <&gic GIC_PPI 13 IRQ_TYPE_LEVEL_L=
OW>,
>                                       <&gic GIC_PPI 14 IRQ_TYPE_LEVEL_LOW=
>,
>                                       <&gic GIC_PPI 11 IRQ_TYPE_LEVEL_LOW=
>,
> -                                     <&gic GIC_PPI 10 IRQ_TYPE_LEVEL_LOW=
>;
> +                                     <&gic GIC_PPI 10 IRQ_TYPE_LEVEL_LOW=
>,
> +                                     <&gic GIC_PPI 12 IRQ_TYPE_LEVEL_LOW=
>;
> +               interrupt-names =3D "sec-phys", "phys", "virt", "hyp-phys=
",
> +                                 "hyp-virt";
>         };
>  };
>
> --
> 2.34.1
>
>

