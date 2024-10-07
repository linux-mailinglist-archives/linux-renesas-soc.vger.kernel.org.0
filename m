Return-Path: <linux-renesas-soc+bounces-9517-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9A3992B2E
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Oct 2024 14:12:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 84F562842B7
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Oct 2024 12:12:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF2B01D2715;
	Mon,  7 Oct 2024 12:12:16 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F281D26E6;
	Mon,  7 Oct 2024 12:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728303136; cv=none; b=gzwe70WJYsHt7bCh0ZVrtUmhrM4xOHIouoXufeMYuMgfxoMiuZIQ4PEnnAqkKrQq/5eaalk3qnQm0oN88VGnpbfS0Kga4iyjZ3dP+vxzFAUWgkaVBLSQCk0/gyYXzF6iYjieZaV5AHLbMQfYs4P0kfqfvfgJf9ebErVCQKi63sA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728303136; c=relaxed/simple;
	bh=aEG/Sdwoei8OrQi/XkH1LmQRsYTS3fu16rCGSrqM2G8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RZw2azl+kHOBXwet58mKnM5ShpUVf/dIYbBXRSrarXNedBRntdpsHez0tty64D9C0anB5co4TigmY1+d86QgbFu7OPQi6nyEdKPLfMJNaLTzNBvPnmFz57rAWMjayAIeC2FPP5u6hrZKMnVFI+kpiJSzVffkvU/Mga2BO1+bC6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6db4b602e38so34786617b3.1;
        Mon, 07 Oct 2024 05:12:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728303133; x=1728907933;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E5umuIsyd8oI+QtftRPlBsodl+TM0JFJ877rWIMcDrM=;
        b=NV8mAzK4wTcrpvANMeETMUugO04XiUaDzAnkRMeWdNAOWrUrFk4lSAGoa8Yu8b7LCh
         r1Es5Bunv8BCv93wQejHxmcnhs1lpFlK1ulGLsZ2LApSjF9xxf4InCpbiOkyE8RchljI
         LhylXn2XjWk9QdkPyj/Zj0jlczocMkrpOkDgeH+j7ApDTyxQoJvgSXJ3XjPJQl0dcK8N
         epG4bpG2wHwDtrkpSv2CkdKL52XHAJ/P7E5q8d4DhFRmgHA0Fm7eN3szJNcMiSYvfM7T
         2Y/Dqs6KNfi5/F9Roqjzqkd6WBeL07N8yNIXwE7dJ3d3HM/7N2X0JYcu44sUMqWfCha2
         2vVA==
X-Forwarded-Encrypted: i=1; AJvYcCUM5Xu8Oo+qIbpnxPlvSrekh0U/zTxlIZY0nYzE5gQEhoa5X61XMIqUo8RUTSJ65kAmrY9TVD4E7wakZKBkSTdB4QI=@vger.kernel.org, AJvYcCVvtceuitui+dYBBttkeXWgjS9DUU9/QuVtvFfXF6xFSsAiM1DI/7EjJer8c0QX+Rh6cV6dOaPu6aFeuWFX@vger.kernel.org, AJvYcCWMUSVvKXwE7xDa1a1aQtCArD5aZ0nPfhZIhBs20z5CIQFBJ2c0UA3CwbodOXs4kn3FGSEqEICfrLRA@vger.kernel.org
X-Gm-Message-State: AOJu0YysZ33iNtM9aV/qg1qPEZwm+2tGuYBJFGwCLdMlbAc7sGYmTuHu
	JtApqhiGuDAKxR34iDWkUHkzPnUNLGQs9pktKFYiisAYFKRlV8QpZLoR/GUf
X-Google-Smtp-Source: AGHT+IE43njdiP6WeKAFp1IIfWf4eMF9vD8utkOf57ZPuBeBsKZo9VAlZXZywSqwiTDRVn8PPWsQGw==
X-Received: by 2002:a05:690c:d90:b0:6e2:d2a:e998 with SMTP id 00721157ae682-6e2c6fc76acmr73497207b3.2.1728303132710;
        Mon, 07 Oct 2024 05:12:12 -0700 (PDT)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e2d93e9837sm10027957b3.131.2024.10.07.05.12.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Oct 2024 05:12:11 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6db4b602e38so34786107b3.1;
        Mon, 07 Oct 2024 05:12:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWS1cSPHvIrx+tjHxfGRaoXMEqU4jz+rBAWDfcvW++C22hvtz0tcH1BVHdsWMTp7BXM1LxWS53BKQmJ+5+46CAUK8A=@vger.kernel.org, AJvYcCWbJKokUCeWVPIqgPvY/vRBPTrLeTdu9IQq9oOPyut2shT8GDHZwo2/VuWvueLaDmKebgC28txtY5Tq@vger.kernel.org, AJvYcCXc+S6TW7YMjyIBGAuima+JC3g73nNVTO+Cf/JzwOi0NhR2FtkPYV5B6qbAhct2R+kb+/b/aWQClB0UrSzR@vger.kernel.org
X-Received: by 2002:a05:690c:61c4:b0:6e2:5a8:3447 with SMTP id
 00721157ae682-6e2c7036dd0mr90015837b3.26.1728303130412; Mon, 07 Oct 2024
 05:12:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240927201313.624762-1-sean.anderson@linux.dev> <20240927201313.624762-3-sean.anderson@linux.dev>
In-Reply-To: <20240927201313.624762-3-sean.anderson@linux.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 7 Oct 2024 14:11:58 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXARKT6uaEzPd5Mo=6jZfJ0Dn1ibdbCUvYOenNYqatDQg@mail.gmail.com>
Message-ID: <CAMuHMdXARKT6uaEzPd5Mo=6jZfJ0Dn1ibdbCUvYOenNYqatDQg@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: renesas: hihope: Add SD/OE pin properties
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	devicetree@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Adam Ford <aford173@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 27, 2024 at 10:13=E2=80=AFPM Sean Anderson <sean.anderson@linux=
.dev> wrote:
> Add SD/OE pin properties to the devicetree so that Linux can configure
> the pin without relying on the OTP. This is based on Geert's analysis of
> the schematic [1].
>
> [1] https://lore.kernel.org/linux-arm-kernel/CAMuHMdUmf=3DBYrVWGDp4kjLGK=
=3D66HSMJbHuMvne-xGLkTYnGv2g@mail.gmail.com/
>
> Signed-off-by: Sean Anderson <sean.anderson@linux.dev>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.13.

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

