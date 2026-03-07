Return-Path: <linux-renesas-soc+bounces-29008-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qLYpHUcTrGkujwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29008-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 07 Mar 2026 13:00:07 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0335222BA25
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 07 Mar 2026 13:00:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 46EC630101F9
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  7 Mar 2026 12:00:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2927431B828;
	Sat,  7 Mar 2026 12:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yo+cd9JU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5958358379;
	Sat,  7 Mar 2026 12:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772884805; cv=none; b=DYGzVJM4oX1Jc8fJ+pusyNa9c9zUadSdR3IBSDGAse2DHgiyDhq4DmX4xB8AFUi+iZjsaK141tDcxz83D6+LrwLawNHbcyqKQTENdMU+F6ZFJTdXohEvQyOLF9gjOwhvynnnPAkcyAbAZlspSYTdLdo/uoykHfMMqMk9c5HYG1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772884805; c=relaxed/simple;
	bh=Cc4hhGK9U12ghzC7FF6DuUKKyJf1/mKUiGiK52k95nQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rMKfeBrh4fLRq4/SFYT+oEJTnFocn6GZsL404W/nyHbbAvCDggcq8CtiXXGV28ZAv5DmucL2+TJGsslpgfPGIo+AEdfjwb8B5hM3xkDBBRtawiHEPGYSQ4Z2ipnW1z8pKizCkYt7EI5DnC+CqpDG3ex5XG/3GcnhsZlaeZG9hFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yo+cd9JU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3349CC2BC86;
	Sat,  7 Mar 2026 12:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772884804;
	bh=Cc4hhGK9U12ghzC7FF6DuUKKyJf1/mKUiGiK52k95nQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Yo+cd9JUQcRWp6cJe3wPHi0rP2pOS3PF3JolwkrdHA/pxIFCGsCBDCzlQS6pEq05e
	 4FFcVmeAB4m90WP5G6X2gxJXQQpLk8QFnS/gQBoWUTWLDn/3DR5cskE+ejgsPcF6db
	 pl1m4hC9+8pgxP6dIefDWlqJQ4P/bfeY3L7YoNv8riWf1A+Xz4Mb7shRJMKJx2+wSy
	 sxd5zsnwgMmrAnhBJkCwcW37r9fF36PNfg32EcW4vlWkHSSZyCOcviTTjnV99CDyUB
	 WhzRqA6y7yBprbfw8NE+Y01HG1gKWtmQkTm40GP/Cao6WJnm1K6BFHyzDf4w/AhXeJ
	 O5Gbh1tDn1KCA==
Date: Sat, 7 Mar 2026 11:59:55 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, David Lechner
 <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy
 Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] iio: adc: rzg2l: Convert to FIELD_MODIFY()
Message-ID: <20260307115955.40e55c61@jic23-huawei>
In-Reply-To: <CAMuHMdVtNPU8fhznYmgnC_55xdqdd545eD5nHtiw_P4AD1v69g@mail.gmail.com>
References: <d42ba403c1fb1aca88b82ba3020ad0ec442a455f.1772705608.git.geert+renesas@glider.be>
	<20260305193152.253dc267@jic23-huawei>
	<CAMuHMdVtNPU8fhznYmgnC_55xdqdd545eD5nHtiw_P4AD1v69g@mail.gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 0335222BA25
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29008-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jic23@kernel.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.944];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,linux-m68k.org:email,glider.be:email]
X-Rspamd-Action: no action

On Fri, 6 Mar 2026 10:09:52 +0100
Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> Hi Jonathan.
> 
> On Thu, 5 Mar 2026 at 20:32, Jonathan Cameron <jic23@kernel.org> wrote:
> > On Thu,  5 Mar 2026 11:13:55 +0100
> > Geert Uytterhoeven <geert+renesas@glider.be> wrote:
> >  
> > > Use the FIELD_MODIFY() helper instead of open-coding the same operation.
> > > This requires splitting the double OR operation.  
> > Hi Geert,
> >
> > Looks like similar can be applied in
> > rzg2l_adc_conversion_setup()  
> 
> Which case did you have in mind? Note that FIELD_MODIFY() needs
> a constant mask, so it cannot be used with e.g.
> hw_params->adint_inten_mask.
> For non-constant masks, we first need to introduce field_modify() ;-)
Good point. More coffee...

> 
> > FIELD_MODIFY() is useful to shorten code, but if we are using it we should look
> > for all good opportunities in a driver.  Please check to see if there are more.  
> 
> I did a full scan, and it seems I did miss RZG2L_ADIVC_DIVADC_4.
Excellent, so at least I didn't waste your time ;)

J
> Will fix in v2, eventually.
> Thanks!
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 


