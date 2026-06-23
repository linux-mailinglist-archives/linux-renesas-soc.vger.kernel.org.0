Return-Path: <linux-renesas-soc+bounces-34373-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lNzJCoiWOmqEAwgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34373-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jun 2026 16:22:00 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C436B7D39
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jun 2026 16:21:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=redhat.com header.s=mimecast20190719 header.b=Grq2f3GD;
	dkim=pass header.d=redhat.com header.s=google header.b=LM33GxGO;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34373-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34373-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=redhat.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C2C153002B71
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jun 2026 14:21:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D38FD384CEE;
	Tue, 23 Jun 2026 14:21:54 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB94384CCB
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Jun 2026 14:21:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782224514; cv=none; b=CGxBpvlv3SShi37dEXUkIjWoHj5v8Q9AsT+0HDbBUOxjWNBC4RG1wjDL/BKQe5bliaAflpNQMWDYQGK/mkgn0m2lhgEaMKyXncspNA97Vp2cuPv7iME8WGDlHL6ZxhMeN5dNCjQm9uvuGnthtJVuiwHeQWzJpuvts0M3G6dkK+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782224514; c=relaxed/simple;
	bh=Jzuaawzc6osKVhnnqO/wVDysRm6Bo3W+ohKTDNqOSK4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S6KxQqjCi0u0Derxf/gA6yay/O2B3KjBOxvWLY6svOI9Yj7iIYvmhxVDcUdMdq4bCcDD9FEImfjwnZ5ikokJzoi8/vswCmnk7j8O/Xns39+R7TojiAh9ysc/0+xxGCUo+2qJJ6VOI31UWERgvcqL39aONgetSwBfjqOmtLFxkWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Grq2f3GD; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=LM33GxGO; arc=none smtp.client-ip=170.10.133.124
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782224512;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PSa5Jp/aaFaLACgJqea1P64oVFSDHzN26MoCVES3fos=;
	b=Grq2f3GDCQz2hqFGTia8OQGzRUDZJuF7tEmY4EQ1wwXzAZDMjVvPTVCh93HzsWKgU5roh8
	GfTYGv1k0or7+U3ZYus86EyLbvWMXMdWpwLM9LO0S2ljY21FZdC5kf7EnamkLr1AZKd+HR
	yG5RnN/U92Vmrz515lSWMPh3DsS2gno=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-100-736gBU2bOIyUkf7UzokrbA-1; Tue, 23 Jun 2026 10:21:51 -0400
X-MC-Unique: 736gBU2bOIyUkf7UzokrbA-1
X-Mimecast-MFC-AGG-ID: 736gBU2bOIyUkf7UzokrbA_1782224510
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9254309dfd4so333190185a.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Jun 2026 07:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1782224510; x=1782829310; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PSa5Jp/aaFaLACgJqea1P64oVFSDHzN26MoCVES3fos=;
        b=LM33GxGO1e/LwUNjdWVBX/iFgHVCyMbyK7S8184noCBfv10uWGFJgTbRqqPJzCqb+8
         BUiotv1hd8JaGAGNT0oru1Eq6aNNxi2Tl6KpmDLd+ldtTKRboQcCjX1OH+AGGB3rVaBo
         OUgMPr3jEV9ExF1FsFqGbK2y4zVbGYF8RRZNwxHw1o9MW8wNOrxiEjoTdXt6R0jA/Pgr
         GigMc4aEto/aJpxFtDK2rKChrXe8fpZk9XhU6YJWR/onMC7m6F+deuO+o4zCX1m6L9SK
         B3ezt4c9zjtJxg/pwnAHTvL/RjMn/pB5McKhaMyxO9Fnsx4Rz69fFptRuCUWx/62rWKH
         9lag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782224510; x=1782829310;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PSa5Jp/aaFaLACgJqea1P64oVFSDHzN26MoCVES3fos=;
        b=bU+FV+z2x7fkmye8CL+EHwb0Vsz6TY56WjtIT2e4PeoD0yGGaGqO8YitMpWufo/qg8
         6VzVrbaXFnx036sQLC1uzt4p0x8vyvp8ZB+9BIQkUAxz4LVsUDunp7RTw6fThj+Yq/KW
         ZWuVrikDOOz9g4vvV0YpPo8G4h66IlJc9i6nm9b+3RNlwWrl728zfFPNl/zFeDvHUWrH
         Eh+2kPSknnOsFh5/TIKs7QMqG/fFOUgLXjxa4izCfluahfyfHpRAeMLFY/k86Kw8ECty
         HXQ9VwTuwK8/NJ+wUeszqgo9RppGX6VDuFiWt6lqwISlAFh8KqgZB+q1snh/lNsPEa6S
         Xngg==
X-Forwarded-Encrypted: i=1; AFNElJ8BYPqPkHRGmdYavpitBR+TcKUND/rCQRDSFIG829rmYZ2gEHO6PB7dP6Ak/SUmBbnDPHTuqKCQ1RJz62nbNJpd9Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0/DeOP5ERw+b8vqYqJteey/wxmTKdq9zA1lx5q+gV7Beoso9x
	p3mXUGQ/Cj3/PprxjVr6V6xNhifb5E36Psj1aVToJCcOVQ7RGwAEZv08sygISqThaFdpZI2mAlY
	f/S9YgTghoyxd456y4XDVrGS49/G8bhUdYIB0gicpRlBAs8CYWU/HtkikvoamaVlJ5wsHdX9E2A
	Ov04B7
X-Gm-Gg: AfdE7cllaOUKyL2gl2KBF/Xm4Vx/45Z9kjyurSF7nshIKlYw96qyn7qTUWUuj3+JEzu
	KPlkNIiw7PtSBoud9+RtJoA06a1fCPquyvMPLN25rQUAyG3QR+8Z7IoFczWsQbzFBYGOyGNDfQY
	xSExmADurGvj86uQ2M3J7JAUHaCvkUZdmaARc/1T+G4fqN95m/xqeIMywSdxuAZSGFrx0nLTD9a
	+Y2482u5HqlWpym6ePp0w2HFKB3nRBQp0or/1wE5M5UkhHcFSVP9gI1i4pn3wGQOEvAbq6pphNV
	HIrU+5O/xG0GrVYIKReObEAWc2KXJ1yfJH9tiWiSET6W40PWhEjJ4+ocTZwxYtHBPI5T9Lrvqht
	aI4dC144/utwdhxv3voHEyEChEBru22/e5O8KTcsAGei2jQ==
X-Received: by 2002:a05:620a:40d5:b0:91e:7a20:3cc9 with SMTP id af79cd13be357-92648dbf6d2mr521070985a.52.1782224510495;
        Tue, 23 Jun 2026 07:21:50 -0700 (PDT)
X-Received: by 2002:a05:620a:40d5:b0:91e:7a20:3cc9 with SMTP id af79cd13be357-92648dbf6d2mr521065785a.52.1782224509969;
        Tue, 23 Jun 2026 07:21:49 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92600c7bd89sm286874285a.45.2026.06.23.07.21.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 07:21:48 -0700 (PDT)
Date: Tue, 23 Jun 2026 10:21:46 -0400
From: Brian Masney <bmasney@redhat.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH] MAINTAINERS: Add entries for Renesas Versaclock {3,7}
 clock drivers
Message-ID: <ajqWevofEJ3fv856@redhat.com>
References: <20250905143441.7082-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250905143441.7082-1-biju.das.jz@bp.renesas.com>
User-Agent: Mutt/2.3.2 (2026-04-26)
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34373-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,bp.renesas.com,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:geert+renesas@glider.be,m:biju.das.au@gmail.com,m:magnus.damm@gmail.com,m:biju.das.jz@bp.renesas.com,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:geert@glider.be,m:bijudasau@gmail.com,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[bmasney@redhat.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bmasney@redhat.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 20C436B7D39

Hi Geert and Biju,

On Fri, Sep 05, 2025 at 03:34:38PM +0100, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
> 
> Add entries for Renesas versaclock 3 clock driver. While at it
> add myself as maintainer for versaclock 7 clock driver as Alex's
> email address bounces.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  MAINTAINERS | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index b13848dade9e..7a7478305bf1 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -21704,10 +21704,12 @@ L:	linux-renesas-soc@vger.kernel.org
>  S:	Maintained
>  F:	drivers/phy/renesas/phy-rcar-gen3-usb*.c
>  
> -RENESAS VERSACLOCK 7 CLOCK DRIVER
> -M:	Alex Helms <alexander.helms.jy@renesas.com>
> +RENESAS VERSACLOCK 3 and VERSACLOCK 7 CLOCK DRIVER
> +M:	Biju Das <biju.das.jz@bp.renesas.com>
>  S:	Maintained
> +F:	Documentation/devicetree/bindings/clock/renesas,5p35023.yaml
>  F:	Documentation/devicetree/bindings/clock/renesas,versaclock7.yaml
> +F:	drivers/clk/clk-versaclock3.c
>  F:	drivers/clk/clk-versaclock7.c

It looks like this patch wasn't picked up last year. I got another
bounce from Alex's email address.

Geert: Can you pick up this patch?

Biju: I see that
Documentation/devicetree/bindings/clock/renesas,versaclock7.yaml also
needs to have it's maintainers updated.

Brian


