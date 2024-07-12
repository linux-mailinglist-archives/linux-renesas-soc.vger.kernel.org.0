Return-Path: <linux-renesas-soc+bounces-7317-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C3B92FEDA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jul 2024 18:58:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A827828634E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jul 2024 16:58:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46F43174EC9;
	Fri, 12 Jul 2024 16:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="r+ZnJm1f"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2945157E6B
	for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jul 2024 16:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720803507; cv=none; b=dsCpiRc+IdtO3UlV0zFgUTK75nHdPA5xf7/V6608eE0n5Y2H9lijYDTGpdhkSe+6WmOJXXIUfRBrlH23r6L2MFFtRCjQJQ3XLKBrljjT6C82gchSAyFAp9qy/CHkN4Ib1RKtTq5nTdl9c/hocqE3SFMmZ/sUNOFiaRh4NISjWuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720803507; c=relaxed/simple;
	bh=OdkzIAn0TNvSAZpIEBdpbXuKzLB869bCYiVzCDyL+KQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IELpxyc8QewmqZ/OlJfspaDPszHKJrx0UEM02ji+HV29LjNT+0pTme7GSia/SlUsNmvUWfmuOkNzgaWlynnrDITq5GT/JByGgyd53MNHsV4ROLXEycZ99rg8/p/fNLrWcM94UYbWQ2281rR6b2yuh/6UCfshCXIiioMOyv4AViA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=r+ZnJm1f; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-703d5b29e06so1069560a34.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jul 2024 09:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1720803505; x=1721408305; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OdkzIAn0TNvSAZpIEBdpbXuKzLB869bCYiVzCDyL+KQ=;
        b=r+ZnJm1fRoF9xMkIHjqSfMyzMQ+xp+HIqIZu81TLeDM96GtUHrTE5KPlHH0ir17b3h
         o5MDUCO4P6Pnt5D2y78Q7icI2xEs1F2uXhEQJMAhupmLCRDyrv+GMFNywKUE0SBc9fp5
         6E5pUO55vwFGutqkxyZhcfYzG11SKF4vxCNvM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720803505; x=1721408305;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OdkzIAn0TNvSAZpIEBdpbXuKzLB869bCYiVzCDyL+KQ=;
        b=Cbk3OZzj7c41KMvV1hMj1DeZeCAjAg/1wLJ4uPo2QaJs28TI4YxKeCi635PTu3uLUA
         Pj8DAfVb13HlvUP17Wd5NijGNkgHzIoSXOVI1sq2wTpMdfGyBCymRI3LH1X7iMwL4KCW
         FLIIDB2Dzp89B1E0GvGdpANc8sX9NBtj4B+mkWrtaTVIbLAFvbNYDOk8vFPOO8teCAaY
         WEBQnkiEfJLrB32tFnrGvae3+NK1/WZV+TljrZNHtlToAEpeWB6VdiO3GDMiZ+G7dRD1
         Q4VVqVbZcwzG/n/nMrx4zkML9g3m2ofAx1wCa6ii+Kj6vALXqac7rkIKc5LU7ToDY2vV
         Rknw==
X-Forwarded-Encrypted: i=1; AJvYcCWHvGJMmGK164nUAQba2kgWeG29f6Q3tUgnMIn+Fg8Tkr9U2i2i4tFyoUb+8zHUCyreS70LQOvl3fovs9jEQCTT3OiWqcGio8cV4/PLl0gOkKs=
X-Gm-Message-State: AOJu0YxKU0OJlQNLQX2NbYFJtAEa6dRJPOZ00xQPA9YUaLByGUlxg9k0
	SidchTa+Ccr8hGbTBrxDYUgik3I+MWdjp1WrGbyq9aIHlDW0W/AieLqexxy/92I=
X-Google-Smtp-Source: AGHT+IFQW3HCMUw527lnTLdoW/putAmFCi4acafsol418xFiYj055jUt5Tsxlhtg1lR4WJMV317aUg==
X-Received: by 2002:a05:6830:3b8e:b0:708:b100:3a35 with SMTP id 46e09a7af769-708b10f7cc2mr5770676a34.21.1720803504232;
        Fri, 12 Jul 2024 09:58:24 -0700 (PDT)
Received: from bill-the-cat (fixed-189-203-103-45.totalplay.net. [189.203.103.45])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-70374f6b4acsm1622437a34.9.2024.07.12.09.58.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jul 2024 09:58:23 -0700 (PDT)
Date: Fri, 12 Jul 2024 10:58:21 -0600
From: Tom Rini <trini@konsulko.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Marek Vasut <marex@denx.de>, u-boot@lists.denx.de,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH uboot] dt-bindings: clock: rcar-gen2: Remove obsolete
 header files
Message-ID: <20240712165821.GA38804@bill-the-cat>
References: <6355fbaa5e3c40d6790cb5aa6ffc1c573c1f08ed.1720790104.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="20NhckF+NpALL0uk"
Content-Disposition: inline
In-Reply-To: <6355fbaa5e3c40d6790cb5aa6ffc1c573c1f08ed.1720790104.git.geert+renesas@glider.be>
X-Clacks-Overhead: GNU Terry Pratchett


--20NhckF+NpALL0uk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 12, 2024 at 03:17:38PM +0200, Geert Uytterhoeven wrote:
> The clock definitions in <dt-bindings/clock/r8a779?-clock.h> were
> superseded by those in <dt-bindings/clock/r8a779?-cpg-mssr.h> a long
> time ago.
>=20
> In fact U-Boot never used <dt-bindings/clock/r8a779?-clock.h>.
> The unused headers, their replacements, and the corresponding
> r8a779?.dtsi files were introduced together in U-Boot v2018.03.
>=20
> Fixes: 16b6e4aa3732cee1 ("ARM: dts: rmobile: Import R8A7790 DTS from Linu=
x 4.15-rc8")
> Fixes: edd15fcffba31452 ("ARM: dts: rmobile: Import R8A7791 DTS from Linu=
x 4.15-rc8")
> Fixes: a3fb9ff3b33fae05 ("ARM: dts: rmobile: Import R8A7792 DTS from Linu=
x 4.15-rc8")
> Fixes: 92aa09959271d08f ("ARM: dts: rmobile: Import R8A7793 DTS from Linu=
x 4.15-rc8")
> Fixes: 9a26fc5a73fe2369 ("ARM: dts: rmobile: Import R8A7794 DTS from Linu=
x 4.15-rc8")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Cfr. https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git/commit=
/?h=3Dclk-next&id=3Dd6c5fc9add9eb7a0d5bd179ab07cbf43e32b28d8
>=20
> I assume the corresponding header files under
> dts/upstream/include/dt-bindings/clock/ will be removed automatically
> in a future "Subtree merge tag 'v6.11-dts' of devicetree-rebasing repo
> [1] into dts/upstream" commit?

Yes, it should get deleted when we move to v6.11-dts, thanks!

--=20
Tom

--20NhckF+NpALL0uk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmaRYK0ACgkQFHw5/5Y0
tyzFSgwAgat3BTLqor+fihRaVpy8QU39wVsPh77vst89kJvCTSC6kYBCKT0qaZ97
VcjJfPaiEqGZqZOnB23+ulhScOZjcLYDhARayquV07DmyATR8nuNZ+pyEYeh843b
0kkWYUi9GIH5vvsztyGjXRM1EnSnzyU3B7I4/llYB22XPYdSVaupBFwfBeJcawml
J7GnwiSNhpQFQOz4CCOrqf6kLKtuDpliKbO3DUj2zhx3oG8egbpOWZWUygZVm81K
co4M2oqOFrQQAAPkJVrpUN4D4LfeOnm3hxWYFORyqGS7K6k6nDJCAYF+xEfW2AZr
SpTboM6nO3ryqnaLyNFGNTGfDijD9f7/XYzh1kVzkLeDDhP57fmCTWpLIMFRo1RV
KFIIk6BcRRaVeNZpeOUoEb5fON+sfBxZ98tOsCCWg7Gp9un6gapcvON95SIBA7v2
q9VuJYNfo35/TdTZyfuLssy0vHvnBSAGAqN3G3hlLPc/uagBIW4st9gpy93tXqec
eCuKJHGW
=jcnK
-----END PGP SIGNATURE-----

--20NhckF+NpALL0uk--

