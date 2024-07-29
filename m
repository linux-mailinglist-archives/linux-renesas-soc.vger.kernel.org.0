Return-Path: <linux-renesas-soc+bounces-7588-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9827993F1E8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jul 2024 11:57:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5520E285AC9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jul 2024 09:57:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 073431422C4;
	Mon, 29 Jul 2024 09:55:04 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E3371422C5
	for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Jul 2024 09:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722246903; cv=none; b=sZeedqoHZddGVbUL9rX7OD0SDU93g9RoVENEGqVcNYV3z1vkEP3GRU4/x9KDmVvBY1lxLMW/igzk2E7ST+I7C8pIqM5oTkHW8T1MQXToJp2jnbconXi6kefnzFyBsC8v2Lmx0W6kkIxw/nUAsL2oSTyGVXDWVxTNhgsw/8gTO4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722246903; c=relaxed/simple;
	bh=4W7Q/3Y+81bf60bNwwabbhdO4TGqkAMldIgasC4xwh8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XEHRMB4C7wM5oe7snkGUc77ziePd0XEXndNk/aNtMwA9//y+Z0KBCLcwrzYPPbvET9dEXYTKlJdauWK7LDs8Zx6K9qXJAtlDfE/YgAQ2XvhgSd43kKuo1I6VjhsXWB96ulU3FJ232hvLvzppBrZ9vOY7c+yYyjqqsRo3vhuYsTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e08724b2a08so1839636276.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Jul 2024 02:55:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722246901; x=1722851701;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M/ok9qbooCULBoCC3Fz/cWf/UOKzsAS3YOavxa8QYWM=;
        b=YFM6IRGPVM2tlwXkpUI/rP6LNxd1iJCI3JUM7zjJd+obdt2/xLYYGB/2UjWV0Lb9bq
         LL3HHx9ZLjjUarFBU6kumuEqqalIB9f8pzBFtVLMMlRxw5XABEC3Wrks5E+0gEVXGaRq
         8h3f60Rk5LTV7kbPn71jEoFae9m2NCnRj+HgcZl9L6mGRjP6z+BY+2RSO2H43BVdHvn1
         1Fir4/RHzR8cKkYArcG52q33pUwdsgF5b6rHbKTxHggSQUKTnfb/n82EmFE/qecy9hrt
         1ckA7eW63R5B5DbyLnM/iX4lHdHV1cTA5X1FPU8XqnXNCZlnICUqz+xUK4sDOqENJRbl
         Ac/Q==
X-Forwarded-Encrypted: i=1; AJvYcCU5rpOfHKHDGTmcyFPLyEcpx7OynTb9X8jhYQMvx46jMDwHL05fKfVatmkwetFeljPbLt75K4K8aIXnIgRtPLNPIyZE2bBU+Gi/vgdjYiSv/Fc=
X-Gm-Message-State: AOJu0YzBzT7agRA+3Vg3hVzBgu4M87MOysCk8DIJ/N3+UVH3m2l+2F9m
	TrWuUqZgipLFCszj8PlskhdNd1qxdyEwU6M0regMdYgDsgf9hx/mNsq1AJOj
X-Google-Smtp-Source: AGHT+IFQAx2yjQ11XIzrDtnnTNWQGayIKWN4A7s/9sQxcJzzhxL3R3bJXQhQ2oWgCz7cgDSBymv15g==
X-Received: by 2002:a25:e052:0:b0:e08:54db:46cf with SMTP id 3f1490d57ef6-e0b545a5fc5mr7797294276.38.1722246901210;
        Mon, 29 Jul 2024 02:55:01 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e0b29f1c248sm1750454276.6.2024.07.29.02.55.00
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jul 2024 02:55:01 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e08724b2a08so1839625276.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Jul 2024 02:55:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVInLyZvrjhWuuqD4gvj4fPOL8kowJP7Gq74Phvlg7Eox00FfYD5e2Hf580wv/YVMtUN5AxsiCrLYe11a9jiSWyNf/GqdyipzaKggs/VDB2XYg=
X-Received: by 2002:a05:6902:1889:b0:e0b:2c11:bc4 with SMTP id
 3f1490d57ef6-e0b543f2cf1mr8570782276.6.1722246900777; Mon, 29 Jul 2024
 02:55:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87ed8bbae7.wl-kuninori.morimoto.gx@renesas.com> <87bk3fbadf.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87bk3fbadf.wl-kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 29 Jul 2024 11:54:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXWpXANMS5rAa8Yrz0X7HtkZ471eLSLXtxC+FA8aeQ-jg@mail.gmail.com>
Message-ID: <CAMuHMdXWpXANMS5rAa8Yrz0X7HtkZ471eLSLXtxC+FA8aeQ-jg@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: defconfig: Enable AK4619 codec support
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, linux-renesas-soc@vger.kernel.org, 
	Khanh Le <khanh.le.xr@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 3, 2024 at 2:13=E2=80=AFAM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> This patch enables AK4619 codec support

as used on the Gray Hawk Single development board.


> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

My
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
on the previous version is still valid.
Queuing in renesas-devel for v6.12.

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

