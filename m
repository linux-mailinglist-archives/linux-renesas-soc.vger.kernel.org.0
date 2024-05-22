Return-Path: <linux-renesas-soc+bounces-5431-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA158CBDBC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 May 2024 11:24:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9DA54B20FDD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 May 2024 09:24:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3F2080BE5;
	Wed, 22 May 2024 09:24:13 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1677680628
	for <linux-renesas-soc@vger.kernel.org>; Wed, 22 May 2024 09:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716369853; cv=none; b=DUV7Pt5oQxHot2HVApfUaL7VeIRqhqQX3hGrWMuY06TI32tfjGgTvdMkKJyoqCQxx9PmuxttZt2q3EtM+Ca96QTTUi1ViJmXq86so+jAdaewjKTBF23KXckc4ofyja2i1HUZuShjzOPYkC/gDRmPG16CTgosfBUv6RleN0b52M8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716369853; c=relaxed/simple;
	bh=7lgaXLtpGrK7VI0XRMH3A6Q9O5Gha8VVPOm5F9kWPRM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=agvQIO9zdbW62qiOyVmbPxyV3XCjGJklbrHIo007+C2+NJcISJt8RYL9/gZugD4UCOm1XjE6B46wx95CB6QcmNkPQMopjERyaEYcJlzJBaO/vpNORywIkajNrJgBEULyf55ip4LMuzn6oStPKjUaZk6bXt4vneO8BHJY8QWp7/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-61df496df01so4858357b3.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 22 May 2024 02:24:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716369850; x=1716974650;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bx08FTJFw0t90jJLrxPKH9799qhaiMk2YYkuuEBtqNE=;
        b=Rp8FuvtP0LZKe82dIEpYXyPEH8sDujv48z5+YZ4KtGoVvtTJSMB1MFCvKj/BNi+IJF
         G8Dmo38PBH3vovpVMhJk93bPiv/m/Fj1LXWaYUfp9Nik1DCbl9sUDw3CIvFK60ie+pyz
         bh6/Z0jfEEa9quugnzwLk3kmh5tLQ2PIpkWF9spth8MpjSkfdxjL/PrNrWbS98eAITXN
         CZzyjeV7QqgJ4SLndiRqHwRXSiZXGP7zjw9L89tU8UVolpgaZmOp4s7t/RIt+hzut1zd
         sTBf6OnRxgoInaKAQORFrjxvbcMxZiWMrf7Vklq6TdUbj+uE+Ar+JHcl1WModfLqcphT
         kz0w==
X-Forwarded-Encrypted: i=1; AJvYcCXj+Yoa94lPaHMb0cARFLGdEHrLk/09F+1ZCIWFYeXpZJBfXDA8wPOjOO5tesZJmZ7yK+tBYyOnh+vM31X/RFbwEQeqWq48/2uYCi6Fod/rR6E=
X-Gm-Message-State: AOJu0Yx5E9dHa+DYHQ+d5atZ5CbVoxMZM5n26J+wVyNNO4gELmn6X+em
	ThGLaU+4j3QkrG/NCp8/utiCqVvVEm1+/SuR2CarMtGQnTkKlwNlIybSZ5xe
X-Google-Smtp-Source: AGHT+IEs6P26RPZhXEzgCz1PnSlHMFav024K7pmOtUsWMuOp8dfsE4ATi79L5GVcazfonWNj+/rkaw==
X-Received: by 2002:a05:690c:f88:b0:627:dc03:575a with SMTP id 00721157ae682-627e486a59dmr16798237b3.49.1716369850604;
        Wed, 22 May 2024 02:24:10 -0700 (PDT)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6209e3818fdsm58416617b3.129.2024.05.22.02.24.10
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 May 2024 02:24:10 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-61df496df01so4858237b3.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 22 May 2024 02:24:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWuxQMZI6ndoxAtm2RPvfCU//9C0r4uUx2GgpGT+JVuR4mI6mrAJnVssy9FPmWzprLU7LUKPv5eZCc00y+wbXMsbh/ggy8dsxa/o7rHlOMr3Yw=
X-Received: by 2002:a05:690c:6612:b0:618:5e8c:c66f with SMTP id
 00721157ae682-627e467cdb2mr18427537b3.7.1716369850080; Wed, 22 May 2024
 02:24:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240520075931.126476-1-yoshihiro.shimoda.uh@renesas.com> <20240520075931.126476-2-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20240520075931.126476-2-yoshihiro.shimoda.uh@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 22 May 2024 11:23:58 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVU5xC7KAOL9LFuLFDam4DG8vCA1g8i=f_x9W-4nym5Uw@mail.gmail.com>
Message-ID: <CAMuHMdVU5xC7KAOL9LFuLFDam4DG8vCA1g8i=f_x9W-4nym5Uw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: renesas: r8a779g0: Add PCIe Host and
 Endpoint nodes
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: magnus.damm@gmail.com, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 20, 2024 at 9:59=E2=80=AFAM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Add PCIe Host and Endpoint nodes for R-Car V4H (R8A779G0).
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

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

