Return-Path: <linux-renesas-soc+bounces-13051-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F72A30CE3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Feb 2025 14:30:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 37BC6162F07
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Feb 2025 13:30:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E669C1F4E37;
	Tue, 11 Feb 2025 13:30:47 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575671F3D49;
	Tue, 11 Feb 2025 13:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739280647; cv=none; b=gVxHT9jNEwW5eA2PbBkF0I/JmQ3K3AYUT2YkN9VShIJaqCFRkput7xuuqWgzdQyBhkyAK7viebiLK9t7TSnBYoNVnYk/cd3XpTZWgq00bExtvdUBKo1HVNzVa26710jt+jkuHEUc1IaSc1/ghMHc5kXpNjRF/R/ygLLBFwnhhVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739280647; c=relaxed/simple;
	bh=0toQQ8LteZYJc7LhO8NcCM8bng4TtvhoEX+VfTgoO9s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dpCbvV4nyTuo+McL5SjqmZudf3KZlH1bjNT1zzRGylUxmkAm9orwsmXjPG2Onu9qFikv6p1W+724pvDTe4SVeob4/Ua8APcXVOAxnv2wlK+mbffYTlcuRsPR2YgmyJwMBRhrPgx+VoUSexenLtTmzx0+92N4ba4QGH4Ych9afFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-866fbf798baso1331715241.2;
        Tue, 11 Feb 2025 05:30:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739280645; x=1739885445;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DgfHupTEHGdpuHWAfe3g7qo7GPWOsxDiPxLGtPiLNrk=;
        b=YWEoc+VPzYZZrIhR3beXRgd9s4pSoOyCC+pzgA0eO0hhF4QxViDWqPL5joRvpXIWXf
         4vpBHbG36aCEvCC5PrFCy0k9WZDEEClaGT2/zWwnV7MjtC5LMp1ucYkWSxo4z9xE0SGN
         vbqOxQZAVU3s2NRhgn+TY3CUe31RYj7ml25yusqNZ+1tsC6T8nZnoortJAhE+TqyIDqN
         XTxiUMbI5pWguUJhftA8ou6BGD1iWuL17G8d/TkaYGAO1y+gEUV4q2u18l4ZynpZTPVk
         5d3COZ7CYPRsqOQ+s0XZUMnZTMY41kcbFSYTGAA9xq2ZTLYj3EKcbrwHzBTX/JWDs1xa
         V7xA==
X-Forwarded-Encrypted: i=1; AJvYcCUJs/NWJYL5t6kkV7dbYdrO3awDQ3BhWQSRObfW/eRtc86BKy5E6FmafYwRo0BdoN7yzStakMaC7xo856ro0pmM8uI=@vger.kernel.org, AJvYcCV6n6+vfFUo8sNdiNELjrpD6OHk7/WxEQyr8Xrxsla/KppE92jGCYYCg2Ydy3I2M36CcTICnEV/pD6I@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5tyO/eXUvl/xSssGt5wRozDFXuIjZrmokehKnCXlKmZV5Xov5
	NLULYS4VWsQ0QisikYOMhz9rhsK3YVJUyfgVyTjUS8KPCv8KjfisFA+5GyUti54=
X-Gm-Gg: ASbGnctpW7z/yV3md/mlZU1r+9ZWlYb8SzWdbEKhmGw9VNNd4HUxV2nIh/J13FYCd+t
	ZQs3U16k1zG7KbGTVcVlKQ2A9AjvRI42eeWTOqgkNjyCtdFMwvffWtUqgbSVqyBGz62ovMI6DX5
	0YwGDxAgc0mCU0SnLoDK6TsIsEyLAjzmEaQx82WyR8zkkJvY8aOZIymoiTMvvGiAv1Bo1ftC1nr
	AsiQQF8tbGdv1BHZPtLJzwx7ntLwrNtCoGMLfGpTaiU+lX2DA2To7r2leU8GVHBnvNX7ngFfbBb
	YnlqI3L93z5bz2zWWL1GI6ZUhbWrB0ePWUgyTi5eDd2gmk5flr416A==
X-Google-Smtp-Source: AGHT+IGt/pklsUukUCpcftGAcXK5//zTMfUQivcRd/wuGWcOeueIQFwmiWMCcNW1nHNpnYl6YKh/Bw==
X-Received: by 2002:a05:6102:2ac8:b0:4bb:d31b:7ae4 with SMTP id ada2fe7eead31-4bbd31b7dafmr3698262137.19.1739280644814;
        Tue, 11 Feb 2025 05:30:44 -0800 (PST)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4bbbff22a46sm912821137.16.2025.02.11.05.30.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 05:30:44 -0800 (PST)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-4bb0e7e6cceso657838137.1;
        Tue, 11 Feb 2025 05:30:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWjc9zM9yJ3BYvh9/JTbGAqbXhWlEBoqUjS4WjosOI+lLW77S9mqr81lzbpvDdMI4CKD/akAHT3RX1ES+8l0iXqcCM=@vger.kernel.org, AJvYcCXPiToCBLBgur7o8HaiAG6mzv9SLrZtGLuz+HAW5wZn+B9yRZ/1XaPAV9Gh0j1Z1K4GD+txPHUPuzp0@vger.kernel.org
X-Received: by 2002:a05:6102:2b88:b0:4bb:ba51:7d54 with SMTP id
 ada2fe7eead31-4bbba518077mr5764763137.6.1739280644298; Tue, 11 Feb 2025
 05:30:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250207113653.21641-1-biju.das.jz@bp.renesas.com> <20250207113653.21641-13-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250207113653.21641-13-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 11 Feb 2025 14:30:32 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWvGY8PwWneCcqXvXjjvGSdDq0DkeTRjfH7yWbioN5Z7g@mail.gmail.com>
X-Gm-Features: AWEUYZmTOJOtGNCLIQIOL2Iji0g-tAhn0vA0sjjpKfMIuKAnowEalSAp4T3vkhw
Message-ID: <CAMuHMdWvGY8PwWneCcqXvXjjvGSdDq0DkeTRjfH7yWbioN5Z7g@mail.gmail.com>
Subject: Re: [PATCH v4 12/12] arm64: dts: renesas: r9a09g047: Add icu node
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 7 Feb 2025 at 12:37, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add interrupt control node to RZ/G3E ("R9A09G047") SoC DTSI
> and add icu as interrupt-parent of pincontrol.
>
> Reviewed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v3->v4:
>  * Dropped RZG3E_* macros.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.15.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

