Return-Path: <linux-renesas-soc+bounces-33647-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jBeUOqdzJmrSWgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33647-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 08 Jun 2026 09:47:51 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 979AA653AF8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 08 Jun 2026 09:47:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33647-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33647-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8410530429A9
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Jun 2026 07:41:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9D97393DE8;
	Mon,  8 Jun 2026 07:41:52 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C983947AE
	for <linux-renesas-soc@vger.kernel.org>; Mon,  8 Jun 2026 07:41:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780904512; cv=none; b=CJJEg/0n1aE126rNc3pLk4Lr3zLYhlStNquJYfJKBSPUP8SZClE+OlYLMPIsfODtbSSGfW9PhAMtt/sGtmVJtfKcj/eCoptMNC2bQiXw7e7DrtjNJDCSX9LXXCGrP2bbGCtaQmT68g2QNDNmkMkTpkT8lg2d5OhvPwhxGgKihSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780904512; c=relaxed/simple;
	bh=R7MwiCWB0jLjrbgihAJaI3C+U48f2yX/bqNuxPmV05g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f9FpcgyZMsxmTCYxyDVqZAQnc7Njk7Ix90KvQuCLNC7t2wANdKjdXPaKFD1kX/ZXkv2OA7jolq/kkJkh2FzWmd3OEMnuvieT+GQBvvvRI1GxUIW/xHtLitttoOLkX+7JfVbovYSHb1NrVdNBrF3VlDJwjhjsHtMzoVMHi+eqAjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-59e2b96e3d3so2664895e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 08 Jun 2026 00:41:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780904509; x=1781509309;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dt9sAdVpyjABq8uk+bJPrbepMfmlnejqLbS+z27bzVk=;
        b=PonL9jmgTqOpVuPYCt3KXhViQNAziFKk/66Q5EZx9nBwtneHkyb2ixwn/ZcAhEk64C
         S9A8AvdcClza+oJgWjQ+U0vac1B5bvASIhnhUoxDL2foFH3RevofUTATfj6tctufoMG+
         OdghAnpaSJMZMxCenVHDM5p+lsVJexOxHL2fegnCU7wQRz7Wa6RSAwkQbfoBR+UGbOd9
         wL4jpw2IyuWt6qGlEoGTq1Mob26XaPrknTUTCbNo+echa/yfmbmA6AP23NDnMOkVgN67
         mxNcACeH+Ciw9pzB4XutMKforz4vlSm9zcVbKM1J1q/KXVhiloObh3kbnModUWPKap3T
         yMpg==
X-Forwarded-Encrypted: i=1; AFNElJ90tFLNT2CW749fM7Y5KQWfcGMmZwmdOM/XvInN8la6F5ViKJW3egDg9eoEiaD0+pMdfF568INQfZ4kUxHdhg+GIA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywb9TJL6Ht3JyoqIX8eDPJ5E9JUC859Re96Sjk8fiR2c/N/ywh5
	AifRpwYQyvb8mu9MyKMgUvvJbaap3HjbvwLK9KNoQ044FijBlS5CFy8Ak9GVB5Vt
X-Gm-Gg: Acq92OEOf9JPAhtIfIdSJhI06mkXCudkpT/PIzHnLGKH5vGmguXtlP+6H2htOoFRbee
	yLLCeHwzX7H6fTIKSHhoA3CBilKIywYIQG5qGc1po/bBgG1P/DT6lxC9Y85ODnoeWO1G0Jtvoxd
	kWvqTC8AMBAReamNa2nydBM/mjyV1RdVTfD1qcfUyODZ6df0+nrbcT/SAk+oLjgDjCRUOU6LKR+
	86lqnjSPmE0AbcWe5IpuQOBNnwG8puPbEXc3i7uRsxZPddVY8+r/NQvsjseWpmboZz4oOgivkIe
	guqnxJzt+gX7NTAKKHJ64OunJn0zvPqa1qQlpyQMPVm+b9CKL7XGnIBoA6Dbq7Sm8uiTVCgdj+v
	udYnZC0w/RP+aEMFdTQi0j5vjY7+DvaXq1NeuCtIxHKYzVvFeshNwbbb8f9sHkXeAAddKRxp9jN
	l599qX1COeEa/ozxz5lCQxxT1FNC3Q8ZEpREsDESsOo/Yy7r4zFG2UzNwKZbIK6B11Elv34Xs=
X-Received: by 2002:a05:6122:e261:b0:56f:22ad:f5c9 with SMTP id 71dfb90a1353d-5ac4ca5aed7mr6286835e0c.2.1780904508913;
        Mon, 08 Jun 2026 00:41:48 -0700 (PDT)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5a6dc44da2fsm13797681e0c.9.2026.06.08.00.41.47
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 00:41:47 -0700 (PDT)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-9639474a0c1so3129126241.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 08 Jun 2026 00:41:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+0xQUTcFVmwk7Dd2P7OJ6fscdwS3h/P5xJjfSq+n/7kHdYZwnnOvPSqWFgeAoB/nsAvpYK8jWk5P/RhJRqd3zCvA==@vger.kernel.org
X-Received: by 2002:a05:6102:6b0a:b0:631:7781:fe8a with SMTP id
 ada2fe7eead31-6ff084a55demr6790737137.19.1780904507130; Mon, 08 Jun 2026
 00:41:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260608071123.128964-1-vulab@iscas.ac.cn>
In-Reply-To: <20260608071123.128964-1-vulab@iscas.ac.cn>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 8 Jun 2026 09:41:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWz1Z6Pp1hss2X8R2D_9-bLjUpYnpdGEsGtZMKbF9L7pw@mail.gmail.com>
X-Gm-Features: AVVi8Cdai5h3PhjO-8qphts-gv8u9z_8lWsZUpbrxaI2yb-8L5dWz5NU13b55BY
Message-ID: <CAMuHMdWz1Z6Pp1hss2X8R2D_9-bLjUpYnpdGEsGtZMKbF9L7pw@mail.gmail.com>
Subject: Re: [PATCH] i2c: riic: fix refcount leak in riic_i2c_resume_noirq()
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: chris.brandt@renesas.com, andi.shyti@kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33647-lists,linux-renesas-soc=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_RECIPIENTS(0.00)[m:vulab@iscas.ac.cn,m:chris.brandt@renesas.com,m:andi.shyti@kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 979AA653AF8

On Mon, 8 Jun 2026 at 09:13, Wentao Liang <vulab@iscas.ac.cn> wrote:
> When riic_i2c_resume_noirq() is called, it deasserts the reset
> using reset_control_deassert(), which for shared resets increments
> a reference count. If pm_runtime_force_resume() then fails, the
> function returns without calling reset_control_assert() to
> decrement the count. This leaves the reset deasserted and the
> reference count unbalanced, which can prevent other users of the
> shared reset from properly asserting it later.
>
> Fix the leak by calling reset_control_assert() on the error
> handling path for a failed pm_runtime_force_resume().
>
> Cc: stable@vger.kernel.org
> Fixes: e383f0961422 ("i2c: riic: Move suspend handling to NOIRQ phase")
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

