Return-Path: <linux-renesas-soc+bounces-5816-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7358FAD31
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Jun 2024 10:12:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AD5041C20E77
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Jun 2024 08:12:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDEC314039E;
	Tue,  4 Jun 2024 08:12:31 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB50446CF;
	Tue,  4 Jun 2024 08:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717488751; cv=none; b=hPZzjhGgXVdfVkf9LCR0Naceky2bueOxQ3NwR3g4oJFUP2+hOil5LH/vG3R8skIBn3B8/TgigH49KEp7b/gup+uD37IHQ9JgLKT1oTM1OMR2mRB+mRdFsJoXx+ovNuc0Uk24XbGyMwhJAbF7GwmrV9ZTMhKf/nlfXrDL6UMMXGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717488751; c=relaxed/simple;
	bh=Vlzyo+dun9ALebmPQUWJoy3j/sPrEQ780Rywr3nZCq0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=udCc4/Rk6BqHpdcMUKWvzBKjPOop5OP1Ki5LfKMNkjV0uxEOVFSySmZPllvHTnO8na5XjKhswH+o4rK7yAwz4u4UHdfPA//fLHrnCxJ+DrDLR7HluuXvJWX57QNwrrjZMx0nEGKQLoJpihCe+IxBq3H6RwVZBGMiPulAi9c04pU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-627ebbefd85so56826757b3.3;
        Tue, 04 Jun 2024 01:12:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717488748; x=1718093548;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O18JQKexo1Og7/jDsATFfZQreYQ9bP8A25k5O7t0AtA=;
        b=WNC5AcJw0H+uKAVi79UahaRiiZdIe57ONRqf0lM9LwWFazfOFLDJe/XR7oedB/x7jq
         XhRebanYXdF5dzll0GIGaQiVYY0pKmwfAOjr+RXBBrqE/ijePsIcYlwkv/pPBway0rsu
         IhN+of7I9wdtolZDzc4sxYCCo6YHxIsVILsDj6/lE9nEfUlIY7JdROzmOcaKPFNnmpN3
         ptC9f1p5+VzRKS3Yn9Jfumx2TLevoLTq6kvjSkYQsUtpOq9zAYXyHe20U46K/ZhKNNpv
         1PlsCb52TTD3kVA5+5bKvXYR9rANnvMA2dm2SnbxizPpdYUP0vUvivXOvOotAsm1eIvw
         tztw==
X-Forwarded-Encrypted: i=1; AJvYcCXs/vlLDkXnX/fWZoHWXpvGA6gyFFXXUJjnoD0RP0izaldIuJm8K5cPZh6nNconFXyXqM+vzpVxZWdk6iC5GAa5KoJWNfMe0VHc5Deqj9Kiz+CwAePUjv9Tm9CRCAuqED21wbEhRQsMOGzBqMkV
X-Gm-Message-State: AOJu0Ywgw4fAp6OzY5EcHTT+mIN7Pn9907wusXSSaU87c6BOhNzIQh5D
	CIn1sDvYlIULF9HuwRrQLOWKbZT1gJeafR79rWziJtsAFgtNm/Y03gSh3GY3
X-Google-Smtp-Source: AGHT+IFFij6lOkbHdNuQVQd9K8K6a+Bl5t4GOG7+Ut9aUAvr9v0Z++4pZ3qfNBSVdZPGCZSbRjXWCg==
X-Received: by 2002:a81:a00e:0:b0:62a:530:3cd4 with SMTP id 00721157ae682-62c797ef999mr112604677b3.33.1717488748147;
        Tue, 04 Jun 2024 01:12:28 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-62c765e7719sm17461227b3.43.2024.06.04.01.12.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jun 2024 01:12:27 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-dfa72c9d426so4105993276.3;
        Tue, 04 Jun 2024 01:12:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXzf+fniQHIH+5bapgYTzjvVA15bDtRR5mUGTKUyZeAKvQajKGODsAI2+omOUQnXlDR+aQJFCcm+v/jpqM7x3dbjkDTMXwV/NixuMKhd810Er6phe65i+9kFBMZA16YoUoqag3aBtXu3ti+yvpM
X-Received: by 2002:a25:c45:0:b0:de4:634c:b2fb with SMTP id
 3f1490d57ef6-dfa73c46412mr10239709276.35.1717488747296; Tue, 04 Jun 2024
 01:12:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240527134129.1695450-1-niklas.soderlund+renesas@ragnatech.se> <20240527134129.1695450-2-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20240527134129.1695450-2-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 4 Jun 2024 10:12:15 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVqZgKfawPEkhDLvrv_uWKhyQ1eYzSAX7xe8y3zu4BMtA@mail.gmail.com>
Message-ID: <CAMuHMdVqZgKfawPEkhDLvrv_uWKhyQ1eYzSAX7xe8y3zu4BMtA@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: renesas: r8a779h0: Add video capture nodes
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

Thanks for your patch!

On Mon, May 27, 2024 at 3:41=E2=80=AFPM Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Add the VIN, CSI-2 and CSISP related nodes found on V4M.
>
> One thing to note is that both CSISP0 and CSISP1 are in the same power
> domain, this is different from other Gen4 boards (V4H). The reason for

s/boards/SoCs/

> this is that the V4M only have one ISP core which is connected to CSISP0

has

> while V4H have two ISP cores, one connected to each CSISP.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.11.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

