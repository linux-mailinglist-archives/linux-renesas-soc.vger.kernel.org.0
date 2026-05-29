Return-Path: <linux-renesas-soc+bounces-33341-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QCINHe19GWp9xAgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33341-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 May 2026 13:52:13 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C3491601E30
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 May 2026 13:52:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 056AA3073941
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 May 2026 11:45:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43F3335DA69;
	Fri, 29 May 2026 11:45:43 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1F133CE096
	for <linux-renesas-soc@vger.kernel.org>; Fri, 29 May 2026 11:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780055143; cv=none; b=BAFqtbl8Z0XcrKGMy2egdNFc9Drg6oTbKyM017n1hDq4dJEoJ6cxD1VoEBizyjuOr3FenTBE5ApI/rU9lwerQRLTlfBEui4V3qRLSinbPE1WHjk+gkElv88rbH0YkV9w39+9q9GXswPTR4ZETaMJwcG3LCsBsAcdfPxWGzcVPuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780055143; c=relaxed/simple;
	bh=uQ4PvHJVfbTOZrFWm2Q/Py0yYq70+Va6RDcoUzVbHXk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sRk4q9e9R+NV3TUzyulpqOQ93/X+Q2yQ3wMMYqLi2yPNF8iktWwA0sXyvau+FD7VvgxCwbIX3Z1ijHsCOiwy5obZ3C/kWloB9qZkxEnCDwIN7cMoOZTvZgnmfyCcg5sY833FU++SKeeNSyB4/6VMY3lgCmWa+IR2k0HKFBbdEdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5751e12c524so4764290e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 29 May 2026 04:45:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780055141; x=1780659941;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tI1s7RBWZ86LPvUzgArfAozo8RX0QfMdUCXZm64P2Is=;
        b=PMY8JVkWreclJeBbKvaHeBvDWbtpeiwY1bAofDmRb4t/PmoCvoCoRoDFoaBSZhGQcI
         tZ+CqXNlIco/gJ3kUpIXYbTPfdQ150qsjKKwylar/N+95LxwuL7yrjZDPwyvQOYK6v/Q
         3PFOtqFK3QuxuA+3vLDFJmlhTSCGEzQtPTVi23JsUj4yzWArnikb2gYxgT0Y/N4lurJA
         QGXsIbH65SoSfWQecawqhQbckCpFCRCfbM0jKsovxl2SjnJNml+UWb3ZVldMdYKpJFiL
         w7H5V5lJAAF+dS7fJxaAwu1dYwMX5zLmi+HDMeS1KT4KM+c6lgTp9NcXQRI0ylivn6z6
         7wBw==
X-Forwarded-Encrypted: i=1; AFNElJ/465aYgyhcAqaYE0XIYj7dDNXfNDc5XIfZG2aTDATiNF78VVVIFk74k9Kd9KhKHki80ITkw7owzDtjSeuwtTdJEg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyjprzuN2BgclV+48n6dAxFgwJKCg1YxAfnRQbtuIFUqez4FPeo
	xmKCfHKDSJFi62mle3h0Elg6PYtzcAARg/jRH8ti4QTLsFqdAUdjd4zjIMaY2ShrvKI=
X-Gm-Gg: Acq92OHx/OwGBIMqtlnMlb1B2EVR4TYm04RayXWnlPQB2xiIlfWbNr/0Q084zsrJOBH
	WOfGcLlWWnm7Ax1kL/CSQ47H/vmTPGXPTwh2BiSncqJ0Ghg6GQFwr1V0xVAVgFyEw9xy3X3gE+X
	1DkBUVskeilV+qg1MMBvTyG4E3cWCpsxFXpVcyXjHiBing+ScPg5mA7pa9msTB34Zk/dR8BSOLA
	tsngcliJ57AtJVT39pUTHZ8EkIsOu5hu1XyGVaR5n+N+DvjoaSSBF0gYForkfXgu5nM0hFtzJaF
	Ob/oLPFU0B4HsdpflEmlLuSU8SnyhsqT3oLfRHuZMR8y3sVM0E4muQmGflmMe/9pMnfTQR0sTnM
	6R2Nf+lbEp+hJOFRISBweynKtH1xqNG/FbxdYEmt67JYQEv0zU1H5+cWbV/kfaFWMgfQmgeHSs8
	BKDl+ws5QhFhKbXPatTepyBAUr7EeRwzV4zVtvyePuZY4/lPT+NSHg0i5cWhen80AqBIcwS+w=
X-Received: by 2002:a05:6122:4d8c:b0:575:38d3:7c8a with SMTP id 71dfb90a1353d-599f5c17ad5mr742318e0c.2.1780055140743;
        Fri, 29 May 2026 04:45:40 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-599d3c9649asm962410e0c.1.2026.05.29.04.45.39
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 04:45:39 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-63319183a49so5275925137.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 29 May 2026 04:45:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+cwlr86HYRt+FK/PhrXfjW68nPPrYchhGwuccNzJrMLvBLwyOOHCdcCvZ85UhXjGAB/iV9oEAl4xo0Mf16KM999g==@vger.kernel.org
X-Received: by 2002:a05:6102:1591:b0:650:aa33:5dd7 with SMTP id
 ada2fe7eead31-6bf2d2f8f9amr796853137.2.1780055139478; Fri, 29 May 2026
 04:45:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1775636898.git.tommaso.merciai.xr@bp.renesas.com>
 <1ba6a98ace4ad9525d054cbaa308d3aeeecfa22a.1775636898.git.tommaso.merciai.xr@bp.renesas.com>
 <20260408113217.GD1928916@killaraus.ideasonboard.com>
In-Reply-To: <20260408113217.GD1928916@killaraus.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 29 May 2026 13:45:27 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXZqJw=T7voOnJjsh-Y1e79Mr9wK6zoGxwojzidDxMycw@mail.gmail.com>
X-Gm-Features: AVHnY4KloFUS2B9LQzF4TBeNYZgidRaM7YLq9hAhtI_KcqQjkDOZSbYAGjwtGrU
Message-ID: <CAMuHMdXZqJw=T7voOnJjsh-Y1e79Mr9wK6zoGxwojzidDxMycw@mail.gmail.com>
Subject: Re: [PATCH v6 18/21] arm64: dts: renesas: r9a09g047: Add fcpvd{0,1} nodes
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, tomm.merciai@gmail.com, 
	linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[bp.renesas.com,gmail.com,vger.kernel.org,linux.intel.com,kernel.org,suse.de,ffwll.ch,glider.be,baylibre.com,ideasonboard.com,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33341-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.996];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: C3491601E30
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 8 Apr 2026 at 13:32, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Wed, Apr 08, 2026 at 12:37:03PM +0200, Tommaso Merciai wrote:
> > Add fcpvd{0,1} nodes to RZ/G3E SoC DTSI.
> >
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Thanks, will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

