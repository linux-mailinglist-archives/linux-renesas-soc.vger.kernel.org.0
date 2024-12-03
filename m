Return-Path: <linux-renesas-soc+bounces-10809-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4449E16F7
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2024 10:16:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 544A1B2FBDF
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2024 08:50:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 648B21DB52A;
	Tue,  3 Dec 2024 08:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="uDcOTWZs"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C38D38C11;
	Tue,  3 Dec 2024 08:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733215829; cv=none; b=qnLyOdjVIXQeZ1t29N3W3C4MKWXUq3A3IAxW2HY6EGIogKJeaMOHa2WxxfKzZ0EPyA6zJUi/IDJZO9i+KkBHh9S3XmUk/OugSbeUMVMrySkEO9fngE++X6CqrtovRs24bkXl2wXiw3j5SXwi7iQK5z0zBMuPKbApc02HUeQ9YW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733215829; c=relaxed/simple;
	bh=Rb+1LimEOg2KyRvb49TqiGJHO6i5lsezJr9VXtmZ3YQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M8Qk4g23tPiNzNO9L/3Rhgs+pMNMl8M0nofTSEHI+wTe8iZamgjcg1m19wb953h21P5B2AsBbcChfOtT39K2Kq9oLK8RFtO0HRw5oU7bFfeNRko+RtUtSeAlcTrl/TinCncnrIzemeQvn/STxfcmBo9MGFulg7+Bypugq4R3AsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=uDcOTWZs; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DEC408DB;
	Tue,  3 Dec 2024 09:49:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733215798;
	bh=Rb+1LimEOg2KyRvb49TqiGJHO6i5lsezJr9VXtmZ3YQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uDcOTWZsHL72Z+kjzinta4X89IEUrGtYEZxJWqRYQX3K70mrr9SGDhn7CU3Mi7tN6
	 WU4hOKrBxpPahgl/NICv7pMAaORwnERsCy6nJsjvAdXcp11MNv1bcsSzE02WV2YDse
	 zZJLnTiDh3bVOOP0OQSTfTEqLG/aG97coDylyK3E=
Date: Tue, 3 Dec 2024 10:50:13 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, LUU HOAI <hoai.luu.ub@renesas.com>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Subject: Re: [PATCH 2/9] dt-bindings: display: renesas,du: Add r8a779h0
Message-ID: <20241203085013.GH10736@pendragon.ideasonboard.com>
References: <20241203-rcar-gh-dsi-v1-0-738ae1a95d2a@ideasonboard.com>
 <20241203-rcar-gh-dsi-v1-2-738ae1a95d2a@ideasonboard.com>
 <20241203081935.GE10736@pendragon.ideasonboard.com>
 <CAMuHMdVZui9c4X0FQ3Xke4gzxa9gvs6Nsp0eh5avzr_G3wd=ig@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdVZui9c4X0FQ3Xke4gzxa9gvs6Nsp0eh5avzr_G3wd=ig@mail.gmail.com>

On Tue, Dec 03, 2024 at 09:38:44AM +0100, Geert Uytterhoeven wrote:
> Hi Laurent,
> 
> On Tue, Dec 3, 2024 at 9:19 AM Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> > On Tue, Dec 03, 2024 at 10:01:36AM +0200, Tomi Valkeinen wrote:
> > > From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> > >
> > > Extend the Renesas DU display bindings to support the r8a779h0 V4M.
> > >
> > > Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> > > ---
> > >  Documentation/devicetree/bindings/display/renesas,du.yaml | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/display/renesas,du.yaml b/Documentation/devicetree/bindings/display/renesas,du.yaml
> > > index c5b9e6812bce..d369953f16f7 100644
> > > --- a/Documentation/devicetree/bindings/display/renesas,du.yaml
> > > +++ b/Documentation/devicetree/bindings/display/renesas,du.yaml
> > > @@ -41,6 +41,7 @@ properties:
> > >        - renesas,du-r8a77995 # for R-Car D3 compatible DU
> > >        - renesas,du-r8a779a0 # for R-Car V3U compatible DU
> > >        - renesas,du-r8a779g0 # for R-Car V4H compatible DU
> > > +      - renesas,du-r8a779h0 # for R-Car V4M compatible DU
> > >
> > >    reg:
> > >      maxItems: 1
> >
> > You also need to add h0 to the g0 block in the conditional properties
> > below. With that,
> 
> Which is not sufficient, as the DU on R-Car V4M has only a single channel,
> unlike on R-Car V3U and V4H.

Ah, indeed, in that case the DT bindings also need to take that into
account :-)

-- 
Regards,

Laurent Pinchart

