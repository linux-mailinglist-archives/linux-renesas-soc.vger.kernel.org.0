Return-Path: <linux-renesas-soc+bounces-32060-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qGnlJtrG+WkwEAMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32060-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 12:30:50 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F13DF4CB58F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 12:30:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1C0A931F11BA
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 May 2026 10:20:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B85C35F17D;
	Tue,  5 May 2026 10:08:04 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEE9333B6DF
	for <linux-renesas-soc@vger.kernel.org>; Tue,  5 May 2026 10:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777975683; cv=none; b=vAD6gb5wooCkhCPS4Jyn1Q9KZUklvwMBb5a8NtIY9zVYda1Hr9vWRrARznWPI6BP7ih7isteU91ifascBzAPWhT2O9pVKEnZBCIQVVbhmMEesfLJVasmq1eHY3qAyjrgsqpqGl1zqN5HCyci+RYWcI+5+5agOU9KLzyhe3qCqiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777975683; c=relaxed/simple;
	bh=Iqxgz7zIZ5MLQToUPdhTKIGhc6pvVg0Zo/Agn5ekWxw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nICrIxGLQ2Df9zdOUesVMwPZe++2eq+psM253GgyfKtz/kUKvtQXHXclO+jdPy9YgAh+Zi0CBO5/oMtDPsq4pb56dhCfZrO/VKyFJn2D3Xww4svs53nmzLyeXhxh16T3UcoYMF2LPcsJO8WWCXt5BegOY0xJBAqBL6JLTTHX3l4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-8ef5776530bso576968185a.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 05 May 2026 03:08:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777975679; x=1778580479;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wuHpybwjKLKCiao/+mTwUndwe61THQbcI6j1mq+muAs=;
        b=mgN9pH8eeGBRFaJVMXlW5wagH81qlxIAu3mp/Rvn+Pvlaz6Ud1fVrSqweaSSWxrzai
         /Ckm693Ez1N27+1QElEqcrqRn+pc3wR8Kljv6rE7V38RCGFBzKKRvqb5+F+oupEOw1Wa
         SNCbvikSqAdXJ4klqKg9UdO2TkX/bPNrDeSFOBsY5YJ5hSAFdGeGV1CHVB9BXdiS/YkY
         LdbK58cmGiyd5NIVbDb+kMsKohm4bOFoz0gqYtvmmrNXMkaiGdDsU7ZoKoPir9oW8rdo
         xZ8SO1Uujb8l6Dp83yGL4FCFqlf891zwCSpBxvKlBo+J3lUQjfA0lMaLKxOuG8gxcjyN
         GaPg==
X-Forwarded-Encrypted: i=1; AFNElJ8oQuXworVZMf6aFeSrnxme+1dgt59ZoUlCsiPazdXZFP381SgKN44o/hUaXYU4/poxHhyNvg+wWJkVQju1EIX7jQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzwB9Xaf1ndhrslmipjy9nVbQAQg8aha9qXLL98aEShDTqOptc4
	PFuqMSaZQsWTnOvf9RuS4HV1wGHk9TfNZQL6uJYvQVXF/0qRyE2S6T9mkSE4DqdP
X-Gm-Gg: AeBDieus3L+NJUvQ/spkpXcQ2Je/+5+HFey9GG5itzuyyYPbkS9THz3hRhNBYh141rp
	3WgSP2e0GpBvSDjykau+a/Y4SHhRd2It+IzOgy2ZTgwsr9su+5WmE11uivQ1sLjGfzuWFd5PoAY
	JyX8itVUo2RE2n3pyTtKnQMHKG2Sh6BBFG/GbYwHbOJjlXCA2VMLB+mgpDj2op3UxUe4m6xQwRj
	RH/Bprd+tbd9nahWhyKg4oGAhNrqQaNqNcXxgIyQFxIMnAbLgDaRCyV8cFAQ4JKQ9SQ6Kr/7lU7
	5ZtyyEBtaeGlk4ARDLBtlfkyzegBQOfaawjVEpNA3pj1fOYl3ex1T8id2mXP3usBjqqsEAHCFl3
	KmzlYUen/Immet4LAL3XYewgNy3U5+y4TzfZYhVs4I1UcqNsqMOMoAu1pUkjQA2d+KkwZpu41Xa
	jGxSkVKjTJLcgwUuZWPm3ROwCqHhN0FcRl1Txoinwk8toxhxWZkUwpSlsh+L4Yum2/fQTvqffBa
	g0=
X-Received: by 2002:a05:620a:c54:b0:8cf:c3df:ba69 with SMTP id af79cd13be357-8fd158e3b99mr2096578585a.13.1777975679258;
        Tue, 05 May 2026 03:07:59 -0700 (PDT)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com. [209.85.222.172])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fc2c91dd48sm1305217185a.38.2026.05.05.03.07.58
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 03:07:59 -0700 (PDT)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-8ef5776530bso576963785a.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 05 May 2026 03:07:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/NtJ0U73G5pqRYoCvi7EHF6MEhnoy240+ZAlsNOGhRjs02DQj7gzyQ1FX4Fakot+EJteu/PVl6K2RpjQWTzNpeDw==@vger.kernel.org
X-Received: by 2002:a05:6102:50a3:b0:5f5:4055:4556 with SMTP id
 ada2fe7eead31-62d84f62cfcmr5756702137.4.1777975211494; Tue, 05 May 2026
 03:00:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260428201522.903875-1-cristian.marussi@arm.com> <20260428201522.903875-14-cristian.marussi@arm.com>
In-Reply-To: <20260428201522.903875-14-cristian.marussi@arm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 5 May 2026 11:59:58 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXtH=4J7bDGAk8xoxNDYRsHSRDReVNU_PpUnUDfU=afpw@mail.gmail.com>
X-Gm-Features: AVHnY4JmctwdZMNWtvo6vN96jl6lMZtYIshncwB9zfTSrryPHUlTFUdh6bCKhZs
Message-ID: <CAMuHMdXtH=4J7bDGAk8xoxNDYRsHSRDReVNU_PpUnUDfU=afpw@mail.gmail.com>
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
X-Rspamd-Queue-Id: F13DF4CB58F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,arm.com,broadcom.com,gmail.com,linaro.org,foss.st.com,oss.nxp.com,amd.com,renesas.com];
	TAGGED_FROM(0.00)[bounces-32060-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.956];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,arm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]

Hi Cristian,

On Tue, 28 Apr 2026 at 22:17, Cristian Marussi <cristian.marussi@arm.com> wrote:
> Clock rates are guaranteed to be returned in ascending order for SCMI clock
> protocol versions greater than 1.0: in such a case, use bounded iterators
> to minimize the number of message exchanges needed to discover min and max
> rate.
>
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

Thanks for your patch!

> +static int
> +scmi_clock_describe_rates_get(const struct scmi_protocol_handle *ph,
> +                             u32 clk_id, struct clock_info *cinfo)
> +{
> +       struct scmi_clock_desc *clkd = &cinfo->clkds[clk_id];
> +       int ret;
> +
> +       /*
> +        * Since only after SCMI Clock v1.0 the returned rates are guaranteed to
> +        * be discovered in ascending order, lazy enumeration cannot be use for
> +        * SCMI Clock v1.0 protocol.
> +        */
> +       if (PROTOCOL_REV_MAJOR(ph->version) > 0x1)
> +               ret = scmi_clock_describe_rates_get_lazy(ph, clkd);
> +       else
> +               ret = scmi_clock_describe_rates_get_full(ph, clkd);
> +
> +       if (ret)
> +               return ret;
> +
> +       clkd->info.min_rate = clkd->rates[RATE_MIN];
>         if (!clkd->rate_discrete) {
>                 clkd->info.max_rate = clkd->rates[RATE_MAX];
>                 dev_dbg(ph->dev, "Min %llu Max %llu Step %llu Hz\n",
>                         clkd->rates[RATE_MIN], clkd->rates[RATE_MAX],
>                         clkd->rates[RATE_STEP]);
>         } else {
> -               sort(clkd->rates, clkd->num_rates,
> -                    sizeof(clkd->rates[0]), rate_cmp_func, NULL);
>                 clkd->info.max_rate = clkd->rates[clkd->num_rates - 1];
> +               dev_dbg(ph->dev, "Clock:%s DISCRETE:%d -> Min %llu Max %llu\n",
> +                       clkd->info.name, clkd->rate_discrete,
> +                       clkd->info.min_rate, clkd->info.max_rate);

Printing clkd->rate_discrete is futile, as it is always 1.
It would be more useful to print clkd->r.num_rates instead, although
that may still be lower than the actual value, due to lazy handling.

>         }
> -       clkd->info.min_rate = clkd->rates[RATE_MIN];
>
>         return 0;
>  }

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

