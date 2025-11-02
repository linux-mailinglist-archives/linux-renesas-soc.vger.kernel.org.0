Return-Path: <linux-renesas-soc+bounces-23991-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2737CC28E57
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 02 Nov 2025 12:42:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CE558188B391
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  2 Nov 2025 11:42:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9306E2D8DD0;
	Sun,  2 Nov 2025 11:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I4QlC+D/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60730210F59;
	Sun,  2 Nov 2025 11:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762083733; cv=none; b=Es2A7EK4EU3FhJC2CUHsIo1VxL0VepFJOyDeAoFenS621vOYK85x/6ndHZoC9vONd2ZnMWrf/uMw7NRs3EQE1iUyWzao5yD0PaRAbbsFLCKrpFalq9fNyAXfs2lwDww1YjLQVwGFHtUcqbSAGTPQJyxK+xV5yN6EXtIqY5t/iN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762083733; c=relaxed/simple;
	bh=Qhv1WcJSX0Gbo4sykFz90BCNTR/3+y4I0vbbjKSkLtg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YabJw9FLRN+GKaASU3s6WkJqkBzOZMrcauGkXNrKjaQQFwGD8aN1q9diMAR0RcXAB+bubncDgSAfDnFu9hd27dzbraTuHPI2H1HuyFDR0d+d0fEytZL6YPVg/T+bi113iim8uo/uz3af3TJmmhs6sZeve0GXDzJA7IME1RN4X8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I4QlC+D/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB6AEC4CEF7;
	Sun,  2 Nov 2025 11:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762083733;
	bh=Qhv1WcJSX0Gbo4sykFz90BCNTR/3+y4I0vbbjKSkLtg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=I4QlC+D/DJDloLzGjxK4Jb0n/9/nQwvjgzj9izK7P5mND1VdNTPJDaxo9GhZA9GNF
	 m/tCpoOk3TC0/vApvUsXzLOf2YzgmtxjBHZoskSRBy2QISs14lRgK9RxfK7po/Xl+l
	 OEoIVX13MfjaXuLCsyR8u0PXSt9LTswz4H9WqRmooQr22H8ZBBgVDIpuVeI4DKjwTP
	 blJeI+KPsphuESXnhn5qGlVPwfCxpU446P59b/jMfk0NOSlVxa53m6uAPvyGEeqCXd
	 ZJT6H2Jt5ZTXkixzJJ4fMY6oM5yRUXdGCPu9v7Uj3fmYLRccCJhmOy3Ug/Ar+jzTTv
	 vfK94GofqlylA==
Date: Sun, 2 Nov 2025 11:42:06 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>, Wolfram
 Sang <wsa+renesas@sang-engineering.com>, David Lechner
 <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy
 Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Magnus Damm
 <magnus.damm@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, linux-iio@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Pascal Eberhard <pascal.eberhard@se.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 2/4] iio: adc: Add support for the Renesas RZ/N1 ADC
Message-ID: <20251102114206.37b3bbf5@jic23-huawei>
In-Reply-To: <aQMpHDwCqcrNrnT9@smile.fi.intel.com>
References: <20251029144644.667561-1-herve.codina@bootlin.com>
	<20251029144644.667561-3-herve.codina@bootlin.com>
	<aQMpHDwCqcrNrnT9@smile.fi.intel.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 30 Oct 2025 11:00:12 +0200
Andy Shevchenko <andriy.shevchenko@intel.com> wrote:

> On Wed, Oct 29, 2025 at 03:46:42PM +0100, Herve Codina (Schneider Electric) wrote:
> > The Renesas RZ/N1 ADC controller is the ADC controller available in the
> > Renesas RZ/N1 SoCs family. It can use up to two internal ADC cores (ADC1
> > and ADC2) those internal cores are not directly accessed but are handled
> > through ADC controller virtual channels.  
> 
> Looks much better, thanks! My comments below.
FWIW I took a look as well but found the only things I noticed were a small
subset of Andy's much more thorough review ;)

Jonathan

