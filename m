Return-Path: <linux-renesas-soc+bounces-31942-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kL5LM/aT+GnRwgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31942-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 04 May 2026 14:41:26 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7B44BD096
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 04 May 2026 14:41:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 69322300C925
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 May 2026 12:41:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D58FD3D2FF0;
	Mon,  4 May 2026 12:41:23 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F6FF29E116
	for <linux-renesas-soc@vger.kernel.org>; Mon,  4 May 2026 12:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777898483; cv=none; b=Z1kpkGbS1ze13JXjhUnORVlB1I6TvR9q9CsNVf2eDCl6m2PDu+G0ES4e857EKKc3NQTM4KvY+cGbu6qT16HHRhIbC/pvGj1x18ikAaAFlkpZCCmCDqEZltVGuSc+FfwQfrQ0zzYPvibsOgYiQ0sqfKYr1iUmwVXOaCHNwRXh7U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777898483; c=relaxed/simple;
	bh=mf48U3dZmpqt3p7RmvGUUMOB0UHyUtn3OAbikvFAdqk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jazun/6MXN8ZN0Rvpab1LWqK9bLc5Pqk0ghZUG5KM+81N08+cmxXWXGdQ95tZGkr0MGoJUkFZDer7AvKoWDb6Fo8Z4kc0NJig35m+7VryIaw5h9W4P0IMYK3BWPji2QA6goJshfIbZd8ayKZizy6mDtBl10KehhMyFKtFRlfr7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-95cda04cfd0so873954241.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 04 May 2026 05:41:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777898481; x=1778503281;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=znJkm+yheaBiOtiXBHrScjCf5aNJhz18eCP9uLN0zvY=;
        b=b+0XGhb42+wJDdcbb1Boq3X0IzC6juFgvCoqlhFroVaiXFQjSYJmuUWn/BIP9yBaQo
         OzRrdsNJj7r37YTagb1tp1GASrYFr8lzI+1tzg8mm6RzMmWm5Ss6KkBy17vaCNTViomz
         CjvFFcW+gn7m/Shelh9Ns+/r27EW6KptEnRrG5UWsrVp+92Y4dGO4Ycg+MRcIVe5jZIX
         +t4SoO9pOUKE94EHwmU0d4++MsvsDM7savbxfCtf85XrK1vx0/0841Jn0yc1E6wPl3UG
         NRVg0rXbAylwFDzgeSMEEVRiChAmO3ABxfemG+nKttySrQRx835iYuMMUJXHsE9P8pkH
         ptrg==
X-Forwarded-Encrypted: i=1; AFNElJ+QNaSIrxuE4k0trB0ZukF1jEsEZNfAQWC2/a5H6dDBXGEup1/n6l6r4T8gP6SfkytODkGNvpiV7P6XBO/jEeL0bw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxmtX+h72/e+y5dOH0zK4dziDT8k0N4wU7RrtXUBcyH1b1Fihi3
	Q7D5RLYvu5L9sYcllnyHZaa2IhRJcNx7J/2i6EvwtNgYqdnQqEjtpDdz5Vgcbl1t
X-Gm-Gg: AeBDieuFR8SjXyjth1W1ohXpwRDhLQ+RP8MZU5xYHCZlT6noVSFOaxpIDkppOcbb0aM
	6Ffk7aJ9wrl7SVtPHZj3JkbEaWzDBZ2ysa4JylxkUViwM/d2MVwXcFIcKoKHa8STnlcMm13o9gt
	T3t/WZCqg6LFHULLez2sKbQ3MZecdcbcr2l0MjhJmWHXyYBxGfz4Fl+oWeia8jHo6BIkbcbpABo
	93wG5EfLFv8VUIFVjA/qb4VLB+2g0glXuU329DrGVPBW8sRzYIpc+2lrYrlhqCy04p6kCikTw5v
	0vMgv1Xg8pThJpacFa7gBy6YF18w5lDNws0Tg3zVO8OheH8Et/J3KbbqbBMmUf+DLLcGdr/a+Sx
	prJi9Zrq2OW1TK15+DAvH45tQo4luYltSV7FXt/XgwN9uYHNNJqsjduLoRBiLiIj2ybp0Ml/Phz
	RGwWiUXulo0CcVlmGrWjGb8ClyiY3Wys/69k4aIa/LIS9PmFf+6hYUyIXbFYVdnt7Ku8A7xsKkX
	oI=
X-Received: by 2002:a05:6102:2d04:b0:62f:406b:1baf with SMTP id ada2fe7eead31-62f406b2102mr819668137.20.1777898481234;
        Mon, 04 May 2026 05:41:21 -0700 (PDT)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com. [209.85.221.173])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-62ece141251sm2541552137.10.2026.05.04.05.41.20
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 05:41:20 -0700 (PDT)
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-57513a91514so425524e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 04 May 2026 05:41:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8ZkqRIG660CTxRjeM4xC2f/XkMPG7hjmOE1nH6DS8GBQK1qaCQWDGAuP/b6ysDbdCEEodFEMi51fIiPmR4vtObIA==@vger.kernel.org
X-Received: by 2002:a05:6122:130a:b0:56c:da22:6921 with SMTP id
 71dfb90a1353d-5750c5281a9mr3577419e0c.5.1777898480344; Mon, 04 May 2026
 05:41:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1775636898.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <cover.1775636898.git.tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 4 May 2026 14:41:08 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUqdEZaK4C2zNjZ3Rh0TaiLrROUeWK-R5WZU+ULpArBrQ@mail.gmail.com>
X-Gm-Features: AVHnY4LvtR9sYYwFkbyXTFSDx7n1q3qDBs-g1S0RCiV3vvmXtOpqt-05ZZXwFh0
Message-ID: <CAMuHMdUqdEZaK4C2zNjZ3Rh0TaiLrROUeWK-R5WZU+ULpArBrQ@mail.gmail.com>
Subject: Re: [PATCH v6 00/21] Add support for DU and DSI on the Renesas RZ/G3E SoC
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, laurent.pinchart@ideasonboard.com, 
	linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 2C7B44BD096
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,ideasonboard.com,vger.kernel.org,bp.renesas.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,glider.be,baylibre.com,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31942-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_PROHIBIT(0.00)[0.0.0.1:email];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.919];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux-m68k.org:email]

Hi Tommaso,

On Wed, 8 Apr 2026 at 12:37, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> This patch series adds support for the 2 Display Units (DUs) and MIPI DSI
> interface found on the Renesas RZ/G3E SoC.
>
> RZ/G3E SoC has 2 LCD controller (LCDC0 and LCDC1), both are composed
> of Frame Compression Processor (FCPVD), Video Signal Processor (VSPD),
> and Display Unit (DU).
>
> LCDC0 is connected to LVDS (single or dual channel) and DSI.
> LCDC1 is connected to LVDS (single ch), DSI, and GPIO (Parallel I/F).

Thanks for your series!

> Tommaso Merciai (21):
>   clk: renesas: rzv2h: Add PLLDSI clk mux support
>   clk: renesas: r9a09g047: Add CLK_PLLETH_LPCLK support
>   clk: renesas: r9a09g047: Add CLK_PLLDSI{0,1} clocks
>   clk: renesas: r9a09g047: Add CLK_PLLDSI{0,1}_DIV7 clocks
>   clk: renesas: r9a09g047: Add CLK_PLLDSI{0,1}_CSDIV clocks
>   clk: renesas: r9a09g047: Add support for SMUX2_DSI{0,1}_CLK
>   clk: renesas: r9a09g047: Add support for DSI clocks and resets
>   clk: renesas: r9a09g047: Add support for LCDC{0,1} clocks and resets

I have queued these in an immutable branch, targeted for renesas-clk
for v7.2, and for consumption by the DRM patch(es) that have a hard
dependency on the addition to include/linux/clk/renesas.h.

>   dt-bindings: display: renesas,rzg2l-du: Refuse port@1 for RZ/G2UL
>   dt-bindings: display: renesas,rzg2l-du: Add support for RZ/G3E SoC
>   dt-bindings: display: bridge: renesas,dsi: Add support for RZ/G3E SoC
>   drm: renesas: rz-du: mipi_dsi: Add out_port to OF data
>   drm: renesas: rz-du: mipi_dsi: Add RZ_MIPI_DSI_FEATURE_GPO0R feature
>   drm: renesas: rz-du: mipi_dsi: Add support for RZ/G3E
>   drm: renesas: rz-du: Add RZ/G3E support
>   media: dt-bindings: media: renesas,vsp1: Document RZ/G3E
>   media: dt-bindings: media: renesas,fcp: Document RZ/G3E SoC
>   arm64: dts: renesas: r9a09g047: Add fcpvd{0,1} nodes
>   arm64: dts: renesas: r9a09g047: Add vspd{0,1} nodes
>   arm64: dts: renesas: r9a09g047: Add DU{0,1} and DSI nodes
>   arm64: dts: renesas: r9a09g047e57-smarc: Enable DU0 and DSI support

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git
tags/clk-renesas-rzg3e-plldsi-tag

for you to fetch changes up to 272a6e2ad164094045af520299b5df3ce1763061:

  clk: renesas: r9a09g047: Add support for LCDC{0,1} clocks and resets
(2026-05-04 14:03:08 +0200)

----------------------------------------------------------------
clk: renesas: rzg3e: Add support for DSI clocks

RZ/G3E Clock Pulse Generator PLLDSI limits, shared by clock and MIPI DSI
driver source files.

----------------------------------------------------------------
Tommaso Merciai (8):
      clk: renesas: rzv2h: Add PLLDSI clk mux support
      clk: renesas: r9a09g047: Add CLK_PLLETH_LPCLK support
      clk: renesas: r9a09g047: Add CLK_PLLDSI{0,1} clocks
      clk: renesas: r9a09g047: Add CLK_PLLDSI{0,1}_DIV7 clocks
      clk: renesas: r9a09g047: Add CLK_PLLDSI{0,1}_CSDIV clocks
      clk: renesas: r9a09g047: Add support for SMUX2_DSI{0,1}_CLK
      clk: renesas: r9a09g047: Add support for DSI clocks and resets
      clk: renesas: r9a09g047: Add support for LCDC{0,1} clocks and resets

 drivers/clk/renesas/r9a09g047-cpg.c |  84 +++++++++++++++++
 drivers/clk/renesas/rzv2h-cpg.c     | 181 ++++++++++++++++++++++++++++++++++++
 drivers/clk/renesas/rzv2h-cpg.h     |  12 +++
 include/linux/clk/renesas.h         |  20 ++++
 4 files changed, 297 insertions(+)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

