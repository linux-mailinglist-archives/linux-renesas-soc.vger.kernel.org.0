Return-Path: <linux-renesas-soc+bounces-22799-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E00BC529D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Oct 2025 15:18:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8956E3A41B2
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Oct 2025 13:18:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9397128312E;
	Wed,  8 Oct 2025 13:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kuXaDh47"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED9F1A23BE
	for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Oct 2025 13:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759929481; cv=none; b=NZHoFQM6U5HGuHLNQ6AJkLER5ZXpQWMp29NIPuuHobfUE47om+2vyWNzAAUU1hEiieOQQEmYk8A3pDeoeKlpmGjE5iBJ7HcjMC3LYtqwQRcm/hTwbSvRtRcAET3fkDj6zeRpvh4Uu6yLnOBzlFf8D3D/JeEOrsbtM9TSH4TxzGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759929481; c=relaxed/simple;
	bh=A26BURxC6YMiPrKrlhFxrgm/8o8uWmciG6tr4QwYCvc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HK/A4UtPdkzVczFibptqq3EodfKQ8DAWDbrhdHlqIs9iWDKdSm+B0ryecGw7aqhodMUPc4U1w5yBTNSpyllsq4J/Z7tZygE2/+CYWfOFV/I9NCYGK7HWfBBFJdjhE0pzzCzkV3rrq1JFVYcswj2+CfzX9cChobD33EZmPQtbaTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kuXaDh47; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F14D7C4CEF4
	for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Oct 2025 13:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759929481;
	bh=A26BURxC6YMiPrKrlhFxrgm/8o8uWmciG6tr4QwYCvc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=kuXaDh47vrB7k67Z8L5c6QH6NB+m2O3JpY/UMTVHwFjwy87qOmwGGW7HU86aqscMZ
	 iOIUs3W/nBLI94n9lWhBy9XAnSHrCInqi7Cqdh2/iUhdmgl9eCH9kQM4U4tRQx4z94
	 HzDFEW9ItBuAG8/GDrTlU00zY24JlgpFZSGHp2ZL1UZpVkTkA5kpEV0I0M/1oyyXBQ
	 ks2kM6c5wZj07BFfupRK1rYl/jk298S1Am/nV6x7Q88eFiLKY7ehcw0/7zaEUnEdoO
	 x66w6vjL9hpjx3pFsy/DqULZ3cR71i+c1yvx0/O4A00w9SIjUOh015y7A0UQqk8tHY
	 kh0YUHx8njQTw==
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b463f986f80so1212305866b.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Oct 2025 06:17:59 -0700 (PDT)
X-Gm-Message-State: AOJu0Yx24SZobIUpmUhEcm27GMTZfBB+XkSQd42heVNxO5G0aabkdmq1
	LCtOEojgOQ7Iq4kMnnIZo0Di1ygJV1WpCVojbOOfAqpBwbCh2YNd7Y2qZ3S46lbqF7nSMRG667N
	hKtQOvjHuLRWUCXWj/Lncwmc5mVoXjA==
X-Google-Smtp-Source: AGHT+IFv45xp6CmYYMNAgyp1xynwbCS0WoWmR/So2r8vGFL0UOBIJChN1MqHBQIH9sdKjfktlTxeaAVHinRIgyH2l6M=
X-Received: by 2002:a17:907:7f13:b0:b45:e09c:7e66 with SMTP id
 a640c23a62f3a-b50aa8a5bfdmr360023266b.28.1759929478582; Wed, 08 Oct 2025
 06:17:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251007152007.14508-7-wsa+renesas@sang-engineering.com>
In-Reply-To: <20251007152007.14508-7-wsa+renesas@sang-engineering.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 8 Oct 2025 08:17:46 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLLGpw94mbHirGaUx_b-=n1=s25Nhw62xKOQdS+V4s4Aw@mail.gmail.com>
X-Gm-Features: AS18NWCkNq5WoTDTgs_atVT896fAu6mmVrCNMLOjVrqG7W91HT2pNtiDlf44MDs
Message-ID: <CAL_JsqLLGpw94mbHirGaUx_b-=n1=s25Nhw62xKOQdS+V4s4Aw@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] dt-bindings: watchdog: factor out RZ watchdogs
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Guenter Roeck <linux@roeck-us.net>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-watchdog@vger.kernel.org, 
	Magnus Damm <magnus.damm@gmail.com>, Wim Van Sebroeck <wim@linux-watchdog.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 7, 2025 at 10:20=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Minor changes since v2 are documented in each individual patch. Main
> change is that patch 5 is added to keep dependency handling low.

My tag from v1 is missing on patches 1-4.

Rob

