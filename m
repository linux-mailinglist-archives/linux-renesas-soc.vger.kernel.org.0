Return-Path: <linux-renesas-soc+bounces-20358-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA33B210C7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Aug 2025 18:03:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C07FD5014DA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Aug 2025 15:53:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 178A32C21EC;
	Mon, 11 Aug 2025 15:33:22 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AEDB2C21E9;
	Mon, 11 Aug 2025 15:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754926402; cv=none; b=u8SbDW3IvXoLbeLReTMQinm5rCXdgzG9M9wuS6MdbKDVmkeSMjjBDCICYLUiCcYyn68zMzqIJchGiGw0sEQ+CBLpUW7MNybAGyNHMqlEgf3MGTh48TcvPGdOJzcNZgomyDicRPsdYXKXU6cYyl2CHA75W9u+hh5eULH3RIlGOwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754926402; c=relaxed/simple;
	bh=sam0O0gFFTvaDLCDwoj3LDWHd2nl8YM7q0/Ya/tO0ug=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c/LMSRHw6M8vqEkumcwTdkwBrhItIb47+SMZZ9urfplUlx/BoyANLiQYVTYL2PVmhd8sHZ8SExWuxWVhSQcAllaT6nhWIt7MXSEJPqozbHvc+1gzF02Pf0GK+5U6ducjPVh2yPAA2sS7CgPAackenpMxqATNjg/VLdrSlZQWpHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-88dbaea0580so1363426241.0;
        Mon, 11 Aug 2025 08:33:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754926399; x=1755531199;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bcw/dNPhaFdCrh8d6GM2oodvkRVoUwmOSrxKP1kCHGw=;
        b=UwbKp+Pi+TNxnveUewWy1n3Vw1b8uh5BSmV6b1tLsuX/A5d6NRL0TG3Zez3GHK9gxu
         e3i45UCZNQSI3not5qhX3YwwmZaevJvnOnv5x6VOVIlgj6p/E+EgGi/5nB0RgYgbzQRL
         Av/+N3lu9/8w2utsc32tvfhrIvCFy2Ypr0wSUDj/yc7k83ToBphc7MHGoB+mHSzTrN9M
         ooS+DRNOZ06wi53J3ItYfqtHDIvF5yaVh/2XMcBtTwlVC30HI7H8GADqzOWba+xfaf8F
         UP4vSMlKhif0y3F2xSgIIU2vkwqwy1dDjCw7b7Cp/TzAZVn/FpK/wqgk6znz+Fo2uJrs
         pkMw==
X-Forwarded-Encrypted: i=1; AJvYcCVq6dHC3ca8/3IXVauLP2NrabKCQC+bK2k6ehRIq+b6H30vxJ/VCd7d6jeWrIkxHWYGAf2GT6xeuN1GbQfB@vger.kernel.org, AJvYcCW2rEGU90ltFH2fWWvbkHDVDR2tzZY+t6LGs1ifibIviuw0umF9bj/duWvxaQBF9riFPfnap4+vFiHG@vger.kernel.org, AJvYcCXadmM8r4GA9qZyqkZNwQqbPPBwJDFSO+Xprd0SFUhXDVGLKvU5V7DWkrPkI7aa3MH+bWinVuWFIUourTJtgHLF8sw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3pPVrl9ofNvMTSj853MPzkBFAKGMT15kElsqoJVO6VTbbecCL
	gOEjmQmtV6VTZPJGD+IlKKxkfz+xt4t+CMwbN7Edms2GmCUA9vFYeRVT1CkFu0Ha
X-Gm-Gg: ASbGncuVuKGCr5oAe2glExuFtbmn7XJZB/ZqCgzl8ToMKVt+3yaabWae1nCctbzfjo5
	DJBWk0XYGKYLqlLh+4x/K5O7fxzlr/1eDfK19hB0GK/qWvQjSU/nqp1TeCoa6yQTkzqtKW06p2D
	yfEBMMsyOqqoGND/ICb+08XX3LyHtnAmGZGekRoc5/mk08ZSyndysJh8cMYfy1TUdKDeaza1ovd
	7mXEgr4eoCYVDLk6Z2Odl2DHU2SNILPNQyHdIAIGWjSLEyJWxIaxyR6RO+l1Dlne/vtS/6bxoHv
	m9cc16HUxfKVGIWCfwmC4R+bS4KzSOf5Fr2b8HC/UZW/c/mUKthwct7qIYD6gyASARWjbWLe2T3
	K/sjdaSpEiy4fb90CpXmgZUNTH3ID2dMXvAm2YNC9onnHhQaW1bf4VB8VKEll
X-Google-Smtp-Source: AGHT+IGJ/rIzVMGVgZvdje4uIaEJuXb17xNVq+W+Pz3Qx8pzqOjxRBMqhXqtXIuAVbrW80tNH7joUg==
X-Received: by 2002:a05:6102:6ce:b0:4ec:c50b:d587 with SMTP id ada2fe7eead31-50cbf35243dmr126574137.19.1754926398648;
        Mon, 11 Aug 2025 08:33:18 -0700 (PDT)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-506290ef39asm1822520137.4.2025.08.11.08.33.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Aug 2025 08:33:18 -0700 (PDT)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-88c61c2843aso1729247241.2;
        Mon, 11 Aug 2025 08:33:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUAPf1uCSCgCuEAjIIZcppaI8S6SPtEcu7LxE4zdnG3G1sXN+HYQTRnL4B3I5NGlY8hHSiEi57v8VvOgyNI@vger.kernel.org, AJvYcCVTkibF/CZJtbgcenafLwLyDzrAGX2uqbSZMTXeB+zlSEXMLqM19HZQoG0NJ/nrLRyG/VJ+KXTo31+bNLs+997djZU=@vger.kernel.org, AJvYcCVh6ImgHV6oJiHROWoaxt4wfJjBa/+LJY/8DxbVNiCEZMs4xlC13QVYa3rKTE0zIp67OhqrMHuTC/+b@vger.kernel.org
X-Received: by 2002:a05:6102:5816:b0:4e9:8f71:bd6e with SMTP id
 ada2fe7eead31-50cba517caamr185815137.0.1754926397592; Mon, 11 Aug 2025
 08:33:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250707153533.287832-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250707153533.287832-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250707153533.287832-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 11 Aug 2025 17:33:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXs+nPzW3nzMSYuchPGaAitOU6Eo0vu2-9vYeJcOXY4hw@mail.gmail.com>
X-Gm-Features: Ac12FXwVSL0MFS-BZwmsUj6qlL4p7JTqv59SDXYmkt_uiy7ndcMRf_F72FSwZ5w
Message-ID: <CAMuHMdXs+nPzW3nzMSYuchPGaAitOU6Eo0vu2-9vYeJcOXY4hw@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] arm64: dts: renesas: r9a09g077: Add I2C controller nodes
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 7 Jul 2025 at 17:35, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> The Renesas RZ/T2H ("R9A09G077") SoC includes three I2C (RIIC) channels.
> Adds the device tree nodes for all three I2C controllers to RZ/T2H
> SoC DTSI.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2:
> - Fixed W=1 warnings in the device tree files.
> - Fixed clock for i2c2.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.18.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

