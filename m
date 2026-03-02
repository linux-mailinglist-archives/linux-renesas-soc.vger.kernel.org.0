Return-Path: <linux-renesas-soc+bounces-28637-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YDFoGlyQpWkAEAYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28637-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 02 Mar 2026 14:27:56 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9EC1D9BC4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 02 Mar 2026 14:27:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B5FA330743CE
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Mar 2026 13:25:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFA493E5578;
	Mon,  2 Mar 2026 13:25:27 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B52F93E717D
	for <linux-renesas-soc@vger.kernel.org>; Mon,  2 Mar 2026 13:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772457927; cv=none; b=KkveqVBFLLyRSn80ssp1Y2wX1illV7+1/CZMf6gIIgOLo4RgDGVCCTEt19Sf5RHn+9gULT94PnHDhpfwxCKkZmyCsW6ylHEp2l2Np9mcDFlVlNtpear/w0B8/iZJFiy1qfLwl3HSYC2ifr4vlne37CVe0tM0kDWgV60j+btUikk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772457927; c=relaxed/simple;
	bh=sgxnmhj2rQgljJRNTMAEIU71ZOKKmdvca0WN6HsSkl4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pxs3bApYikVWRF4K3OaEB27unhW9cMGnlwu8Py4pyHQcTCR8VJEkiV92ileHCHNnAm2M6QbomIGPUIIdxuRZxs1YIPQaHTvmRvFKkKwjCSrWGZQ4gD6tQkjx+jQgtEY/cAVXHX8+b+PzWxfZnWlr/KzCk7lPeNhvvNBme0cWmGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-56739adfa1aso3642528e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 02 Mar 2026 05:25:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772457914; x=1773062714;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u/KgeLtXmZOUh5kr82wm/EePACuyTgS6gfBGBNvywTM=;
        b=kAmL5mACdvA+13k3vFns1htr1JW1Pzfta5tWoU0gVP285VuzY2I6krf1Vv3fDjcvaF
         Qz/j/tDFhy0oQ2gNjpy3+b+z0SJgNYX38/ITBYRWRvlcBWsmbyZQcsFwGdXhPmKTGZMN
         LiRE3T/7RiYaZLGZE9C3Ng8XAUkv0U3bxsAXQirSC/52rd8jjau98ycdLr8Gm64gJx9E
         9+jrHyCBcRJOm5xfVALor2/2lZNwIriCwP6SHJcNQ+5e0v+Iz/zYwkLJVIfQUWExL4Fw
         keMPlksZltO76Pps+EABfamOD8ZtwoXdj+o6fL8tbepnCs9s+S4HjLiVISqyiw970jnQ
         RHIA==
X-Forwarded-Encrypted: i=1; AJvYcCUPIrWoGhMPjzbu1lzz0apZkZaSHgeOx6bVv71nUNkkg1C5uXZbCV3H4ND8pj2py37kdMznO5pEuN0duVE85nqKhQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyVxZ7SFYfr2VKfQrSeQK7rLAMyD2mJhDaGNBnWE5Qo58y+SjNG
	MlEF/3XmePxfuFFz105clwlWvL9ZvSqErcZcuTNIcetCqloSzXr/2N6HbNOzKmWR
X-Gm-Gg: ATEYQzydKM51T8FHELutaLzYqOAvyomw76ztPPV0wdOmthY4nsSl8miuMtEeZ+9nl1W
	9tdHVB3IVGN0MXjMmlu/kgTwQYBO9jFSTUHJfcd04cYUeqF4TMzEaha6G5d9tclhf1zAC5nm294
	LIJmaySLHwgrO9g3SAL5t1w50kWRhlx0jJCmAkrNo3DHGATC+08/eTTRIHuSTF5efquo785c9qY
	hiIuXMSTHvdqjd+MDbvJ6PObKCf8xGzjQv1y6vDchY6oBSiNCJPwGwhNMnH5zE8zUUrAt2+6bY3
	HYZqYvRg6lBydxOmGZ8AR5edl4kxCflBBEhEXpcjb5fcFHG34+E61Kkk582J/kmXs6yxB26j62r
	d44dFnti5qMYl3cKcsunlXRlktGDy8RqYeut3CQmIxAeruQaXsmZvUFHxLGjfUx4X6wTV8RN5Eq
	zNjyuag6d4n5o1b0Lzyir3GhUr80IdM1XXkC/RYZa87KSHRgHKf6xjgHxTJele
X-Received: by 2002:a05:6122:3b05:b0:55b:305b:4e31 with SMTP id 71dfb90a1353d-56aa0ab1495mr4725230e0c.17.1772457914633;
        Mon, 02 Mar 2026 05:25:14 -0800 (PST)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56a91b8c7ddsm15430030e0c.3.2026.03.02.05.25.12
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 05:25:12 -0800 (PST)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-5ff07cb35efso2953241137.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 02 Mar 2026 05:25:12 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWUHgm8Le8Rs1BM7XsmVUz8Mck4U9Fnc8KZ3W1Y2AZFQMudo7wTMvGUmQcbcmOEARzNsDSTJRbBfgsE6TfdUF0QRA==@vger.kernel.org
X-Received: by 2002:a05:6102:304c:b0:5ff:1d94:b746 with SMTP id
 ada2fe7eead31-5ff32519f2emr6218672137.27.1772457912000; Mon, 02 Mar 2026
 05:25:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260227153225.2778358-1-cristian.marussi@arm.com>
In-Reply-To: <20260227153225.2778358-1-cristian.marussi@arm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 2 Mar 2026 14:25:00 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW9dtAnT2E103kp1zK=LJrER7k1ib8_WPk5aorPRw80uQ@mail.gmail.com>
X-Gm-Features: AaiRm50Tkxhc-oCHlHPyabn9QxR4wbHw_RTC9z1g5dQZe_w9JY9CV7dca6PXC-4
Message-ID: <CAMuHMdW9dtAnT2E103kp1zK=LJrER7k1ib8_WPk5aorPRw80uQ@mail.gmail.com>
Subject: Re: [PATCH 00/11] SCMI Clock rates discovery rework
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	arm-scmi@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, sudeep.holla@arm.com, 
	philip.radford@arm.com, james.quinlan@broadcom.com, f.fainelli@gmail.com, 
	vincent.guittot@linaro.org, etienne.carriere@foss.st.com, 
	peng.fan@oss.nxp.com, michal.simek@amd.com, dan.carpenter@linaro.org, 
	kuninori.morimoto.gx@renesas.com, marek.vasut+renesas@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,arm.com,broadcom.com,gmail.com,linaro.org,foss.st.com,oss.nxp.com,amd.com,renesas.com];
	TAGGED_FROM(0.00)[bounces-28637-lists,linux-renesas-soc=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.571];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,linux-m68k.org:email,glider.be:email]
X-Rspamd-Queue-Id: BE9EC1D9BC4
X-Rspamd-Action: no action

Hi Cristian,

Thanks for your series!

On Fri, 27 Feb 2026 at 16:33, Cristian Marussi <cristian.marussi@arm.com> wrote:
> it was a known limitation, in the SCMI Clock protocol support, the lack of
> dynamic allocation around per-clock rates discovery: fixed size statically
> per-clock rates arrays did not scale and was increasingly a waste of memory
> (see [1]).
>
> This series aim at solving this in successive steps:
>
>  - simplify and reduce to the minimum possible the rates data info exposed
>    to the SCMI driver by scmi_clock_info
>  - move away from static fixed allocation of per-clock rates arrays in
>    favour of a completely dynamic runtime allocation: just allocate what
>    is needed based on the effectively discovered
>
> This is done in patches 1-6.
>
> A further bigger optimization suggested in a past series [1] by Etienne

s/[1]/[2]/

> would be, whenever allowed by the spec, to limit upfront the number of
> queries in order to simply retrieve min and max rate, that are indeed the
> only rates needed by the CLK SCMI driver.
>
> The approach proposed in [1] was open coding and duplicating some of the

What does [1] refer to?

> functionalities already provided by SCMI iterators, though.
>
> Patch 7-10 implement such optimization instead by:
>
>  - reworking core SCMI iterators to support bound enumerations
>  - use such new bound iterators to perform the minimum number of queries
>    in order to ony retrieve min an max rate
>
> As a final result now the rates enumeration triggered by the CLK SCMI
> driver, while still allocating for all the existent rates, miminize the
> number of SCMI CLK_DESCRIBE_RATE messages needed to obtain min and max.
>
> Finally, patch 11 introduces a new clock protocol operation to be able to
> trigger anytime on demand a full enumeration and obtain the full list of
> rates when needed, not only min/max: this latter method is really only used
> currently by some dowstream SCMI Test driver of mine.
>
> Based on v7.0-rc1.
>
> Tested on JUNO and an emulated environment.

Thank you, this removes the need for increasing SCMI_MAX_NUM_RATES on
R-Car X5H, while decreasing memory usage.
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

> [1]: https://lore.kernel.org/arm-scmi/aZsX-oplR6fiLBBN@pluto/T/#t
> [2]: https://lore.kernel.org/20241203173908.3148794-2-etienne.carriere@foss.st.com

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

