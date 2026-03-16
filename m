Return-Path: <linux-renesas-soc+bounces-29509-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yGXcDqwouGnhZgEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29509-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 16:58:36 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA0429CDCF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 16:58:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 09E8830C451E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 15:51:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0720D3B3C06;
	Mon, 16 Mar 2026 15:50:38 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B51693B38B7
	for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Mar 2026 15:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773676237; cv=none; b=aEj3t8MCfIMoqpLFf/IY0X2Bph2PdMGm8QYMR6Osp7N90hlA1BHhSVKKl8YM4fdK4qZb/BI9BFg/DKUOdbD13naBUsCN7afo47gid5oX1zw6yOW28leRMj7IPNJyJPF0nuMaQrU/NlIJjuhIweIzFChRG9efAJlj8b3WW38R9OY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773676237; c=relaxed/simple;
	bh=b8GE4QZEzUOI/sCp5v2olWVKdWQuMuH1Ks+9LBxnb2U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QtbvRgxLA7iaqF9/POviWoqQN35iuyC/iPgvaiJCkmNq7JMj+3xw5USjDMji0YAz+Q3x56LSpPIcTze0tR0btWUaM0Q/f4GjoXhllHqgKDLbMDDy2ll4wXe0Zdz/MAtEc+5xK8KURBjbw7CdkTIU/SiohyfQITlMnXbYcOk60W8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-56a9c5cb48bso1908597e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Mar 2026 08:50:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773676231; x=1774281031;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nMV00VBJWKkaqpEtH1LAiLdHckZZ6qshJN4iQQpaP6g=;
        b=am+2xOxZqhrE5SL9f9BGeSDijmk+OD/dxNHpNeAlWAksuZh2KdwSCLsKK+SxAmvybm
         vGFmvgTx1JV7iIaidmxakn7WUGY4vCOdnOM/7+zrq/wQVIm1f3w4gH/WOO008Z1vOUhZ
         XW3D/hC6wPxWxHE+U2XADkUgqUBcN1m9peTZN5fsP412Qc1nTDumI3VZtWNq7rfqInQs
         3HT73345eL2/pJ2aeVNbyKN40ot9+UEv3VHRGwx4rjoUt8DYSzcLLFQUzCnl72beKHMZ
         68vyYQvI4VPISmy+NG+uZYKqvQRjJF/FvvXDBgERhmyCP+ut3c5a+xzR2zmu5K9cFHED
         ClJg==
X-Forwarded-Encrypted: i=1; AJvYcCUcrZmycalgqihLrY0OFNH+IUGtRXT6iJfGLSXpqaDoOtcBRWHgNx6ypZNnmnmRLNL2jLN26u7YF1TvcCP60pFZZA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzwIGZVh4Y1AlsalCKXJs16gNc8KCBSC9HE4U1kCnAQXNtEd/Xx
	XxMkpxcwcMs5uEtVMje3e5kxR1e0lVG1q7/aMAFIxX6IjZlXF/VZV/q3JRUq7vW8
X-Gm-Gg: ATEYQzwsiIeZGU85qqxM9gAdyDaROA6aGENe8940ScFPfRjth/Z54OlRXy1uARCZOzr
	ToH64oGB3bYCQP2vQO253ezTBXFcLt4Oc88vCznHc7k4L7NW45W5pGjsYqaPOphI/5bQW841C94
	0EnrLWGgvO3v3Y/+tJymcZr3kylUpM5UPMRPVqXWpohD+GM+Lhjbg9Ke+DWnaCldVsaEy6Hwd+X
	7aRWdjTI8AJVaCh/BLMwWh+Fq2BwNSrpeJ/K+iMVPTBIcP4CxZpNDrar1t6OQQfc6XPVLyfiNkL
	OQ6UASFqfwN+OrtzkiWl4qira9ewwz75Y1ZECLS3cslTaeDbjhTwfel7ecUivv2/xsKfRa/eorP
	wIrrqSsXbEjiUqmzpGHhHHG5KTg00dh7wtk9w9zX4OrKwRuVwPmbauHVTEjsy3/ZPP5Z6tBjTv4
	66HDtQXjmOpsZPZzzTK0UjyPhee4R3sqEel3qdQKzwoNvA8SbrzOKkNo31GNBF
X-Received: by 2002:a05:6122:e18d:b0:56b:8023:b86e with SMTP id 71dfb90a1353d-56b8023bfc6mr2382290e0c.11.1773676231349;
        Mon, 16 Mar 2026 08:50:31 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56b7e7623e3sm2650126e0c.7.2026.03.16.08.50.30
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 08:50:30 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-5ffd76e4c89so866120137.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Mar 2026 08:50:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXc55fYSWhsc/lxLPMy5bjpC7tzb1nC0Jy+/lHrS7rwO6Pkq4nZixx6bQ7v7aTqbCBV/QB3pi+DMuio/j14wvWlow==@vger.kernel.org
X-Received: by 2002:a05:6102:d87:b0:5e8:1d93:921a with SMTP id
 ada2fe7eead31-6020e2823b8mr5534337137.15.1773676230555; Mon, 16 Mar 2026
 08:50:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260310184030.3669330-1-cristian.marussi@arm.com>
 <20260310184030.3669330-9-cristian.marussi@arm.com> <CAMuHMdUdqrA9kYeDpjwj-y6-4aALkAi2g2Od81Kxh-EVW2e2Nw@mail.gmail.com>
 <abG4VfyB2C-gBa5Q@pluto> <20260312-classy-misty-platypus-5baea1@sudeepholla> <abLrm7x8ggzAhYOg@pluto>
In-Reply-To: <abLrm7x8ggzAhYOg@pluto>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 16 Mar 2026 16:50:17 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVWL4rVTPnsMofPKFKCozjCPqF0K95ZFmrdrBD8EUt22A@mail.gmail.com>
X-Gm-Features: AaiRm50iTDhKDonU-J5qpw3zzDb9304AIvkxbNozshzVrNKZQ64ZXXeHYUSrWsA
Message-ID: <CAMuHMdVWL4rVTPnsMofPKFKCozjCPqF0K95ZFmrdrBD8EUt22A@mail.gmail.com>
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
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,lists.infradead.org,arm.com,broadcom.com,gmail.com,linaro.org,foss.st.com,oss.nxp.com,amd.com,glider.be,renesas.com];
	TAGGED_FROM(0.00)[bounces-29509-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.788];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,linux-m68k.org:email,arm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7CA0429CDCF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Cristian,

On Thu, 12 Mar 2026 at 17:36, Cristian Marussi <cristian.marussi@arm.com> wrote:
> On Thu, Mar 12, 2026 at 03:33:52PM +0000, Sudeep Holla wrote:
> > On Wed, Mar 11, 2026 at 06:45:41PM +0000, Cristian Marussi wrote:
> > > On Wed, Mar 11, 2026 at 05:59:43PM +0100, Geert Uytterhoeven wrote:
> > > > Hi Cristian,
> > > >
> > > > On Tue, 10 Mar 2026 at 19:56, Cristian Marussi <cristian.marussi@arm.com> wrote:
> > > > > Add proper error handling on failure to enumerate clocks features or
> > > > > rates.
> > > > >
> > > > > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> > >
> > > > > --- a/drivers/firmware/arm_scmi/clock.c
> > > > > +++ b/drivers/firmware/arm_scmi/clock.c
> > > >
> > > > > @@ -1143,8 +1149,12 @@ static int scmi_clock_protocol_init(const struct scmi_protocol_handle *ph)
> > > > >         for (clkid = 0; clkid < cinfo->num_clocks; clkid++) {
> > > > >                 cinfo->clkds[clkid].id = clkid;
> > > > >                 ret = scmi_clock_attributes_get(ph, clkid, cinfo);
> > > > > -               if (!ret)
> > > > > -                       scmi_clock_describe_rates_get(ph, clkid, cinfo);
> > > > > +               if (ret)
> > > > > +                       return ret;
> > > >
> > > > This change breaks R-Car X5H with SCP FW SDKv4.28.0, as some clocks
> > > > do not support the SCMI CLOCK_ATTRIBUTES command.

Apparently it is not just CLOCK_ATTRIBUTES, but also
CLOCK_DESCRIBE_RATES.

> > > > Before, these clocks were still instantiated, but were further unusable.
> > > > After, the whole clock driver fails to initialize, and no SCMI clocks
> > > > are available at all.
> > >
> > > ...and this is exactly what I feared while doing this sort of hardening :P
> > >
> > > So there are a few possible solutions (beside reverting this straight away)
> > >
> > > The easy fix would be instead change the above in a
> > >
> > >     if (ret)
> > >             continue;
> > >
> > > ...with a bit of annoying accompanying FW_BUG logs, of course, to cause future
> > > FW releases to fix this :D
> > >
> > > Another option could be leave it as it is, since indeed it is the correct enforced
> > > behaviour, being CLOCK_ATTRIBUTES a mandatory command, BUT add on top an ad-hoc SCMI
> > > quirk targeting the affected FW releases...
> > >
> > > This latter option, though, while enforcing the correct behaviour AND
> > > fixing your R-Car issue, leaves open the door for a number of possible
> > > failures of other unknowingly buggy Vendors similarly deployed firmwares...
> > >
> > > ...that could be solved with more quirks of course...but...worth it ?
> > >
> > > Thoughts ?
> > >
> > > Let's see also what @Sudeep thinks about this...
> >
> > I prefer to fix it as a quirk to prevent similar issues on newer platforms if
> > the firmware baselines are derived from it. In the worst case, we can relax
> > the hardening until we figure out a proper quirk-based solution.
>
> Ok, I can post a V3 with a dummy quirk 'template' RFC to be filled by
> Geert with proper versioning....so I can check that there are no
> surprises round the (quirked) corner...

Unfortunately you cannot "continue" from a quirk, without resorting
to a goto, so I sent a fix: "[PATCH] firmware: arm_scmi: Support loop
control in quirk code snippets"[1].

Then I came up with the following preliminary (have to check more
firmware versions) quirk (Gmail whitespace-damaged):

diff --git a/drivers/firmware/arm_scmi/clock.c
b/drivers/firmware/arm_scmi/clock.c
index f62f9492bd42afbc..6f2af6e9084836c6 100644
--- a/drivers/firmware/arm_scmi/clock.c
+++ b/drivers/firmware/arm_scmi/clock.c
@@ -1230,6 +1230,18 @@ static const struct scmi_protocol_events
clk_protocol_events = {
        .num_events = ARRAY_SIZE(clk_events),
 };

+#define QUIRK_RCAR_X5H_NO_ATTRIBUTES                                   \
+       ({                                                              \
+               if (ret == -EREMOTEIO || ret == -EOPNOTSUPP)            \
+                       continue;                                       \
+       })
+
+#define QUIRK_RCAR_X5H_NO_RATES
         \
+       ({                                                              \
+               if (ret == -EOPNOTSUPP)                                 \
+                       ret = 0;                                        \
+       })
+
 static int scmi_clock_protocol_init(const struct scmi_protocol_handle *ph)
 {
        int clkid, ret;
@@ -1254,10 +1266,12 @@ static int scmi_clock_protocol_init(const
struct scmi_protocol_handle *ph)
        for (clkid = 0; clkid < cinfo->num_clocks; clkid++) {
                cinfo->clkds[clkid].id = clkid;
                ret = scmi_clock_attributes_get(ph, clkid, cinfo);
+               SCMI_QUIRK(clock_rcar_x5h_no_attributes,
QUIRK_RCAR_X5H_NO_ATTRIBUTES);
                if (ret)
                        return ret;

                ret = scmi_clock_describe_rates_get(ph, clkid, cinfo);
+               SCMI_QUIRK(clock_rcar_x5h_no_attributes,
QUIRK_RCAR_X5H_NO_RATES);
                if (ret)
                        return ret;
        }
diff --git a/drivers/firmware/arm_scmi/quirks.c
b/drivers/firmware/arm_scmi/quirks.c
index 3772139a758c8a78..5a69f119e1b6c806 100644
--- a/drivers/firmware/arm_scmi/quirks.c
+++ b/drivers/firmware/arm_scmi/quirks.c
@@ -172,6 +172,8 @@ struct scmi_quirk {
 /* Global Quirks Definitions */
 DEFINE_SCMI_QUIRK(clock_rates_triplet_out_of_spec, NULL, NULL, NULL);
 DEFINE_SCMI_QUIRK(perf_level_get_fc_force, "Qualcomm", NULL, "0x20000-");
+DEFINE_SCMI_QUIRK(clock_rcar_x5h_no_attributes, "Renesas", NULL, "0x10a0000",
+                 "renesas,r8a78000");

 /*
  * Quirks Pointers Array
@@ -182,6 +184,7 @@ DEFINE_SCMI_QUIRK(perf_level_get_fc_force,
"Qualcomm", NULL, "0x20000-");
 static struct scmi_quirk *scmi_quirks_table[] = {
        __DECLARE_SCMI_QUIRK_ENTRY(clock_rates_triplet_out_of_spec),
        __DECLARE_SCMI_QUIRK_ENTRY(perf_level_get_fc_force),
+       __DECLARE_SCMI_QUIRK_ENTRY(clock_rcar_x5h_no_attributes),
        NULL
 };

diff --git a/drivers/firmware/arm_scmi/quirks.h
b/drivers/firmware/arm_scmi/quirks.h
index 74bf6406dd043049..13f28d13bbd74d4c 100644
--- a/drivers/firmware/arm_scmi/quirks.h
+++ b/drivers/firmware/arm_scmi/quirks.h
@@ -48,5 +48,6 @@ static inline void scmi_quirks_enable(struct device
*dev, const char *vend,
 /* Quirk delarations */
 DECLARE_SCMI_QUIRK(clock_rates_triplet_out_of_spec);
 DECLARE_SCMI_QUIRK(perf_level_get_fc_force);
+DECLARE_SCMI_QUIRK(clock_rcar_x5h_no_attributes);

 #endif /* _SCMI_QUIRKS_H */

Does that look like what you have in mind?
Thanks!

[1] https://lore.kernel.org/51de914cddef8fa86c2e7dd5397e5df759c45464.1773675224.git.geert+renesas@glider.be/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

