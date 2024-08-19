Return-Path: <linux-renesas-soc+bounces-7895-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF7F7956913
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Aug 2024 13:11:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 31919B22B46
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Aug 2024 11:11:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 417D0165EF8;
	Mon, 19 Aug 2024 11:11:28 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70ED61662F6;
	Mon, 19 Aug 2024 11:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724065888; cv=none; b=W3x5/yhgDKIFq7ia0mlWj2kOeTMQ93hoPq1x+znLqCGjAEdbEVPe/HUzoVk/nWv71jmCBF1mLlTBdWxD/CzAzm8SsHjzhqf51RzY+xeJ3H2Loh44HJTqVMLqsHVb2D3dX/AxYP5Ymd0scrZ+HbeWrMx93HQYxZvlXPAjitcuqGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724065888; c=relaxed/simple;
	bh=zs3VYO2MmlCGIgfj8+2w6EfSp0KY1ZmiUIx8bcsVVvQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UHyQRrV6/UTrkD5V5dzTAADP9W9IAhxM2qaK5uWKgLHm19tTT+tE63pX7CEQCb8T26xQoqh4AEjSF/mAdssePqWHAtM8iiNYsSqdY0vgFzXvwAAXFK9BSSj3eIehy6HA12TB58k434bBwoI4AEk7PEiR02lBQJ884kksrZAzMoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-428ec6c190eso35105945e9.1;
        Mon, 19 Aug 2024 04:11:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724065885; x=1724670685;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NzBxPiQlNt8RrJF4Nc6evdsL7t4tnpnS9AfJ6DvQ6BQ=;
        b=D7zrCSbd7WykrWge8nUxke3NYzqk90Ymfxp5vMWP1GAD0Ayb7qrP6wMWThXzKUlkkb
         ONNYy9xOUxvW0XrCyqB2/Jjf3VHy6T7zBMQqaPD4jmW5sAh2Us93O42W96bu/M0ouuiD
         p/62fsaeYSnYwa1QszrI2jPUOG9KVK7HSBI5WGwWLDfTQlQEBNEbAL5kHourO8Fe2TQf
         NnI0yn5sOoPb9PNZLsUqmPYX2eP7cY5UbQPDTYLXrpHOj1IbSDdy2SfpGvjeCvuK4qTe
         W2R6wArQtNwatQliIijLf4NWnpHup69wFXp2ZuVAKYoecbvIWYcdYEBhb5pq8DdDC7ev
         ++jQ==
X-Forwarded-Encrypted: i=1; AJvYcCUad3IF6gvC7ajVwxsS6Uf6PCWhyAYXJxYL3duK3dtg70EQavgl/EqxQ4Zbc8gk9w8nim5dqBBWRVNvsLT8XyLtTu8=@vger.kernel.org, AJvYcCXIEhdQx6uhVGfPGA1AoKnbAyIMwIfbTyOG2yJLqh0BlPJdsZFUZFEy0mW+xwamrUJ3a/4c5/j2fkSh@vger.kernel.org, AJvYcCXmpyf3Ylo0dPkIYTJD8YUQhTAjAFiZyChZrZfR5NnFtIEbUnTPj9AKsUBTROvgDtiVlHHeO09v031PJF6w@vger.kernel.org
X-Gm-Message-State: AOJu0YyHQHM2mTURm40viNSRlaWxh3AxMC8DkXq6RdG57MYWRqFqzbdf
	+u7fDkOrIyk/m5ZNXCZusbdqy7IhC33dq9+Zbxowy6sw7+BwE1YItIRGXw==
X-Google-Smtp-Source: AGHT+IH5WvNfAY0N9OzNkjT9Ufq/0lmn4ikLV23i1mFcnYrkEfxD8WHLZWkifsd/jKS/Q+hMXiVvIg==
X-Received: by 2002:a05:600c:198b:b0:426:5ee3:728b with SMTP id 5b1f17b1804b1-42aa8241489mr44754235e9.13.1724065884192;
        Mon, 19 Aug 2024 04:11:24 -0700 (PDT)
Received: from krzk-bin ([178.197.215.209])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-42aa6736e5esm89388165e9.38.2024.08.19.04.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 04:11:23 -0700 (PDT)
Date: Mon, 19 Aug 2024 13:11:21 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/7] dt-bindings: fuse: Move renesas,rcar-{efuse,otp}
 to nvmem
Message-ID: <67hcoj3haiptjh4f7qvaz4xwcdamr3x33xxrxusuwq2t3veiln@z2ggc7razty4>
References: <cover.1721999833.git.geert+renesas@glider.be>
 <1a3d4ff8ce34a5e676d1cb1fafd40525378e29a4.1721999833.git.geert+renesas@glider.be>
 <20240730162435.GA1480758-robh@kernel.org>
 <CAMuHMdUwATmjM3E7WmwnCK739CwuyZH1w_YVYbroDcWEpzh8ig@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAMuHMdUwATmjM3E7WmwnCK739CwuyZH1w_YVYbroDcWEpzh8ig@mail.gmail.com>

On Wed, Jul 31, 2024 at 09:37:36AM +0200, Geert Uytterhoeven wrote:
> Hi Rob,
>=20
> On Tue, Jul 30, 2024 at 6:24=E2=80=AFPM Rob Herring <robh@kernel.org> wro=
te:
> > On Fri, Jul 26, 2024 at 03:38:06PM +0200, Geert Uytterhoeven wrote:
> > > The R-Car E-FUSE blocks can be modelled better using the nvmem
> > > framework.
> > >
> > > Replace the R-Car V3U example by an R-Car S4-8 ES1.2 example, to show
> > > the definition of nvmem cells.  While at it, drop unneeded labels from
> > > the examples, and fix indentation.
> > >
> > > Add an entry to the MAINTAINERS file.
> > >
> > > Reported-by: Arnd Bergmann <arnd@arndb.de>
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > ---
> > > v3:
> > >   - New.
> > >
> > > I would expect that the calib@144 node needs:
> > >
> > >     #nvmem-cell-cells =3D <0>;
> > >
> > > but after adding that, "make dt_binding_check" starts complaining:
> > >
> > >     Documentation/devicetree/bindings/nvmem/renesas,rcar-efuse.exampl=
e.dtb: fuse@e6078800: nvmem-layout: 'oneOf' conditional failed, one must be=
 fixed:
> > >           '#address-cells', '#size-cells', 'calib@144' do not match a=
ny of the regexes: 'pinctrl-[0-9]+'
> > >           Unevaluated properties are not allowed ('nvmem-cell-cells' =
was unexpected)
> >
> > Did you want 'nvmem-cell-cells' or '#nvmem-cell-cells'?
>=20
> Oops, I've been (manually) re-adding and removing it again too many
> times during my investigations. "#nvmem-cell-cells", of course.
> According to my build logs, I had it right at least once ;-)
>=20
> > >           'kontron,sl28-vpd' was expected
> > >           'onie,tlv-layout' was expected
> > >           from schema $id: http://devicetree.org/schemas/nvmem/renesa=
s,rcar-efuse.yaml#
> > >     Documentation/devicetree/bindings/nvmem/renesas,rcar-efuse.exampl=
e.dtb: fuse@e6078800: nvmem-layout: Unevaluated properties are not allowed =
('#address-cells', '#size-cells', 'calib@144' were unexpected)
> > >           from schema $id: http://devicetree.org/schemas/nvmem/renesa=
s,rcar-efuse.yaml#
> > >     Documentation/devicetree/bindings/nvmem/renesas,rcar-efuse.exampl=
e.dtb: fuse@e6078800: Unevaluated properties are not allowed ('nvmem-layout=
' was unexpected)
> > >           from schema $id: http://devicetree.org/schemas/nvmem/renesa=
s,rcar-efuse.yaml#
>=20
> Anyway, with or without the typo, the error message is about the same:
>=20
> - Unevaluated properties are not allowed ('nvmem-cell-cells' was unexpect=
ed)
> + Unevaluated properties are not allowed ('#nvmem-cell-cells' was unexpec=
ted)

And if you test your schema or DTS with all nvmem (so also layouts)
schemas?

Apparently fixed-layout schema was not applied.

Best regards,
Krzysztof

