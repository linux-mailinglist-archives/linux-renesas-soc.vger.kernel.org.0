Return-Path: <linux-renesas-soc+bounces-15939-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6AD1A8891E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Apr 2025 18:56:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7064F3A65D2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Apr 2025 16:56:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7489C288C83;
	Mon, 14 Apr 2025 16:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kaWWEpYQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C066E2749F1;
	Mon, 14 Apr 2025 16:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744649804; cv=none; b=RHgZpgkgE7pxrw05/MYJyMyDGJ9lDPDi+VKrbytT3+kuEaBNwq1aB4aQHMItBZ8RByDGNmf4iBtXXSrqug/c7g54DsDFUR0EpD4ggJyF8n6NbFF/NsTcS5YqVfGB6dU3dMOtIsr0bx8wsv4g9LY/xVno3rDI2GMx6PMuxJuMXbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744649804; c=relaxed/simple;
	bh=qioOoY3NHQQEpjtRQrFyHraXZimPdq715yX3nesHumU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UCx9+cf4CPk1AmjK6INsb/BTwLdjSs4cYQahULbDzpISDU5Cp0T0ZtfMh98OPaWn0JTlya9wa1Lv9lPDKoFs+CaNpxxFb7rjaTDYMK/CJbFwfuKZOgSItymLvjLlRKBbY0BE0ZDVis6iCH/hJAxWEDFebLXW8oHJNtUVmXEbWAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kaWWEpYQ; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-523ee30e0d4so1934687e0c.2;
        Mon, 14 Apr 2025 09:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744649802; x=1745254602; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=udtwR14oubKebFu5rW6k4e0weoZf4m2R815HfEK738g=;
        b=kaWWEpYQhxgz23204PRwltLHoYlmjo7Gnevh5hgbECXM+btr/A98eeCFw9TBK+ATA5
         KOxlwwJBYbgddanC/zZpm3HsSdhEH/j2pA251j9Lx2tuCXNpdng5JjMDd44PDtwK+nSx
         mLhAxf3alf2RHKiLbS5+2tcbl+Cx8be9LmaeUKS7DRnubX6lAA4tfI+zZ7VlN2bRpUPJ
         2mOxepn64fSGsrIOxpJPCv0ojZg4w8snJdm3WSSkXhhyeWux5CBNhELe8w/ugx2Ra7m3
         jmzqPt9FWHJyqQEbBw8+m+Fk54ySggp82+JUNpDj31uk75I0Cb/nuuNxAfOp5tEDJ3cK
         6ERQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744649802; x=1745254602;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=udtwR14oubKebFu5rW6k4e0weoZf4m2R815HfEK738g=;
        b=qRKXXPGTtYs1Hr8ia8XUKcSWwzIPENfAGlNB1GAp7MsndQhzQOd5TPwaJxFnEuJqhj
         vP5eq6PKGDiHNgWDHbIQgsfkIgbgJVpktnXgLJUKfgh5rgpJKtwlws7uwCdsw9K3ejWU
         o/wJW/g6UWZ0LS3OoIbDXqEp9QmoM2GUnxUhHo3HnbzMD1zpxKgh0LZmB4Ia+Ok+uuaG
         UaFXWHZweQhKzCDSKmVdtZwvBIovlMBHGmqjWnXnwh+wI6QAlPo7K0i2fHd63kMcePxz
         tJfU+M4FILe5eaUdqHqory4zJ+jJ+pNjaPPCj1Wmtv8qNHlxA5FIOUWxnypgac/vRh9x
         n2IA==
X-Forwarded-Encrypted: i=1; AJvYcCU2AcBMcs6GYmfOPlF6XoiOWaf8fiIQIMU0LvzSDaRV0mGbbmn0BtdmiZNXs2rj8Rmb2p3q8njZliREBUio@vger.kernel.org, AJvYcCUs2MHjTqaP78it1o/sVUch5ciDDnDpL+1UpXZAdvCbcu8L5rJwEzzCaIDnJheFej/hQfb1xLVq@vger.kernel.org, AJvYcCW1Ig5IQgxZWX1AUAE43zuzamjvLHAP7FedpAnQIlLRasGIJUr2s6DInTHlbg6keu/U4JcgIpLRG80W@vger.kernel.org, AJvYcCWysA9OOSwP5cv8nt8dKPzRWjuoqxrxAdEWkaBtf+p6rCU0vV33UPKOh03j3azinP4+EiUTGqVXPY21Fbv7eZZFolI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf2gz6dPE4tl9Ho7UMl7wMRrk2ymtQfB6QWbCuSaC8z7J8VOYt
	YCM4iBHou+oP1a0NGWTVx99S65AqLQq4i8r5ThEoMUnoYm5xtRqn0NH23JdZq/MdCrlfPsUfwIK
	oE2VAjraGyTzEqEBF01ZFh8QCvx8=
X-Gm-Gg: ASbGnctDoyBhr9uQJnB1JeVqKmvZxonE1Lt/UgkkdgFPyXXJfztPh2azmsxEdO6DDqh
	OZw20tY2PWOsR+IKkCYeDYilIrv7KLIc2u3FjoSOEdtXWaVvQaXfY13soECDUuvtnrQHUWbFbAS
	6u9USz7rAG/7HaXsyW94Sbe1FPTJgeXXo/siyiv6pSIVibE2FS/rpNiA==
X-Google-Smtp-Source: AGHT+IFQpsz/ji8MKcAuYh+qFnh6pm7Cs4klNHHbzk4kp5149hgyDeoWHHM5lEKz3qpRzffoQj33KxW8IfZk7jM+Cro=
X-Received: by 2002:a05:6122:209f:b0:50b:e9a5:cd7b with SMTP id
 71dfb90a1353d-527c35ae10cmr8117351e0c.9.1744649801573; Mon, 14 Apr 2025
 09:56:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407120317.127056-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250407120317.127056-4-prabhakar.mahadev-lad.rj@bp.renesas.com> <f20e6589-37d9-458b-af82-92fb1ed0db18@bp.renesas.com>
In-Reply-To: <f20e6589-37d9-458b-af82-92fb1ed0db18@bp.renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 14 Apr 2025 17:56:15 +0100
X-Gm-Features: ATxdqUHsvC58AXJcSX9DHfg067ybVtkBeQg9WB3LjBGtUZ7gtnbYUDxCu53XU_M
Message-ID: <CA+V-a8uho8xKikEmSQeDM4Qe5y0jaZfYE3vNc8qehb_NLHGJ6g@mail.gmail.com>
Subject: Re: [PATCH net-next v5 3/3] net: stmmac: Add DWMAC glue layer for
 Renesas GBETH
To: Paul Barker <paul.barker.ct@bp.renesas.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Richard Cochran <richardcochran@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Paul,

On Mon, Apr 14, 2025 at 2:13=E2=80=AFPM Paul Barker
<paul.barker.ct@bp.renesas.com> wrote:
>
> Hi Prabhakar,
>
> On 07/04/2025 13:03, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add the DWMAC glue layer for the GBETH IP found in the Renesas RZ/V2H(P=
)
> > SoC.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> [snip]
>
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c =
b/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
> > new file mode 100644
> > index 000000000000..a0f7cacea810
> > --- /dev/null
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
> > @@ -0,0 +1,165 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * dwmac-renesas-gbeth.c - DWMAC Specific Glue layer for Renesas GBETH
> > + *
> > + * The Rx and Tx clocks are supplied as follows for the GBETH IP.
> > + *
> > + *                         Rx / Tx
> > + *   -------+------------- on / off -------
> > + *          |
> > + *          |            Rx-180 / Tx-180
> > + *          +---- not ---- on / off -------
> > + *
> > + * Copyright (C) 2025 Renesas Electronics Corporation
> > + */
> > +
> > +#include <linux/clk.h>
> > +#include <linux/device.h>
> > +#include <linux/module.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/reset.h>
> > +
> > +#include "dwmac4.h"
>
> I'm looking at this while working on RZ/T2H Ethernet support, clangd
> says inclusion of dwmac4.h is not needed here and compilation succeeds
> with the include removed.
>
Agreed, I will drop this.

Cheers,
Prabhakar

