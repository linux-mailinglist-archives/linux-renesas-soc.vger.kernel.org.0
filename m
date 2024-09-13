Return-Path: <linux-renesas-soc+bounces-8953-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 062A9977F2F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Sep 2024 14:03:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 407DB1C216C4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Sep 2024 12:03:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64E5C1D935A;
	Fri, 13 Sep 2024 12:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rA+Mhk4A"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D311DA303
	for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Sep 2024 12:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726228965; cv=none; b=ODqdV/Rz8o71xMzCtKZpIMZha2YN9c2+JkXaPbn+wJ896qbjNYP5vFLQCE12ixeemwpmeZ9UHm8kfzTAwZZWzFczlKYkLXZuhMHNcpLWWIpxGdwahv65cEBHTsYYMVYNUEVnCCWqRmMgIt1gKpxPNBKLq9krP2UnvwMpAcSrQ+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726228965; c=relaxed/simple;
	bh=6PYXJ738FyEPSY1pHIaLaAl1aXVKY84HLyB+bqbrerQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rcuHIZXbPwftrS8EsxRsQobeJIgxqwMJgFLRjZ9RdxEOagXv2nQc74TbXxESQ7ux6NVFcwALS0TdX5N4rrwEZ21GCZAXKRDaNLNNmKAItCzh3NcbJBMLtcSl0rBuiEnGwUbGdszP3Mx5SQHzQpTRGzb1iDmmnjH/GIEDPB1TGfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rA+Mhk4A; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6db20e22c85so17052657b3.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Sep 2024 05:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726228962; x=1726833762; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZC5y+gbKcz2lOvMDPSoSOYxaB5aaC+GKTx2bSEhxRuM=;
        b=rA+Mhk4A2PBdoIDqwvQ4dq/KFPQldiLaL0pwmPkWDii/tQ8tuARiy/OoEgRwdf0ksg
         o90Nd+c9Kupsiz4TswI49pjs0wjFKq4ChvSLkyku/ZPWIkyG/GNolbUl4tOzVk8kJtoG
         UHFulYgyl2rDr0IkJGAZZf0J59xmb7Tv1G1JgxzJMFGaIkQjNJvekSJ6sbVxTH7GvYGp
         t0TKk5SmM6nGV07XAbaKRvazzhEleeSM32rAy5wKRtE2ZVjOJKSbHrFA7j+GHxWGLTaM
         NDjRBlI89/CPtXR7VoT5HSNkHNt1vlIQOMZgX2TNKQMnqmucRWDMJYlfhMrBSYdizHT/
         bI3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726228962; x=1726833762;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZC5y+gbKcz2lOvMDPSoSOYxaB5aaC+GKTx2bSEhxRuM=;
        b=JXjSBY/duQBlr/iv0CXvQkMYvvo0DEThGtYTcS160C+zniDq6ceURS+Txos1Z18+Lu
         Scf3QGLLg2Dmc8Rb5fnO9g482Ojn4bX0C2iCNXnym92XWIh2MDouRAj9qSNVXfQLBcuf
         TpHo+Iguk1rnNu/ub0YPNcuEozNNWdGP5fahpgrSwEjRuOu9WF2ZOwBpb0BM7fCdN1r9
         Ex2AIKepJX8Bo7ZjSpycVACUs+keuLrxEiJOodRrgjqUKEVv5HeSCZB7EMCCejqEo289
         hodAHoStn21PMi8+VXVAdSBBNFaK6oDU52/dxQECfxNB8nC1mXCljpMKGTPEcGSgIkG4
         zTtQ==
X-Forwarded-Encrypted: i=1; AJvYcCXbC5lAQoXTGpWF6rw4A7Tri1FajNZ0A+PayeyLYQ0s4EXU9h81b3ObFoucr+Xm9jVcWGjKRz9sf28M1id91TsptQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2bKu2uy6j9v1dtmLyvRkazBTDoMsTzfZrkA//oFEqQyDeWrv3
	ljJZHJB3P6RuzmdJHuGGnxE8W8++7ciG+QxOVDpSlDO+gNnhM6/3FI76DHrB9O39eDWlHgiQIqT
	sNq/8yHJS4uiWEnYdGlkBaYZ081mi10MF6qUXPA==
X-Google-Smtp-Source: AGHT+IH/TIqGo3l3sKrn6rpgbmS38MaCtup4PWkQrq9QHy/ehShUvJOygofHes+RONDG5YkXaBXtAw9fG7336kRilnA=
X-Received: by 2002:a05:690c:7084:b0:6b2:7ff8:ca1 with SMTP id
 00721157ae682-6dbb6b40200mr64523607b3.22.1726228961582; Fri, 13 Sep 2024
 05:02:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1725459707.git.geert+renesas@glider.be>
In-Reply-To: <cover.1725459707.git.geert+renesas@glider.be>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 13 Sep 2024 14:02:05 +0200
Message-ID: <CAPDyKFqFwA4AEbTVvUXbjyUG+zQutGm-xN3uCxDta+Z-8cmh4Q@mail.gmail.com>
Subject: Re: [PATCH 0/4] pmdomain: core: Debug summary improvements
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, 
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, Dmitry Osipenko <digetx@gmail.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Jagadeesh Kona <quic_jkona@quicinc.com>, 
	Taniya Das <quic_tdas@quicinc.com>, Abel Vesa <abel.vesa@linaro.org>, linux-pm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 4 Sept 2024 at 16:30, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
>         Hi Ulf,
>
> This patch series improves the table formatting in the pm_genpd_summary
> file in debugfs.
>
> The first two patches are fixes and cleanups for commits in upstream.
> On systems where performance_state is always zero, the first three
> patches have no visible impact.
>
> Thanks for your comments!
>
> Geert Uytterhoeven (4):
>   pmdomain: core: Harden inter-column space in debug summary
>   pmdomain: core: Fix "managed by" alignment in debug summary
>   pmdomain: core: Move mode_status_str()
>   pmdomain: core: Reduce debug summary table width
>
>  drivers/pmdomain/core.c | 21 +++++++++++----------
>  1 file changed, 11 insertions(+), 10 deletions(-)
>

Applied for next, thanks!

Kind regards
Uffe

