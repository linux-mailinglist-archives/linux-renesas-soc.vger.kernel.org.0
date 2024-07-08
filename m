Return-Path: <linux-renesas-soc+bounces-7153-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AEE9929CC8
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Jul 2024 09:09:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 45E44280EE6
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Jul 2024 07:09:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 873181B815;
	Mon,  8 Jul 2024 07:09:31 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BCCC13ACC;
	Mon,  8 Jul 2024 07:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720422571; cv=none; b=UDLGw+fvtY0R/+vwMGlYYOlia0vWTKQ0PmfVFxm3C1QHJlDDLk1dWRlAEiZfzC/m7y4oDSD8C0ZCLFWwV735DiAIIhAQPFClqYDNOaF2D4lrC9GArPI5ELdJ1cg49x3jAtiZb8bGRFHZFyyPCgGNcJSxs29r0YIogqyCHXciqEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720422571; c=relaxed/simple;
	bh=GMhZnmtAnU98uQIfrY50sLKVKFBVsT5ww2kb4ks0Dmk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZLBhO58VIZ6TeoX0diS4znWbMJD7CxIQlPoEl9kzvvYZKLSl3WY+MyzxBQaYxB1FA6DUZgrxSETuqm7EJc4NldzV8SfYjQK4MNM+diYEJ4DozEOzYkyVMVGLm/aqf9xnaqC1o2RKxaaAOK/pbG+ZbJAZC8LhiQ7Jt9Hv/VV7r3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-650b8e0a6ceso35345367b3.3;
        Mon, 08 Jul 2024 00:09:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720422566; x=1721027366;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=svEoVz9rKIQGMUUIhK8sBXjdapRajxmk6i0jl5DLBXg=;
        b=wHlRSxOKMztBMRWaPwu9gQKLuno8cHycOL00Wks0cUNBlEHc+Xon7WVHDvORZflwba
         yXtIDN7x8j9NmSqRSWxRFIEq7VXR+/6SCwDZ0iMyuIErc6nWRBSIp/pLPyZd8Yrdhb8i
         C8xJQxG5DzzMAQgesvJFoQ52PisLvtLxCUUCyBZ70qLw+TJGk5fc9vJo+SWbB99dE8fE
         i3zaj475PK7btimsqokuPcOuYzLaPmfQqUv1eJ84sOXCZKtDhDVuvWY14upi63T6NVxS
         KDTLa24aAcYXV0s8oYPdDPIwxnR/1k+OTt4urelibNB6U/lKsIOctUemOikuyJoWAt23
         pI1A==
X-Forwarded-Encrypted: i=1; AJvYcCXSVLB/y99AQGhRXWiGUz9f3jSqotWtAPNlCSrAyDM3g6JbPHwqaYE207aI8hztXdliAM2LhZyxmSi9pln6yh5zd2npwgDrehhH1KLds014IA/mC/dHGbjQ8Yw0TI0xiu1cmwLa7FeQF2TgSwhR
X-Gm-Message-State: AOJu0YyApKYqCBYutzdIgPd50oNAmjWnfeZ2dYn94JpiuSD1yMivlGwK
	02JhHmcCgYrqRl6CaZPhl6tUXXpnGpje/8Hu01NQEA55A1Dtr6URlov+Svp+
X-Google-Smtp-Source: AGHT+IE+LrgrgNIuy2cxosloaDefoCF5uULQOzr/F26FX93CM4o03iLatEBEnVU1Rx5xTzXpRc7RrQ==
X-Received: by 2002:a05:690c:d0b:b0:62c:c684:b1e1 with SMTP id 00721157ae682-652d61e632cmr138212457b3.29.1720422566004;
        Mon, 08 Jul 2024 00:09:26 -0700 (PDT)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-650fca11ff8sm19886537b3.40.2024.07.08.00.09.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jul 2024 00:09:25 -0700 (PDT)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-650b8e0a6ceso35344927b3.3;
        Mon, 08 Jul 2024 00:09:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVkAhYWjr7mrnH3K5Aqemusbn9hSJvMPCv8H1GcKtUxT/doS4pfEaKyrd3Z9Dyjfpdykytzslska/hbqAGSZFXJkbDVDYDs2othi66MfnGYoNVKK+xxWGlZYY7v339+r8BQ/SrLqghbCuL24YQG
X-Received: by 2002:a05:690c:7483:b0:631:2ebf:b8dc with SMTP id
 00721157ae682-652d5333721mr140935657b3.4.1720422564622; Mon, 08 Jul 2024
 00:09:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240630034649.173229-1-marex@denx.de> <20240630034649.173229-2-marex@denx.de>
 <CAMuHMdXb6nBHLeK1c4CwEUBE8osDyAC_+ohA+10W_mZdGtQufQ@mail.gmail.com>
 <9f1ae430-4cc4-4e2e-a52c-ca17f499bbba@denx.de> <CAMuHMdWLLAff5_ndAvH9PofTpibJdOau65wK+QekcwR26H2YoA@mail.gmail.com>
 <b9c2abc3-cc01-4ac7-9e42-c9ce1db64eba@denx.de>
In-Reply-To: <b9c2abc3-cc01-4ac7-9e42-c9ce1db64eba@denx.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 8 Jul 2024 09:09:12 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUtAU0uyXYK_FzHW2vMBwG6WEGNXgJALceCVvvr4DCVbw@mail.gmail.com>
Message-ID: <CAMuHMdUtAU0uyXYK_FzHW2vMBwG6WEGNXgJALceCVvvr4DCVbw@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: Drop ethernet-phy-ieee802.3-c22
 from PHY compatible string on all RZ boards
To: Marek Vasut <marex@denx.de>
Cc: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	linux-arm-kernel@lists.infradead.org, andrew@lunn.ch, 
	kernel@dh-electronics.com, kernel test robot <lkp@intel.com>, 
	Conor Dooley <conor+dt@kernel.org>, Khuong Dinh <khuong@os.amperecomputing.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Marek,

On Fri, Jul 5, 2024 at 11:50=E2=80=AFPM Marek Vasut <marex@denx.de> wrote:
> On 7/3/24 10:24 AM, Geert Uytterhoeven wrote:
> >>> What about moving the PHYs inside an mdio subnode, and removing the
> >>> compatible properties instead? That would protect against different
> >>> board revisions using different PHYs or PHY revisions.
> >>>
> >>> According to Niklas[1], using an mdio subnode cancels the original
> >>> reason (failure to identify the PHY in reset state after unbind/rebin=
d
> >>> or kexec) for adding the compatible values[2].
> >>
> >> My understanding is that the compatible string is necessary if the PHY
> >> needs clock/reset sequencing of any kind. Without the compatible strin=
g,
> >> it is not possible to select the correct PHY driver which would handle
> >> that sequencing according to the PHY requirements. This board here doe=
s
> >> use reset-gpio property in the PHY node (it is not visible in this dif=
f
> >> context), so I believe a compatible string should be present here.
> >
> > With the introduction of an mdio subnode, the reset-gpios would move
> > from the PHY node to the mio subnode, cfr. commit b4944dc7b7935a02
> > ("arm64: dts: renesas: white-hawk: ethernet: Describe AVB1 and AVB2")
> > in linux-next.
>
> That's a different use case, that commit uses generic
> "ethernet-phy-ieee802.3-c45" compatible string and the PHY type is
> determined by reading out the PHY ID registers after the reset is release=
d.
>
> This here uses specific compatible string, so the kernel can determine
> the PHY ID from the DT before the reset is released .

I am suggesting removing the specific compatible string here, too,
introducing an mdio subnode, so the kernel can read it from the PHY
ID registers after the reset is released?

> >> What would happen if this board got a revision with another PHY with
> >> different PHY reset sequencing requirements ? The MDIO node level rese=
t
> >> handling might no longer be viable.
> >
> > True. However, please consider these two cases, both assuming
> > reset-gpios is in the MDIO node:
> >
> >    1. The PHY node has a compatible value, and a different PHY is
> >       mounted: the new PHY will not work, as the wrong PHY driver
> >       is used.
>
> What is the likelihood of such PHY exchange happening with these three
> specific boards ? I think close to none, as that would require a board
> redesign to swap in a different PHY.

I don't know about the likelihood for these boards.
It did happen before on other boards, e.g. commit a0d23b8645b2d577
("arm64: dts: renesas: beacon-renesom: Update Ethernet PHY ID").

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

