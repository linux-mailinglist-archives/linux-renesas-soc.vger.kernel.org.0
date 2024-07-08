Return-Path: <linux-renesas-soc+bounces-7152-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 39EE4929CAE
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Jul 2024 09:02:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E1FF9280D8A
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Jul 2024 07:02:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3C9417C66;
	Mon,  8 Jul 2024 07:02:30 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15A581BF3F;
	Mon,  8 Jul 2024 07:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720422150; cv=none; b=JdUoTPD4TZ8OoRn15g3mNhKjpT9m6VTfwg8Ni5augVibUedXlF//76tBdzrLnpXuCCaqrg2f3ghe9VMWdqURs+3MHMBgUmxeLmTpOviNFMmpG/zs12KUD2DaH7eS2AtGB/t3/fomM1jyryzgbFlstYjD9wxT8oB2hz5VVigpCgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720422150; c=relaxed/simple;
	bh=blekNSaifvF8rH97LXQzaFG6kEbkNseGmHpipfOHVG0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FP9ceox9pcRUfZD+2U+KCMuMy+oC8S91DGS12eTYm1Q78iKeM4XkNSOP+iXNdztBw+AQoi5sBIi6C5xuTs2gng/7y2GCdoLGP3fgjXMFmGuOG2ckAATgMq2ZQPbiG/vL/RPPdsDeaM0169AMt8laoi+Slzh5ab+fXwtWs9RZQG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e026a2238d8so3790155276.0;
        Mon, 08 Jul 2024 00:02:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720422146; x=1721026946;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rtbU4m2r0Wr0MicFZxyKb/Qi0+cPjkiW5kPjK5OPEfg=;
        b=p0U0U9y9mpy4w8jRZ1Y61QncfHmcZQIHy2Pi1iTErqKjPaXn1T5suaRvW9KlahHdRO
         5RFb56EOjDLw1rIe+cQdvzqFCHRFyDUnzlvMcgnih6AzxIP9gd3yoIJ5j8DkpgYDtc1c
         nMGUj0fl+dgi0iSeOZJ10CPZYP7MDHl1brrDz8U+tET1Vla6Jxng32AaaTp1ZTnj/esW
         ikWlXEq5GTqWl0ClyGb13b6vTpjUge0BT1G8s2ui/3Hc3vEDVTuriUyuxsYRSrmSPhcc
         EGl0tBNTu6TS+UcUzaCT0cgtuNcrX0ZBJMJAV3AcwnDTg+dnoNwlcpY4yJCZKGZB+DoR
         Y6rw==
X-Forwarded-Encrypted: i=1; AJvYcCVz2x4PPEiy5LCnJNQbKKKmDU3tEvDHHWK17P45ma2MRBOmxvQ25RGVh5GVyQC/oayFWK83P/FwyxyoVOSNiw2GU+6W7k3aXqZbXBtNdjbIkewY7zciRKDHrqftxAbmdQN+ef+/FaCDbXLsEmqp
X-Gm-Message-State: AOJu0YzjEPFiKBNZpeh9dLQHlTzGk6be6y/eZz7jfffLL+llVxFYsh0t
	EbWzLdYGQ9215DuvTgWH11TaY0LXxdkFdvmSsPgANBEezgexRwq8RnoM4+LE
X-Google-Smtp-Source: AGHT+IHgGICmSBw+SKJTSCNg7hZ8oKG6BzpcnAqTLP2tcIz2ljEPuFOVwR+JhSBBLTeotM1jin+WAQ==
X-Received: by 2002:a81:9289:0:b0:64b:392a:b9d7 with SMTP id 00721157ae682-652d7d56271mr111787157b3.45.1720422145750;
        Mon, 08 Jul 2024 00:02:25 -0700 (PDT)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6547503977bsm10118157b3.33.2024.07.08.00.02.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jul 2024 00:02:24 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-64789495923so28447897b3.0;
        Mon, 08 Jul 2024 00:02:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX31nPnbem11slqcEzNsYYfp0SQPYm4UShB2EqPXFD/kgWjuhb+9gxOZNLozs2px915x1eRygxP/x1umVI7yMY1nIvV1F94Q70hq9LxDUpA7Zhdx7RKUZqdDloV2bj6nb9caTYqQcqA0sfQz+eU
X-Received: by 2002:a05:690c:6910:b0:64a:5df5:3afb with SMTP id
 00721157ae682-652d7870764mr134640307b3.39.1720422144034; Mon, 08 Jul 2024
 00:02:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240630034649.173229-1-marex@denx.de> <20240630034649.173229-2-marex@denx.de>
 <CAMuHMdXb6nBHLeK1c4CwEUBE8osDyAC_+ohA+10W_mZdGtQufQ@mail.gmail.com>
 <9f1ae430-4cc4-4e2e-a52c-ca17f499bbba@denx.de> <CAMuHMdWLLAff5_ndAvH9PofTpibJdOau65wK+QekcwR26H2YoA@mail.gmail.com>
 <20240703093601.GA6493@ragnatech.se> <fa6db116-50bb-488b-a48f-c34f918424a2@denx.de>
 <20240706083935.GA2366@ragnatech.se>
In-Reply-To: <20240706083935.GA2366@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 8 Jul 2024 09:02:12 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVWAGuravTq1OEx++NhmmUnYKcexdp+A5Cz0dtmyuZ-Og@mail.gmail.com>
Message-ID: <CAMuHMdVWAGuravTq1OEx++NhmmUnYKcexdp+A5Cz0dtmyuZ-Og@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: Drop ethernet-phy-ieee802.3-c22
 from PHY compatible string on all RZ boards
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Marek Vasut <marex@denx.de>, linux-arm-kernel@lists.infradead.org, andrew@lunn.ch, 
	kernel@dh-electronics.com, kernel test robot <lkp@intel.com>, 
	Conor Dooley <conor+dt@kernel.org>, Khuong Dinh <khuong@os.amperecomputing.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

On Sat, Jul 6, 2024 at 10:39=E2=80=AFAM Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> On 2024-07-05 23:49:56 +0200, Marek Vasut wrote:
> > On 7/3/24 11:36 AM, Niklas S=C3=B6derlund wrote:
> > > On 2024-07-03 10:24:26 +0200, Geert Uytterhoeven wrote:
> > > > Niklas: commit 54bf0c27380b95a2 ("arm64: dts: renesas: r8a779g0: Us=
e
> > > > MDIO node for all AVB devices") did keep the reset-gpios property i=
n
> > > > the PHY node. I guess it should be moved one level up?
> > >
> > > It's possible to have a rest-gpios property both in the mdio node and
> > > the phy node. The former resets the whole bus while the later a singl=
e
> > > PHY, at least that's my understanding.
> >
> > My understanding of reset GPIO in the MDIO node is that it is used in c=
ase
> > there might be multiple PHYs with shared reset GPIO on the same MDIO bu=
s.
> > Like on the NXP iMX28 .
>
> There is a use-case for a single PHY on the MDIO bus too, at least in
> Linux as I understand it. If the boot process leave the PHY in a bad
> state which prevents it from being probed. A GPIO reset in the MDIO node
> is used when the MDIO bus is registered thus resetting all (in this
> use-case the one) PHYs which later allows them to be probed. A GPIO
> reset on the PHY node is only used after a PHY have been probed, at
> least that is my understanding.

The reset is also asserted on driver unbind.

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

