Return-Path: <linux-renesas-soc+bounces-12600-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 29AEDA1DA94
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Jan 2025 17:30:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 716EF3A8508
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Jan 2025 16:30:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E62A14B075;
	Mon, 27 Jan 2025 16:30:21 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79EAD149C7D;
	Mon, 27 Jan 2025 16:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737995421; cv=none; b=PAHnLVrKI7pfl5UB4S2Xif+3rYnmFXNev2EulBaoA9THDpDBnCYuzxt8tZXkeBQbH7l1sL9ah20Rq/UbaBTxN6e+F28xrrc7TrTXhpOHSK2zXCCKEsRX8MJxdtZptUxtU2Y4TGRHp1tR4GyB+Ij5uayufvKoHZHwoFFSMqI/QnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737995421; c=relaxed/simple;
	bh=ZNKSmArHq89j7IClvTYDareVhIHdk3mFzoaiZMHUsD8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CVmZydBNPIsSdOyBr7+q/rsebiT7TUBNsu2+ohy0xVpVL3B0jvHfdZLBLirKrVvtvotyKz6JmJdXL3lceopt+MrDB7bWxFNMN7OP0kme3u+mOBr+CVWHS/n55QAmJoXb//ziyasyeumlJ8CEHWidMYo9yigiyjoGT/wwZ7zRR6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-860f0e91121so3089211241.0;
        Mon, 27 Jan 2025 08:30:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737995417; x=1738600217;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WlQ0Imi4TI1g2HJ/WhDlE3//wGfnD+n5Npq7eYW5xxc=;
        b=nvU412t1/nu/Jy62VvdqXF5ecnL04knImkBB8DlCjvezYJCjqPcNtX6uEVbERDnmTa
         9SksDUQKQh+TP1JEsY+ibtRjD9YBliFOBcGBLfb/k1KN3vEtTkOSYM3lgfRELqU/3kpA
         7wNIbmSy7+dPexUcgeRnBrop0FkCPkfu1oAUxIKs8na1L4KZ7sUldu3yiNEqZd9OPHbd
         pJvw8EPliwc/3OrOtKi6+PyONr9PGCYQCJaMqN6TvqoejkcdhobG/qUp7BGQ68VE6lkW
         xsn5J61KNeIrfgNlAhIEsGABslfjxxrF+7cTq1/9MzoxhuBbuaOIYGhI6AA5Io1x69Iy
         VOcA==
X-Forwarded-Encrypted: i=1; AJvYcCVivt6zL9ss5dGmCyNg9Xt5255KbYZd9dxsNA2sblszE481NnVVaUtGVSMJejZVLGN1gxVvfgw2vgY=@vger.kernel.org, AJvYcCWG2tRQ9KwlPZUV3kWjRrHjiCo1Hz3SDWrNfpN2eoXvWFYnFAlag3VUrV9YRVv3Ve63sO3ulwWbOdnyVKCnLHruSZM=@vger.kernel.org, AJvYcCWMnAGBTW716Abk3xChhXYJYJDZOrXTT5BaVydxHztABQME3QPkkUVTiQ/I2dqn1+wtncoXd37q8MlRNnXX@vger.kernel.org
X-Gm-Message-State: AOJu0YwApnmCLlaEQySUuM1dGkH3vmJ++s0ykcWYgCBsBx8cZC55o9ze
	umXk/cvHejohutmuK8ymJrMfsHcU2bHb6bLACbW/Kg8+6uEFjAczxAXvxGyD/FI=
X-Gm-Gg: ASbGncs2YCAChNG/zoCbvFVx64NdFQ6g7iTOhaqLm9SmVZLp+B4bgWAQ/3HW0DSnJF+
	vz5qgcZq/Gcmg0E5PrnzrZnayY/rQ2eG3sWd0YcoiyWoKmQSF0rwAYYzcgNDEipOCveQ3qruc/b
	bARkKtSwzn+BnM4cb3HqDUOoLvIwhRbEXMEGjMnR/oYjT/jKSPjoKbdgJahatMpeht8JFfkCfrv
	0FjuFMNcZmdjEVn8J43gAZkyQVe1VG1UX7tPegLLvnouD0gupjLiieKIU9qesnJb9WlGB9dUxfD
	77qVmqu9Dv6eZ/qVwrweNR1VK2DYQbF5Ig2R3ZGu+bo=
X-Google-Smtp-Source: AGHT+IEH+vpr10NLuPjO8zFdcMKU7b6BMEbovs/iPYVh/elcByX4ioSoC5/mtPyWV7l0xlYmaOYYJQ==
X-Received: by 2002:a05:6122:4001:b0:50d:4b8d:6750 with SMTP id 71dfb90a1353d-51e3ddbf001mr14916495e0c.1.1737995417209;
        Mon, 27 Jan 2025 08:30:17 -0800 (PST)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51e4ea72d8bsm1475211e0c.17.2025.01.27.08.30.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jan 2025 08:30:16 -0800 (PST)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-860af3331feso3145301241.1;
        Mon, 27 Jan 2025 08:30:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVut5AkfM8hpBy+RPdHMLLTka/QCpx58e3oohcipC7Wj+pH/mq5cxtFwltnA5i8b/FvDI7X+IGinl4zB7//@vger.kernel.org, AJvYcCVwEnwFj0TJrrW/sqAEyqHNXNkIFrd4iRqrKuQE/La5G/dsB/pcxZB2xzmm1fJi0zV/AJPssJEsBD4=@vger.kernel.org, AJvYcCW6X3J2ARoru1S9pFJYihurKZVgFCO0hpRx2Mm7VsAxoM9ypAs+KvF//yndIS110U2WKeNviFESXj6UdhTLTOHmZ9U=@vger.kernel.org
X-Received: by 2002:a05:6122:2028:b0:515:20e6:7861 with SMTP id
 71dfb90a1353d-51e4fb68a06mr12748400e0c.2.1737995415897; Mon, 27 Jan 2025
 08:30:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250127-pm_ata-v1-0-f8f50c821a2a@gmail.com>
In-Reply-To: <20250127-pm_ata-v1-0-f8f50c821a2a@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 27 Jan 2025 17:30:04 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV7GwMNm5tYvWugehstM07W9JkLdKrE9hwPhxcEab8ajA@mail.gmail.com>
X-Gm-Features: AWEUYZmGy-5V1Zbo64bUIwl2HUW8rq3_GydwTJUAoMljjyEePEDEnt0EQDD7GTM
Message-ID: <CAMuHMdV7GwMNm5tYvWugehstM07W9JkLdKrE9hwPhxcEab8ajA@mail.gmail.com>
Subject: Re: [RFC PATCH 00/14] AHCI power management cleanup
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
> Several AHCI drivers expose suspend/resume functions in a way that can
> be simplified.  Using pre-processor operation can lead to errors, while
> relying on automatic kernel configuration is safer.  It also shrinks the
> kernel size when CONFIG_PM_SLEEP is not used[1].

m68k/allyesconfig:

drivers/ata/sata_highbank.c: In function =E2=80=98ahci_highbank_suspend=E2=
=80=99:
drivers/ata/sata_highbank.c:590:9: error: implicit declaration of
function =E2=80=98ata_host_suspend=E2=80=99; did you mean =E2=80=98ata_sas_=
port_suspend=E2=80=99?
[-Werror=3Dimplicit-function-declaration]
drivers/ata/sata_highbank.c: In function =E2=80=98ahci_highbank_resume=E2=
=80=99:
drivers/ata/sata_highbank.c:607:9: error: implicit declaration of
function =E2=80=98ata_host_resume=E2=80=99; did you mean =E2=80=98ahci_port=
_resume=E2=80=99?
[-Werror=3Dimplicit-function-declaration]
drivers/ata/pata_arasan_cf.c: In function =E2=80=98arasan_cf_suspend=E2=80=
=99:
drivers/ata/pata_arasan_cf.c:938:9: error: implicit declaration of
function =E2=80=98ata_host_suspend=E2=80=99; did you mean =E2=80=98ata_sas_=
port_suspend=E2=80=99?
[-Werror=3Dimplicit-function-declaration]
drivers/ata/pata_arasan_cf.c: In function =E2=80=98arasan_cf_resume=E2=80=
=99:
drivers/ata/pata_arasan_cf.c:948:9: error: implicit declaration of
function =E2=80=98ata_host_resume=E2=80=99; did you mean =E2=80=98sata_link=
_resume=E2=80=99?
[-Werror=3Dimplicit-function-declaration]
drivers/ata/sata_rcar.c: In function =E2=80=98sata_rcar_suspend=E2=80=99:
drivers/ata/sata_rcar.c:936:9: error: implicit declaration of function
=E2=80=98ata_host_suspend=E2=80=99; did you mean =E2=80=98sata_rcar_suspend=
=E2=80=99?
[-Werror=3Dimplicit-function-declaration]
drivers/ata/sata_rcar.c: In function =E2=80=98sata_rcar_resume=E2=80=99:
drivers/ata/sata_rcar.c:973:9: error: implicit declaration of function
=E2=80=98ata_host_resume=E2=80=99; did you mean =E2=80=98sata_rcar_resume=
=E2=80=99?
[-Werror=3Dimplicit-function-declaration]
drivers/ata/pata_imx.c: In function =E2=80=98pata_imx_suspend=E2=80=99:
drivers/ata/pata_imx.c:209:9: error: implicit declaration of function
=E2=80=98ata_host_suspend=E2=80=99; did you mean =E2=80=98pata_imx_suspend=
=E2=80=99?
[-Werror=3Dimplicit-function-declaration]
drivers/ata/pata_imx.c: In function =E2=80=98pata_imx_resume=E2=80=99:
drivers/ata/pata_imx.c:232:9: error: implicit declaration of function
=E2=80=98ata_host_resume=E2=80=99; did you mean =E2=80=98pata_imx_resume=E2=
=80=99?
[-Werror=3Dimplicit-function-declaration]

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

