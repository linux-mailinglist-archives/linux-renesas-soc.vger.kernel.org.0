Return-Path: <linux-renesas-soc+bounces-27090-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 86538D3C28A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jan 2026 09:50:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 944185E0E01
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jan 2026 08:22:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE8333C00AE;
	Tue, 20 Jan 2026 08:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E8ET/ZWa"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80A23C00A8
	for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Jan 2026 08:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768896513; cv=none; b=Mkg2tmtZ8lUafpirnl4F7j9nwFgOGFR1ds3L/T1RwwvI2eiJLfCWQIjiCHL5ReWK8tHnOLj6rSL4hezv2FIbMcSsSfDVsfmDRY5G8TLrGQoH01oqtBi6j4nHjwpFWixBHtu8SVBO2/kF25bjG4TjuQDKkEAcLmkahZzjnJPBwRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768896513; c=relaxed/simple;
	bh=NA4JTGm5EKA0DtVd/uWEi4uM8RUpAnkAGhWVoxOqPEA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PnHbhMggQpZXgwkT7PiN56tnDzZLnvmUb9h/DRnLa/2aXkdDbk8Ha9rJ5drZYpAydN3pnBpgx8uIy+IwuWeCTAwX96EPAvpqXKld8y4BFixrpYbAQ6eliPLIDmV9xGfE2D/JaidWU/3RCHJ/T3G6SXjh3meHpTxRwSXJF+z5H2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E8ET/ZWa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66181C2BCB9
	for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Jan 2026 08:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768896513;
	bh=NA4JTGm5EKA0DtVd/uWEi4uM8RUpAnkAGhWVoxOqPEA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=E8ET/ZWaSEu9/MbotIBXsUekx0xcCP2Z8bYM+aLhxaY3CuxoZ4AvAvUMfE3WM0XmS
	 Jrsh+L+YxD4EVdd5ogjiMCP6QWRXv5diYGJKeccPips8pGytxydfbrUV3WeXaQ4sF4
	 522wXmz4PHiAlSnAt4eLThw90pMZTM29EFCPcSPxLmSI2dpv8SDGTQUXWaoQ4ia4V1
	 bfXw6Z2uyju/m6KIPVMor+RDkuW5DLkO3oXZ3o8fgsXjT1AJXJ8c+lre3mU0oWKDRl
	 BxU1QnmY6QFHDZJGWfsSLGtGTZInZPe4vIXgtFElZ5VrCdi6O1zA9rtslcb3GYIiZw
	 SCf0j35ZnVmfg==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-382fe06a9c4so37925211fa.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Jan 2026 00:08:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXr7H4/EEJQB03U6l3op37nokC3/CR4uAzR+FoTdA/gPYCmPHQekYw21BswYoe1+AsBDC6yGhSIUAe825ohdCd0Jg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxgRxpSZp9rie2RorO9WYqChgUZxxAXFBHyNfx4Ya7P9YHBuONq
	93nFs8jdNelHvSs9SiWYmdQ3Beu/5JUrTwo6FHZaXsvT7nu4d55hXLgU1wjyIJvJefCQEAsa2RX
	iWWgSz3Kk9ePWXoWfMM3oK/8hILGeEIxSfOxFav0uOQ==
X-Received: by 2002:a05:6512:114a:b0:59b:7a1e:d3f with SMTP id
 2adb3069b0e04-59bafdc1eefmr4627613e87.19.1768896511812; Tue, 20 Jan 2026
 00:08:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260119-soc-of-root-v1-0-32a0fa9a78b4@oss.qualcomm.com>
 <20260119-soc-of-root-v1-8-32a0fa9a78b4@oss.qualcomm.com> <CAGb2v64uUhbEkB+iFjs5FGYR8E7=2nyNxDi646PmnygBZa6hQA@mail.gmail.com>
In-Reply-To: <CAGb2v64uUhbEkB+iFjs5FGYR8E7=2nyNxDi646PmnygBZa6hQA@mail.gmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Tue, 20 Jan 2026 09:08:19 +0100
X-Gmail-Original-Message-ID: <CAMRc=MfFU6xfy=_R3iEreiT2qcTnT4cqx3vbL=40vS-F0HHUJA@mail.gmail.com>
X-Gm-Features: AZwV_QiFAPGyibgg_I9f0WcLSHJHA7hiPV4XToJPEVHONcLHBS618t-hqReMSp4
Message-ID: <CAMRc=MfFU6xfy=_R3iEreiT2qcTnT4cqx3vbL=40vS-F0HHUJA@mail.gmail.com>
Subject: Re: [PATCH 8/8] soc: sunxi: mbus: don't access of_root directly
To: wens@kernel.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 20, 2026 at 9:05=E2=80=AFAM Chen-Yu Tsai <wens@kernel.org> wrot=
e:
>
> On Mon, Jan 19, 2026 at 6:40=E2=80=AFPM Bartosz Golaszewski
> <bartosz.golaszewski@oss.qualcomm.com> wrote:
> >
> > Don't access of_root directly as it reduces the build test coverage for
> > this driver with COMPILE_TEST=3Dy and OF=3Dn. Use existing helper funct=
ions
> > to retrieve the relevant information.
>
> I was somewhat expecting a matching change to the Kconfig to add
> COMPILE_TEST to the "depends on" line.
>
> But maybe the case is already hit with ARM=3Dy && USE_OF=3Dn ?
>

Yeah, that would be the next step but there may be more weird
dependencies hidden in here so let's do it separately after this is
addressed or we'll get stuck looking and buildbot reports.

Bart

