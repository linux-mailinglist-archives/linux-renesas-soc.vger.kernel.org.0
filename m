Return-Path: <linux-renesas-soc+bounces-14034-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D78FA50D6C
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Mar 2025 22:28:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 13676162F05
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Mar 2025 21:28:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA6232010FD;
	Wed,  5 Mar 2025 21:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UJHcff8L"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A4F81FECAD;
	Wed,  5 Mar 2025 21:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741210032; cv=none; b=Qp5Wqy96oS2sOyLxT20vzfr6zCyLbSGMZHo1wcW2VOJMFUUCFfVeS4P8WVLE4KOoVZzutdiIqtXj1WsYqGl4KCvOMjs9oQWfvqdXz/4sTx30JSXr6kkvb4MM0swAHDGqbZKcffbXT9Hv4sNgfcNjMYdegH5p21Hw7tp8fNfpBRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741210032; c=relaxed/simple;
	bh=PhaJRjhXTia/31/igdR5xSfZGqsYBRautCEdMaEAmbY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YJhqdhi2nJ+mGd26ZJYxgC3k349679Als+lURNKElefb4sRCdWS0eFkDfuf0VY08ALF5DxQmlp2j0xAycNi4KUApDJnnmOepcPlCiJZaXg0C9TFyHNiZjCAKvMVJi4CH1yAlSsRtyvrEg4dNnePbKgE0FX4V6NbRIRvYX6ZepHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UJHcff8L; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-523a00c9d96so1572606e0c.3;
        Wed, 05 Mar 2025 13:27:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741210030; x=1741814830; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I+98tD0cuYY4ODUibk9ngfQh4l68coG0LYUx4ftM0EE=;
        b=UJHcff8LFG8rP4hIrLHEqVnI+dptYP8bfP/vmVDtsSim3nd11wfvpw31Xjb9BoI+ul
         4/VkaOjLKkClUohtLa39yj6H2sjK/shqbzHj4a6C9Ydzr9jBMc/PfChw0wckebfb/PQE
         WmzdsNAzO+ToMom7j6itdqJY9H33tJb10MmQhQaej0erf8Drz3ANGzRQ2ijQ/Sa+l9jq
         gT5kcsbXBqS3fAeG5Gkj2Jk/TUOZuy5yxaFbQItPpoAq0I0OmPvqkOUEHQCIejccdGRi
         5nBgfW9Q1/a2QG6RATZsNLgC/JVVOsYoY+ikavfDp1uS39W51O39xrKdavXEuF1yqVrM
         eaRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741210030; x=1741814830;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I+98tD0cuYY4ODUibk9ngfQh4l68coG0LYUx4ftM0EE=;
        b=VXemPobNHVrJU0xql+6MrUSa4IHAkBAahX1gz/U4HJvkr3TeFffDywcMJoaRY6Ew+Z
         HFaouA4Sh+Pjlom1kqyoIKTAzVDEBzHuLd/TBtOrhvUApzTZd8IM0v4IXr60tHhLGmXQ
         v9W27Ul3P+FeQWgk52EgzGIDuJ3HuDLZFGCaE8kOOcOSZtsGZA9WoKGePgYXv4W8R1hv
         sypBpfXAuC7jjDCn+ePLq5nbB+zXgdA6EFNKwoh+7kBsmrz6WkPok5RMpCMvJzJwPEpH
         Dov3r0nBDVf11V0/5f8guzXEvY6Q4z1sAm2u18pQEwj0rEaS8WjakDmfVHgoo636Sj+x
         cStg==
X-Forwarded-Encrypted: i=1; AJvYcCULPoXEE0CyPTdmvtRtNfJ/17mnmoarRJqEDXiMdkph5BL9rBz9b5c21j7NAtd+/7UgNh9LV39t@vger.kernel.org, AJvYcCW8KUAV9YTBPE5qTQ8r5rbunpaXmlFyC2yb21bX0AvtQ91/hPOEz8WBb4DHvIBBJntcu77cYQcvzHl/@vger.kernel.org, AJvYcCX6X74EYaGfrDcm3YYpt4b+vYe8Bv07ETEJB8BOr+SBMP5oEGCfCr0rkGSe7vAN9Z2hNLgvvCUOTypVlnaD@vger.kernel.org, AJvYcCXBj8qATHv50e6y3hBmv3JYn1jsH3c4+0n2qJj3vrvikdG1SJJGONCXXoxaBN6B7gsbqQvOJrhJgWjYtfHP/J1a6KI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFgc6QmhsYmWff7fDtNuXqRs0NRrOXxbqUQyr+bLrBI7ySvbGd
	N83oW1dnBsUr3qQLeQ4mEDdirfcGK5/P95kxNjNIKIKQTIjS0TPuOAUQChrc5vXXMPLRsffLKdn
	nwL7Jv71ixBKf91Uk8QqCt/YVSfQ=
X-Gm-Gg: ASbGnctgPHq/1xwKet/BTL+zluiisvbKtoOcUascD9Qb3P5SR/0SIbUWd6agq4ojsRM
	tEgUSc2AFX2ZxZluvhcxRXolSJp1idwaA4+KYkkm1LjtE6VgMqvuJpdhX+O7d3sxXKFY5d2NLCM
	BBuI7pS+rp1TPFJff9FIlZk38hp6ybhGQVc7IQ5XRKFdQlAhF9hml3k3Pr
X-Google-Smtp-Source: AGHT+IG+ssz8FQgtSEFpj68TfVKRRDwsRKLtaniWwvYX4uzkub5u7gIJBnmTedw7RHTEnRoOrSctVHagmxmrPgX51wQ=
X-Received: by 2002:a05:6122:1d90:b0:520:652b:ce18 with SMTP id
 71dfb90a1353d-523c5fc2509mr2685539e0c.0.1741210029676; Wed, 05 Mar 2025
 13:27:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250302181808.728734-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250302181808.728734-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <Z8SydsdDsZfdrdbE@shell.armlinux.org.uk> <CA+V-a8vCB7nP=tsv4UkOwODSs-9hiG-PxN6cpihfvwjq2itAHg@mail.gmail.com>
 <Z8TRQX2eaNzXOzV0@shell.armlinux.org.uk> <CA+V-a8vykhxqP30iTwN6yrqDgT8YRVE_MadjiTFp653rHVqMNg@mail.gmail.com>
 <Z8WQJQo5kW9QV-wV@shell.armlinux.org.uk> <CA+V-a8vCqxCaB_UEf-Ysg3biu5VoQ2_0OxWnN97Mdee9Op3YDA@mail.gmail.com>
 <Z8XZh9nvX3yrE6wB@shell.armlinux.org.uk>
In-Reply-To: <Z8XZh9nvX3yrE6wB@shell.armlinux.org.uk>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 5 Mar 2025 21:26:43 +0000
X-Gm-Features: AQ5f1JrYTl1BIFJJ-_uY68HuzF6JPMtZUlKlO51FHftq2VbLqpLJwTJpSuwf9OI
Message-ID: <CA+V-a8teuTznxBE2_LqqQcqRgQu1saAMuOUST8jFLFFTALqUMw@mail.gmail.com>
Subject: Re: [PATCH 3/3] net: stmmac: Add DWMAC glue layer for Renesas GBETH
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

On Mon, Mar 3, 2025 at 4:32=E2=80=AFPM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> On Mon, Mar 03, 2025 at 04:04:55PM +0000, Lad, Prabhakar wrote:
> > Hi Russell,
> >
> > On Mon, Mar 3, 2025 at 11:19=E2=80=AFAM Russell King (Oracle)
> > <linux@armlinux.org.uk> wrote:
> > > I would like to get to the bottom of why this fails for module remova=
l/
> > > insertion, but not for admistratively down/upping the interface.
> > >
> > > Removal of your module will unregister the netdev, and part of that
> > > work will bring the netdev administratively down. When re-inserting
> > > the module, that will trigger various userspace events, and it will
> > > be userspace bringing the network interface(s) back up. This should
> > > be no different from administratively down/upping the interface but
> > > it seems you get different behaviour.
> > >
> > > I'd like to understand why that is, because at the moment I'm wonderi=
ng
> > > whether my patches that address the suspend/resume need further work
> > > before I send them - but in order to assess that, I need to work out
> > > why your issue only seems to occur in the module removal/insertion
> > > and not down/up as well as I'd expect.
> > >
> > > Please could you investigate this?
> > >
> > Sure I will look into this. Just wanted to check on your platform does
> > unload/load work OK? Also do you know any specific reason why DMA
> > reset could be failing so that I can look at it closer.
>
> It may be surprising, but I do not have stmmac hardware (although
> there is some I might be able to use, it's rather complicated so I
> haven't investigated that.) However, there's a lot of past history
> here, because stmmac has been painful for me as phylink maintainer.
> Consequently, I'm now taking a more active role in this driver,
> cleaning it up and fixing some of the stuff it's got wrong.
>
> That said, NVidia are in the process of arranging hardware for me.
>
> You are not the first to encounter reset failures, and this has always
> come down to clocks that aren't running.
>
> The DWMAC core is documented as requiring *all* clocks for each part of
> the core to be running in order for software reset to complete. If any
> clock is stopped, then reset will fail. That includes the clk_rx_i /
> clk_rx_180_i signals that come from the ethernet PHY's receive clock.
>
I did investigate on these lines:

1] With my current patch series I have the below in remove callback

+static void renesas_gbeth_remove(struct platform_device *pdev)
+{
+       struct renesas_gbeth *gbeth =3D get_stmmac_bsp_priv(&pdev->dev);
+
+       stmmac_dvr_remove(&pdev->dev);
+
+       clk_bulk_disable_unprepare(gbeth->num_clks, gbeth->clks);
+}

After dumping the CLK registers I found out that the Rx and Rx-180 CLK
never got turned OFF after unbind.

2] I replaced the remove callback with below ie first turn OFF
Tx-180/Rx/Rx-180 clocks

+static void renesas_gbeth_remove(struct platform_device *pdev)
+{
+       struct renesas_gbeth *gbeth =3D get_stmmac_bsp_priv(&pdev->dev);
+
+       clk_bulk_disable_unprepare(gbeth->num_clks, gbeth->clks);
+
+      stmmac_dvr_remove(&pdev->dev);
+}

After dumping the CLK registers I confirmed all the clocks were OFF
(CSR/PCLK/Tx/Tx-180/Rx/Rx-180) after unbind operation. Now when I do a
bind operation Rx clock fails to enable, which is probably because the
PHY is not providing any clock.

> However, PHYs that have negotiated EEE are permitted to stop their
> receive clock, which can be enabled by an appropriate control bit.
> phy_eee_rx_clock_stop() manipulates that bit. stmmac has in most
> cases permitted the PHY to stop its receive clock.
>
You mean phy_eee_rx_clock_stop() is the one which tells the PHY to
disable the Rx clocks? Actually I tried the below hunk with this as
well the Rx clock fails to be turned ON after unbind/bind operation.

diff --git a/drivers/net/phy/phy.c b/drivers/net/phy/phy.c
index 0ba434104f5b..e16f4a6f5715 100644
--- a/drivers/net/phy/phy.c
+++ b/drivers/net/phy/phy.c
@@ -1756,6 +1756,7 @@ EXPORT_SYMBOL_GPL(phy_eee_tx_clock_stop_capable);
  */
 int phy_eee_rx_clock_stop(struct phy_device *phydev, bool clk_stop_enable)
 {
+       return 0;
        int ret;

        /* Configure the PHY to stop receiving xMII



> NVidia have been a recent victim of this - it is desirable to allow
> receive clock stop, but there hasn't been the APIs in the kernel
> to allow MAC drivers to re-enable the clock when they need it.
>
> Up until now, I had thought this was just a suspend/resume issue
> (which is NVidia's reported case). Your testing suggests that it is
> more widespread than that.
>
> While I've been waiting to hear from you, I've prepared some patches
> that change the solution that I proposed for NVidia (currently on top
> of that patch set).
>
I tried your latest patches [0], this didnt resolve the issue.
(Actually there was a build problem with the patch I fixed it below
hunk)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 9a62808cf935..21cdea4aec9a 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -2609,7 +2609,7 @@ void phylink_rx_clk_stop_block(struct phylink *pl)
         * function has been called and clock-stop was previously enabled.
         */
        if (pl->mac_rx_clk_stop_blocked++ =3D=3D 0 &&
-           pl->mac_supports_eee_ops && pl->phydev)
+           pl->mac_supports_eee_ops && pl->phydev &&
            pl->config->eee_rx_clk_stop_enable)
                phy_eee_rx_clock_stop(pl->phydev, false);
 }


[0] https://lore.kernel.org/all/Z8bbnSG67rqTj0pH@shell.armlinux.org.uk/

> However, before I proceed with them, I need you to get to the bottom
> of why:
>
> # ip li set dev $if down
> # ip li set dev $if up
>
> doesn't trigger it, but removing and re-inserting the module does.
>
Doing the above does not turn OFF/ON all the clocks. Looking at the
dump from the CLK driver on my platform only stmmaceth and pclk are
the clocks which get toggled and rest remain ON. Note Im not sure if
the PHY is disabling the Rx clocks when I run ip li set dev $if down I
cannot scope that pin on the board.

Please let me know if you have any pointers for me to look further
into this issue.

Cheers,
Prabhakar

