Return-Path: <linux-renesas-soc+bounces-7598-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F35A793FD98
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jul 2024 20:42:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9CF511F220B7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jul 2024 18:42:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96DE1155C95;
	Mon, 29 Jul 2024 18:42:04 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F02078061C
	for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Jul 2024 18:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722278524; cv=none; b=FwNbuGWxC5uoQWY3nWhK8sQJbpisnVKsDeU5iRDYjakW6rO+DqDHngkVdBWg4c5Q8gLE4Ps2RjEfG137LuBm05MOQA2WCxeLwjcU8stlf/L5VauScBmV3fdbM5u4FZylK24ceOE6YyCiKfJmb+ttjg8RZvzM5pECGc5yZmNEe1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722278524; c=relaxed/simple;
	bh=IQpzM0EMxc2amEWp1wxqJSMCzYmTsHPp4YU1hPtzpHo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ekxNYt1COnjVLi3QCBrK0JEEI+D/CKIvgCfPOGA55JBjJDBSwxWEZQ58/T0s2gZPIz+DHgar2t/jYagxhBzgXzzu8FzHDRLE8df1sNSL0iUIm9SLDlOcmOh9lHsFqvy10i/iZrgOgCXAhOch+yuxXTEaeJJlJv1Doi17EEQJbjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-65fdfd7b3deso23465787b3.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Jul 2024 11:42:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722278522; x=1722883322;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P+5mQMXe49IkSM2FpMb3qG8GqYhaXW4tDNH68fefN68=;
        b=sb1ChKQNHLr+Mz3/qw2E/MNPDSEgxuWPyIltnDyZFdDfwnBjXPWIM1eaDTnhc8PLIr
         75K8qjQxG4zAiQtmR642FUNixsjSC2vZokOleZIDDYNzQXbsj4qOI7drCuV2ikUpGXr/
         U2mTuujd8C+KWoBVAA3fC7OY85X+1FGOAc0e9GtkVN2ne7sN9OwMUJfOzEDBKL15B/YN
         bt8gZKbp7fjUmE4eAlBz9Z9JaQegdOd0LsYYwTgFFpue83etn+7NghIrHhzjuZYnbIxl
         5zG68WUx3Glcpd32oPuuHFRS5mzbrf6PKMy8/+r1OJOXqs3LPkdEXlvcPqqANvCkH1nC
         Nqsg==
X-Gm-Message-State: AOJu0YzY9GybwG7GO5HES1JAa9QNtY7i3Ck9RiApSMSzR5nWzRHebv9p
	PcOYudgwwzlpbWxb+g5SkRgi8h0F1mpl/AEmdn08f9wFofjFR/e3WnKOswPy
X-Google-Smtp-Source: AGHT+IGwC9CENYXdi25hjJnUA5RVe+3icjQBvCL81KCFziJUyZ8FYZgEaTpEpOFcq+DwAXPLzMFdhA==
X-Received: by 2002:a05:690c:3748:b0:61a:e4ef:51d with SMTP id 00721157ae682-67a057b82d1mr118334667b3.9.1722278521652;
        Mon, 29 Jul 2024 11:42:01 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6756b024a59sm21771787b3.92.2024.07.29.11.42.01
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jul 2024 11:42:01 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-65f880c56b1so22526787b3.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Jul 2024 11:42:01 -0700 (PDT)
X-Received: by 2002:a0d:eec2:0:b0:63b:f919:2e89 with SMTP id
 00721157ae682-67a057b905emr93377307b3.2.1722278521269; Mon, 29 Jul 2024
 11:42:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240725194906.14644-8-wsa+renesas@sang-engineering.com> <20240725194906.14644-9-wsa+renesas@sang-engineering.com>
In-Reply-To: <20240725194906.14644-9-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 29 Jul 2024 20:41:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUcgrLPpQSoMiiZQS0oJDryHz=36mChobuMn9WW9fHtng@mail.gmail.com>
Message-ID: <CAMuHMdUcgrLPpQSoMiiZQS0oJDryHz=36mChobuMn9WW9fHtng@mail.gmail.com>
Subject: Re: [PATCH RFT 1/6] clk: renesas: r8a779h0: Add PWM clock
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Cong Dang <cong.dang.xn@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 25, 2024 at 9:49=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> From: Cong Dang <cong.dang.xn@renesas.com>
>
> Add the module clock used by the PWM timers on the Renesas R-Car V4M
> (R8A779H0) SoC.
>
> Signed-off-by: Cong Dang <cong.dang.xn@renesas.com>
> [wsa: rebased]
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.12.

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

