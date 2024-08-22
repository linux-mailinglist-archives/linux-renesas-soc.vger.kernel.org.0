Return-Path: <linux-renesas-soc+bounces-8024-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF1795B700
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Aug 2024 15:40:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 39DE1B22B91
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Aug 2024 13:40:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DC7A1CB316;
	Thu, 22 Aug 2024 13:40:00 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60FF31CB30D
	for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Aug 2024 13:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724334000; cv=none; b=J/rDBi2ZWe3yX5LfKAT+T9jHf5yuzhp1pyimRPtj8akf9wZtCW56ZsDalxeNcHh/ye6ZJbB0Yk3hUmeIDJvv3JqDLUJoZ69c/1v3O4va/0QFZrFhm1uGhTQpLOd1tfw7jP/m76slRxudjRP9nuG9sWK2zjZpTaYYJSGL0AiELic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724334000; c=relaxed/simple;
	bh=D9d4a3vZk1hseHZNyyJLE3owfteHhhdoPCMvnJF7Yps=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dEnwOds9IixvLdcy9G6fSfH8iQlm6Ifp6bf2Sb3TiWEaTdMkt1SbPgRh2ejRlcdfVZvbu5sYoQvb7o9m2OdCml3HQMvm1bug4GlYiMGv13w+pRkvnqgD29BRvKTb0kcE+DLMvPnOytRb/qym7azZU9pFw48Ea0Htm7I+QEVE/vY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6b5b65b1b9fso7162057b3.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Aug 2024 06:39:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724333996; x=1724938796;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FZkMRyBaaEroPOstH279nGIIYcXd7TB0UyZi9kiQj+s=;
        b=ZmXK6TDp0JCOD18jYZ2Miv46M6hbc1EGBICNRfNXcSS6A55CEkOfZSdkwmdq0JIrr7
         xgrxKvxSIB50AlccDrWOwX+TSkFTuZRYxtge30CKByqXPiS1/QQDY/a/iq97EvcMCVw3
         N5sr/T5UydwIvTE5Z6uo1/AXDK/kvkmexnGELNmzsmz64UNs8c5QS/Cqc0eU949+U5Df
         9Js1oBpvX61qBurkbRsJDx02XbW+t4wWPw/YO39G3e7F7qrSJCavGihgIib+tmrF527j
         mgIVyhPHovVEZsvWCC8Qu2CRW1LdP7lj4WwseK3b6YGhd8dtjvy/q2YhTlDXOcjRLJST
         Ll+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVUHlh3ktxc7zCq7xUmZ4fN5dckAiuUmolubCVNJzhQT2dWYmuz1Yhdy0bHfSnr7k0NjIjrIa22HsroeNThTg2PIQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo0BZV8X0DSiWsH9kCJxdUrLm7yQ78ivXCfpgS5i1ItjZAeEhx
	MNV2A4tMTtJJ00xjX/MaRlb5ZwXXpnuU5qx0ucBcbhdO/AnYnBlYy9iDQqfd
X-Google-Smtp-Source: AGHT+IFBjrap3mMZ2cirA6lrXEvadOZ6TzvzerL1QftXHZYuZEuKKewbptqDb+OtiWT5EKXcCX2V0g==
X-Received: by 2002:a05:690c:a96:b0:613:febf:7a7c with SMTP id 00721157ae682-6c0fb642ab9mr66839707b3.16.1724333996566;
        Thu, 22 Aug 2024 06:39:56 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6c39b00750fsm2121557b3.65.2024.08.22.06.39.56
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Aug 2024 06:39:56 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6b5b65b1b9fso7161807b3.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Aug 2024 06:39:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVTxpo8BcXsATl2nc1lH+ZeW0LD4OX6WNAABqgaJuYvPjLk6QYwAr1kJN5IgrZoDq0mqNf32/sgeKgXO7b9679qbQ==@vger.kernel.org
X-Received: by 2002:a05:690c:3208:b0:6b5:916d:5a8 with SMTP id
 00721157ae682-6c0fc1de281mr50698077b3.23.1724333996042; Thu, 22 Aug 2024
 06:39:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240822004454.1087582-1-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20240822004454.1087582-1-yoshihiro.shimoda.uh@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 22 Aug 2024 15:39:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV122yfBkYS9Kn-e+cOHp=9cEKB1g8JeqK6x3=p_ZmLwQ@mail.gmail.com>
Message-ID: <CAMuHMdV122yfBkYS9Kn-e+cOHp=9cEKB1g8JeqK6x3=p_ZmLwQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] arm64: dts: renesas: r8a779g0: add PCIe support
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: geert+renesas@glider.be, magnus.damm@gmail.com, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Shimoda-san,

On Thu, Aug 22, 2024 at 2:45=E2=80=AFAM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> This patch series adds PCIe support for R-Car V4H (r8a779g0).
> Since the dt-bindings of PCIe driver patches for R-Car V4H are merged
> into the mainline, it's time to resubmit this dts[i] patches now.
>
> Changes from v2:
> https://lore.kernel.org/all/20240520075931.126476-1-yoshihiro.shimoda.uh@=
renesas.com/
> - Rebase the patch on renesas-drivers-2024-08-20-v6.11-rc4
> - Add Reviewed-by tag to the patch [12]/2.

Thank you, will queue in renesas-devel for v6.12.

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

