Return-Path: <linux-renesas-soc+bounces-7145-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DDACE92998A
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  7 Jul 2024 21:48:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 81C491F2125C
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  7 Jul 2024 19:48:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 493963A8CE;
	Sun,  7 Jul 2024 19:48:38 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB6231DA4D;
	Sun,  7 Jul 2024 19:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720381718; cv=none; b=MNsx2L4YF8gnDGWAxn+pLpBaWZyZAcfjv9TTCxYwi56AYcKIwYAy6ZMocoCiLhmqonv+mOW214jFrq+EsuDbgJtu2ye6XETPKIG9C5ytxExXiRVx+lKXhSKJqFhNBqNNT44ZNss22X4UFwatM6a43O95i8aTBV7rGZAMKEf8Pqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720381718; c=relaxed/simple;
	bh=w8dtLH5b/gCGh710eceQVGii0Z5ddM0LbRV4Q4GhUm0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=ZOJBp8b7YW2nQX58E5VzvbJ5p7TZRRccsrv8IPzEQNl/CGh1OwbhJ1Ni+xwNkZglyOfcke3lTlPHK4qiOKoddR9dSJhtxH0PJXGdBLZaoOMtu/pIMtF1QUSLZF3jGUCmSlZeCi50Cs/iHOZOets3PpAepQ2XhQjhDJumnzJv+fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-dfb05bcc50dso2760134276.0;
        Sun, 07 Jul 2024 12:48:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720381714; x=1720986514;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RMsuZ61QBM82MumDaO8bDuXHBbe5krN+mT8zYezhXwk=;
        b=sj/3kLrv3H7p4pb3ylti69SfUiQk4s0X29ThV9Abm30QO8Ki25RzPulKNyrgaENxnO
         Kie5jGLlwIENAxrgp/ao7JZB49gSugEK89zxO5oGXLqAB17QX3/HbteHRNyQy+y5WJ2J
         d8MupM264lOZnehstbPTNSrOHMhDIBneDr8i4MuxKIzJiA+5/kGraRSlAWu5llZRcn5w
         6lVL7JbfaHyj6XKY35qg9zf+nq1Jtggj9Q6+9435080W6wz/tFpGdbMRyzMu0Qqbwrbv
         oonxDsZOvFXmKSzo/AqqRSHcAgFa6d4Qpco9xFR1uYBeIIUWfqiHHMPZA5KCF5AuMb6r
         993A==
X-Forwarded-Encrypted: i=1; AJvYcCU4bySsOui1WAGDjqFO/C/TR9JGv7pq5EEvnq2hiItmu6PnvYPfNHkM4F1R0o50TlfQRnjI/BUvGu1j8hgMOCeWqoZ/HprOnAKHn7YB4erwS4V+RdlMlU3B5bXLxGspQzMZbERjnGXPMihLFrFEDMpE+9H+X87+LjvRqTsX5Ww1REkPSMUIUmd5vbYVxhNbOVWsHhmTxFMOzkv5pWZEIgMdfQDnww==
X-Gm-Message-State: AOJu0YwqUDP3U5HWsTSx71F3FVmo5qZ8G2Pzt+YIgjY3giuVmMTHVCQl
	PEuiWA474DRgYhfu8CR3WEQKb0gjECWuu+iTyX3cbJfxxC90NdD0OOQSGx5k
X-Google-Smtp-Source: AGHT+IEFeKZdjsdQAmGHulgBOFRmVtfVuxbYqrjSPEGkCvTVrtuzn/VZ3SDDB0MiOZG67fiu+/DdJw==
X-Received: by 2002:a05:690c:6f89:b0:64b:5fcb:6847 with SMTP id 00721157ae682-652d5345b48mr118905317b3.16.1720381714414;
        Sun, 07 Jul 2024 12:48:34 -0700 (PDT)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com. [209.85.128.182])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-65171900016sm16823687b3.99.2024.07.07.12.48.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Jul 2024 12:48:34 -0700 (PDT)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-654ce021660so14370987b3.1;
        Sun, 07 Jul 2024 12:48:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWR77H6Iy0FvtPBqv2kpxBSrWKUbf5hEhhf/JxjQ/nl83ujQDwKvESvknq8rnyNUcH07MQv8ASbqNjyJwB4LLyJcul+7sCc+G3GuB4gnO3frtMoWbgy0XYf711WgvPFmQ5eBMY3fqPObzhSjr9uH8tniKVr/TXW0hBhmNUv7C7VJGL3Rrs4KPcKQUuUtxmFaXH3+m0w3Y7p8qMHkB70s6iWuEktvQ==
X-Received: by 2002:a05:690c:986:b0:632:58ba:cbad with SMTP id
 00721157ae682-652d522632bmr92288727b3.10.1720381713087; Sun, 07 Jul 2024
 12:48:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240213220221.2380-8-wsa+renesas@sang-engineering.com>
 <170870160052.1698319.4712751560931025638.b4-ty@kernel.org> <Zooqfe1sJQsvltwj@shikoro>
In-Reply-To: <Zooqfe1sJQsvltwj@shikoro>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 7 Jul 2024 21:48:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU6OquhF_WRxD+YxRfJwASepOb-pJp3wT7bvcpb1PHLDQ@mail.gmail.com>
Message-ID: <CAMuHMdU6OquhF_WRxD+YxRfJwASepOb-pJp3wT7bvcpb1PHLDQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] mfd: tmio: simplify header and move to platform_data
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, Lee Jones <lee@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-sh@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 7, 2024 at 7:41=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> On Fri, Feb 23, 2024 at 03:20:00PM +0000, Lee Jones wrote:
> > On Tue, 13 Feb 2024 23:02:19 +0100, Wolfram Sang wrote:
> > > Changes since v1:
> > >
> > > * rebased to rc4
> > > * collected all needed acks (Thanks!)
> > > * capitalized first letter in commit subject
> > >
> > > The MFD parts of the TMIO have been removed by Arnd, so that only the
> > > SD/MMC related functionality is left. Remove the outdated remains in =
the
> > > public header file and then move it to platform_data as the data is n=
ow
> > > specific for the SD/MMC part.
> > >
> > > [...]
> >
> > Applied, thanks!
> >
> > [1/6] mfd: tmio: Remove obsolete platform_data
> >       commit: 58d6d15662e4039fab7d786f0426843befa77ad4
> > [2/6] mfd: tmio: Remove obsolete io accessors
> >       commit: e927d7bac109d8ca1729dda47a8dbc220efdb50e
> > [3/6] mmc: tmio/sdhi: Fix includes
> >       commit: bed05c68aa8f078206143700cd37e42a0084155f
> > [4/6] mfd: tmio: Update include files
> >       commit: 3ef94c41db82573dc1e1dd6c259aec8ef6caaaf3
> > [5/6] mfd: tmio: Sanitize comments
> >       commit: 2d417dda59123b9523a19ce75fea3fd1056c3b4c
> > [6/6] mfd: tmio: Move header to platform_data
> >       commit: 858b29729c9d319b9cd1441646cc3af246d3c3f9
>
> This series is not upstream yet?

FTR, it entered linux-next in next-20240402, but disappeared after
next-20240510.

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

