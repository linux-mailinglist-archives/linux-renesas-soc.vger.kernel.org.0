Return-Path: <linux-renesas-soc+bounces-12589-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A28CEA1D716
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Jan 2025 14:45:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B200C18860D2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Jan 2025 13:45:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7A051FDE12;
	Mon, 27 Jan 2025 13:45:37 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A207C8C11;
	Mon, 27 Jan 2025 13:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737985537; cv=none; b=DsLhJvMzp1RxqBTO66nolIgOEEiv/nfoS6I/VBaR9tP0s4D97BmMDTop1th6ICwFXeDgGVNyh/dtwP4JbAbEyona2ebAaw1Zj5zkPWLcBqBTSxxBNfRNMrSOOJYfydHBmlyvp4TrSkBkLYiq9b7WXlaCUGkUAOhttMWWsfTJi3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737985537; c=relaxed/simple;
	bh=Vori4fip27Sc4/LH5rLLdMAGOebUrJz0cFz2ndYAD/A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o7e+2nSf4LxdCtI1KS2V129zxyIEPoOUjYVc+TiWhq4euDJTPJV+50SAQOTAcv8qIAytcpv2AnWaU0qiCG3yMfieeoyuaOoOpOB6TWFlV7b+3xqFUXROlnMr117WpW6lOkk//tqBzEilOrORWcAr3ZIKUQdoxDIvcoDn/eDVOWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-51cee9d5013so2812441e0c.3;
        Mon, 27 Jan 2025 05:45:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737985533; x=1738590333;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ezeJexvLdIAOyqaTRkV2GqCEVD2bATElU5AWxdy7c60=;
        b=f0laDnKnX8zZ/ShwdjpnuA4QaHBYrOY9JQxMDHbUaCNjkwvtvhEtJC7lsOcDeEv2Rp
         8U598KgoJvscnIzm3IzZcrPcWVcCyFtW+u9nqjOGt4aBu6NqazWWQTG7CShgJLyfzg1s
         J4pllMFbZKHncnECaJ1KmsIu37oBsjTl3mwoX584hl/eh4TjiZj2zIEhqmu0RcPtZ0b6
         7IkONoqarBQQgkbSlhK6JIbcsgFx3asa/QRNpfqKqpxNzcADTriwzePihar0vFRhjZqq
         62peGn4Wka+eQMrgBmLW6LtUW8PfOVAGHZ1oTELtdJCIYBGOUoWLskVbAousH0rmaArB
         7R7w==
X-Forwarded-Encrypted: i=1; AJvYcCUXEMGjUC9AILOcBXWXB30mWwjjwmsciQiWJujoSvsjfoMVxuPQ4QjFWJHYWzIX3Do/bx8Ag5LyWGBpI0FD@vger.kernel.org, AJvYcCVvb3UeWkmcqS9axnuvpXEGonAE4XrBGDtT7BzV6Ilha2IBLZaQapIKgcRd7qOZnIgjIxbObkU4GVGamrsY20ovK7c=@vger.kernel.org, AJvYcCX4p1pCzv4EqI7zdLo6ungRx3wO+65n6XXFbeZUuNPOMS18YW9XqqOLKukiP5/nAUkPjm4NSZooRek=@vger.kernel.org
X-Gm-Message-State: AOJu0YxyG4xSxHW1D6Fae8YgisIsveOTCLGhdQo7PHVdlKFhZsG8ZN8i
	QP3XTaLWLcnTcuYCL5KTo1gXOCmde80Sz23YtBKYmPMyPtqevyZSwZBamzGHWdc=
X-Gm-Gg: ASbGnctDav4Z0iUakMNvrtKDNuypFQAQ6TwyVOm3urrnyl3NV4qP3e6ZWpwy+8M4Fvr
	6OLaTDdNOaCUjP5XIBUVZsXrWdTjCDyCQJ7FqgV4UXk3Q/d5PVEtgE0oFfv/vVWoX1uKqbAkXrs
	6zyGp08bG48BbfhTUYJ6j3l5nBxdsGgCAmlXr6eZmvRupcklFALwtmPbCmZFev/ebNYzaYzLirW
	6y8I4b1bXYZCnOGlzPCVGdZHJNn3ngvX0d3z6Fb9Y0aY3Xt/9oiqUC9srtyHjyWUGMDh6xN8Si8
	1/006GapNAzlRWZVUDuem8uOHimk/UYeXYDIidAFqw4=
X-Google-Smtp-Source: AGHT+IEh7bvsOT4hxnvlawCGnNyczQ/xXxOf6GDW+xbZdhVz8VeZDM4wNH/S039UXQ7BROJpxk5sLg==
X-Received: by 2002:a05:6122:2105:b0:51b:8949:c9a8 with SMTP id 71dfb90a1353d-51d5b33f5d8mr35244742e0c.9.1737985532869;
        Mon, 27 Jan 2025 05:45:32 -0800 (PST)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51e4ebbd992sm1403441e0c.34.2025.01.27.05.45.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jan 2025 05:45:31 -0800 (PST)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-4afdf300d07so2581898137.3;
        Mon, 27 Jan 2025 05:45:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWBqpoc+45ObCUVMeEcC4+fNEnSUgcXalh1HdHauHIH+560KKE9Q2+g3/jNQP7Pj8f9s8YNzzMNNhg=@vger.kernel.org, AJvYcCX8ucbl2JrBbSNz0BXcsl/k0e6vhUCDXcCinleDUaGb3Dvfho0ob5Ui/m6rPOPxc4etlrY0JKnLFUExYiFa@vger.kernel.org, AJvYcCXhwIPcq244Bljfy+M0e/pwaPiyVfnQxSKxmmQWWkLdemn/eAk5jYTZQSxiGXKRloyT0alo3xzrV1ISyRY9110yth8=@vger.kernel.org
X-Received: by 2002:a05:6102:a4a:b0:4b1:1b07:f7c3 with SMTP id
 ada2fe7eead31-4b690c77e0dmr34279786137.20.1737985531453; Mon, 27 Jan 2025
 05:45:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250127-pm_ata-v1-0-f8f50c821a2a@gmail.com> <20250127-pm_ata-v1-14-f8f50c821a2a@gmail.com>
In-Reply-To: <20250127-pm_ata-v1-14-f8f50c821a2a@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 27 Jan 2025 14:45:19 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWdXNB=ijpWHWY5HgwJw8yw4jk9Bnmez-8MLzGRCQrXdg@mail.gmail.com>
X-Gm-Features: AWEUYZlEDDkC64B3GghXYxN7ZaYz24mUqfziFlSmlvrKqtJLvKHGpws7NZJvNqU
Message-ID: <CAMuHMdWdXNB=ijpWHWY5HgwJw8yw4jk9Bnmez-8MLzGRCQrXdg@mail.gmail.com>
Subject: Re: [PATCH RFC 14/14] ahci: sata_rcar: Switch from CONFIG_PM_SLEEP
 guards to pm_sleep_ptr()
To: Raphael Gallais-Pou <rgallaispou@gmail.com>
Cc: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Hans de Goede <hdegoede@redhat.com>, Patrice Chotard <patrice.chotard@foss.st.com>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Viresh Kumar <vireshk@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-ide@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Raphael,

On Mon, 27 Jan 2025 at 13:46, Raphael Gallais-Pou <rgallaispou@gmail.com> w=
rote:
> Letting the compiler remove these functions when the kernel is built
> without CONFIG_PM_SLEEP support is simpler and less error prone than the
> use of #ifdef based kernel configuration guards.
>
> Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>

Thanks for your patch!

The subsystem prefix is "ata", not "ahci" (not all ATA-drivers are
AHCI-drivers).

> --- a/drivers/ata/sata_rcar.c
> +++ b/drivers/ata/sata_rcar.c
> @@ -927,7 +927,6 @@ static void sata_rcar_remove(struct platform_device *=
pdev)
>         pm_runtime_disable(&pdev->dev);
>  }
>
> -#ifdef CONFIG_PM_SLEEP
>  static int sata_rcar_suspend(struct device *dev)
>  {
>         struct ata_host *host =3D dev_get_drvdata(dev);
> @@ -1005,7 +1004,6 @@ static const struct dev_pm_ops sata_rcar_pm_ops =3D=
 {
>         .poweroff       =3D sata_rcar_suspend,
>         .restore        =3D sata_rcar_restore,
>  };
> -#endif

If CONFIG_PM_SLEEP is disabled (e.g. m68k allyesconfig):

    drivers/ata/sata_rcar.c: In function =E2=80=98sata_rcar_suspend=E2=80=
=99:
    drivers/ata/sata_rcar.c:936:9: error: implicit declaration of
function =E2=80=98ata_host_suspend=E2=80=99; did you mean =E2=80=98sata_rca=
r_suspend=E2=80=99?
[-Werror=3Dimplicit-function-declaration]
      936 |         ata_host_suspend(host, PMSG_SUSPEND);
          |         ^~~~~~~~~~~~~~~~
          |         sata_rcar_suspend
    drivers/ata/sata_rcar.c: In function =E2=80=98sata_rcar_resume=E2=80=99=
:
    drivers/ata/sata_rcar.c:973:9: error: implicit declaration of
function =E2=80=98ata_host_resume=E2=80=99; did you mean =E2=80=98sata_rcar=
_resume=E2=80=99?
[-Werror=3Dimplicit-function-declaration]
      973 |         ata_host_resume(host);
          |         ^~~~~~~~~~~~~~~
          |         sata_rcar_resume

>
>  static struct platform_driver sata_rcar_driver =3D {
>         .probe          =3D sata_rcar_probe,
> @@ -1013,9 +1011,7 @@ static struct platform_driver sata_rcar_driver =3D =
{
>         .driver =3D {
>                 .name           =3D DRV_NAME,
>                 .of_match_table =3D sata_rcar_match,
> -#ifdef CONFIG_PM_SLEEP
> -               .pm             =3D &sata_rcar_pm_ops,
> -#endif
> +               .pm             =3D pm_sleep_ptr(&sata_rcar_pm_ops),
>         },
>  };

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

