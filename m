Return-Path: <linux-renesas-soc+bounces-5821-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C838FB445
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Jun 2024 15:49:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 997FEB26362
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Jun 2024 13:43:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61B1E14831D;
	Tue,  4 Jun 2024 13:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YwwA667s"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3BFB144D23;
	Tue,  4 Jun 2024 13:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717508541; cv=none; b=SRtayE3kLDlMmtoF0ZoBuUK0a+CxgJr9ZNmbQHaxG8m9iOeOFHRJ4U6BlQTFKzqAm4dQZjRjHe+jcqlbfDY0WatKBHVJnYSQYdEERdzAth3VxYJU9yIGeTLqykrGAE65q521koCA87Okd3RsTtiXaFFFTV0EYWey/EovXvNyn9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717508541; c=relaxed/simple;
	bh=JzvpitEF6afef78A6BqMKn7sGkEtB3biXCt3XCWqeog=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tTyMmsMenKeUuMHZ8R3QnyQ35KpVK7m5faYaXjwAUw78MWaEyU/V9dtm1Hbcnjz6wDn9pITWTVfFh5KnkiZVoVCOyr4Q8xj9Eaincw7WEoFybU/yLfPuw7QuybdEpf6QFNVMzRO1rv9Vw8ylkP1qXOSrsVbhYAJxi7ghlWYPGiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YwwA667s; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-4eb0f868f2aso1029548e0c.3;
        Tue, 04 Jun 2024 06:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717508539; x=1718113339; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I/wDaAVsUoMEE2XkQjQGVHqiZEip+VWTpwMBzDDOubw=;
        b=YwwA667sY8kcgKRArClihxuwUyj+kPxpXb40LQpzrhsAn3+I5K/p6hKggyjWdS8Vrz
         2BvufJEiHteSRBWyBCxu5LGQdorahH0ojz5o+OIIhInu2L4A2Md3mYd7+w9qC6EYNDRs
         zaOVcYeFodLg75svb4vPddg8oyho2CV+gAAp1uT1CnOWykuFkceGWhc0z6U2xO98sBjT
         BV3nUB9lRfMr0X1jYTDugD7V4h5Xgo8B36pAkicqgYDRw6yF/llso2dINjCoMUaHuRBD
         mvj7dhfa01EvhGOXnyIISPnO3wGVL5QUeyKLBbJW6ZfV0LmnnkMv7BNjRjPzPH46Hslr
         gVSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717508539; x=1718113339;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I/wDaAVsUoMEE2XkQjQGVHqiZEip+VWTpwMBzDDOubw=;
        b=leNLlxvDEXmpfYIzuExDcqmMdIy0k57W7t8JAfwikNTMGXBq6O0S/rggAKknGX3Oo0
         v2qbM+xHlxKKqI4VyX6gpDifAMXa0807LIehgew/xbcCCwtTvafIH5xp/3eYZBeQCuNE
         zjtMB3cEUrdKN+n6H2Ji5wLdSXS1y3CklT6fcNJvYose3K6nl7N0CvqGFSnmOP3uxaus
         7a/8vhmOuC0BX6EJ2HocZFUr/5jefgdHdxVhhCuqPxyry5qn7yRSQPmIo3Kv/s8eEs45
         RdLVg1grs6ziqQanaRN6JlDEsqTfMOZWtMjdVxbcrYP9JEQdV+BdLlhAwnQY0WmHGYsN
         IB2A==
X-Forwarded-Encrypted: i=1; AJvYcCUtpcpWyjr/jPmgu/w27PzbIKZUmIv/pLyIjox0S3Cf4jasVRMPEUxNUp8yn3zkalBb78iIzRCNJtKC7u29NeYaSl9QSChooWM1Ufz590H90aDeWBmMCnXdsXNztmybsrGD99K8q0X/hcL9MzOut3zFiyRrrBVbdfaBeImsQRcB7IWB9oZ7g7V9KFwdGvFkTW6U9gnSlh7AlpoUgcPkgcTUC0+Zs9p8gdL1
X-Gm-Message-State: AOJu0YxDfGnkGohIuBAJ+pse2YH/aCdDefq3iBVDxTFlNcD2IljiBmcI
	xCcFpGbOEKgbQByR/lnPy9dI5nhl7vK+NQNqoKO4tj9q8nt1TiFdLv8Udq/pF/Z1ZKQUevWYDrQ
	067PXmaTSnEiSTPlFEWWdFTV3X3A=
X-Google-Smtp-Source: AGHT+IHgpZyV5AZDRDVpQ9136VhNSmZNg2lCdWNHz35AYccw+Xew1tUvamXCslfWnHhTU0ar0AqXutM9VZt8VyRop7A=
X-Received: by 2002:a05:6122:4685:b0:4e9:7e39:cc9f with SMTP id
 71dfb90a1353d-4eb02eec147mr13378784e0c.11.1717508536659; Tue, 04 Jun 2024
 06:42:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240322144355.878930-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CA+V-a8vQr2jxrW+C5VTcmEHmDgNp6S8=3KcAT1SzcKusFaP7Gw@mail.gmail.com>
 <2024052955-phrase-portion-8d1f@gregkh> <2024060426-radiance-reappear-c77a@gregkh>
In-Reply-To: <2024060426-radiance-reappear-c77a@gregkh>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 4 Jun 2024 14:41:49 +0100
Message-ID: <CA+V-a8sJ2o3HckW_YdwAraihXuDtnsqguHd8msKFe12BhCCy=g@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] Add SCIF support for Renesas RZ/V2H(P) SoC
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Greg,

On Tue, Jun 4, 2024 at 1:06=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Wed, May 29, 2024 at 09:42:50AM +0200, Greg Kroah-Hartman wrote:
> > On Wed, May 29, 2024 at 07:15:23AM +0100, Lad, Prabhakar wrote:
> > > Hi Greg,
> > >
> > > On Fri, Mar 22, 2024 at 2:45=E2=80=AFPM Prabhakar <prabhakar.csengg@g=
mail.com> wrote:
> > > >
> > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > >
> > > > Hi All,
> > > >
> > > > This patch series updates DT binding doc and scif driver to add sup=
port
> > > > for the Renesas RZ/V2H(P) SoC. RZ/V2H(P) SoC supports one channel S=
CIF
> > > > interface.
> > > >
> > > > v3->v4
> > > > - patch 2/4 reverted back to version 2
> > > > - new patch 3/5 added
> > > > - Added new reg type for RZ/V2H
> > > >
> > > > v2->v3
> > > > - Included DT validation patches
> > > > - Added a new compat string for RZ/V2H(P) SoC
> > > > - Added driver changes for RZ/V2H(P) SoC
> > > > - Listed interrupts and interrupt-names for every SoC in if check
> > > >
> > > > Cheers,
> > > > Prabhakar
> > > >
> > > > Lad Prabhakar (5):
> > > >   dt-bindings: serial: renesas,scif: Move ref for serial.yaml at th=
e end
> > > >   dt-bindings: serial: renesas,scif: Validate 'interrupts' and
> > > >     'interrupt-names'
> > > >   dt-bindings: serial: renesas,scif: Make 'interrupt-names' propert=
y as
> > > >     required
> > > >   dt-bindings: serial: Add documentation for Renesas RZ/V2H(P)
> > > >     (R9A09G057) SCIF support
> > > >   serial: sh-sci: Add support for RZ/V2H(P) SoC
> > > >
> > > Gentle ping.
> >
> > It is only 3 days since the merge window ended, please be patient for
> > maintainers to catch up with their pending review queue.  Especially fo=
r
> > non-bugfixes like these that will be included in the 6.11-rc1 release,
> > there is not any rush here for anyone just yet.
> >
> > For example, my todo queue currently has 1458 emails to process in it,
> > this thread is somewhere in the middle.
> >
> > In the meantime, please help review other pending patches for the
> > subsystem to help enable your patches to move toward the top of the
> > queue.
>
> And this patch series does not even apply, so how could it be accepted?
>
Oops I'll rebase the changes now.

> Please fix and resend with the proper reviews added.
>
Sure will do.

Cheers,
Prabhakar

