Return-Path: <linux-renesas-soc+bounces-28634-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id COqHCLWFpWkeDAYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28634-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 02 Mar 2026 13:42:29 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5AC1D8DE2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 02 Mar 2026 13:42:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B6702302511D
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Mar 2026 12:40:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6BF23876AC;
	Mon,  2 Mar 2026 12:40:09 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1362338A72F
	for <linux-renesas-soc@vger.kernel.org>; Mon,  2 Mar 2026 12:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772455209; cv=none; b=kH8S2LpR/IsyOmvcHBjBr5xNBVnGRqKdS7MMwQwBay9Ba96QWJOD8JSa8G85KVR+2RKFhZcvg5JvuUiwZR646KY8/D3SC4YB4Ukzcfyz8xvyK7UYYU+wLJOk0kF4lnVNOmXJR+YfokrOn7M3LqBOabJqJoNDzUCd0QsJqnwSGtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772455209; c=relaxed/simple;
	bh=bbZA1NIjrsyDbwc/owDhNs6Y6gSNpyIeUkxNy0yJ1ss=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ut5SGLT/8KKQNshrpMeOaBvoav/m9Zz9OnDcE3I648vIIPww6GYfZg1MTwjSiplVzOGSjFV6w+opI+zUQR2AOH/XVGfUSxv1u+QxW3KzMD5oX2nRnst/++LqmpuoyKDM20kkV3XgNGH7ITTSOheB1795neO7IMUhs04ljsNxsi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-94dd2d71231so1221919241.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 02 Mar 2026 04:40:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772455206; x=1773060006;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hHdX83DJ8NzB0+Dg2GzVMundpvvc3+ChCaV5hT6gxKs=;
        b=kdWDa4rqb9CR2COFlcvbbuLWFGo1Pb9oJAbgWazN2j2zgCf+hqzUGMFccEz19uqV9E
         uZ7KFVLM98T+F71X/G6iDZpn8aNPY9O5NOK/IMux8DsOvP3fUl7gKBV4vaUHAyXrvV3+
         7AIY2nB3C9queSGkavFu/Q3EyBLddrfWdJtXyLsxXpr7qOOezyIQ3BYeV/R1X6K4DDuW
         epgGLrocFVzEP3ZOkDfaJaw+KVX10tuQBwF492zTjZ7aCYqRn+4kSNzH9t2XPQswT4Gi
         cmPUwXWm9EjxuFxbsb4XUoMGPlIhXieMGknDUS4Ba3d47PvFl93kRbJ5vFKHdUoT0Um0
         4N9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUJWPYLybaXwHcX5qGg71k5ZRx1iLGBJOZRDaTR4g3BihMnvnVjvBdHVV/70P02nzzg2jZ9rvf0+7yZkRcXbSE9hA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzO0E9vsLJUjddJiR8r7k3Ylr30Akl8gcVUJoVfHDCKQCTNRuH+
	kxPs9KVPxf2L1oTbu/Ypvfet5XcyDVwwK8uBSvX5BL0/bt/fUJQt0Q9O04AqRvhm
X-Gm-Gg: ATEYQzxdmHpiWf7doScpNHYnJAe2OijzjIk0R3OtZoMjqvucgjZNR4Qp2AhuB9ibR43
	hn9vx52cH3G61IjxS1ABFgex11lNS0CzPHx48dzNsGXzOeaO+eOnyt1EvXKCsTdh7mRC5GCS+GY
	ncgbPI1667GkXsBZ985QEgcCMbzFGqyMa56C68kIbDj4+XzG2DVUH6il1AgQn+UoBRNFS/r2Ca/
	alUwErfMtJqHIux2sh/4lZUZ88yL92rYxxTgsnUWceb5ibEfUVq54drgxDPMqhkaplmbTTVZJ02
	2QtgVvf8tEtHi7htbKigGKCenPLxVoIFEz1MQCLV80aAVicCe8RKnFPaoS2INBIsnsxoz3kKRmm
	ToyMefxFrzARqLcnmrO+JjEM4Ypt1KzfLntFKBB7yHd2aJ73xEiFWYA8KDZ2/qqHGD0jUD6qa0f
	zOtzWGJw384w3VmQXy/rGaZ4PtqPs4tkVYQgb0ox8/yRW84OWV1rEqwPmv4Frx
X-Received: by 2002:a05:6102:c09:b0:5f5:402b:7ee3 with SMTP id ada2fe7eead31-5ff3232ba39mr3963472137.14.1772455205599;
        Mon, 02 Mar 2026 04:40:05 -0800 (PST)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-94df61672ddsm11945754241.0.2026.03.02.04.40.02
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 04:40:04 -0800 (PST)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-94dd2d71231so1221891241.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 02 Mar 2026 04:40:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUkG5RymSxPvWqZpuJFpPzENhkyLijhaJ8+UNnWAE1kxMZ9x8u1kZfXH1uAez6EeVhdzMmT3rl+Sybrthig/hC83w==@vger.kernel.org
X-Received: by 2002:a05:6102:b0f:b0:5ff:3159:303f with SMTP id
 ada2fe7eead31-5ff3228629emr4217443137.7.1772455202516; Mon, 02 Mar 2026
 04:40:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260227153225.2778358-1-cristian.marussi@arm.com> <20260227153225.2778358-3-cristian.marussi@arm.com>
In-Reply-To: <20260227153225.2778358-3-cristian.marussi@arm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 2 Mar 2026 13:39:51 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVCgq4Wbm8g_O9e1sPhJ4PyY-nWTt9RW1f3=G3a0PvdKA@mail.gmail.com>
X-Gm-Features: AaiRm53Myvi_2ZqSj1TUDPoKLpT_7oeJnXIYfnZdksVjKBsJ5C9Q8S7vMIJT-rk
Message-ID: <CAMuHMdVCgq4Wbm8g_O9e1sPhJ4PyY-nWTt9RW1f3=G3a0PvdKA@mail.gmail.com>
Subject: Re: [PATCH 02/11] clk: scmi: Use new determine_rate clock operation
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	arm-scmi@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, sudeep.holla@arm.com, 
	philip.radford@arm.com, james.quinlan@broadcom.com, f.fainelli@gmail.com, 
	vincent.guittot@linaro.org, etienne.carriere@foss.st.com, 
	peng.fan@oss.nxp.com, michal.simek@amd.com, dan.carpenter@linaro.org, 
	geert+renesas@glider.be, kuninori.morimoto.gx@renesas.com, 
	marek.vasut+renesas@gmail.com, Brian Masney <bmasney@redhat.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,arm.com,broadcom.com,gmail.com,linaro.org,foss.st.com,oss.nxp.com,amd.com,glider.be,renesas.com,redhat.com,baylibre.com,kernel.org];
	TAGGED_FROM(0.00)[bounces-28634-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.605];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linux-m68k.org:email,baylibre.com:email]
X-Rspamd-Queue-Id: AE5AC1D8DE2
X-Rspamd-Action: no action

Hi Cristian,

On Fri, 27 Feb 2026 at 16:33, Cristian Marussi <cristian.marussi@arm.com> wrote:
> Use the Clock protocol layer determine_rate logic to calculate the closest
> rate that can be supported by a specific clock.
>
> No functional change.
>
> Cc: Brian Masney <bmasney@redhat.com>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: linux-clk@vger.kernel.org
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

> --- a/drivers/clk/clk-scmi.c
> +++ b/drivers/clk/clk-scmi.c
> @@ -57,35 +56,17 @@ static unsigned long scmi_clk_recalc_rate(struct clk_hw *hw,
>  static int scmi_clk_determine_rate(struct clk_hw *hw,
>                                    struct clk_rate_request *req)
>  {
> -       u64 fmin, fmax, ftmp;
> +       int ret;
>         struct scmi_clk *clk = to_scmi_clk(hw);
>
>         /*
> -        * We can't figure out what rate it will be, so just return the
> -        * rate back to the caller. scmi_clk_recalc_rate() will be called
> -        * after the rate is set and we'll know what rate the clock is
> +        * If we could not get a better rate scmi_clk_recalc_rate() will be
> +        * called after the rate is set and we'll know what rate the clock is
>          * running at then.
>          */
> -       if (clk->info->rate_discrete)
> -               return 0;
> -
> -       fmin = clk->info->range.min_rate;
> -       fmax = clk->info->range.max_rate;
> -       if (req->rate <= fmin) {
> -               req->rate = fmin;
> -
> -               return 0;
> -       } else if (req->rate >= fmax) {
> -               req->rate = fmax;
> -
> -               return 0;
> -       }
> -
> -       ftmp = req->rate - fmin;
> -       ftmp += clk->info->range.step_size - 1; /* to round up */
> -       do_div(ftmp, clk->info->range.step_size);

Oh, so the truncation bug exists in the original code, too.

> -
> -       req->rate = ftmp * clk->info->range.step_size + fmin;
> +       ret = scmi_proto_clk_ops->determine_rate(clk->ph, clk->id, &req->rate);
> +       if (ret)
> +               return ret;
>
>         return 0;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

