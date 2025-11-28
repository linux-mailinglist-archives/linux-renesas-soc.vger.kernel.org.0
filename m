Return-Path: <linux-renesas-soc+bounces-25325-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FDF8C921EB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Nov 2025 14:23:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4217D3AB66A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Nov 2025 13:22:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02C0B328B5C;
	Fri, 28 Nov 2025 13:22:18 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DCD0223708
	for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Nov 2025 13:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764336137; cv=none; b=jEIkEX+lCTKehrox547IIVgDZJEfEOilDB6Fe4l/zxetv4c8srwlixE9f+cpDKUZKytQ/A69VbNNaA/hhkBlG+NcxTvg8N2hm5oUQxdalF0JU7WrZyICcghNfsz29LqfM8jcjToVCoQ3sWtGaLZpQGc4kInvxXu6N2CIPvZjmLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764336137; c=relaxed/simple;
	bh=7xq7heuAuNjcD9AWEu9SNI+F3md/r0GAg2tKCEJ6BPQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P8d32yUN/vGQw297aTN9ARMd81IDLH0CBnTnFFtffYioUQOIqnBuXhlCl/H24qJ0Xq4NvxatRatCaOZy5RWppBcSdiKX8F/5bCEHI2FtSwL9BHhDTVroUCpTEmwM5oWA3Oy9775Ctg+m8ev+p91Jg99bAZfMz7qkd41o4fJvS0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-55b302b8369so1346056e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Nov 2025 05:22:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764336135; x=1764940935;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tcaEGBByo1RvJh5lFhRaZZz4cOGVoFl1Fq3F4IKlddU=;
        b=MjfRPtjblQkY85xBbasvUDXwXHXtLygDEAVW7CppQa8FFQ+35GIbOp525b9DV9O0Sp
         +xk1+dHgp9SY0f2oNqKMQrgGwAFsayIyrkJ5LkAXUTjhEqCI939xwMivb4CVZHCTf0Vh
         mEZA7c0c9l4ROcnXSuHD2Eq1sfBPPTM0H3wxJlHzz2DLP068JTeEwUVuwNFHmUlG6vbB
         V3aktNyXDHdxPfMmEQzjQwhLAA8OEayvYOTRcssa+uohfdD3at2sXZPDDfbqt9pnFdZZ
         t7+WyL5AOWdwUMR20ErSflPRn2Pb53Dmx17LkNdaAuZvstmgpRNpOUW9rhjFvsViZDBS
         MP8w==
X-Forwarded-Encrypted: i=1; AJvYcCXPHZGdxE8ghr97S5cs1C/j2CU4a+OmmnFS2drPe1Wnc7EDECFJ7i0AAYLjGPQIzxo+7RuLynw8ck4sw3yacVFVdA==@vger.kernel.org
X-Gm-Message-State: AOJu0YznZlrQtKh6ovc1CSiJh/EL5ylW2eqY3Avpm856yubq11923ewx
	bvIoX/jKCXOXb74GhrHDqyBJXli8liSLMAfZ6gCsXE4/oRNepvYqgN1qehwzFIex
X-Gm-Gg: ASbGncsQzTKopYQ/wd1bAzSduZPj3AU/2XyuUnyehAc9ZbC09PsGiidAooYlbC+s+wt
	3VuHN6JtASHYT6eZIxmDJxLjQbiUDmeTIvwEpc9PNZpEZtmWBmfuxXlHjHv7b0cYbe/eUWeBM+i
	5ajYZjrz3lO1GUvud+6DbLXq1QDqLlMc5E5QlRxIdUy9pGf5I6K3GEVMURNXiWoRh0VzAHj6EQc
	blz1xFM96Z2wCDeB9c3MK2/JHsjrqfDAaE2QRH9y/QoAtnZWRfpZ5T78wy5yt2NRoERI7F1x3UM
	VR7uJmakYWOuOrrcw1K+Udm3qwydDZ/LeB1ScHVYpW6gBaMBZDqXCChQBU+eM05g5UhzsPSZGmq
	vartfYDGVgRHpdMD8ZBypfleXM6Hqy7QnxSSM9+y76rvFPE/Oy1QIq7T6DQ+jFxJ1YUcMQy+Pl3
	eJ5QM1ex0/pRmJJD8m2F2QP3xOtDA688OXIZTwl/42WHRZAWmJ
X-Google-Smtp-Source: AGHT+IG2ZIv0I6RdINmIKGkSTk2DGsep+kl465rgragZiLr2dMgpz2TegQbWS08H/joR4pc6XE6RcQ==
X-Received: by 2002:a05:6102:2c12:b0:5df:c228:28a1 with SMTP id ada2fe7eead31-5e22420ade4mr5168715137.1.1764336135046;
        Fri, 28 Nov 2025 05:22:15 -0800 (PST)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5e24d91798csm1665042137.3.2025.11.28.05.22.14
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Nov 2025 05:22:14 -0800 (PST)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-5dbdb139b5bso1562152137.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Nov 2025 05:22:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWS3T6kU69+PoqlKsRZFa+dsNmilnf5JtXGhOJ+vIJxFvYfoRamaHgVrW8KSAiW3EntBnXjNaCdHijbeaaXjOz/8A==@vger.kernel.org
X-Received: by 2002:a05:6102:4a82:b0:5d5:f53b:c993 with SMTP id
 ada2fe7eead31-5e2243a02d1mr5248809137.24.1764336134499; Fri, 28 Nov 2025
 05:22:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251027154615.115759-1-biju.das.jz@bp.renesas.com> <20251027154615.115759-19-biju.das.jz@bp.renesas.com>
In-Reply-To: <20251027154615.115759-19-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 28 Nov 2025 14:22:03 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX5xZuc10atbPNWqp9HAuzyjpodwnSBg8EwzROYofK5uA@mail.gmail.com>
X-Gm-Features: AWmQ_blcTLv1QYnn3SKmiJb_vImA91RYPRO6L6lPFzjYh517xcHwm6NvnPPNBcA
Message-ID: <CAMuHMdX5xZuc10atbPNWqp9HAuzyjpodwnSBg8EwzROYofK5uA@mail.gmail.com>
Subject: Re: [PATCH 18/19] arm64: dts: renesas: renesas-smarc2: Move aliases
 to board DTS
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Mon, 27 Oct 2025 at 16:47, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> SMARC2 board dtsi is common for multiple SoCs. So Move aliases
> to board DTS as SoC may have different IPs for a given alias.
> eg: RZ/G3S does not have RSCI interface.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

Makes sense, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

