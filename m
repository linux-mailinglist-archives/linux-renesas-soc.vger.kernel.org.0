Return-Path: <linux-renesas-soc+bounces-9423-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF959904A2
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 15:40:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3DFB41C20FB2
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 13:40:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 119C220FAB8;
	Fri,  4 Oct 2024 13:40:35 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDBA21D5ACD;
	Fri,  4 Oct 2024 13:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728049235; cv=none; b=H1d85lzkOdZMqzuPI/B032QPIAmtrAkWKw0XaXTI9+HY00rX3tynqk6ENwbKd3H0fipUzxKGy1rClxOrnydYNNXNspZysL8R6Z6pWmdh+lStyGu/V4KNF55RO6cnXwbOQSGKX/xRcnZtKQyX575+bG128jJBizjpz1dCAZ5a98Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728049235; c=relaxed/simple;
	bh=4x9BxNw/U9ctFDIDdAyehIo48+6xKmUlwU/khWPEXyU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XKZ8IbmlaqldVAWV/1ExVo+yJ5WbvQHKYs5XoQscuVZjCfkZ3JLslwnR8fStiyeuI8Zv8AoDfwRI1B8WH1sFFcQ1vHm2Ee0qJTvnM0JEbuPLhGWPTLkafj1ONLhBIrmcnIUvGZ3U0iaibVqkDYy3HN11trnsTOF9nB9YdE9LT5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6e2d36343caso3197967b3.2;
        Fri, 04 Oct 2024 06:40:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728049230; x=1728654030;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J2pyuysyHZDTXKT76bipIpRl28jp/Yp+XutYIh17qqM=;
        b=l/SddTznP63k0SAyDR2t7kuXsUjBi++7neC3jc9TBPrSGG8Hl6lJi1bkgXWJUQQ6Ra
         U/Npnt9fAW1dTWrpSLMwT4FFAF+bIchzKpOWx9R56FeVZJGFUAKV3xjJQs2kHMW/y82J
         ZhZB5Vz+/H7HQ4x9bP+yF/mn1Ltlhrs7FrORqGSx1nqeVoR5jTZm1gP0HOlesDGhBkch
         mYArB4gfBYSP55oUlmiQomusfUH29QpdauJoSary7Qu1td9Fa9YHqgcxMyI6qNm0ziAI
         YuqB7N9c1+vK2L4x+dJ+7bUZv1l05524yHLaMPZYCb3gCCv4IzuYHm7zrLE6u0m2tnJe
         +LUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCK95e8c6m+ON1ug6AVPdNeAhNV8IVVrBfQ1Txh9dA+45HOx/XIqxffe8xFXo6GKP+I06GIII0m9Tf@vger.kernel.org
X-Gm-Message-State: AOJu0YwrljWzaaY4Z0Uv1aGQmH8oZNbpvRUNVE1sQ+Z+mAyG4IpHoaXF
	IJDD7ibYF0eQHRDUwZM5JRmZrvlFZBRXShVRvQ+l/r08k2Gjqj0ngCoz9nxbZNQ=
X-Google-Smtp-Source: AGHT+IGIcykdRVTnmifNaMwLJcurlJE79pBB/w3oaO5X8dA+t6uqsMtzcTbzTtkqLiWdLuXfZhvA0A==
X-Received: by 2002:a05:690c:fcf:b0:6dd:d2c5:b2c with SMTP id 00721157ae682-6e2c6ff685cmr27458177b3.4.1728049230057;
        Fri, 04 Oct 2024 06:40:30 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e2bcf9623esm6351557b3.88.2024.10.04.06.40.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Oct 2024 06:40:29 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6e2d36343caso3197747b3.2;
        Fri, 04 Oct 2024 06:40:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVKExM8AU6JcE6l7Mwy1ZXOxzh2zPd83RtR2X6JbX6kj4KxSSsFTMcMsf/tm/sgS3Y/x25rruePRfJX@vger.kernel.org
X-Received: by 2002:a05:690c:6893:b0:6e2:1336:55dd with SMTP id
 00721157ae682-6e2c73197f8mr23454557b3.46.1728049229258; Fri, 04 Oct 2024
 06:40:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240926102005.15475-5-wsa+renesas@sang-engineering.com>
 <20240926102005.15475-6-wsa+renesas@sang-engineering.com> <CAMuHMdXjt6raMKqZEms0ZkZcS7O0mgThNVoQnGOrK7_gRoOJkw@mail.gmail.com>
In-Reply-To: <CAMuHMdXjt6raMKqZEms0ZkZcS7O0mgThNVoQnGOrK7_gRoOJkw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Oct 2024 15:40:16 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUojE_v8K+vqrTQL5+Lym2e6PoWSNr4E0FBzLGO6iPbxA@mail.gmail.com>
Message-ID: <CAMuHMdUojE_v8K+vqrTQL5+Lym2e6PoWSNr4E0FBzLGO6iPbxA@mail.gmail.com>
Subject: Re: [PATCH 1/3] ARM: dts: renesas: genmai: enable SDHI0
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 4, 2024 at 3:23=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
> On Thu, Sep 26, 2024 at 12:20=E2=80=AFPM Wolfram Sang
> <wsa+renesas@sang-engineering.com> wrote:
> > For this to work, User LEDs must be disabled because they share their
> > pins with SD data lines.
> >
> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-devel for v6.13.

Oops, obsolete version. Please ignore.

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

