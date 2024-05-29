Return-Path: <linux-renesas-soc+bounces-5580-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 515E48D2EA0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 May 2024 09:43:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DEDE41F24576
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 May 2024 07:43:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB71E168C15;
	Wed, 29 May 2024 07:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="TvNV7Dvi"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 833C0168C0F;
	Wed, 29 May 2024 07:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716968566; cv=none; b=pvsXmHCv7GTuqErpFan/J6k/aA8re9pNgPJtOMtwNqKyGJgmPW58/Y9OE7CtKWYXATifgi18r0vZfUy2R57o87QD+XwqWEZnjvqFDvf6FGwOLtIXbZQnL5mBmbBCTbOwkZTjZQ2ccHkvAbEkgc+TeP9QqCiaDpuZQ650GFlvtFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716968566; c=relaxed/simple;
	bh=SkhK1XhIZ1X7AgwyKwYJRp2ZVjO0FPB7fwwFSlEBnMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wp/kDhFwu02XcmZnucUMzpf0psi9i/vB4mt6Z0Dc9+5jiF1+u6H2YBT9Re15brjQMBeL8NeZxS1kcLwXBveSc4UoOLX6eiVqAoNfp9keSh4TOQTnjNY5ztmt+ds0WW/fsbRqXg5wGrhYKXjXybPaigFzKfUT+cim3ftAFTAo33Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=TvNV7Dvi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 840C9C2BD10;
	Wed, 29 May 2024 07:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1716968566;
	bh=SkhK1XhIZ1X7AgwyKwYJRp2ZVjO0FPB7fwwFSlEBnMQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TvNV7Dviop/wlWuzrCK+PwZE1o4r2x1OLVBKJ9nln3eQ/d5R7qRH2JbStik2aCOCC
	 fEV3XBPIO5sE17C/uVUWTTW0vdhg67ADauE0BAXnN5d4FBvEEJUxeYr9y5ZkXF/KtL
	 aksuDfviZOGPcPIrV62awx0ciOM3Iopij/zgjtko=
Date: Wed, 29 May 2024 09:42:50 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>, Jiri Slaby <jirislaby@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v4 0/5] Add SCIF support for Renesas RZ/V2H(P) SoC
Message-ID: <2024052955-phrase-portion-8d1f@gregkh>
References: <20240322144355.878930-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CA+V-a8vQr2jxrW+C5VTcmEHmDgNp6S8=3KcAT1SzcKusFaP7Gw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+V-a8vQr2jxrW+C5VTcmEHmDgNp6S8=3KcAT1SzcKusFaP7Gw@mail.gmail.com>

On Wed, May 29, 2024 at 07:15:23AM +0100, Lad, Prabhakar wrote:
> Hi Greg,
> 
> On Fri, Mar 22, 2024 at 2:45 PM Prabhakar <prabhakar.csengg@gmail.com> wrote:
> >
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Hi All,
> >
> > This patch series updates DT binding doc and scif driver to add support
> > for the Renesas RZ/V2H(P) SoC. RZ/V2H(P) SoC supports one channel SCIF
> > interface.
> >
> > v3->v4
> > - patch 2/4 reverted back to version 2
> > - new patch 3/5 added
> > - Added new reg type for RZ/V2H
> >
> > v2->v3
> > - Included DT validation patches
> > - Added a new compat string for RZ/V2H(P) SoC
> > - Added driver changes for RZ/V2H(P) SoC
> > - Listed interrupts and interrupt-names for every SoC in if check
> >
> > Cheers,
> > Prabhakar
> >
> > Lad Prabhakar (5):
> >   dt-bindings: serial: renesas,scif: Move ref for serial.yaml at the end
> >   dt-bindings: serial: renesas,scif: Validate 'interrupts' and
> >     'interrupt-names'
> >   dt-bindings: serial: renesas,scif: Make 'interrupt-names' property as
> >     required
> >   dt-bindings: serial: Add documentation for Renesas RZ/V2H(P)
> >     (R9A09G057) SCIF support
> >   serial: sh-sci: Add support for RZ/V2H(P) SoC
> >
> Gentle ping.

It is only 3 days since the merge window ended, please be patient for
maintainers to catch up with their pending review queue.  Especially for
non-bugfixes like these that will be included in the 6.11-rc1 release,
there is not any rush here for anyone just yet.

For example, my todo queue currently has 1458 emails to process in it,
this thread is somewhere in the middle.

In the meantime, please help review other pending patches for the
subsystem to help enable your patches to move toward the top of the
queue.

thanks,

greg k-h

