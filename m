Return-Path: <linux-renesas-soc+bounces-7025-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F259255A6
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Jul 2024 10:44:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E3BFC1F22EDD
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Jul 2024 08:44:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A18213B280;
	Wed,  3 Jul 2024 08:44:18 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA6F513B2A8
	for <linux-renesas-soc@vger.kernel.org>; Wed,  3 Jul 2024 08:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719996258; cv=none; b=ELSEnErPzNmKRBHiph4BZ/ZLsi5O4Wti4LZAu9xgw0rrBEczJQYxVSJp5Moj5bTB8Djb587FUjc1+igT7o4ue3hEXjbQWB4epZFafvTNEGygRbDNpWY3ovGJe1EFLWuGuxIVSByTYYXclTM4q+sdq+0k0JRFrMSHzUAfzbDvdno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719996258; c=relaxed/simple;
	bh=lfYhCpSNEcSSBekm41Rcg1QczgJNJvFHIgMdLfYkENE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=udPx6KgYsDxQD2EtyXdh1dGX1uYp4xJaLUfaJqBL+9bYZ4zE1ViFWUf6QRgDrwJMH7McNw5mj6LWtvGNpZtHAEsp9XMG/kDGPpMKBIOV+jchcXeyGIlN8TkMELonNP+MEcYzXX9tgBvijELHrBG26I0ci/SDhoE7OgZgL3OwY90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-64789495923so45267507b3.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 03 Jul 2024 01:44:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719996255; x=1720601055;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iTOEiopHHwTsXGdMpO3uvq01luUSqxLZUzus4h0rnTw=;
        b=Qq5fIVSuvIgDFoFawb76Y9iG8Ei3Y5iW5zQXs7+A8yN/Ju2T2reo2RIfInIvrW+Ntg
         XFsSkqBD6etn02C8cZpmemjcCGYQVo9TZ6O8hBuFfENFROeDrMFowqpnTGDYV3sTjca7
         Y1lkaremCNI3yBSisIQ1FvYJv0WtGUr6Q1ztx/SAG8WCaupKFrzhBY88+U7LSrDOuvfq
         RHP48ekoXR1XGmLopVdoSegwjPDhpq82GHG69wQQrHJBks4o8dvbKP4nIf+SKA06c23C
         Q1jU9KNLNv1laGAWPuY8NqHxHk1tEMdBSood8OmWgJ5g2t8Mkb3dUyqXzM1DmQJmyLll
         k+4A==
X-Forwarded-Encrypted: i=1; AJvYcCXF9Kd2Oi3O8ctsRV593ugaRDiqyV81cKJATfTNV3Hz4LO+kbCB3ITztdxz9qp6ajenMi8D7VwmGKn3Z+tpDN5FtxTrENIhWwT9YYGR2q44WFo=
X-Gm-Message-State: AOJu0Yy9gezpK03KtAFPI/H8UCl4M6WNu2TKsZglYjJXY7+BlX3AAEMU
	247TFp4/DtkVzR+HK3vVbu/CpAMs+Vg1ywGlEfzd8TxXtUMNbxH4r7XVThUc
X-Google-Smtp-Source: AGHT+IFo2fc/aE6NDWqq4OQFnzExHwKsbub7XTkE4GYnDVj9Gjsf8f1gmQgoiZAq3NdkQ/qCbHcm1w==
X-Received: by 2002:a05:690c:d82:b0:631:78a1:bb5 with SMTP id 00721157ae682-64c73419043mr127093257b3.35.1719996255123;
        Wed, 03 Jul 2024 01:44:15 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6502ed74ef5sm5155317b3.49.2024.07.03.01.44.14
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jul 2024 01:44:14 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-650b8e0a6ceso12176697b3.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 03 Jul 2024 01:44:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV99QtjpUYj+I9oPz6yvL8hC7XikNMxAWQfpkkMVVB+DDmH/wqKg+BvovQjDRNvLgjcGSJxZwgWD4L1bo/Mqf2fR8cRp900go+bAI3Cd7zJ2MM=
X-Received: by 2002:a05:690c:d06:b0:62c:c684:b1e1 with SMTP id
 00721157ae682-64c71ecc192mr127179607b3.29.1719996254376; Wed, 03 Jul 2024
 01:44:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240702045535.2000393-1-dirk.behme@de.bosch.com>
 <ZoT0ke0NtzoCD1yq@shikoro> <ZoT7iM2DJG1p1GB1@shikoro>
In-Reply-To: <ZoT7iM2DJG1p1GB1@shikoro>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 3 Jul 2024 10:44:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWSfmmLoQ1XsRisxsFUF=RHChb908woavW0381x=sF6QA@mail.gmail.com>
Message-ID: <CAMuHMdWSfmmLoQ1XsRisxsFUF=RHChb908woavW0381x=sF6QA@mail.gmail.com>
Subject: Re: [PATCH] [RFC] i2c: rcar: Clear interrupt registers in probe()
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, Dirk Behme <dirk.behme@de.bosch.com>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

On Wed, Jul 3, 2024 at 9:19=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> I think your patch here might not work because you write to registers
> when the module clock could be off in most cases. My patch should be
> good there. As I said, proper testing scheduled for tomorrow.

Good point, I had checked that, but totally missed the conditional
pm_runtime_put() :-(

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

