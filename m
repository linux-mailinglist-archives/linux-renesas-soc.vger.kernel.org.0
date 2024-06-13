Return-Path: <linux-renesas-soc+bounces-6149-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9657E9069A5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Jun 2024 12:08:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 31445282620
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Jun 2024 10:08:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCDCB1411F9;
	Thu, 13 Jun 2024 10:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YilLq+tN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A8D613CA95;
	Thu, 13 Jun 2024 10:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718273312; cv=none; b=VllMqcqOzoAW1e8HGwzPyimOJiqKI/JvI9+qBraLmdnqoE03g+DAi8RUQqhBLdxHQuu6z5GMj5HRHPFpnpu+PaNN9Gu4ILLurfNAlnJuhWvVLq4a1F+l5wEvXaNVfFokIg2wUexYDGlMa2MOoLeyRNuU+9Pw1Dge08s7h64ayAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718273312; c=relaxed/simple;
	bh=ObRqJNFNu8w7qH3ulB9YHO70KAhJwOZLbI2CBDoy83Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ElWI/OqfL0NqmZjxec0/wETGUlzLdk14Id7v56+CflT66IPKEqX1iE6duXx1mVpIzjJiWbOsmQoUDZvbKX9RBNBc1YqvtrT1JQM9ad5oev75I9dDWK9mJnGy+ZugUW5SDJln43FyAUhxt6ffURsQJIW5R1L7tZszlpd++KN7kMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YilLq+tN; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-4ecfbf16c77so256674e0c.3;
        Thu, 13 Jun 2024 03:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718273310; x=1718878110; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ObRqJNFNu8w7qH3ulB9YHO70KAhJwOZLbI2CBDoy83Q=;
        b=YilLq+tNez/QZzYLMk2D+btQtp4GkBihrOh62hK5bugbm3EtWCoS3/PFX+s+qEBAnw
         x+cwNlO40INLFhLzV6n0+rmnt6013VEN4QFV+Qy1p3hMPTV+M78yK93LHSf2OuNzgBeZ
         szPEBXmqF7mUAF+j+HTN1rjEC3ytNijrTShn0HOTsjFiZ7p0lOsQ9L67MeRyskNM68Uw
         YbJTHUz9zwvDyw77ShzBo26S7ptTlNOmjJzxSFh8BweWCo16qivDsB74PeNL9cSIl1UX
         237K4StfjoISfTe3hkQHeJOtHPHxNE/GY3e50Gup+qas2PltNt39trTu2MSJR03/S/FX
         66fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718273310; x=1718878110;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ObRqJNFNu8w7qH3ulB9YHO70KAhJwOZLbI2CBDoy83Q=;
        b=jV87KM4s70ODfEjzAM98hu5OZHRSm6EOChfolYW4a8j1f6mSaGBUoT76L2jUrT4Rqv
         NnIM8tYBVKFhzA7PQMRBVlDol2f0/NamyZcZjYQDa7s+bB0YCiT+T8+egI1wqjQurPg2
         QVmp1Yi0PX5hN4NF1jjY4TKvcdNrrYXgeEmpgc4kiU6pf8ejIp07+WNFJ7QBbmQS7ode
         98exT39G+48XejELvxjnwZdZrsQe6Y6c0pQrKq8xRP8/1bkNYwwggJmp1hkTkII5hHm3
         piec8iVRT6nteu18tqfnJi2G/W5k3cq3ZMX5QP7oB2eJDAiS+Dh9DetovBMNUIC/ZEys
         5gEA==
X-Forwarded-Encrypted: i=1; AJvYcCVV2FXSKUF3Xbh1tDYze0nXqE7WgvRVcO25mACj7CjN2jAPVvxAFfyVD3AZOETfylZv7UUzdLjc86jW6WRRyUlNDxDiajPVKkvLd3olgtZRJ30X4+Md70a/rM7mZWL/P79nlMTd1Gi3o21wmGVvFZJxcLIt8qck9dyngb2ExEDHasvCAA==
X-Gm-Message-State: AOJu0YwUE/jvK80IZgGmY6C8TcHJtuTNC7AVGJkX74xfTdWU8b5AEpgu
	DeiG8Pq+saJXkmHSnL1FmgU4aHHR2YG6BthKnpQQts8HehM0Vq1x8d6rm9/buuNHeDXTeMV2GG+
	SasSR3uccPlEq/ngqWmy6PPUWvYg=
X-Google-Smtp-Source: AGHT+IHHUrT8cM8NRUzlD8w2UUROuSFBv8qmbu9U83T6lqi7xzxG0bEAW5OvH9OvfJFV+GBhK2eT+6W+DvlRRZQqYBw=
X-Received: by 2002:a05:6122:311e:b0:4ec:f89d:1ae5 with SMTP id
 71dfb90a1353d-4ed07bc256emr5216048e0c.12.1718273310117; Thu, 13 Jun 2024
 03:08:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240610233221.242749-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240610233221.242749-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240610233221.242749-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 13 Jun 2024 11:07:59 +0100
Message-ID: <CA+V-a8syniZZr9ayxzCBumrkXkNjwUtrZLqzT5amdqCJH6c93w@mail.gmail.com>
Subject: Re: [RFC PATCH v2 1/4] dt-bindings: clock: renesas: Document
 RZ/V2H(P) SoC CPG
To: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

On Tue, Jun 11, 2024 at 12:32=E2=80=AFAM Prabhakar <prabhakar.csengg@gmail.=
com> wrote:
>
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Document the device tree bindings for the Renesas RZ/V2H(P) SoC
> Clock Pulse Generator (CPG).
>
> CPG block handles the below operations:
> - Generation and control of clock signals for the IP modules
> - Generation and control of resets
> - Control over booting
> - Low power consumption and power supply domains
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> Hi Geert,
>
> WRT XIN_{RTCCLK/AUDCLK/MAINCLK)clks going to CPG I have created an
> internal request for clarification if the clocks are inputs to CPG
> or to respective clocks. As the board schematic doesnt have any of
> these. For now I have just kept qextal clk as input to CPG.
>
I have got the feedback from the manual team.

The XIN_* clocks will be renamed as below (and the block diagram will
be updated),
XIN_MAINCLK -> QXCLK
XIN_RTCCLK -> RTX_XCLK
XIN_AUDCLK -> AUDIO_XCLK

From section 4.2.1.7 Functional Block diagram (page 359) we have the below,

RTXIN ----------------> PFC ------> RTX_XCLK --------> CPG
QEXTAL--------------> PFC ------> QXCLK -------------> CPG
AUDIO_EXTAL-----> PFC ------> AUDIO_XCLK ----> CPG

How should we model this now, please provide your feedback?

Cheers,
Prabhakar

