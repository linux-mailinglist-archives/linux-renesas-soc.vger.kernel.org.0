Return-Path: <linux-renesas-soc+bounces-13887-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B23A4BCCC
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Mar 2025 11:48:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D26B93A48FA
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Mar 2025 10:46:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1B561F1527;
	Mon,  3 Mar 2025 10:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LRaq3Pas"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F361F0E5A;
	Mon,  3 Mar 2025 10:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740998670; cv=none; b=oKQs4VKuyntW8NCVYSTghHBSFtG7IZCamkxPaXOEz8gmgNaSnuxYdHydDcnuzj6PLsUYiD+PRdoVgcM4qJhLarYnGYBTdB724KGNAN+hD3K0mvxZLPOgOwC5N1YzY+izrZVawx2kiLZUZluu9N1Qj+yf5IQqGl9F4xBTNnubnlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740998670; c=relaxed/simple;
	bh=wC2q10KG3Ghwf6hz4tiJoVuQD0EAzLySdABg2kAHXjw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NzKSfjlDQ1X2R69xN7PyShWsaJ/h2qIYTir0u5iPDx0xIN4phfqKSZAn3Mpth8nKhYMpAWodhGgajYFJJNdtIH1QnkrKKVsxgG2sBvuWvy6C/x5ptwoksaJZkVmPxvewbbrnItQW+bX3+p3EWqStBS2n99ayXDdz7AEVGdVQuGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LRaq3Pas; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5235db99207so1301249e0c.2;
        Mon, 03 Mar 2025 02:44:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740998668; x=1741603468; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ValbcMAvryzd2X2LKDNT5TovDreTGpGWQQwvZLlYzoE=;
        b=LRaq3Pas2V3RbFrgQCBoUjCDHwjxAMNdEIvbmNRVr5UQcRu8eHg6iAijZsovIGQB+B
         Zw4LHOdkkE/COMarhWBMShig1+mSEQcdjAmz+q5dZgmh11o6YojJVlDC4ScuO3feQiUL
         L0loHjZ8988xJy4AdcMh4t13j/7aj2YbmcbN3jMK4HMu5jEHr/VWCTaPUpIrQj8h20zv
         ZraJavdFpLHHDf09eUESC0rPagfhJo6PssUrhG0t0tjW3/WxBH7eCw2/oRaXcbBUrbiU
         6r4scB9a1x0n2ls3K3sIZawto91uVrnYZQ5FoAIXAv0+GmSNEVQ2haHBtVUB6pTKxuxw
         MMkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740998668; x=1741603468;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ValbcMAvryzd2X2LKDNT5TovDreTGpGWQQwvZLlYzoE=;
        b=s54wu/Zpx3HPsdp+xmCtaUOdfybEq/O+qbzyOqeUodxgPt046ZnM68R6nJj2cfVyyj
         l7Vdlurc9o9rJUFcyKt5Z34k/JGSywuWNuKUdF3lwxAWzd5qMckCvq0p3/T38g8WA+Ee
         wId7hzDzM6UE3I9TlU1m/hySaGDF0N/1uj7tjWjIEneDO7SmdPeMI7P0O/a4pLeLGS6/
         gpA5DmEo81ALm2p3aoz3ApWGAlfik+8tg0ROs/l8GI4bAvLnjVR9UjHR4WFQQZYwsJj9
         6YZihz3C1HNvjGXJsyQkFRRCRyCuzpGvAeTfaIpxbsxN79z4Z21s6rIvVSJMH9y412OC
         aLEg==
X-Forwarded-Encrypted: i=1; AJvYcCVGzkzO7v2SO04MQzTmsnk6jAt8lOUazdBmW/oQoVXtV7aD/bSZTpmQaL8ONuOc2qEH9yPkOfVFSDxW@vger.kernel.org, AJvYcCWaItYiHggIHlalVEylFAMfvSTyktlsOZhWdjr7KFvHHhZQAJPwiJNnIBLPfpFEGR4wFIWPeTt2scU9KzwwsY4q2fs=@vger.kernel.org, AJvYcCXQtlQ9KQklNWQW4Fn2GsRCbFowhbtZL5dPqb7S/8PNGwkbsSMDBBT3Vzwu/yVlMYi2X3JOPjO3v+8+aiKO@vger.kernel.org, AJvYcCXo0MAHw/D18JRh/3Ft+ys+fjH4/y9BF/iL/ieDXI1lCDJyTdr2fh5rheClhsmIdFvhBQTtD28a@vger.kernel.org
X-Gm-Message-State: AOJu0Yxqe6+4m6ucu/ch8ZecnrqUrzD+fr1H7RwP921i008lmrqH7pao
	RDtMpp7pefDwnNaf2ZefXtWfb6CwVqTKg+HCyxm4LR8uRXmQ+SVZvd+SxRkGcQVJx7ApT/kO28V
	RmiKIQ2lWWEDZ6IPBkBLqtc2AP9o=
X-Gm-Gg: ASbGncuA/qkUpgTgZ0L/cATNBWp75aIqS3mEMF0B8bDm0b4KdZmtI8G3YZ2FW8yWPLs
	9O4bmrHZwsAdo5S1c3X08VwRTDQT5mAZYKu9lYhfJuCZGWLYCwHw4Es4JR7vObVjzJ6ZhcTQ8fD
	6iNRLSZZf8X5CgIou9g4haFKqJMQ==
X-Google-Smtp-Source: AGHT+IG2qpwawLE6Rvk15NxvM4Gy6IyXKbg/hPFM7/t75E0bxxABTutKwor2qyggAjfipjh58zDnMErQ1ays2smrJFo=
X-Received: by 2002:a05:6122:2388:b0:50b:e9a5:cd7b with SMTP id
 71dfb90a1353d-5235bdaa6aamr7344635e0c.9.1740998667907; Mon, 03 Mar 2025
 02:44:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250302181808.728734-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250302181808.728734-4-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdV8GqnhsJg7J7keGvT=Dvj_w0hZOiuZqCa=tiUgLE8Vtg@mail.gmail.com>
In-Reply-To: <CAMuHMdV8GqnhsJg7J7keGvT=Dvj_w0hZOiuZqCa=tiUgLE8Vtg@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 3 Mar 2025 10:44:01 +0000
X-Gm-Features: AQ5f1JoNYFxy-zo3U0bJLlyWfLKhjM8uHRna32Arg2GW5Id0Ld8noNLo_eKIJkU
Message-ID: <CA+V-a8u_yXu8QkimjArYjPymtyrX1h+bcVHdhCozQx3_NCOHdQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] net: stmmac: Add DWMAC glue layer for Renesas GBETH
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
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

Hi Geert,

On Mon, Mar 3, 2025 at 10:40=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Sun, 2 Mar 2025 at 19:18, Prabhakar <prabhakar.csengg@gmail.com> wrote=
:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Renesas RZ/V2H(P) SoC is equipped with Synopsys DesignWare Ethernet
> > Quality-of-Service IP block version 5.20. This commit adds DWMAC glue
> > layer for the Renesas GBETH found on the RZ/V2H(P) SoC.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- /dev/null
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
>
> > +static int renesas_gbeth_probe(struct platform_device *pdev)
> > +{
> > +       struct plat_stmmacenet_data *plat_dat;
> > +       struct stmmac_resources stmmac_res;
> > +       struct device *dev =3D &pdev->dev;
> > +       struct renesas_gbeth *gbeth;
> > +       struct reset_control *rstc;
> > +       unsigned int i;
> > +       int err;
> > +
> > +       err =3D stmmac_get_platform_resources(pdev, &stmmac_res);
> > +       if (err)
> > +               return dev_err_probe(dev, err,
> > +                                    "failed to get resources\n");
> > +
> > +       plat_dat =3D devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
> > +       if (IS_ERR(plat_dat))
> > +               return dev_err_probe(dev, PTR_ERR(plat_dat),
> > +                                    "dt configuration failed\n");
> > +
> > +       gbeth =3D devm_kzalloc(dev, sizeof(*gbeth), GFP_KERNEL);
> > +       if (!gbeth)
> > +               return -ENOMEM;
> > +
> > +       plat_dat->clk_tx_i =3D devm_clk_get_enabled(dev, "tx");
>
> drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c:52:17:
> error: =E2=80=98struct plat_stmmacenet_data=E2=80=99 has no member named =
=E2=80=98clk_tx_i=E2=80=99
>
> Also not in next-20250228.
>
This patch is based on net-next. Patch [0] is the one which adds
clk_tx_i member.

[0] https://web.git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git=
/commit/?id=3Ddea5c8ec20be

Cheers,
Prabhakar

