Return-Path: <linux-renesas-soc+bounces-28511-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oDm7M61ToWkfsAQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28511-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 09:19:57 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 789321B4677
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 09:19:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AF40530741B3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 08:17:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFC983A9D83;
	Fri, 27 Feb 2026 08:17:11 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5913136BCE8
	for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Feb 2026 08:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772180231; cv=none; b=kN3JNUZCpr0y5M1InHte1QRqcUY7B+V8oyc7+GIIbdq1vSeQFeTTErpDn5nXwch4C/YeopRZd3J6AoesziXf3lt5sZ2108vRhm+oeq+91Nh8SNEl5gbXMdtt+Wg/uo1rRyMiinWlqIx+TQ/O6sL/C0+eMm0cHUIbMaRJpJiveEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772180231; c=relaxed/simple;
	bh=m1v1NON76PMqrwAK+QogHbEEQapfrZUSwmgoYwLysaM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P1ONwPjsm2fY3ZZtSElTg3fPTKjWfPpQByniItj6cvdHvk2ulCvl6WxkBShhLKEL8trog6UBrrGEEyqI7BKnj/t37hrzLtEgfXr9XJMa1nrWkImX3sozqat/lEgqq5qEcyNeACYrmmbDVq3op5Bu175I11L7GMtScv3w715kOI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-94aaa5d3bfcso1064656241.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Feb 2026 00:17:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772180229; x=1772785029;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BRbyV6rB0ACPTuZRlxL65vpkYib9H0d5lAlAjAED1c4=;
        b=GAqVXG2iO2ntzibBeElOHPIBYd7AA6HkOf8IBRQABjm4oGFnlaflVgtDHdnZjgqAox
         ETjK8fmMG6mARjEK4HFs0F1bLDAQ+bgTb6pl8kkVPac4tB6jk8mf/V/lmBnFekXMIZk4
         F0m4xuDA2fBoLJlvM+tzIj+ix5KIZhfd51gNv6ate7dV1oa6g+Is7mCpucindwxW+qrB
         kk2WAjRP++uesq+6wYNO109cxwykEheH7OQzBQjmVWPaJY3WuPe8D0aDxnzQ6Vm8fFJh
         u+uEo9Ygm6V1TLnsSoQKU8WL31OOC/UO7Ay4Fd+N4poRjsulupyEfz+EuHVnf2wzHWMt
         ojVA==
X-Forwarded-Encrypted: i=1; AJvYcCXq7eZ7PPc7zoi0VRhHTpX58Gwj1VFz28Pz92vH+zQKgpb1+ZtWhk6urvG9HQXnz/E71lz26PWUMHynr0fXsGdZ1w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVEojikbx1kjE1LS2S7y5UqjXutZ9s16eKOdgBaTjGG6MdnKhJ
	gugXmf5mMq8yzDcbSCqeO+Mjb0NFnoYjxYVvNjHcGRtq6yO04ZWKU9yGIh9Iii2/cBI=
X-Gm-Gg: ATEYQzxIWgplJkvHJ2PAZSTdYgpBspyN00/XJ33l6VT1R5YpkMMqeZJtAuAJdNxgkqD
	nqc+QjoyF6Ac+ts11uLsTEWdjM61BJdB7CsjYR0GEwRs2Qtnlr8C9EQckYpy9DyaofEmGVvDCVx
	zoOzYHgBT3dkx6ROd+EkEWzwoSLFDwITKVy4E+8fbGE0qnZ+iqW/bMhr+2FxV19e1s85Lr479/q
	0l9yOCLS1R9O6w75OusyHc5QxgkLL7NfwGhw3t1HOailME+TTnU4J7fL18cBdREaCJNIGignJx9
	xG2o31SUoWx4nEzh5H0mqnWrpQIODkkx66kPH6pjN/Cd0OVxGR5Hm/KurTBsQbHLFnXTKJSU25i
	CEnUAToHRfxmtlK4Zxl3W1XF9ywF36uazg8UNVD4OIoHm/ONXfRiHHYCqRnGlUIL78bGgibfv0J
	Blyo358fNjU+a8gR6EmWAkTCuqB2gxHooQmqY985e4nl1riUoajBztqEJpiBuh
X-Received: by 2002:a05:6102:32d1:b0:5ff:a1e:ee66 with SMTP id ada2fe7eead31-5ff32271334mr1282628137.2.1772180229367;
        Fri, 27 Feb 2026 00:17:09 -0800 (PST)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ff1e80818dsm4644346137.5.2026.02.27.00.17.08
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Feb 2026 00:17:09 -0800 (PST)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-5fded42aa7cso1170234137.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Feb 2026 00:17:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU4tatO4qLSqBgmAYXdwobpfJtSevivhhV10VHNlA+0AcY+9yXm8b96Q6u6wp+ok2P7McjypIBzF1akgwoyJr7KWQ==@vger.kernel.org
X-Received: by 2002:a05:6102:3747:b0:5f5:3619:8bd1 with SMTP id
 ada2fe7eead31-5ff32494193mr1107329137.25.1772180228608; Fri, 27 Feb 2026
 00:17:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260226-clk-det-rate-fw-managed-v1-0-4421dd2f6dc6@redhat.com> <20260226-clk-det-rate-fw-managed-v1-1-4421dd2f6dc6@redhat.com>
In-Reply-To: <20260226-clk-det-rate-fw-managed-v1-1-4421dd2f6dc6@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 27 Feb 2026 09:16:57 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXfPPs26ZUnWd+_+xUU0DJ44ewTMrtbzco3J2Bs165+Xw@mail.gmail.com>
X-Gm-Features: AaiRm52todzA8Sr5byokA4vkDZ2E-x17wtaWy3OW25tgrEahH799QvmVZU00ayM
Message-ID: <CAMuHMdXfPPs26ZUnWd+_+xUU0DJ44ewTMrtbzco3J2Bs165+Xw@mail.gmail.com>
Subject: Re: [PATCH 01/13] clk: add new flag CLK_ROUNDING_FW_MANAGED
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Abel Vesa <abelvesa@kernel.org>, 
	Andrea della Porta <andrea.porta@suse.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Bjorn Andersson <andersson@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Frank Li <Frank.Li@nxp.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Orson Zhai <orsonzhai@gmail.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, arm-scmi@vger.kernel.org, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Cristian Marussi <cristian.marussi@arm.com>, 
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	Peng Fan <peng.fan@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[baylibre.com,kernel.org,vger.kernel.org,suse.com,linux.alibaba.com,samsung.com,nxp.com,glider.be,gmail.com,pengutronix.de,linaro.org,arm.com,lists.linux.dev,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28511-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.979];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 789321B4677
X-Rspamd-Action: no action

Hi Brian,

Thanks for your patch!

On Thu, 26 Feb 2026 at 19:17, Brian Masney <bmasney@redhat.com> wrote:
> There are some clocks where the rounding is managed by the hardware, and

s/hardware/firmware/

You got me totally confused, also/especially in the cover letter! ;-)

> the determine_rate() clk ops is just a noop that simply returns 0. Add a
> new flag for these type of clocks, and update the clk core so that the
> determine_rate() clk op is not required when this flag is set.
>
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

