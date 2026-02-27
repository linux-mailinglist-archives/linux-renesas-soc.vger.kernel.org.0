Return-Path: <linux-renesas-soc+bounces-28544-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IKJVLoizoWmMvgQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28544-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 16:08:56 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F071B972F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 16:08:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7406E31ADE83
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 15:01:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9FDD42EEC9;
	Fri, 27 Feb 2026 15:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RLLChCLh";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="RVRnmYFO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62CAC2C15B5
	for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Feb 2026 15:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772204471; cv=none; b=Oh7CyzE/9q/ez4CoUmWG3z1s7UFEU7dWAbaviYlIyCuqeZIb+LxDvbeDSRVE8y5ixfdN3hJg6hhVoBwRdP/bbwqocvbpCBBDOjc7CxgyUnSGwKITk0KrRzjSMxZmdtORz7vlhwFRCgthOVIVjwBTnOwGXvwuR/2i3KLjIeHYVrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772204471; c=relaxed/simple;
	bh=Tdad2tDIZ4nlg5lofGib/mnCiNPcPkT7O6vIqYQRG4s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ri0QLgolj4kGduxA0y+cVMqWrWCpfBmoL8dFBCkK7ewW2MCGQ1a1Z751j7/TwCki3L2lnbFm78Ae0EbHo2RApyn6c35y2CGTbh5Ov6WzOs49HhL3uAS00XPLby2ew/Ij7BIIZqmjWN42N8yoeWgkM+TKc5xDX7wuZjh0Cazb6bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RLLChCLh; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=RVRnmYFO; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772204469;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bLr3NmqNXmYh6BXBWQg2YMvnGrmssYaz8RuukrCvN6E=;
	b=RLLChCLh84VBGnyJlusFZeNp1aeMf5X14wX396DG5Ic3HPdiu/3D0YidDP8LmPmJgaEHQd
	oEPOH9UAjGfGTUvxL4Z+NegT6DxlJ+2ya9sajTI1p+ct5ZpsNbpYerzpb0MAhuzT661LL+
	zNR7SP3/QeFdVO5dD/GrfA/aNr/vccw=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-498-gVko4UAPPgSbU5pGHeeUxg-1; Fri, 27 Feb 2026 10:01:07 -0500
X-MC-Unique: gVko4UAPPgSbU5pGHeeUxg-1
X-Mimecast-MFC-AGG-ID: gVko4UAPPgSbU5pGHeeUxg_1772204466
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-899b30c56c6so31728316d6.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Feb 2026 07:01:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1772204466; x=1772809266; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bLr3NmqNXmYh6BXBWQg2YMvnGrmssYaz8RuukrCvN6E=;
        b=RVRnmYFOdq8FZ7+1BF52dY639avt63nk4eXgeDtPnyBa2bgoyOUfMfHGpOPP6jdw3+
         7E7zyBPmq3SWJ5Br+R8PIHT1+XHVdnSicDnThmoOpb4AV7W5jzg6nUauDCzVcVMHlczU
         a55KslQOs5/D49ggfi99rszvtyZ7NrbdC1yysJv/Sgm4vNW1X5t2W+vsnNM9tmXJyaFo
         73cJCurrtu4jZ9C1khbKF6hDDQeFck8heV9Y1pD3eCfkk3UNz1Mp3T6ImhzZLBcpYq0Z
         Z7xZNlluYTvgUroSucE/nd4aj7tB1PKED2SqZPoUqP/nCNO7v9P5Nc2xp0shyAqBumc9
         AmVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772204466; x=1772809266;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bLr3NmqNXmYh6BXBWQg2YMvnGrmssYaz8RuukrCvN6E=;
        b=wa40Ky38oVqEUm37Kfd9Gjlqx+oQW+yPeTGotCwH/8YT84knu//sw2VXGxT3SkhKhG
         vh2x/hmbGbBzdegbMBvMumvJaFe3GVRuEJ1dfa2tTGxrGTZH5j5sfHxwCnJnGg+SWH2N
         W+xCSOO7bwDdy3eKJKKPvJ79sBoNYq6Sy/0GGah4hMliljCxUZaE1y4h7PLSWGKLdHMX
         XfDciFd5yvCbpRhDKP54Uojpm5Nlge7/SC5iajgcgzb3GFlkVt9E14pdlgpLrdKNOw0T
         XBgT0J3sTUcnTrW32A93RQ0raZaJmnI2LHDGiax/hbOtCRbPIeGcU6amrGiEb6nTe01j
         A6QA==
X-Forwarded-Encrypted: i=1; AJvYcCUprGG/kbCuSFXsgDJ9aTQ9uGjVsWRJdE1JJw+m72oJhYuA25tt61oZxVvSsRdwI9FM4OJCmvGapPf6YTT8tmGh3Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yztc+NlZecwlOy+lai5JCQd0Ae7HdC7ypZ9bRWvwySFabR2Nse+
	mxWxG0hFaIMWH/IiUZIY/gCFPz5bCiwSlpNrbRC19EQZ6X1Pr7dv4OAdKfJBGd4jwICpb1jtv7L
	ECjERkCL1Q6WsyNtPtRwyB1SkAvc3qBEHRY5xz69+NtEkYeOj1MNeWmXTs/+6QJ0DEU0JyvSD
X-Gm-Gg: ATEYQzxbF7kDWOI6aK9NM1/lo5f8S8vzvQwOklQLkt9pia7FffIDWMSoXCYqsymjM72
	PRjLe7kgkeZWYJ9BxZSLMY5OXm0aa9tnG+l7NzBPwHyK6oaH6V0wx+fr3An03eUeXnepP4cYZvV
	SONfnx9LgJ8I4mDeja9/ioLBtW6OMxwMS9fm0buDGiNJ6G1iNQIX2q0dyAcijm+EmnnMyNjjB3R
	/R1m4j5zCCBHtNVlM+olggRZSAWXhac84Y8I20jfe/XFbDV0N/ElOwnWwDfzvPcwdD75LH8V3GY
	eC/ILNKCMEUnZnja3T8iCl276/F1lzzH55KJiz/IshnWUmlHPNO/Aov8uIBRD2rsWajakS9/DIt
	XkFx94Y7D2N0BaFJAyjLQBIsLg3FP4zUkavWwouEQHdpDGqQtvg+UToJj
X-Received: by 2002:a05:6214:48d:b0:899:bc85:7b68 with SMTP id 6a1803df08f44-899d1dbd513mr43676666d6.16.1772204464912;
        Fri, 27 Feb 2026 07:01:04 -0800 (PST)
X-Received: by 2002:a05:6214:48d:b0:899:bc85:7b68 with SMTP id 6a1803df08f44-899d1dbd513mr43675746d6.16.1772204464174;
        Fri, 27 Feb 2026 07:01:04 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-899c7374600sm46063276d6.29.2026.02.27.07.01.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 07:01:03 -0800 (PST)
Date: Fri, 27 Feb 2026 10:01:02 -0500
From: Brian Masney <bmasney@redhat.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH 11/13] clk: renesas: rzg2l-cpg: drop determine_rate op
 and use CLK_ROUNDING_FW_MANAGED flag
Message-ID: <aaGxrm0SqwaJWCph@redhat.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28544-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bmasney@redhat.com,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[init.name:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 28F071B972F
X-Rspamd-Action: no action

Hi Geert,

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

Before I start a larger discussion on patch 1 with more people about a
name for this flag, help me understand why this provider has a noop
determine rate. Is the hardware eventually programmed with a rate
that's close enough to what was passed in? Or it doesn't really matter
what the clock rate is, just as long as it is running? Or should the
determine_rate function be filled out in this particular case?

Thanks,

Brian


