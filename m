Return-Path: <linux-renesas-soc+bounces-1560-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9511782D47F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jan 2024 08:21:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3FFFC281612
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jan 2024 07:21:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11E8263AC;
	Mon, 15 Jan 2024 07:21:25 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C59E5666
	for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Jan 2024 07:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-dbed179f0faso6472773276.1
        for <linux-renesas-soc@vger.kernel.org>; Sun, 14 Jan 2024 23:21:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705303280; x=1705908080;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Iy1WRocBiGEYgkjDWgMs2SoxlSoj3iqOOw56VqvSKaw=;
        b=fj4awzCeBONm6HbariA5y+vK7qiBDOr/nKwx9WRtkuoR0LAcNbA71IKaoqIA2Qd+D5
         c0oQ8LJQ9cWLUoljDpvr5jDnsKpsbJEXEtGh2d+/RcRn8x6dxbPD7GFxebJ/aBWdkomK
         hX4kKYgpJ9nYXfbmH98d68Ja/yvl/t2VPBi0+GJgvmMNFU1qZiClpAYHB93hG6yRijQp
         ZhqUdQa3p8WFP3NnqbCa/nlnfX43eUKIBu5GROUEnvRCkJnXvRxCEJS1bPN8Kh5GOry9
         LU8nPQaTqS2ettHVZ6Elo71hWGhtSfsntQjiYvlBeaVbH9cC7S5DUiXgXHYBSlEvKHY0
         rvSA==
X-Gm-Message-State: AOJu0YyIRBhYjweLNzJ0vOoC2vtr9Dg4KupDDmELJy09koEFadLbD5kC
	5JNT85e9CaCGkdkp+TtNf8e2u5Ph4g1cuA==
X-Google-Smtp-Source: AGHT+IGyiwxLfszxC28Upv+/HrHvdG5zS1SyWmS7FFHGPm/7ZiUtlHsMazdDP5VYXY9vWJ64GYTtKw==
X-Received: by 2002:a25:ac44:0:b0:dbd:b56e:f2e4 with SMTP id r4-20020a25ac44000000b00dbdb56ef2e4mr2729864ybd.39.1705303280010;
        Sun, 14 Jan 2024 23:21:20 -0800 (PST)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id d34-20020a253622000000b00dbdb03e146bsm3383308yba.51.2024.01.14.23.21.19
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Jan 2024 23:21:19 -0800 (PST)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-5e734251f48so65483807b3.1
        for <linux-renesas-soc@vger.kernel.org>; Sun, 14 Jan 2024 23:21:19 -0800 (PST)
X-Received: by 2002:a05:690c:c9e:b0:5ed:a981:fe65 with SMTP id
 cm30-20020a05690c0c9e00b005eda981fe65mr3098998ywb.26.1705303279264; Sun, 14
 Jan 2024 23:21:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87sf2ztoq4.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87sf2ztoq4.wl-kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 15 Jan 2024 08:21:07 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWOkL=AzLM0j8UqtNsvAMGPWQ-rU9vcA+NvG_9xDq3OGQ@mail.gmail.com>
Message-ID: <CAMuHMdWOkL=AzLM0j8UqtNsvAMGPWQ-rU9vcA+NvG_9xDq3OGQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: renesas_defconfig: add R-Car Gen4 PCIe
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Morimoto-san,

On Mon, Jan 15, 2024 at 1:38=E2=80=AFAM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> R-Car Gen4 is possible to use PCIe, this patch enables it.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thanks for your patch!

> --- a/arch/arm64/configs/renesas_defconfig
> +++ b/arch/arm64/configs/renesas_defconfig
> @@ -108,6 +108,8 @@ CONFIG_HOTPLUG_PCI=3Dy
>  CONFIG_PCI_HOST_GENERIC=3Dy
>  CONFIG_PCIE_RCAR_HOST=3Dy
>  CONFIG_PCIE_RCAR_EP=3Dy
> +CONFIG_PCIE_RCAR_GEN4_HOST=3Dy
> +CONFIG_PCIE_RCAR_GEN4_EP=3Dy
>  CONFIG_PCI_ENDPOINT=3Dy
>  CONFIG_PCI_ENDPOINT_CONFIGFS=3Dy
>  CONFIG_PCI_EPF_TEST=3Dy

These two options are already enabled, cfr.
https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git/com=
mit/?h=3Dtopic/renesas-defconfig&id=3D2588e66d6f71d0c96ce09e861e667284fd7a1=
a33

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

