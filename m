Return-Path: <linux-renesas-soc+bounces-31265-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aGGpHktQ3mkrqQkAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31265-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Apr 2026 16:33:47 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A323FB4D9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Apr 2026 16:33:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C869D30D423A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Apr 2026 14:26:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F3D13E8661;
	Tue, 14 Apr 2026 14:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L81DjK1T"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 443963E7144
	for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Apr 2026 14:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776176769; cv=pass; b=aE9LT4xA+KgGInmffOL5famm6V+EGlicFQAjN1yZcl7DM/w7NW77rUmLQW71eynqaMGZH0Br9yFJ1eYHbdVrXU/slImJz68WwUbxq2naD/wAavC/naOSMDLM+v72TZctzS03TnQZD1ooOlUyGkqtYAXoV8bw8taV+fx2V4hRNwA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776176769; c=relaxed/simple;
	bh=WtbIduDkfCpWDk4TAOwYPiVOm1oN2PtC34wtUbnB0xY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b4f7yTJRsfpnlRzsBtmFNpTICmKRGtEJhIWSq32mtGnj4+KTIHKfAECr2f12w8hqh2hAv/gkJcBikgdBPcP7Y90wKqEfHiS0ecvv/HiOAIdArsIS1zDk/xvXO/JzHrOGcbRurarwE/X41NcXn8SWAgKpRvVvzPBDUdvSzVFhcMU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L81DjK1T; arc=pass smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2b458ca2296so17143205ad.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Apr 2026 07:26:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776176768; cv=none;
        d=google.com; s=arc-20240605;
        b=YzbpoRW/5C7s+TC57JH9SlYO0Wf+7xt6R6fn8buykG5B2YQJ6619YK230FArwZI0Rb
         fNhFq5j5n4tw+t7uPRzeW2dyoSyJ5ho/Y0osWvh9JSSGMNh4MPmWHqjDvJPWDLQD8nYz
         tdmgLSlQ4QRmtCmlw7fchtkbcliPw4iSiSvxtJH+w5yGW3HOpHi2+NnL0N6V/745W1ap
         NjW6SF//iWYVmUk35uGjq/NVVHRaEuL5C2IepaC5qf9OXPagiI2PakTicMyhVTl8CyAW
         I1wmk+l/YW4g1ahNMfesiBvNnXJkyg13ca5AVjqR/FJ8sCnQlsRLotD2szi7EVvBqbmm
         a7ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7hxS+4h2mTHNnfCCFBW5o+c1P1K7al7DuWkrX1QY474=;
        fh=gBvAT6fxYnCT8ZqhuFjMM3V1PfPGyqHLSG8AhVIZic0=;
        b=fqOwuFi+NyrQcOdwNYsFuFt+jMdC6hP45E9txIsjnyeq7bGN4FZeLYUUQ1j/vuGduu
         Ph/W+y0ccRVgrcMHwuA5/LBNaHmO28jMo+7mmhr5z9uEZDxl4thVxatXwnMCkq3lsU3K
         pudGPW+6YcZM27ZCh16V/qrKQX4mq3Hu9I25bSvgqg1vlXOgv3nFKOR6zoVUWtrJ6GQv
         eNvDnWDCw8OFsJLxYH0pVChwxr+bbB9P0HR5YIcVpgCe6pFBKrTyz1LmbtP3FCy6dLei
         amkYYrctNmmGhbP83Dx2y/tsqeOP0CXbpYKYW6SL5jg9plYQJqNMRms5/xCb3G2BVjPQ
         /vkA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776176768; x=1776781568; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7hxS+4h2mTHNnfCCFBW5o+c1P1K7al7DuWkrX1QY474=;
        b=L81DjK1T12jXPsxcIbR/wEh/tl7QmYTiz14CKNelRYxERXbZcmxd4urPw01VvsfxFJ
         NZJt/p6jJddMPDTETQJRv8gWYedcRa6GhsPYX1+1VTjwtsANAxjGdui9fAx3hzkMa6Fi
         DGnwvJalxnLdbfoVMNh2mwJCMNynPrjNE9YVCSwdxAVoLqPmozd6x3PoWQP6Ch8VjuHe
         qLjzO6PcwBKrdbhZLfcU5WMdmLX9YZ6fWqNmCjgCmq5hm4rK0vUzGH1f/KnBKUMGoatu
         OmXdqh+JpR5D0LbcRimwtC64Gw+wH4Uya73IaslXLWw8nfk4RzZOVT8Ib1cR5+MSmuG/
         SEjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776176768; x=1776781568;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7hxS+4h2mTHNnfCCFBW5o+c1P1K7al7DuWkrX1QY474=;
        b=HUjEmHBr6ZhJk41kkOckzXPdo0K4CmvUkPRUCmnbjLl60UqgbNf1GYxz5ohLK3OItL
         8BwLEPR0LnIRKVdJ1T+kGlgAtqhoFrRyJU+z9ctT7RDqSjrZSuewSK7yNjwewHW7m+Vc
         Yu9EdTnXArCFOaOc0sSrDq+ecph2meCQc7oo6+4uafNqN1Xoe0LrDEOvxEvRl1KwbPBI
         xtD0yF6wjoh0ETUWso6iD2fKeo6Xtj3e1Od0yjtT4CJKenp0xN5o/rYM0/HJk/4gtfTp
         tdJ1E1+PqpSEzC4/hgwLiD2K7CbY9jBYYillVeg1HsNX4ULvuuVl2CE4kv4V6ylPUQ80
         3TPA==
X-Forwarded-Encrypted: i=1; AFNElJ9HUNHiMMpTAno7TnDj7Rs7XLwkKee6BLZYKucSYT1I9CcM+YjefVmSVRi5kM2m3Ab73HcokCE7tFHmFZzhLannTw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyP+Eml2jU6l/ltHx5NpJvukYz6S+XCWFTDN7GGZKKZBr+5y8lM
	roy8iPP6FUdVEynYUdT7N6lVIKJxnRS2Yz1gJTBISRcV8HGLxyRYfE8Ut3dc3D1m+aDc4JPq+im
	b6U9OvYn8hZ47JOwCAgfrTeb49eeB3Xk=
X-Gm-Gg: AeBDievlPYQv6iV2Y0Xjh3Hh5k2vjYOt+jPhtZpbwL0BQBF+5I6yfqt+82IEME0iyJK
	CYY9JItr5rFyjtElVr7Veb3qIFSc9PYF/Fcmfzum9toOW/WDX+E2uUr0QfD4QPYkofmdWo5598o
	65lvaggofT1izFRSP5KeHaA51XCjbn8zGcWlj+hClWDSnNhj8wu+8AIy2cMxPPlHmxM7UyLZFH/
	qksnBVenQBF/fpLWSQRPmlpDriF2sLPSPyhgCz5XzNp+H5T4tCGux/WPtNaFJrzCoj0NO286tQP
	7kxkX6j+d+WOA2RQWFD9DmazO1Uw1c07rb3ERDYMrHZs53sTslV6KL06GqKyFoi8/2fgBKQJ
X-Received: by 2002:a17:903:1207:b0:2b0:5ec1:97c1 with SMTP id
 d9443c01a7336-2b2d5939275mr182858285ad.7.1776176767396; Tue, 14 Apr 2026
 07:26:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260413100700.30995-1-phucduc.bui@gmail.com> <20260413100700.30995-5-phucduc.bui@gmail.com>
 <87qzoipdo4.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87qzoipdo4.wl-kuninori.morimoto.gx@renesas.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 14 Apr 2026 21:25:54 +0700
X-Gm-Features: AQROBzD5HBObKJ_ac8QE6DfolgiMCYAEtU4p5CM8HBqKzDEM1G5e1fuL3SWF1sY
Message-ID: <CAABR9nERzKW=2vZTWNuTcjz4KuVyc+eaCKBNP6ZGb4UAYw3qUQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] ASoC: renesas: fsi: refactor clock initialization
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, geert+renesas@glider.be, 
	magnus.damm@gmail.com, perex@perex.cz, tiwai@suse.com, 
	linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31265-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,glider.be,perex.cz,suse.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 25A323FB4D9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Morimoto-san,

Thank you for the review.

> I have mentioned in previous mail to just move fsi_clk_init(), but why do
> you need to move it ? It works without any issue without moving function,
> I guess ?

I moved fsi_clk_init() below the two functions fsi_clk_set_rate_cpg
and fsi_clk_set_rate_external because, inside fsi_clk_init(),
I assign these functions to clock->set_rate. Moving the function was
necessary to avoid compilation errors.

+       if (is_cpg) {
+               xck = 0; ick = 1; div = 1;
+               clock->set_rate = fsi_clk_set_rate_cpg;
+       } else {
+               xck = 1; ick = 1; div = 0;
+               clock->set_rate = fsi_clk_set_rate_external;
+       }

Would you prefer that I use forward declarations instead of changing
the function order?

> Note is that the comment /* clock function */ is not only for fsi_clk_init()
> but for all fsi_clk_xxx() functions. Here is that position.

Understood, I will fix the comment placement accordingly.

> > -     if (fsi_is_clk_master(fsi)) {
> > -             if (fsi->clk_cpg)
> > -                     fsi_clk_init(dai->dev, fsi, 0, 1, 1,
> > -                                  fsi_clk_set_rate_cpg);
> > -             else
> > -                     fsi_clk_init(dai->dev, fsi, 1, 1, 0,
> > -                                  fsi_clk_set_rate_external);
> > -     }
>
> You removes fsi_is_clk_master() check in new fsi_clk_init() ?

At the probe stage, the Master/Slave status has not yet been determined
because it depends on a subsequent set_fmt() call. Therefore, I am not using
the fsi_is_clk_master() function inside the new fsi_clk_init() during
the probe process.

Instead, the new fsi_clk_init() function acquires all resources
(including the mandatory SPU clock) upfront using
devm_clk_get_optional().
The actual fsi_is_clk_master() check remains strictly enforced in
fsi_hw_startup() before enabling any functional clocks.

/* start master clock */
if (fsi_is_clk_master(fsi))
return fsi_clk_enable(dev, fsi);

> Why don't use fsi->clk_cpg ?

You're right, using fsi->clk_cpg is cleaner since it's already
initialized in fsi_port_info_init().
 I will use it in the next version.

> And why you need to call fsi_clk_init() twice ?
The FSI controller has two independent ports (Port A and Port B).
Each port requires its own clock resource initialization and configuration.

Best regards,
Phuc

