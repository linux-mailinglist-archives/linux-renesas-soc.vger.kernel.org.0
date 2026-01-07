Return-Path: <linux-renesas-soc+bounces-26359-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F066CFE95F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 07 Jan 2026 16:32:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 182F1306590D
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 Jan 2026 15:31:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCE6F345CCD;
	Wed,  7 Jan 2026 15:22:12 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13626336ED1
	for <linux-renesas-soc@vger.kernel.org>; Wed,  7 Jan 2026 15:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767799332; cv=none; b=DFa6Midh1QI3MLuYC99Y9Tus5OwFuQIt76nn6bzv9Oj7pS/yCd6upZzFh14KVGknnpNuj+e/mVkpJg2/CftfwESqLXPpwc76ogU2nxlPvskCTxpZVsNxiixIxsSIh9H8oN9C4/dKVyDR81BrhVaVsZl/VdfmsgMbvTyFLI69kTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767799332; c=relaxed/simple;
	bh=xirnzd+sOTLBfOoqrKyZ5orvmCZslNDx5L/n4t/ve2s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=atASCjKdwRq8j02a/a4rDZ4z8yoJqcmZweu2qoHzpjuBJKJ7KSBqo2lZ9fOSRNWS0Gb841zKpH09rLk2swq3+PHN1ZbvneimW6rVdFhhFyoWiQ7qfxMEOuVT+kp/Hf9F5t9t15HFTtRCd+/t24b1NPlh95g9IQrVlhNrnC9XtnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-5ec96028b32so674111137.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 07 Jan 2026 07:22:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767799330; x=1768404130;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VGXfYeh3k2PdpEfY5u5umPkWwmBYjzfyvyHueENf/WA=;
        b=krtJAD+eRjw+ITR2xWxkfCBTsSOaq3f4kdOPCcro7a13edCNuNPhNvNww94TWLIaCU
         vdSC3HgvNQpDOPsKXA/VPO6Ga83MYvxnkc80+qdoN8emDh0A3WYFb0/pT18XzygKMfo5
         /YCZUXE4eY91EWZ+6YAUR8rmGn9rQ7MU8CkUUBdPm6d2hWEnK9Xz1dd9TjUBVdH2ltkK
         NV7+HzL2t8Y43tvp6NB/pWh5D1bse1phA259fkSM+Ydyae7DwxS/m64B4hBim53Zhy/+
         hW63UpD8nOQHVus6XdoG5+p4axGq1iGS/2g1RjOzQ6DKV+T+IQscXKZ9+3EwJ25ALLwY
         x15w==
X-Forwarded-Encrypted: i=1; AJvYcCVAExbLYN+y+1yOQ4/DYHw1SjRD1BqrBvD52juFuHBUV+oBUcLeXr1eZ1NBqmywYdfcbwqQUXoniWME7V/ZeFGeXA==@vger.kernel.org
X-Gm-Message-State: AOJu0YysCN5a7cBHXMBcOdPMQrJtRvEEMdcmTK+YqHrmj/jzID34eOy+
	cr/i4J7SefD2bURXW6sNsMJtyV6PFugMNomJXVyuHKcEYKG0qjSZYksGfY8KKId+
X-Gm-Gg: AY/fxX6bI7SzbBiaVShb7Erp56RXFOyRUVhiUwryMelUwMqAOiCCJ3aidcIPw6+X0bc
	LB4aiMR9V7Yc83LBpE8osKKKbUUIr0b8T5kfmuqVkNzwOCsNwjMai0lrTebepzWIY2xRooJhfN+
	tsnmooq3+GTuh4Z0QPM8uSysndCQ6wTWqjRRREYEI8RyLWTtoR/zWwGkgii3yh9WV8sKK+JsBCZ
	wIft4xqcCPo8kphVw+mhYCqASNa+M1u/tZZLxyQIunDAvOE7BHjbRHiD2wvjW1kIigLXle+NuH5
	Xgn78XSvkKkVvdchi+ap+sk6A/GQQmn99IymbGXtbD+ehwAaJyCx3HKVAU0cmVil7A/FpK9na0e
	fr49KiVLCuOJjG5R0EvCykbvE6N4wER/xC3nGJTGWlV/ZKXYpqJ/ZYYHXzbJr1kgBUTtuaVsazt
	MeH4qm9APRCVTcXgcC+ZtLblaIgM5iXo9ZMYXAGq/g3a+z7wDP
X-Google-Smtp-Source: AGHT+IEIF1VyzgBY/ijbMb6vvm/kOIhSIVmlS1I8l5sRXytV5std3RTKa/ImxIYzmKkgQZPHbynONA==
X-Received: by 2002:a67:e704:0:b0:5dd:c3ec:b75 with SMTP id ada2fe7eead31-5ecb696082cmr1227123137.29.1767799329438;
        Wed, 07 Jan 2026 07:22:09 -0800 (PST)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ec772afecasm3191858137.11.2026.01.07.07.22.09
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 07:22:09 -0800 (PST)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-5dfa9e34adbso1434844137.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 07 Jan 2026 07:22:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU0E+NsunoPxjlrxrApo7okAnqZImsiDPePqXJNSuVEdZgpGDYH63cY7cCvWfhIRiNW09FW3nzTrgTv/Sv/0gQXVw==@vger.kernel.org
X-Received: by 2002:a05:6102:3e82:b0:5db:d60a:6b1a with SMTP id
 ada2fe7eead31-5ecb69624bemr1245498137.30.1767799328042; Wed, 07 Jan 2026
 07:22:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251224165049.3384870-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20251224165049.3384870-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251224165049.3384870-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 7 Jan 2026 16:21:57 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW3S8BhE9yXsWCedQZnipBR4O5=OBDfubLE68A2OtqMAg@mail.gmail.com>
X-Gm-Features: AQt7F2pLWgnnzOwA_7Wfo0rR6d8bVAPIEUWOruo736mHbFyZALGJfwT7zcffoA0
Message-ID: <CAMuHMdW3S8BhE9yXsWCedQZnipBR4O5=OBDfubLE68A2OtqMAg@mail.gmail.com>
Subject: Re: [PATCH 4/4] clk: renesas: r9a09g056: Add entries for CANFD
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 24 Dec 2025 at 17:51, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add clock and reset entries for the CANFD IP.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.20.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

