Return-Path: <linux-renesas-soc+bounces-20644-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 595D1B2AE03
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Aug 2025 18:24:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 54B91167512
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Aug 2025 16:24:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75D5233EAFD;
	Mon, 18 Aug 2025 16:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D8PPLho5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB4063375C1;
	Mon, 18 Aug 2025 16:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755534253; cv=none; b=DoGWbcaVKkDhOJb8ldM2SWKHbvX/TK9oXt+2+S4uBLEMyixXGWG5kOMCiZ/mgEbvnpWbCqSjISWjsQzacHDBYdRtpqEvNYMbbxgx0oTwumtwboSphmY2s2/+i3ZS55OAL8NwAp3P4kin7QI5x+oefrmY4fxjScYdViJP31aLLyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755534253; c=relaxed/simple;
	bh=RyLxKd0HNkmcUz8U1AKkgGWW9+Hxjb9yt1oBIY4jugM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aQBxgLW1n04UkkS9ynfEEIjKJbO6Xf/tEcxmkAG5aQox71cbg4IPL8TD/NCjjJHRQOE+d7Ag2yyY5N1s7G3JoMo5dT4osO6Ennid/qGR0GxwUc0AQcq+wEfVg4f6r86SqqNKvW7DCu3TSFosE8zTb/x8JnAgUmk11uRa09pNQgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D8PPLho5; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3b9e41101d4so2316398f8f.2;
        Mon, 18 Aug 2025 09:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755534250; x=1756139050; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RyLxKd0HNkmcUz8U1AKkgGWW9+Hxjb9yt1oBIY4jugM=;
        b=D8PPLho5cM6wlmHrwp2Ff/XEU1w9cHyEuDelzX+7cpj9PKAPfkS9HE8i6eAkNFRzDe
         bHHl3zP+Q2WzeTvC5oQDqGuvvgZlmu8zhpwDKjGk8U2oTCPOMcqyMaLFb//v7d9bCXZb
         CIKB1kMccMMbJwceUn1xSL8aITtI1LFTWJcs6saq3fNkiI4McowaFd2Uf253M1G/D6SA
         IrnLqZTf8JheslmMwQhZHqAtFw4J2L0KdOxy5G2/u1tDyn1dOZoy+mSBXLyp2Aqi1DNm
         vjwyJ69h7dhkm3deTf6/QsQvg5HbGOCVV1Qp/iA7W9ZbVaAyFwPJRgxX69LrEYn2M3J2
         BC+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755534250; x=1756139050;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RyLxKd0HNkmcUz8U1AKkgGWW9+Hxjb9yt1oBIY4jugM=;
        b=T4XWuwe2iIWWXFVoWx7nbxh9uLLroBHB66xW8x6zGBB+HF1F7MffxCkb8bhInxbA4f
         Vj8dBVklDDVJ8e7q9rPVQ/3RuDPhjw/lMzBUWP4eTcUUTvByzwmGFQ3p8JH5js8H4w80
         kvAj8qX9LnJJ+Y6xJg3wFrwbZn3nll1fLzXvibajdP0qM+UNq4ONIIRiGnaPWQ+5bh4T
         9bC3JBAPxzKjXV9W/dbeIAK/AZLYb26yLp20u9j/p3QYaU/Qe7unSFogYIk3fENQLF+m
         jTDvNiCAyywrfZu7CqwsMHCVOnZ66fHWnEJMtVxmDqEb0X20iOBlri74BCC61K/gaEWL
         YeOg==
X-Forwarded-Encrypted: i=1; AJvYcCUFvWa7GF0MduU19Y93t17uHd+QfdfLRz6OdN82RnldYRuPpkTQa8bglkKYunf9DHWENPK+Uxyqag9oSN3jEPb1NLw=@vger.kernel.org, AJvYcCWpYoszGmd6X3EEuDnNjEQa1mO+24AzxxCgS9IQqiWcbRBKMhDg0MexprqurpVQwaJkXQvFHU8f@vger.kernel.org, AJvYcCXVGn72F2bA33S20xRgFLhvHGyHrbVizW1rbKknYO8ExSGRpKY3vnmw2TQxvlROmo2tgEJDoNpp1c4zlA8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdI2PXOe7xwd8DwKUq//Yg2DZ3/A92N94V+nvCS8CGB8Dv7H/u
	/fjgAtz/6skneBASVqa3FRKrdGEQIHD+6ZjaabFAsHo+oJorplPBjis15z3a3LvPZmGaXiwChHi
	GUcTep8KRI6v7MFTPc+75KIAKT23FDxI=
X-Gm-Gg: ASbGncsKJP5X3i6O4uPT9lVvf15gToKuCY7fMV1k6GPlTES63uqU9y62e//98rbu57J
	4H6gub1betwaE1EXsoBIjjd6NuPW0GmZ3P1o+wxYEGBWsztpSnApaSMQ4tNbpx5dl/rRAlz1s85
	h3+pKfdD7ktiZUH5Ac5XxaR/+uiD+gvnRKBzqubLAy5KD4YC8LIzZalI0IULYoF2PdUKtX/FCm3
	iGv1/MjPSREQEaYPd8=
X-Google-Smtp-Source: AGHT+IGZ3t9hgg3srz9Rt2K+g/PO9c71gGvnZVVFPcQe3FDDGZb98nG2ZmgdnoPzLFA/r1z9x2aVkGmm5+Qwg+Fev1I=
X-Received: by 2002:a05:6000:4027:b0:3b7:8154:aa36 with SMTP id
 ffacd0b85a97d-3c07cae9c03mr42274f8f.7.1755534249805; Mon, 18 Aug 2025
 09:24:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250818150757.3977908-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <aKNNvDwkehoit1eZ@shikoro>
In-Reply-To: <aKNNvDwkehoit1eZ@shikoro>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 18 Aug 2025 17:23:43 +0100
X-Gm-Features: Ac12FXyVluWJKT8BmOjlv4aWQi4NLlH6rHp12mSY6GFurkkMDIfEnvj8ddtBrg4
Message-ID: <CA+V-a8sVdYm+P==2OzQ4QGFFREO4d_YtER_=9-g93Xsk8Nkz4w@mail.gmail.com>
Subject: Re: [PATCH] net: pcs-rzn1-miic: Correct MODCTRL register offset
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, 
	Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Florian Fainelli <f.fainelli@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, stable@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

Thank for the review.

On Mon, Aug 18, 2025 at 4:58=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> On Mon, Aug 18, 2025 at 04:07:57PM +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Correct the Mode Control Register (MODCTRL) offset for RZ/N MIIC.
> > According to the R-IN Engine and Ethernet Peripherals Manual (Rev.1.30)
> > [0], Table 10.1 "Ethernet Accessory Register List", MODCTRL is at offse=
t
> > 0x8, not 0x20 as previously defined.
> >
> > [0] https://www.renesas.com/en/document/mah/rzn1d-group-rzn1s-group-rzn=
1l-group-users-manual-r-engine-and-ethernet-peripherals?r=3D1054571
> >
> > Fixes: 7dc54d3b8d91 ("net: pcs: add Renesas MII converter driver")
> > Cc: stable@kernel.org
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>
> I can also test it on my N1D board next week.
>
Perfect, I dont have access to the RZ/N1 board but I'm working on
reusing the same driver for a new SoC which has the same register.

Cheers,
Prabhakar

