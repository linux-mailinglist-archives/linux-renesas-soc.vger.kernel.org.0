Return-Path: <linux-renesas-soc+bounces-7022-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 644F9925552
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Jul 2024 10:24:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1FE9D285665
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Jul 2024 08:24:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 627D313699F;
	Wed,  3 Jul 2024 08:24:45 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A7613666D;
	Wed,  3 Jul 2024 08:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719995085; cv=none; b=iW1q+TFJSq9TyjI/sCkB7Pf78iPl53pXk/EUzNCO3+BUfLfYWKWrj7fUfdX5KbJ8znZAWU9U0JiHumE4IkBuATnqWzwzguuJOsgwnAlTsKLDRAVDAKxX9YAU8FBV5677AYHWJAxLZ5LZLh/5A50BTx8dw9Admd1XpIA9K0Z0x3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719995085; c=relaxed/simple;
	bh=wOJLpOFO7Q96uSx06Rr/Kkt5lhJ+pr8zcr3vCUu53Cg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UJKBBWg8fPtF9VK7X3YUm9AU0kqQzmf32tWjvO+6bC+Ex6JvN11eFzjtcoGzMlpowXYPWMEj1nfPDT6Cd0YaXwC7XDsa2yr4Qjad4Bhq16NQ4jIcjzPk54pS8zo22N2iWBOMNJ3AZ8ooD+MtIbaRghyR74D/uBTl5uhHB+2NVPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-dff17fd97b3so5221044276.2;
        Wed, 03 Jul 2024 01:24:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719995080; x=1720599880;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RcGb58PPpWL7B266ofJCciLtYTWYOedPP0lxxfPOm/4=;
        b=K1MSkBMTwwObhgmW5VHQOZq4fRraNSnb/jjRweexde0CYnWvIKbuusP/okZLvO45yI
         BgfDf7Ag2dWW5xNpTxf2VjhpCtt+XUOgSpWo5O/80F16QA51Ecynv21um9+VKWBg/JV0
         0A0Cm+qBooCE0DBYtXd0nwvutbGYoUAkNcdk8cw1riuN+kMyWXsh+eB9QSK+/61t8xGD
         y9Z1VbX6t4Syd+2LTZHxXqP7IwEg82QUcq+KzPL4Wzpr3Bu8jidFkxczBb2aH7tbPDHz
         lI5TyZVbJtrfYlGv/HMPnA5t9M99ZJYJScATt1g3RB4AFYP+OD7PDqTj1Wv3It5aCbhY
         1vyg==
X-Forwarded-Encrypted: i=1; AJvYcCXJLaCjvKDnr2+JXTVcefzkIi1nlyXBXfwRPLE8Ywu8qA8VDihe4N3+bq5U1mHx1xE/E07UcdBbkvpBrTOZULIkC38jvZVZzpIUp4mF9lee/yqNP4ywHQuhDU38aoE+xmrnCfnJFOpkZWVDKwTF
X-Gm-Message-State: AOJu0Yxvr4cQqvnfu0aHxtkXix6+OTgN1o2SoROHpDdg4NNeDEMwOosp
	CuJZr6h4fiM9qj9wqw+P3ZCh0G9nFxEwga0xaCMWHkHa+Osw1EJ4uT2ynAW9
X-Google-Smtp-Source: AGHT+IF42FGryyoJB1FAlAZ5gHCHr1IKDFizBslZUWNyYez02MH0A3l35r7hyCwVFlVIqXTONfHexQ==
X-Received: by 2002:a5b:44e:0:b0:e03:46ae:f277 with SMTP id 3f1490d57ef6-e036eaf3ef8mr13190677276.3.1719995080035;
        Wed, 03 Jul 2024 01:24:40 -0700 (PDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e03b3ea5dddsm14489276.18.2024.07.03.01.24.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jul 2024 01:24:39 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-64b9f11b92aso43474337b3.1;
        Wed, 03 Jul 2024 01:24:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXWyb8JZOuyWQWckxRD3rGZh1CrnHQQRPgDRMvZVKGsfNZgzg+gpyaxdh4uIKWLMtsSD3DTIXSe1kZGTag/G2hGAbw7DVCBjMSC4bGt/RuEqhfMdbPZyxkWmSlCg0x7aT0RTmI5XhsTDAARHHNN
X-Received: by 2002:a81:4320:0:b0:651:a724:dcf9 with SMTP id
 00721157ae682-651a724deadmr7137427b3.1.1719995078999; Wed, 03 Jul 2024
 01:24:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240630034649.173229-1-marex@denx.de> <20240630034649.173229-2-marex@denx.de>
 <CAMuHMdXb6nBHLeK1c4CwEUBE8osDyAC_+ohA+10W_mZdGtQufQ@mail.gmail.com> <9f1ae430-4cc4-4e2e-a52c-ca17f499bbba@denx.de>
In-Reply-To: <9f1ae430-4cc4-4e2e-a52c-ca17f499bbba@denx.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 3 Jul 2024 10:24:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWLLAff5_ndAvH9PofTpibJdOau65wK+QekcwR26H2YoA@mail.gmail.com>
Message-ID: <CAMuHMdWLLAff5_ndAvH9PofTpibJdOau65wK+QekcwR26H2YoA@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: Drop ethernet-phy-ieee802.3-c22
 from PHY compatible string on all RZ boards
To: Marek Vasut <marex@denx.de>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: linux-arm-kernel@lists.infradead.org, andrew@lunn.ch, 
	kernel@dh-electronics.com, kernel test robot <lkp@intel.com>, 
	Conor Dooley <conor+dt@kernel.org>, Khuong Dinh <khuong@os.amperecomputing.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Marek,

On Tue, Jul 2, 2024 at 10:45=E2=80=AFPM Marek Vasut <marex@denx.de> wrote:
> On 7/2/24 10:38 AM, Geert Uytterhoeven wrote:
> > On Sun, Jun 30, 2024 at 5:47=E2=80=AFAM Marek Vasut <marex@denx.de> wro=
te:
> >> The rtl82xx DT bindings do not require ethernet-phy-ieee802.3-c22
> >> as the fallback compatible string. There are fewer users of the
> >> Realtek PHY compatible string with fallback compatible string than
> >> there are users without fallback compatible string, so drop the
> >> fallback compatible string from the few remaining users:
> >>
> >> $ git grep -ho ethernet-phy-id001c....... | sort | uniq -c
> >>        1 ethernet-phy-id001c.c816",
> >>        2 ethernet-phy-id001c.c915",
> >>        2 ethernet-phy-id001c.c915";
> >>        5 ethernet-phy-id001c.c916",
> >>       13 ethernet-phy-id001c.c916";
> >>
> >> Reported-by: kernel test robot <lkp@intel.com>
> >> Closes: https://lore.kernel.org/oe-kbuild-all/202406290316.YvZdvLxu-lk=
p@intel.com/
> >> Signed-off-by: Marek Vasut <marex@denx.de>
> >
> > Thanks for your patch!
> >
> >> Note: this closes only part of the report
> >
> > In that case you should use a Link: instead of a Closes: tag?
>
> But which patch would be the one that Closes that report then ?

The "last" one that goes in (in parallel with the others)?
Yes, this is not easy to automate...

> >> --- a/arch/arm64/boot/dts/renesas/cat875.dtsi
> >> +++ b/arch/arm64/boot/dts/renesas/cat875.dtsi
> >> @@ -22,8 +22,7 @@ &avb {
> >>          status =3D "okay";
> >>
> >>          phy0: ethernet-phy@0 {
> >> -               compatible =3D "ethernet-phy-id001c.c915",
> >> -                            "ethernet-phy-ieee802.3-c22";
> >> +               compatible =3D "ethernet-phy-id001c.c915";
> >>                  reg =3D <0>;
> >>                  interrupt-parent =3D <&gpio2>;
> >>                  interrupts =3D <21 IRQ_TYPE_LEVEL_LOW>;
> >
> > What about moving the PHYs inside an mdio subnode, and removing the
> > compatible properties instead? That would protect against different
> > board revisions using different PHYs or PHY revisions.
> >
> > According to Niklas[1], using an mdio subnode cancels the original
> > reason (failure to identify the PHY in reset state after unbind/rebind
> > or kexec) for adding the compatible values[2].
>
> My understanding is that the compatible string is necessary if the PHY
> needs clock/reset sequencing of any kind. Without the compatible string,
> it is not possible to select the correct PHY driver which would handle
> that sequencing according to the PHY requirements. This board here does
> use reset-gpio property in the PHY node (it is not visible in this diff
> context), so I believe a compatible string should be present here.

With the introduction of an mdio subnode, the reset-gpios would move
from the PHY node to the mio subnode, cfr. commit b4944dc7b7935a02
("arm64: dts: renesas: white-hawk: ethernet: Describe AVB1 and AVB2")
in linux-next.

Niklas: commit 54bf0c27380b95a2 ("arm64: dts: renesas: r8a779g0: Use
MDIO node for all AVB devices") did keep the reset-gpios property in
the PHY node. I guess it should be moved one level up?

Does the rtl82xx PHY have special reset sequencing requirements?

> What would happen if this board got a revision with another PHY with
> different PHY reset sequencing requirements ? The MDIO node level reset
> handling might no longer be viable.

True. However, please consider these two cases, both assuming
reset-gpios is in the MDIO node:

  1. The PHY node has a compatible value, and a different PHY is
     mounted: the new PHY will not work, as the wrong PHY driver
     is used.

  2. The PHY node does not have a compatible value, and a different
     PHY is mounted:
       a. The new PHY does not need specific reset sequencing,
          and the existing reset-gpios is fine: the new PHY will just
          work, as it is auto-detected.
       b. The new PHY does need specific reset sequencing: the
          new PHY will not work.

Which case is preferable? Case 1 or 2?

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

