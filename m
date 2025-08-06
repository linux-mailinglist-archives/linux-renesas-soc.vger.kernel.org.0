Return-Path: <linux-renesas-soc+bounces-20028-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2C8B1C397
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Aug 2025 11:44:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 42020188C493
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Aug 2025 09:44:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A39F25F97D;
	Wed,  6 Aug 2025 09:43:58 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06838189;
	Wed,  6 Aug 2025 09:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754473438; cv=none; b=jywsGQvkt9HNMKFLQn7gPLvUYmmwDBnJqkFsFIj1dUGAn1DqgM+X3rVeMskrN6WgOZMd+0KwQYYRtV9G8pM9J2LhVzOayVRdOoZVBNa1rNOyFvuYfPbS6MDWzASOFANoDzQSKgit5Y+/5Q4t3vTjhNrBy+UXifA5qT0P6biyQzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754473438; c=relaxed/simple;
	bh=J/7BNozlFsw6pBjeZ8U36kXJgJ2gFGOP7vnuEK0gBj4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=srf7WW0tbC45sCmaar+df6u/bDXwTQGC0rYzJasMAEEuLayc+R0h1xc84JOhwivPNlEIKwyEx0IYkJYlkd70MHa0gz11NP4O5AMRCzj8IynA9igfRLvSReLsvDEQCAfd6h4grF5mjkstfHXGtjN3KKqPzEtvHceSR2Twg306iP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-4fc009e3050so3837598137.0;
        Wed, 06 Aug 2025 02:43:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754473436; x=1755078236;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/KL6t2Pdp4UEqp9QFP0RnpbyZSvU3Sf6q5+37UCtvGU=;
        b=jXcbVUnL3rMQMHOXIKyMgxbQ8E4CdAi5v+6pQFJdL9G3YkCDbImRP9b1NBtmY0Idxs
         VUxyF+4CIJVVfemIYKpJpm1JvPltTGnytZ4rW2YYjESl5rX4xu+cEid4cRGGRXfrGbiV
         Hz7nuZqEjGvjcuvhjSbDM7q8xZuRP2kLSQyBpZ+WdMtASB7EW3Pl4sxsNp0N/LleigIH
         OpLEovNEbEQ5SEk3M8zoICCAks/Z7JiZCrh4Fg7fSSFXELXSxM25s19KrOunYLLrKV0I
         nH3zP7RWb1DkA+NC2MbyJUNRzgggyZVdrg4EdAPMStRyCxkeHRW/1DlvtTVPFjWPHqtU
         2uOg==
X-Forwarded-Encrypted: i=1; AJvYcCV91u6GUHUWfYqskKNXTuBJ3I7+wqHLdc4d1q2UUUwkFr+M8dBgqfFMSe0Z0RkEHJQgYn57tFnenwMFyGfde66j3+8=@vger.kernel.org, AJvYcCWM8VKuUO8ONFvZdIwlVmxuoDYiE2D+Gxdl+NM2fUTb66fozoiUYesM41Qb5K64KmotIMuEGiORRX6fNSPg@vger.kernel.org, AJvYcCWazToVHSS7t8O1vCpYoFohpoo0JxdUcHPFyUoJJRDF4n/5Z1j83R+KHfJlZPLeoJuIgpAO/KVuKQ0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQX46vwyQ7GA7mRlbrEafOqcpkpw+4OiScMWkAWfi1VInXvVg7
	WLcEQ6Id2gYe7R7SY6cQ6aEjK1MAgqLt4xoMir1Tu8ds2b2sD0m5C2H6sEQg9Ikr
X-Gm-Gg: ASbGncvA2Wgn25ddUNEaNaPMc8neCQ11KIMVF1Q0wmmX+vHLEsF3UITIVvKuW+NG5C+
	OTk8apFEXa07OifLclJah++jtENeG+8t9EyKyKYnn43NGfbENJ5CY/Tn4MoYL5KDLFhcpyAhZPi
	/aiOLiwIIbGsghn3k0TqPjamZ2gRc6VfZnS1xSwUC9k1krlgNInGujuNJ4VvUjKm2SwHxSIo5AW
	BR/yKdxuaqHt5SiJj9wxCy5C1R80Phro5FOrIUnBRnbPjDEhRYN2JiUPhLNblbXlTzP6KIBcxBb
	LfYUG6x5oTiboYvpfHczwzYHGH+T+mr3CQ7mzq9VRVUexDfGxfLuqp2XY/dG8pLq/B3TpNmz2e1
	Xiq2F/wutCyCZ6dur8r4X3k59dZu0pKtAjuqbSSw8qBhdtxvQhnDLUSeUHS/v
X-Google-Smtp-Source: AGHT+IEwBGrkD7dcUiIajVXBU8cVfrQSdTfiO0wa/p9GP8PnkT1RRs1nqjT/+An7tRa6/GzO8sbAsA==
X-Received: by 2002:a05:6102:418d:b0:4fa:d2c:4fe with SMTP id ada2fe7eead31-5037b8d13e1mr865982137.26.1754473435576;
        Wed, 06 Aug 2025 02:43:55 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-88d8f3f0b11sm3248923241.14.2025.08.06.02.43.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Aug 2025 02:43:55 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-4fc1dba2a0aso3181001137.3;
        Wed, 06 Aug 2025 02:43:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVF3nQJy0QpD34/wBb+pnEfSznCas+qbwLH1M2X6G7TP+vF8nyPuWMXXQ5WFCoNaI4GO3h2gOG+c00fixLwsCjUXPI=@vger.kernel.org, AJvYcCXAWRkvpHbeRW6F12+Xy6UO+CkLTVcCKFa9DQI3VzwRUUMJakEznfquhm3IgV4tkCxHTj5lJJ8c4tNZrnfE@vger.kernel.org, AJvYcCXr/Y/aHxj1+TBVhU0VEapLD2k9IbBfvWRjJONfkKPoXtpNw4ks3vMRHOC7r9IyA35UiUwji2cc8WM=@vger.kernel.org
X-Received: by 2002:a05:6102:8015:b0:4e9:d847:edb8 with SMTP id
 ada2fe7eead31-50378c35bf2mr863679137.7.1754473434761; Wed, 06 Aug 2025
 02:43:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250806092129.621194-1-claudiu.beznea.uj@bp.renesas.com> <20250806092129.621194-3-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20250806092129.621194-3-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 6 Aug 2025 11:43:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXeMqoVW8mcr=3eDHS_jxQD0UdHp5TGr1JCa6Pdn5w4Vg@mail.gmail.com>
X-Gm-Features: Ac12FXzhBAErA2JvZ8_GhO7pquDgiJPcOUCoVf0YtricIxCXCg4d6a63c-O7N4M
Message-ID: <CAMuHMdXeMqoVW8mcr=3eDHS_jxQD0UdHp5TGr1JCa6Pdn5w4Vg@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] clk: renesas: r9a07g044: Add MSTOP for RZ/G2L
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: mturquette@baylibre.com, sboyd@kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 6 Aug 2025 at 11:21, Claudiu <claudiu.beznea@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Add MSTOP configuration for all the module clocks on the RZ/G2L
> based SoCs (RZ/G2L, RZ/G2LC).
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>
> Changes in v2:
> - added MSTOP for GPIO

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.18.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

