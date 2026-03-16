Return-Path: <linux-renesas-soc+bounces-29520-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mLcEKeQzuGmvaAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29520-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 17:46:28 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA4B29D9B0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 17:46:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 96B94301A92E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 16:42:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ABC33358AF;
	Mon, 16 Mar 2026 16:42:35 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B2BD334695
	for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Mar 2026 16:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773679355; cv=none; b=jHnXUM6nEmRN2kXklGZP2CPGfzhctssPeoSjpdx9BmMQh0Z1EP+oevX8JYntaEgf3umMxBCE4PZRAh8uv82nPYSp4qA+m2Z2DYiG0yLegSY+uNLX2SOmC7GgV+bnt6vGOWPdF4wPg7rpT1peHzCAQp1G1eZaAED5M3MqWtUMbxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773679355; c=relaxed/simple;
	bh=cQv0F14L7VZaOZP71JRDDpNLLzI0Tf+dEL8n5ccKZl4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E1PCk3laFGqAr18JqAv80mKEMn4PyZKyMS+sAGKh1UP4/r3oigntT/0ZRhSGL4vY6L12jsqWrs316zn+TgCQFnZdSw8shaFOnNZdWqrWcfpLXbqmf7AlY9WK0IId3QKGA4MEF2Q9HanOUTbtc+JWhZPIQaqEK+oFapsXJ761cco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2ae4e538abdso52163965ad.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Mar 2026 09:42:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773679353; x=1774284153;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FwkbFxjRydoL+3S1meFk7eWFdNhpUXApysI3YafwRzw=;
        b=FVi1YxXVJBJlP/0rLd3oegIwEKmXa8Wx6ddhRcEIZ1N+h91rzETTuHlq1t/hVUY+Cq
         SvaLtj06yVPYk9jwORXb5OSCPdRGDGMwtNCcXdk01jhEMapgY4fk/Q+H6PXgXMH8GdBR
         lQHUxvIafvkgzjJ7tusm9MssdrYLw00P/LNr8KzKs/v8tfjoaSsah71Q9JZb+kD0da07
         Ef3dAJslEepPVP6n8WJNRUVBUbBdzVLzYNboiupKNRiExGoq9dsPYjmYFBRXdYUxD3Ll
         ttiPho7b+tlS4XQWfEfJYHWJUTlgXNINYlL7QBkfDVZ1eRArL9ctGDasgykBOmcDEh8Z
         V6sA==
X-Forwarded-Encrypted: i=1; AJvYcCUoDvKhLHmRAb2SJ3ixFWnEHoFSNm9c2QWwDqWLUh4CdIPGSHFnYKPi5K9ieGkqv921qhXnJdmrSvj83S5i8KjE1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzI2TQXOAdkMuIB/WD0pcErNyJRtNctkIJxnM18OEc5nD0BkjyB
	n/BpIp+hWO3owfjH3tT6LhSi8dGBDpRnG8rVgAoO8kt+oNzoG/lWUUfpV46eaWBx
X-Gm-Gg: ATEYQzzc03m99rJXDRj4lSHMsgm10GaWmQMzl+4he/5oYVB5vnaY1nDC+27IyPqVdvv
	cblkpgsftpXAi6HpkxEoS4fjbuS62qQxNfEfqvf59CVRs2WjDbJmTEYPgALv0Jk6alhboo4xSzC
	+a53dYjdHzaJuaPfM6VKfb6EwUZGE1eR54p+qgeI2hEJGREUiKhGxckhig/XULx2OmqvvlH6wvh
	5gSyDn0j+kNHy4iNcLkR899qZLh4usHDRsMVKDDdnolzPzoakIueBfMpOZfdSmNRx6DLKgcm8jl
	qCLls58cbHoP1aEQTNOkj/XxgGPm2hzlmacERa+VpqTFHl2kxdV+T+zwVF2xsRUx94LlIXMqSxo
	6nMvTRb65QoZw54x5Q9BKIIOfn0Ftbcmhb55HmVJEdbtM7qLjXRYsaQ6Xz3aC9fdVds/VeB6vBJ
	En17KZtqrPRnPNV+zsBiR8uN9JYIXyv63LXc3dsrg0ofw6Ca9s1ErL7r/oTUnE
X-Received: by 2002:a17:903:32cf:b0:2ae:4948:f866 with SMTP id d9443c01a7336-2aeca9d13eemr151506305ad.22.1773679353389;
        Mon, 16 Mar 2026 09:42:33 -0700 (PDT)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com. [209.85.216.49])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece7ee3ecsm147340585ad.42.2026.03.16.09.42.32
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 09:42:33 -0700 (PDT)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-359fea895b5so2697699a91.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Mar 2026 09:42:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVIPBwFg8l4lp72IJkyR3qbmP3PRi0tZz1mVcUleypy0duMiuebASk3E7qPAUSU5+K1hzbBTWXWUliyuncNr3wosA==@vger.kernel.org
X-Received: by 2002:a05:6102:41a8:b0:5ff:f366:dbe1 with SMTP id
 ada2fe7eead31-6020e2ca6f9mr4658842137.15.1773678937299; Mon, 16 Mar 2026
 09:35:37 -0700 (PDT)
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
 <abgsW1yoGtMNE3c7@pluto>
In-Reply-To: <abgsW1yoGtMNE3c7@pluto>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 16 Mar 2026 17:35:26 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU1Z9NiQOd10zsimMcOfSC=dVYbfjAKKT4aD3Zx9KttVQ@mail.gmail.com>
X-Gm-Features: AaiRm51lpyc-i3j3bxjBB2lDNXTNKjsxn3Z8MoQ6iXS2hbjQwIIJtMCDQtgnhDA
Message-ID: <CAMuHMdU1Z9NiQOd10zsimMcOfSC=dVYbfjAKKT4aD3Zx9KttVQ@mail.gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,lists.infradead.org,arm.com,broadcom.com,gmail.com,linaro.org,foss.st.com,oss.nxp.com,amd.com,glider.be,renesas.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29520-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.773];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 4EA4B29D9B0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Cristian,

On Mon, 16 Mar 2026 at 17:14, Cristian Marussi <cristian.marussi@arm.com> wrote:
> On Mon, Mar 16, 2026 at 04:50:17PM +0100, Geert Uytterhoeven wrote:
> > On Thu, 12 Mar 2026 at 17:36, Cristian Marussi <cristian.marussi@arm.com> wrote:
> > > On Thu, Mar 12, 2026 at 03:33:52PM +0000, Sudeep Holla wrote:
> > > > On Wed, Mar 11, 2026 at 06:45:41PM +0000, Cristian Marussi wrote:
> > > > > On Wed, Mar 11, 2026 at 05:59:43PM +0100, Geert Uytterhoeven wrote:
> > > > > > On Tue, 10 Mar 2026 at 19:56, Cristian Marussi <cristian.marussi@arm.com> wrote:
> > > > > > > Add proper error handling on failure to enumerate clocks features or
> > > > > > > rates.
> > > > > > >
> > > > > > > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

> > > > > > > --- a/drivers/firmware/arm_scmi/clock.c
> > > > > > > +++ b/drivers/firmware/arm_scmi/clock.c
> > > > > >
> > > > > > > @@ -1143,8 +1149,12 @@ static int scmi_clock_protocol_init(const struct scmi_protocol_handle *ph)
> > > > > > >         for (clkid = 0; clkid < cinfo->num_clocks; clkid++) {
> > > > > > >                 cinfo->clkds[clkid].id = clkid;
> > > > > > >                 ret = scmi_clock_attributes_get(ph, clkid, cinfo);
> > > > > > > -               if (!ret)
> > > > > > > -                       scmi_clock_describe_rates_get(ph, clkid, cinfo);
> > > > > > > +               if (ret)
> > > > > > > +                       return ret;
> > > > > >
> > > > > > This change breaks R-Car X5H with SCP FW SDKv4.28.0, as some clocks
> > > > > > do not support the SCMI CLOCK_ATTRIBUTES command.
> >
> > Apparently it is not just CLOCK_ATTRIBUTES, but also
> > CLOCK_DESCRIBE_RATES.
>
> I was indeed suspicious that I could have opened a can of worms by
> more strictly enfrocing these...
>
> > > > > > Before, these clocks were still instantiated, but were further unusable.
> > > > > > After, the whole clock driver fails to initialize, and no SCMI clocks
> > > > > > are available at all.
> > > > >
> > > > > ...and this is exactly what I feared while doing this sort of hardening :P
> > > > >
> > > > > So there are a few possible solutions (beside reverting this straight away)
> > > > >
> > > > > The easy fix would be instead change the above in a
> > > > >
> > > > >     if (ret)
> > > > >             continue;
> > > > >
> > > > > ...with a bit of annoying accompanying FW_BUG logs, of course, to cause future
> > > > > FW releases to fix this :D
> > > > >
> > > > > Another option could be leave it as it is, since indeed it is the correct enforced
> > > > > behaviour, being CLOCK_ATTRIBUTES a mandatory command, BUT add on top an ad-hoc SCMI
> > > > > quirk targeting the affected FW releases...
> > > > >
> > > > > This latter option, though, while enforcing the correct behaviour AND
> > > > > fixing your R-Car issue, leaves open the door for a number of possible
> > > > > failures of other unknowingly buggy Vendors similarly deployed firmwares...
> > > > >
> > > > > ...that could be solved with more quirks of course...but...worth it ?
> > > > >
> > > > > Thoughts ?
> > > > >
> > > > > Let's see also what @Sudeep thinks about this...
> > > >
> > > > I prefer to fix it as a quirk to prevent similar issues on newer platforms if
> > > > the firmware baselines are derived from it. In the worst case, we can relax
> > > > the hardening until we figure out a proper quirk-based solution.
> > >
> > > Ok, I can post a V3 with a dummy quirk 'template' RFC to be filled by
> > > Geert with proper versioning....so I can check that there are no
> > > surprises round the (quirked) corner...
> >
> > Unfortunately you cannot "continue" from a quirk, without resorting
> > to a goto, so I sent a fix: "[PATCH] firmware: arm_scmi: Support loop
> > control in quirk code snippets"[1].
>
> Yes ... just realized that this afternoon when trying to draft a
> quirk... (see other thread)
>
> > Then I came up with the following preliminary (have to check more
> > firmware versions) quirk (Gmail whitespace-damaged):
> >
> > diff --git a/drivers/firmware/arm_scmi/clock.c
> > b/drivers/firmware/arm_scmi/clock.c
> > index f62f9492bd42afbc..6f2af6e9084836c6 100644
> > --- a/drivers/firmware/arm_scmi/clock.c
> > +++ b/drivers/firmware/arm_scmi/clock.c
> > @@ -1230,6 +1230,18 @@ static const struct scmi_protocol_events
> > clk_protocol_events = {
> >         .num_events = ARRAY_SIZE(clk_events),
> >  };
> >
> > +#define QUIRK_RCAR_X5H_NO_ATTRIBUTES                                   \
> > +       ({                                                              \
> > +               if (ret == -EREMOTEIO || ret == -EOPNOTSUPP)            \
> > +                       continue;                                       \
> > +       })
> > +
> > +#define QUIRK_RCAR_X5H_NO_RATES
> >          \
> > +       ({                                                              \
> > +               if (ret == -EOPNOTSUPP)                                 \
> > +                       ret = 0;                                        \
> > +       })
> > +
> >  static int scmi_clock_protocol_init(const struct scmi_protocol_handle *ph)
> >  {
> >         int clkid, ret;
> > @@ -1254,10 +1266,12 @@ static int scmi_clock_protocol_init(const
> > struct scmi_protocol_handle *ph)
> >         for (clkid = 0; clkid < cinfo->num_clocks; clkid++) {
> >                 cinfo->clkds[clkid].id = clkid;
> >                 ret = scmi_clock_attributes_get(ph, clkid, cinfo);
> > +               SCMI_QUIRK(clock_rcar_x5h_no_attributes,
> > QUIRK_RCAR_X5H_NO_ATTRIBUTES);
> >                 if (ret)
> >                         return ret;
> >
> >                 ret = scmi_clock_describe_rates_get(ph, clkid, cinfo);
> > +               SCMI_QUIRK(clock_rcar_x5h_no_attributes,
> > QUIRK_RCAR_X5H_NO_RATES);
> >                 if (ret)
> >                         return ret;
> >         }

> > Does that look like what you have in mind?
> > Thanks!
>
> Yes in quirk I was only addressing NOT_ATTRIBUTES and mimicing the old
> behaviour with continue, BUT if the set of clocks not supporting attributes
> and the set of clocks not suppporting rates is disjoint, I feel we need your
> double quirks :P

I could have used

    SCMI_QUIRK(clock_rcar_x5h_no_attributes, QUIRK_RCAR_X5H_NO_ATTRIBUTES);

after both scmi_clock_attributes_get() and
scmi_clock_describe_rates_get(), but I wanted to keep the check as
strict as possible: the former returns two error codes to ignore,
the latter only one.

> If you are still finding out the exact FW versions that are failing maybe
> it is better if you carry on and test the quirk-framework fix above together
> with your quirks and we can make sure to pick all up together...

It is not urgent, as R-Car X5H SCMI support is not yet upstream.

> ...OR maybe better I can also drop for now my offending patch that breaks
> your FW from my V3 series and you can pick it up and post it later with
> your quirks and the Quirk framework fix you propsoed so that we are sure
> that we dont break anything while fixing all of this...

While there is indeed a chance that this hardening regresses on
platforms that are already upstream...

> Also because we are already in V4 and I dont want to risk to post the
> breaking fix (that was at the end broke since forever) BUT not the quirks...

s/in V4/at rc4/?

> Let's see what @Sudeep thinks

OK.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

