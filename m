Return-Path: <linux-renesas-soc+bounces-23376-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DE25FBF5C63
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Oct 2025 12:26:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 745EC1883B43
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Oct 2025 10:26:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15E6E32B98A;
	Tue, 21 Oct 2025 10:26:24 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E416E1A76BC
	for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Oct 2025 10:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761042384; cv=none; b=IV3QIKGSV/OY274rnNiAceNUCwSk8t0AkiRlYIwVESfe0hJD8x0fQodLhHlkz29oiltn7w5c8veCHY9lGLQHu84C9/N3x/ABuRRMPmmpcaO9S9EsA7gAneYWZMtroJXhKj3vlVizPSs3iiN9FgFJ31iUav7OYX5Ydgg/iwyHLbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761042384; c=relaxed/simple;
	bh=va4WxH64kPG8XCl6w3KCXlFAiPzGBJtiTtCajxRETjY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MxDSk0sAaBeyrq1cmyBTNTHka/44agcZXhOtSmwyLUpa0TJ3QuUC1HEufVxzfwnjqopWlERIFUVCQveKlb3mleKw3jo2YQC0NrhI5gvlP9EM8YAskC3+ok1R3vYVXYzsID/2ID/HpBET13K81kV4JLqYKBcb4amF7byiBvNezpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-5d96756a292so3167141137.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Oct 2025 03:26:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761042381; x=1761647181;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tDNH9pDF9LBAisWYpnrCUtwA+9hrIVu2UeAytlJC/r0=;
        b=TsP+E4Yzv60z/3adHnJy7VzWtND6QONisawyH8p0YgJnRQU4YYjaHPAwDJWQEleVA2
         EaLhJrh9Z1B3MChoPw2ya0fyNAXba29cJEiS6S2NVWkn9Ob+4pwf2PLmW8VFqI8TZWz7
         vpCpOUzzXxwKJx5wBpyNmhtEj2O9VEuoH+VHyERhNmem6+hKbrgelQS15wcBlPdrt0uK
         2LEOydKAuJq3geTxa87+cIQSVsAn8I8V95nMT1l6nCyiqyJWWJRM39f/RvuUHnK7SMBA
         mZGryzOZr8GadKqde7lOLBKurUw70himeYPSt++XhARmKmPQg/O/C+GVcbwY3LyHbRjq
         Ir3A==
X-Forwarded-Encrypted: i=1; AJvYcCXtnufpXlLK9dcGpRjs3u0GbRpFFzoUweSII1LSF7Wcvk8FddWrZ5ttrGfWwDw8H7VYstINhevCmqwHKrfU8KXepg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzUWPvg2+1Wv538FZY+fdJcPPBNCn893K/IJB27IZ+XbVS9bX5M
	1vAQHgzfShA1s6zDkEyKDwUFNtNKL1qUIKUS7QP65mPwbnD9jwUOLW4TduZn5qcM
X-Gm-Gg: ASbGncs9rSMdU9W/VUTmQUFlOE5Gy6iqK8O1ncj/YHOAl567PQqagHqsIhCQlsNIWcI
	DDA650xyF191Uh3qnNWVDQTd9Daqij5EoN5t4HOT6+LKz67WsbrFVRAWcyEw0SYql9DujKNGCja
	bFlHfv534wFW2VprueDD8Ku9h40Ghn5dD1ZpuZtpB8M8SncmHFMiWbazCfbwtiRyW1W35yIheuJ
	yddPTSPaJQpRRVJesvWjHVqle0MSUR5YdG0DmTLmxgtrn6Vldtp9yRw8rRzSaSAXL2HRgLgoqiW
	Eikw4SuqyfA59wq2WXSXZNHLM/0HInwjoQjE6/Vf5iIdQMz7jZir7FW2duVEE6IqTBi76DWO7Hv
	YmSGtRxLmGAbGXH5T09BL01Ar98n+1ekOWBF86RBZZD5liE9Q+iIkQD2P2Q/Tu2TT6K46IrUtsB
	Fu3cpVIZya4egKyN7XlpQwR4XagsO1xHpDtDhbCv2+JSRbC14O
X-Google-Smtp-Source: AGHT+IGZ8jCXjD+4KPs4+lVKS+wI4lLMD8/inJcpQj0DvPJHEkPSzKXBAAyVF8wj7+cWnZLnaznDaw==
X-Received: by 2002:a05:6102:510c:b0:5d6:12fa:b4ec with SMTP id ada2fe7eead31-5d7dd507b67mr5321667137.4.1761042380538;
        Tue, 21 Oct 2025 03:26:20 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5d96c0bd369sm3405402137.1.2025.10.21.03.26.20
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 03:26:20 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-5d5fbfca7e2so4549602137.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Oct 2025 03:26:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXDUNbtnu0/iH/gmL3j+ckX8mGwn96tBWuEa5qPXQJbsgG2SnE1LTpwg7cdS++B3ofjG5UK95MjTyXK2QdsV+2sMg==@vger.kernel.org
X-Received: by 2002:a05:6102:e08:b0:529:7c2f:ceb5 with SMTP id
 ada2fe7eead31-5d7dd5035afmr5261434137.1.1761042379969; Tue, 21 Oct 2025
 03:26:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251015192611.241920-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251015192611.241920-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 21 Oct 2025 12:26:08 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW1B7Yk1hUU9MSJsiL8wSmjAUGN7Qd_wgBHv8Ct=-wi4Q@mail.gmail.com>
X-Gm-Features: AS18NWA5TDVRnTdlKeYEusciZZnf69CtVCQ6CEB6928Ztx_Tex5oqUI1hZkbQkE
Message-ID: <CAMuHMdW1B7Yk1hUU9MSJsiL8wSmjAUGN7Qd_wgBHv8Ct=-wi4Q@mail.gmail.com>
Subject: Re: [PATCH v11 0/7] Add support for DU/DSI clocks and DSI driver
 support for the Renesas RZ/V2H(P) SoC
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Magnus Damm <magnus.damm@gmail.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar et al,

On Wed, 15 Oct 2025 at 21:26, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> This patch series adds DU/DSI clocks and provides support for the
> MIPI DSI interface on the RZ/V2H(P) SoC.
>
> v10->v11:
> - Split CPG_PLL_CLK1_K/M/PDIV macro change into separate patch
> - Updated rzv2h_cpg_plldsi_div_determine_rate()
>   while iterating over the divider table
> - Added Acked-by tag from Tomi for patch 2/7 and 3/7
> - Added Reviewed-by tag from Geert for patch 2/7 and 3/7

I think this series is ready for merging.

> Lad Prabhakar (7):
>   clk: renesas: rzv2h-cpg: Add instance field to struct pll
>   clk: renesas: rzv2h-cpg: Use GENMASK for PLL fields
>   clk: renesas: rzv2h-cpg: Add support for DSI clocks
>   clk: renesas: r9a09g057: Add clock and reset entries for DSI and LCDC
>   dt-bindings: display: bridge: renesas,dsi: Document RZ/V2H(P) and
>     RZ/V2N
>   drm: renesas: rz-du: mipi_dsi: Add LPCLK clock support
>   drm: renesas: rz-du: mipi_dsi: Add support for RZ/V2H(P) SoC

As this touches both clk and drm, let's discuss the merge strategy.
My proposal:
  1. I queue patches 1-3 in an immutable branch with a signed tag,
     to be used as a base for the remaining patches,
  2. I queue patch 4 on top of 1 in renesas-clk for v6.19,
  3. The DRM people queue patches 5-7 on top of 1.

Does that sound fine for you?
Thanks!

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

