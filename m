Return-Path: <linux-renesas-soc+bounces-28577-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kC0fLR++oWnPwAQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28577-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 16:54:07 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1301BA5AB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 16:54:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BC6FD30DA60F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 15:48:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A475D441054;
	Fri, 27 Feb 2026 15:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D1207F6b";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="rPBo3/v0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FDAF441036
	for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Feb 2026 15:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772207303; cv=none; b=W2vj6nrqtxfwY9+W+UvXTToDbph3ggDd7uofuNhoDOioy9hrGxED0znjiVP/1L865ooi/dAkDrHqw80yUm0GH/lh4sEODUAR5x81bDjdv8SBiy8lPt5667jiU4pIWLvBfEfqu9ScThmtwqwHckXX4whwolxuSR1LpnOPudij3fI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772207303; c=relaxed/simple;
	bh=7YGmHhwwLBOPKdL6VDCe25943/DRSiWfrs5wdK01lSE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fZ/6BSQgOstSk5ZO4faQ27YwJJ/q/n5JHSFhmPilsLoy3J+KfXid5ZY8TJY5rTvHWTCOmJ6nYq2mX4AFMqZeSU2dAW0vIXsf0Y8fpAKow0zSoATuh4vM8vzsFtIn1rpqbi0w6XEmXpdH6Ijk9jvO6rxwSkZ/1oRTmbZmp1/qWf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=D1207F6b; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=rPBo3/v0; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772207301;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lvpFtOiJwNSzgfAcSgZ710nE/mVUo3cuXlNU4qHPIW4=;
	b=D1207F6b+Ayz1imX9jKYJ8kYO6q6psvKeXw4A6k2fXTpKp9mLQw0tLFPubMovQQy3YHuHs
	NvmtYI11Evgjy5VVsGeiM/nYHNV65ySDdcAK0o3IvM2EpwKQXOqtvz5rPle+d2t8SGQfyV
	4VWX+aM0Z9AJL2db6PEFrXatyflB1QI=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-648-DuTt7EeDNwSdyZSyeJ8muw-1; Fri, 27 Feb 2026 10:48:20 -0500
X-MC-Unique: DuTt7EeDNwSdyZSyeJ8muw-1
X-Mimecast-MFC-AGG-ID: DuTt7EeDNwSdyZSyeJ8muw_1772207298
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-899b6cc76a2so178412526d6.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Feb 2026 07:48:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1772207298; x=1772812098; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lvpFtOiJwNSzgfAcSgZ710nE/mVUo3cuXlNU4qHPIW4=;
        b=rPBo3/v0/qu5FeBOzAKkYn1B9C5lsWr+bmXQMK5j8UQtDOrnLgYltZXpXR2vMcoY/o
         p1oYyh+6qXGShLSwclo0bbUpSEjVRsa6Q0W1XWcVzSyQMpBBRHEl6eOpZOQb+Qsrw/HC
         54E95Fe03hd2yMN4M7pgjckN00+/Xw1IbfGWvLWcmZXWPGHi/k5F6IDDljRnF2tOTqHT
         eMEtgagiObtaauJwYTXZuE0dipqlCouGEsgcPHON6V51Ct3Zx3WTIWvqLONXh9b4t6VD
         PxcLLl4ayVO9bZZnZnTFtL5nWcJtdDdrPuDaz2SUzJtw/Z8C07emTVlTiEvsrAsBagny
         7n3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772207298; x=1772812098;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lvpFtOiJwNSzgfAcSgZ710nE/mVUo3cuXlNU4qHPIW4=;
        b=Ae98kUguzrNGeURjfh4hN99HF+EvUYh0qlJ2dvR/nmxf3R8jv0VBmASrwKSrJku1rb
         cpmkZdDjavZE3aOWEgSE2cq9pL+nyCg+kuBmoFk9ZJ8mATmYgDOMyTkgMLf/MnYA/Gfc
         AVVpOIt6rtAsWMYAWFuiPfFZ1fR0GjS6YLb9bYGVJ1ThYrn481+G3tH9FpkKmoraJnaL
         YJNRgRKAJrKv4oh6hQM+eOzcwOfhzgNKutwE0wsz0oFc5nfAgfjCdPtBpvjQ6G+TLm6y
         d6S5lAxD6n7MO292UxzcVP4bgoObhhctYa6yy42KouaF5pryoEW0NmJva4soGzDnjk8J
         AQvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWzXHhRamfnifiaPxecU/I8sn/RwNn2rqUwzhbzR7KENMgt+GseNu4joLo/uYCbEE+n8cl88gW3xEC/41mhwpXTwQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVi+z2MBhci0GK5ggIcMBatwWx8Euq4SPMMbgoDyH8+27k4e7o
	SPofhfFkDKzqy8G5oAVf1u9FKRDmI7+Eh4M5/0RcWpGv0oOXxsPOYynWI0DEDVuUjpB8ToTCpkS
	uijSh+6C+pBi0tFvA8yAB7vWtw8vt2fllvf1HZmAGSonewPjrTgI5NKqv8hClILg0p4XqrlG+
X-Gm-Gg: ATEYQzwGsLtxQwb6O6Hw5zhRbay7sQwhp1X0pQrUAHAVV5aPSbd20AsPVRRJyEUnA7K
	k1mYbxrcNpNJNEs7tX/TQjPmE2Z1SaW3kRVrSFcDFnZJ48ys1sIZUc2bWeBLWEwUisVnIrki9Ox
	JrhxzdV5QBJcfVldHJ9oDJMTbEKfn9MPFRXHsM6b2ug+1lO92k1bgZqwdJC1fqel/II0VilcCvR
	wOqJfdlSFllXD0cfIp2oFimYeKHtraSpODzUR+xoKrkYhY3a8daiZrurlHEPbs4chDh1xoERUxf
	di4HC4HwqQTXnjBqizPH7CYXPO3ycbai52PI3As4nIO1ufoJ28bzy0HmmVofwEutmGWDPypZ3EC
	lGs8LU8TN1jmVqzWpF/NT5CBHSsYmfAAAFjWV/z36/Z9dTdFzM5Lj2rLm
X-Received: by 2002:a05:6214:1c45:b0:888:23a9:7b01 with SMTP id 6a1803df08f44-899d1ebb2a5mr48638106d6.42.1772207298275;
        Fri, 27 Feb 2026 07:48:18 -0800 (PST)
X-Received: by 2002:a05:6214:1c45:b0:888:23a9:7b01 with SMTP id 6a1803df08f44-899d1ebb2a5mr48637686d6.42.1772207297762;
        Fri, 27 Feb 2026 07:48:17 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-899c73a0ab8sm46507566d6.47.2026.02.27.07.48.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 07:48:16 -0800 (PST)
Date: Fri, 27 Feb 2026 10:48:15 -0500
From: Brian Masney <bmasney@redhat.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: geert <geert@linux-m68k.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 11/13] clk: renesas: rzg2l-cpg: drop determine_rate op
 and use CLK_ROUNDING_FW_MANAGED flag
Message-ID: <aaG8v-y9UqsgOZxy@redhat.com>
References: <20260226-clk-det-rate-fw-managed-v1-0-4421dd2f6dc6@redhat.com>
 <20260226-clk-det-rate-fw-managed-v1-11-4421dd2f6dc6@redhat.com>
 <CAMuHMdWPiy2OYEntYNEMjkxYPrQBED2segMfND+4VtzdeQE6+g@mail.gmail.com>
 <aaGxrm0SqwaJWCph@redhat.com>
 <CAMuHMdXR1T-VUnk87qpCmdkrYZr=UbjRJNznLw3YV98JAoN=hw@mail.gmail.com>
 <TY3PR01MB113460B83239C8251DD2FA39F8673A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY3PR01MB113460B83239C8251DD2FA39F8673A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
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
	DKIM_TRACE(0.00)[redhat.com:+];
	TAGGED_FROM(0.00)[bounces-28577-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bmasney@redhat.com,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,init.name:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3A1301BA5AB
X-Rspamd-Action: no action

Hi Biju,

On Fri, Feb 27, 2026 at 03:23:19PM +0000, Biju Das wrote:
> > -----Original Message-----
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > Sent: 27 February 2026 15:09
> > Subject: Re: [PATCH 11/13] clk: renesas: rzg2l-cpg: drop determine_rate op and use
> > CLK_ROUNDING_FW_MANAGED flag
> > 
> > On Fri, 27 Feb 2026 at 16:01, Brian Masney <bmasney@redhat.com> wrote:
> > > On Fri, Feb 27, 2026 at 09:20:09AM +0100, Geert Uytterhoeven wrote:
> > > > On Thu, 26 Feb 2026 at 19:18, Brian Masney <bmasney@redhat.com> wrote:
> > > > > This clk driver has a noop determine_rate clk op. Drop this empty
> > > > > function, and enable the CLK_ROUNDING_FW_MANAGED flag.
> > > > >
> > > > > Signed-off-by: Brian Masney <bmasney@redhat.com>
> > > >
> > > > Thanks for your patch!
> > > >
> > > > > --- a/drivers/clk/renesas/rzg2l-cpg.c
> > > > > +++ b/drivers/clk/renesas/rzg2l-cpg.c
> > 
> > > > > @@ -1041,7 +1034,7 @@ rzg2l_cpg_sipll5_register(const struct cpg_core_clk *core,
> > > > >         init.name = core->name;
> > > > >         parent_name = __clk_get_name(parent);
> > > > >         init.ops = &rzg2l_cpg_sipll5_ops;
> > > > > -       init.flags = 0;
> > > > > +       init.flags = CLK_ROUNDING_FW_MANAGED;
> > > >
> > > > Iff this is the Right Thing To Do (TM), it needs a comment, as this
> > > > clock is not managed by firmware.
> > >
> > > Before I start a larger discussion on patch 1 with more people about a
> > > name for this flag, help me understand why this provider has a noop
> > > determine rate. Is the hardware eventually programmed with a rate
> > > that's close enough to what was passed in? Or it doesn't really matter
> > > what the clock rate is, just as long as it is running? Or should the
> > > determine_rate function be filled out in this particular case?
> > 
> > I'd like to defer to Biju, who added the empty round^Wdetermine rate function.
> 
> PLL is capable of generating any frequency. that is the reason.
> 
> But we could, call rzg2l_cpg_get_foutpostdiv_rate() from determine_rate()
> as modified rzg2l_cpg_get_foutpostdiv_rate()[1] can return errors
> 
> [1]
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/clk/renesas/rzg2l-cpg.c?h=next-20260227#n590

OK. So how do you all want to proceed here?

Do you want to fill out the determine rate in this driver? If so, we can
just drop this particular patch from this series.

Since the PLL is capable of any frequency, do you want to keep the empty
determine rate functionality? If so, we could use a different name for
this flag. Maybe CLK_ROUNDING_NOOP?

Brian


