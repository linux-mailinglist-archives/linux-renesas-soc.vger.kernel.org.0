Return-Path: <linux-renesas-soc+bounces-7924-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D35957276
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Aug 2024 19:54:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 964AF1F22840
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Aug 2024 17:54:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7F46188CB3;
	Mon, 19 Aug 2024 17:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ndUAoIh6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A79B3D531;
	Mon, 19 Aug 2024 17:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724090032; cv=none; b=Pofs9sBvW7AWZHbS4y7Y1u/rGcZuF+hnSTHrOkzRw5BSsrR4Y31WYUy5PMoQbpkEgWEgKIBWEz2/yCFx5Nm7GTgGq5HczJKzwv+E1FsynUSDUMj5MONUUPu62DdY3C/OwJ12xtcX3ZyandeGDq3PkwrWmonYjjjQ7gRcMoo1oXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724090032; c=relaxed/simple;
	bh=gkf1uYKWHH3ryHJOsuUep++rzsJaUuqQ+op1DHzbcms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=de+nuVYDE+GqDqldR9W3+5hmSrMdfUM2nIr8Iym1hxAEjQNH0lkZOuA63P1sFcDPDZFFkCoQ7WT7O1N2S7u4W6KrGfqP06VKNMYZDBZj7nATNVb53VTmxYjY9ZTtjeyqkXqN2RFVLXoxUgOCTHEjMJ/IFc0VMxmbmptCV7wUGLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ndUAoIh6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBA6FC32782;
	Mon, 19 Aug 2024 17:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724090032;
	bh=gkf1uYKWHH3ryHJOsuUep++rzsJaUuqQ+op1DHzbcms=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ndUAoIh6qeN9kTnJDegaEJjWo2SglcwOTawmTTR5nX7iiFzeaIkLsVOQPpuppKOVS
	 Y+xkkNd9s1IotUc8HkMq0nVWERHIeoApuXkN6cMW+IsHkAKk2vkBnJiS6iGFmThVZm
	 KQYwygYVOUFnd2vr2BPEJwE/JR50zpAThFiIvW0M9/f9gfHYnPaFGRgfLIAfZCtgmL
	 /AGVTtYGo+i8zQDIMkEewSiPQP3IU+XIuCQ84hLQrwVvE0QHdRLQmFoTc+2NGqFgUW
	 WHSI07u/BmTVtrGqqUM736a0EfBONxRoZNU6dc1AXjwwMlU9tYiA32RbICpZvcmRAh
	 9L4a9/NBNBA5Q==
Date: Mon, 19 Aug 2024 11:53:50 -0600
From: Rob Herring <robh@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mmc: renesas,sdhi: add top-level constraints
Message-ID: <20240819175350.GA1700516-robh@kernel.org>
References: <20240818172923.121867-1-krzysztof.kozlowski@linaro.org>
 <CAMuHMdU3V=ZO6me5LekUQN4NC82yw5_UYNd23gZwctUa-GiJ6g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdU3V=ZO6me5LekUQN4NC82yw5_UYNd23gZwctUa-GiJ6g@mail.gmail.com>

On Mon, Aug 19, 2024 at 03:38:48PM +0200, Geert Uytterhoeven wrote:
> Hi Krzysztof,
> 
> On Sun, Aug 18, 2024 at 7:29 PM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
> > Properties with variable number of items per each device are expected to
> > have widest constraints in top-level "properties:" block and further
> > customized (narrowed) in "if:then:".  Add missing top-level constraints
> > for clocks.
> >
> > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Thanks for your patch!
> 
> > --- a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> > +++ b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> > @@ -77,9 +77,13 @@ properties:
> >      minItems: 1
> >      maxItems: 3
> >
> > -  clocks: true
> > +  clocks:
> > +    minItems: 1
> > +    maxItems: 4
> >
> > -  clock-names: true
> > +  clock-names:
> > +    minItems: 1
> > +    maxItems: 4
> >
> >    dmas:
> >      minItems: 4
> 
> I am a bit puzzled by all these add-top-level-constraint patches.
> E.g. this file already constrains all of them below.
> 
> To me, it feels the same as a patch for driver code that would do:
> 
>     +   if (param < 16 || param > 512)
>     +           return -EINVAL;
>     +
>         if (hw_variant_a) {
>                 if (param < 16 || param > 256)
>                         return -EINVAL;
>                 ...
>         } else if (hw_variant_b) {
>                 if (param < 32 || param > 512)
>                         return -EINVAL;
>                 ...
>         } else /* hw_variant_c */ {
>                 if (param < 32 || param > 384)
>                         return -EINVAL;
>                 ...
>         }
> 
> What's the point?

if/then schemas can be incomplete and we don't enforce they are missing 
constraints. We could change that, but we'd have to do that everywhere. 
It would make the schemas longer. 

If you have a new chip not yet documented, but matches the fallback 
compatible (as many Renesas bindings have), then you at least 
get constraints within the existing bounds.

The keywords didn't exist when we started out. It is somewhat academic 
because we know what the implementation supports, but it is entirely 
possible a json-schema implementation doesn't support if/then schemas. 
The spec says unknown keywords are ignored.

Rob

