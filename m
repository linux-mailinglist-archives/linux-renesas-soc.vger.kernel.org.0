Return-Path: <linux-renesas-soc+bounces-14296-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB5DA5CA1A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Mar 2025 17:02:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A79EB1892BB4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Mar 2025 16:01:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 969EB25F7AD;
	Tue, 11 Mar 2025 16:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EH99VqGY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A27E10E5;
	Tue, 11 Mar 2025 16:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741708834; cv=none; b=nrI5GXSrTpt8z/PPk89XaYB6vVN5dHHL3m1UgemNewPepuWJWs7nccUNsthufyX0hUBzpEnwKIPkE8KwJPP6r99xbMtaR7knC6esbjikqGMMUqyJFsiPz0U9f0I11vd+2oEIE9uqmbihgLZldn3MsIsRQG8vSEwdN5paSO8mphk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741708834; c=relaxed/simple;
	bh=2auBXNdvESIE1nGPheF77YVwGIOUgDIF/RrJypfSYT0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nCx0FYXs0y9AnnR8CeSu6cBmn2TYg4nyUGEX8YFblTPmmDwxKKDacIWV+Ksx0a6kThnrUCjOZkLE+1eh/u5Zb16729FbMNTDCgv1/bAz9oYmj5boOfOxLQ2RoOn4TYxsE3Dn8n0uNCdjTmItG1aCZJmUQ8PRzACre43dgHKppdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EH99VqGY; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-51eb1a714bfso5460562e0c.3;
        Tue, 11 Mar 2025 09:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741708832; x=1742313632; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BYV2O2ADUmnC4EjpgIkzJxqCjUachXXpNhXgHQTp1GQ=;
        b=EH99VqGYGMTi+f69OQBTxY6ts8WFMf/AmpQgPb1wHv5ysGLtdms7wTq2nKQ3Y2dXFv
         9NK4DuxxgzN4gRFTklZ5iuGc+o+hbNGyMdc+PVLxVyF94L1Ybyehgkon7PZreYPTisal
         QdGglXptky1BGfpnhw5/EbYAovDiS3nbYxR0t7KYLMpaH9ZpWgQWbSptXoli4g8yfSSd
         VaHeh3gK50R+kqjEuqA16Yv9IZNYifQUql+CCqN37WmZQueE+s84C10gPahNf2phdDSP
         H2b2OxRtHXvE+XkageJ05X2YE6FcFpNH4UhylJLo63Yg5vqtL+puLfVv3U4RP82trjy6
         2mig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741708832; x=1742313632;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BYV2O2ADUmnC4EjpgIkzJxqCjUachXXpNhXgHQTp1GQ=;
        b=w0w1jvetAAda0aWWs6eIVhbGxb1PkoBgDmoBCEaq0oh9df3UMunFx8yhWvbMkujdrY
         pnYVPG9DflyTqpKtyr1avaBF7zfVBSIO+4UyErQCX8mkUEq9Eh7tQStNRjORIy/da0q2
         wQmTVFWBXvxLtWo0rGBKi4nV1YkObPAKfXF7YSRKzCTAp7vnKfyQ8MVz0BxnC0pe+cjW
         W0xjlT6xWbWuztflPWoSpb0Xfu5KYpGFGtOty2IPOi9tPgmk9akJkFWntddJWjG/u/dr
         luRDMJK4KzP279bB/v57WC+9D8/q4djoATHJ0U4hB50D/BGtQZ8e2wAI7EuggCor34MG
         aKvg==
X-Forwarded-Encrypted: i=1; AJvYcCVqnnrQ96siNKPb2GKUoABIQqfKLM66Cu3bVuMxky5I18Ety+X0MJFjt9fq8Zjy0OvVUXLxioYURAlM1mQ=@vger.kernel.org, AJvYcCWEU83lkwogj3qMsJ1eHzrVNSpXkxN+sL7TXY2FVtswV+h6TLw0NtKMb/DlEF/pLg9aU8A7GkYdaCIyoyk+9ojNNoE=@vger.kernel.org
X-Gm-Message-State: AOJu0YytAlozW7eR6A5NzihOyrFKQcTOe8yP288oWfbVomXERo+bJ0Zh
	Vn84HkUhJxD/Is2lxytlBeogLExuY0P2S7diz+FAiYnp5RQquXzQ3s/eXo8Jd5EAoRyWC0hm9Ue
	0l6iJdCCCs3iRe5GkaY0Cs9ltJCI=
X-Gm-Gg: ASbGncurng5gfPmxWCtcHgCf0Lq1La7z4FRiQfcpEja8+oT6NAotg7YBikPiHFqCpfo
	jfWAfDGDk6qCLf0+HPDoJNhTRlpKmb1Oe8Mw8hVH5eNqteLqLnQup/5IkvtKiIWM8ABRTcpPGsV
	9bwdCP4M93WbwgF5vGivQIbyjAyg==
X-Google-Smtp-Source: AGHT+IHivWeI31nWIIPrZrFlhM+7fp8bfXv0CzOpkZZUK77vgQDJv14Iuy7s4ylU5vfDky6AfN2vn2hLt14/RUDK+1w=
X-Received: by 2002:a05:6122:468e:b0:520:5a87:66ff with SMTP id
 71dfb90a1353d-524195bb061mr2798719e0c.0.1741708831905; Tue, 11 Mar 2025
 09:00:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <c499234d559a0d95ad9472883e46077311051cd8.1741612208.git.geert+renesas@glider.be>
 <CA+V-a8tGuxgan7Zx0YedSByfFSgrg5gmR6Fy3dMDXwU+TscZzg@mail.gmail.com> <CAMuHMdWXcRoqKz6S0sAtBpSM+_ghTs82wsN1dHvbHD5vO8W+7A@mail.gmail.com>
In-Reply-To: <CAMuHMdWXcRoqKz6S0sAtBpSM+_ghTs82wsN1dHvbHD5vO8W+7A@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 11 Mar 2025 16:00:06 +0000
X-Gm-Features: AQ5f1JpExm6w0oXJAdyuPwgaj8C68PW5etZpDKlnT5kc8GMf1Hy-JJ74ectxF7A
Message-ID: <CA+V-a8v_FPt0XG-a8GXNaHbk9z02Phq8KWUO5E+LUKDEvgqHUg@mail.gmail.com>
Subject: Re: [PATCH] ARM: shmobile: smp: Enforce shmobile_smp_* alignment
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Nicolas Pitre <nico@fluxnic.net>, Simon Horman <horms+renesas@verge.net.au>, 
	Kees Cook <kees@kernel.org>, linux-renesas-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

On Tue, Mar 11, 2025 at 3:20=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Tue, 11 Mar 2025 at 16:11, Lad, Prabhakar <prabhakar.csengg@gmail.com>=
 wrote:
> > On Mon, Mar 10, 2025 at 1:14=E2=80=AFPM Geert Uytterhoeven
> > > When the addresses of the shmobile_smp_mpidr, shmobile_smp_fn, and
> > > shmobile_smp_arg variables are not multiples of 4 bytes, secondary CP=
U
> > > bring-up fails:
> > >
> > >     smp: Bringing up secondary CPUs ...
> > >     CPU1: failed to come online
> > >     CPU2: failed to come online
> > >     CPU3: failed to come online
> > >     smp: Brought up 1 node, 1 CPU
> > >
> > > Fix this by adding the missing alignment directive.
> > >
> > > Fixes: 4e960f52fce16a3b ("ARM: shmobile: Move shmobile_smp_{mpidr, fn=
, arg}[] from .text to .bss")
> >
> > I wonder if this fixes tag should go back a bit far as I was able to
> > reproduce this on 5.10-cip BSP kernel on RZ/G1E this was only seen
> > when CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE was enabled,
>
> 4e960f52fce16a3b is in v4.5, so it covers 5.10-cip.
>
Thanks for pointing.

Cheers,
Prabhakar

