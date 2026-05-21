Return-Path: <linux-renesas-soc+bounces-32911-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ELOVBlYaD2qLFgYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32911-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 May 2026 16:44:38 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 882655A786C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 May 2026 16:44:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 88D5B316FA9C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 May 2026 14:01:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A509528C869;
	Thu, 21 May 2026 14:00:13 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3444125D527
	for <linux-renesas-soc@vger.kernel.org>; Thu, 21 May 2026 14:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779372013; cv=none; b=XtvSHLYy4Vcqf9mKNxxb7wSV4lt3ySzhZmX31FgUwBs6oXaILh8a8ZpsIj7llNtilGUPbOpXz8QvCxBxrkHH/KLE1GRJNYZ9iaTRzgD953Rw82JijWDch3Uziy31N20wLgp6pJCW4UESv1wchoJMw5TPzgfpjVzIE3NlQMOInqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779372013; c=relaxed/simple;
	bh=gVskXIGN0BqDs0yWinJ90RW5cVqzLqjAKOmRxH4PnyY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L2AD0AnbEgzqBlT9whYkEH5RJpMXxX0D0/4eBhxWRs4iZZ/B2en0CO3StPkgfcDBmite/b/Q46WmqCizvA0pkyQn0SI96K4GY1P4iX+W3omlFwrnl0O4Npk3cdhpVCK1r3UHAkaDEZRNsDypEFg5mPKXlKdrLQwhx2YOAkhjpBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-63169437ac7so4673963137.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 21 May 2026 07:00:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779372011; x=1779976811;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0QBlSLdZ09AlcaB/HvoSWDc56hOX7OMfzDXZEtMXz1U=;
        b=ZulBt5UeDQJBCaX3p1rS4fCy7IcrVfVi+aSLMmOqA/DKkjDMT30WgOXq5CXtJEox/6
         Nya4iaMz2NLNxoMWa4iqjLqWNTM71dfRjAi0CFUBgqoFesmCdZXNGvTwwHpXfWA+myrF
         +7tYE4hAR+YLlfmNXlrTOkXlhDsz2VOqpeO3weEpboDIR21ckGUVMyFCi84TrOuIBF9U
         y/wQYaMWShtlK40iIQzvdUxm+1VVs+6s9tKT0nc98WuDO+9ng15okqX4HDwSnMAMz69F
         5GSAD/FoLOTAO09HuOh31b76ymdlQV/DRcU07lEKwHisjiZLm1J5lpqZqnShIZqA2kpI
         gH7Q==
X-Gm-Message-State: AOJu0YyA1XfVNey1P6FS8QM5+lEohxIWfxnmDMurQ686dmQUkYbHSWBF
	zyEBhuzhx1ZJACr3EmyjdV4oQcCL2lCsm8PYs+rT083fPVsyAT0i6IWjwcx37QhX
X-Gm-Gg: Acq92OEuCqWC38xTGoQq+ICE765c6rF8ZYr8v6PY6AWzHPCZd45IBP0I5vGvy/RqYBw
	k2QkfSF7fqIFgOn6VnB4JdrtNpKmhAthiZgyhh0iq9tBvAKDmPzPtoLh7CVc40CqC33O93Yh3Bp
	OjnbZZ9HqJ0PKkhx6nAi9CNxpigkSJ3qvaWAfrkBsaoTMLpiWsf7TOktIV0t27TKRxnUn+FVMQA
	QCvS7HTUXD0C2+Uevuazrj/FZtoVkfSEtB9SwLQwI3cYgkzxTsy1WVSyA2ZKSVzJluruND1Vy8Y
	4WQYQeGyTFnOv1RQKNj1JECdudruFBB5B/jBDOQVM6Lfxdqzs8t9MEuYj3ZM8IpjIxGuLY3Ld5a
	sEPOYsfMQgwOEgHyMqA+TI/AAtspv8lAtFJOA5Bu2cikYlda5QuVPk8Qe5nyQUOKTGKWtNnx5eV
	GwiU0kSRrA1BfgLYd6lvFlbUym/MJ7TtfRXBjYNMEPNhrHRTzsqqsSkrvCcuTB
X-Received: by 2002:a05:6102:570e:b0:660:d26b:506a with SMTP id ada2fe7eead31-6737b93200dmr1815772137.0.1779372010694;
        Thu, 21 May 2026 07:00:10 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-679f864c2f3sm586461137.8.2026.05.21.07.00.09
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 07:00:09 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-628086439b6so5564036137.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 21 May 2026 07:00:09 -0700 (PDT)
X-Received: by 2002:a05:6102:5109:b0:633:4d1a:65e4 with SMTP id
 ada2fe7eead31-6738ef739fdmr1863699137.12.1779372009252; Thu, 21 May 2026
 07:00:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260410163530.383818-1-cosmin-gabriel.tanislav.xa@renesas.com>
 <20260410163530.383818-9-cosmin-gabriel.tanislav.xa@renesas.com> <TYYPR01MB15615A925B2F724C51DD033EA850E2@TYYPR01MB15615.jpnprd01.prod.outlook.com>
In-Reply-To: <TYYPR01MB15615A925B2F724C51DD033EA850E2@TYYPR01MB15615.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 21 May 2026 15:59:58 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUnqDg2nbsfunPL7ED4J6Zp6ECRdrL9a-AgAEc2DGySnw@mail.gmail.com>
X-Gm-Features: AVHnY4Lx1ddrbWovmDBzKTUOriXSP-VOp1hbbdZqlSN3Bwme_D5xMs6oDFejNms
Message-ID: <CAMuHMdUnqDg2nbsfunPL7ED4J6Zp6ECRdrL9a-AgAEc2DGySnw@mail.gmail.com>
Subject: Re: [PATCH v2 08/10] arm64: dts: renesas: r9a07g0{43,44,54}: remove
 TCIU8 interrupt from MTU3
To: Cosmin-Gabriel Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32911-lists,linux-renesas-soc=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,mail.gmail.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,linux-m68k.org:email]
X-Rspamd-Queue-Id: 882655A786C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Cosmin,

On Thu, 21 May 2026 at 15:54, Cosmin-Gabriel Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> Hi Geert, is it too late in the cycle for this to be picked up for 7.2?

No, it is not.

> > From: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
> > Sent: Friday, April 10, 2026 7:35 PM
> >
> > The TCIU8 interrupt used to be documented in earlier revisions of the
> > user manuals, but has since been removed. The corresponding entry is now
> > marked as reserved in the interrupt mapping tables of all supported
> > SoCs.
> >
> >  * Page 486, Table 8.2 Interrupt mapping (7/13) in the Renesas RZ/G2UL
> >    Rev.1.40 User Manual
> >  * Page 363, Table 8.2 Interrupt Mapping (6/13) in the Renesas RZ/Five
> >    Rev.1.30 User Manual
> >  * Page 528, Table 8.2 Interrupt mapping (7/13) in the Renesas RZ/G2L
> >    and RZ/G2LC Rev.1.50 User Manual
> >  * Page 540, Table 8.2 Interrupt mapping (7/13) in the Renesas RZ/V2L
> >    Rev.1.50 User Manual
> >
> > Remove the TCIU8 interrupt. This does not cause any breakage as the
> > driver does not make use of the interrupts.
> >
> > Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

