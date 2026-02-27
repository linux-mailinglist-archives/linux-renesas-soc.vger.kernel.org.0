Return-Path: <linux-renesas-soc+bounces-28579-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EENxHfjBoWkVwQQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28579-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 17:10:32 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E3CC11BA945
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 17:10:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2705330D76E1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 16:01:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA29244BCA7;
	Fri, 27 Feb 2026 16:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="emkCOWZs";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="fHbBfayd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1525F1482E8
	for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Feb 2026 16:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772208081; cv=none; b=ZK5tBnXektiK9MrWZ7HFH46TJPdPvVS5mP1adFdq72bh+wWTdoMBJvGVcoZOg8W28M1rstRGwnnG91pJm3XrVPWi1PJyvbMi3AW99UJTeBWi8H+/lAcTMYPReZ/mpKf+lNjC349nEJ2zcsDpeICCBaROtFUK8HCm2wUzf4hbQS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772208081; c=relaxed/simple;
	bh=uG30mxTLvgev7yhGcukdOHSvL8riXeEx3HzvZgQdC0g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s7l7n4QGyyQE3faVlhO9hXVTi9BDFaLWAwzluItZSC+xzhJc3mHJf5qcit7Wdb/cQYiI440th8CtAxvlWWynh/SD6ps8XrVP+64hLqc6u8U4EI7uVIsBc+Km3zKVXlIMHSdI5+0ZrXVKmMZ1VbxkTlTxrUKkParYtuYv194jwoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=emkCOWZs; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=fHbBfayd; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772208079;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RrFYWHheWeN4qF9K8AbBYu4TLD27jVlJtkV6clM5Tt0=;
	b=emkCOWZsrCfsw0ADISyiFRxQQCJsxShMuib26s0p5BF7nA5c8Zgh8L1PwXlYnsf3li/eiu
	sY/zFISoTp2XdRdERTz1PSYgsFhrzAYMhkG+dQWdPRlwxWmEOjDkhSXPorI6G/KGi5rywr
	26g0sJZg9bVZ6iMByOL+y93fRWPRcHk=
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-380-7CHHmxTsOn-y2_Vo6b3WBA-1; Fri, 27 Feb 2026 11:01:17 -0500
X-MC-Unique: 7CHHmxTsOn-y2_Vo6b3WBA-1
X-Mimecast-MFC-AGG-ID: 7CHHmxTsOn-y2_Vo6b3WBA_1772208077
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-5fdd83e8edaso19915810137.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Feb 2026 08:01:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1772208077; x=1772812877; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RrFYWHheWeN4qF9K8AbBYu4TLD27jVlJtkV6clM5Tt0=;
        b=fHbBfaydj8Z9HjG176bwgF21Ydk4toZPEnrRk5FiPraBMn+ozMxdM1hNXPh8SFIs80
         GB92NopO14s+PfMCRJ+btkTabOSZcEH09ghTEvujHBW23LgxTxKiSxKDT06X74MYRlnA
         dhI1XuFiqQn4IwEnBGp712CnBa7y664k+hc3PVR1ENZh6Lg9YhhPWOV45pJ8mU4Mf0EU
         3p/QNeUI8xwKICAN5FjdrgBVdSN1YT6dB6kmG31Lw/HlVFSzdKaVXYj39D21IVn4wcN+
         t2+kzhx/CTdkMo2ojC49G/oUltKrTiXOuSntPxeE0AAjpJnLy4zpck2eGA+6OCS0lIHO
         g01Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772208077; x=1772812877;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RrFYWHheWeN4qF9K8AbBYu4TLD27jVlJtkV6clM5Tt0=;
        b=PVp7TTFOswrb8mZmx2d2s3pqOvy9ycr1Z2eHyekjk3KyYnWspTdmLYPfaveIuczSyS
         wdacxc6aNFHipZvGSa/WYwy+TdT5zc6aw7y/PLO5iwZDs9o7RB609CBEiub9kg1I31Mv
         MapJ2//VAb3SKWCzPdn0QLdLyEFl3v32sKyus9yRahH8wpY3O5PDuKk33Q3dNLVCTv4V
         UM4lEtuT9XyDB7gMrbwbpuYZ1v6xyjYw/RyYpMoN56scqZWTIFBDgu7+C/wBsaKAvPzk
         wz7P0pIT88BztZ81ouUNm3o9PU6N2MY/TGuvqBiD4iRVF2lfTBA2C86vwLJJ9JPsIm9E
         lPWg==
X-Forwarded-Encrypted: i=1; AJvYcCUxXeAGPhUsnlpsAMUYwpdgZk8R/ye+Icgf1VJEv+pBm1eq3cOlWJHYFgqI2qSK8+fCCaWylBxhObppIHwGHUMzpg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs89mKWfJCVlZdeOFzSjoWv+gICh2WUivWvqyyOkDQhYXB+K0m
	klSzUZkKYL1ujrUVQRM06FjX2tSjfBTe6+vZlj3ntsaunKEUgVNFFxqwAjbk5p60tuJyKFRQUVm
	zKJek2K1hzJuTHxdV/7TJBQyG3iERZL7WJVvRYc6C0r1YMFFS34kK2rCq+fuKuY1gREY3TW3SaQ
	b7SESA
X-Gm-Gg: ATEYQzx213VeLvYP2ntAFzqJZCxeBmrEUeQhPMRkGU0HQiujWqOhHYkcF0TOckxXEnv
	fSFMqgz3KmpMpV1phaleQFWZdFfKXnicNKVrDpMnduHRHG2bDq6AMaLHrSUSvM+vQW+2oJfHaSx
	x4uoCL8jGDj8lfapAMApSRaPQTqiOAFstOrAcO0KAEB97ZQoS33IIxB90inDgSiXQ+aOSCjZ9iE
	TEpgi5RjGZ8ESvQi2dgF4O5kLRzy62IKaz12i87cNeFGsXunNcdVRGOsDvEO0e7gjBVZmiidJRk
	M2suhuu3Yq6yPd9b1r1beGs2C69/Oi4bcTyapn5M5mN6q+ITFNID40/i+zFXVzkiAWleAgkB7iq
	6QK4orHcEzgzU9KqvXFFHqlwiqKRTLBxC/s0W/zhhnjQcmIAq4uVcy13M
X-Received: by 2002:a05:6102:3f10:b0:5f5:3969:f762 with SMTP id ada2fe7eead31-5ff3256618dmr1939722137.31.1772208075598;
        Fri, 27 Feb 2026 08:01:15 -0800 (PST)
X-Received: by 2002:a05:6102:3f10:b0:5f5:3969:f762 with SMTP id ada2fe7eead31-5ff3256618dmr1939502137.31.1772208074497;
        Fri, 27 Feb 2026 08:01:14 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-899c715a87esm44464306d6.4.2026.02.27.08.01.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 08:01:13 -0800 (PST)
Date: Fri, 27 Feb 2026 11:01:12 -0500
From: Brian Masney <bmasney@redhat.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Chris Brandt <Chris.Brandt@renesas.com>, geert <geert@linux-m68k.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 11/13] clk: renesas: rzg2l-cpg: drop determine_rate op
 and use CLK_ROUNDING_FW_MANAGED flag
Message-ID: <aaG_yNNa0HH5NRbU@redhat.com>
References: <20260226-clk-det-rate-fw-managed-v1-0-4421dd2f6dc6@redhat.com>
 <20260226-clk-det-rate-fw-managed-v1-11-4421dd2f6dc6@redhat.com>
 <CAMuHMdWPiy2OYEntYNEMjkxYPrQBED2segMfND+4VtzdeQE6+g@mail.gmail.com>
 <aaGxrm0SqwaJWCph@redhat.com>
 <CAMuHMdXR1T-VUnk87qpCmdkrYZr=UbjRJNznLw3YV98JAoN=hw@mail.gmail.com>
 <TY3PR01MB113460B83239C8251DD2FA39F8673A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <aaG8v-y9UqsgOZxy@redhat.com>
 <TY3PR01MB1134626136D6AE06C9A699F798673A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY3PR01MB1134626136D6AE06C9A699F798673A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
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
	TAGGED_FROM(0.00)[bounces-28579-lists,linux-renesas-soc=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,init.name:url,linux-m68k.org:email]
X-Rspamd-Queue-Id: E3CC11BA945
X-Rspamd-Action: no action

On Fri, Feb 27, 2026 at 03:57:28PM +0000, Biju Das wrote:
> > -----Original Message-----
> > From: Brian Masney <bmasney@redhat.com>
> > Sent: 27 February 2026 15:48
> > Subject: Re: [PATCH 11/13] clk: renesas: rzg2l-cpg: drop determine_rate op and use
> > CLK_ROUNDING_FW_MANAGED flag
> > 
> > Hi Biju,
> > 
> > On Fri, Feb 27, 2026 at 03:23:19PM +0000, Biju Das wrote:
> > > > -----Original Message-----
> > > > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > > > Sent: 27 February 2026 15:09
> > > > Subject: Re: [PATCH 11/13] clk: renesas: rzg2l-cpg: drop
> > > > determine_rate op and use CLK_ROUNDING_FW_MANAGED flag
> > > >
> > > > On Fri, 27 Feb 2026 at 16:01, Brian Masney <bmasney@redhat.com> wrote:
> > > > > On Fri, Feb 27, 2026 at 09:20:09AM +0100, Geert Uytterhoeven wrote:
> > > > > > On Thu, 26 Feb 2026 at 19:18, Brian Masney <bmasney@redhat.com> wrote:
> > > > > > > This clk driver has a noop determine_rate clk op. Drop this
> > > > > > > empty function, and enable the CLK_ROUNDING_FW_MANAGED flag.
> > > > > > >
> > > > > > > Signed-off-by: Brian Masney <bmasney@redhat.com>
> > > > > >
> > > > > > Thanks for your patch!
> > > > > >
> > > > > > > --- a/drivers/clk/renesas/rzg2l-cpg.c
> > > > > > > +++ b/drivers/clk/renesas/rzg2l-cpg.c
> > > >
> > > > > > > @@ -1041,7 +1034,7 @@ rzg2l_cpg_sipll5_register(const struct cpg_core_clk *core,
> > > > > > >         init.name = core->name;
> > > > > > >         parent_name = __clk_get_name(parent);
> > > > > > >         init.ops = &rzg2l_cpg_sipll5_ops;
> > > > > > > -       init.flags = 0;
> > > > > > > +       init.flags = CLK_ROUNDING_FW_MANAGED;
> > > > > >
> > > > > > Iff this is the Right Thing To Do (TM), it needs a comment, as
> > > > > > this clock is not managed by firmware.
> > > > >
> > > > > Before I start a larger discussion on patch 1 with more people
> > > > > about a name for this flag, help me understand why this provider
> > > > > has a noop determine rate. Is the hardware eventually programmed
> > > > > with a rate that's close enough to what was passed in? Or it
> > > > > doesn't really matter what the clock rate is, just as long as it
> > > > > is running? Or should the determine_rate function be filled out in this particular case?
> > > >
> > > > I'd like to defer to Biju, who added the empty round^Wdetermine rate function.
> > >
> > > PLL is capable of generating any frequency. that is the reason.
> > >
> > > But we could, call rzg2l_cpg_get_foutpostdiv_rate() from
> > > determine_rate() as modified rzg2l_cpg_get_foutpostdiv_rate()[1] can
> > > return errors
> > >
> > > [1]
> > > https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tr
> > > ee/drivers/clk/renesas/rzg2l-cpg.c?h=next-20260227#n590
> > 
> > OK. So how do you all want to proceed here?
> > 
> > Do you want to fill out the determine rate in this driver? If so, we can just drop this particular
> > patch from this series.
> 
> We plan to fill out the determine rate later, as it can return error.

OK, if you are planning to fill out the determine rate, then I'll just
skip over this driver to avoid the code churn.

Brian


