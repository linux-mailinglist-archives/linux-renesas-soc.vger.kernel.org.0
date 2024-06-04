Return-Path: <linux-renesas-soc+bounces-5820-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB4C8FB1CA
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Jun 2024 14:06:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C5CED2823EA
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Jun 2024 12:06:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2361F145B0F;
	Tue,  4 Jun 2024 12:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="YrTrUOSc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF4B913C8FE;
	Tue,  4 Jun 2024 12:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717502808; cv=none; b=XL0f5Cy1wyRilMfIbIXw6Gx6KYZhhricQmgWGR1nPen/HyDaexQ+PEvZWgzR7L7i4ZR4eG8OyKLCcWg8FS4gL/rwy2N5VXGIbVOyp86RIsrq2zcmUtlvW9uOQbCQ+z70EntOZP++rPzqy7O/G4K+DTDMnclkMrTqdqHq1V0xi0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717502808; c=relaxed/simple;
	bh=hTef1Kd2x1vlByypJaJA7O2Ekfbjp5Lq97ZRfku+bII=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FsJQZErOK0i7KpztgyGpOHyZJVqvoNBiyJjMD0qaXGschSHqJ56RQM9iU6Z68tGVCgb+3OsFbHN3eiGAzt4qa6TYpxH0vV8LJKH4fyfFHv8fXGLlZMWxIwptqHWffkpQ48w61zI2YpGlYqGD9v6luIvbprjKWrj7Z7wGbQYJD/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=YrTrUOSc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91C2DC2BBFC;
	Tue,  4 Jun 2024 12:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1717502807;
	bh=hTef1Kd2x1vlByypJaJA7O2Ekfbjp5Lq97ZRfku+bII=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YrTrUOScv3Jx/Qd+5d8wYw2YATtNevRjrWSAoXH7rbuT3w2ZkOq+SGGXFTsc8OL14
	 aokUfUCUxOhDFeMFhJYs86/TDaeCYiCmjyqWvpy2NRXVz6XM+uFaWJAvo6GhqOikGB
	 JUpUgeeq2ZTgKin6tPw4tUsRcYJxmog0snd19n6I=
Date: Tue, 4 Jun 2024 14:03:02 +0200
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
Message-ID: <2024060426-radiance-reappear-c77a@gregkh>
References: <20240322144355.878930-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CA+V-a8vQr2jxrW+C5VTcmEHmDgNp6S8=3KcAT1SzcKusFaP7Gw@mail.gmail.com>
 <2024052955-phrase-portion-8d1f@gregkh>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2024052955-phrase-portion-8d1f@gregkh>

On Wed, May 29, 2024 at 09:42:50AM +0200, Greg Kroah-Hartman wrote:
> On Wed, May 29, 2024 at 07:15:23AM +0100, Lad, Prabhakar wrote:
> > Hi Greg,
> > 
> > On Fri, Mar 22, 2024 at 2:45 PM Prabhakar <prabhakar.csengg@gmail.com> wrote:
> > >
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > Hi All,
> > >
> > > This patch series updates DT binding doc and scif driver to add support
> > > for the Renesas RZ/V2H(P) SoC. RZ/V2H(P) SoC supports one channel SCIF
> > > interface.
> > >
> > > v3->v4
> > > - patch 2/4 reverted back to version 2
> > > - new patch 3/5 added
> > > - Added new reg type for RZ/V2H
> > >
> > > v2->v3
> > > - Included DT validation patches
> > > - Added a new compat string for RZ/V2H(P) SoC
> > > - Added driver changes for RZ/V2H(P) SoC
> > > - Listed interrupts and interrupt-names for every SoC in if check
> > >
> > > Cheers,
> > > Prabhakar
> > >
> > > Lad Prabhakar (5):
> > >   dt-bindings: serial: renesas,scif: Move ref for serial.yaml at the end
> > >   dt-bindings: serial: renesas,scif: Validate 'interrupts' and
> > >     'interrupt-names'
> > >   dt-bindings: serial: renesas,scif: Make 'interrupt-names' property as
> > >     required
> > >   dt-bindings: serial: Add documentation for Renesas RZ/V2H(P)
> > >     (R9A09G057) SCIF support
> > >   serial: sh-sci: Add support for RZ/V2H(P) SoC
> > >
> > Gentle ping.
> 
> It is only 3 days since the merge window ended, please be patient for
> maintainers to catch up with their pending review queue.  Especially for
> non-bugfixes like these that will be included in the 6.11-rc1 release,
> there is not any rush here for anyone just yet.
> 
> For example, my todo queue currently has 1458 emails to process in it,
> this thread is somewhere in the middle.
> 
> In the meantime, please help review other pending patches for the
> subsystem to help enable your patches to move toward the top of the
> queue.

And this patch series does not even apply, so how could it be accepted?

Please fix and resend with the proper reviews added.

greg k-h

