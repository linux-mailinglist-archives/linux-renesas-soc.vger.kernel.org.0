Return-Path: <linux-renesas-soc+bounces-8451-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 213FB96278F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Aug 2024 14:45:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C0CB91F26F9B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Aug 2024 12:45:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F303416EB53;
	Wed, 28 Aug 2024 12:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="NTeBNvOi"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04BDC1EA65;
	Wed, 28 Aug 2024 12:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724849125; cv=none; b=SPYGkVMH+/vqrTO7xwj4TYyjRm4OWKMm/ON+LRQ0DCQzq1cSVIp583VDovbkt9HHAob7AECqLKqPc/nDZnTS2nhToZesFRqyIbIUmkzX6fF1vGpKqx5w5bV2X3KsGde4c2XoqDw/tlIDF6H4Aib58eANM5dMfH13iKJtFoDgPQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724849125; c=relaxed/simple;
	bh=E++JwPBS1FVrt81yUy4cR/gwpBl+ON5KNmJxBwegUy4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UmKLg/Tv4J85HGcLM4tS5BzQskBzy5bo+TMEAjQgOlJafVRP/+vJyOiDt3B+BWCKYJ8Vjg+MXSg+0LExMg9LIdTlDZXzpXfCIW+zqplh5Oal/7Q1vDGBmjxN2n+GJeQAihuTDCupyEiCplmb8LLW46X7nxrKlGntIDpRc072tAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=NTeBNvOi; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 09BAA220;
	Wed, 28 Aug 2024 14:44:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1724849054;
	bh=E++JwPBS1FVrt81yUy4cR/gwpBl+ON5KNmJxBwegUy4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NTeBNvOikaQPb6ukMI5dxA/tgZrQgpBQK+m/6jYUIIDbXtgnFEHMyn+sPRUdVJVMj
	 AVO/Tcs0OvFjZqT0WEhDPbvEg2BTzD/COK1oK1oa4VVtF8aq3lohNs/CWxVILiw2+L
	 D0nV7wS1G5oS/9jZJtPRECKzRXVNnY1S/LnqwrKg=
Date: Wed, 28 Aug 2024 15:45:17 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: display: renesas,du: narrow interrupts
 and resets per variants
Message-ID: <20240828124517.GA23978@pendragon.ideasonboard.com>
References: <20240818173003.122025-1-krzysztof.kozlowski@linaro.org>
 <20240818174137.GC29465@pendragon.ideasonboard.com>
 <4615f52b-4e4c-4fe4-bfef-a66e196410d7@linaro.org>
 <20240818175118.GF29465@pendragon.ideasonboard.com>
 <526b6f56-7807-4bb6-9365-077b1cc490b2@linaro.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <526b6f56-7807-4bb6-9365-077b1cc490b2@linaro.org>

Hi Krzysztof,

On Sun, Aug 18, 2024 at 08:48:54PM +0200, Krzysztof Kozlowski wrote:
> On 18/08/2024 19:51, Laurent Pinchart wrote:
> > On Sun, Aug 18, 2024 at 07:44:22PM +0200, Krzysztof Kozlowski wrote:
> >> On 18/08/2024 19:41, Laurent Pinchart wrote:
> >>> On Sun, Aug 18, 2024 at 07:30:02PM +0200, Krzysztof Kozlowski wrote:
> >>>> Each variable-length property like interrupts or resets must have fixed
> >>>> constraints on number of items for given variant in binding.  The
> >>>> clauses in "if:then:" block should define both limits: upper and lower.
> >>>
> >>> I thought that, when only one of minItems or maxItems was specified, the
> >>> other automatically defaulted to the same value. I'm pretty sure I
> >>> recall Rob asking me to drop one of the two in some bindings. Has the
> >>> rule changes ? Is it documented somewhere ?
> >>
> >> New dtschema changed it and, even if previous behavior is restored, the
> >> size in if:then: always had to be constrained. You could have skipped
> >> one side of limit if it was equal to outer/top-level limit, e.g:
> >>
> >> properties:
> >>   clocks:
> >>     minItems: 1
> >>     maxItems: 2
> >>
> >>
> >> if:then:properties:
> >>   clocks:
> >>     minItems: 2
> > 
> > Where can I find a description of the behaviour of the new dtschema
> > (hopefully with some documentation) ?
> 
> No clue, but I feel there is some core concept missing. Your earlier
> statement:
> "I thought that, when only one of minItems or maxItems was specified, the"
> 
> was never logically correct for the "if:then", except for the case I
> mentioned above. That's why all schema used as examples had it explicit:
> 
> My talk from 2022, page 30:
> https://static.sched.com/hosted_files/osseu2022/bd/How%20to%20Get%20Your%20DT%20Schema%20Bindings%20Accepted%20in%20Less%20than%2010%20Iterations%20-%20Krzysztof%20Kozlowski%2C%20Linaro.pdf?_gl=1*kmzqmt*_gcl_au*MTU2MzQ1MjY0Mi4xNzIxNzE0NDc1
> all constraints defined,.
> 
> My talk from 2023, page 34:
> https://static.sched.com/hosted_files/eoss2023/a8/How%20to%20Get%20Your%20DT%20Schema%20Bindings%20Accepted%20in%20Less%20than%2010%20Iterations%20-%20Krzysztof%20Kozlowski%2C%20Linaro%20-%20ELCE%202023.pdf?_gl=1*1jgx6d3*_gcl_au*MTU2MzQ1MjY0Mi4xNzIxNzE0NDc1
> 
> Recently, I started using other example as "useful reference":
> https://elixir.bootlin.com/linux/v6.8/source/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml#L132
> 
> That's nothing. All three above reference examples I keep giving are
> already there and repeated in emails all the time.
> 
> So aren't you confusing the entire "skip one limit" for top-level
> properties? This patch is not about it all and dtschema did not change.

There must have been a misunderstanding indeed, I interpreted "New
dtschema changed it" as meaning there were now new rules. Is that
incorrect ?

If you don't mind clarifying, what is the current recommendation to
indicate that a property has a fixed number of items ? Which of the
following three options is preferred ?

properties:
  clocks:
    minItems: 2

properties:
  clocks:
    maxItems: 2

properties:
  clocks:
    minItems: 2
    maxItems: 2

-- 
Regards,

Laurent Pinchart

