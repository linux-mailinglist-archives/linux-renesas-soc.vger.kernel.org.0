Return-Path: <linux-renesas-soc+bounces-30172-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QKMdNmSXwmkbfQQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30172-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Mar 2026 14:53:40 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 463A7309C4D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Mar 2026 14:53:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6FFC63018D4A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Mar 2026 13:43:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4DB33FD120;
	Tue, 24 Mar 2026 13:43:55 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 607B43F8DEF
	for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Mar 2026 13:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774359835; cv=none; b=gX7ouRYhQDGG9BQDV3m8uGGkdgv+GtQjwBZwuxoJ+WLQNRMJtFQxm0YFLG58QYTG7dvAIjygaIq6sA/6TyRTAfqRJATGWWTUJVp6zaXVI40bNOh7fCSyyn9P3OGerf1X4/Q54iVH1iNU8IKhiOcoz723906awDYA6I/uwiCWSYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774359835; c=relaxed/simple;
	bh=v0TQlWPzu8GTPZY9FpXVbuwaCxkxoZDN7EjwI6xWIr0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lH5wQ9ZhEJohC/bqWudwVZhoPoh5WZbR3xjPnzuiadRDWjoNZ2B24zCSV180/xfWsCrWPZSCSwB9jKF0ZIiApocMy3mUqxEG6/8IUzj7iio3UVotbZg77bkVJGBe+BXb0sZBMKaGgx7/YyzGddd7oVkePHXKuUOhQJqA63CeiHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-60291b2cd89so1278943137.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Mar 2026 06:43:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774359833; x=1774964633;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D3UNdFM/2oVC0aBHnMmb6liNAkmGmbywgRrpmh1ChmU=;
        b=MEwt/ibH+NI5w7lBm+HZVJg2OVQjM5nEfqv8JjvwU+ViWH90iLS5gBpecbQv6CrrQW
         tMDZqI4VMl7pCP20L8/tbKzLSizXdZRkp54zya1SGCsLRtUHz0KICHmB9yw9BW/c3jjr
         zfXjT4QXC7VfNgMOmCRaAfrNrCZzrinlwrRDvegSIFtNB7E6mvW9/S+qeJlaAQU6ygNL
         NdYbYlb3qYaQUEQUb0kzGzdAVjs0zQmnFKJ3y7ZifA3N+tHL5Nf3uk/RL6cmf+sRm86s
         inToVLVZmvEcXoIaxZsWIkpaFDpVRUXFp23JUFNyxL6zB242thcP7iex6Zp8IaLiPk4k
         2wKQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4PTtClUP7hjZicQGdq3ij5ZZFhBHiiggSTRSgmhFDRukan55WcXQfX30R7bNk6D+6S6CdltzL/GW/hcO7JzsyHw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4vI4A8+FDKXKu+UvPr+4I5LT22Nc1mngPzqc1HujBO5pXs456
	RG5M49cDNgZJ/a95muYv/iNGQc0YxvwmiSCjrzm1VjCayas4se5t80XQQCPO5aZN2tI=
X-Gm-Gg: ATEYQzzVc/86x9J6DryXIZlnRCUx0WxB2Ur2i7uQgqeJzLgfpJHCaALburxVymtOk5q
	NmUE0qQrGyA01CIRoEkcv/PtL7um2X4I8GS/YJg+x0zfLdWcqOt6eBheBtU+vCH0TaUDVoEb/Zn
	WNmO1Gf/LaKFGNd3DkK3mo8N4WYFN1Q+xl1TF8jzqWBRGUg5h+IRg6FpKwVUvAQJzHU1KLLKHrt
	1o7WBk/JhbVsBfNmIqLGv1ojyXeV5qw+vq9XMLBjzfGJKbfDgTv1JEHy9EDjJ4Tubf0ZBK+teZR
	0UdFaLBNVfE4pFoIrYKoiLJG49uRxrItZmJH6GQEu25fkLJoOavx7hgb5BBwUM5FF+OgF4eDzHw
	It7RDl6aFq08fDrGLqtPSvwvELA/5dvQQEz/R9d1eblhHBMIxZ9PwcTYErqC2ssZxbjHz82tmmW
	L4HswKGsxK64WSyOErKvvnNcTYNQnY3vxYxKwTkzqV8U3EbsaV+OcXr7450bju
X-Received: by 2002:a05:6102:3f49:b0:5ff:be25:8934 with SMTP id ada2fe7eead31-602aea92a0bmr6221970137.8.1774359833244;
        Tue, 24 Mar 2026 06:43:53 -0700 (PDT)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95199278ecdsm1090261241.13.2026.03.24.06.43.52
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 06:43:52 -0700 (PDT)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-950d235b500so1450502241.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Mar 2026 06:43:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW/vqXkX0eE7mNwFIoaNzW8OYsPaO4ZoCdnZJCQYesjUCKhgE7w3OZpN7aalb4aCth9+QHO9wjCGwxWzdYS01Ph+A==@vger.kernel.org
X-Received: by 2002:a05:6102:5812:b0:602:71a7:63c2 with SMTP id
 ada2fe7eead31-602aecd0de0mr7186355137.23.1774359832015; Tue, 24 Mar 2026
 06:43:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260310184030.3669330-1-cristian.marussi@arm.com>
 <20260310184030.3669330-9-cristian.marussi@arm.com> <CAMuHMdUdqrA9kYeDpjwj-y6-4aALkAi2g2Od81Kxh-EVW2e2Nw@mail.gmail.com>
 <abG4VfyB2C-gBa5Q@pluto> <20260312-classy-misty-platypus-5baea1@sudeepholla>
 <abLrm7x8ggzAhYOg@pluto> <CAMuHMdVWL4rVTPnsMofPKFKCozjCPqF0K95ZFmrdrBD8EUt22A@mail.gmail.com>
 <abgsW1yoGtMNE3c7@pluto> <CAMuHMdU1Z9NiQOd10zsimMcOfSC=dVYbfjAKKT4aD3Zx9KttVQ@mail.gmail.com>
In-Reply-To: <CAMuHMdU1Z9NiQOd10zsimMcOfSC=dVYbfjAKKT4aD3Zx9KttVQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 24 Mar 2026 14:43:40 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWm9X5TLaAHgCsMqjFZLvUsDjrf4CqzNiO-Hsr4X9bDtw@mail.gmail.com>
X-Gm-Features: AQROBzDvNZgLoQvhVJc-PSdP06Iq5zvkWOybQz-6zVMkfKMPvuuu_fBc0vUNAPY
Message-ID: <CAMuHMdWm9X5TLaAHgCsMqjFZLvUsDjrf4CqzNiO-Hsr4X9bDtw@mail.gmail.com>
Subject: Re: [PATCH v2 08/13] firmware: arm_scmi: Harden clock protocol initialization
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, arm-scmi@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	philip.radford@arm.com, james.quinlan@broadcom.com, f.fainelli@gmail.com, 
	vincent.guittot@linaro.org, etienne.carriere@foss.st.com, 
	peng.fan@oss.nxp.com, michal.simek@amd.com, dan.carpenter@linaro.org, 
	geert+renesas@glider.be, kuninori.morimoto.gx@renesas.com, 
	marek.vasut+renesas@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,lists.infradead.org,arm.com,broadcom.com,gmail.com,linaro.org,foss.st.com,oss.nxp.com,amd.com,glider.be,renesas.com];
	TAGGED_FROM(0.00)[bounces-30172-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux-m68k.org:email,arm.com:email]
X-Rspamd-Queue-Id: 463A7309C4D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Cristian,

On Mon, 16 Mar 2026 at 17:35, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Mon, 16 Mar 2026 at 17:14, Cristian Marussi <cristian.marussi@arm.com> wrote:
> > On Mon, Mar 16, 2026 at 04:50:17PM +0100, Geert Uytterhoeven wrote:
> > > Then I came up with the following preliminary (have to check more
> > > firmware versions) quirk (Gmail whitespace-damaged):
> > >
> > > diff --git a/drivers/firmware/arm_scmi/clock.c
> > > b/drivers/firmware/arm_scmi/clock.c
> > > index f62f9492bd42afbc..6f2af6e9084836c6 100644
> > > --- a/drivers/firmware/arm_scmi/clock.c
> > > +++ b/drivers/firmware/arm_scmi/clock.c
> > > @@ -1230,6 +1230,18 @@ static const struct scmi_protocol_events
> > > clk_protocol_events = {
> > >         .num_events = ARRAY_SIZE(clk_events),
> > >  };
> > >
> > > +#define QUIRK_RCAR_X5H_NO_ATTRIBUTES                                   \
> > > +       ({                                                              \
> > > +               if (ret == -EREMOTEIO || ret == -EOPNOTSUPP)            \
> > > +                       continue;                                       \
> > > +       })
> > > +
> > > +#define QUIRK_RCAR_X5H_NO_RATES
> > >          \
> > > +       ({                                                              \
> > > +               if (ret == -EOPNOTSUPP)                                 \
> > > +                       ret = 0;                                        \
> > > +       })
> > > +
> > >  static int scmi_clock_protocol_init(const struct scmi_protocol_handle *ph)
> > >  {
> > >         int clkid, ret;
> > > @@ -1254,10 +1266,12 @@ static int scmi_clock_protocol_init(const
> > > struct scmi_protocol_handle *ph)
> > >         for (clkid = 0; clkid < cinfo->num_clocks; clkid++) {
> > >                 cinfo->clkds[clkid].id = clkid;
> > >                 ret = scmi_clock_attributes_get(ph, clkid, cinfo);
> > > +               SCMI_QUIRK(clock_rcar_x5h_no_attributes,
> > > QUIRK_RCAR_X5H_NO_ATTRIBUTES);
> > >                 if (ret)
> > >                         return ret;
> > >
> > >                 ret = scmi_clock_describe_rates_get(ph, clkid, cinfo);
> > > +               SCMI_QUIRK(clock_rcar_x5h_no_attributes,
> > > QUIRK_RCAR_X5H_NO_RATES);
> > >                 if (ret)
> > >                         return ret;
> > >         }
>
> > > Does that look like what you have in mind?
> > > Thanks!
> >
> > Yes in quirk I was only addressing NOT_ATTRIBUTES and mimicing the old
> > behaviour with continue, BUT if the set of clocks not supporting attributes
> > and the set of clocks not suppporting rates is disjoint, I feel we need your
> > double quirks :P
>
> I could have used
>
>     SCMI_QUIRK(clock_rcar_x5h_no_attributes, QUIRK_RCAR_X5H_NO_ATTRIBUTES);
>
> after both scmi_clock_attributes_get() and
> scmi_clock_describe_rates_get(), but I wanted to keep the check as
> strict as possible: the former returns two error codes to ignore,
> the latter only one.

So these are two mitigations:

    #define QUIRK_RCAR_X5H_NO_ATTRIBUTES    ({ ... })
    SCMI_QUIRK(clock_rcar_x5h_no_attributes, QUIRK_RCAR_X5H_NO_ATTRIBUTES);

and

    #define QUIRK_RCAR_X5H_NO_RATES         ({ ... })
    SCMI_QUIRK(clock_rcar_x5h_no_attributes, QUIRK_RCAR_X5H_NO_RATES);

gated by a single quirk entry clock_rcar_x5h_no_attributes:

    DECLARE_SCMI_QUIRK(clock_rcar_x5h_no_attributes);
    DEFINE_SCMI_QUIRK(clock_rcar_x5h_no_attributes, "Renesas", NULL,
                      "0x10a0000", "renesas,r8a78000");
    __DECLARE_SCMI_QUIRK_ENTRY(clock_rcar_x5h_no_attributes),

In general, when a specific SCMI implementation has multiple quirks
and needs multiple mitigations, do you prefer to have individual
entries for each quirk plus mitigation, or just a single entry with
multiple mitigations (which may not be limited to a single protocol,
unlike my example above)?

Thanks!


Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

