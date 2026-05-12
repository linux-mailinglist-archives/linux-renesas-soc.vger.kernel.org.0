Return-Path: <linux-renesas-soc+bounces-32449-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KNB6FCXTAmrRxwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32449-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 09:13:41 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FA1351B922
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 09:13:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C8AA53063203
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 07:07:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F78737AA9F;
	Tue, 12 May 2026 07:06:55 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787CF379C5F
	for <linux-renesas-soc@vger.kernel.org>; Tue, 12 May 2026 07:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778569614; cv=none; b=MzmOZmL4+9M4iNplmTJfv6u4SvnTeTtbpVeVPuP6hRBRJt2EPreEY2z4h92ySaZTag7rwDNL5MQ/Ccio3GAVPDZ1dvpoBypB2NRMRU1SVHwcSAPvXNoiSgIE4UBuMhZbYb7hfF6x9dikEsZT9BhBBcz2unJmeTjpgw65g+DppnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778569614; c=relaxed/simple;
	bh=UcY4jP/18r1gef8ACE5/GJ4a0vJN1v/bPa2Q4C10n3Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cDyv2tX50nCf6W2jTlNqNWGMPlc2lnncLr6I8xogX3sTVGvb71LrCOvkLjZbPkbe2ikeG9fnF4Fmzu+JkusfIXIWBY+g6bZoRId2Uk9EyFsVwYyJSaPQc5XnG2Kc1fkT0yegwDpXOIaSd6ds1DLjFp1FdGkLLYysOW+bXDHxyF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5751e12c524so1793320e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 May 2026 00:06:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778569605; x=1779174405;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6U9R02UyT6PCn4mJzYYl/CPWidpbIlIhzjolxdPX7hg=;
        b=CEDfFlr051m1LnqG8Ji5riHY2TtoGC9i3RLs24h9i4F4uEHv9o4unQEefEzRiXg4mY
         Z0DxxhCV9cptLlKJB+DxeAlqjseDswFi4YGNA/FzDtqY3sClYLV3lPxVk6O253Q9wPD9
         NO0Q0d3AjTrmFMsTFvJrhbXFG+etEG53m9zIlHVOIKH1fV/pcx+lrRdCThvwnX4hHKjP
         QFHsa8IW7g4fMSukJr4GrtiOtskV+uvhKhGCzyvLnuwviqHNSPK++pKQsEXWYrpJv9mY
         op9l+XbjPe3hY8r/OGFYSMW10Wh02p4BOHrI3rxGqo31wYnutqRYGpTudjkQcc2+ic3C
         u/qg==
X-Forwarded-Encrypted: i=1; AFNElJ+VPPeg83eoyzrU3LFf++B8XAqoJIM6Hd+Yl7E5IlcUWJ21gFGBT2EnIowui6ggfWchJso0eYLsqXwIURwBrfSDuA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4XtFkGoeup8hDoooY0pN23ywu6rzqZx6huKcG2tL4/HVS9eub
	PlFutqeEc5Qv9uya1jcovdGIawpvLwpxbJiiUvend4TzgjQIhq0xdznA1w6jTuXc
X-Gm-Gg: Acq92OH+QSQF83zYN6BW815yfofa6fKgg84w91JYg2/Eu9HulRDd5gDLvMJ8SJfeiVD
	S0RMTJxoAMT1vvZJI0ZFWzZbfLO11imCOzumLhEzicCYMKvwygnFSGTb5cfhlLCd/P78MX1p0+Z
	gG+4pDVuf0a/ft4A32CPxCAw8xI0+py++FH1go+rLR8n6I6fsGzylRrM9m43MSt4nG5vXn/KZd7
	pSUCrc/AnuHqSRTSk1yUBhf4jZ5dJxCkLGWgadlDnp/VZn6lCMtzmJtBloPv4H4H016sc/iDfZW
	SipQtWRm0VoOJ2DS0NEdADEoF4x9M92ZpzO5hdmr5HEOaRg48yPQJO1Hy7lpalQLgXbFtJijaT6
	b7yB3mUrrxJyD+/ENg6bTqIlEcvXA+xj4xOhxW+qSJzeeND0040xC4Un9meKmh0p/rziYVwSk1Y
	0pGoNwTo7gPpqLq7KcnRHHRJyOl/4o5zK/GBpRXv2Qi10KnZIZdyD2J5UR4UUT
X-Received: by 2002:a05:6122:6584:b0:575:2f91:6fd3 with SMTP id 71dfb90a1353d-575d42410e2mr609926e0c.5.1778569605405;
        Tue, 12 May 2026 00:06:45 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-575869968e5sm7544801e0c.5.2026.05.12.00.06.45
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 00:06:45 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-6312b8f8e47so1473569137.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 May 2026 00:06:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9Tk9AptTs6yBZSDoJHODowqD+o2DL9b5hKoUvfTNOCF2MZihFoz1FZCaR6EFRP1MfbP3XgSaxZ9KSVeSmiaeEjcw==@vger.kernel.org
X-Received: by 2002:a67:e7c5:0:b0:631:26f6:701c with SMTP id
 ada2fe7eead31-636187cd6ffmr637420137.31.1778569604976; Tue, 12 May 2026
 00:06:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260511211841.284809-1-ben.levinsky@amd.com> <20260511211841.284809-3-ben.levinsky@amd.com>
In-Reply-To: <20260511211841.284809-3-ben.levinsky@amd.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 12 May 2026 09:06:33 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXn8G-nJ-=_eVRnZO_1nzWuP-AjTVL5SWH-D1w2F2QVfA@mail.gmail.com>
X-Gm-Features: AVHnY4Jzn5XG3w_TFgzZrTYfNPhFMcAA9wRYKEMGtDIRqvMdxDHMc6dhfvtpVZA
Message-ID: <CAMuHMdXn8G-nJ-=_eVRnZO_1nzWuP-AjTVL5SWH-D1w2F2QVfA@mail.gmail.com>
Subject: Re: [PATCH 2/4] remoteproc: switch exact-match drivers to wc-ioremap callbacks
To: Ben Levinsky <ben.levinsky@amd.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	linux-remoteproc@vger.kernel.org, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Patrice Chotard <patrice.chotard@foss.st.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, tanmay.shah@amd.com
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 8FA1351B922
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,vger.kernel.org,nxp.com,pengutronix.de,gmail.com,glider.be,foss.st.com,lists.linux.dev,lists.infradead.org,st-md-mailman.stormreply.com,amd.com];
	TAGGED_FROM(0.00)[bounces-32449-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.977];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,glider.be:email,mail.gmail.com:mid,amd.com:email,linux-m68k.org:email]
X-Rspamd-Action: no action

Hi Ben,

On Mon, 11 May 2026 at 23:18, Ben Levinsky <ben.levinsky@amd.com> wrote:
> Replace the exact-match carveout map and unmap callbacks in the
> existing remoteproc drivers with the common wc-ioremap helpers. Leave
> the zynqmp R5 TCM callbacks alone because they also clear the mapped
> memory and are not exact matches.
>
> Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>

Thanks for your patch!

>  drivers/remoteproc/rcar_rproc.c         | 33 ++---------------

This change also makes sure mem->is_iomem is true, which looks like
a valid bug fix. Do you know what was the impact of not setting
this before?

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be> # renesas

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

