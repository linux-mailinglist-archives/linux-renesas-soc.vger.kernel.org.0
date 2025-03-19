Return-Path: <linux-renesas-soc+bounces-14645-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 045DDA6983C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Mar 2025 19:42:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 30C8119C2D48
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Mar 2025 18:42:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44A0C20DD63;
	Wed, 19 Mar 2025 18:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ld5MSFqs"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A3820D519;
	Wed, 19 Mar 2025 18:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742409736; cv=none; b=g4bBUyHcUTC/ziLkV8AkM1mlSlM1aQkyQk2B6s4thaUcPuZv9DrJ73yDkqKkRM1Xien/dFL79rpK8CBK0Hf2d7JyxBzNzLSzkIvhEjrcbtJSnpqfAlthQDIMbU75HfXpLok8t9eoCaYa8fDiIALAosY5X0yDz3eRGDvLUgRgfvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742409736; c=relaxed/simple;
	bh=I8TM6U4W8E1iammAjKzrmGqfsegq1HYaLtvp0NJi83M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FKLdak/2FJCkcBZ5FzAi8JIegNl2IISgpwlrp/rEHjLyL08AQkgF6xYGXWwF0tAGon6SkNl5aMjC6OLs+Uotx1ItADCO8ehzLVcCyaMUQfRW4LcOkA9ki3lwjDjZ7Y2Cl3kJ/Z2qa6AsA/iUeY6LVVn+930yDFw4SBfHxu5IrMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ld5MSFqs; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-523de5611a3so2774487e0c.1;
        Wed, 19 Mar 2025 11:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742409733; x=1743014533; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hP+M6BjbnhzzbbapwY22IG+UhaXnw6zzi5Vog24T5U4=;
        b=ld5MSFqszmSA1qTSs+T2HJOf2JKcNJmW3xvek14f3XvphNFqkHzfIXfAwK8VnyVGqU
         wlusAmrCZig+34xEW2bia8jisK7G77vd5O23aMMUR5S8LsTvoUgZd2o7uFgKs2ZFUk6N
         WJVO0Blu3kfLwkRsGwOy/+zbxGICAKUnosj9QX+G++KhXvWhLNZWwTrqYI5jv1NKAOW/
         0wgP8MjXGCFCEYivp4nhk3kt/oYWKEa2aWtCWM7rfq4sg6zdm5bjvdirNeX8lDdYfQW4
         +KY0I4lsewxDfRRCgLR1fTcEd3sL2fQvvyU2cO4UmcE3cwkaij373gqw7IZV+LmyQdLK
         hS4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742409733; x=1743014533;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hP+M6BjbnhzzbbapwY22IG+UhaXnw6zzi5Vog24T5U4=;
        b=hZkhqNATW2UQ83ju4b9PAl5NQ1OPZDYW8uA3hKykhS3Fxa1Gzkq7S+cGbJ10BmzBkH
         9Hl5pBjYBW61YfIuJzw+gJ+6pWcZDeOLHJQ3/0dm9RvPB2OxwLPYnGNPjC480a7b7a35
         EUdohq6DU0De/xG1/Z6U5RpbglQhH8fC99MN3NhCvBW3nQfW7FBU4QNLNjDnZl+FVsE9
         HTsGFoo2OWuGKb2D96w05b7u11zYlUyQyFvr9yfV8lUNxHrs5JBIWbVs9bSh1UgUuJ+0
         fA4rCaHB7sGWuGyVgU9c4jN3QMBC1xdW+J8+zhmSHgrM9bDf7s2Rr3l+JZg1gBKjzA8j
         bGcA==
X-Forwarded-Encrypted: i=1; AJvYcCU6OnUiaYHCVcYWA/e541NF9CX9JICJR5RT1iGX6zrNu3vASrYUmooAdcxDVxc7vmtJWH2KgnLx4DcgMBgo@vger.kernel.org, AJvYcCUsCgZvu6wBqEaqc6ziViaFjVFS/G2420PC/gTO+5HgCrtz2Rlll7fvD4dmi4Fxzt06c2+kHyWWxpYEl4EMSVIQ59I=@vger.kernel.org, AJvYcCUtqWhYD5xXLuJadofqV6YV1UFNhDlc7CvNAi+dVZ7MA4NEEyUbBY4C4fzWzjGDvEScRXg7zwrU33lr@vger.kernel.org, AJvYcCV6b7ta921hkIXB83ViKKmLQwOwxJWtRFMWQeoQRx5pz9KO0TZmBxhCvIydcczMf8PWR8K6TTuY@vger.kernel.org
X-Gm-Message-State: AOJu0YyuGdrec1T7p5tx1gHSmVVeFwbCeao4dHixOQp4hANRczMRprVr
	er9fWYo46DFlf7ZGNLQuiB1og9D/x+bc+PcjWUev3jciH8wZ9lqcQWPtjCAqO/PEhVHiLqakpDE
	7x9HhMw7fCs6XJpAVfHIL0ssF4q0=
X-Gm-Gg: ASbGncsVjDr8ns4mMbutXkVgsNHJetwwgTaW/7XDlqbrGNIT1KwF4jzltKWK8LzYD0T
	sweREj5ewcn5vo7QMxwOApZXZVmq+nCsFYHCoZvG3jZLr/wsDXx9AJPNMPyTB2DbWnQ5LTupDtW
	tIRTZQdC0Pb1rplYRTZFS2q+xKQg==
X-Google-Smtp-Source: AGHT+IGvmmYvRZxaQpwOlm5/g30RcEwknbFzXlIE4/QcXAc1CEJMRoTLbZCqsGvZk1+U/GCOf7N2MIXZXFeiDK2BB34=
X-Received: by 2002:a05:6122:2a4c:b0:51f:4154:c1b2 with SMTP id
 71dfb90a1353d-52589135db4mr3735030e0c.2.1742409733365; Wed, 19 Mar 2025
 11:42:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250318205735.122590-4-prabhakar.mahadev-lad.rj@bp.renesas.com> <202503200200.WXMnn3Kq-lkp@intel.com>
In-Reply-To: <202503200200.WXMnn3Kq-lkp@intel.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 19 Mar 2025 18:41:46 +0000
X-Gm-Features: AQ5f1Jola8EJXzzsGPrnYQKrU1Z9ZvkepFcnYY4hn435lmQbHPiVJntqetDza0o
Message-ID: <CA+V-a8seHo-ngtbnysXLVq47ob1QU8m61F1_5guekxE9wur_-Q@mail.gmail.com>
Subject: Re: [PATCH net-next v4 3/3] net: stmmac: Add DWMAC glue layer for
 Renesas GBETH
To: kernel test robot <lkp@intel.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, oe-kbuild-all@lists.linux.dev, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

On Wed, Mar 19, 2025 at 6:31=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Prabhakar,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on net-next/main]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Prabhakar/dt-bindi=
ngs-net-dwmac-Increase-maxItems-for-interrupts-and-interrupt-names/20250319=
-050021
> base:   net-next/main
> patch link:    https://lore.kernel.org/r/20250318205735.122590-4-prabhaka=
r.mahadev-lad.rj%40bp.renesas.com
> patch subject: [PATCH net-next v4 3/3] net: stmmac: Add DWMAC glue layer =
for Renesas GBETH
> config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/202503=
20/202503200200.WXMnn3Kq-lkp@intel.com/config)
> compiler: m68k-linux-gcc (GCC) 8.5.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20250320/202503200200.WXMnn3Kq-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202503200200.WXMnn3Kq-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c: In function=
 'renesas_gbeth_probe':
> >> drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c:125:7: error=
: 'STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP' undeclared (first use in this functio=
n); did you mean 'STMMAC_FLAG_EN_TX_LPI_CLOCKGATING'?
>           STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP |
>           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>           STMMAC_FLAG_EN_TX_LPI_CLOCKGATING
>    drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c:125:7: note:=
 each undeclared identifier is reported only once for each function it appe=
ars in
>
The dependent patch [0] has now merged into net-next.

[0] https://web.git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git=
/commit/?id=3D0c1f1eb65425

Cheers,
Prabhakar

