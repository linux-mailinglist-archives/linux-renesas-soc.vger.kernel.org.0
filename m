Return-Path: <linux-renesas-soc+bounces-14676-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E59A6A33C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Mar 2025 11:02:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 416048A73B2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Mar 2025 10:02:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E9F222423A;
	Thu, 20 Mar 2025 10:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mdXykzDW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0D2D22259E;
	Thu, 20 Mar 2025 10:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742464903; cv=none; b=OIicpOk7zobi+DLAGDT0ryom1dGMXijBk9BSZb6f/bFoCeV/QLsvMErhGN7xCi8BHdQvlOUwyUVgfclxhwVUXNoMp7JOXaApDG6rPqHIYag74gmVEsHi/HoJWEH8ka5XgN0f4cPcvpfXWSIN4JbuJzSQQu6g+B+GpKyeqKtIzHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742464903; c=relaxed/simple;
	bh=3uEhFvWgTZ3qE+HGzh3HTAH18SIHho193NXFHIRXPSU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kfrj2ufM75izW7VYWKyXHI+Cfao2G9Nua8LniYQ+Y5Notm2ExVDFpBlq1Ftt9g5XhnrDRKT1wYq07Wxi6khVm6uN3AnluQyZ0bMPycjb4n1kgQnGY9Augxv2voeE5/AxZ8ACJo93A6R+yKpWSf7H/QnZ4lBTfSJWm8iUfAz/vis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mdXykzDW; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5242f137a1eso282817e0c.1;
        Thu, 20 Mar 2025 03:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742464900; x=1743069700; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VkOqX1hHmiQ4/Ww30LXv9z0S90BxKz274f5FP6A6x7o=;
        b=mdXykzDWiepnGY4YOctmeanonRAn+jIl6jhtB/lgIVfPfVoJHYXxVuGc430NxmEhHj
         urSAu6zONRESSof+EZJ0o7rFK5J9ZUyQvsfHUFBObKzBdqfKMTMCLVxTFfWq6mZ9u3ZV
         040N0Dmnr7q5GG2gU7X+qjogZh0Z9FWJOKCAz6hWvh0UkTAlBYwmHyRKERSaj/Zn5k3t
         XfYNId+8k570f1YODSUMcqcJvo2sqq2XNfm2zgh8e5QRlYD5SeZQCZP62wuCOGUoA/A/
         Q7w2y21ao4SEcvPb1Uch9SJWgDz+aJ5YdWzPABaGBA/zZdrb4+0g+4x77P0cUWYVpCvj
         flVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742464900; x=1743069700;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VkOqX1hHmiQ4/Ww30LXv9z0S90BxKz274f5FP6A6x7o=;
        b=qEYOijJ018sWrhJdpFKCDC1kywwjMGZDvJFRBu/FdhYjX+off4YFWGCrQpQ6HqpNtH
         Iv3LbXEautgQKRuUp0n/sQMBi0UwmFQ8fZ/SfxpfcVUE3KBfSL9s4cAsuvx5shpeARdf
         V7sC3xZvEO0FMvgYOeUIExGM1MIY4j5cT5Jx8/zXVSazb+BdCyDVdt16BcodVl7K43ty
         B9rRbUIqGVdIxEpmij668+6gL8M4dLz92shLQycDAyjd8WKL/Sc1T3iNFkh9YFlyWzSJ
         deYKZ+QfheuohrE9D9CMhCMErXE8P2uHEOQ/McwsH1wugo8TKy8994EPx3DS8qmKYlCY
         lQnw==
X-Forwarded-Encrypted: i=1; AJvYcCUE0OnH4bFhWm97z0oESC15b8sasokxxWmVTMQZpZmB3Q43V1pXVcRtd6lSFJ9OMVO8pecqrPY/@vger.kernel.org, AJvYcCVA2rkLaTLGEugpOmOhAAFV4rRK6wXn85J9FzT4pyV2Adxd+jSOEjz+VTEOy0fXjbgJPhlg3T8OEAu6A7lZ7HbQTHs=@vger.kernel.org, AJvYcCXjFjyZLEoSnSmSK1Ala5vs/fSVU2WW4aEjNNJwaWShYuyt75zfP0N4k2jVZdAecbsSrMc2xkUg2FSI@vger.kernel.org, AJvYcCXrDHvkWY/055khguTo1A9dA05twSMEJesSSUxKmo7vAW1mLhq2UXc9DcWAQEqFneBZDTZI3GREB3zVTO0X@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+4/xLlkHBGJD/EBsFbMPg0Cyc0dl5uI9vXppf6VD3v9hXFGvS
	EBlS6RgH5M+8JC+5Bvjdgu+9jBBNeuItw4rsCZx3hHEVYDQOtFdOvGDsJivCfIK61l3bsEju08X
	/axnyBY2JOAYAaLoTNRGTq45447E=
X-Gm-Gg: ASbGncseYFUVOXtHKl324huv+2CPwN9+Nh1ZAHsDhMNJsbVkHGlvqs/vh3QdBHMLf2F
	B6APp1FDa4Mw9jJkhdn+3D84HMqhK1h8JOsbx3RJqmXFbnwDFcI7DMzc6GYdHXlJbnEJ4Vf2zrG
	Gfn06TQuFxH608mI0AGl+Z1aFbcA==
X-Google-Smtp-Source: AGHT+IFYV5TnCzk+c53bzke6nPS2rmsXWIkLBB61jOeJkZU/pepHxMCueeeEqgu0mBt8iULwpOf2mSKf5NdE5ODHOPs=
X-Received: by 2002:a05:6122:4312:b0:520:6773:e5c5 with SMTP id
 71dfb90a1353d-5258926463bmr4862359e0c.7.1742464900176; Thu, 20 Mar 2025
 03:01:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250318205735.122590-4-prabhakar.mahadev-lad.rj@bp.renesas.com> <202503200755.DoMipQnf-lkp@intel.com>
In-Reply-To: <202503200755.DoMipQnf-lkp@intel.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 20 Mar 2025 10:01:14 +0000
X-Gm-Features: AQ5f1Jrf1Dd0xKJnFdvTZS6D8krk5Rik-xKFXlxkwAiuooKI5_9kmPU6SYIxyac
Message-ID: <CA+V-a8us=RbApdSJ7SLchrQLSbch8jkP3uOCC8TVFiVe4yULnw@mail.gmail.com>
Subject: Re: [PATCH net-next v4 3/3] net: stmmac: Add DWMAC glue layer for
 Renesas GBETH
To: kernel test robot <lkp@intel.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Mar 20, 2025 at 12:29=E2=80=AFAM kernel test robot <lkp@intel.com> =
wrote:
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
> config: s390-allmodconfig (https://download.01.org/0day-ci/archive/202503=
20/202503200755.DoMipQnf-lkp@intel.com/config)
> compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b=
5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20250320/202503200755.DoMipQnf-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202503200755.DoMipQnf-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c:125:7: error=
: use of undeclared identifier 'STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP'
>      125 |                            STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP |
>          |                            ^
>    1 error generated.
>
The dependent patch [0] has now merged into net-next, with this we
shouldn't be able to see this build issue.

[0] https://web.git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git=
/commit/?id=3D0c1f1eb65425

Cheers,
Prabhakar

