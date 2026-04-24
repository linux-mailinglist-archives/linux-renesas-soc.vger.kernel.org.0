Return-Path: <linux-renesas-soc+bounces-31643-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aMaQDkh362kQNAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31643-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Apr 2026 15:59:36 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E7745FE6F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Apr 2026 15:59:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7659B305BF0B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Apr 2026 13:55:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A8533DA5D4;
	Fri, 24 Apr 2026 13:55:36 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 405BA3DA5B1
	for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Apr 2026 13:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777038933; cv=none; b=RxGwK0VgrPeeekjI7/RFSt2JlSMzTdqVEms3PMesEjIlkHJJeXGk8r2Sxi5OxUXv8Qe9vVERE+rWVKW/jcPBIlOORpK0FVX2C2fD+4JzwvunUsPwXVsYL1M461BHkPjsvidVUu8OiRkfLCdFMJ5tD4jLUlAQpRfVf5fEzJ1QqxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777038933; c=relaxed/simple;
	bh=3WWUYT1S+sWCthHEyd69qr4QRMOSskrJUjp0/GRNRCc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o8+J7VLvGdf3pUr4pqs8hj47mF4mZAKo8peOv0wpfI2X9suJ/BLjgEufCiOWXXIwnP1K9K2W+ybGj+aXc6T+F9GNxkDKXqWTbSGZIdfzb7dH5EGTQ6JxEa2snEljaTxNAW93+iopfdStkUitNm75C9wvL4XdlIru1oichakV80c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-56d8d479149so2658512e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Apr 2026 06:55:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777038925; x=1777643725;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5W09Put2d2jcS6dMqMtNkVaKBleBYHmqz0mTuj06mJ8=;
        b=bc8c24n9vqeawD75nNZ3/0B+FqIs3oF5DNX8ycG7UHYLHiYq8n7FFAxNQQUvxYecuI
         qtThZsaz++thET67WIrriJCunVdhfmM0npJvhbzdyzIl2r0VSVU0P2ep7mlaaWDVmaPO
         lJ5O8BZl6fymSnnPG/hsPXDSaWWWo0nvWKWp6icjMHcvF8efWd+JO4t5ybZVeJmgcdde
         cTLNavCTFtTOATaPlF+qbcNY73OFt76bBFefhzDRhOI27Mkp6hWQfonAoHCTtgCVyCnp
         rT3tu/IDXKSnQKhxbKNlGZ7BNiCD+JoDA+JCa0e6Sn0pUH8xiWsbyMnNy5jJSj54xdp4
         eG8Q==
X-Forwarded-Encrypted: i=1; AFNElJ/2A/veqPTd4lUY8EnanH1jIgmX7I80rFGP2MM0ILfvTjgWSHjACzoFnuahtPDh/TB187jHu+YaPMUPiDGziRix0g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxG3TO7qdkVvS3/ytNgnyX819EwtPwmqI12h7BHysEybM0q0xJJ
	NQpN7VkBmNlMSMhA0D2GZWyapuVQ/QynlxCFuQfHL8+ylFpTxEPaRjtYiV4nYC9cy9U=
X-Gm-Gg: AeBDieteUQSDflc08/GNrtGT/V2R3o1j9rJnYSctWz17bLUGcjxYBeJ4yZsw2RdH9Fp
	7Nrv58oTnALeVI+Hvc/sjK/msAJJM7mp7H76ffrM3u3OLxXUJMp3niq+Gt12H7GRJrJZ0w2LXCF
	1F3pHWZXGbXz9+VsqTaBnXojdYJz1UsUWEElLF3y5WoHJBy5Le6SpV/qK8IP2wRp91Ph90/uZFO
	Vm8WifgtJQf8f1cAf81K/ks0enEizaIW7t9UbOSagKvfuuPIaBZhaQAjon15zt+aQkCUsm9rVSH
	qYgeIblJ4b3a2Dt/eGMLDX8NBtqeRa9Oj9X2OdHuxNp8FJDiq+4iLDlJkAMCY1tJfktL8Mf3PUB
	QUXHiY5jMin2O/PPYxcHBbFIX0MPOTndb6pSIQZr/jO1FhedZ/tES4SDdSlh6l5dJTw3LXLhhmk
	GkOlMEjTadIv5BT3sogszlmA6VpZam6ROo6/UekEakzPmz8a5bnvRoH9lDZ64KZnMLvoSCWBtB/
	cU=
X-Received: by 2002:a05:6122:888b:b0:56f:adb8:7c54 with SMTP id 71dfb90a1353d-56fadb88baemr9569438e0c.3.1777038924615;
        Fri, 24 Apr 2026 06:55:24 -0700 (PDT)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com. [209.85.221.179])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56fa91ed4e1sm14663361e0c.6.2026.04.24.06.55.20
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 06:55:21 -0700 (PDT)
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-56d933b555cso2564526e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Apr 2026 06:55:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+uYxbWPPJsvmtDS9RH/2a6PlK+vRmeh2d3CkruzyV9pCizZ/tUpghHr24RjWoFiqx9ZphmQRXKMcDtKzyt1y8lMw==@vger.kernel.org
X-Received: by 2002:a05:6122:888b:b0:56f:adb8:7c54 with SMTP id
 71dfb90a1353d-56fadb88baemr9569375e0c.3.1777038919660; Fri, 24 Apr 2026
 06:55:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260310184030.3669330-1-cristian.marussi@arm.com>
 <20260310184030.3669330-9-cristian.marussi@arm.com> <WNCeTzosRbKm_zGsbSPx8w@collabora.com>
 <aetw1WcSCDxk11AV@pluto>
In-Reply-To: <aetw1WcSCDxk11AV@pluto>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 24 Apr 2026 15:55:08 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXYGRzq2j3z1io=kHj_QsWtJBirPhbZPa5bFBD7U9e0sw@mail.gmail.com>
X-Gm-Features: AQROBzDgUwf7y8JAYn7HmssU55ZLu_QWLKDdr6HYpgz_IN4dOPPU1wpFaeXKzVc
Message-ID: <CAMuHMdXYGRzq2j3z1io=kHj_QsWtJBirPhbZPa5bFBD7U9e0sw@mail.gmail.com>
Subject: Re: [PATCH v2 08/13] firmware: arm_scmi: Harden clock protocol initialization
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, arm-scmi@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	sudeep.holla@arm.com, philip.radford@arm.com, james.quinlan@broadcom.com, 
	f.fainelli@gmail.com, vincent.guittot@linaro.org, 
	etienne.carriere@foss.st.com, peng.fan@oss.nxp.com, michal.simek@amd.com, 
	dan.carpenter@linaro.org, geert+renesas@glider.be, 
	kuninori.morimoto.gx@renesas.com, marek.vasut+renesas@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: D0E7745FE6F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[collabora.com,vger.kernel.org,lists.infradead.org,arm.com,broadcom.com,gmail.com,linaro.org,foss.st.com,oss.nxp.com,amd.com,glider.be,renesas.com];
	TAGGED_FROM(0.00)[bounces-31643-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linux-m68k.org:email]

Hi Cristian,

On Fri, 24 Apr 2026 at 15:32, Cristian Marussi <cristian.marussi@arm.com> wrote:
> On Fri, Apr 24, 2026 at 02:07:59PM +0200, Nicolas Frattaroli wrote:
> > On Tuesday, 10 March 2026 19:40:25 Central European Summer Time Cristian Marussi wrote:
> > > Add proper error handling on failure to enumerate clocks features or
> > > rates.

> > > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> > > ---
> > >  drivers/firmware/arm_scmi/clock.c | 22 ++++++++++++++++------
> > >  1 file changed, 16 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/drivers/firmware/arm_scmi/clock.c b/drivers/firmware/arm_scmi/clock.c
> > > index c9b62edce4fd..bf956305a8fe 100644
> > > --- a/drivers/firmware/arm_scmi/clock.c
> > > +++ b/drivers/firmware/arm_scmi/clock.c
> > > @@ -402,10 +402,16 @@ static int scmi_clock_attributes_get(const struct scmi_protocol_handle *ph,
> > >                 SUPPORTS_RATE_CHANGE_REQUESTED_NOTIF(attributes))
> > >                     clk->rate_change_requested_notifications = true;
> > >             if (PROTOCOL_REV_MAJOR(ph->version) >= 0x3) {
> > > -                   if (SUPPORTS_PARENT_CLOCK(attributes))
> > > -                           scmi_clock_possible_parents(ph, clk_id, cinfo);
> > > -                   if (SUPPORTS_GET_PERMISSIONS(attributes))
> > > -                           scmi_clock_get_permissions(ph, clk_id, clk);
> > > +                   if (SUPPORTS_PARENT_CLOCK(attributes)) {
> > > +                           ret = scmi_clock_possible_parents(ph, clk_id, cinfo);
> > > +                           if (ret)
> > > +                                   return ret;
> > > +                   }
> > > +                   if (SUPPORTS_GET_PERMISSIONS(attributes)) {
> > > +                           ret = scmi_clock_get_permissions(ph, clk_id, clk);
> > > +                           if (ret)
> > > +                                   return ret;
> > > +                   }
> > >                     if (SUPPORTS_EXTENDED_CONFIG(attributes))
> > >                             clk->extended_config = true;
> > >             }
> > > @@ -1143,8 +1149,12 @@ static int scmi_clock_protocol_init(const struct scmi_protocol_handle *ph)
> > >     for (clkid = 0; clkid < cinfo->num_clocks; clkid++) {
> > >             cinfo->clkds[clkid].id = clkid;
> > >             ret = scmi_clock_attributes_get(ph, clkid, cinfo);
> > > -           if (!ret)
> > > -                   scmi_clock_describe_rates_get(ph, clkid, cinfo);
> > > +           if (ret)
> > > +                   return ret;
> > > +
> > > +           ret = scmi_clock_describe_rates_get(ph, clkid, cinfo);
> > > +           if (ret)
> > > +                   return ret;
> > >     }
> > >
> > >     if (PROTOCOL_REV_MAJOR(ph->version) >= 0x3) {
> > >
> >
> > I see that a quirk is being added for this, but I thought I should chime
> > in with my opinion for future approaches in this direction.
> >
> > I don't see how this hardens anything. All this does is break platforms
> > that were previously working by returning early. At most, this should
>
> Certainly the naming in the subject was chosen badly (by me!)...indeed it
> should be more something like "Enforce strict protocol compliance",
> because at the end all of the broken platforms really run a slighly odd
> out of spec SCMI firmware that does NOT implement one or more of the SCMI
> mandatory command...
>
> > be a warning (as in not WARN but pr_warn/dev_warn/...). If firmware
> > returns nonsense, a clock driver should imho try its best to work
> > around the nonsense in a safe way, because the alternative is that
> > a major part of the system (and thus likely the entire system) no
>
> ..well yes we definitely dont want to break deployed platforms BUT also
> we dont want to legalize this kind of out of spec behaviour in future
> firmwares...hence (a number ?) of quirks an FW_BUG warns probably to
> let already broken deployed platforms survive while discouraging such
> implementation in future fw implementations...
>
> These firmware most certainly wont pass the SCMI compliance test suite [1],
> which indeed we do not mandate, but the reason these bugs happened is
> exactly because the kernel SCMI stack was buggy and left that door open...
>
> More specifically these kind of out-of-spec behaviours are not really just
> a matter being 'picky', the problem is that any resource set in any
> SCMI protocol is defined by the spec such as to be described by a
> contiguos set of IDs and the drivers are designed anyway under that
> assumption from the allocation point of view, so allowing a clock ID to
> just fail one of the mandatory commands and skip a domain would jeopardize
> all of this and, even if clearly is NOT a problem here, seems a fragile
> assumption.

How can you have all of:
  1. a contiguous list of IDs,
  2. implement all mandatory commands,
  2. restrict the use of some clocks to a subset of the agents in the system?
Use a different list of IDs for each agent?
What if a mistake was made, and a clock was exposed to an agent by
accident?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

