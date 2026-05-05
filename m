Return-Path: <linux-renesas-soc+bounces-32072-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 5EziIPvf+WmBEwMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32072-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 14:18:03 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CCA94CD4EA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 14:18:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 352773035D7E
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 May 2026 12:18:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDBF4423A62;
	Tue,  5 May 2026 12:18:00 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7041D393DDC
	for <linux-renesas-soc@vger.kernel.org>; Tue,  5 May 2026 12:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777983480; cv=none; b=G79BYoatbLb+Cz3R+bejFpjrIePvHtjg2Djs/cnmmiCSvMf2scI46j4qBZHvD1w+QNEgSP0ZzeIvIeeE1Fp4s2+kb7zeo7mUx6KEBpdSW2ZDDbHRX1Mow0bx28YnMdnOq8lCiMFXQIU7gA5JDoxP2JS7rHfBr6oZY8l+vJXgV1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777983480; c=relaxed/simple;
	bh=l/41ncjvsWNG/pOaCT3/ej2L9B5PHEMsEQj3Jxazb6M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O2Eyz85pYgH+hdbvmFg+DPSS/RHCMBEABYp97R5/Q88XGP1wsI5NaSmIxKIpWiFmLBCOl2//aoUiZ23Cvi06C+hZstxJOo9Q5nz9q+LFfPljq8v+uRuA5ZK1QM3tKz8mEwZtflSkyenrQT7uxGvcnb2McLzfiLBVFNIpPNwnp/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-944168e8c5fso3068720241.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 05 May 2026 05:17:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777983478; x=1778588278;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mx10RFm2VbKGi60P1ByLYAwwUUKZhzhPZIKANt76f2M=;
        b=pxqEEBiZgoVy+1iNMaxV6q/FP8OD0gyul+RfWSooHfPZD51AAPeMv/Arf7Na8ZWA/8
         yvBETOmmhGjqyZNUgXz52Amta3dB6ImgMC8vP9lGwXuX0Kqfgzi2cRayfIGlejga4WA+
         cdufdvn1MDYM183DLGR9Jq+Wdz4NGYv0b+TS/iiikjZmI9A4uYYgY08H0RGNM/3q2sL0
         zyefcNm2Y/d+5smeLaeJXzqU+jI5ItX+zBCh4+zOK5uVNkcny9Ct/Vq5whbJXl8mzE1X
         P6MtHcurZ71VQxtL4/BFhEpy9NfB23ZOaewb5zyAAkR2yNXxhBlNuF87ek8IQbwZbQQw
         kvlw==
X-Forwarded-Encrypted: i=1; AFNElJ+AYsAsGNo7KM+6ky+PBMa+Ovc9skmXSsT5q8BCWxWJNJTb7IHjJpJkr76NntMHlg8l35LqVtuxzuDzgAkPaocV3g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7WzTwX0MRh/DLZU2yVjIar3lGtnBhVOBmsWiqCqGhzUlkqCYl
	9XXadBxowDEEZ3wsueZVGazwXAr501JlD0YXQcraPiW6OTzu+faVGoDjRCnlwmCg
X-Gm-Gg: AeBDiet0PSQMqOfuBenDskrgNS5jJQ640+VS2AvGrKEhKMIMssNX43mjaq48iEOrey0
	iFn3TWRTETGELQ/oAwmKkc57E6HkpQyA3DPPTelDqNhP8RQJpMzYWIVEULfPVHzCq324lJZ/JA5
	yhTndOB1ieyhqH44+XHlHwrL1gmUBS29mIcWncvJDBUNe55LeKpAisYbBAhzn9NfcNSZm4CV+yK
	j4rUR5m4B9qRpq7SUBvd092RU+Yf7P6+iZ9dHzeFdEG9gy+U5s6uCtZ9u/7VRUNtsq/YwNL0sjQ
	1OqSUzOXY4AjhdHUTZHruJnA7jRqsghDuX52uqotomV6dxlUWc9PITd5kP20IeO5f2LcfTjXgHd
	OEAde04yJQqcJDWM1sovU86wfzLFKOl7UM+vVxWP+VBkm0H5L+HvkJj2EljgfqbfotfD6+irWEB
	vp3paft1lQ3EBC+Nph+xL2TXWcVVtM8EUwLQKp2r79qKQ4hdaBaxLZGp6ew5yAlJseCnLiLQnDV
	pI=
X-Received: by 2002:a05:6102:809e:b0:610:2912:adc9 with SMTP id ada2fe7eead31-62f592c6049mr1342350137.28.1777983478334;
        Tue, 05 May 2026 05:17:58 -0700 (PDT)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com. [209.85.221.179])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-62bfb14fbfasm6928835137.1.2026.05.05.05.17.56
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 05:17:57 -0700 (PDT)
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-56a86f0a23bso5278567e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 05 May 2026 05:17:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8FeYq6PDQScXKIjp60wMYRFcp0PpVac1udspjuTZE4iL5lzriInsumBhr0G/qJUiRZDOqUkH1WgP2jPJ67zXhK6A==@vger.kernel.org
X-Received: by 2002:a05:6122:3c44:b0:56f:7c7e:f33a with SMTP id
 71dfb90a1353d-57547fd53a0mr1268108e0c.0.1777983476537; Tue, 05 May 2026
 05:17:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260428201522.903875-1-cristian.marussi@arm.com> <20260428201522.903875-5-cristian.marussi@arm.com>
In-Reply-To: <20260428201522.903875-5-cristian.marussi@arm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 5 May 2026 14:17:45 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUF1dW0hR-UZMVVqTnpWbMcv1D41jfL_4rEj6Vzj9wGSg@mail.gmail.com>
X-Gm-Features: AVHnY4JwQvUlXCNsMN5caeA9aMIeCzl1Epu5sphmxX2UtNuOS2ulpV9OaCHfntE
Message-ID: <CAMuHMdUF1dW0hR-UZMVVqTnpWbMcv1D41jfL_4rEj6Vzj9wGSg@mail.gmail.com>
Subject: Re: [PATCH v3 04/15] firmware: arm_scmi: Simplify clock rates exposed interface
To: Cristian Marussi <cristian.marussi@arm.com>, sudeep.holla@arm.com
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	arm-scmi@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, philip.radford@arm.com, 
	james.quinlan@broadcom.com, f.fainelli@gmail.com, vincent.guittot@linaro.org, 
	etienne.carriere@foss.st.com, peng.fan@oss.nxp.com, michal.simek@amd.com, 
	kuninori.morimoto.gx@renesas.com, marek.vasut+renesas@gmail.com, 
	Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 1CCA94CD4EA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,arm.com,broadcom.com,gmail.com,linaro.org,foss.st.com,oss.nxp.com,amd.com,renesas.com,nxp.com];
	TAGGED_FROM(0.00)[bounces-32072-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.961];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,linux-m68k.org:email,arm.com:email]

Hi Cristian, Sudeep,

On Tue, 28 Apr 2026 at 22:16, Cristian Marussi <cristian.marussi@arm.com> wrote:
> Introduce a new internal struct scmi_clock_desc so as to be able to hide,
> in the future, some of the needlessly public fields currently kept inside
> scmi_clock_info, while keeping exposed only the two new min_rate and
> max_rate fields for each clock.
>
> No functional change.
>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

Thanks for your patch, which is now commit 83fd9d34b6b75be5 ("firmware:
arm_scmi: Simplify clock rates exposed interface") in scmi/for-linux-next.

> --- a/drivers/firmware/arm_scmi/clock.c
> +++ b/drivers/firmware/arm_scmi/clock.c

> @@ -457,14 +466,14 @@ iter_clk_describe_update_state(struct scmi_iterator_state *st,
>         flags = le32_to_cpu(r->num_rates_flags);
>         st->num_remaining = NUM_REMAINING(flags);
>         st->num_returned = NUM_RETURNED(flags);
> -       p->clk->rate_discrete = RATE_DISCRETE(flags);

This removes the last setter of scmi_clock_info.rate_discrete.
However, it is still used until the next commit cd73d1bfaa8d34bb
("clk: scmi: Use new simplified per-clock rate properties").
V2 did now have this issue, as the patches were ordered differently
in that series.

After both commits, there are no more users of
scmi_clock_info.rate_discrete, so it can be removed.

> +       p->clkd->rate_discrete = RATE_DISCRETE(flags);
>
>         /* Warn about out of spec replies ... */
> -       if (!p->clk->rate_discrete &&
> +       if (!p->clkd->rate_discrete &&
>             (st->num_returned != 3 || st->num_remaining != 0)) {
>                 dev_warn(p->dev,
>                          "Out-of-spec CLOCK_DESCRIBE_RATES reply for %s - returned:%d remaining:%d rx_len:%zd\n",
> -                        p->clk->name, st->num_returned, st->num_remaining,
> +                        p->clkd->info.name, st->num_returned, st->num_remaining,
>                          st->rx_len);
>
>                 SCMI_QUIRK(clock_rates_triplet_out_of_spec,

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

