Return-Path: <linux-renesas-soc+bounces-10476-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D67789C6073
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Nov 2024 19:32:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9B2062854F7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Nov 2024 18:32:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 444CE213EE8;
	Tue, 12 Nov 2024 18:32:21 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D72FB2076A9
	for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Nov 2024 18:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731436341; cv=none; b=i/3F/K5Bj1ta0N+IArgturpJ62CGA5HilhBNiebR+wJ3Brm3YNOHL7HWMY7tYBTgqlct4qiF86rI/o2HocGLtyyWi3Zn/AcJcsOgGO2ZNB1HL/ZTxTZTkYJP/Nzts97HHVXJGuQuHOqdVEr8ykg27Q2El2aKyyap4hGPinbzCZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731436341; c=relaxed/simple;
	bh=ezAKtH3QbJaMk1YbYlLzZuhWHM4kZNjq5CG8gfunMUw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CMYnjr5B5D2jzxL6Jpf/70sjeES5VghyK3DglHmImlT6sMofEBpmSysAHuqo2hHT7IQtvEvLyKfaDSBb0xxajKEyyhJ7g7FosEQ6wrcyG5T9sFHqBHS+hnp3o3Y0vna0KjXSO4q2nirRoeNgqdLGtYo7DYExUc82QQKU85Y1SMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6ea7c9226bbso59234997b3.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Nov 2024 10:32:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731436337; x=1732041137;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p+LtWMlKtrvHRuheFPtpPn4vJZtLZRHsrulQ2EIemwo=;
        b=syboiISGiIiyH6fUCiPm1pvLrgaC4RDFCwD022z86BGqrnSnrrsL/WCFy2MtKtZmms
         94u9/JgZlVwjjkO2/20pw1hpumDCQSF+4L9PnVkscqu+P4Ksyvcw8q7CKw4e1KEBftDV
         wtqMK+HpInCJnpbwCxBJjMDMsbHXtxv5aa1fvNDXN4RCSKmZqrUqXOF5qhGOstwZq6nV
         2mAeFAGMylb7gW5GF1hSpyu0a/jU8jMHGlcNc6wsrILU1wt8ZyWDoYigRfIlgXGM1j9E
         MSA2bPd3LqxMU38d95NHngEd2of8mglvrJeCc70f0gEUWKJeu45vDelnIBeTj/y5arI0
         CgjA==
X-Forwarded-Encrypted: i=1; AJvYcCUxTlT8VqnLKH8+aEfEcp0wgznGM8JZ3gqm7aGzRUysrYfQcFFRmd8eE9jyT/n7Ch2JjQ3YWs07JkaacK6R/jsvrQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/WMYEm2R+QDgyU4+dtGhr4T9nqsZSS2QeWaaT2OUy/bH6HeKu
	hGpt8UzBE/3vsEgrNJYXPY098N2dUWEBqC2I13Ul1fKnGAEFvUYuUub/wrmw
X-Google-Smtp-Source: AGHT+IEf2Dalma9M3g2dS/lIPlC0mIxM3oRppQYV0tKs3Y3EL1sdx8eMijDs+hmudWtRuKRjX8OhoA==
X-Received: by 2002:a05:690c:350d:b0:6ea:3283:58c3 with SMTP id 00721157ae682-6eca4660855mr42561647b3.11.1731436337503;
        Tue, 12 Nov 2024 10:32:17 -0800 (PST)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6eace8ef43dsm26350617b3.35.2024.11.12.10.32.17
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Nov 2024 10:32:17 -0800 (PST)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6ea7c9226bbso59234677b3.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Nov 2024 10:32:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUTnD4apYhZgteHWK9mAkjPAXwOhm8uFfxqspmRy9zSUyK8ONvbIGZXFr9b0wP+P2ZBztc7KxHKUj1w1wmRsd/cVA==@vger.kernel.org
X-Received: by 2002:a05:690c:23c4:b0:6b0:70fc:f6e4 with SMTP id
 00721157ae682-6eca4660545mr42278927b3.15.1731436336963; Tue, 12 Nov 2024
 10:32:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <67325cd5.050a0220.28e0a.76ba@mx.google.com> <CAMuHMdV2NcfaGgPYttgVMisOM1Y0ZAPjjTAumk5G6sJFC64zNg@mail.gmail.com>
 <TYYPR01MB124027CBE57B95D8715AA529DB7592@TYYPR01MB12402.jpnprd01.prod.outlook.com>
In-Reply-To: <TYYPR01MB124027CBE57B95D8715AA529DB7592@TYYPR01MB12402.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 12 Nov 2024 19:32:05 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXtCN9f8jAjsQOZpdTf6hmUncYSJX6XBrLyBGhfbrwG=g@mail.gmail.com>
Message-ID: <CAMuHMdXtCN9f8jAjsQOZpdTf6hmUncYSJX6XBrLyBGhfbrwG=g@mail.gmail.com>
Subject: Re: renesas/master baseline: 33 runs, 1 regressions (renesas-devel-2024-11-11-v6.12-rc7)
To: Chris Paterson <Chris.Paterson2@renesas.com>
Cc: "kernelci.org bot" <bot@kernelci.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"kernelci-results@groups.io" <kernelci-results@groups.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Chris,

On Tue, Nov 12, 2024 at 7:18=E2=80=AFPM Chris Paterson
<Chris.Paterson2@renesas.com> wrote:
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > On Mon, Nov 11, 2024 at 8:37=E2=80=AFPM kernelci.org bot <bot@kernelci.=
org> wrote:
> > > renesas/master baseline: 33 runs, 1 regressions (renesas-devel-2024-1=
1-
> > 11-v6.12-rc7)
> > >
> > > Regressions Summary
> > > -------------------
> > >
> > > platform   | arch  | lab         | compiler | defconfig | regressions
> > > -----------+-------+-------------+----------+-----------+------------
> > > imx8mp-evk | arm64 | lab-broonie | gcc-12   | defconfig | 1
> >
> > Was this regressions introduced in renesas-devel-2024-11-11-v6.12-rc7?
> > I doubt it, probably it's present in v6.12-rc7, too.
> >
> > >   Details:
> > https://kernelci.org/test/job/renesas/branch/master/kernel/renesas-deve=
l-
> > 2024-11-11-v6.12-rc7/plan/baseline/
> >
> > 404
> >
> > Thanks for fixing!
>
> These emails are coming out of KernelCI's "legacy" system which was moved=
 temporarily to a new domain[0], hence the broken links.
> The project is in the process of moving to a new system (Maestro)[1][2].
>
> A pull request [2] was merged today that disables these emails from the l=
egacy system.
> Sorry for the noise.
>
> [0] https://linux.kernelci.org/
> [1] https://docs.kernelci.org/maestro/
> [2] https://dashboard.kernelci.org/
> [3] https://github.com/kernelci/kernelci-jenkins/pull/142

Thanks a lot!

> Hopefully email notifications will be enabled in the new system soon.

I am looking forward to receiving correct and usable reports!

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

