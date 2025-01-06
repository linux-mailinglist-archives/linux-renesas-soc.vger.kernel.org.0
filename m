Return-Path: <linux-renesas-soc+bounces-11885-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DE122A0315A
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Jan 2025 21:24:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 24CFF1886BBC
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Jan 2025 20:24:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 416B71E0090;
	Mon,  6 Jan 2025 20:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GL/gH98J"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690821DEFE7;
	Mon,  6 Jan 2025 20:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736195085; cv=none; b=XE9EMUcrCM1xYKvaSbh6pegjHLL74tRY1Go8upFv0SWzbjUTxJs4esJIrisSDXGwWmoKgPo0m5Kw8prhc8O8BR2zWOr715ut0fzV1yyuJtgJ1ePobuIKPkaCi1X3hcjzohpW+ipHi69uPsUNQJXVoMOYNiUaQJLDq5HQhBKJIpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736195085; c=relaxed/simple;
	bh=GbDnOeV1hVwo672CoCyWd3qVKQ+X93NyezNNPZoCkOI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SvKp4PMne+DODCBRUL5JutAkLX1OR01Mnvzdjcl1pw8vhyCUz/9sK8Ov/Weqw6dRJK35jazg6DcYyTAGqzWwgzOMCzLQOWbJuwAloLV/9biNyd8c+F12s+ZBkVrdoE4htAEsxu4PsSOdYh0YfvqRJM03wPPFYrYlQH19e5oPTqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GL/gH98J; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5160f80e652so4123646e0c.2;
        Mon, 06 Jan 2025 12:24:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736195082; x=1736799882; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oBvFGKLQ+3Mx2W8DaDMuz7zf+1Q+8Q3d42tdhLaH9yA=;
        b=GL/gH98J2B0CQRFycZLsTnIrPSwwaCKFSP4Zs9f5m2goWAJvaRPcEauCh+iWFu4Fmg
         4EiBLh5I9cuycmM/rv+qzgeytcloCRs5aFFokzVNHNHVu0cKOUqQOJu9n4THZuzT2mbJ
         kUGAQD4h+WEk8FqJTEoFHnTih9WL6/n47s2jwQ196MJGPBMOUoJXWJCZgdNIj8XiPyLO
         eUEM8XqbDe8DucGMJ366xwfcrX/vMRNoLQR5hQ7Hdm9t+WNcRzPNpyG5ls13zRxVj7NR
         3xcLSGFtLthxJ+N3AexPT+gdtoxFlZBOzRknAy2fvhgeYC85FwsVIJwUsigGwHNvLkLd
         sg8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736195082; x=1736799882;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oBvFGKLQ+3Mx2W8DaDMuz7zf+1Q+8Q3d42tdhLaH9yA=;
        b=tj6BOyj/jjwFlgUR7mU5/oymfx82Wi9NJKtzK2RuhfPLB2yBvDCIS+zws0Jnxs9PoN
         Ta9sDgB8ZRB1sn6pM6Rd/WxByYBiN0nch0AtUta01sqiAMUylurhhij4H+H3QS8JDRXH
         QWO/SAtpl5EM6W3JRdtwyeFB5mz/b2E/EkaQ/3VvYcsn6s3NWPd6jP5fxBNDoBBbpmSH
         NzswThJgieXOp2ft8zaXcyI3xVUtKZcTIya0h+BPa+mW/hlbVDee11tb7iF2MFPE4zmU
         uF8Rd+XgbSHVvudN3w51ArhdNIOWHDI1B2vP+iq3MEkbhYxgJqg58hXOYy9NwXu4bIwt
         hZHw==
X-Forwarded-Encrypted: i=1; AJvYcCVgY9NJ2Q4aflOA98Go7fa/3a9wEkMuYvXyEEju84jvSNjHysm3CqCYU7Qkp/Q2q1ZK/PNzEjt82ixV1qUxkmmhpr8=@vger.kernel.org, AJvYcCWFRxOcpd4R3SUwSPXvPD/ln/LipFci81CUvMlFCmD2UBlsGjrWZm5LEP1eXNB0+HA1+q4uXDSrx9l1orw/@vger.kernel.org, AJvYcCWukrmfa9QgUpBv7MWZLNY82fxpYVFqTeD0U8YRpCGF91Dqpr1brlxip+u8/EiWV0uPDiU16/Ih9fo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwoxEtK1TQ1FxvOZH3Nqpv+O/RbRo02nzXFSSvA2xx/WGf+1/5X
	o24FLL6RKWOqXa85o2dx80j4Xn2BbJBzLpg3zNSeEe5OnAXBdVml2rbORXCLQkFBHxQQOZ2jd10
	VIco3jPPIdrDhRmTMBzlkZoHM82U=
X-Gm-Gg: ASbGnctLAnpeahA7Fcu4iJTQUaXoYANaRO82Kb/IZdHhQADDbnsSLsUotZnTBoJyjLM
	KnT9KHcd1hJ+USiV6/8sF7R8iQK6s/u/pzYE5dF0=
X-Google-Smtp-Source: AGHT+IH1yiuOpU5pEW6akY5iVdCxCjAh9URCh0h/9jVWcXuhF9lj+aGcCksb5NeTZkADviugLxX3HFy/u7RFt6gn50Y=
X-Received: by 2002:a05:6122:270b:b0:518:7ab7:afbb with SMTP id
 71dfb90a1353d-51b75d3134dmr46260808e0c.8.1736195082143; Mon, 06 Jan 2025
 12:24:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250104175346.656352-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <202501061001.6iClUTxN-lkp@intel.com>
In-Reply-To: <202501061001.6iClUTxN-lkp@intel.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 6 Jan 2025 20:24:16 +0000
X-Gm-Features: AbW1kvYQ64lqXt0W7fYkP0Qt5wLKSoL_IQ1o051C3begc80IQMGykBNFk93Rm4k
Message-ID: <CA+V-a8tFnLMzUiou8DDrA8qauyCZef7H3Za5NABPOwWkptQMtg@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: r9a07g044: Add clock and reset entry for DRP-AI
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

Thank you for the report.

On Mon, Jan 6, 2025 at 3:11=E2=80=AFAM kernel test robot <lkp@intel.com> wr=
ote:
>
> Hi Prabhakar,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on geert-renesas-drivers/renesas-clk]
> [also build test WARNING on clk/clk-next linus/master v6.13-rc6 next-2024=
1220]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Prabhakar/clk-rene=
sas-r9a07g044-Add-clock-and-reset-entry-for-DRP-AI/20250105-015708
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-dri=
vers.git renesas-clk
> patch link:    https://lore.kernel.org/r/20250104175346.656352-1-prabhaka=
r.mahadev-lad.rj%40bp.renesas.com
> patch subject: [PATCH] clk: renesas: r9a07g044: Add clock and reset entry=
 for DRP-AI
> config: nios2-randconfig-r052-20250106 (https://download.01.org/0day-ci/a=
rchive/20250106/202501061001.6iClUTxN-lkp@intel.com/config)
> compiler: nios2-linux-gcc (GCC) 14.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20250106/202501061001.6iClUTxN-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202501061001.6iClUTxN-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
> >> drivers/clk/renesas/r9a07g044-cpg.c:97:35: warning: 'dtable_4_32' defi=
ned but not used [-Wunused-const-variable=3D]
>       97 | static const struct clk_div_table dtable_4_32[] =3D {
>          |                                   ^~~~~~~~~~~
>
>
> vim +/dtable_4_32 +97 drivers/clk/renesas/r9a07g044-cpg.c
>
>     96
>   > 97  static const struct clk_div_table dtable_4_32[] =3D {
>     98          {3, 4},
>     99          {4, 5},
>    100          {5, 6},
>    101          {6, 7},
>    102          {7, 8},
>    103          {8, 9},
>    104          {9, 10},
>    105          {10, 11},
>    106          {11, 12},
>    107          {12, 13},
>    108          {13, 14},
>    109          {14, 15},
>    110          {15, 16},
>    111          {16, 17},
>    112          {17, 18},
>    113          {18, 19},
>    114          {19, 20},
>    115          {20, 21},
>    116          {21, 22},
>    117          {22, 23},
>    118          {23, 24},
>    119          {24, 25},
>    120          {25, 26},
>    121          {26, 27},
>    122          {27, 28},
>    123          {28, 29},
>    124          {29, 30},
>    125          {30, 31},
>    126          {31, 32},
>    127          {0, 0},
>    128  };
>    129
>
I'll guard the above with #ifdef CONFIG_CLK_R9A07G054.

Cheers,
Prabhakar

