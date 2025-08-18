Return-Path: <linux-renesas-soc+bounces-20619-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C8581B2A27C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Aug 2025 14:57:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D7C693B4FB9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Aug 2025 12:55:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FB493203AF;
	Mon, 18 Aug 2025 12:54:26 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64AC031E119;
	Mon, 18 Aug 2025 12:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755521665; cv=none; b=kGvWJy+lbxYMnv06CayooUWto7ccCBRrZr0nYB9nJ0LKTT+RLpoVAakMcom3vb9FhyDxNVlcWfNMZGsRJwouY24DsMmo5GLRwzLbD2izBWwLeNfSmJN5R2e1Spt512B15BzG/ywI9j5HVHdImSlQ1+7/rhigKPGz1yJswq70Zr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755521665; c=relaxed/simple;
	bh=npZbQsrRejT2E0lczZ99NX4TSPxi/r04BwGuTmn1x+s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N3rFmybWz4sdDwiw0wjHfSt4tetukEFG1sxMkUbpIeq0heBIW6K42x1STOry1PbvIxKFDXBB2O524XWQrMs6J0N7bThtCql7afXbjvGDHfVL9zuwdj7ItH7biJewg+hCEpwom3hqC3blAoLyWuuKxlRFEGWZkltsplzONG+DQ0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-890190c7912so935964241.2;
        Mon, 18 Aug 2025 05:54:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755521663; x=1756126463;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u/WeosVhzFRNpU6iFVwmh4j6UHgwDj0GnHLcrjZNofk=;
        b=QcEWhKvkhMFv9a+paxuILRa7qQ6QP40+lcVDR18AG39p7gx3nndMbk7gh5hDq8zXTf
         l4u1qbz8/Q0Q5/pNUgz0N+jQ+fuva3uXbag8gbWg81MV1rfPNOHHKGD4JRH5w980qAcU
         uuTjBBjUGI4EuTRGxNj3L7qdbtvDkJv/hBywI2bUnIj2AMV4yKioiysogGZVV3eSXICo
         GavREJY0MgYjgGW+njUyrZhpqgVxftn0iOzGhNzE8l7s6Evz00FS3x0CdbuUTSVYjceo
         dOIdiiic6QBhfcN224Rcjclcu8xBdiLy8ZMqeGlVjI3/T3CrRNEJx9PnKgOF9Qg6HNGm
         xEUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPTpALc+CD/1ffNFzk1diafCLuHVCJRFGEJBsa2Y5TrH4xWXA3ySR/gqGrwvf36un2gC4S0mj2B95WtBhk@vger.kernel.org, AJvYcCXfk1yN1q8TU1gXqLCwCu2yyXi1aKovD1zXnlgQv86M7pd+78414IEcjPG90dZU1hViyCqcPWEWYXobbHujmkNJJ/M=@vger.kernel.org, AJvYcCXqj+94tUw5mrjqe1ruaOdL+C2UeU6gWEaReOpW3ClmmWewFts0c44uS/Cc83gCXKp46XwjuM0nXDkT@vger.kernel.org
X-Gm-Message-State: AOJu0YxDOo7radCLGHAhTJab5xVv5Jls/SUphHHYxvhPn1e5jEM/aNAI
	pFbZpSU8ppG2+0GhfSFA66fZgZr/7frVjt4qEEZX6PJq9fnKJHEHOBoloFekKXCj
X-Gm-Gg: ASbGnctdDh2RB0AsUGya7jiS5iaCQ5ka61m+SFu38RXvgmQkxG1DGkSRChJP8lo0RvL
	WtBrLxeroSycQfl5OS9KrXT6FEpEMujAqgOVy9PaPEpT2t/RoYPlTiG0HtyBy+LLT3/RV7SA2lQ
	20FWYcGJRU9Q2Qle7WM4kCWtQilC/ng+BdmoA2rvAMzBd3YjPoHe9tzbSHzXuTp1DVElv6FvBqY
	mUnlHoh6F6xi5vtu0Zx8KlOE1PsZLpksahXnHUjkweUCQhwcsMsWuMUsoWKzTXP17/E8KAQphaz
	3MM5cevFp/nk9suXhkfOHYv6l6R2I8sCQWWYpa+vvy0ZgcoTegLnAbbdwIJEq6yYOT+L6W6tW9J
	PqaR3dHBwbRD5Rb/PW86GaPottr49bfs2J5oOcOwbmXToxbXGkEyqIZ9JTiY6
X-Google-Smtp-Source: AGHT+IH7VUUJJ+NCxXWZf8iVVpxa6Lr54y90VQHM3QkhjdF9GxDEAVi2CXUK2BNtFGYCHzIUTtr3fg==
X-Received: by 2002:a05:6102:951:b0:4fb:372d:6d70 with SMTP id ada2fe7eead31-5126d8e0ba3mr4235597137.26.1755521663309;
        Mon, 18 Aug 2025 05:54:23 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-890277e5388sm1744556241.9.2025.08.18.05.54.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Aug 2025 05:54:23 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-89018ea73d1so1175910241.0;
        Mon, 18 Aug 2025 05:54:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW0txiSkApDRJxFE/7lN4kkC9Dj7Kz/7tFlGTMVss0dnBSWmgJnLXw5AM2GD5+A0NSo7XgL8iy9mUOHfbOY@vger.kernel.org, AJvYcCWBCiJyLUj6bO5x++KfoWGPlWb5fGQkRBSrjPkytCsEcv5HIWULEclBpSAzXtkdJVj3iXgoPLHboHGtuWJdY8USQNg=@vger.kernel.org, AJvYcCXbNLrHBn48vRfNvS5NbPwkRKt46pazESdgklA5uc8X3cSg7OBIHayADp8T9csHJZrsFGcMUZRzfhLl@vger.kernel.org
X-Received: by 2002:a05:6102:5805:b0:4fc:670:fbf with SMTP id
 ada2fe7eead31-5126cd385f2mr3751347137.18.1755521662718; Mon, 18 Aug 2025
 05:54:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250812200344.3253781-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250812200344.3253781-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250812200344.3253781-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 18 Aug 2025 14:54:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWDn2vXDDTUA=5XNw5K45op1ZK8a=scTEzXyqcQLgdDsg@mail.gmail.com>
X-Gm-Features: Ac12FXzcPC9_P8me4LcEIIggtjp5QxKRbObGClkBUS8mU7fsIhzRX3T9OpYRJxQ
Message-ID: <CAMuHMdWDn2vXDDTUA=5XNw5K45op1ZK8a=scTEzXyqcQLgdDsg@mail.gmail.com>
Subject: Re: [PATCH 03/13] arm64: dts: renesas: r9a09g077: Add pinctrl node
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 12 Aug 2025 at 22:03, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
>
> Add pinctrl node to RZ/T2H ("R9A09G077") SoC DTSI.
>
> Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.18.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

