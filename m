Return-Path: <linux-renesas-soc+bounces-11800-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E86A00763
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Jan 2025 11:03:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 597C81881C26
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Jan 2025 10:03:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D85E1CEEA4;
	Fri,  3 Jan 2025 10:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SsO0/pJU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84301186A;
	Fri,  3 Jan 2025 10:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735898621; cv=none; b=GSmlgbDXcBpu+YPFGjJuSZ2Vcd+1tu5dh2jyNfyRoQZXfj/g78RqHqo062UbUkskzc6Qb+4J6neN9kzE/ZJnByMvT3HHYS+PYn9YHe75+1Chlfivsmwng47Td6e4obDYBG19uEpTO0xKFpe2sIz9kWKjPVaVTHEu6AWRC/A3gfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735898621; c=relaxed/simple;
	bh=9p+fuJyh+8lDrTelnrBVizZrTlsqzwcanUzp/k+KzjU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D+hr2mFJsMgY9jLvgM2xsBj3syeqxUc3ckw5h5vs24SOYo/trPvdGTy7+XTVZiOOJI1XEX8nwz7RrWPRhZFtipFTOWQRsazgv/rMaR0S0b/mFLESXezhWP26pVPPaSHDNJT4LDQgA31T+KFMI7psuk7+QT7YnV4eVSqjMw9AzKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SsO0/pJU; arc=none smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-4afecb2731dso3227636137.3;
        Fri, 03 Jan 2025 02:03:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735898618; x=1736503418; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/w4OZBRhdq1N8KRhLU+J7Hu5Wj+bKlBjyl4XzSkh3ys=;
        b=SsO0/pJU6IcuUb2GlpLX330fN8yJfH+l2JYi9be6XIPOGeVPb+gtyZJJ79o+lMc8T4
         pUToBnVEvyR5TjBwKzipYXvWjIOQQcAHiNh/ilHDv3FjleCZ4IRpa8UpRkbcqcLphfky
         dLgXt8qRyWqICR+utMQ9DzcrNN3Sl8cOoXoVz2KehrsddmlA25JFm9iPLoRYjCUld5sW
         vFHOe0t5bnoxJJL5k8EpmLPjuIbusNxS2BxorG0TtQOPMySlM4Fo9djKQzkJqi9H79oe
         JAajvev4uEF6llrSXt76lI+sKr5nyVoA4pTfAaAzLDvLCjuv27e6nFaSUo92GSAApqxR
         +cfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735898618; x=1736503418;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/w4OZBRhdq1N8KRhLU+J7Hu5Wj+bKlBjyl4XzSkh3ys=;
        b=MLNtwNHL19yNDlkMOjRIfmoYln4IZ9iYxeziwsvq+zFRyJhy3Yrk/hboNDhCXbHbER
         Da3f4CXsYf3d7nqj43yjv4zB0wc5xy2owZuyh7AfSj6vHsbvdPhf22P3z9NldkcQ+H/y
         Qo10GPUTXav1OIy4oz8pDVlOVoBWlEbjfk2CjZmH/A8z1ENdD0QwEsVm5K/zTebcUs7r
         UdQyGyWGcnbx0nKFQiG00dON7JUnTafQYEUEhMNJguYpebQRccuOSQa25hwrBV6FT2Ar
         YlNTtinAUbVK/gHFHtIR1xpF9HUUlbRDsC6XTSaI7XC9Dl6g2Q6krA734YiCdtsVsBRo
         AkCA==
X-Forwarded-Encrypted: i=1; AJvYcCVFL+HGubZx3H5aV06+uRkQtLzijQ+dGtNloczFgaReqF7w259s3m6ETfCvpwafUcnZjfhap4vDiflRkmBa@vger.kernel.org, AJvYcCWXoW1zNzpaeUHEYPLzvyZFB6hg28A18NGSKIiD3dRHNeo8dOGRL3vLZIvAdkxqO24TiA8QrdEv1yU=@vger.kernel.org, AJvYcCWkuFDRPRMjV3FMLeDL3neQE00rYbMUH3BLBAiZHJWosUeGQ/96yf0my2lzykD762Q+TtBh7/BTTMSszqsrA/JHDmg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyzm2papZBIENKgTDpPoeOeiP2Ouf3sm9dmGoXHwNBtY/CWFgVy
	rOOL0840kjRouftpIWaJdYnt/BrNo8synhUWxWgXlRylBRnkgRSMuC5lrBF7D1/fF8iavnekq4n
	YUAdK07oece9BStHOK2eog04qnXI=
X-Gm-Gg: ASbGncuAE+/q2d1yS7z9+PG/SHnI9RJUmDpUgDOdIE3+gLg3APj2OE5fM9IVeTgfdzu
	WZcBayVGOFIOHnNrkKeoMgNXwtJu74rPlmHsrc38=
X-Google-Smtp-Source: AGHT+IH+uMdf97Vf46rUu8PPWG67SCW1TsMA6VcnAG0M1CAf12xBs18o3gTQf+xHGipuxiesIPSEOLp4gEMTtLrK9Zw=
X-Received: by 2002:a05:6102:50a1:b0:4af:d487:45f3 with SMTP id
 ada2fe7eead31-4b2cc49a842mr37692670137.23.1735898618410; Fri, 03 Jan 2025
 02:03:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250102181839.352599-4-prabhakar.mahadev-lad.rj@bp.renesas.com> <202501030941.vDjx439p-lkp@intel.com>
In-Reply-To: <202501030941.vDjx439p-lkp@intel.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 3 Jan 2025 10:03:12 +0000
Message-ID: <CA+V-a8sHgCKbTHEJzvZuRQbuZCtpMkrtRSWxWzVcC3BeeZM-2A@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] clk: renesas: rzv2h: Simplify BUS_MSTOP macros and
 field extraction
To: kernel test robot <lkp@intel.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, oe-kbuild-all@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Jan 3, 2025 at 2:21=E2=80=AFAM kernel test robot <lkp@intel.com> wr=
ote:
>
> Hi Prabhakar,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on geert-renesas-drivers/renesas-clk]
> [also build test ERROR on next-20241220]
> [cannot apply to linus/master v6.13-rc5]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Prabhakar/clk-rene=
sas-rzv2h-Fix-use-after-free-in-MSTOP-refcount-handling/20250103-022238
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-dri=
vers.git renesas-clk
> patch link:    https://lore.kernel.org/r/20250102181839.352599-4-prabhaka=
r.mahadev-lad.rj%40bp.renesas.com
> patch subject: [PATCH v3 3/6] clk: renesas: rzv2h: Simplify BUS_MSTOP mac=
ros and field extraction
> config: sparc-randconfig-002-20250103 (https://download.01.org/0day-ci/ar=
chive/20250103/202501030941.vDjx439p-lkp@intel.com/config)
> compiler: sparc-linux-gcc (GCC) 14.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20250103/202501030941.vDjx439p-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202501030941.vDjx439p-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    In file included from drivers/clk/renesas/r9a09g057-cpg.c:15:
> >> drivers/clk/renesas/rzv2h-cpg.h:51:34: error: implicit declaration of =
function 'FIELD_PREP_CONST' [-Wimplicit-function-declaration]
>
Thank you for the report, I'll include the required header `#include
<linux/bitfield.h>` to fix this issue and send a new version.

Cheers,
Prabhakar

