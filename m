Return-Path: <linux-renesas-soc+bounces-27402-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2Nw+NNMwd2lVdAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27402-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Jan 2026 10:16:03 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E763585E76
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Jan 2026 10:16:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5E244300103B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Jan 2026 09:16:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5891F305E19;
	Mon, 26 Jan 2026 09:16:01 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7862D30499A
	for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Jan 2026 09:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769418961; cv=none; b=YXJi3i8dMiZ39sS+7z28WM+HdgK/1TtXeH0DUMyPJXPsij931EaaQSFi/UnWqym+3TIGhy7PSi2TeHjeicl+enNWTW2ul2dYcTrQlmKAJ/rFYz42cD/+mjhoT3oNezF39RbQTeFHxpNP3Kr0PEmy/adOc1dlkJolY77Zs6YpJBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769418961; c=relaxed/simple;
	bh=d2s5PoOQAVaSt+MyTbx7UGGwO6+rfXIRXeEKt/FKfyQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ND11QvJROnIrmCdn29ocBQP+MDfkBocEUUcWOYi18YfPTO5TdGBBPH2aIMM5fIqFs4v+x+omuJu8UWCg36RzcGJNBjQBVq5sI6wGysIWCU0ML1kSTxbba8n2NLYP4KPuXpp8hhOLST7C/SJEfneirwyO8RTNfCaohVy97miL4KI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-56367a388e5so1049216e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Jan 2026 01:15:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769418958; x=1770023758;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uQaOzj2tKnU8ORNYpG6usL1AFHimKPjCyXKjxferGL0=;
        b=IrbgH/f58GUnMT2xlCy4Tpij3ONPKx7vcRl+qXGgs2u+C541EFteHI56nEmUeQRvu9
         YLpNKVxVBl+wCOsyHfpZPUZvLZACfQS0rL/XqQ4OExLWpMgYZ/+lBLUBWiXi0qN3gTMM
         1sD9e0KA/hRZjC62xyzat8U0meNphVizLwx3vGjgG/xKVplnJoS1yqXoTSotOQCwUcWh
         dOH5OcMMVP+IjONYd10XKLRDAG/Rs2dUr9sR6Zkq68yvVEIiefa927e5DEiB6RiuxY5r
         OMhtttXHzCOHE2DaZ0KpRiR2D66W4gDAddWAMHObI2i+53AgFVRFlu8mlMuT9xRCZQmA
         x2Rg==
X-Forwarded-Encrypted: i=1; AJvYcCWX+hb8bhsSR4OelHSr4/TDQZTL74HrAk5wAAWJ/OGt3q7B8Oji2fJYfJEl6ARhPIHczoLNMOQ85VcDcGCGI3Ordw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6AEHNGC5Y0PYi1UPCV/5JiGifukL4RUTv8iCRLK2sDDEj0kB4
	HtEM6td6Oz0NyQqUENtLgR5RsCZ+48/567iGGG43rFcjHS4wjHhizuL7+dFilWJt
X-Gm-Gg: AZuq6aIpRzJkl3aGbiQIHInKLVDWZLK/r0Wx0BT5+qLtWdgfTgz1iXe8LegxLf7Kiys
	iaE9QWzM1a1JA1S4bE3cokhzRA+7xExNHMz1J4NVGyp/DttIbch6jdUw8Y2sq4kBJ8BpsBJAh2Q
	jq96fETMPTrD5NyVbY9oSSTpTGXk/5bhg40oxrCS3uXCGz4v/C/nKne3XwFn97FZHg/L0+Rk2Ty
	EwhvISJs2GzNW73n/8JrZQTvM42glQ6dslILItO2kAQB45gK3dSaAFrPp3i0BrirZtZ9Opi+/xa
	eDaQ3tGT+hOmYVnFbgR3Ws0CUO+RKRWB0XR5xUwXwqEfJ7TKk1LzEWfF1V8T3mJL8Rq6jnbvwTK
	krhSrDGHJTUZhQ0LMPDILfK/0wNRXTIn4wob9hS+1/pE0DmPlorL8c5i7M3LCpYDfZNrB0y/lJY
	tF9C6El0TZVIHJ31jmiIfOudra3QrbrBwNKS6MNY7Oke6eMKqu
X-Received: by 2002:a05:6122:6150:b0:563:7b3e:d853 with SMTP id 71dfb90a1353d-5665c976e8emr976680e0c.9.1769418958305;
        Mon, 26 Jan 2026 01:15:58 -0800 (PST)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5663fa82a3dsm1655246e0c.8.2026.01.26.01.15.58
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 01:15:58 -0800 (PST)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-93f56a97064so843106241.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Jan 2026 01:15:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVkv8dDeKq8cjw68n8Q/NKqHGy1SdKFSltQVRnkOdf4oSDH1mpFKQr3laJ9VRgUOrQxBlIWHOJv//1uZjGvl6waRA==@vger.kernel.org
X-Received: by 2002:a05:6102:f0e:b0:5f5:33e4:12ea with SMTP id
 ada2fe7eead31-5f576493c1bmr1088062137.31.1769418957878; Mon, 26 Jan 2026
 01:15:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMuHMdWapT40hV3c+CSBqFOW05aWcV1a6v_NiJYgoYi0i9_PDQ@mail.gmail.com>
 <0e9f963b-00e0-43d1-b567-cb10b8f66df1@mailbox.org> <CAMuHMdVOUzanEufhWqOL0nv81xCYh4YNAX_waG6y9PyUZ030tg@mail.gmail.com>
 <9efa9daa-6584-44b3-8055-bc160e46d8a5@mailbox.org>
In-Reply-To: <9efa9daa-6584-44b3-8055-bc160e46d8a5@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 26 Jan 2026 10:15:47 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWqqRJnY+ATZdzw1=XnmXUko3+wPhKtT+PVP+CRmdFAYg@mail.gmail.com>
X-Gm-Features: AZwV_Qj2iYTeK4T2fVq6WUyIHg21dwOYiE1pJSzFBFBrBjhDjig-MNpg9IvarOQ
Message-ID: <CAMuHMdWqqRJnY+ATZdzw1=XnmXUko3+wPhKtT+PVP+CRmdFAYg@mail.gmail.com>
Subject: Re: drm/imagination: genpd_runtime_suspend() crash
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	DRI Development <dri-devel@lists.freedesktop.org>, Linux PM list <linux-pm@vger.kernel.org>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	R_DKIM_NA(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-27402-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[6];
	TO_DN_ALL(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: E763585E76
X-Rspamd-Action: no action

Hi Marek,

On Mon, 26 Jan 2026 at 00:18, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 1/22/26 4:35 PM, Geert Uytterhoeven wrote:
> >> Can you please test this change and see if it fixes the problem ?
> >>
> >> The barrier should guarantee that the domain is settled and no more
> >> callbacks are still running.
> >
> > Thank you, that indeed fixes the issue!
> >
> > However, I am not so sure this barrier belongs in the .detach_dev()
> > callback.  The documentation for almost all dev_pm_domain_{at,de}tach*()
> > functions states:
> >
> >       * Callers must ensure proper synchronization of this function with power
> >       * management callbacks.
>
> Isn't cpg_mssr_detach_dev() the caller in this case ?

No, cpg_mssr_detach_dev() is merely the generic_pm_domain.detach_dev()
callback, which is called eventually from dev_pm_domain_detach().

End users like pvr_power_domains_{fini,init}(), and the helpers
dev_pm_domain_{at,de}tach_list() call dev_pm_domain_{at,de}tach*().

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

