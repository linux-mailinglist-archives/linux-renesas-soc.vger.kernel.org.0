Return-Path: <linux-renesas-soc+bounces-12774-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D360FA23B20
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 31 Jan 2025 10:13:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 601BD188797B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 31 Jan 2025 09:13:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B6CB1684AC;
	Fri, 31 Jan 2025 09:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="SwcMhS4P"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1403913A3ED;
	Fri, 31 Jan 2025 09:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738314816; cv=none; b=VI5+guax5AxuP6rf8bRhHbTu6Ddspk5zxPabBB5R/APU/q2tgzThTr5Y4Eb/TimnnO/jcQ4P/4tdO2F4I8OolhM1TkM2qvCP1Q4RPX/iRtpVGZlcc54vRYcbN610KvknS1Q29o1ikKGFmjNa2b50HH+BbVlHAkym0mRhATk4FGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738314816; c=relaxed/simple;
	bh=yQ2A2NUuo8OMQ8PvY1ofFoghCOGv6PtwtuqqXelW+ao=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QEw9df68tHHzC8M5rEvFIrD9uabMKdGl6EZbZfYRw4IE5rZatsOgK2PdV7bI5pLkKzmKdvM12XYPuNEkVdmxy4nvOkK7nKhuc7Qmktd7NVMDe5Ul99DgjkRxRESvjvA74i23DudtXrEirZH7CeFqs86f1YjNd611bl7nwCD3yMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=SwcMhS4P; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1738314812;
	bh=yQ2A2NUuo8OMQ8PvY1ofFoghCOGv6PtwtuqqXelW+ao=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=SwcMhS4PxhMUVqN7taWYTWjz2VlzIaCKe6Xke2Px+l30/+NxTnruiKSJyfzp52/cb
	 A5DN48YlTMlvIPwgR14Gi47r+YZ2Ni32XuQLhPFy3tta2MIiGqkFexpmGZ5nhwDeJs
	 bSIROd8gf1gumS7XdgZKSEvpaR9SeKQTvFGjVUQJZ4g+JqsKWNW1fTlYIupry9y2Fb
	 hBaOPxDbWDd/cHdERKNBMz2I6VWe7GTvqb67eSVA8QPJYFFCgD1SJXkv8u56QrpSOf
	 ivjvs6rKg4mwWVvzxxXgs/GnJy3YHmxjFfCHdvIblr3XlH8LnEVDOC034canAj+PPO
	 d1f37cV/lTJ5A==
Received: from apertis-1.home (2a01cb088CCA73006086f5F072c6a07A.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:8cca:7300:6086:f5f0:72c6:a07a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C817417E05D9;
	Fri, 31 Jan 2025 10:13:31 +0100 (CET)
Message-ID: <10fa27aea77adafe32f6492c894ccb381c8f4051.camel@collabora.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: soc: renesas: Document MyIR Remi Pi
 board
From: Julien Massot <julien.massot@collabora.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Krzysztof Kozlowski
	 <krzysztof.kozlowski@linaro.org>
Date: Fri, 31 Jan 2025 10:13:31 +0100
In-Reply-To: <CAMuHMdW16Uf+khp7viesn7YtZXahCp6QuOHY4bnp2DG_KYee9Q@mail.gmail.com>
References: <20250127-myir-remi-pi-v2-0-7bd3a1c62752@collabora.com>
	 <20250127-myir-remi-pi-v2-1-7bd3a1c62752@collabora.com>
	 <CAMuHMdW16Uf+khp7viesn7YtZXahCp6QuOHY4bnp2DG_KYee9Q@mail.gmail.com>
Organization: Collabora Ltd.
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 (3.54.2-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Geert,

On Wed, 2025-01-29 at 15:11 +0100, Geert Uytterhoeven wrote:
> Hi Julien,
>=20
> On Mon, 27 Jan 2025 at 10:39, Julien Massot <julien.massot@collabora.com>=
 wrote:
> > Document the MyIR Remi Pi" which is based on the Renesas
> > RZ/G2L ("R9A07G044L2") SoC.
> >=20
> > Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Signed-off-by: Julien Massot <julien.massot@collabora.com>
>=20
> Thanks for your patch!
>=20
> > --- a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> > +++ b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> > @@ -491,6 +491,13 @@ properties:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 - renesas,r9a07g044l2 # Dual Cortex-A55 RZ/G2L
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: r=
enesas,r9a07g044
> >=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - items:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - enum:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 # MYIR Remi Pi SBC (MYB-YG2LX-REMI)
>=20
> What is the correct spelling? Your patch series has "MYIR", "MyIR", and
> "MYir".=C2=A0 The website seems to use "MYIR", except in the graphical lo=
go,
> which shows a dotted-I.
We already have "MYIR" in the 'vendor-prefix.yaml', and the corporate webpa=
ge
use "MYIR". I will make sure to use "MYIR" spelling only :)


--
Julien

