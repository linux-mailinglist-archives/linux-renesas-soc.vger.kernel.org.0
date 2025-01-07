Return-Path: <linux-renesas-soc+bounces-11907-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B33EFA03E27
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Jan 2025 12:46:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9D2593A5C79
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Jan 2025 11:46:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 990651EBFF5;
	Tue,  7 Jan 2025 11:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YVTD5OVu"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96EDC1EC014;
	Tue,  7 Jan 2025 11:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736250386; cv=none; b=jtUxIyqQqLrouNTCND+kZzOQIdNfr6/G1drAmWRKlwo6d2tbt60fVMCL/vcIM8Fw5WlVaYiLIy0FHeJ9JK3Val6UH0iOboKn0kTg/6NRwOUOjbhMAztzKk1eyfZzmMu7AabJYp44WOC0eMp7ou646scyOLDIakk4qDKy/Uka3Ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736250386; c=relaxed/simple;
	bh=+8s4beo6R6bCoRm7Z+rYkfHBLPRed4ZSd7KDhWVIR7U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g9Cu75ZXqko/Lv+CrrBKFGCNhqs8xkfD0n/Ek5cwnZxidqFRTEzFhPoRgxUDX/0Jw1GZZH0zRxXoN6r1DClDfaRt4fltaCR9QijyRipul62vybqjd4kksGWEwvsB9iEeiXexX5Izk8cF7dMfnvjyLJ+ZWJG7WDhqQg8qbBauQ3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YVTD5OVu; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5188e0c2b52so4394888e0c.1;
        Tue, 07 Jan 2025 03:46:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736250380; x=1736855180; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vucK6VcyjawlgAWQ0fVDIsVTfKI6ExNPp7ranR4X+ak=;
        b=YVTD5OVuO7O6A+X0OSWlyEqI9vDpZj3f2j9ON/N3jEgZfroM7ZA4SN6phvHGPahgVJ
         rAMkRg1bUBD4/IMvzoU5vgyeT+occiFEayR2dyP6bqQdxMLx33lLra4mJeeofSX6GlCB
         ARhWHPODDREtLnzbond8INk+mGKymz/443X2fPkv/76yjwLnmgKDHt09QuOznQF4ojjB
         23/aoKRWXbBo/vPK0SBCp9HQO1lANoVtoFp4VmhoKvWMET5mY7CHVLqdx/o56UZImzyB
         ocr9ry91FymTt0AdGXhzKtOg3MgZISFTTbP0f/fWJ1WsfkmxnmVKOaNVurHF3AyWgP1J
         HVlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736250380; x=1736855180;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vucK6VcyjawlgAWQ0fVDIsVTfKI6ExNPp7ranR4X+ak=;
        b=dQ3aiJXWcVBWG0LBY0u6wqbNsfGcKmMsRUH82UqcC49K+jv84SLK171sjEL89QUimb
         pbbEuCQAX4eybhehwqSECSPcx7GGU6tUu+8T9EgH2f4nlYwjYnsii8sfI/dFX/FZBvIR
         J+COkD+t6amL3sKKfx+AAmpT5DKMQ/hetMdqXeIDs6WEo2S+67QHySJAUULjznDRxRbI
         OkRwE5EFcpmaPqtrvQl3YqtgeX4TyDgK9CK9oI2ttFpSah4B/8dzVT2L+TuXevJBh1Lp
         A6GoyKdlX3sU1j41ifG86Nefq+Bvk0PKMTZZd8aWjiJwBGdiE1BOcMIzq3TMbIWRsAyD
         WIiw==
X-Forwarded-Encrypted: i=1; AJvYcCV7wrQSZnHcx/D6QG8eITBp44Iu6efNCW1BAjrnj4hCUPF4LF5IOg6r5C7O1HvOH75yBTQNunN2JdwVCVm5rHbiX68=@vger.kernel.org, AJvYcCXk/gUFzpUWKeFTqCBhbSVENaDSRx6xOItX9Lw67o3mlWZzy6rZW1p+wDWeyGFFnCKim0sBabaiIJ0=@vger.kernel.org, AJvYcCXpAB5nto2K1a47JfI3NvsnsrKue3Hts9pq7ROprJzrygmJQlBT5hC/A1XWEICjySqlDJ7TCGRbv3ROwZ4x@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9EYL1U0CoDb3FmdR6gVjGJOsCjD8D+ngMImu0UuFKDASgw2U8
	Me/bduQ1wEiUS7nDI9VuAkoKl0rjxNNh78FAqGYyJ02Ml6vuytIx1XrqIhpdO4Z0uOSO6wn78v+
	yvoFSyzWRJiH+IUakRX6CPt5QzZGF7rREV5p2fw==
X-Gm-Gg: ASbGncsxMbRral4VisG1s8VMyy9OD0OcFmdXSYlDdv1vtKdhMKZwtMr1AlRXlpwEZun
	Eabq4NsXf0diq0PBd8n7SkLtt6nRjcKDR87VVvOQ=
X-Google-Smtp-Source: AGHT+IFGnUqtXgjhkIrNG9PQMdaN09fKotmEkGlhpPj7EWKGT964pz9hjHWRAbhipABEZuxXG5xP2T14FDsRC8SDreM=
X-Received: by 2002:a05:6122:3209:b0:518:d26a:a819 with SMTP id
 71dfb90a1353d-51b75ab8554mr41734466e0c.0.1736250380068; Tue, 07 Jan 2025
 03:46:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250102181839.352599-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250102181839.352599-5-prabhakar.mahadev-lad.rj@bp.renesas.com> <TY3PR01MB11346C123E18F61A009F6F0F586112@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11346C123E18F61A009F6F0F586112@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 7 Jan 2025 11:45:54 +0000
X-Gm-Features: AbW1kvZhTPYyDd3i2wHy7h5lLQ4dp0cDdqcC2CrCLK0INzBwg1y61LBBamZF_x0
Message-ID: <CA+V-a8tO-d35+aPLYoCmC4xKW4cMoNyzM_Vmyw6CzOJjyjj=_g@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] clk: renesas: rzv2h: Switch MSTOP configuration to
 per-bit basis
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju,

On Tue, Jan 7, 2025 at 11:24=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
>
> Hi Prabhakar,
>
> Thanks for the patch.
>
> > -----Original Message-----
> > From: Prabhakar <prabhakar.csengg@gmail.com>
> > Sent: 02 January 2025 18:19
> > Subject: [PATCH v3 4/6] clk: renesas: rzv2h: Switch MSTOP configuration=
 to per-bit basis
> >
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Switch MSTOP handling from group-based to per-bit configuration to addr=
ess issues with shared
> > dependencies between module clocks. In the current group-based configur=
ation, multiple module clocks
> > may rely on a single MSTOP bit. When both clocks are turned ON and one =
is subsequently turned OFF, the
> > shared MSTOP bit will still be set, which is incorrect since the other =
dependent module clock remains
> > ON.
>
> I guess this statement is incorrect. Still in group-based, mstop bit is c=
ontrolled by usage count(ref_cnt).
>
It is valid, consider an example say IP-A reuiqres MSTOP bits 8 | 9 |
10 and consider IP-B requires MSTOP bits 10 | 11 | 12 (of the same
MSTOP register say MSTOP1). Now this will be seperate groups having
separate count(ref_cnt). Say you turn ON IP-A module clock and
correspondingly clear the MSTOP bits and similarly now lets turn ON
module clocks for IP-B and clear the MSTOP bits. Now let's say you
want to turn OFF IP-A so you turn OFF module clock and set the MSTOP
bits 8 | 9 | 10. In this case you will now see issues with IP-B as
MSTOP BIT(10) has been set when we turned OFF IP-A block.  This case
is handled by switching refcount on per mstop bit by this patch.

Cheers,
Prabhakar

