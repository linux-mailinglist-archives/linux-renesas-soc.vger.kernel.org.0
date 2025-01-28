Return-Path: <linux-renesas-soc+bounces-12665-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF4CA20BAE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 15:05:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4043E1633C5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 14:05:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B02101AAE1E;
	Tue, 28 Jan 2025 14:04:41 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 483C3199FC9;
	Tue, 28 Jan 2025 14:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738073081; cv=none; b=pGmij+ZSbj0x8MvDvxEbmSwvcWRl5Yl/w+T1veBetNu0OXZJkn/BMkHmN058RuD4Ylxnq7PwQTqdLvKyp4KEtXPhcq3PQ8rtU8Q4tkVb/iHM+vC5+w1e41ARGh3kDkgHTTPf08NVOHn+65u7enqKW5ZalUqW5WInhFVHJfFn4Ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738073081; c=relaxed/simple;
	bh=p/Tc4YwE3Aw8cZ1IvliyJlcSS6HKWeLeUfwcsAn53TM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mt1VIzS0YDW3Shqg4+VgpQdMxIV41LZgWgMbI5idTZyXCRS+HtErol74MacgYJHj6Pkz0VPytp8Q6P/UVe2pxz2yGdPNruDshGq/TvwjPCdIQa0EYauNtl5zYM1lGa7RtsL88WrPT0fPLJkPc8V9CRr8keURMm6yPmspNh99Dl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6e1b11859a7so29984456d6.1;
        Tue, 28 Jan 2025 06:04:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738073078; x=1738677878;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qqDTzJz5hePsvxdrubkaGNVMslbwXkzcwwtfJ8AOF6I=;
        b=bN+y+x0Bv9i8o9LgeXAGYpxhsOIK4fpFEfpcnwO61zAtcI8wUq9A46hsEw8tP6l6sK
         4iBIljYizH51QH8O/oBJfvKVq7/JgwLPqzHRjfYTYVs8GOtWKHi+SXis+3cJU1EYOtzF
         RDLZL0E8/0EFn38/lxuB2IAHpukXSL2rhautoDTZidz/MwAF7NS4R3N02ceKhRgBG7ac
         j/zZJvrZJehdsiGdi014CewUm2dAwI2uMqZRgsPxg+er4Cw/AjWwap3exEfEmdy/tLu8
         NmcXDY7Fu+su9XFUfvF3pKxlSGoXB9W21x8+n3mRygJxaMZkgTpbRMyuP+/zJxQiHA6F
         /xMw==
X-Forwarded-Encrypted: i=1; AJvYcCVPyjJP7h/GbjLc0sAa1cRA68Ne5QIRb6aXSeJgCHDk63MhuhxCcK/TDEcg4gMTvaNt5bMeaw8/2s/24Np+YySgiM0=@vger.kernel.org, AJvYcCVmlQ0n152YqVFCcvNt46+HIkfsXpwWSWqfPVKCaI/XLz6n2PI8gPi4XfDGCZtpGbQImwsodvsqPxml@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8fHfrGgBWq3bGD/1d/f5jUtZPwM++ZmF2tALtneX5B0IJLzoV
	YBaLObOrL+8H/yAhvUQe41KXWzmXtSZUotqws3Zet6S2KHWJWvlGCXn4rBa3
X-Gm-Gg: ASbGncupdFXsAAbXSa4BAKs+PEjIVQcaS/j3dSUnRCy12ZprauL8TKCG98o5slaMa53
	cCris59ikNQUvXMAOQJUmQsubGmjQZHvSqu8T2YznYcps6TdAUpKPfxro1dJlS+OvVYa5wvAPVK
	ilGMnaPFlQnzWD3pimkn55/1EYy2nmVnta+VHKe2en8MF+BHUxCgeM7cf3Bc57WIrAw4zhRwq3N
	GH3mOTmIgdKG7rlYtUK1GJ6LZf0Un0ltjlgyt8FUdLA2del4al/BhzGROGL22DjgIa3DQTmWhAO
	5HhyGzT7pnb8/A7U4fwTySpdZn3Ttw7VWtdLnxYIDh7BtFlDLFTk03UHkA==
X-Google-Smtp-Source: AGHT+IHe5y9TV/CJ9vv0mnjmtaWq0ZCcmgvFyhToiheDYacnRYMRE6M8PVVytecehIkfIMeXdx8exQ==
X-Received: by 2002:a05:6214:5289:b0:6d9:2e46:dc35 with SMTP id 6a1803df08f44-6e1b216f921mr735049466d6.25.1738073076188;
        Tue, 28 Jan 2025 06:04:36 -0800 (PST)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com. [209.85.160.175])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e2058c1e80sm45274856d6.102.2025.01.28.06.04.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jan 2025 06:04:35 -0800 (PST)
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-467b086e0easo31435651cf.1;
        Tue, 28 Jan 2025 06:04:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVwb61eKL4H2u/f1qCgWQNjWHQBD+ANpbX06ifnAw+9Pmtee3bnwqQEhHi49x7d534LwHeynN5DrZVJ5qP6HYZqP5k=@vger.kernel.org, AJvYcCX6EmJNq+c9I4TaP0oMzisPtb4UYO3sDSyE6FPEtBjMUKvUQOpg4hhIPje7oIQ4A90PaaYDfyY6Mufz@vger.kernel.org
X-Received: by 2002:a05:622a:255:b0:467:706f:14b7 with SMTP id
 d75a77b69052e-46e12a9a0b6mr634987401cf.30.1738073075300; Tue, 28 Jan 2025
 06:04:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250126134616.37334-1-biju.das.jz@bp.renesas.com> <20250126134616.37334-7-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250126134616.37334-7-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 28 Jan 2025 15:04:23 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUUS03WoyvH6sPq9yaqX05ZUa3bMR5-vYBn+z-xTNGKWg@mail.gmail.com>
X-Gm-Features: AWEUYZndoJaF2dSWNA6p9NcHANJPrrrs6RPwpgOw_HDb6q_59W0Dmo6rURTAZio
Message-ID: <CAMuHMdUUS03WoyvH6sPq9yaqX05ZUa3bMR5-vYBn+z-xTNGKWg@mail.gmail.com>
Subject: Re: [PATCH 6/7] arm64: dts: renesas: rzg3e-smarc-som: Enable SDHI{0,2}
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Sun, 26 Jan 2025 at 14:46, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Enable eMMC on SDHI0 and SD on SDHI2 on RZ/G3E SMARC SoM.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

