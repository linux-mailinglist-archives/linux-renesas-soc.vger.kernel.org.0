Return-Path: <linux-renesas-soc+bounces-24301-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D09EC3F039
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 07 Nov 2025 09:46:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 08DEF1882F2D
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Nov 2025 08:47:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 869F2225D6;
	Fri,  7 Nov 2025 08:46:51 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E381459FA
	for <linux-renesas-soc@vger.kernel.org>; Fri,  7 Nov 2025 08:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762505211; cv=none; b=K/LFXMaefhf0ViTQzsk3qQhpKNDlKD1rVOJLotAnjmCdAErZp7irMBgrxf41WH5v6uQkcndQkuk44Hx4wTnCiNsqUk1jhwio5WM6YiZvNMUPtS5t2UgXtCGvVKLHvqUjnjB0nOe8JGL+u/tuWUJBnp7gRdlvpMHA/yRdANVV9TY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762505211; c=relaxed/simple;
	bh=+Po0YDozkgmLf/sDK4Y8DM/Qe04V4LbnESG5YNdAjxg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GBpcSo5TL5UNgDcyedLSC9HkxwIRXy6O1nIepAmoNa8HU4kmsGowvwk268u60V0eUYT2sCmVBoDYNaQtnhTXDW7r0oRK4J31OaML7qoZBRIKbnfEr3Oh7XuctDdGQpkHihNY+9l359KbUAPM/gEKqArlzzJ/dmrpDhUx19Snbts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-89018e97232so116382241.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 07 Nov 2025 00:46:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762505209; x=1763110009;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rMtkd2FvKVGnCA2BS10Veme/f3vf2jyvZt81k2mdhBU=;
        b=AX4owUBmwLw/zy+U9xWna8hYvMnGw3xO+dk27Q7Y2h+awCDL0+ATGuHrLZuZ9dmUur
         4oTDgdPiADAXXVPXUVbz5WC4Jo5pnXbCn9sf/bJ7Ku6g7ODyrcfZ2pWxMZ3cnlOC/vZ5
         fdmFxZbaSZCmD76cdPuIsMP/X0Xs018eeS1uKSDI+laot3378+nIhD+MXcBcmrvk8tuZ
         VfInZuZbZvoe4W75yPddiUdP1vs7XVgLYfRpCxcdEbYyRKqz/Bw00jb923DRw6/6HzXh
         zkVeS6s9NTs4tHx7sTAFs9g0AaxHFK2mrmU1lc2MMU/PSe2Q+8qtpBCoJo6TBdlZlPhX
         1QWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLEviCRoOL/b2nyfViS6x3NKVaZDRyfDCkbuMMWWWwReF/4ppBEMTmukP0jnER/R7rTTSW1IUYil+1tO6thd+S3g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxUjyRmcan4z6+PMzEeYHhT0HgVzYSh4BRPYuRz9VkyEXYNP72r
	7GHsCXIAGOCLr1h0X99sm9yoiSfcFgFyZAoQZ1ZaZvpidMeiAu8lz1/7SbNxnBPpTdc=
X-Gm-Gg: ASbGnctIRWC+ADbFBJLr3hN4sTn+FTZnS/lfBoZh0E+FzcRQRrX8uqYLbe6Yz2hN4z3
	Gz0mioH/VgEeba994Tx8T0wN42L6siytOLfm2a59eO6e0/t4Ie2eqgZgjW43dOnMKEFj5J3wZt2
	t29FGb47W2LYxCddvSKBlQzP2rdeHPSQaILY1/DSXuwkmwSooIxW+r8ANF6M+k3sw9H4xi8Oz/d
	q39F7DYlB6sBZ7tpJOOm0xCqXV6PJ/DnIpbu9AsxYBy8lRyJw1cp8lLgEy+ydTLxENAz9Yq3OBM
	SKf1nKPumE0KmXVp62vbriq69rg9LNqztJYNWPigrFj3kooM2C2Gt+GwG7g1jKZx2I4kSXW9aN4
	5rVexnWvagsFFK23A0yHSmlFWrmpfimf7kmm5837+HSkk1seyNhTy+7EbCn+PBj4I1YV2zkzpUa
	CBu9k+B66ohDooursWm/j/vhWOd/aWpvNklmj32EdrGB1xpvVu
X-Google-Smtp-Source: AGHT+IFRPHUBAw4p+5Uj8QfUAxFt83cn9rKiqlraYv5l4AnoNGk2/l8FpdFVI/GqwQCdn67/Fq2CRQ==
X-Received: by 2002:a05:6102:304f:b0:5db:3bbf:8e62 with SMTP id ada2fe7eead31-5ddb20e76cdmr788763137.1.1762505208672;
        Fri, 07 Nov 2025 00:46:48 -0800 (PST)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-93708969b1fsm2152342241.11.2025.11.07.00.46.47
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Nov 2025 00:46:47 -0800 (PST)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-5dbe6be1ac5so202194137.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 07 Nov 2025 00:46:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVBwK2KUCq9zBPbHiQuY1BL96Cmz8Gbjw2xng8rERU3PyDldXQbuGxYzKylg9MdCm//X+ob7oqdCNr3D0zqpe1Ujw==@vger.kernel.org
X-Received: by 2002:a05:6102:f0a:b0:5d7:c6c1:8510 with SMTP id
 ada2fe7eead31-5ddb225654fmr655685137.27.1762505207057; Fri, 07 Nov 2025
 00:46:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251106211604.2766465-1-niklas.soderlund+renesas@ragnatech.se> <20251106211604.2766465-4-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20251106211604.2766465-4-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 7 Nov 2025 09:46:36 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUSdXy-Xw5+mG7YAGWQAqx-kSELkKVeiscj0H9pV8a3qw@mail.gmail.com>
X-Gm-Features: AWmQ_bn0v8yL5BXNbSnZRFWTp7_mCQfJIdZYA3WvNK0EfH1127ZUHgsG4Dr3bzk
Message-ID: <CAMuHMdUSdXy-Xw5+mG7YAGWQAqx-kSELkKVeiscj0H9pV8a3qw@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] clk: renesas: r8a779a0: Add ZG Core clock
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 6 Nov 2025 at 22:16, Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Describe the ZG Core clock needed to operate the PowerVR GPU.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>
> ---
> * Changes since v1
> - Change sort order of new entry in enum clk_ids.
> - Rework the clock to use CLK_TYPE_GEN4_Z.
> - Split addition of clock id to r8a779a0-cpg-mssr.h into separate patch.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.19.

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

