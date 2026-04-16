Return-Path: <linux-renesas-soc+bounces-31319-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4JcTLtWf4GlukQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31319-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Apr 2026 10:37:41 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B55540BA91
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Apr 2026 10:37:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F1E2E30B108D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Apr 2026 08:33:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 582FE30B50F;
	Thu, 16 Apr 2026 08:33:26 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15DB33D503
	for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Apr 2026 08:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776328406; cv=none; b=lJIYzsuyMpMNrptSs+PjtyWrsbfVj2JXcEgbsit32ggE2T4jvzTdpFe9chFtPrPCpuQKGmSUJMq8DYxsJ5vj1k+AftBQpRESbrJA9aN6GEUspOaPlmiyaB0she9iw5om20iw2SR72P4GnfYLCLm317o8jfRkfxLGH8wf5+YhOKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776328406; c=relaxed/simple;
	bh=7Y+bV3Ay5xJsBxW6NzLyUwHFMELxOW2N83UtMHrE0Ok=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=ntK+IGMDs3zcP0bHds6e8nzrVSiWBKxhWvNPDbDL2uxPPDHUkmf8BvEqKvsvqlgtJC8K7nmKs84Z4LWGTE8VyvwoYizhpHu8oDhqrLGsV4ITriSvjs/wOgshQsW6dhP/Mj/O3S/pqooORru4pVtxtivbzEHW2w/zOv29LS0PU0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-9568159ee07so2708384241.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Apr 2026 01:33:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776328404; x=1776933204;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=phKt0vof3aheh6RpUiSyMGOFq4aXKLa/04m4y9CWkfQ=;
        b=pzG5OBMLDIfE3tHR/K5v0+wk2y0uQ/xIQTVC5++ogvS2bvsmXRXy8ZfNJsvGsd5Ov/
         85c2z6xZKxuk6pvJ21hGMH/F4JsxSES9E4b8e0eXwlZuw89CsJUg4xoJoan8x7XvnL8j
         3rUFxlCq/XGmLOZfIw9dF9g+gAupWdZ9wAcWrcDqOfeI1vK7VCd+qAgGNI9kWOxFtauk
         OPJfSwuTXfTuiigu08YtjTbwVyifG6tBmtre4a1X0xJjkKOBsrjjFaKWC0yG0DlPXRH9
         RqNRlcwlDsRNKOGZ/hUdXQdXe34gdKyqrzfkAVXn671aZodTrfldWa8NiT2BqiewQTn0
         X78Q==
X-Gm-Message-State: AOJu0YxJxH89SAttNu1TzPKiKxsMSVDdAt+oF/riRQ/IQNB1L6HdMioT
	QlGXTgQknqQ3Xmie0jPm2MHbsC3N0yFBM4LIlCJaLV9OGuYJ1E+6mzB2+hNah2jD
X-Gm-Gg: AeBDietDu+yA0IaqH5gv6+k6ohUNkfY34uB0i5zTLlBBlleMNV5Sme75GYRxh9LZBh9
	QJNdiP8gJG84EEvmV/vmaUxgLxcREK/d/ViEo1170KDM9iC8F61M82dtWUJRrpIVodQzs/26XrB
	DZSfdzKK4LKUYVB0EmXIeDO5rG0tp/sfXJ7NZ0rHTMRQhvbY3VhFnyjcVsjRfu2+7G0SlOXhLN/
	Ubu17IJM1IIXFRCRCKpWBCY84imBHlIhENNhe9d6BR/Rje6ag5pePgkGbguakmeoDL8nACPRxHf
	+UIDfdNkzwPacpn571Ic8VRaoaE01bKcm5YmnwqHGtawWjsZWKgNxDvbVP6/ba6mdc3haMrxmTL
	BwcM2KGrDhn4t3qjNICxxF7stBzk1mERWtkVRyUjMByERu5WbLYFQjrORVR+TI+vvv5L+hLjQff
	hmbRuFStCPpPoAQxvfAOjMRCyv3y7tLn610yAtbEqYxTYJwlPKfdvXUnegQKmn9+1TqOjTQc2fU
	fY=
X-Received: by 2002:a05:6102:4b81:b0:605:5d09:8631 with SMTP id ada2fe7eead31-60a010583b2mr12467961137.29.1776328403821;
        Thu, 16 Apr 2026 01:33:23 -0700 (PDT)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com. [209.85.221.178])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-612cd130cccsm2099469137.5.2026.04.16.01.33.23
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 01:33:23 -0700 (PDT)
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-56d93355337so5213654e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Apr 2026 01:33:23 -0700 (PDT)
X-Received: by 2002:a05:6122:6581:b0:56c:3a57:aee2 with SMTP id
 71dfb90a1353d-56f3bbf5549mr12581192e0c.6.1776328403393; Thu, 16 Apr 2026
 01:33:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMuHMdWXPesKV7XE_QwLrM6pZ1z6GFC-SjJ1ceFTs4o=hv71Zg@mail.gmail.com>
 <CAMuHMdX8HtWOAK6MDdN8F8V0aer0hTHzeAcnCGMycpS70hesNQ@mail.gmail.com>
 <CAMuHMdUjse9v=U8=oZHDJx0Oh9uVzxVWYU+C9jaP_23UOBVMaw@mail.gmail.com>
 <CAMuHMdVGnDg=zkjOSmCWAjEnjfSN9rhOCG-ubzeTf3mvjTEavw@mail.gmail.com>
 <CAMuHMdXkdD0dN93zsQnjCzFo6ijS2xDzbh+GPGe6--_FuuRbHQ@mail.gmail.com>
 <CAMuHMdV0KWN2nHDGT28ysTPwBTrachBSsGWf0hHqrci-d0U33A@mail.gmail.com>
 <CAMuHMdUWt+h7=rF+Z5sjQ_=xvoK8FeDGk9OnL=2KJ+gFdTnp3A@mail.gmail.com>
 <CAMuHMdXi1Ev3uKBVnrE5HO8=m+kkaXLc+5b92txFpB8rLUGrcw@mail.gmail.com>
 <CAMuHMdVd=6eTSddjyr1TLeu6akVp6QMmz89JCb5e_oT2XjY2mw@mail.gmail.com>
 <CAMuHMdU+Q=k3XnYUOytN4tOh_u=JyRr97XwX=vmV0V5ht8U6uA@mail.gmail.com>
 <CAMuHMdXbJvFC9n=LTW=fXhGBRgrDzQG2LUDTbZZruyovU5OsQw@mail.gmail.com>
 <CAMuHMdXPg6dBhvdgKwKVVDHP+7qJDKTfRzKGhXkUTb=gX833Ag@mail.gmail.com>
 <CAMuHMdVJ2joZgT6Yp4VhXs3yr4ntgHSyCt0JiyWHXueN-3pNFA@mail.gmail.com>
 <CAMuHMdUS=MTCYxgCzWT1K6NX-BzxxKpBm_Q85GbCGTN3ppUhYQ@mail.gmail.com>
 <CAMuHMdW2d+kh=J2GUeL2f16DUM5ExBD4eva34tHSq-JH38RM+A@mail.gmail.com>
 <CAMuHMdWBc002vKmUsTpDpxZPU+Z8J2=NM1hYXWj-z26oV3gxwg@mail.gmail.com>
 <CAMuHMdVCcjNwnS+1cJ-EAhr9vdwZx2F97ta-nwrMEgqptboAvg@mail.gmail.com>
 <CAMuHMdUQv9i1ZUhzZV+YhhmjbO-f-0n9ocfBYAiVYP6We5Evpw@mail.gmail.com>
 <CAMuHMdUrk5GzMWqbYa7PnrQf157TCnS1xjyiV267EakcL+bCLQ@mail.gmail.com> <CAMuHMdWM_Q-Tk++nt2ZhwpzZmo=M3fv0fzPr59jAv6q=ec=vtQ@mail.gmail.com>
In-Reply-To: <CAMuHMdWM_Q-Tk++nt2ZhwpzZmo=M3fv0fzPr59jAv6q=ec=vtQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 16 Apr 2026 10:33:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX-QTWTukQbLn+pYgmzZBu0b4OtM_oTGhS5_SMMtazhEw@mail.gmail.com>
X-Gm-Features: AQROBzA2ErNi1a4Hov3EEkvTusdAyZlHcErQ-FNgpDvwnXtXzhtbpR8NDbD7qo4
Message-ID: <CAMuHMdX-QTWTukQbLn+pYgmzZBu0b4OtM_oTGhS5_SMMtazhEw@mail.gmail.com>
Subject: Re: Future renesas-drivers releases
To: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	TAGGED_FROM(0.00)[bounces-31319-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN_FAIL(0.00)[1.2.3.5.c.f.2.1.0.0.0.0.0.0.0.0.c.6.3.0.1.0.0.e.4.0.c.3.0.0.6.2.asn6.rspamd.com:server fail];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.988];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 7B55540BA91
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 24 Feb 2026 at 16:13, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>   - renesas-drivers-2026-04-14-v7.0 (TBD),
>   - renesas-drivers-2026-04-21-v7.0 (TBD).

That became renesas-drivers-2026-04-14-v7.0.

Next planned releases, if all goes well:
  - renesas-drivers-2026-04-28-v7.1-rc1,
  - renesas-drivers-2026-05-12-v7.1-rc3,
  - renesas-drivers-2026-05-26-v7.1-rc5,
  - renesas-drivers-2026-06-09-v7.1-rc7,
  - renesas-drivers-2026-06-16-v7.1 (TBD),
  - renesas-drivers-2026-06-23-v7.1 (TBD).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

