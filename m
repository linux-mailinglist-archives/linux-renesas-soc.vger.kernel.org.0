Return-Path: <linux-renesas-soc+bounces-14176-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E6AB3A583C7
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  9 Mar 2025 12:25:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7BACE1892795
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  9 Mar 2025 11:25:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89AA21C6FF4;
	Sun,  9 Mar 2025 11:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LIrTp7md"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA691ABED9;
	Sun,  9 Mar 2025 11:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741519526; cv=none; b=ZMnIbemCTj0bLm6Nuc1mPLkq2eFArr3tG/GE2EriM39Kxydu3WUhmzkhr73SiJQnkW6/tVDkVIyWdaVampM32OyEllvsVkBg7N+FRemn2Itu+ReVAf4nvuneCui6Ko4uN81/9hhIuSetPYiOuEw3fcxxtKN1m9Mc5lociWY3dBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741519526; c=relaxed/simple;
	bh=byg4vShXgtYtLB4S77VgFYc0UfrdZG36uUIMAaY903k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W6EhnhAKpvEkAGjKZA785Xgaiy3gJnM/rpNxt3MEW4H7faKuAT5OyC6Y4YSA2cWdeWTiX6fIiJ6Za4BBMX2lhVUxru16kqDrXduydOxUD6SvbYqJIyD3KFwdIvca97gm4+mX6zYVz1U/ggRBxmHo8Peu9kNVSHfkvjWQCvI55/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LIrTp7md; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-523fa0df55dso757889e0c.1;
        Sun, 09 Mar 2025 04:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741519523; x=1742124323; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TREwUQZM0D5lAb+hqBXDy6YM7kTSaLkkzG7KiNixFJI=;
        b=LIrTp7mdp8yzRR4Xzuj36Jl/a8ib7ceJ2NGQFjaW4q/YJDCQKSd2QPXq7+HE4G8Avx
         22/T07BlzZ59EPZrLLd01tOwUGHOburMj7x/R/gg2Knb0JB16cfy/JzFKnpretRhtgUI
         1gJV7syo+abCJa6xUMa6wlKPjneBNSVMoIdhM+Aw8nlDv0+CP3rOh2GJm3FkZHNYr/SM
         zL03dNwAYLq/8NGhCey9t9UUTfUiD+9IAG96RsqHzZ8WruzrNpogWEIpYypyzq6XYXQ9
         7PqOsXqx24LepqhD1/dqu8+kUq0k0GIXBREIXwUeBXPLY8OqmxdEarERqOA17w12Dqxk
         ZvGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741519523; x=1742124323;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TREwUQZM0D5lAb+hqBXDy6YM7kTSaLkkzG7KiNixFJI=;
        b=EObIDjrgL06Ap4hmWMOQJbUonzE8i+mtNKhifdhNvqpWMneoZsnyojPvTZvkymK8j+
         ToAgOltD1+c5/OiBZlUGh4PszrxnUC7vw1VZfoBcgppzCLFHx7IIlwVk+7HxUPfa1P4t
         xRoPs/mbAtC+9fLTEmHq+ffARkyy1A3acKhMAIIAJJFOddEe2w0iBjMA+/frtAIUM1Lw
         j1uoU1DNxbRUwPkeOwQqc5N3mxrrkLU965pleBZCeafgwilsaBB4JALOf/rCbbOPHV5G
         6YXtyGMq0g20TwnQTKfWeYjx6+U6Be/KQobxlQnmc2lvhemaUYWwwU4922RH824Aqfii
         Sc8w==
X-Forwarded-Encrypted: i=1; AJvYcCUzJNtvgjqWG7vj+Gcxkc+EotTeFsjYNKFWtP33d34REZGXKmP1IPkWS2C+NUduqAJAYW5LJLTApIyY@vger.kernel.org, AJvYcCWGG7ZXzh7o6BsYb2BHyrQYOzil6K39pa5Trun3UsUeRmtOjNF1hNvhkUQ41lJlepS0+ICa1ver@vger.kernel.org, AJvYcCWd3CYl4KfWpJUaTPm5Zns/eQiOfmieu1iV37WOliX9FiB0Gm97UqkX9O3UW4MeCJY8rZzToOZtX9PsNfdA@vger.kernel.org, AJvYcCX7U27SNBqk2Fd29pu3B13/HKqIgY9jpgTKzwggT+f1ncOFM3/NlA4b2INY4Y+eCoWIP/td4lcRfHEzA+2ZmkF3c34=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzmz5SlUWMkDJYCi/EzZlKeAMV+fvgwpLqiizfyPmfr1DKEVcRp
	Dl7jRHURBO9Lc11gQ9WiyNSjNuhz3pwwDeqqLGlEp+d/Sh/VmXGF5Cu/V4vUgssV5zeD+1mwieJ
	7WZgvVx1PuPgw9Q0gn0MGQ/OgHko=
X-Gm-Gg: ASbGncvUT1QJ7a8sKUNOHisoSuX63OkmvIaWJMrCNVL0Ylavqq6xadgv7kQVt0FVmpN
	eVu2YpPhhqccT/0bnIRuQdbPmipO9PgJvGxTWmVaXHIyo2eQDaHHSFzvgijQ36zfQ6D7T4C5kpw
	C1+4Pv4yd64hLWE5Y7oYDtM8xQ1ONBaePiw/HFEcfT2TL+gJu5k98wxoknobQ=
X-Google-Smtp-Source: AGHT+IGR0AMVozaKhd3d0+u/7Mk9Kh42jmVI6oN8E+SFpT9ImqGjcRLWJZakpHMAF4QrZTBEa22qw9mn0qgtUBwRb90=
X-Received: by 2002:a05:6122:134a:b0:520:4fff:4c85 with SMTP id
 71dfb90a1353d-523f2813ad1mr3248565e0c.2.1741519523586; Sun, 09 Mar 2025
 04:25:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250308200921.1089980-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250308200921.1089980-4-prabhakar.mahadev-lad.rj@bp.renesas.com> <Z81WVNGlvRNW5JFk@shell.armlinux.org.uk>
In-Reply-To: <Z81WVNGlvRNW5JFk@shell.armlinux.org.uk>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Sun, 9 Mar 2025 11:24:57 +0000
X-Gm-Features: AQ5f1JrpW9tO2gRYmEY8YFwebspDqap5CdTH1LumhT26vH3pk-Q75QUajPA10Kw
Message-ID: <CA+V-a8stuYLJMA5UEKpyLpH1kcgEvA=b5BzUOEaCKcfNtdSSfg@mail.gmail.com>
Subject: Re: [PATCH net-next v2 3/3] net: stmmac: Add DWMAC glue layer for
 Renesas GBETH
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Russell,

Thank you for the review.

On Sun, Mar 9, 2025 at 8:50=E2=80=AFAM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> On Sat, Mar 08, 2025 at 08:09:21PM +0000, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add the DWMAC glue layer for the GBETH IP found in the Renesas RZ/V2H(P=
)
> > SoC.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v1->v2
> > - Dropped __initconst for renesas_gbeth_clks array
> > - Added clks_config callback
> > - Dropped STMMAC_FLAG_RX_CLK_RUNS_IN_LPI flag as this needs
> >   investigation.
>
> I thought you had got to the bottom of this, and it was a bug in your
> clock driver?
>
I have added a fix in the clock driver to ignore CLK_MON bits for
external clocks. The main reason for dropping this flag was despite
trying the below i.e. adding phy_eee_rx_clock_stop() just before
unregister_netdev() in stmmac_dvr_remove() still doesnt stop the Rx
clocks.

         if (ndev->phydev)
                 phy_eee_rx_clock_stop(ndev->phydev, false);

Note, on another platform where I can issue a reset to the PHY I
issued the reset after unbind operation and monitored the Rx clock
using CLK_MON and I noticed they reported  Rx clocks were OFF. But on
the current platform I cannot issue a reset to the PHY after unbind
operation.

> > + * The Rx and Tx clocks are supplied as follows for the GBETH IP.
> > + *
> > + *                         Rx / Tx
> > + *   -------+------------- on / off -------
> > + *          |
> > + *          |            Rx-180 / Tx-180
> > + *          +---- not ---- on / off -------
>
> Thanks for the diagram.
>
> > +struct renesas_gbeth {
> > +     struct device *dev;
> > +     void __iomem *regs;
> > +     unsigned int num_clks;
> > +     struct clk *clk_tx_i;
> > +     struct clk_bulk_data *clks;
> > +     struct reset_control *rstc;
> > +};
>
> If you stored a pointer to struct plat_stmmacenet_data, then you
> wouldn't need num_clks, clk_tx_i or clks. If you look at
> dwmac-dwc-qos-eth.c, I recently added a helper (dwc_eth_find_clk())
> which could be made generic.
>
> You can then include the clk_tx_i clock in the bulk clock, and
> use the helper to set plat_dat->clk_tx_i.
>
Thanks for the pointer, I'll switch to that.

> > +     plat_dat->flags |=3D STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY |
> > +                        STMMAC_FLAG_EN_TX_LPI_CLOCKGATING |
>
> Didn't I send you a patch that provides
> STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP so we can move towards the PHY
> saying whether it permits the TX clock to be disabled?
>
I'll rebase my changes on top of [0]. Do you want me to run any
specific tests for this?

[0] https://patchwork.kernel.org/project/netdevbpf/patch/E1trCPy-005jZf-Ou@=
rmk-PC.armlinux.org.uk/

Cheers,
Prabhakar

