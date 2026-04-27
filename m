Return-Path: <linux-renesas-soc+bounces-31684-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8G03C0OC72nmBwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31684-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Apr 2026 17:35:31 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F263475491
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Apr 2026 17:35:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B71A03007A42
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Apr 2026 15:23:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15D4D332918;
	Mon, 27 Apr 2026 15:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Q3kG04V1";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Wf1Cqj2w"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC877332628
	for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Apr 2026 15:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777303410; cv=none; b=QLTEtFIIld3tcPG0rr4THwR9UBCGGGD8+uSsCmTblPfVnFae/YWy7PV/47uPU4TP1zzfclmAlKTVdPMm35PuCLg/ElLEF3n83efCBkDznufVm2txgcS36quO0AsWepPSsqNhoeuJNBX2zs0TenPgGZaJUCVbUeNpDQwf0k6LI2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777303410; c=relaxed/simple;
	bh=Pj+p1BuyTbovgYZ9ca5qqpgdEfYIufLbDjEWBYmS9Co=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tGMjRJ2sbO7SQEinOvdxNMJRWU+0GlQHL2qrIiiknQe3J626DBEJoMCCrgVrn/7HKCznHTuFDfVelFYeLF4JhoXzNiTLtBQWm72OFgE6H7pUY14kqUfrBZQ9ZunJLScR8Pmpk0bLEpZ9jzzvAAUesUAlPn6vhpkyDNXPU3ZSXMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Q3kG04V1; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Wf1Cqj2w; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777303407;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iqePkdwveweMr98x+nErCsbS8AfJZWIBc4BhCTHqRCI=;
	b=Q3kG04V1tjbkPMp66JlvOtqftLjHrRiN+DqnUnymiTIiPLzoM9Q/XRpEFTyP0DwQM+IY4U
	mstYClllmnTMq5Du2dUHUvnhihUapRwwu+CMuKlGT/Fz5IX72lfRgq1UeFyktCTaCB9KCq
	+OBSNlUBR+H97aT5kskPUZ26+C1KBVg=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-623-_b1BDHZSOGmF4iSeDZ9aJA-1; Mon, 27 Apr 2026 11:23:25 -0400
X-MC-Unique: _b1BDHZSOGmF4iSeDZ9aJA-1
X-Mimecast-MFC-AGG-ID: _b1BDHZSOGmF4iSeDZ9aJA_1777303404
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d5d1c2289so221108241cf.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Apr 2026 08:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1777303404; x=1777908204; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iqePkdwveweMr98x+nErCsbS8AfJZWIBc4BhCTHqRCI=;
        b=Wf1Cqj2w/Lh3tD+brorCKgQVKB7T/dK8m7IGgtQivE8Om0kyQhziGks99HwtqBLrTJ
         yqkLAzKAxMSr8ygWmXxdskUFrYTT3vMs2wD0EBrAGjWCF9RqG4bzpQgN1pmMuUdd8yK/
         o5FYPKaOhIeiQzKX+xWDdJSU6N8kPfNb8igliUpmBn/H056OsVMPabY2WpwXng7FyuEJ
         9RUBVEZ1mnmkf3VHM+oC7umWKaiuKqSCkAninzN5Nsw0Rz1XAWu7AIws7sb1WWtFueR0
         2djDV8MYB1BX18PymM238nIivA/jeGAk2/LYR3I2f16UgA/t6lCFOqRfSZeVe0i9ZpxE
         WoRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777303404; x=1777908204;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iqePkdwveweMr98x+nErCsbS8AfJZWIBc4BhCTHqRCI=;
        b=DXuQMGDnLYqi+XqEDMXV4tTOrRSc8VvgFrBCgNNiAyHy+oqD2aXH6O9FefDVLJbK5H
         LCjO2b1VYLwWc+pW9cX2hPchjEerbOMvHtbQG0JBG5kV71OtsqlOmPMhQGqXarfU2iEJ
         1U7ymLvuw6q3JmZOoSk8PlmFmlcdJP7tLaUpqfOSClolD8bJZOGumr3OTi1AtAeOnjNA
         7NhqR5TwoUFC3YBjKF+xpFQLWpo1KH4vPFPz5rCAE3TBF9QOIfYHiq11iV32uPO/WyNW
         9fcqnQLbAsdxMYEzpTp0lKKi+kQTBtPs5epnHMkWiAIob5C/7y8zWjjYxJMEK59zaZYq
         JUHA==
X-Forwarded-Encrypted: i=1; AFNElJ9Zdf0SmW+dpTScnhoRlDJC/w8I1OLAe/41Rx/7lMTJGTS1z6KAT7SuvjlWj0ozWj4Bng3oXhHVQ3tYKDhb9PfkNg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxQd6UvcgOJxMxYNVhvN/gV2mZ4hlnwNLH26wO2hwj1V6h5xGWH
	Tr6F+Go1NaYtF4kshVUc9/TsCaiNUzaI/Ku1jRIxmx/IriGzYEhKFp5B+I5ICFR0qHfpXXI7Am1
	6v6Vz8lgnsLd/NkO+O/1IMBmv6Dtc7cov9PQhm3iuFBq2at/g1AGQOoWhlwwepK+jyVhV01iL
X-Gm-Gg: AeBDiesvzqE7n2fgC9o6CLNPSJ/idXJKSI+cNP66A8gA2NHy1qDdN3JE8duVnoj/ifS
	QD2qQrV0OtH7YryH1eWdGwm+NWQEG2kqauFkjBX9ZFtwFpgGnc9s4xkuF9Bgnrw7PGcZ1NXF6Q0
	HNR4q2lgK2ZJ2yIcbCfzCoYTV85yADv1AmpMhQWL+oezeebX0LWpwjOJ4K9MnWpsawTA6Eh/rZH
	FMD5UBcGhOOzjL2jlHx08pzFmqHvRAvkXdLUZeQ2ubfIFC0YyuONQSOkywV9/R2M88iHGjVXpDv
	tlyXagwPknq4+aSq46IGK1v1sgk8sPPNsihXBpRDkropmS32T9gM2SHa/pFGnvsGs9Oq0jsKnbx
	XQ0TECatVq0LgI/G2vfFygxryH4uglIYYBEEw42EoygBATTyBYytAkXLe3emB2S8WszA=
X-Received: by 2002:a05:622a:1f97:b0:50e:2b1e:9d14 with SMTP id d75a77b69052e-50e36c11e04mr621669471cf.29.1777303404010;
        Mon, 27 Apr 2026 08:23:24 -0700 (PDT)
X-Received: by 2002:a05:622a:1f97:b0:50e:2b1e:9d14 with SMTP id d75a77b69052e-50e36c11e04mr621668781cf.29.1777303403489;
        Mon, 27 Apr 2026 08:23:23 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50e39449e36sm338531351cf.21.2026.04.27.08.23.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 08:23:22 -0700 (PDT)
Date: Mon, 27 Apr 2026 11:23:21 -0400
From: Brian Masney <bmasney@redhat.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v4 1/2] clk: divider: Add KUnit tests for
 clk_divider_bestdiv() ULONG_MAX handling
Message-ID: <ae9_afsqmGDcczhW@redhat.com>
References: <20260427112824.231150-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260427112824.231150-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427112824.231150-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
User-Agent: Mutt/2.3.1 (2026-03-20)
X-Rspamd-Queue-Id: 4F263475491
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-31684-lists,linux-renesas-soc=lfdr.de];
	DKIM_TRACE(0.00)[redhat.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bmasney@redhat.com,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,renesas.com:email]

Hi Lad,

On Mon, Apr 27, 2026 at 12:28:23PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Add KUnit tests to verify the behaviour of clk_divider_bestdiv() when
> clk_round_rate() is called with ULONG_MAX, which is the canonical way
> to probe the maximum rate a clock can produce.
> 
> Two test cases are introduced:
> 
> - clk_divider_bestdiv_ulong_max_returns_max_rate: registers a 1 GHz
>   fixed-rate parent driving a table-based divider whose smallest entry
>   is div=2 (entries: 2, 4, 8). Calls clk_hw_round_rate(div_hw, ULONG_MAX)
>   and checks the result.
> 
> - clk_divider_bestdiv_mux_ulong_max_returns_max_rate: places a two-input
>   mux (4 GHz and 2 GHz fixed-rate parents, CLK_SET_RATE_PARENT) ahead of
>   the same table-based divider to verify correct parent selection under
>   ULONG_MAX.
> 
> Both tests use an explicit clk_div_table with a minimum divider of 2 so
> that the pre-loop maxdiv clamping in clk_divider_bestdiv():
> 
>     maxdiv = min(ULONG_MAX / rate, maxdiv);
> 
> clamps maxdiv to 1, causing _next_div() to return 2 on the first
> iteration and skip the loop body entirely. This makes bestdiv fall back
> to the maximum divider, returning the minimum rate rather than the
> maximum.
> 
> The expected values intentionally reflect the buggy output:
>   - test 1: PARENT_RATE_1GHZ / 8  (minimum rate, not maximum)
>   - test 2: 0                      (invalid, loop never populated bestdiv)
> 
> These will be corrected to PARENT_RATE_1GHZ / 2 and PARENT_RATE_4GHZ / 2
> respectively once the fix to clk_divider_bestdiv() is applied.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

[snip]

> +	KUNIT_ASSERT_EQ(test, 0,
> +			kunit_add_action_or_reset(test,
> +						  (kunit_action_t *)clk_hw_unregister_fixed_rate,
> +						  parent_hw));

You can use KUNIT_DEFINE_ACTION_WRAPPER() to avoid that cast. There's
some examples in drivers/clk/clk_kunit_helpers.c.

With that fixed:

Reviewed-by: Brian Masney <bmasney@redhat.com>


