Return-Path: <linux-renesas-soc+bounces-32067-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8AqYCIDc+WkwEwMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32067-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 14:03:12 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B7B4CD2A3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 14:03:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 382773000B88
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 May 2026 11:57:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFF8F3988E8;
	Tue,  5 May 2026 11:57:19 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2836B346E74
	for <linux-renesas-soc@vger.kernel.org>; Tue,  5 May 2026 11:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777982239; cv=none; b=gXFVzkzLyJBG0PJMTbEoCkj2YNDUu6jbztbK5mc+R5iAIvzylddMGMo5GkljTxrTQZx1+lid0faRWM0LNQbkBpl8DUWMlWxuuAASbKw5uuH8WJd70vQJ/wmdydzutMtiRH73qOKsPmsdljJ42JdczlEOc2IIaQhZE33k9GVfEs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777982239; c=relaxed/simple;
	bh=6qmJB7Ugs0YgAfkUvBE9SVyIpJgfeZTTcqGmgTZ2Vr8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jZaCy6Ju0XoERtNfO32X7dSnLOBkUSDXqd24N7N5PxyMJA+4GP6YdnSPi6Nu6odnwrQjX7Y+va2ayLB7kNdkTvCNW1cDL8Gg5PUosV8dD8X/g4liE67wIf4vZCGmBFp7xPacxs8MhDY0Cx3oC9t319eQVJiMlAZsI9hz/HyVa+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-62f31e86bfbso1313245137.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 05 May 2026 04:57:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777982237; x=1778587037;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1WSn3Gp8++tbsczQV3o+avsi3Hm1AnDhWAFzNoHqmYE=;
        b=SCWa6/NvYcipsuLE8f7fpJi+I0KLfME0SCqv9hgFpTieRlW74emcMneaPSNJCWEpui
         Me5ZrcaskZ67S8RunRNMmOc8fAg6YQZVlF4iuJiJxqPGLmsHQjXiUFpx0hJZpvaHHV3m
         GcMwjbkO6pYGoCyFZJZGJGENeJWotRVkGrQ6yiTlgxiQh7+Qkn1y6XMbWeNBh15xbaf6
         +QuqiHQi6FWyHfAaNfHOJN5o7f2q7fSBOPvPRl6dMBGXAPEP4ZP8KFU4Hs4yJ/Nb+KZG
         F2EFdHbzKroqsaw0sN2aJNMsjMDrAnoj/sOURSFjvjgKvBFdKB5cVmSCmxkXGWi1UR2l
         Rgyw==
X-Forwarded-Encrypted: i=1; AFNElJ/Q6AceYojlU8ztOvYm0LXl1poNmbTE0V4CzG+y7iocZzgmO2hpKLXiZstGznaMNfF1kOrZu+J3kyUl3+5LX/s7RQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMmT/iqsGHHIIVSVi0+J0X9T9bze5AYqKRxVPKl2GhVBpcinX5
	M41Ofs7I9u26NlKzj2r27DfzLSgkzPMFwj4mnfc0pOjR8Hsm7DHhSPPCSe45BaQK
X-Gm-Gg: AeBDiesOiWnrAh2slZmSFdu4pJlG+KbKJX5/a/xLyv6YYvrFsfBXoxXiRcu+3MbxaRS
	T1nF3M3yD3SoSbzNGgXAQUcWQWwXQQAd6DDhJvv/8sAAfOb58dFkgd/vCei5S7vNr9MXkZcJLWl
	/XK3iZvdHRa7xr1LCkI90w7MgW1gDQExjGpFBPoZfaAlFt0eprPMlGR1mrMNkaGDk+I9K4SkAZ/
	9CXUSvZ46hMwKGI3Ett++dMGKCpr5XTezo8yb/Ms7fqv87Sc6lwRHsBBqqMjV9bL9zWZd2ayqD0
	G90G9YCrdpEhzNGdJIvSxonmYSYyV0qnxZzqpX8AVDk3lZCHNE50EUkQ7jp2iZo6prhWrnVev/s
	q6NtPsDd+Knhi2vllqDiKJmVQvllEyYA1AKc1pdnJ+tynJoMmzidesad0+DVNK9kdMMIsX+0HKA
	5vRaq5w+A/lolL5xG+u7kegADZux3nPExcFzDyHK6NpaWqAW9qlBr2HoX675BIgYuBJwbWdbU=
X-Received: by 2002:a05:6102:390c:b0:605:6468:bc86 with SMTP id ada2fe7eead31-62f55592c45mr1260088137.0.1777982236979;
        Tue, 05 May 2026 04:57:16 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-62bfd8b5aeesm7048943137.7.2026.05.05.04.57.16
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 04:57:16 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-95ce0cf2d4bso2364434241.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 05 May 2026 04:57:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/N/DXQVlikYs+QlInUvN2DdVgMZ87APiWmswuH3qHcWdDG1pe/fFBrTKhOPHY53QLO45n44m4RWvTUCmhsCOh5/g==@vger.kernel.org
X-Received: by 2002:a05:6102:d8a:b0:607:d68f:d0f6 with SMTP id
 ada2fe7eead31-62f55a492fdmr1354982137.20.1777982236245; Tue, 05 May 2026
 04:57:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260428201522.903875-1-cristian.marussi@arm.com>
 <20260428201522.903875-14-cristian.marussi@arm.com> <CAMuHMdXtH=4J7bDGAk8xoxNDYRsHSRDReVNU_PpUnUDfU=afpw@mail.gmail.com>
In-Reply-To: <CAMuHMdXtH=4J7bDGAk8xoxNDYRsHSRDReVNU_PpUnUDfU=afpw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 5 May 2026 13:57:03 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUG9cTH+WFAHymHeBrPK1vsE5XCJeWOxqF22efc_omMhw@mail.gmail.com>
X-Gm-Features: AVHnY4Lq3Zggrs4Qv91iMEofghVqKQUPPKW-R1C9WbhWCH-RGMfKoh_-yjYR4Ms
Message-ID: <CAMuHMdUG9cTH+WFAHymHeBrPK1vsE5XCJeWOxqF22efc_omMhw@mail.gmail.com>
Subject: Re: [PATCH v3 13/15] firmware: arm_scmi: Use bound iterators to
 minimize discovered rates
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	arm-scmi@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, sudeep.holla@arm.com, 
	philip.radford@arm.com, james.quinlan@broadcom.com, f.fainelli@gmail.com, 
	vincent.guittot@linaro.org, etienne.carriere@foss.st.com, 
	peng.fan@oss.nxp.com, michal.simek@amd.com, kuninori.morimoto.gx@renesas.com, 
	marek.vasut+renesas@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 08B7B4CD2A3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,arm.com,broadcom.com,gmail.com,linaro.org,foss.st.com,oss.nxp.com,amd.com,renesas.com];
	TAGGED_FROM(0.00)[bounces-32067-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.958];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,mail.gmail.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

On Tue, 5 May 2026 at 11:59, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Tue, 28 Apr 2026 at 22:17, Cristian Marussi <cristian.marussi@arm.com> wrote:
> > Clock rates are guaranteed to be returned in ascending order for SCMI clock
> > protocol versions greater than 1.0: in such a case, use bounded iterators
> > to minimize the number of message exchanges needed to discover min and max
> > rate.
> >
> > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
>
> Thanks for your patch!
>
> > +static int
> > +scmi_clock_describe_rates_get(const struct scmi_protocol_handle *ph,
> > +                             u32 clk_id, struct clock_info *cinfo)
> > +{
> > +       struct scmi_clock_desc *clkd = &cinfo->clkds[clk_id];
> > +       int ret;
> > +
> > +       /*
> > +        * Since only after SCMI Clock v1.0 the returned rates are guaranteed to
> > +        * be discovered in ascending order, lazy enumeration cannot be use for
> > +        * SCMI Clock v1.0 protocol.
> > +        */
> > +       if (PROTOCOL_REV_MAJOR(ph->version) > 0x1)
> > +               ret = scmi_clock_describe_rates_get_lazy(ph, clkd);
> > +       else
> > +               ret = scmi_clock_describe_rates_get_full(ph, clkd);
> > +
> > +       if (ret)
> > +               return ret;
> > +
> > +       clkd->info.min_rate = clkd->rates[RATE_MIN];
> >         if (!clkd->rate_discrete) {
> >                 clkd->info.max_rate = clkd->rates[RATE_MAX];
> >                 dev_dbg(ph->dev, "Min %llu Max %llu Step %llu Hz\n",
> >                         clkd->rates[RATE_MIN], clkd->rates[RATE_MAX],
> >                         clkd->rates[RATE_STEP]);
> >         } else {
> > -               sort(clkd->rates, clkd->num_rates,
> > -                    sizeof(clkd->rates[0]), rate_cmp_func, NULL);
> >                 clkd->info.max_rate = clkd->rates[clkd->num_rates - 1];
> > +               dev_dbg(ph->dev, "Clock:%s DISCRETE:%d -> Min %llu Max %llu\n",
> > +                       clkd->info.name, clkd->rate_discrete,
> > +                       clkd->info.min_rate, clkd->info.max_rate);
>
> Printing clkd->rate_discrete is futile, as it is always 1.
> It would be more useful to print clkd->r.num_rates instead, although

clkd->tot_rates (sorry, my local tree still had your v2)

> that may still be lower than the actual value, due to lazy handling.

clkd->tot_rates is the actual value, so there is no such issue.

>
> >         }
> > -       clkd->info.min_rate = clkd->rates[RATE_MIN];
> >
> >         return 0;
> >  }

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

