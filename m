Return-Path: <linux-renesas-soc+bounces-27039-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 49BD7D3A9B9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Jan 2026 14:01:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7AFF6300C981
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Jan 2026 13:00:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA551363C4E;
	Mon, 19 Jan 2026 13:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ER3296Lk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95B75361DC6
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Jan 2026 13:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768827648; cv=none; b=oHPAScsvQOPGU9eftPgthTUDgDTgwNKldEiOVIeP0ALRDcw/70HgzgTEBK39j+l/7zd7o2lk9VKfLKcmtI8GcBhCuvDykM2HbROrO3It/q25f2SGmJdQ30XFwXKB4hcgjtRGHagkd1RTWTXjZXkb4+AqXFD76FCSUNLtE6Bls98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768827648; c=relaxed/simple;
	bh=UmKKLGh10RPN1svLNZxmqR0nL1F2Drx46Fu4EdQWxE0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qq1Wony2iTwk40yCu2iGQtJjdnTCa0EPaeWAjFv6Bjg6vcbitcgG/2T/WHuLhZVAhPIR0VflAO2t4mcxO+RIK3F4rps/Y6TOfyEi9W7XsZYYBkgkH+Iugp5fbhVwdlClw8RUQSGEzovdVcPYPBn/kYaqV0bEAkqNmdkeiqMgONg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ER3296Lk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5473DC2BCB3
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Jan 2026 13:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768827648;
	bh=UmKKLGh10RPN1svLNZxmqR0nL1F2Drx46Fu4EdQWxE0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ER3296Lkgw70Klu/exJKetBSAMzlIu7GK5CegbTBj8yMhUjvfA9liQoG6N3JAd132
	 NAP4sFSthxsKI0+tD0diPdB5I5XZ6+vWkFEiwYGSZSQtZDwz2GrJTVKD7mCFsXNXFI
	 3Fj3qluS3lbszDkpsq824ntuR12GhyE1iddCAo4pn+SBZPrg9O8Yy47IWQNoH4tB8H
	 2VqeCfbOaiy/QVQERg/wBM8fa01g98AXLFKs5p9nIgtWqm9xO28ErxctHloHOUm9B6
	 Gqrb2objZmqM9gJNwgtTohvImLYmqryQc+LU+GZKeUMLu1TqeU/4akyvMNbQDvQAm6
	 6x9IcCpaUyY6Q==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-59b30275e69so5366029e87.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Jan 2026 05:00:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV6rdz+HVd7vK9kNoKZenMZ6phg3WUBS//MtMq+MDhiOwTkt9ueoFSlaZhcC/lvnk1HjPY0Uc2yeG5HH59eQsrH9w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwecMCfqva5hUCAdr4cZ9f74pNt8JwIv9h5OTl104CHBctU7vNr
	nHqPLIlIV7eV+uCRJcd5xCcgA7o2hitlIanH5jWa/Btsg9++V3e/KdqNNB8cGa0OSQ/wZtc9mKc
	PVjk5bRdzi7kD+5qA8ZbuNbi7RGSsKiv1l3s6V2ZSdw==
X-Received: by 2002:a05:6512:ba0:b0:598:faf0:66e7 with SMTP id
 2adb3069b0e04-59baffc59d5mr3615354e87.26.1768827646961; Mon, 19 Jan 2026
 05:00:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260119-soc-of-root-v1-0-32a0fa9a78b4@oss.qualcomm.com>
 <20260119-soc-of-root-v1-1-32a0fa9a78b4@oss.qualcomm.com> <DFSJ2AD562CP.1ZX1JO1F0Y1UU@kernel.org>
In-Reply-To: <DFSJ2AD562CP.1ZX1JO1F0Y1UU@kernel.org>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Mon, 19 Jan 2026 14:00:34 +0100
X-Gmail-Original-Message-ID: <CAMRc=McTaTGPM6fMWb3b+S0+Gq_V-Vi7DF9JxDeOEfPAavgXaQ@mail.gmail.com>
X-Gm-Features: AZwV_QhN8PNZUNgPe6qogeVHpUfMZNp33VjYbo53S4KjyCuojwPBvWZd3s1oEdA
Message-ID: <CAMRc=McTaTGPM6fMWb3b+S0+Gq_V-Vi7DF9JxDeOEfPAavgXaQ@mail.gmail.com>
Subject: Re: [PATCH 1/8] of: provide of_machine_get_compatible()
To: Danilo Krummrich <dakr@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 19, 2026 at 12:26=E2=80=AFPM Danilo Krummrich <dakr@kernel.org>=
 wrote:
>
> On Mon Jan 19, 2026 at 11:40 AM CET, Bartosz Golaszewski wrote:
> > +/**
> > + * of_machine_get_compatible - Get the compatible string of this machi=
ne
> > + * @compatible: address at which the compatible string will be stored
> > + *
> > + * Returns:
> > + * 0 on success, negative error number on failure.
> > + */
> > +int of_machine_get_compatible(const char **compatible)
>
> I think the name of this function is not ideal. 'get' usually indicates t=
hat a
> reference count will be taken, but this is not the case here.
>
> I'm also not sure about the machine prefix. If we really want this helper=
 I'd
> suggest something along the lines of e.g. of_root_read_compatible().
>

Makes sense for the "read" part but I'm not sure about the "root" bit.
We already have a whole set of "of_machine_" interfaces, like
of_machine_is_compatible().

How about of_machine_read_compatible()?

Bartosz

