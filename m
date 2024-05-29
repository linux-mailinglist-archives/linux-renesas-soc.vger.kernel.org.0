Return-Path: <linux-renesas-soc+bounces-5667-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD9E8D3BC5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 May 2024 18:05:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 889671F255F5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 May 2024 16:05:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B14E242044;
	Wed, 29 May 2024 16:05:30 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D03C181CE4
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 May 2024 16:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716998730; cv=none; b=bq3VBvjinY3pEnW4jCwwWN4kvCkIYgYLd2d5YFpHg0adqEZiKZhT0mO+wlL+hiO0NQ3WahzZVs8f5onGqoV3z+gNd/ty98L0iBiskxKdLrEo/tNQxemylW94+hgBeazC4sMY4QG7jfnf0fCs2uPsY+ePu4Iizf0d7EL4OKWAX3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716998730; c=relaxed/simple;
	bh=lQdLyxvrY+gJA4FQZSMyR6szKZsVsMCqtd8DJvljK6s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QGd3MUoBDfHi4fmht9mqDQAutEaAKQ4uBP4ct7H7YCGo7TkSuK1Dd6STaLNnrD64iig1iFBuOdsarYO+0EDB/uqakMh5lcwx/u+TsRwu2fX2UiOv5L9I3oiGA05Q2BGlRPmQAtkhbTeSuFrTDGfcXYDCkPTpp81dk+9UZv5E6To=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-dfa48f505a3so895332276.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 May 2024 09:05:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716998727; x=1717603527;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JBiErLw77NyXnElw2zqmkEvpoaUUyz9Wx+o+cLFJDlI=;
        b=blaAODetmWAepkjSOlw8TFHDK6KNbORbUghshxcyfmFO2ccsZIvszXT9FcBSoDGcNv
         XnQqTPGb7elG687lBM3BnS+MdiUfHCZez9fStMvMuhwQWmwIaoZttBr6R+LhDyB/FkuB
         rDeXiGIn35pJTyP2EkH9gbSp7sQ3gaNzwVrjrDLQnkX7TTC5fCrpODJQ98KBQfFMG7YW
         WumYvgbK3BfLeH5zqpQ9annckun/4BiiUCXENCDqWC3Vl5h6BqGApOD/9Mzby9NdKwhu
         xrnMLpsTmcV6lCUsn+OB0ww2TtDnouVT1H6h06OSkZ0JZr+nCWINJBhaow9bcpL9C/mX
         CBDg==
X-Forwarded-Encrypted: i=1; AJvYcCUfQqCGU72ObdSo9yW6VXuVwKZdTrXbSSvTfOI31YtuykIaMMwcYdw60yezEFQw0xQ4/G0+VwsL/sOrfQ3kcxnSHZq12x1r0tbj0BL4qfZjP8Q=
X-Gm-Message-State: AOJu0YxP/YA7wb8LdLnpd3UyGMLxiloqnophxw6almrLVCauIPy+hBv0
	eV2ZCugjR9xSO6xngeS+WK5nRvt73UrO6rOTsbcjflm/pOUy2L6YRZA9clxA
X-Google-Smtp-Source: AGHT+IHPc1GfN9sIaic7wTHEu7iW4gecja/iRHZcdgG2GHX5NtZnPW25XTIS50ruJvjUJAlBtqMw0A==
X-Received: by 2002:a25:9281:0:b0:dfa:4e06:4c78 with SMTP id 3f1490d57ef6-dfa4e0653a1mr1902648276.39.1716998727553;
        Wed, 29 May 2024 09:05:27 -0700 (PDT)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com. [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-dfa57a23c64sm23957276.28.2024.05.29.09.05.07
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 May 2024 09:05:07 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-df4f05e5901so2378011276.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 May 2024 09:05:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXH/Rmv32QXz1tUdYROzNfOQZfw0H3E2WuCUA8cWR3j7UMvnnGW1yLmTE0vjRCqxhLSxXxpukAiEpMzWiNaqie4sJcNtQJSsNVcjC06GKhDRwg=
X-Received: by 2002:a25:55c6:0:b0:df4:d65e:f519 with SMTP id
 3f1490d57ef6-df77225d661mr14838110276.59.1716998707051; Wed, 29 May 2024
 09:05:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1716997002.git.geert+renesas@glider.be> <009bf9f476fa444d98de22330bde565f0ab8b2d2.1716997002.git.geert+renesas@glider.be>
In-Reply-To: <009bf9f476fa444d98de22330bde565f0ab8b2d2.1716997002.git.geert+renesas@glider.be>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 29 May 2024 18:04:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXm2MRz-kSjJM=bPWgKOcsFDbbXmEtR8eLskagH1w1b0A@mail.gmail.com>
Message-ID: <CAMuHMdXm2MRz-kSjJM=bPWgKOcsFDbbXmEtR8eLskagH1w1b0A@mail.gmail.com>
Subject: Re: [PATCH/LOCAL 2/3] arm64: renesas: defconfig: Enable Marvell
 88Q2XXX PHY support
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 29, 2024 at 5:42=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> Enable support for Marvell 88Q2XXX 100/1000BASE-T1 Automotive Ethernet
> PHYs, as found on the Falcon and White-Hawk development boards.

Actually Falcon does not need this in upstream yet, but Spider and
S4SK do, so I will s/Falcon/Spider, S4 Starter Kit,/ while applying.

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

