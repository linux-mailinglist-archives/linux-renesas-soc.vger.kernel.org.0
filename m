Return-Path: <linux-renesas-soc+bounces-29226-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SPHiOJCfsWnkDAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29226-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 18:00:00 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 617C9267A33
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 18:00:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 523B83002E40
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 16:59:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75AD226A08A;
	Wed, 11 Mar 2026 16:59:57 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4094033D4FA
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Mar 2026 16:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773248397; cv=none; b=Ju8YOeQxEH1buu/seps8dMzh623J0zJ3JgupTYcOaBKbGrNWVexFRMrM2PG7Ld3eAHTZIuPVJlTn6K8QhOS10bgsX5nR7zY8d5lcfShHsgCuL85IbudRv1HUfKFg7ASnQ9TTKIRYUiSLlAxvfmnn0GBSL9l9Q3206stbHsqCF9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773248397; c=relaxed/simple;
	bh=3dMJxR9TjCJ9S3Lg7LcRJbtat+eyZPt3SNqC/m6FxkM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iV8/mCswmx0+3WIj3c7Bd7Zy/7ctQCMV5w2ME21ECfhtIQDqr/pfuWN3CVL2bZBHVkIreBx1GTcPMwtsLiaZeMp1Mfb7n1skN2Pm8F+LV1fBLXgIfT/hKF0BYu8VmacCkO5iun5cr6DczCjkmq7g38jZsMjjh7jW8slMjdyrqcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-56afff51694so79046e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Mar 2026 09:59:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773248395; x=1773853195;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MHqYyMyxNQscHKqebkYfjh9WcEHBmwP9uSBnn8fEJDk=;
        b=uv6zuGpwH7YCUl0HiIyuF4GOLhQsq+bSe/+MPjTcb+WQzX9UHzLks3PsqHaAKuZKdB
         0iq7bWKxlA6hebxAiaORk3p9ju/CLyMZiOoizo97ZNM7oknyiXUeE3xiLpf75LP7CBQP
         x2Dh8dJIp9jgYnr1UW6AzA1EYvGif2Hpswy+7y/Bd4BPDpg9V6XoRYrZi7Tbpcz+rKjD
         AfAWjYq6K4SY6nh5QnWRZhiEZ70QYIU/mDxZP7VHoF6bQ1BLJMJvW/8klkVK1ooMgB9t
         hYtNIlTVIQEDfn3+X2gY0ABiFijC4ujwkXiHBeBs8/9W0T7ghTPe8CSvi+ibdlG9sfXe
         tLLw==
X-Forwarded-Encrypted: i=1; AJvYcCUHsnK+kvy8S4xbCxZLbIcavXWI7bKtG9+I9nDQ8iFo0GUd4sQasYOf8PUpWRmaoyDh/Qy6nw50PaGJlhfAQLXSzQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2sUFO8JQdtMtJmoW5SBHriRqYNUYdH7pP8mO/cyDpE2p2FT1g
	taFAoOtpghPdzuvFy13kJ9VZ7RuKVAHB1Alw4tkVEzKlXVPl0coMXjrcfGaP8fiK9pc=
X-Gm-Gg: ATEYQzxk5z9KkW8bn+ZxGaFan/8cORN6TvBZPQgYSsHTjjnypsIebtWKrZBg3UNjHPM
	rO7OittQ/4/+R/0ivCiRmef2bsO8bFakJBupRsPUq9uv6+ZMcdWAWq98T2LlkP1n6b5mc8pOPRI
	IeYVTOLCEWI0mAffhmUD5GSG2Lve5GJyVclIQNkdBK7PgcTaZLsa64bS0KPHQUbGc1tMQKd3I+S
	P9xf4bzCssabSfMl+KXWdcv4dUdWhfoyY7723mVa1xG6rt22bcUwctK8lwhoNMY6tCBv0Ve9SXD
	HeICz8LWRb1T8/dAusK1/SITKqdIbURzpmiF2xEY46ISkfo/IwO0ohoefDmTIv8DkGTug9l17iX
	8JtV+B0uRnytd/DO13SYcdJSJu+psRg7sSrDaKM1PrJUe3EzjwAXnNVpg+1w0cCjbk7MG00s5KQ
	tyICF0wdDZecVB72gl99pCtPHRoouMWjbt7uq0V6qI80PfLXKOlWNaUj0+z1AN
X-Received: by 2002:a05:6122:29cd:b0:563:80e6:3b76 with SMTP id 71dfb90a1353d-56b474749d0mr1099865e0c.7.1773248395242;
        Wed, 11 Mar 2026 09:59:55 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56b4649c813sm1201094e0c.15.2026.03.11.09.59.54
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 09:59:54 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-94dea0e029fso9746241.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Mar 2026 09:59:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVpn1Q8PM9a4maiGzvLuc7DD20xuS+6zjWwm4n90HwzuPf+1gjHvD9TKECInLQNuv1mgvGK+sMnntzeEZsZ+jQq+Q==@vger.kernel.org
X-Received: by 2002:a05:6102:e0c:b0:5ff:a16b:93f8 with SMTP id
 ada2fe7eead31-601deaf0a5cmr1083265137.6.1773248394584; Wed, 11 Mar 2026
 09:59:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260310184030.3669330-1-cristian.marussi@arm.com> <20260310184030.3669330-9-cristian.marussi@arm.com>
In-Reply-To: <20260310184030.3669330-9-cristian.marussi@arm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 11 Mar 2026 17:59:43 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUdqrA9kYeDpjwj-y6-4aALkAi2g2Od81Kxh-EVW2e2Nw@mail.gmail.com>
X-Gm-Features: AaiRm52tcdDuztFkx9k48Wz50kutFch70oo-cU-eA7FFMTwppL_ACNeUC0TZgzs
Message-ID: <CAMuHMdUdqrA9kYeDpjwj-y6-4aALkAi2g2Od81Kxh-EVW2e2Nw@mail.gmail.com>
Subject: Re: [PATCH v2 08/13] firmware: arm_scmi: Harden clock protocol initialization
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	arm-scmi@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, sudeep.holla@arm.com, 
	philip.radford@arm.com, james.quinlan@broadcom.com, f.fainelli@gmail.com, 
	vincent.guittot@linaro.org, etienne.carriere@foss.st.com, 
	peng.fan@oss.nxp.com, michal.simek@amd.com, dan.carpenter@linaro.org, 
	geert+renesas@glider.be, kuninori.morimoto.gx@renesas.com, 
	marek.vasut+renesas@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,arm.com,broadcom.com,gmail.com,linaro.org,foss.st.com,oss.nxp.com,amd.com,glider.be,renesas.com];
	TAGGED_FROM(0.00)[bounces-29226-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,arm.com:email,linux-m68k.org:email]
X-Rspamd-Queue-Id: 617C9267A33
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Cristian,

On Tue, 10 Mar 2026 at 19:56, Cristian Marussi <cristian.marussi@arm.com> wrote:
> Add proper error handling on failure to enumerate clocks features or
> rates.
>
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

Thanks for your patch!

> --- a/drivers/firmware/arm_scmi/clock.c
> +++ b/drivers/firmware/arm_scmi/clock.c

> @@ -1143,8 +1149,12 @@ static int scmi_clock_protocol_init(const struct scmi_protocol_handle *ph)
>         for (clkid = 0; clkid < cinfo->num_clocks; clkid++) {
>                 cinfo->clkds[clkid].id = clkid;
>                 ret = scmi_clock_attributes_get(ph, clkid, cinfo);
> -               if (!ret)
> -                       scmi_clock_describe_rates_get(ph, clkid, cinfo);
> +               if (ret)
> +                       return ret;

This change breaks R-Car X5H with SCP FW SDKv4.28.0, as some clocks
do not support the SCMI CLOCK_ATTRIBUTES command.
Before, these clocks were still instantiated, but were further unusable.
After, the whole clock driver fails to initialize, and no SCMI clocks
are available at all.

> +
> +               ret = scmi_clock_describe_rates_get(ph, clkid, cinfo);
> +               if (ret)
> +                       return ret;
>         }
>
>         if (PROTOCOL_REV_MAJOR(ph->version) >= 0x3) {

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

