Return-Path: <linux-renesas-soc+bounces-11536-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B7B9F6746
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Dec 2024 14:28:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 57F76162F66
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Dec 2024 13:28:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 981991ACEDF;
	Wed, 18 Dec 2024 13:28:37 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E54C919CC17;
	Wed, 18 Dec 2024 13:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734528517; cv=none; b=O/Ey5F56B/oF8J8uzuCtNrAP/5ImeHVjLCTCRXqQ3sDhnKRmmUzxOLcB+LuBZpcP/6K9xONbpoV7n3KXblHApy4uYZPjJ8Hvc7RH2S8de8YCYCYoxMWJVnJDa6PFpxTeKF8x9tY2RvrQ8iInkyrlwoZV9+aCD3gwWvlsqnSBD8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734528517; c=relaxed/simple;
	bh=djA1jBard+Rj3Rcrfb0fkoS7kC6nrkUQTKh7qyCl0oE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O3Uc6npEcXzdl1i5Pq8ZXEWS84a5I/Lh7/nhFA8Oo6M7G/BCnELinyqalghnnNk5AglqlGMoSzT0mzA4LPRnvDtsre52ea3gU+PQgCOtbQhOiz2JvNJfWdwCNFxb9m89l9f2zmZhUFBp/2lZXoXVeiVSDBeT4+pwfJynBLL/czI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-4afd68271b6so1719506137.0;
        Wed, 18 Dec 2024 05:28:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734528513; x=1735133313;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cTacFp++r5NfxwZGaBpjY2/puQPcOUu0ObpmJSqE3YA=;
        b=Jo7Wqy4YKOy+3uTG9SlilRxdadjJt0ql+UM/i1psMiGDflWePuFHZNWm+7mPQ2bqqU
         cae/ZtmSYy6VrUtqtI0f6VuAYqusmcU3ryBwCis8UdUgJaZFyoZcraHnB/fxKrdrl/Vj
         sy3KZGhNGegsfi4e0FamE9H4Q7S73vjgvXPTfDfdXqE82msM89MzlbDaavYMN/hCafre
         Nu6Ip+SR+QIJtJ1znLt83Z+JLFUVK1oYKqhM9upOIOWG+hHeggDlBQFd6SS/+0uMIoVG
         XIQ5lN9ojEsmfLW53At+tDi/62EqBSRibvq2BDQwuTSELIv/FdwDU54CzBHdoXPdmyW4
         zckg==
X-Forwarded-Encrypted: i=1; AJvYcCUBRvJy+nD6J7UBal9/d9BohOVHhuIripqVjtgBTDNAVl1M+VaeZJwDZpVCLLyD2UxdOEbFEkVSnOiR@vger.kernel.org, AJvYcCVsBvGYvKoPKd3OTxhX5UNudPkaVu8HyI5WbLizlqeKTWIkJVFak5oxV0p+FFzXLtqJYpRfeggpYQBo@vger.kernel.org, AJvYcCWengoTgTZV9sdhlgFVJ2hcQbap/p93k1PEozVfPGd6RSVF2mf5wWv4RHOqvXCz5qwaHRy+uPGJK5Q83OVuFNquQeU=@vger.kernel.org, AJvYcCXA/zojt28al3IVQ1p/dzvJK7EBjNe5woJLAA1QNdREx/ZLv9uGadqwm4lUNGFjTLYFCB2mKe29lxWY1R7x@vger.kernel.org
X-Gm-Message-State: AOJu0Yxs+q4JWxZu70t3J0jV0NEM85J24GUmDfUgEfi4VW6tcUPkIbhs
	kozNeBFSR9Ccit8+bLFBq4rZ3MNLvYMVPoQvCaFgm4qnFhtVKY/4QWv3js8f
X-Gm-Gg: ASbGncsiYCNHGysn08wX9IkwoR8hiptCwD2ddqxpn+22s0nfLPKqLrA4j3SIfAkS9WE
	g8mZjDqctC+E4VgvkHpVMQRlN9X10fONriUprtZCXYLetY2JvsDFtvxfy89GMD7fyvUWeLMd9N1
	vBngBMBp2trd81iqXYHkIK3nCwjx3U1DcCdkRx3ESOHBYHa9mPYW0Gr4Y0XQj0Aq08MaJ6o/cR6
	iIgJgAaLc4pnA2rShJMaWVAs9VoYPiqV16sp7LYg7fGcR/coR+rMR0vkr8jr0oA5kVjNSL3AgWV
	XzA4FYJM6z90KnowFs4=
X-Google-Smtp-Source: AGHT+IELoJ13alZwyAy6pW6Ef7MPG5wE17lK0XaPofqQEU0OU6v5DlU+XFuMfuDXIUw2C4Q5PBsdzw==
X-Received: by 2002:a05:6102:26c5:b0:4b1:11c6:d3c6 with SMTP id ada2fe7eead31-4b2ae704814mr1980429137.5.1734528512952;
        Wed, 18 Dec 2024 05:28:32 -0800 (PST)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b270391006sm1402528137.26.2024.12.18.05.28.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Dec 2024 05:28:32 -0800 (PST)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-85b9f2de38eso1305908241.2;
        Wed, 18 Dec 2024 05:28:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUfzsh3rAANfXyfLpS9XN0MmpAuKZGr6w6BCsD5p8vNIJWTfk7r4rv4Sb4tFMjqllF0Eh6OgoAwuVq/@vger.kernel.org, AJvYcCVQ4p04XgWnz7+r6twdpKCHi5f0Se2TKp6egZNfz33bVAnOHzkKWBixokrSuUimtBtL5cs2xtH/yFkVrmvvUozSFv0=@vger.kernel.org, AJvYcCVS+5UQe0nELKLaSp/wPV2eNGu69cQ7mPwvlJOmSfaOjIvgV8C+e6ObuE8jNbUXtSNBGU4lxZYfMyJS+oS+@vger.kernel.org, AJvYcCXa/V5+LWCbPEZMV39E6SkeO7UAzHm5LdP6AjR4hl+cLStp6DkZMILDtoHie5mWr1y1JvjckkmOumKJ@vger.kernel.org
X-Received: by 2002:a05:6102:50a3:b0:4b2:5c4b:5186 with SMTP id
 ada2fe7eead31-4b2ae86ec60mr1995517137.23.1734528512382; Wed, 18 Dec 2024
 05:28:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241218-rcar-v4h-vspx-v2-0-c673647d96e1@ideasonboard.com> <20241218-rcar-v4h-vspx-v2-4-c673647d96e1@ideasonboard.com>
In-Reply-To: <20241218-rcar-v4h-vspx-v2-4-c673647d96e1@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 18 Dec 2024 14:28:20 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUL8fFUyWp6dUEFfU1ik4BO6=qbNe_AKV-qZayxQzQpiQ@mail.gmail.com>
Message-ID: <CAMuHMdUL8fFUyWp6dUEFfU1ik4BO6=qbNe_AKV-qZayxQzQpiQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] arm64: dts: renesas: r8a779g0: Add VSPX instances
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 18, 2024 at 10:06=E2=80=AFAM Jacopo Mondi
<jacopo.mondi@ideasonboard.com> wrote:
> Add device nodes for the VSPX instances on R-Car V4H (R8A779G0) SoC.
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>
> ---
> v1->v2:
> - Re-sort nodes by unit address

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

