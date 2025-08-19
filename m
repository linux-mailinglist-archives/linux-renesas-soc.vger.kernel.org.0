Return-Path: <linux-renesas-soc+bounces-20700-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB68B2BF48
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Aug 2025 12:47:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 65C761BA5BD6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Aug 2025 10:47:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF527326D59;
	Tue, 19 Aug 2025 10:46:53 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0EFA322DD9;
	Tue, 19 Aug 2025 10:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755600413; cv=none; b=L3S79EUbE1dyP6hfOzw1tl0S3LJEmJ+dgzcKtkYxedf+AYrlANSsx8QkbJOuiKaPrOJ3JtQVfMdZQ7jPw4d0P6bWiTEeSu02ZBvqJ4lz06KUz93tvOZWdyj9oKonlbBPhZxMPm6roP9g8ZgzYGuGRbKz8GsaqGfok4tVHyd0LC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755600413; c=relaxed/simple;
	bh=uopoiV8HyAqxU9op6og8ChAkirSUUQctyoGCBvLV9t8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C7+MeaCSzvtyBOUtC65gPQDtLoB66ESllWp5BM2gO0QAnTk6QMkeuwSBnyxn/0OhTULUMhpqKUIsFAU8mnNkZfTekQO7rlxeaoR0Jl306MMmDXDD/M0fLKRmOEQM4HXJL+sQziWtDA+njNos6WovQEti/TaUn/MZKL95rkHFft4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-74381f3a3daso2397566a34.1;
        Tue, 19 Aug 2025 03:46:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755600410; x=1756205210;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=doFbpw5H93w6OCFZvWHsPgEA4fiQmo1QkgmSlnIHgck=;
        b=mVLrRhMMsSW+PZy6qVLNMJe2Od4nqEbsD4YpMJBIkzbVga6n8nzFsxOeyBB57Mz10o
         3uk7GUqeygKq0YZ8jlTPgZkewdxL8BNpS1OSNm+baU/wD7nrvMM8ezYqcDsnfx+A0E1S
         +xBJUGdS4uTnqxv9FcaWyCkQAyWjNz+c6etwpcXWb8NlVl9V0vNdc2mJZbLkh3HznWDm
         sCRH9u2J983ykGD+oyegtHt8rzf7Xx4V/VDRErLAgyGk+ZXIeZezjY2dRP5n6yShawaw
         5Iqrt2MlWcZ6GUlh7N7WuFU5W1ZiDUVRVJYdHnFm5YMrnMz9w7cQBTRsUHdvRcvIM6u/
         7njQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMGxfcDY5CNX9rQGtj71N58b7KAYWS5NwtgS0hykKj9WbiyHh4AzyUDARW18abtBNCuPGBrVPnieoz@vger.kernel.org, AJvYcCUWZW4GyhtoiPFnfK2guFiZ6QEC9OS4HXZN87LyIagFUrQdH8Xk7FYC2/QnDXOka/doISnDpsk5Gv8GPza9DhsJrjU=@vger.kernel.org, AJvYcCVf8747iLKSagUAKdAmIwR/WFcm8BPmReLxyB/hDCeu14on0KKA0Sm25EW4UuME+faw51EkTu+xlkX1@vger.kernel.org, AJvYcCWp6WvWaS343yYosG31pYyvt7+HU1Cx0hHjczPc79x4zq7mvViCCmA1Cx3Lj/E2JK2NFBLkAyT4B9oDUhUx@vger.kernel.org
X-Gm-Message-State: AOJu0YzLLu0K5ancwucAd34yhzmlJmQIEFdkOBgdB5XTm/Ytc3Q9fleL
	qXUT86chifOFOmbCbr00a0PmZqO8TY9tuDIcSHgE60JTGixk9CP/KCdpb89bW6Zp
X-Gm-Gg: ASbGncuj7Nmp91giq929bO8sunnh4xyBNi2TXvXtnFFa6T4XYzbbBBmtHS1qH9L6FEz
	SIY6HUQ/cTvolu83wH27vvikeZy0aNduVBy1gTTgN6gfd/PpI+UyNPQ/V8KOtLwv7/Nm/mnRW3u
	ZhisnajlLuz9huvLsz8WoKC2vuGe4t6bK+wSQ+6q6ufybVT6ul5y/0JP1F+79uAOJHtNZsesrdo
	1dAq5YaDBRrf+OhgogmUrEmheufA3mTcJfEdwrILirNYodhFXL1e0gBTbMzFSnYpZRh+DQHC7Xb
	eWrfxWjB02Y7OdaIXCIgOxFvch2Kp4zbiC4BehQnhk7P5uLpoHjDYRgM58QqmQHu8KdTgcC+zaG
	9M6w40K5S/lygf89LIXM+1Uoj7tDjxHbIeRprOG8Ea5noftSL6sRUnX5Uap+yxedfysbob7M=
X-Google-Smtp-Source: AGHT+IEu5IukSeD8mPykXzn+hztoe/vfT0lWboNhEX/LD0NwIRwj6GFYm3rYRDtEkMj+OFi4432iwA==
X-Received: by 2002:a05:6830:2b21:b0:742:f90c:ec75 with SMTP id 46e09a7af769-744e0afb22fmr1342088a34.25.1755600410421;
        Tue, 19 Aug 2025 03:46:50 -0700 (PDT)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com. [209.85.160.50])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-310abb343d4sm3355355fac.17.2025.08.19.03.46.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Aug 2025 03:46:50 -0700 (PDT)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-30cce8ec298so4336225fac.1;
        Tue, 19 Aug 2025 03:46:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUJnimBvoMtASqwSwBRm5OG04SEALKBOlecrUf/2fzu8EMK9w9//AfGAl19znHKhzdKe1RebxGn8HEy@vger.kernel.org, AJvYcCW+PS4F7MOYi8kNx7VdpbYwytUtfgdRtHEtOVhM2OeOTtEM0nWXTw+wl8M4VgqGxQ68VnH40o80/9I18dL5DpjPqaM=@vger.kernel.org, AJvYcCWoW0YJ1yR/hQJ3/kINDpLMJT3820vtdljB10bEtcc+VT4szscA8p5K3EJ8/988ejvWvYPZj9nH9HYM4dft@vger.kernel.org, AJvYcCXpX+WBXqyCqtA3qoN8Zk0cuLZZIAh+0v+lK1S3SH9LBym3rTCGeOIxPIpDpX6pvuY0Y9jnjX/XKbnu@vger.kernel.org
X-Received: by 2002:a05:6102:548a:b0:4e6:f7e9:c4a5 with SMTP id
 ada2fe7eead31-51924b3b1c1mr573466137.22.1755600045268; Tue, 19 Aug 2025
 03:40:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250728201435.3505594-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250728201435.3505594-5-prabhakar.mahadev-lad.rj@bp.renesas.com> <CA+V-a8ujMaFFOv8Jd-5=fKHUEfVji1Xt5y_h4uwtR96TBz4VNA@mail.gmail.com>
In-Reply-To: <CA+V-a8ujMaFFOv8Jd-5=fKHUEfVji1Xt5y_h4uwtR96TBz4VNA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 19 Aug 2025 12:40:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVFxaCrBu0fAJX3wmY9wdgHn1O8-cVOS6OKN6HGX9v55g@mail.gmail.com>
X-Gm-Features: Ac12FXz7ywVTeSgdEqc13iyHS6v2zZGzk_1Dft3Db5rZ3MNDTn1vQslXfUK25bs
Message-ID: <CAMuHMdVFxaCrBu0fAJX3wmY9wdgHn1O8-cVOS6OKN6HGX9v55g@mail.gmail.com>
Subject: Re: [PATCH v7 4/6] dt-bindings: display: bridge: renesas,dsi:
 Document RZ/V2H(P) and RZ/V2N
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Magnus Damm <magnus.damm@gmail.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 28 Jul 2025 at 22:28, Lad, Prabhakar <prabhakar.csengg@gmail.com> w=
rote:
> On Mon, Jul 28, 2025 at 9:14=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail=
.com> wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add the compatible string "renesas,r9a09g057-mipi-dsi" for the Renesas
> > RZ/V2H(P) (R9A09G057) SoC. While the MIPI DSI LINK registers are shared
> > with the RZ/G2L SoC, the D-PHY register layout differs. Additionally, t=
he
> > RZ/V2H(P) uses only two resets compared to three on RZ/G2L, and require=
s
> > five clocks instead of six.
> >
> > To reflect these hardware differences, update the binding schema to
> > support the reduced clock and reset requirements for RZ/V2H(P).
> >
> > Since the RZ/V2N (R9A09G056) SoC integrates an identical DSI IP to
> > RZ/V2H(P), the same "renesas,r9a09g057-mipi-dsi" compatible string is
> > reused for RZ/V2N.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > v6->v7:
> > - Renamed pllclk to pllrefclk
> > - Preserved the reviewed by tag from Geert and Krzysztof
> >
> - Included support for RZ/V2N in the same patch
> - Updated commit description.
>
> I missed mentioning the above.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

