Return-Path: <linux-renesas-soc+bounces-28541-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yAUINJSuoWk3vgQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28541-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 15:47:48 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 274E01B933F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 15:47:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3B44C3014135
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 14:46:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A487428490;
	Fri, 27 Feb 2026 14:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VP0bcD2y";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="DFaH2Chq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A235428485
	for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Feb 2026 14:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772203604; cv=none; b=buuQia8H/fxtxrvUALCAvPOmozRwfm3GjUOyOfPcCqn+n9AmTieL6lJ9R/nh3DEe1sBq7oiifpBcf4eX6YLx3ZLVTJ9tj/1Bm5EAGuViYvBF3MW9/9VS61ZqqnR1BuIvCs8JPCPCRVmV+n0jgllbjFm8Rc+JMsrcI7L3FtYNx4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772203604; c=relaxed/simple;
	bh=S0elBaqzdSTOcHC3fi2owYM/NUXzMqJZoXqPjanC/0c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qe0HS6RC+nKzYEgdITbgLdiw04Rz4STrN1VjrXhyuW6V1yWGkD0PF3ZUm3w3BDYfvBRmQS6s4DOaxBF2UiPBwgIJFmciqkYTce9sZLBUjvqsUPv1ZqParmmKydlF516mlEwmlZmNVLGWaOoGoq5nBLAf1GAE1FkUK1k+3DrwAag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VP0bcD2y; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=DFaH2Chq; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772203602;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=INxHBhm1Qtgs5FsmxXRA+ozCcO035JVGQgBykqYXu7U=;
	b=VP0bcD2yZIJplL7lKSL3oHugv5PNjtS1jRkbbx9Jmab+r+EZXJCNlTbbkc0GKHuVYxiNlx
	kpQS/EezNPiYwK5jD6X+hxdBwVOUwnKEZNeMmBver5EGkPil6FZvI9Oyphczg0GB8wIVyz
	J/zD9X0GbpFhhNu0sZ/6/KJCSYFbAfs=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-627-I3qThZTiMkaKjbylMtOOGg-1; Fri, 27 Feb 2026 09:46:41 -0500
X-MC-Unique: I3qThZTiMkaKjbylMtOOGg-1
X-Mimecast-MFC-AGG-ID: I3qThZTiMkaKjbylMtOOGg_1772203600
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-503915b0a88so376207661cf.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Feb 2026 06:46:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1772203600; x=1772808400; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=INxHBhm1Qtgs5FsmxXRA+ozCcO035JVGQgBykqYXu7U=;
        b=DFaH2ChqygdE24mVwao6r892DL41wmXkAGqq1ceRB7NRPs7qTVcrDDGPBm0Ys2G66c
         n+A4TJCrrPdDU+Sq2Zn8+gz64BmvIzCdVChshOgqhwYV/i4mwSikHQ7Pc60nyWzT43gu
         BN2+gZABycg47kPEh8z6mlybA+AA1/klX/nW6m2DnAKdivLEeMI9z8D+BXmkRzN0gCHv
         IUhv89hgJPGxbtXFhx5lmxakfLE8Mfu4LNN7o7lB55h18eASf74BInvYTzqAjkmvt9NF
         hB3mkLwVmbIuXphxk2/KG3NwogRVkO8t3iTs5Hjj2ggjVw2v/XYIvFYriGH9Ppb4hEqD
         pxpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772203600; x=1772808400;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=INxHBhm1Qtgs5FsmxXRA+ozCcO035JVGQgBykqYXu7U=;
        b=aM8sxG/VekURIl56mNr1Vjgb/fzy7/Pt51VTGXulMd9pN+mdkBdx4ZPt4jLcnPtJ0J
         otM5ZUvEj/4QX6N/9Kj7DoQZ97xQlbadQucR9/Cta/jQxqvDayio+9QNqzOptUq+GWIb
         ZXanp/OWIzXEJKVGW96PX/RkGlCBOeabjL9yEjUaHlkGf0P4aU6LaADBzENr8kdaSHHT
         X8h3ys9PuSXurPNQZkbdxbviZZjXpz4jaeUyo8lx/gKRQ6HACTtAsVhrtbUJhSk91aBP
         R0T9L8QTp9pdf+bdMpgYHYtr4yRjmLy4XYUF1q6uSQ5uRQRfk4Ci9tuRehXYr+meHd1C
         htRg==
X-Forwarded-Encrypted: i=1; AJvYcCXbF7x7gCTVKw6ew9vpjmuqqFDMQ6FToLXMymqmtUdBtrEaVi5YiaGAw0+apDI4Jp+inm1ll9bVUsX2Xw7DLlawrw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxzCtdOXH5/9tXvBeNEiplEoB+4f5KfIOeCEggnnJEyFcLKXoAQ
	U3g9m3GN4Ni91O2BHiRqRC1ymN4UuQ+AJ8tT0liYzYLxPvdmdrOO8IR22Lgl93hW5Yn72Nz9lvw
	5NpGa+muUcZvmr+fWiCYWO/zhlE63uo9j31hik/p+8Gs640AX7aYb+rHGJGISWTx4b6px6qtd
X-Gm-Gg: ATEYQzxmcfGFEJBcRgdLSuDhHZMD+hJpQknfNqwpXR5ZcQxvFB043dY78b0CzXSnDFJ
	F4QsN65JeYff54NGEvMuPX0yuloL5SqTNvongSuh26LNGWZZs8rItrmYFTh3G+FxozFrQ9nGypr
	jRSi3nMYO69eGgRQOzL+cGtXgQu4e9W84hNqAL/kmCAe5lXSWavEJwAb2aXPXewLhiHwfKQQQeS
	Ltdx5fqiLOgwg7Rudj/GSyQwN1FzrFkYsCmYvs14YrMo5LxmUGIfJcnr5HzPU9Fqbt5VIVuBlet
	7hRuoOxeXu852u5+1ubk00EuOp36puixvmMv7OzCvs4SDtI5c860ZB4mh7cAWLssewTwInPzf75
	jE/YiOqkplJNLYqEBdJsxzW0xqqwbZpuAfArsRGYJcw2GunXGXAOmi7nP
X-Received: by 2002:a05:620a:d82:b0:8b2:d256:d064 with SMTP id af79cd13be357-8cbc8df094emr374422485a.41.1772203600514;
        Fri, 27 Feb 2026 06:46:40 -0800 (PST)
X-Received: by 2002:a05:620a:d82:b0:8b2:d256:d064 with SMTP id af79cd13be357-8cbc8df094emr374418785a.41.1772203600084;
        Fri, 27 Feb 2026 06:46:40 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cbbf73451csm490604385a.47.2026.02.27.06.46.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 06:46:39 -0800 (PST)
Date: Fri, 27 Feb 2026 09:46:38 -0500
From: Brian Masney <bmasney@redhat.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH 11/13] clk: renesas: rzg2l-cpg: drop determine_rate op
 and use CLK_ROUNDING_FW_MANAGED flag
Message-ID: <aaGuTq0PQU16XGP0@redhat.com>
References: <20260226-clk-det-rate-fw-managed-v1-0-4421dd2f6dc6@redhat.com>
 <20260226-clk-det-rate-fw-managed-v1-11-4421dd2f6dc6@redhat.com>
 <CAMuHMdWPiy2OYEntYNEMjkxYPrQBED2segMfND+4VtzdeQE6+g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWPiy2OYEntYNEMjkxYPrQBED2segMfND+4VtzdeQE6+g@mail.gmail.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28541-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bmasney@redhat.com,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,init.name:url]
X-Rspamd-Queue-Id: 274E01B933F
X-Rspamd-Action: no action

On Fri, Feb 27, 2026 at 09:20:09AM +0100, Geert Uytterhoeven wrote:
> On Thu, 26 Feb 2026 at 19:18, Brian Masney <bmasney@redhat.com> wrote:
> > This clk driver has a noop determine_rate clk op. Drop this empty
> > function, and enable the CLK_ROUNDING_FW_MANAGED flag.
> >
> > Signed-off-by: Brian Masney <bmasney@redhat.com>
> 
> Thanks for your patch!
> 
> > --- a/drivers/clk/renesas/rzg2l-cpg.c
> > +++ b/drivers/clk/renesas/rzg2l-cpg.c
> > @@ -938,12 +938,6 @@ static unsigned long rzg2l_cpg_sipll5_recalc_rate(struct clk_hw *hw,
> >         return pll5_rate;
> >  }
> >
> > -static int rzg2l_cpg_sipll5_determine_rate(struct clk_hw *hw,
> > -                                          struct clk_rate_request *req)
> > -{
> > -       return 0;
> > -}
> > -
> >  static int rzg2l_cpg_sipll5_set_rate(struct clk_hw *hw,
> >                                      unsigned long rate,
> >                                      unsigned long parent_rate)
> > @@ -1015,7 +1009,6 @@ static int rzg2l_cpg_sipll5_set_rate(struct clk_hw *hw,
> >
> >  static const struct clk_ops rzg2l_cpg_sipll5_ops = {
> >         .recalc_rate = rzg2l_cpg_sipll5_recalc_rate,
> > -       .determine_rate = rzg2l_cpg_sipll5_determine_rate,
> >         .set_rate = rzg2l_cpg_sipll5_set_rate,
> >  };
> >
> > @@ -1041,7 +1034,7 @@ rzg2l_cpg_sipll5_register(const struct cpg_core_clk *core,
> >         init.name = core->name;
> >         parent_name = __clk_get_name(parent);
> >         init.ops = &rzg2l_cpg_sipll5_ops;
> > -       init.flags = 0;
> > +       init.flags = CLK_ROUNDING_FW_MANAGED;
> 
> Iff this is the Right Thing To Do (TM), it needs a comment, as this
> clock is not managed by firmware.

It needs a better name for the flag. I'll reply on patch 1 where more
people are CCed to see if we can come up with a better idea.

Brian


