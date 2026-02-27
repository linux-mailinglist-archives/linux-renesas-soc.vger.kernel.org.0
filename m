Return-Path: <linux-renesas-soc+bounces-28580-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cGwXIDPCoWkVwQQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28580-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 17:11:31 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB6F1BA970
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 17:11:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5759B31678C5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 16:02:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A9F73AE705;
	Fri, 27 Feb 2026 16:01:41 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDD33326952
	for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Feb 2026 16:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772208101; cv=none; b=pEb6BGEDR370l0HjTDTiWnBMRkvhdjUYzbPIP4rIpA7w040rH+Fqm9jkWTsSv4Zh8nIhDKl25iy8E7J97m7KZqQHD//WmhfknzC38ieB20LrDJmcGw/W+e8zsBErKLVJuPdUE0pngQZR0IOzWUbEGU088ugSkf0KWVptQ8MTqM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772208101; c=relaxed/simple;
	bh=GEpYX/P0WY1RhW6hann8hF8mI2riWLr8Lux98UfllWU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rBVtfK1ngCg9VuUu+9m8jIRV5HPkB1rYb35F1ExG11zWEoy3SibDwDHvP6AYXo97JTc85WLwenkhfVHOHuor9KwWUmi1DoI+7svP3hasHMAcuHjkIHykArT9Mvc/evg03f/YlYNmaT72wy/JyrMS4oqzU+WjZ5KkskIvlVhzI0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-56a8e0ea02aso2355786e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Feb 2026 08:01:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772208099; x=1772812899;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I+Y4y+vPkdKot/5rJtboZ++IN0e4ri4EdT9ZINxJblQ=;
        b=mXGnruZfofIXjjVBjxTE9lCVh3o/RFy7jAgGIkQFqOuKfZfLAkObsbqDxBt/bJCq/t
         YXZkfkjIl3cXj8/9bqr57GSi9G6i/1by8OWWPK9Rp+W9ZlS6m1jjMVcBEUj+qjyWmgN5
         Ec4cT/VsVjFkxQuJCJc1dhEQVRIymGA067s9Qp7nK24joD4BixRLtO+l0nhl7LDDgnvl
         /v37Aqf+Ac02PC9ImeyDt+AFegr8sZ3LOCesno779NVkzH6tNsPQjfdsaM5k6E2XxO7+
         nqnLUKiO6CgAv7BIT9clduAEKJbRwlJE4AvMilmLt5rKC2XAuxcKOBCWUWwVKfBmvEf9
         9KBg==
X-Forwarded-Encrypted: i=1; AJvYcCVwXwJ8FNJ8nqntjTvzJWQ1zil+ZDNWG23H0EtfQNUHBTsCfcXoKuU9GqOVI8vpqd6DKlnrFoKnC6eiDeMcQ7LrDw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwvhyS2yRzh0dumvsE9MY1YTMymSzVw+wMwsSy6o77RwcrL3K1/
	tctYUHVuBEamr1GfIRL1is182a+UZ2K14T71iSA5RCUcOrIiqP+r1TkCkyPeRXJe
X-Gm-Gg: ATEYQzyhY3QPAtRy2EDZGDitNO2KVKSszmOXX5WJSzHFG1jqWdh0lvZawbc5icP8vVt
	XizY9DUakMIynKKDiWe6Gn4KgYjCy2K75wFPL4eYyGYF07JFf0/3D643WRudDyO8I2+fb8WllM4
	aXyKNatjOKAkmFj1NybrZb+vySvyORKzxu8p242ConAUfCStNi+jh9uN/XZh7dj46GckjiOEFAE
	D/uyJVMG/nav7RSQ5KkpPaVR5f2rmpguieMgr/jz7cXz7fOKbXq+PIQeKEzBDfIuujlwWH02otS
	pY1e0z9q2l2Nrjk6HKT2t0ax/FZ7NAcHSvLha1DLsoYbdR+LqFr0tXiE/dmm9R4EknkJBvp/SoP
	WQkOwgcL5QMDm9r8D/Mr048SLFZKrbdRTOCHaPSW1Lm4P3AmB5whPz4EcutZjUlMls4E//mZYrF
	YyPJzbq8y5itIJr0pErTwi8SQkrxuGNnZq5/4FrYPtLyIyrddhyBxjx6EbvNR1Un6Y
X-Received: by 2002:a05:6122:20a7:b0:56a:8db5:37dd with SMTP id 71dfb90a1353d-56aa09e0623mr1983834e0c.2.1772208096909;
        Fri, 27 Feb 2026 08:01:36 -0800 (PST)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com. [209.85.221.169])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-94df63d8abbsm4881491241.2.2026.02.27.08.01.36
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Feb 2026 08:01:36 -0800 (PST)
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-56a9a7e762bso1627659e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Feb 2026 08:01:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWx5euA84FZlh2RDpcD8r/uGUZvX0s2fqOt2swzNXlusfKd2GbxdEBn4u116l+dp/trsiaTRpgPeIUb/4uI89HmOw==@vger.kernel.org
X-Received: by 2002:a05:6122:2218:b0:563:702b:e2ab with SMTP id
 71dfb90a1353d-56aa0a8c538mr1985853e0c.12.1772208095876; Fri, 27 Feb 2026
 08:01:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260226-clk-det-rate-fw-managed-v1-0-4421dd2f6dc6@redhat.com>
 <20260226-clk-det-rate-fw-managed-v1-11-4421dd2f6dc6@redhat.com>
 <CAMuHMdWPiy2OYEntYNEMjkxYPrQBED2segMfND+4VtzdeQE6+g@mail.gmail.com>
 <aaGxrm0SqwaJWCph@redhat.com> <CAMuHMdXR1T-VUnk87qpCmdkrYZr=UbjRJNznLw3YV98JAoN=hw@mail.gmail.com>
 <TY3PR01MB113460B83239C8251DD2FA39F8673A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <aaG8v-y9UqsgOZxy@redhat.com> <TY3PR01MB1134626136D6AE06C9A699F798673A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB1134626136D6AE06C9A699F798673A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 27 Feb 2026 17:01:24 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVfyfoETQ1dHPv7_N2Z-LJjw8DnE5T4YuOUNGpjqpsWZw@mail.gmail.com>
X-Gm-Features: AaiRm51rTzMU_GNOTDAxYquJVGa_Qe96mTu5YWYDiTP7adhStQvfPh5SXkuubWU
Message-ID: <CAMuHMdVfyfoETQ1dHPv7_N2Z-LJjw8DnE5T4YuOUNGpjqpsWZw@mail.gmail.com>
Subject: Re: [PATCH 11/13] clk: renesas: rzg2l-cpg: drop determine_rate op and
 use CLK_ROUNDING_FW_MANAGED flag
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Brian Masney <bmasney@redhat.com>, Chris Brandt <Chris.Brandt@renesas.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28580-lists,linux-renesas-soc=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.993];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linux-m68k.org:email,renesas.com:email,init.name:url,mail.gmail.com:mid]
X-Rspamd-Queue-Id: DDB6F1BA970
X-Rspamd-Action: no action

Hi Biju,

On Fri, 27 Feb 2026 at 16:57, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > From: Brian Masney <bmasney@redhat.com>
> > On Fri, Feb 27, 2026 at 03:23:19PM +0000, Biju Das wrote:
> > > > From: Geert Uytterhoeven <geert@linux-m68k.org>
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
>
> >
> > Since the PLL is capable of any frequency, do you want to keep the empty determine rate functionality?
> > If so, we could use a different name for this flag. Maybe CLK_ROUNDING_NOOP?
>
> I guess, maybe we could use CLK_ROUNDING_NOOP, till we have proper .determine_rate() for this driver???

Just keeping the empty function should work, too, right?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

