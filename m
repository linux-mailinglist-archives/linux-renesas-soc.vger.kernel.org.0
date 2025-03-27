Return-Path: <linux-renesas-soc+bounces-14934-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5B9A73E11
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Mar 2025 19:37:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5F6681897A48
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Mar 2025 18:37:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A59F921ABAA;
	Thu, 27 Mar 2025 18:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k8PIZj1F"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F97E21ABAC
	for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Mar 2025 18:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743100647; cv=none; b=FROubyHERqX8xeORgvORierDMCfcD7lBHCdscYpsZPhGHLcjVfaz/qlUnIWozwSr7TsJ+7kyDzhpRBQXxmoEkAeHhJTEZZQq+xbwY5+JguDQm4s3uJ3DFCWkREqpJ+T01S4N8KO5F92mTIdJJdfEIdXInZq+K0eBkcnsjBi6lU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743100647; c=relaxed/simple;
	bh=CbEZm9kieI8cY8PG2cc4Z1+70+jZxlKIYJjC7P0CDV0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=NlSBRGdEZR7/PhehRo+2LG6oMk86ZMrCbxr/x30dDOttyYdgjc47/ZZJlAFhwNJWVOOLZyCfSlppjIDI+jKbKyUojt9L5oiGtL3txh2QXFDSLHtX7pv34A+0aoSBmJ1VSneVRyvd8xlXcUVJLuf+181c848SgTpmEaOUkY/Jv8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k8PIZj1F; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-523f721bc63so2221811e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Mar 2025 11:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743100645; x=1743705445; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CbEZm9kieI8cY8PG2cc4Z1+70+jZxlKIYJjC7P0CDV0=;
        b=k8PIZj1FWvep6X9G0bGUEIKTg+BBs6IdmQ/Wl71znlj/W37pof0Ktw95SnPmSWwkqe
         +sFQkv6qArxCvvhDoQifGlUAtPiw8Oufxiq2Vqu+yuu143DuQGo42QEpGv9tkBrSQJiF
         O97aRjkHHU2nJ4sCMs9MOTyR3PcoeutwtMsonElRlJZGD2y2H72CxqRVJjq+/YfgPMTv
         l1MczQBWdddTJ6SzlsJnNgzBHfcbKB28HOcDe6rQ7fm6nXgc/n2Nf5/YZW/5cKBMqkW1
         HDGO7NJlpTT1x/D3QMINf7LXQGGxAKkaRekmPP5ynr0t8P3MUDtDciKLO7ob5UByY+cb
         B+EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743100645; x=1743705445;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CbEZm9kieI8cY8PG2cc4Z1+70+jZxlKIYJjC7P0CDV0=;
        b=NBi2sSdXF0vbIqIsVIPPtXMID9soYwpFFzFq2FP0CjZgT/GvjUtMSWj6l1WRY4Xzms
         4iZf22VedIZA47vkMiD/fJiDuETdWGMf2UMarGC7KB+kXZAQ7boR1KH3UX4JvZV/CvLA
         uLHrKxpcPUXDaqfVeZaYSIQNQrNsXUlWsGXeUxx8QsFXcnWN4/pVTKBHpgQknehZLqWr
         WKVFXOw3z1TCyCXR6y458hEEyx+6vdhdrVe9tDB808CR++ItJRBCMtuHT5zrDuzs+fYa
         tqX5jKB4r/dAsV9uDfhUFjFD/tU8/zdIBITUjL6df8q/+P94PPwzqhuD4HVMJIFvC+W2
         Kwmw==
X-Forwarded-Encrypted: i=1; AJvYcCXH+EXuya+sS2JmJ2flW0d3Ta2y3GMaeDL+0GyyQXNqm1gBc1d2e4+0M5PCHnlrYk+bGD5wV197TgLTDH/Rzpe/+A==@vger.kernel.org
X-Gm-Message-State: AOJu0YybAnbB5jEpym5tIN8VqM/oPb/nP0pT5W/mggwqv+iB68nb3o5z
	Akmx4GdU3FkI01mSnhA64GnbNChMgEIosrFJVRJRqPUycXTI17LYfVvtWrHZIxke06TzJTnkYe3
	4VyaVpFe31BQZECbfCJn9t0uXJ5E=
X-Gm-Gg: ASbGncu8IR83IRte1iLF0HlpzxQeFMe9KWC62cMVFeUAjmP/cnZNwpuDD7Gx7zVful5
	V/Fbgj1oCNz6uLx8INWU3ucV4iMEDR4SmDPyHCJK8t3UjL2s5hTruJzkruOUsoNvjQVj4igaTn2
	3/lXr3tLgMPyn9V09VepdPgIsiG6q8avHpbkLfGhb2nh8aW1T/oMygZqW4z6Y=
X-Google-Smtp-Source: AGHT+IH6i00SylDCautRhQ5hcJvpkqZON5e5LsLad6kP3OOYc5x6Ydq2U9GZj1juzb+8/bhW0k/i09nyDrpgfl0uI68=
X-Received: by 2002:a05:6122:da6:b0:50d:39aa:7881 with SMTP id
 71dfb90a1353d-5260ce9287amr1770635e0c.0.1743100644617; Thu, 27 Mar 2025
 11:37:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250327090321.15394-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <Z-WEiqdpzHCZ-1w2@ninjato>
In-Reply-To: <Z-WEiqdpzHCZ-1w2@ninjato>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 27 Mar 2025 18:36:58 +0000
X-Gm-Features: AQ5f1Joc4ietgTEBLV4w7v8Qzd6uROyTK5-jUj1nqa6_0u8CNcOLA2k7h31uU64
Message-ID: <CA+V-a8uNoKm3UnqB-Ugv7s+Ccxhb4cput+JWRYespsdJPSX0hQ@mail.gmail.com>
Subject: Re: [PATCH RFC INTERNAL 0/2] soc: renesas: Introduce ARCH_RENESAS_ARM64
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Prabhakar <prabhakar.csengg@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

On Thu, Mar 27, 2025 at 5:02=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
>
> > This an attempt to fix adding each SoCs to ARM64 defconfig file
> > by introducing ARCH_RENESAS_ARM64.
>
> Why not use 'default y if ARCH_RENESAS' as suggested here:
>
Agreed, let me test that out and send a v2.

> https://lore.kernel.org/all/6323eb7a-03e9-4678-ac4f-f90052d0aace@kernel.o=
rg/
>

Cheers,
Prabhakar

