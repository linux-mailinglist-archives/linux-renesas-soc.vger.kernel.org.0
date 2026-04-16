Return-Path: <linux-renesas-soc+bounces-31329-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cJLCOgbk4GlhnAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31329-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Apr 2026 15:28:38 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EE34A40ED1A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Apr 2026 15:28:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9117D3049E10
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Apr 2026 13:23:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E528A3988FF;
	Thu, 16 Apr 2026 13:22:58 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE68C3803C4
	for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Apr 2026 13:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776345778; cv=none; b=WwupNE48IsCI5dXDgO/txtAfoa4pSyX5tAe73UNkzipnCvGD4zqt3lJ4I8QuSPadLWkcl6EJgh48jMVnPGSNdqvA/l/FH8m7jmeL6NRzXPWEHQEyGz1y1fBVmfVpvZVy3i18lGPfH79KgRG+nBBev8bY4nXXAdD2PQsTI03S4hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776345778; c=relaxed/simple;
	bh=fcK/JlwTQzP2nXMTEdIbvw4FJqO6Fa0nLJGM1V9FGL4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=INbf2g+xccjrWS6cPYs/W0RQJM2RlHXdthDpWawrvd9vwIuxRoVCuMQv6GbD6rKR0OVi3ljwwwyPQuTRK66Y1lho+E7fjQtEZLESmkMBbOPSDkuhvTHbksI71t4+4zUPl0TVltao5har86fJrEA5D+PwGpUVPLBzwWl19J0UfMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-94dd01deb53so1864741241.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Apr 2026 06:22:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776345777; x=1776950577;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h+GvtJ8MMlWZ4CwSOf9ZlRFu2OiOrFGGlzghpD8HCC8=;
        b=D70d1UbBbSPRTjjrKbrauiXGJZfYcWIEVIhN5klSYYCqfjiPGl8fHjHxj/rm2gmEkC
         4KLcZ6nxowlbuffxqkZdnn31BEyDMX40YAi+97X+H5qmgvKxJhtMNVjX9WZRE2ftNPA1
         U10/2qwxqVldQfzwSLa2lt7a3Wda6zTWurl8KPZuBnKDB5HGegiQgZ+aoa99fwSi3Lpl
         AEeMlhPQR2UPJ+VJWr9C/IGtDZT8LusIocFjbzn6mRopTydMUOc04DYZawy8ZJLuXvX6
         cSdxsQpEULoSxvLkUyUBYkRUhch3A9PcD2zqYNQjYCWECftJ6XAXjtgqTyntW4n4HmKO
         /qhg==
X-Gm-Message-State: AOJu0Yyde2mWAcedFfL+6zITDLVTy2Zdxo3N9ePaxYBBVB2u5wgROIzL
	VyrFO2LOPkHetvWnDsEsqL2xAXlWsDPTB5EsiNXWVuCPU0zjx8cFudUlvjFUJcmE
X-Gm-Gg: AeBDies8IBeC/toVG4BUUFGdFNmndsYtCz1zekoKgjjZh6L8xE9qyIH0XiUykoseLuv
	oxaWknT8F4nI7SgDsjaELdj0TeQkUKDiIOzmxKcFdBGPXWyn89+ezDzgYRa0Eu8Ofs3OvgilltD
	1yGGEJ+K4Auk1ZhZcPIXIqq635t+VVmVxhUZs/Qzo13chU+oBePy7smtPsDhacq+bTxGNvB5EC4
	R9Pz1dWnxBzU7gdGcvbipliXzpBNx7cEj6aCdbCE9u8V+RucN8XC9Q+4cupHfe4gVzP9BNHvK4D
	Cwdln9Hg2nb5vaiDmgYtJpIFWWXBIFU+ATwtfD1nuceiYWoxgQhoFIaGDR5U9p+8utrcnvNw6bI
	BkTi7EnJCgFP9k0+x6uE3GMPfRrIe0YT57Oqfsq05UFtKrRsCm1EfjiIon95qLvSHEuiwfV/n5r
	dyqXntF8rQgS6XTSqy/WjxVNV0gFhuyp3Q8qVKO7ZfZRNUK90FLNMylcTKZrGGSgvN3Mq4O6neE
	EE=
X-Received: by 2002:a05:6102:4b19:b0:602:8ccb:c993 with SMTP id ada2fe7eead31-60a01162bd7mr11767033137.24.1776345776712;
        Thu, 16 Apr 2026 06:22:56 -0700 (PDT)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com. [209.85.221.176])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-612cf10bf60sm2365149137.7.2026.04.16.06.22.55
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 06:22:56 -0700 (PDT)
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5637886c92aso3364189e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Apr 2026 06:22:55 -0700 (PDT)
X-Received: by 2002:a05:6122:3d06:b0:56f:189b:7b99 with SMTP id
 71dfb90a1353d-56f3bb297bbmr13103840e0c.1.1776345775480; Thu, 16 Apr 2026
 06:22:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260416114737.36988-1-wsa+renesas@sang-engineering.com> <20260416114737.36988-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260416114737.36988-2-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 16 Apr 2026 15:22:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU35dV5G8Pm1OgDJ4KG8kMcDPJqeYGde_Ph5=mMWiiyJQ@mail.gmail.com>
X-Gm-Features: AQROBzBI9mYGFCG1NAql3w4YKWRTnpEtbx0X-zQUrfyM9Z6yUfGTmLsmEUATc4A
Message-ID: <CAMuHMdU35dV5G8Pm1OgDJ4KG8kMcDPJqeYGde_Ph5=mMWiiyJQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] mailbox: mailbox-test: handle channel errors consistently
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Lee Jones <lee@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>, Minjie Du <duminjie@vivo.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,vivo.com];
	TAGGED_FROM(0.00)[bounces-31329-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.981];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sang-engineering.com:email,mail.gmail.com:mid,glider.be:email,linux-m68k.org:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EE34A40ED1A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 16 Apr 2026 at 14:45, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> mbox_test_request_channel() returns either an ERR_PTR or NULL. The
> callers, however, mostly checked for non-NULL which allows for bogus
> code paths when an ERR_PTR is treated like a valid channel. A later
> commit tried to fix it in one place but missed the other ones. Because
> the ERR_PTR is only used for -ENOMEM once and is converted to
> -EPROBE_DEFER anyhow, convert the callee to only return NULL which
> simplifies handling a lot and makes it less error prone.
>
> Fixes: 8ea4484d0c2b ("mailbox: Add generic mechanism for testing Mailbox Controllers")
> Fixes: 9b63a810c6f9 ("mailbox: mailbox-test: Fix an error check in mbox_test_probe()")
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

