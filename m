Return-Path: <linux-renesas-soc+bounces-7213-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 35FD892C6A7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jul 2024 01:37:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9A2FC1F22D37
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jul 2024 23:37:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7C78156C74;
	Tue,  9 Jul 2024 23:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e2P1l4c+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C947144D00;
	Tue,  9 Jul 2024 23:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720568248; cv=none; b=jOoAR/toEwhxW1BMXa/husHluzcbGm9gGKPq56UmLfcI883U/JN+CLl8TPULm+UZxbuFnMLXyUs/YzBmWOjTnwFl9Th3vfHa1oqm3gLirSbsyZuq/RP/Zqb5SYdSnBQmNpXkvxDOl6eqPAveP54Km+1xne7fyD6H8/iUGxYHHho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720568248; c=relaxed/simple;
	bh=DiAuI5bdoQsv3i9T5xcHLYssufP9HZymoq04bu0koPs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eblfY2YHLUvRgvW4F956jAmYwRzWoqeI/leQO31Qqr5z7hqCSnRUkeE2l/9H/QhJ/xVSebocG61SQcO/rNkbiR/+/TFkJdDy9x4LobHLfmjxinJtebe3gDp0+5NeJngrp9P3f8UQwupqhCkXAjcaM/eGfqfCk7UP52AO6Jni8qM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e2P1l4c+; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-6e7e23b42c3so2987013a12.1;
        Tue, 09 Jul 2024 16:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720568246; x=1721173046; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rXJX34uWJ5OA5DmRXtCgDDATDBGR/MfQvezGcEDKT9k=;
        b=e2P1l4c+iIXiGFzV0FB0MHoGKOCcoja9WwBfFAZbkWMLfIRzxAu+W7o5mo2mQuQ71Q
         stDjUdEiknKx/8VGGPx23dgaeK1BwhDczm/hjQW4FpY2qifo6R7oW0Ri14M/wBxjVL6i
         wmHpQ3gUchkguA7k5rCy4JUv/ipVAspzpi7sUdcdrTR2b26JCAuXQGaCSYJBhtFQm5dT
         UvBet+/Zd4KfpVhpHuINbgxF4v0RNthYjtRndX3/3pH9x5h3gf7Bgc7Z+CQTTt5nV13R
         PfvBLCCEuDTi7O+phh8IhPxGIMagljls+h+azWCIqA8lqpaZA31RiXXT53XqL3FvWvgl
         McLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720568246; x=1721173046;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rXJX34uWJ5OA5DmRXtCgDDATDBGR/MfQvezGcEDKT9k=;
        b=FjY6Dvdt1G16Ed/kUYGgnVvzRwxPBu/1XqerFezNG5nIyml5uR2xF7G3pEOEU6xu+y
         RZk1C1V4wodHr4eAdK5gio8s0zeAWUAkNRZS/sLhBEq72fqeJ6qtGb/RUu21x9Jx/0Aj
         FxtG7lV5n9tHRGsEk0o/RbpL0jLlgUjEI/YZMPx0iQRCYHZFa7cPHTZZgqve59cfEUEt
         /vCVfXxvI2t8g1RbmgZkm0/X5K/xUolFdLF+KyOE8LcJmY0wT2XpVS0dyUikQqmpNkKq
         mf5noBFnqi+M32Zfdex+gNrzzt76WAmd46W6HS87nlnFuyYJmQtMrqPh0tRyQ3YWYi6J
         p9Jw==
X-Forwarded-Encrypted: i=1; AJvYcCXTYnaVOffZ8TkyFIjlR4Yco4skKiEXpmR10M45+uzZ++OyQIYZTbNNt5xFqvncks3D5Xgh/BLJPCb1MlPQE44KK4p7b9ueHL/x6/n1kfut1dFVM+1h038MHm2Iw60sWCdkBzVnLmE22KnpSTrW
X-Gm-Message-State: AOJu0Yyrg4Yn2Z9Z7xp0AiUIhaaBJWiSXFLylBkUUGkHWg1Pk+fuRHTY
	Ja1vBpn75LOgbAmEyZBhKYKcocE25Dj5yVkRPB2mAaqOQp3YjvdtDKRMtHsdEL0hXQx+Tnur5Q5
	b/2sHZ9wKQxx2ErlVH7Dshu4fr6M=
X-Google-Smtp-Source: AGHT+IG2V35mfqIg7l43Fdz1DP9KlBrMp4z7YPnnRZuC4H7+HlGY+ViSRJK2ydM5lZ5PWFHU+QUZJAu5D4cyntA6r/Y=
X-Received: by 2002:a05:6a20:72a5:b0:1c2:1ed4:4f90 with SMTP id
 adf61e73a8af0-1c29822de17mr5097610637.19.1720568246442; Tue, 09 Jul 2024
 16:37:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240630034649.173229-1-marex@denx.de> <20240630034649.173229-2-marex@denx.de>
 <CAMuHMdXb6nBHLeK1c4CwEUBE8osDyAC_+ohA+10W_mZdGtQufQ@mail.gmail.com>
 <9f1ae430-4cc4-4e2e-a52c-ca17f499bbba@denx.de> <CAMuHMdWLLAff5_ndAvH9PofTpibJdOau65wK+QekcwR26H2YoA@mail.gmail.com>
 <b9c2abc3-cc01-4ac7-9e42-c9ce1db64eba@denx.de> <CAMuHMdUtAU0uyXYK_FzHW2vMBwG6WEGNXgJALceCVvvr4DCVbw@mail.gmail.com>
 <9f705a40-0b5b-4313-b50f-627dffb9fe3b@denx.de>
In-Reply-To: <9f705a40-0b5b-4313-b50f-627dffb9fe3b@denx.de>
From: Adam Ford <aford173@gmail.com>
Date: Tue, 9 Jul 2024 18:37:14 -0500
Message-ID: <CAHCN7xLr4RB-4zhJpf_xcpM5326m_vaG7E_zx1UJj5MZWhnefQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: Drop ethernet-phy-ieee802.3-c22
 from PHY compatible string on all RZ boards
To: Marek Vasut <marex@denx.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	linux-arm-kernel@lists.infradead.org, andrew@lunn.ch, 
	kernel@dh-electronics.com, kernel test robot <lkp@intel.com>, 
	Conor Dooley <conor+dt@kernel.org>, Khuong Dinh <khuong@os.amperecomputing.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 8, 2024 at 10:34=E2=80=AFPM Marek Vasut <marex@denx.de> wrote:
>
> On 7/8/24 9:09 AM, Geert Uytterhoeven wrote:
> > Hi Marek,
>
> Hi,
>
> > On Fri, Jul 5, 2024 at 11:50=E2=80=AFPM Marek Vasut <marex@denx.de> wro=
te:
> >> On 7/3/24 10:24 AM, Geert Uytterhoeven wrote:
> >>>>> What about moving the PHYs inside an mdio subnode, and removing the
> >>>>> compatible properties instead? That would protect against different
> >>>>> board revisions using different PHYs or PHY revisions.
> >>>>>
> >>>>> According to Niklas[1], using an mdio subnode cancels the original
> >>>>> reason (failure to identify the PHY in reset state after unbind/reb=
ind
> >>>>> or kexec) for adding the compatible values[2].
> >>>>
> >>>> My understanding is that the compatible string is necessary if the P=
HY
> >>>> needs clock/reset sequencing of any kind. Without the compatible str=
ing,
> >>>> it is not possible to select the correct PHY driver which would hand=
le
> >>>> that sequencing according to the PHY requirements. This board here d=
oes
> >>>> use reset-gpio property in the PHY node (it is not visible in this d=
iff
> >>>> context), so I believe a compatible string should be present here.
> >>>
> >>> With the introduction of an mdio subnode, the reset-gpios would move
> >>> from the PHY node to the mio subnode, cfr. commit b4944dc7b7935a02
> >>> ("arm64: dts: renesas: white-hawk: ethernet: Describe AVB1 and AVB2")
> >>> in linux-next.
> >>
> >> That's a different use case, that commit uses generic
> >> "ethernet-phy-ieee802.3-c45" compatible string and the PHY type is
> >> determined by reading out the PHY ID registers after the reset is rele=
ased.
> >>
> >> This here uses specific compatible string, so the kernel can determine
> >> the PHY ID from the DT before the reset is released .
> >
> > I am suggesting removing the specific compatible string here, too,
> > introducing an mdio subnode, so the kernel can read it from the PHY
> > ID registers after the reset is released?
>
> I wrote this to Niklas already, so let me expand on it:
>
> My understanding of reset GPIO in the MDIO node is that it is used in
> case there might be multiple PHYs with shared reset GPIO on the same
> MDIO bus. Like on the NXP iMX28 .
>
> In this case, the reset is connected to this single PHY, so the reset
> line connection is a property of the PHY and should be described in the
> PHY node.
>
> You could argue that in this case, because there is only one PHY and
> only one reset line, it fits both categories, PHY reset and MDIO reset.
>
> And then, there is the future-proofing aspect.
>
> If the compatible string is retained, then if in the future there is
> some problem discovered related to the reset of this PHY, the PHY driver
> can match on the compatible string and apply a fix up. But it prevents
> future PHY replacement (which is unlikely in my opinion).
>
> If the compatible string is removed and the reset is moved to MDIO node,
> then replacement of the PHY in the future is likely possible (assuming
> it does not have any special reset timing requirements), but if there is
> a problem related to the reset of the current PHY model, the PHY driver
> cannot fix it up because there is no compatible to match on.
>
> I think that about sums the pros and cons up, right ?
>
> I also think there is no good solution here, only two bad ones, with
> different issues each.
>
> >>>> What would happen if this board got a revision with another PHY with
> >>>> different PHY reset sequencing requirements ? The MDIO node level re=
set
> >>>> handling might no longer be viable.
> >>>
> >>> True. However, please consider these two cases, both assuming
> >>> reset-gpios is in the MDIO node:
> >>>
> >>>     1. The PHY node has a compatible value, and a different PHY is
> >>>        mounted: the new PHY will not work, as the wrong PHY driver
> >>>        is used.
> >>
> >> What is the likelihood of such PHY exchange happening with these three
> >> specific boards ? I think close to none, as that would require a board
> >> redesign to swap in a different PHY.
> >
> > I don't know about the likelihood for these boards.
> > It did happen before on other boards, e.g. commit a0d23b8645b2d577
> > ("arm64: dts: renesas: beacon-renesom: Update Ethernet PHY ID").
>
> I had that happen too. The solution there was to upstream the newer PHY
> ID and apply backward compatibility DTO that rewrote the PHY ID for the
> few older boards. The DTO application decision was done in U-Boot scripti=
ng.
>
> It was not possible to auto-detect the PHY after deasserting its reset
> in my case, I had to determine whether to apply DTO or not based on
> strap resistors on the board.

Beacon had to swap the phy due to the great part shortage of 2021 and
having the hard-code ID's prevented backwards compatibility.  For the
Beacon downstream kernel, we removed the PHY ID and kept the generic
'ethernet-phy-ieee802.3-c22' because it could auto-detect what we
needed and both PHY's appear to come out of reset and register
properly.  I don't know if we could make a generic phy-ieee802.3-c22
handle the reset, wait a moment and then try to auto-detect, but it
would be nice to not have to jump through hoops if/when people need to
change PHY's.

adam

>

