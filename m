Return-Path: <linux-renesas-soc+bounces-28169-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qIj1H120jWl96AAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28169-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Feb 2026 12:07:09 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DE54912CDA2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Feb 2026 12:07:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7FAF53005777
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Feb 2026 11:06:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C5C328B4F0;
	Thu, 12 Feb 2026 11:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="giIlYGrZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 973223164C2
	for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Feb 2026 11:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770894405; cv=none; b=DUV4oOMaU2Ef+hlpWW841crqdH3iJxrkITFhZ06O9IHkgfMJ5KeMEQ6PbtD+pgKk023j1SOxye8Cspmrl6Ok9jGwu0vC5WqPnEXSpFtMimpnsP42D0SxFXeIRO8DYsQoNo76ZbMXnA9+A6Gms6KqVRoU9ExRxwpkZtB+n2JDXKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770894405; c=relaxed/simple;
	bh=ELesR79nEgzbYvbVtbkai+gF5L9OXkkQBqsB+SAv8Ms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JUSd4/rEhmCkN3vG2DudXVoTIkHAEzMfb6ETAvhiiXWwWIXJ/c9XvmaeBNnmR3gcpPiLiQk5+jtB4KqxQWhAPFySC004SVviIlx4FpsDg9IcA2InPHjtL/O0xYt8jS/nKWuCltIeOdXmnppI+4C9so/i/lu8yzPJ5UnZVyl6tCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=giIlYGrZ; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-59e6ab06167so33209e87.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Feb 2026 03:06:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770894402; x=1771499202; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Te28COGsJvbZjhoIswrSDU/sOtkJ6DypnGTOIiAuYoo=;
        b=giIlYGrZmqIQ0/BUbi+fZqBFHHj1pWHp63QLDtrJmSY1rPy4RiXrSnFyjPxEPBYo0V
         GDnnedaUyoJ27/LdgQKEqd/WHe3BPP8ha6/oGAKuKIyBL3CBTJprKeujXQNJ5H92rTwG
         TY5VWebdkxmUCqV+lxk8V8QCN0ad/O6oUO/V+AukH8leisQPAyRIpnw42ZEY5wow/kpA
         0gpcvZKm0wmGUKlv7lgfywi1Zfif335fpBmjowkTZa1dWPOb2XVQ7Ove22NCWvPiJ5C6
         zUPYk/vSlYeIgvRHXU+MI9lGU5NPuOFz3t9TQVobZ1ZfOlXXPrqnaJ2JEnXyjFVBLnde
         oC1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770894402; x=1771499202;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Te28COGsJvbZjhoIswrSDU/sOtkJ6DypnGTOIiAuYoo=;
        b=czC2yygXJdn9X+e3oMEX2T5ovnmVeacIGbLWvWSw+ZC7V5v3QByGKcp3XgSp3I8nLQ
         3pGOWU0Y7cONNaXmF5dvvRoF+ZGLPqQT4PepNqQ3gdSzdZnL7G3TSuMgtpe8xsTwFLIV
         gV7uukJpRsf027G9+qtRfWSlCVxaWTe8CMEQh2Gggv0fDURoHw+bXfn7mIA5LGzQlRml
         aO4htmfvQg6en7c7JGWwW0egrc9UXHiUxNe1fUC5VtGtkGU0z0+1bPaC6vcI7zOM5kmj
         ybD4dCVQWc1ttlV7C5vGmuMGTL6gssO+YPi1akD1JWSvwjJJWAZKQrv+5VOEG9iMkSwP
         N73w==
X-Forwarded-Encrypted: i=1; AJvYcCWY1VF3anmcHaSNzZoVGIoaptyHKgHkOjpe9Izh/VxQB9aO4kCISxaa+LuNcCdxQwFRpIak+kPvfZWkjrprHBJqug==@vger.kernel.org
X-Gm-Message-State: AOJu0YwIpx/jI3Kg9FWHRJSKm7+CsARu6X52fNDEpn0TlvbLl31gZmLt
	dJk7snlJr1yIueuKVt6Uz/vhtuitcaq5yKNag0hHX3yx70c9u6od02wse8RKjg==
X-Gm-Gg: AZuq6aKFKK9V2rq1Mk5D25JYnwRJzYlGzB2aINOXNn1dknwQ6Gnj4ENZRqRfd+9cX1L
	ejY9IAMS/oOuJN72jjnmTaaBFiq7GN6o+LGMc4lwhWDQzgQiPpaE1/SFgnsEWvMKyXYHVEFTJHK
	mucAuzFlDaipokKOswnsQ8hzFfo/vCkJGqxKqEqdvpjANif+Mhh4/f3LNzvoJN9RLo4Ttx72SvJ
	DyQA49CyFqilS+v+gtMZDZzLtm/n24dhtkycHdHcHeOMs/sBSTzgYecWuGgBpGtBtJPgww/vUb7
	/0OfgYQuhqE7BfvWvSPXhv5CVvdqgneaDY5m1+AQDzxHlWO8CQGy4x88AgkYtqJPeSE+AjCQIOu
	0+L9FFoA4/6pe8b1tsFh7T2kBzgW9EgAF44Hwv9Lx+gZVljd6DyqNQMPjuLJnhyvH6jVdmqZ1BO
	UdUe2KEQ0p1DsYjTg=
X-Received: by 2002:a05:600c:524a:b0:477:7a78:3000 with SMTP id 5b1f17b1804b1-48365718323mr18483945e9.6.1770888685036;
        Thu, 12 Feb 2026 01:31:25 -0800 (PST)
Received: from skbuf ([2a02:2f04:d501:d900:2f75:bf70:f0b9:4586])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834d482480sm215126875e9.0.2026.02.12.01.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 01:31:24 -0800 (PST)
Date: Thu, 12 Feb 2026 11:31:21 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Josua Mayer <josua@solid-run.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	linux-phy@lists.infradead.org, linux-mmc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-next@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH next] phy: renesas: rcar-gen3-usb2: Drop local
 devm_mux_state_get_optional()
Message-ID: <20260212093121.2c6o6pkk4riphbel@skbuf>
References: <67c8c4f9bf9f09fd0c13daedef27b82ff389ddfb.1770720452.git.geert+renesas@glider.be>
 <CAPDyKFpY2X8hephSfHq7rj_DaKX76ZSkWSCYXrGTEBUFHkvOzg@mail.gmail.com>
 <aYyrsPTH1923jV7y@vaman>
 <CAMuHMdUHNRuMmHU2ACX84nsZdXn_-fSamnF+LMFvZS3vkHnEWA@mail.gmail.com>
 <aY1eIG_U_GBOFQGt@vaman>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aY1eIG_U_GBOFQGt@vaman>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28169-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[olteanv@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: DE54912CDA2
X-Rspamd-Action: no action

On Thu, Feb 12, 2026 at 10:29:12AM +0530, Vinod Koul wrote:
> Hi Geert,
> 
> On 11-02-26, 17:30, Geert Uytterhoeven wrote:
> > Hi Vinod,
> > 
> > On Wed, 11 Feb 2026 at 17:17, Vinod Koul <vkoul@kernel.org> wrote:
> > > On 10-02-26, 14:34, Ulf Hansson wrote:
> > > > On Tue, 10 Feb 2026 at 11:53, Geert Uytterhoeven
> > > > <geert+renesas@glider.be> wrote:
> > > > > Now the mux core provides devm_mux_state_get_optional():
> > > > >
> > > > >     drivers/phy/renesas/phy-rcar-gen3-usb2.c:944:1: error: static declaration of ‘devm_mux_state_get_optional’ follows non-static
> > > > >      declaration
> > > > >       944 | devm_mux_state_get_optional(struct device *dev, const char *mux_name)
> > > > >           | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> > > > >     In file included from drivers/phy/renesas/phy-rcar-gen3-usb2.c:20:
> > > > >     include/linux/mux/consumer.h:64:19: note: previous declaration of ‘devm_mux_state_get_optional’ with type ‘struct mux_state *(struct device *, const char *)’
> > > > >        64 | struct mux_state *devm_mux_state_get_optional(struct device *dev, const char *mux_name);
> > > > >           |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> > > > >
> > > > > Fix this by dropping the temporary local wrapper.
> > > > >
> > > > > Fixes: ad314348ceb4fe1f ("mux: Add helper functions for getting optional and selected mux-state")
> > > > > Fixes: 8bb92fd7a0407792 ("phy: renesas: rcar-gen3-usb2: Use mux-state for phyrst management")
> > > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > >
> > > > Thanks Geert for helping out!
> > > >
> > > > > ---
> > > > >   - ad314348ceb4fe1f is in mmc/next, and a PR has already been sent
> > > > >     https://lore.kernel.org/20260209133441.556464-1-ulf.hansson@linaro.org
> > > > >   - 8bb92fd7a0407792 is in phy/next
> > > >
> > > > Vinod, do you want to pick up the $subject patch as a fix for 7.0-rc1
> > > > or do you prefer me to handle it?
> > >
> > > Should I drop the 8bb92fd7a0407792 and it makes things easier for
> > > everyone and then we can pick fixed commit for 7.1 cycle..
> > >
> > > Does that work for everyone. I was about to send PR, will hold off for a
> > > bit.
> > 
> > Alternatively, you can mention the semantic conflict in your PR to Linus,
> > and ask him to fold my patch into the merge commit.
> 
> Hmmm, that is also a good option but might leave Linus a bit grumpy so
> bit reluctant. Dropping and getting right implementation would be
> better. I think it was a mistake to pick or this all could have gone
> thru mux tree.
> 
> Thanks
> -- 
> ~Vinod

I think with Linus' refusal of the mmc/next PR, there is no longer any
need either for this patch or for the revert of 8bb92fd7a040 ("phy:
renesas: rcar-gen3-usb2: Use mux-state for phyrst management").
http://lore.kernel.org/lkml/CAHk-=wgnRQiKqWVrO_uF1btYM2K8r8xL95RGdKU3QLe8B58nrw@mail.gmail.com

