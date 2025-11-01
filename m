Return-Path: <linux-renesas-soc+bounces-23982-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D161C278FA
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 01 Nov 2025 08:20:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A99E31A23359
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  1 Nov 2025 07:21:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A06A28DF2D;
	Sat,  1 Nov 2025 07:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nigauri-org.20230601.gappssmtp.com header.i=@nigauri-org.20230601.gappssmtp.com header.b="tcezc+ZH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ECBF21FF35
	for <linux-renesas-soc@vger.kernel.org>; Sat,  1 Nov 2025 07:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761981652; cv=none; b=eT4jM/zlgWCeZZRmcVB87HmazhevZZINwRBhLr7qYSBnW0BHWD26nVOKWwgC+o7ofX+OzQzdmlUukf47y4zjzuqGk55d5FSDKpAVHxWAh7k/hODEUFsBstfI98vn/O5hqDBbBcpQ48KYIbScbDM36f6xJwkSj6UZtaDK67MkSEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761981652; c=relaxed/simple;
	bh=kilYbLdYIaf2hSrE+nJ6zDswVrvJpNLoQ2tFF31pBDw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IpxgYvLajGxTLQG7qOus38O04Pzs8WihgbjF+jM/sW8xExP3lhuAbtA4NahCcNuSvLeIXP8t7hwl2rdAocr4/lx/QAVZmZDCzqF93TQ8X1PMBjTIPfe4fpClc5YWppmJ0CWbQwDuP9Hvo4cvIyA79BdNGgEuhBfTxWWzNGCpT54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nigauri.org; spf=none smtp.mailfrom=nigauri.org; dkim=pass (2048-bit key) header.d=nigauri-org.20230601.gappssmtp.com header.i=@nigauri-org.20230601.gappssmtp.com header.b=tcezc+ZH; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nigauri.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=nigauri.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b403bb7843eso634524466b.3
        for <linux-renesas-soc@vger.kernel.org>; Sat, 01 Nov 2025 00:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nigauri-org.20230601.gappssmtp.com; s=20230601; t=1761981648; x=1762586448; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rtq1UTr0UPwwqORfG0FbJYYqFuloO33lCM+eu5gqKMo=;
        b=tcezc+ZHA89LiM85/IV21TERbkRRxR9rxUGPuPPt00F/EYILrAmHACNHopdHW3Ytiy
         cEHETRdWUqw2bLrZnANcgvtbfe36uJJUd60tx1Sd1l+KjmopCaFglxjc0WLuWxjXbfzS
         6RlOj16HXaTYsj+VYmaUGJTbp+KfFENW6CtZYgzqYH7Ma9GVIYJvTPfJrFWiH0zWaRUA
         yOb2uAIR7dAYON25eDJhfOJNrf7mHpCzEqCAhKHJs4myupZ1gbmNPznfHtBducKmXHJB
         XuxWQKKEFKE1dvoDFTb324g/Bxzd7EHFQjAuEfxVBxF+WQnjmmVqdU9guFuBFvYsxxnN
         ZWZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761981648; x=1762586448;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rtq1UTr0UPwwqORfG0FbJYYqFuloO33lCM+eu5gqKMo=;
        b=JNlJRNHytWF0tTdFWqda/BnfrR58u82A9NmSk8zIPvyoUEZmb5dylEI6owu/4ShWIR
         A0sBsc9oVyfIXu5db8y8myd0Syp82PrFrnvGax1OB9UCFsnXgUN80a0DwN6H9J2hkynB
         PFq76m1vQbIaU+ERRqofTPhIBQ8ibpAHcynlP7Wrj0F9Z+bLXYZy7DmCQ4gKCbuFOdxK
         XtriEGdNAHCVi9W03qacdubjV4PMPYVeoEwNbD7Owkpk+7Y6zWQf5KRrv/F/jGptJU5F
         eLpBHHqOR8i/vtb1D+afUL+fWLlpuYqxZ8RtrBItNcxxccmBLHjTAAtQEfM0jFoUrbzT
         gXtg==
X-Forwarded-Encrypted: i=1; AJvYcCVXZSrq3CZJalPfPC7fzviXJ4bD9URjZuBd1kV91HLWzSpHEcDv8MCD2HQ4gFN343Git5hZPPyxQxpbIrDxAxYb4w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxnet1pl0PV0jiJ8CZahG4Szdsy/9m/12VEcjFOsxkwbr96QDpO
	ZcGP0oLsS2N7XkapbZcMhHo76OKVxG9NVRaMjYl/D0L4Jk7/nTzovYB7rsAfwm1VEdyeFrnM2md
	v1hw1HwXcmTpTSCbpi76AgV4vg23/AcKIviKaQVo=
X-Gm-Gg: ASbGnctOzywe+V0MxVmku+CAShgsc7Yg3mmBUFzO5nIWtLawlz8NuiLE7hYRKdFMOYZ
	dgcs+R+akQ3ff+UOMYvXUQr1Fp1YFXF9KXO25fYnp47lbRVC6o/7Ix543P+sjIlzr7U+YcYNoNx
	q5C3rzbNAwJ6WluxbOc34UWqDoHKCFtey6EGyAIYnZCj5w1Vz0e6Fol1xG+bykuNXXI0oppL5l6
	t8I56dVALsypm3HPjBYvT6H1B/ZofGdcmgSoKg4NYvACY6FuuJK5W8le+pA+c89ED4=
X-Google-Smtp-Source: AGHT+IG5Tddyj7k9AhnVLje/7zK0LWAl7G7xkeGFkbQxk258uIYlLJR59L9wOrzUthuN7A7v9giWi00jdfqWUlBjacQ=
X-Received: by 2002:a17:907:2d90:b0:b47:de64:df34 with SMTP id
 a640c23a62f3a-b707062c89dmr569820966b.51.1761981648222; Sat, 01 Nov 2025
 00:20:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251010-kakip_eth0-v1-1-0d8fdcbceb9a@ideasonboard.com>
 <CAMuHMdWZD1m6t8MnYTA83RV=h9G9o6M3KSZjO32rRjOpz6px+w@mail.gmail.com>
 <bcdc9a86-bda1-4646-9ccc-1dc00a710b44@ideasonboard.com> <CAMuHMdUDuuXncX4sbd6oa+8KcS8x+1Sp-ahmvyh8fRdQt1GqKA@mail.gmail.com>
 <8b984f13-0498-4cc6-a64e-e2b6b147c346@ideasonboard.com> <CABMQnV+z=8-ORRGTjxM=6iP+6+qbJa-N_C0csi8K53wpFwLp_A@mail.gmail.com>
 <CABMQnVJu-rVHSYcSU271sVeVvuHN=+h8YOAMkDXW--MWfxguuA@mail.gmail.com> <9a9b2fc0-81ca-445c-981c-104d7ed9043c@ideasonboard.com>
In-Reply-To: <9a9b2fc0-81ca-445c-981c-104d7ed9043c@ideasonboard.com>
From: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Date: Sat, 1 Nov 2025 16:20:22 +0900
X-Gm-Features: AWmQ_blXKl9v9g-u7dHQXbQk_jl6qulvN0hVjTOAUEA7mOWLjjpL9cvLYAqeMf4
Message-ID: <CABMQnV+bR1bteABAWOS_tYd3LZqg190tE-=_kqzZYe95fTQttg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r9a09g057h48-kakip: Enable eth0
To: Dan Scally <dan.scally@ideasonboard.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dan,

2025=E5=B9=B410=E6=9C=8828=E6=97=A5(=E7=81=AB) 19:56 Dan Scally <dan.scally=
@ideasonboard.com>:
>
> Good morning Nobuhiro - thanks for your comments
>
> On 26/10/2025 03:54, Nobuhiro Iwamatsu wrote:
> > Hi all,
> >
> > 2025=E5=B9=B410=E6=9C=8826=E6=97=A5(=E6=97=A5) 10:06 Nobuhiro Iwamatsu =
<iwamatsu@nigauri.org>:
> >
> >
> >>>
> >>> Indeed, I couldn't find it anywhere either so resorted to phytool.
> >>>
> >>>>
> >>>> Which PHY is actually mounted on the board you have?
> >>>> Can you inspect it visually?
> >>>
> >>> It says LAN8830, plus a couple of other strings.
> >>>
> >>
> >> Yes, this board has a LAN9930 chip.
>
> Sorry; is that a typo? Should that be LAN8830?

Sorry, it is typo, LAN8830 is correct.

>
> >> Since this chip's PHY_ID is 0x22165X, I believe the PHY driver needs
> >> to be modified.
> >
> > I have confirmed that this IC is supported by micrel.c, not microchip.c=
.
>
> Excuse my ignorance; I have no experience with phys really. The driver th=
at claims the phy is indeed
> micrel.c, and with the phy id set to 0x00221652 it's picked up as "Microc=
hip LAN8841 Gigabit PHY".
> When I take a look at that the PHY_ID_LAN8841 (0x00551650) and MICREL_PHY=
_ID_MASK (0x00fffff0) seem
> like they're appropriate already. What needs to be modified?
>

Sorry for not explaining well.
We need to update compatible from ethernet-phy-id0022.1640 to
ethernet-phy-id0022.1650".
Because this chip's ID is 0055165X.

--- a/arch/arm64/boot/dts/renesas/r9a09g057h48-kakip.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g057h48-kakip.dts
@@ -70,7 +70,7 @@ &eth0 {

 &mdio0 {
        phy3: ethernet-phy@3 {
-               compatible =3D "ethernet-phy-id0022.1640",
"ethernet-phy-ieee802.3-c22";
+               compatible =3D "ethernet-phy-id0022.1650",
"ethernet-phy-ieee802.3-c22";
                reg =3D <3>;
                rxc-skew-psec =3D <0>;
                txc-skew-psec =3D <0>;

Best regards,
  Nobuhiro





--
Nobuhiro Iwamatsu
   iwamatsu at {nigauri.org / debian.org / kernel.org}
   GPG ID: 32247FBB40AD1FA6

