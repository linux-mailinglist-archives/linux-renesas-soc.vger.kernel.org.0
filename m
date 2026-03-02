Return-Path: <linux-renesas-soc+bounces-28635-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GCUGK2aIpWmWDQYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28635-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 02 Mar 2026 13:53:58 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D2A21D937C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 02 Mar 2026 13:53:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 177C9301F6BB
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Mar 2026 12:48:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75FAF3ACF07;
	Mon,  2 Mar 2026 12:48:15 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 545103ACF18
	for <linux-renesas-soc@vger.kernel.org>; Mon,  2 Mar 2026 12:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772455695; cv=none; b=b61JqMFKNghPLNVdJIJuhuW2grXZRvae2D2AXVp7j5Nm6Rns5HfK92mJYeBh7GLsIal+Q5wsxs/6h69ZPO5GVaTrZtSq/iMIXybtv9mzZJdDyVoXzNu863IM6fKQI7nHiGprGE3n251b1cv4fCStsrMWi79pheGYygGmlLBu8+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772455695; c=relaxed/simple;
	bh=5HFzGr832crqv2W64pTYS8wggyt85EHspGHJD1BYhVw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aWJOJsWy5+tfOBEeYSdiolQ5lmxcC9empj8VOt+Ood7StDVTGB7222SsG75eoJ96hDo3Li5JJi15Pv6VTiY7zfXSIKxqy9V247TDawSmD89vZJ0bOY3+CH+usK7RL0S1R5WK4nMbafkywCb62w0TzQz0Uz5a6IwpILW/kO2MPvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-567543b8989so1769338e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 02 Mar 2026 04:48:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772455691; x=1773060491;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UPZaguxK4uAclO1GJ8sZm5gYxF5BgvNNNwtD4mqwBno=;
        b=GjQRj7yoSe/pMc1aHYmbR+7yA7ba2yX15Y2EGF5UnkmFxF5u+6OOLfPI4cMJsMKX00
         +NVzykxTDGRPsnlFQkSnvzTL//QyoaMktvgzMNPr0c5ZjXafd7ljrTIt9Zy124+6dXTz
         ezM+D8RQA3uXBBraArI9/wr/7Fmn1xmaAvTwVqgrdHl/E6GAlZVlG2++XhejmqeQ/9CE
         vFKmhjPqE9p1X45NB7X46RyPz0lkSE1F4JvfPjhZVUttLDAjJgKcUv5ez61afqNUFswI
         itnsC1XM8w7JQIoUOnCxUDA8BTnt8LxvnxWYKMmueNuB7h1mzGInMpBpE6fZ/B0gELBT
         PngQ==
X-Forwarded-Encrypted: i=1; AJvYcCWB1H5gnjxRUloIwz1FvMqFgPkHqcgC6Xg1yizyT96KHDwTuJ2KOUO4KpUZLWdko8EJwUIwpXeiFGVRekbRBEtn3A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8gGOOiYr5hzc+oV1LVlWfyu8DTEs/ycejnkMeuoVSTF7ohtPR
	kUXak65VwvF7UYTLM/oUEH2Rh3m6zKGWrRtwie4NWIihDuuh++4rli2lfA522n8S
X-Gm-Gg: ATEYQzyTy8BqEkqoxc8SPrFHJX3dsiltQ5KFS1Luz9JLM6SVaCrPjxr28uDBlRJT1Dk
	vccQhekiK3x1qaC+v3MVE1SZjhQxWQWChlVgzh40c+RpOrjlnv7kvfzHNLDyiQ8yVNgTxcf64SB
	reLeHpW1dlxX4qkgG1wxcvayrgRMdf7xGhDqH8/BSaIKgwgGG0kGBRcFbD5LnnAjZJG79iaIrgD
	/Iuy7o2oVusKvyPWELxLJo2fZYmMTv7Ord5ur+/EVA8n0ciNiptl7SqP8lwFlOVgp0TVWRtCKjZ
	KqZnues4zA+aX6AN8nvds8x4N2JzCA1fDxr4TuXX1J1ZPWqa8Xstb6Clp15X4tfMVjTnZJep0zF
	h8SSv6sKyklcE1fv6Xl9kLbX+NrkrBtT/XULsaY2lITdGch8C0KMz7SuoavHj3VAMHodw5yG+d0
	ZjcdbqDFtPcjgWmm4tqTtCeJut8RMFB+7gWncMh3fTG5NX2uudCnSmsAR+6ueU
X-Received: by 2002:a05:6122:7ca:b0:56a:9401:11eb with SMTP id 71dfb90a1353d-56aa09f0b38mr4735715e0c.2.1772455691270;
        Mon, 02 Mar 2026 04:48:11 -0800 (PST)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56a9204934csm15356485e0c.10.2026.03.02.04.48.11
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 04:48:11 -0800 (PST)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-94acd026e45so1124532241.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 02 Mar 2026 04:48:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXPYk/ccGreQkkUkcNLgRQkNmqwafLEFKYowB6O8AMEwDgbDTkiCsar4yXdVxYXqAeaRpZ9kngPXUgQcNaL+DuTDw==@vger.kernel.org
X-Received: by 2002:a05:6102:b0f:b0:5ef:24aa:986f with SMTP id
 ada2fe7eead31-5ff32280163mr4813153137.2.1772455690946; Mon, 02 Mar 2026
 04:48:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260227153225.2778358-1-cristian.marussi@arm.com> <20260227153225.2778358-4-cristian.marussi@arm.com>
In-Reply-To: <20260227153225.2778358-4-cristian.marussi@arm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 2 Mar 2026 13:48:00 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW7e45rc5VmHQV5GxzMvJ3r6=04sWOoFsu4JJPAqDUiJA@mail.gmail.com>
X-Gm-Features: AaiRm50BStTuBuZFtFkMptJqRSM8Fy1hreKbQGIVp2iYFH2DYfQrEyfTQ_vqsrc
Message-ID: <CAMuHMdW7e45rc5VmHQV5GxzMvJ3r6=04sWOoFsu4JJPAqDUiJA@mail.gmail.com>
Subject: Re: [PATCH 03/11] firmware: arm_scmi: Simplify clock rates exposed interface
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,arm.com,broadcom.com,gmail.com,linaro.org,foss.st.com,oss.nxp.com,amd.com,glider.be,renesas.com];
	TAGGED_FROM(0.00)[bounces-28635-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.631];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid,linux-m68k.org:email]
X-Rspamd-Queue-Id: 4D2A21D937C
X-Rspamd-Action: no action

Hi Cristian,

Thanks for your patch!

On Fri, 27 Feb 2026 at 16:33, Cristian Marussi <cristian.marussi@arm.com> wrote:
> Move needlessly exposed fields away from scmi_clock_info into the new
> internal struct scmi_clock_desc while keeping exposed only the two new
> min_rate and max_rate fields for each clock.
>
> No functional change.
>
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

> --- a/drivers/firmware/arm_scmi/clock.c
> +++ b/drivers/firmware/arm_scmi/clock.c
> @@ -157,13 +157,27 @@ struct scmi_clock_rate_notify_payld {
>         __le32 rate_high;
>  };
>
> +struct scmi_clock_desc {
> +       u32 id;
> +       bool rate_discrete;
> +       unsigned int num_rates;
> +       u64 rates[SCMI_MAX_NUM_RATES];
> +#define        RATE_MIN        0
> +#define        RATE_MAX        1
> +#define        RATE_STEP       2

Any specific reason you are not using a union here, like in
scmi_clock_info?

> +       struct scmi_clock_info info;
> +};

> --- a/include/linux/scmi_protocol.h
> +++ b/include/linux/scmi_protocol.h
> @@ -51,6 +51,8 @@ struct scmi_clock_info {
>         bool rate_ctrl_forbidden;
>         bool parent_ctrl_forbidden;
>         bool extended_config;
> +       u64 min_rate;
> +       u64 max_rate;
>         union {
>                 struct {
>                         int num_rates;

You patch description read like the actual rates would be moved
from scmi_clock_info to scmi_clock_desc, i.e. _removed_ here?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

