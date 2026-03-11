Return-Path: <linux-renesas-soc+bounces-29192-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gA1eCtdTsWlHtwIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29192-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 12:36:55 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C061262FA0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 12:36:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D8C2E3073400
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 11:36:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BF683CEBB9;
	Wed, 11 Mar 2026 11:36:37 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EBA73112C1
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Mar 2026 11:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773228997; cv=none; b=d+kSrWfG2Eb3pNSe70RwwCfLFJmHE9wFFYKLhY2kwmuNpH/YLBbMTjdxsQcQovQXCpY4Vu80FPIe/qNsb8Kl63Cnvp0Lhm9YTo3EQ0jxcKqx+HJanbAPVCP4iSNbhnSQj1yXxHpWvKIW0rtTq2yJBTS+vjnauDH/mxcOyVgIIDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773228997; c=relaxed/simple;
	bh=+3Q5cvF0zoX3Fs6Oo+yHNZCoRTKFJVHEonlQPpaB+j8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dTHWlI0QQtM8cHQDW7i+3t5k83J+jrGJobsiROgVpZ86AFdtOBxVl3VDxpfoMDa2/i85bqZ9j/gYcVrr10kYDfooybImbar1E/DrjJe3XsR4SnuqRFUHk1rXG3qBzx5YKi2iLSn8uDfE+XVAgx/0/yO5/hBBoF1iGyycnmlB4Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-67bc1b08afdso865090eaf.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Mar 2026 04:36:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773228994; x=1773833794;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SFUwPWUa2C8RyPEgXtS/bViQ1F3uFE3QYAtTuWHnxcc=;
        b=R744Wvcdp8jkO8RFxSsJ/Omy4uAzUJs+jr+3SNyhPY2bBHBm8agJyL75IRsjR2tb9W
         sDqy1r+CIaNDHscpjKETrFkTB7kc2HZLlN1raJJCRGKYn6EtZw1S3+Xi1gHFBXUTP/aO
         OMit4eJgb75TCAL2StpoxfaRXWQxegsGChDpzBkgl6txnhfjp5yTTJ8azeBxQVERnEzq
         yVk7QCrLC8fktneUuWEAbv8T2C69lQvFbRsYtE3clMOsp1uJgazFy6g+5WyYBp5obgWj
         55+yzoA43ZU/UZ6wO21vOYLDHnmkaeXYQhxCNhOWtMww7bBxvncnC/+kHnMSY48NROU1
         MgQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgVv7g1TXw+677lETe5ZBbSNVU+cbgOuudvCNc80IrqCKl9roQ5Jf+pqfBY4HeNakQiwXWT/GlBn0HLaNK9aNlBA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyzQ4ML9qbOA9E6/Mo5FrDWucGVc0ZSLSFEJz6IAvxp76S12hqX
	MXRHFVV6oFXMqFf3EE/1ich7nEw8A8n16Jftm4M8n4rLCbCuuRibiVlyYUK74dEX
X-Gm-Gg: ATEYQzyHyoMSoZTk2eJwELDN9bcdg6bJiqVGU8V7kgSjfeji5dDRcn7ZP1y52bWy1Ek
	IhuEEL6zPnNvnaueq5kLlYzJK3M7G4DLKoWcM+KKsNWCuKR2ECpveHJrU+qC07m/ZJZn9eVSRIS
	9LJi5aJB5SIdqk+qTupJkpj8qWqz/Lv5Na5UAJm2il19Ir05mboyChuXk0ZZ9sS3jeFRFnL1dA7
	sj2bAWv4c0Bu1lBNShd+EsNrz74db9f+lCx67kpSvlq/6BWkINfTqiynz2W/Et5iG/HLYxBL8HV
	vSCr5cuL9NB0fbI0GFv1+WDvHVRz7fOcMM5cIniQqgsgDYhusz4sCWgzT7aiHTwHNPJP/fH2Ovy
	D04du44jWGmvVix6fzRli1feUjNqO3rPgsHmhJH1qbUKB3DvDakNfMVYpx8NjCr4p36m4+H/FI6
	bX6DDtlr7lpAgXIHWZHFhhuVMWiH1T1aVCmQZGzAdpyuxxgpbDtzUe9EbUts9ArMFdhvj/H90=
X-Received: by 2002:a05:6820:1519:b0:667:7e1a:203a with SMTP id 006d021491bc7-67bc8a1a464mr1554853eaf.58.1773228994507;
        Wed, 11 Mar 2026 04:36:34 -0700 (PDT)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com. [209.85.210.51])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4177e268f37sm1856317fac.6.2026.03.11.04.36.34
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 04:36:34 -0700 (PDT)
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7d74c1157a4so2901732a34.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Mar 2026 04:36:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWs1lkwMfOPZGn0JXNt2BU6Y6DD3awesBy+jW+KZNIv3YjgTlJWK8otfH4mWoklgXsMXUipLETl+RoKvQmoKR2eUQ==@vger.kernel.org
X-Received: by 2002:a05:6122:4b14:b0:566:2711:d8ab with SMTP id
 71dfb90a1353d-56b47474538mr661085e0c.6.1773228645230; Wed, 11 Mar 2026
 04:30:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260310184030.3669330-1-cristian.marussi@arm.com> <20260310184030.3669330-2-cristian.marussi@arm.com>
In-Reply-To: <20260310184030.3669330-2-cristian.marussi@arm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 11 Mar 2026 12:30:34 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX5T-7ERcjEK_=z7joEftC2cMLqDkyy8iO65U21S-umng@mail.gmail.com>
X-Gm-Features: AaiRm531V7pPeKFeCYpwBljOpOuuWMHfwPn8-oVZZtZhYt-YNy5G1WfiCBuIrko
Message-ID: <CAMuHMdX5T-7ERcjEK_=z7joEftC2cMLqDkyy8iO65U21S-umng@mail.gmail.com>
Subject: Re: [PATCH v2 01/13] clk: scmi: Fix clock rate rounding
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	arm-scmi@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, sudeep.holla@arm.com, 
	philip.radford@arm.com, james.quinlan@broadcom.com, f.fainelli@gmail.com, 
	vincent.guittot@linaro.org, etienne.carriere@foss.st.com, 
	peng.fan@oss.nxp.com, michal.simek@amd.com, dan.carpenter@linaro.org, 
	geert+renesas@glider.be, kuninori.morimoto.gx@renesas.com, 
	marek.vasut+renesas@gmail.com, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 9C061262FA0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,arm.com,broadcom.com,gmail.com,linaro.org,foss.st.com,oss.nxp.com,amd.com,glider.be,renesas.com,baylibre.com,kernel.org];
	TAGGED_FROM(0.00)[bounces-29192-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.755];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,baylibre.com:email,linux-m68k.org:email,arm.com:email]
X-Rspamd-Action: no action

Hi Cristian,

On Tue, 10 Mar 2026 at 19:40, Cristian Marussi <cristian.marussi@arm.com> wrote:
> While the do_div() helper used for rounding expects its divisor argument
> to be a 32bits quantity, the currently provided divisor parameter is a
> 64bit value that, as a consequence, is silently truncated and a possible
> source of bugs.
>
> Fix by using the proper div64_ul helper.
>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: linux-clk@vger.kernel.org
> Fixes: 7a8655e19bdb ("clk: scmi: Fix the rounding of clock rate")
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

Thanks for your patch!

> --- a/drivers/clk/clk-scmi.c
> +++ b/drivers/clk/clk-scmi.c

> @@ -83,7 +83,7 @@ static int scmi_clk_determine_rate(struct clk_hw *hw,
>
>         ftmp = req->rate - fmin;
>         ftmp += clk->info->range.step_size - 1; /* to round up */
> -       do_div(ftmp, clk->info->range.step_size);
> +       ftmp = div64_ul(ftmp, clk->info->range.step_size);

include/linux/math64.h has:

    #if BITS_PER_LONG == 64
    #define div64_ul(x, y)   div64_u64((x), (y))
    #elif BITS_PER_LONG == 32
    #define div64_ul(x, y)   div_u64((x), (y))
    #endif

I.e. div64_ul() is meant for the case where the divisor is unsigned
long.  Hence div64_ul() may still truncate step_size on 32-bit
platforms, and thus should use div64_u64() unconditionally.

I am aware clock rates are "unsigned long" on 32-bit platforms, and
thus cannot support rates that do not fit in a 32-bit value.
If that is the reason you are using div64_ul(), it should be documented
properly.  And probably the SCMI core code should reject any rate values
(incl. min, max, step) that do not fit in unsigned long, as such clocks
cannot be used on 32-bit platforms.

>
>         req->rate = ftmp * clk->info->range.step_size + fmin;
>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

